<?php
declare(strict_types=1);

use Smarty\Smarty;
use CharlesRothDotNet\Alfred\SmartyPage;
use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\DumbFileLogger;
use CharlesRothDotNet\Alfred\PdoHelper;

use CharlesRothDotNet\MIV4\VoterLog;

require_once("../vendor/autoload.php");

date_default_timezone_set('America/New_York');

$address = $_COOKIE['miAddress'] ?? "";

$env    = new EnvFile("_env");
$logger = new DumbFileLogger($env->get('logFile'));
$pdo    = PdoHelper::makePdo($env);

$miCodes   = trim($_COOKIE['miCodes'] ?? "");
$sessionId = trim($_COOKIE['sessionid'] ?? "");
$codes     = json_decode($miCodes, true) ?? [];

$voterLog = new VoterLog($pdo, $logger, $env->get('addressHashSalt'));
$voterLog->write($sessionId, 'H', $codes, $address);

$smarty = new SmartyPage();
$smarty->assign ('address',    $address);

if ($address === "")  $smarty->display('indexNoAddress.tpl');
else                  $smarty->display('indexWithAddress.tpl');
