<?php
declare(strict_types=1);

use CharlesRothDotNet\Alfred\DumbFileLogger;
use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\PdoHelper;
use CharlesRothDotNet\Alfred\AlfredPDO;
use CharlesRothDotNet\Alfred\Str;
use CharlesRothDotNet\Alfred\SmartyPage;
use CharlesRothDotNet\MIV4\VoterLog;

require_once("../vendor/autoload.php");

$address = trim($_COOKIE['miAddress'] ?? "");
if ($address === "") {
   header("Location: index.php");
   exit();
}

$env              = new EnvFile("_env");
$logger           = new DumbFileLogger($env->get('logFile'));
$pdo              = PdoHelper::makePdo($env);
$logger = new DumbFileLogger($env->get('logFile'));

$miCodes = trim($_COOKIE['miCodes'] ?? "");
$sessionId = trim($_COOKIE['sessionid'] ?? "");
$codes = json_decode($miCodes, true);
$show = print_r($codes, true);
$ward = getWard($codes['wardpct']);

date_default_timezone_set('America/New_York');
$voterLog = new VoterLog($pdo, $logger, $env->get('addressHashSalt'));
$voterLog->write($sessionId, 'O', $codes, $address);

$sql = [];
$sql[] = select('0natl',  'district') . from() . whereOrgIn('us', 'us-sen') . " OR (s.org='us-hou' AND s.district='{$codes['congress']}') ";
$sql[] = select('1state', 'district') . from() . whereOrgIn('mi', 'mi-ag', 'mi-boe', 'mi-sos')
       . "  OR (s.org='mi-sen' AND s.district='{$codes['senate']}') "
       . "  OR (s.org='mi-hou' AND s.district='{$codes['house']}') ";
$sql[] = select('2cnty',  'subdist')  . from() . whereOrgIn('cnty')     . "AND district={$codes['county_code']} ";
$sql[] = select('2cnty',  'subdist')  . from() . whereOrgIn('cnty-com') . "AND district={$codes['county_code']} AND subdist={$codes['commissioner']} ";

$sql[] = select('4juris', 'subdist')  . from() . whereOrgIn('city',    'town')     . " AND district='{$codes['juris_code']}' ";
$sql[] = select('4juris', 'subdist')  . from() . whereOrgIn('city-cou','town-cou') . " AND district='{$codes['juris_code']}' AND subdist=$ward ";
$sql[] = select('5vill',  'subdist')  . from() . whereOrgIn('vil','vil-cou') . " AND district='{$codes['village_code']}' ";

$sql[] = select('6schl',  'subdist')  . from() . whereOrgIn('schl-cou') . " AND district='{$codes['sd_code']}' ";

$sql[] = select('7court', 'subdist')  . from() . whereOrgIn('crt-sup');
$sql[] = select('7court', 'district') . from()
       .  " LEFT JOIN v4courts AS c  ON (c.shortname = s.district AND c.type = s.org) "
       .  whereOrgIn('crt-a', 'crt-c', 'crt-m') . " AND c.county_id = {$codes['county_code']} ";
$sql[] = select('7court', 'subdist') . from()
       .  " LEFT JOIN v4courts AS c  ON (c.shortname = s.district AND c.type = s.org) "
       .  whereOrgIn('crt-p') . " AND c.county_id = {$codes['county_code']} ";
$sql[] = select('7court', 's.district')  . from()
       .  " LEFT JOIN s4district_courts AS d  ON (d.org = s.org AND d.district = s.district) "
       .  whereOrgIn('crt-d') . " AND d.county_id = {$codes['county_code']} AND d.juris_id = {$codes['juris_code']} ";
$sql[] = select('8univ', 'district') . from() . whereOrgIn('mi-msu', 'mi-wsu', 'mi-um');

$query = Str::join($sql, " UNION ALL ") . " ORDER BY block, ballot_order, name";

$blocks = ['0natl' => [], '0natl' => [], '1state' => [], '2cnty' => [], '4juris' => [], '5vill' => [],
   '6schl' => [], '7court' => [], '8univ' => []];

