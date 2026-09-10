<?php
declare(strict_types=1);

use CharlesRothDotNet\Alfred\DumbFileLogger;
use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\PdoHelper;
use CharlesRothDotNet\Alfred\SmartyPage;
use CharlesRothDotNet\MIV4\Clerk;
use CharlesRothDotNet\MIV4\VoterLog;
use CharlesRothDotNet\MIV4\MiCodesDecoder;

require_once("../vendor/autoload.php");

$address = trim($_COOKIE['miAddress'] ?? "");

$env     = new EnvFile("_env");
$logger  = new DumbFileLogger($env->get('logFile'));
$pdo     = PdoHelper::makePdo($env);
$codes   = MiCodesDecoder::decode($_COOKIE['miCodes'] ?? "{}");
$sessionId = trim($_COOKIE['sessionid'] ?? "");

date_default_timezone_set('America/New_York');
$voterLog = new VoterLog($pdo, $logger, $env->get('addressHashSalt'));
$voterLog->write($sessionId, 'X', $codes, $_COOKIE['miAddress'] ?? '');

$smarty = new SmartyPage();
$smarty->assign('address', $address);
$smarty->assign('hasAddress', ! empty($address));
$smarty->display('primary.tpl');
