<?php
declare(strict_types=1);

use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\PdoHelper;
use CharlesRothDotNet\Alfred\DumbFileLogger;
use CharlesRothDotNet\Alfred\SmartyPage;
use CharlesRothDotNet\MIV4\Clerk;
use CharlesRothDotNet\MIV4\VoterLog;

require_once("../vendor/autoload.php");

$address = trim($_COOKIE['miAddress'] ?? "");
if ($address === "") {
   header("Location: index.php");
   exit();
}

$env     = new EnvFile("_env");
$pdo     = PdoHelper::makePdo($env);
$miCodes = trim($_COOKIE['miCodes'] ?? "");
$codes   = json_decode($miCodes, true);
$sessionId = trim($_COOKIE['sessionid'] ?? "");
$logger = new DumbFileLogger($env->get('logFile'));

date_default_timezone_set('America/New_York');
$voterLog = new VoterLog($pdo, $logger, $env->get('addressHashSalt'));
$voterLog->write($sessionId, 'I', $codes, $_COOKIE['miAddress'] ?? '');

$clerkJurisdiction = Clerk::getJurisdictionName($pdo, intval($codes['juris_code']));

$smarty = new SmartyPage();
$smarty->assign('address', $address);
$smarty->assign('hasAddress', true);
$smarty->assign('clerkJurisdiction', $clerkJurisdiction);
$smarty->display('info_home.tpl');