$result = $pdo->run($query);
$rows = $result->getRows();
removeDuplicateTitles($rows);
$rowCount = $result->getRowCount();
for ($i=0;   $i<$rowCount;  $i++) {
   $name = $rows[$i]['name'];
   if ($name === strtoupper($name))   $rows[$i]['name'] = ucwords(strtolower($name));

   $dist = $rows[$i]['dist'];
   $dist = (intval($dist) === 0 ? '' : "($dist)");
// $rows[$i]['dist'] = (intval($dist) === 0 ? '' : "($dist)");
   if ($rows[$i]['miv_title'] !== "") $rows[$i]['miv_title'] .= " $dist";
   $blocks[$rows[$i]['block']][] = $rows[$i];
}

$titles = [
   '2cnty'  => getName($pdo, "SELECT name FROM s4counties      WHERE id={$codes['county_code']}") . " County",
   '4juris' => getName($pdo, "SELECT name FROM s4jurisdictions WHERE id={$codes['juris_code']}"),
   '5vill'  => "Village of "
             . getName($pdo, "SELECT name FROM s4villages      WHERE id={$codes['village_code']}"),
   '6schl'  => getName($pdo, "SELECT name FROM s4schools       WHERE id={$codes['sd_code']} LIMIT 1"),
];

// Because we can have multiple colleges in the county, we need a separate query & loop for them.
$colleges = [];
$collegeQuery = "SELECT c.name, c.id "
   . "  FROM      s4commcolleges        AS c "
   . "  LEFT JOIN v4commcolleges_county AS y ON (c.id = y.id) "
   . " WHERE y.county_id = {$codes['county_code']} ORDER BY c.name ";
$result = $pdo->run($collegeQuery);
foreach ($result->getRows() as $college) {
   $collegeId = $college['id'];
   $sql = select('9coll-$collegeId', 'subdist') . from() .  whereOrgIn('comcol-cou') . " AND s.district = $collegeId ";
   $result = $pdo->run($sql);
   $trustees = $result->getRows();
   removeDuplicateTitles($trustees);
   for ($i=0;   $i<$result->getRowCount();   $i++)  $trustees[$i]['dist'] = '';
   $colleges[] = ['id' => $collegeId, 'name' => $college['name'], 'rows' => $trustees];
}

$smarty = new SmartyPage();
$smarty->assign('address', $address);
$smarty->assign('miCodes', $miCodes);
$smarty->assign('show', $show);
$smarty->assign('query', $query);
$smarty->assign('blocks', $blocks);
$smarty->assign('titles', $titles);
$smarty->assign('hasVillage', intval($codes['village_code']) > 0);
$smarty->assign('colleges', $colleges);
$smarty->display('officials.tpl');

function getName (AlfredPDO $pdo, string $sql): string {
   $result = $pdo->run($sql);
   $name = $result->getSingleValue('name');
   if ($name === strtoupper($name))  $name = ucwords(strtolower($name));
   return $name;
}

function select(string $block, string $dist): string {
   return  "SELECT s.id, s.org, s.office, s.district, s.subdist, $dist AS dist, "
      . "       i.name, t.ballot_order, t.miv_title, '$block' AS block ";
}

function from (): string {
   return  "  FROM      v4seats      AS s "
         . "  LEFT JOIN v4incumbents AS i ON (i.seat_id = s.id) "
         . "  LEFT JOIN s4titles     AS t ON (t.org = s.org AND t.office = s.office) ";
}

function whereOrgIn (... $orgs): string {
   return " WHERE "
          . ( count($orgs) === 1
             ? " s.org='$orgs[0]'"
             : " s.org IN ('" . Str::join($orgs, "','") . "') ");
}

// NOT sure if this is right for small numbers, i.e. check jurisdictions where wardpct='11' !!
function getWard(string $wardpct): int {
   $ward = intval($wardpct);
   if ($ward < 1000)  return 0;
   return intdiv($ward, 1000);
}

function removeDuplicateTitles (array &$rows): void {
   $previousTitle = "";
   foreach ($rows as &$row) {
      $title = $row['miv_title'];
      if ($title === $previousTitle) $row['miv_title'] = "";
      $previousTitle = $title;
   }
}