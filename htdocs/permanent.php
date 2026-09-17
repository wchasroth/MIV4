<?php
declare(strict_types=1);

use CharlesRothDotNet\Alfred\DumbFileLogger;
use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\PdoHelper;
use CharlesRothDotNet\Alfred\SmartyPage;
use CharlesRothDotNet\MIV4\VoterLog;
use CharlesRothDotNet\MIV4\Uitext;
use CharlesRothDotNet\MIV4\MiCodesDecoder;

require_once("../vendor/autoload.php");

$address = trim($_COOKIE['miAddress'] ?? "");
if ($address === "") {
   header("Location: index.php");
   exit();
}

$env    = new EnvFile("_env");
$logger = new DumbFileLogger($env->get('logFile'));
$pdo    = PdoHelper::makePdo($env);

$lang      = trim($_COOKIE['lang']           ?? "");
$editor    = ! empty(trim($_COOKIE['editor'] ?? ""));
$codes     = MiCodesDecoder::decode($_COOKIE['miCodes'] ?? "{}");
$sessionId = trim($_COOKIE['sessionid'] ?? "");

date_default_timezone_set('America/New_York');

$smarty = new SmartyPage();
$smarty->assign('address', $address);
$smarty->assign('editor', $editor);
$smarty->assign('hasAddress', true);
$smarty->assign('lang',   $lang);
$smarty->display('permanent.tpl');
