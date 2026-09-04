<?php
declare(strict_types=1);

use CharlesRothDotNet\Alfred\DumbFileLogger;
use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\PdoHelper;
use CharlesRothDotNet\Alfred\SmartyPage;
use CharlesRothDotNet\MIV4\VoterLog;
use CharlesRothDotNet\MIV4\Uitext;

require_once("../vendor/autoload.php");

$address = trim($_COOKIE['miAddress'] ?? "");
//if ($address === "") {
//   header("Location: index.php");
//   exit();
//}

$env    = new EnvFile("_env");
$logger = new DumbFileLogger($env->get('logFile'));
$pdo    = PdoHelper::makePdo($env);

$miCodes   = trim($_COOKIE['miCodes'] ?? "{}");
$sessionId = trim($_COOKIE['sessionid'] ?? "");
$lang      = trim($_COOKIE['lang']           ?? "");
$ui        = new Uitext($pdo, $logger, $lang, 'info%', 'btm%', 'ham%', 'top%');
$editor    = ! empty(trim($_COOKIE['editor'] ?? ""));
$codes     = json_decode($miCodes, true);

date_default_timezone_set('America/New_York');
$voterLog = new VoterLog($pdo, $logger, $env->get('addressHashSalt'));
$voterLog->write($sessionId, 'I', $codes, $_COOKIE['miAddress'] ?? '');

$smarty = new SmartyPage();
$smarty->assign('address', $address);
$smarty->assign('hasAddress', ! empty($address));
$smarty->assign('editor', $editor);
$smarty->assign('lang',   $lang);
$smarty->assign('ui',   $ui);
$smarty->display('info.tpl');
