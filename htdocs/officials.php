<?php
declare(strict_types=1);

use CharlesRothDotNet\Alfred\DumbFileLogger;
use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\PdoHelper;
use CharlesRothDotNet\Alfred\Str;
use CharlesRothDotNet\EditorV4\EnvHelper;
use Smarty\Smarty;
use CharlesRothDotNet\Alfred\SmartyPage;

require_once("../vendor/autoload.php");

$address = trim($_COOKIE['miAddress'] ?? "");
if ($address === "") {
   header("Location: index.php");
   exit();
}

$env              = new EnvFile("_env");
$logger           = new DumbFileLogger($env->get('logFile'));
$pdo              = PdoHelper::makePdo($env);

$miCodes = trim($_COOKIE['miCodes'] ?? "");
$codes = json_decode($miCodes, true);
$show = print_r($codes, true);
$ward = getWard($codes['wardpct']);

$sql = [];
$sql[] = select('0natl',  'district') . whereOrgIn('us', 'us-sen') . " OR (s.org='us-hou' AND s.district='{$codes['congress']}') ";
$sql[] = select('1state', 'district') . whereOrgIn('mi', 'mi-ag', 'mi-boe', 'mi-sos')
       . "  OR (s.org='mi-sen' AND s.district='{$codes['senate']}') "
       . "  OR (s.org='mi-hou' AND s.district='{$codes['house']}') ";
$sql[] = select('2cnty',  'subdist')  . whereOrgIn('cnty')     . "AND district={$codes['county_code']} ";
$sql[] = select('3cnty',  'subdist')  . whereOrgIn('cnty-com') . "AND district={$codes['county_code']} AND subdist={$codes['commissioner']} ";

$sql[] = select('4juris', 'subdist')  . whereOrgIn('city',    'town')     . " AND district='{$codes['juris_code']}' ";
$sql[] = select('4juris', 'subdist')  . whereOrgIn('city-cou','town-cou') . " AND district='{$codes['juris_code']}' AND subdist=$ward ";

$query = Str::join($sql, " UNION ALL ") . " ORDER BY block, ballot_order";

$result = $pdo->run($query);
$rows = $result->getRows();
$rowCount = $result->getRowCount();
for ($i=0;   $i<$rowCount;  $i++) {
   $name = $rows[$i]['name'];
   if ($name === strtoupper($name))   $rows[$i]['name'] = ucwords(strtolower($name));

   $dist = $rows[$i]['dist'];
   $rows[$i]['dist'] = (intval($dist) === 0 ? '' : "($dist)");
}

$smarty = new SmartyPage();
$smarty->assign('address', $address);
$smarty->assign('miCodes', $miCodes);
$smarty->assign('show', $show);
$smarty->assign('query', $query);
$smarty->assign('rows', $rows);
$smarty->display('officials.tpl');

function select(string $block, string $dist): string {
   return  "SELECT s.id, s.org, s.office, s.district, s.subdist, s.termcycle, $dist AS dist, "
      . "       i.name, i.party, i.address, i.phone, i.email, i.web, "
      . "       t.ballot_order, t.miv_title, '$block' AS block ";
}

function whereOrgIn (... $orgs): string {
   return  "  FROM      v4seats      AS s "
         . "  LEFT JOIN v4incumbents AS i ON (i.seat_id = s.id) "
         . "  LEFT JOIN s4titles     AS t ON (t.org = s.org AND t.office = s.office) "
         . " WHERE "
         . ( count($orgs) === 1
               ? " s.org='$orgs[0]'"
               : " s.org IN ('" . Str::join($orgs, "','") . "') ")
   ;
}

// NOT sure if this is right for small numbers, i.e. check jurisdictions where wardpct='11' !!
function getWard(string $wardpct): int {
   $ward = intval($wardpct);
   if ($ward < 1000)  return 0;
   return intdiv($ward, 1000);
}

//[juris_code] => 3000
//[county_code] => 81
//[sd_code] => 2820
//[wardpct] => 3029
//[village_code] => 0
//[senate] => 15
//[commissioner] => 7
