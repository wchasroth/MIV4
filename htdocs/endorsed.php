<?php
declare(strict_types=1);

use CharlesRothDotNet\Alfred\DumbFileLogger;
use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\PdoHelper;
use CharlesRothDotNet\Alfred\AlfredPDO;
use CharlesRothDotNet\Alfred\Str;
use CharlesRothDotNet\EditorV4\EnvHelper;
use CharlesRothDotNet\MIV4\VoterLog;
use Smarty\Smarty;
use CharlesRothDotNet\Alfred\SmartyPage;
use CharlesRothDotNet\MIV4\Plugins;

require_once("../vendor/autoload.php");

$address = trim($_COOKIE['miAddress'] ?? "");
if ($address === "") {
   header("Location: index.php");
   exit();
}

$env    = new EnvFile("_env");
$logger = new DumbFileLogger($env->get('logFile'));
$pdo    = PdoHelper::makePdo($env);

$miCodes   = trim($_COOKIE['miCodes'] ?? "");
$sessionId = trim($_COOKIE['sessionid'] ?? "");
$codes     = json_decode($miCodes, true);
$show      = print_r($codes, true);
$ward      = getWard($codes['wardpct']);
date_default_timezone_set('America/New_York');
VoterLog::write($pdo, $sessionId, 'B', $codes);

$sql = [];
$sql[] = select('district') . from() . whereOrgIn('us', 'us-sen') . " OR (s.org='us-hou' AND s.district='{$codes['congress']}') " . endorsed();
$sql[] = select('district') . from() . whereOrgIn('mi', 'mi-ag', 'mi-boe', 'mi-sos')
       . "  OR (s.org='mi-sen' AND s.district='{$codes['senate']}') "
       . "  OR (s.org='mi-hou' AND s.district='{$codes['house']}') "  . endorsed();
$sql[] = select('subdist')  . from() . whereOrgIn('cnty')     . "AND district={$codes['county_code']} "  . endorsed();
$sql[] = select('subdist')  . from() . whereOrgIn('cnty-com') . "AND district={$codes['county_code']} AND subdist={$codes['commissioner']} "  . endorsed();

$sql[] = select('subdist')  . from() . whereOrgIn('city',    'town')     . " AND district='{$codes['juris_code']}' "  . endorsed();
$sql[] = select('subdist')  . from() . whereOrgIn('city-cou','town-cou') . " AND district='{$codes['juris_code']}' AND subdist=$ward "  . endorsed();
$sql[] = select('subdist')  . from() . whereOrgIn('vil','vil-cou')       . " AND district='{$codes['village_code']}' "  . endorsed();

$sql[] = select('subdist')  . from() . whereOrgIn('schl-cou') . " AND district='{$codes['sd_code']}' "  . endorsed();

$sql[] = select('subdist')  . from() . whereOrgIn('crt-sup')  . endorsed();
$sql[] = select('district') . from()
       .  " LEFT JOIN v4courts AS c  ON (c.shortname = s.district AND c.type = s.org) "
       .  whereOrgIn('crt-a', 'crt-c', 'crt-m') . " AND c.county_id = {$codes['county_code']} "  . endorsed();
$sql[] = select('subdist') . from()
       .  " LEFT JOIN v4courts AS c  ON (c.shortname = s.district AND c.type = s.org) "
       .  whereOrgIn('crt-p') . " AND c.county_id = {$codes['county_code']} "  . endorsed();
$sql[] = select('s.district')  . from()
       .  " LEFT JOIN s4district_courts AS d  ON (d.org = s.org AND d.district = s.district) "
       .  whereOrgIn('crt-d') . " AND d.county_id = {$codes['county_code']} AND d.juris_id = {$codes['juris_code']} "  . endorsed();
$sql[] = select('district') . from() . whereOrgIn('mi-msu', 'mi-wsu', 'mi-um')  . endorsed();

$query = Str::join($sql, " UNION ALL ") . " ORDER BY ballot_order, name";

$result = $pdo->run($query);
$rows = $result->getRows();
removeDuplicateTitles($rows);
$rowCount = $result->getRowCount();
for ($i=0;   $i<$rowCount;  $i++) {
   $name = $rows[$i]['name'] ?? '';
   if ($name === strtoupper($name))   $rows[$i]['name'] = ucwords(strtolower($name));

   $dist = $rows[$i]['dist'];
   $dist = (intval($dist) === 0 ? '' : "($dist)");
   if ($rows[$i]['miv_title'] !== "") $rows[$i]['miv_title'] .= " $dist";
}

$smarty = new SmartyPage();

$smarty->assign('address', $address);
$smarty->assign('rows', $rows);
$smarty->assign('show', $show);
$smarty->display('endorsed.tpl');


function select(string $dist): string {
   return  "SELECT s.id, s.org, s.office, s.district, s.subdist, $dist AS dist, "
      . "       i.name, t.ballot_order, t.miv_title, i.id AS iid ";
}

function from (): string {
   return  "  FROM      v4seats      AS s "
         . "  LEFT JOIN v4candidates AS i ON (i.seat_id = s.id) "
         . "  LEFT JOIN s4titles     AS t ON (t.org = s.org AND t.office = s.office) ";
}

function whereOrgIn (... $orgs): string {
   return " WHERE ("
      . ( count($orgs) === 1
         ? " s.org='$orgs[0]'"
         : " s.org IN ('" . Str::join($orgs, "','") . "') ");
}

function endorsed(): string {
   return ") AND i.name!='' AND i.endorsed = 1";
}

function removeDuplicateTitles (array &$rows): void {
   $previousTitle = "";
   foreach ($rows as &$row) {
      $title = $row['miv_title'];
      if ($title === $previousTitle) $row['miv_title'] = "";
      $previousTitle = $title;
   }
}

function getWard(string $wardpct): int {
   $ward = intval($wardpct);
   if ($ward < 1000)  return 0;
   return intdiv($ward, 1000);
}