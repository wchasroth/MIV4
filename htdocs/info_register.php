<?php
declare(strict_types=1);

use CharlesRothDotNet\Alfred\DumbFileLogger;
use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\PdoHelper;
use CharlesRothDotNet\Alfred\SmartyPage;
use Smarty\Smarty;
use CharlesRothDotNet\MIV4\Plugins;
use CharlesRothDotNet\MIV4\Clerk;
use CharlesRothDotNet\MIV4\VoterLog;
use CharlesRothDotNet\MIV4\Uitext;
use CharlesRothDotNet\MIV4\MiCodesDecoder;

require_once("../vendor/autoload.php");

$address = trim($_COOKIE['miAddress'] ?? "");
//if ($address === "") {
//   header("Location: index.php");
//   exit();
//}

$env     = new EnvFile("_env");
$logger  = new DumbFileLogger($env->get('logFile'));
$pdo     = PdoHelper::makePdo($env);

$lang    = trim($_COOKIE['lang']           ?? "");
$editor  = ! empty(trim($_COOKIE['editor'] ?? ""));
$codes   = MiCodesDecoder::decode($_COOKIE['miCodes'] ?? "{}");
$ui      = new Uitext($pdo, $logger, $lang, 'pg-info-reg%', 'inc-vq-%', 'btm%', 'ham%', 'top%');

$sessionId = trim($_COOKIE['sessionid'] ?? "");

date_default_timezone_set('America/New_York');
$voterLog = new VoterLog($pdo, $logger, $env->get('addressHashSalt'));
$voterLog->write($sessionId, 'I', $codes, $_COOKIE['miAddress'] ?? '');

$clerkJurisdiction = Clerk::getJurisdictionName($pdo, intval($codes['juris_code'] ?? '0'));

$smarty = new SmartyPage();
$smarty->registerPlugin(Smarty::PLUGIN_MODIFIER, "dollarDollar", [Plugins::class, "dollarDollar"]);
$smarty->assign('address', $address);
$smarty->assign('hasAddress', ! empty($address));
$smarty->assign('clerkJurisdiction', $clerkJurisdiction);
$smarty->assign('editor', $editor);
$smarty->assign('lang',   $lang);
$smarty->assign('ui',   $ui);
$smarty->display('info_register.tpl');
