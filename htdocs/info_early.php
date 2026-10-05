<?php
declare(strict_types=1);

use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\PdoHelper;
use CharlesRothDotNet\Alfred\DumbFileLogger;
use CharlesRothDotNet\Alfred\SmartyPage;
use CharlesRothDotNet\Alfred\Str;
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

$county  = intval($codes['county_code'] ?? '');
$juris   = intval($codes['juris_code']  ?? '');
$wardpct = intval($codes['wardpct']     ?? '');
$ward    = intdiv($wardpct, 1000);
$pct     = $wardpct % 1000;

date_default_timezone_set('America/New_York');
$voterLog = new VoterLog($pdo, $logger, $env->get('addressHashSalt'));
$voterLog->write($sessionId, 'D', $codes, $_COOKIE['miAddress'] ?? '');

$sql = "SELECT e.location, e.address, e.hours, '' AS map "
     . "  FROM      s4precincts   AS p "
     . "  LEFT JOIN s4van2early   AS v  ON (p.precinct_id = v.van_precinct_id) "
     . "  LEFT JOIN s4earlyvoting AS e  ON (e.id = v.early_id) "
     . " WHERE p.county_id = $county "
     . "   AND p.juris_id  = $juris "
     . "   AND p.ward      = $ward "
     . "   AND p.pct       = $pct ";
$logger->log("Early: $sql");
$result = $pdo->run($sql);
$logger->log("Early err: " . $result->getError());
$rows   = $result->getRows();

for ($i=0;   $i<count($rows);   $i++) {
   $rows[$i]['map'] = urlencode($rows[$i]['address'] ?? '');
   $rows[$i]['hours'] = Str::replaceAll($rows[$i]['hours'], ',', '<br/>');
}

$smarty = new SmartyPage();
$smarty->assign('rows', $rows);
$smarty->assign('address', $address);
$smarty->assign('county', $county);
$smarty->assign('juris', $juris);
$smarty->assign('ward', $ward);
$smarty->assign('pct', $pct);
$smarty->assign('hasAddress', ! empty($address));
$smarty->display('info_early.tpl');
