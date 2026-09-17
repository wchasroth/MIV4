<?php
declare(strict_types=1);

use Smarty\Smarty;
use CharlesRothDotNet\Alfred\SmartyPage;
use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\DumbFileLogger;
use CharlesRothDotNet\Alfred\PdoHelper;
use CharlesRothDotNet\MIV4\MiCodesDecoder;

use CharlesRothDotNet\MIV4\VoterLog;
use CharlesRothDotNet\MIV4\Uitext;

require_once("../vendor/autoload.php");

date_default_timezone_set('America/New_York');

$address = $_COOKIE['miAddress'] ?? "";

$env    = new EnvFile("_env");
$logger = new DumbFileLogger($env->get('logFile'));
$pdo    = PdoHelper::makePdo($env);

$editor    = ! empty(trim($_COOKIE['editor'] ?? ""));
$lang      = trim($_COOKIE['lang']           ?? "");
$ui        = new Uitext($pdo, $logger, $lang, 'pg-index%', 'btm%', 'ham%', 'top%');
$codes     = MiCodesDecoder::decode($_COOKIE['miCodes'] ?? "{}");

$sessionId = trim($_COOKIE['sessionid'] ?? "");
$zipcode   = $codes['zipcode'] ?? '';

$voterLog = new VoterLog($pdo, $logger, $env->get('addressHashSalt'));
$voterLog->write($sessionId, 'H', $codes, $address);

$smarty = new SmartyPage();
$smarty->assign ('address',    $address);
$smarty->assign ('zipcode',    $zipcode);
$smarty->assign('lang',   $lang);
$smarty->assign('editor',   $editor);
$smarty->assign('ui',   $ui);

if ($address === "") {
   $smarty->assign('hasAddress', false);
   $smarty->display('indexNoAddress.tpl');
}
else {
   $smarty->assign('hasAddress', true);
   $smarty->display('indexWithAddress.tpl');
}
