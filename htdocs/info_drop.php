<?php
declare(strict_types=1);

use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\PdoHelper;
use CharlesRothDotNet\Alfred\DumbFileLogger;
use CharlesRothDotNet\Alfred\SmartyPage;
use CharlesRothDotNet\Alfred\Str;
use CharlesRothDotNet\MIV4\Uitext;
use CharlesRothDotNet\MIV4\Clerk;
use CharlesRothDotNet\MIV4\VoterLog;
use CharlesRothDotNet\MIV4\MiCodesDecoder;

require_once("../vendor/autoload.php");

$address = trim($_COOKIE['miAddress'] ?? "");

$env     = new EnvFile("_env");
$pdo     = PdoHelper::makePdo($env);
$codes   = MiCodesDecoder::decode($_COOKIE['miCodes'] ?? "{}");
$sessionId = trim($_COOKIE['sessionid'] ?? "");
$logger = new DumbFileLogger($env->get('logFile'));
$ui      = new Uitext($pdo, $logger, $lang, 'pg-info%', 'inc-vq-%', 'btm%', 'ham%', 'top%');

$county  = intval($codes['county_code'] ?? '');
$juris   = intval($codes['juris_code']  ?? '');
$wardpct = intval($codes['wardpct']     ?? '');
$ward    = intdiv($wardpct, 1000);
$pct     = $wardpct % 1000;

date_default_timezone_set('America/New_York');
$voterLog = new VoterLog($pdo, $logger, $env->get('addressHashSalt'));
$voterLog->write($sessionId, 'D', $codes, $_COOKIE['miAddress'] ?? '');

$sql = "SELECT d.address, d.hours, d.directions, '' AS map "
     . "  FROM      s4precincts AS p "
     . "  LEFT JOIN s4van2drop  AS v  ON (p.precinct_id = v.van_precinct_id) "
     . "  LEFT JOIN s4dropboxes AS d  ON (d.id = v.drop_id) "
     . " WHERE p.county_id = $county "
     . "   AND p.juris_id  = $juris "
     . "   AND p.ward      = $ward "
     . "   AND p.pct       = $pct ";
$result = $pdo->run($sql);
$boxes = $result->getRows();

$rows = [];
for ($i=0;   $i<count($boxes);   $i++) {
   if (trim ($boxes[$i]['address'] ?? '') === '')  continue;

   $hours = strtolower($boxes[$i]['hours'] ?? '');
   if (Str::contains($hours, "24 hrs", "24 hours", "24/7"))  $boxes[$i]['hours'] = "24";
   $boxes[$i]['map'] = urlencode($boxes[$i]['address'] ?? '');
   $rows[] = $boxes[$i];
}

$smarty = new SmartyPage();
$smarty->assign('rows', $rows);
$smarty->assign('address', $address);
$smarty->assign('county', $county);
$smarty->assign('juris', $juris);
$smarty->assign('ward', $ward);
$smarty->assign('pct', $pct);
$smarty->assign('ui',   $ui);
$smarty->assign('hasAddress', ! empty($address));
$smarty->display('info_drop.tpl');
