<?php
declare(strict_types=1);

use CharlesRothDotNet\Alfred\DumbFileLogger;
use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\PdoHelper;
use CharlesRothDotNet\Alfred\SmartyPage;
use CharlesRothDotNet\MIV4\VoterLog;

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

date_default_timezone_set('America/New_York');
$voterLog = new VoterLog($pdo, $logger, $env->get('addressHashSalt'));
$voterLog->write($sessionId, 'I', $codes, $_COOKIE['miAddress'] ?? '');

$smarty = new SmartyPage();
$smarty->assign('address', $address);
$smarty->assign('hasAddress', true);
$smarty->display('info.tpl');
