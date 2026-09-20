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
$env     = new EnvFile("_env");
$pdo     = PdoHelper::makePdo($env);

$lang    = trim($_COOKIE['lang']           ?? "");
$editor  = ! empty(trim($_COOKIE['editor'] ?? ""));
$codes   = MiCodesDecoder::decode($_COOKIE['miCodes'] ?? "{}");

$sessionId = trim($_COOKIE['sessionid'] ?? "");
$logger = new DumbFileLogger($env->get('logFile'));
$ui      = new Uitext($pdo, $logger, $lang, 'info-in%', 'inc-vq-%', 'btm%', 'ham%', 'top%');

date_default_timezone_set('America/New_York');
$voterLog = new VoterLog($pdo, $logger, $env->get('addressHashSalt'));
$voterLog->write($sessionId, 'I', $codes, $address);

$clerkJurisdiction = Clerk::getJurisdictionName($pdo, intval($codes['juris_code'] ?? '0'));

$smarty = new SmartyPage();
$smarty->registerPlugin(Smarty::PLUGIN_MODIFIER, "dollarDollar", [Plugins::class, "dollarDollar"]);
$smarty->assign('address', $address);
$smarty->assign('hasAddress', ! empty($address));
$smarty->assign('editor', $editor);
$smarty->assign('lang',   $lang);
$smarty->assign('ui',   $ui);
$smarty->assign('clerkJurisdiction', $clerkJurisdiction);
$smarty->display('info_inperson.tpl');
