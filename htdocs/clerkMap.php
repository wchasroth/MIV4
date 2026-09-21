<?php
declare(strict_types=1);

use CharlesRothDotNet\Alfred\DumbFileLogger;
use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\PdoHelper;
use CharlesRothDotNet\Alfred\AlfredPDO;
use CharlesRothDotNet\Alfred\Str;
use CharlesRothDotNet\EditorV4\EnvHelper;
use Smarty\Smarty;
use CharlesRothDotNet\Alfred\SmartyPage;
use CharlesRothDotNet\MIV4\Plugins;
use CharlesRothDotNet\MIV4\Clerk;
use CharlesRothDotNet\MIV4\Utils;
use CharlesRothDotNet\MIV4\Uitext;
use CharlesRothDotNet\MIV4\MiCodesDecoder;

require_once("../vendor/autoload.php");

$address = trim($_COOKIE['miAddress'] ?? "");
if ($address === "") {
   header("Location: index.php");
   exit();
}

$env     = new EnvFile("_env");
$logger  = new DumbFileLogger($env->get('logFile'));
$pdo     = PdoHelper::makePdo($env);

$lang    = trim($_COOKIE['lang']           ?? "");
$editor  = ! empty(trim($_COOKIE['editor'] ?? ""));
$codes   = MiCodesDecoder::decode($_COOKIE['miCodes'] ?? "{}");
$apiKey  = $env->get('googleMapsApiKey');
$ui      = new Uitext($pdo, $logger, $lang, 'pg-clerk%', 'btm%', 'ham%', 'top%', 'button%');

$clerk = Clerk::getClerkInfo($pdo, intval($codes['county_code']), intval($codes['juris_code']), $logger);
$clerk['phoneDigits'] = Utils::phoneDigits($clerk['phone']);
$clerk['faxDigits']   = Utils::phoneDigits($clerk['fax']);

$smarty = new SmartyPage();
$smarty->assign('ui', $ui);
$smarty->registerPlugin(Smarty::PLUGIN_MODIFIER, "dollarDollar", [Plugins::class, "dollarDollar"]);

#if (empty($clerk['name'])) {
if (empty($clerk['street_address'])) {
   $logger->log("FIXME: clerkMap failed for: " . print_r($codes, true));
   $smarty->display("clerkError.tpl");
}
else {
   $smarty->assign('clerk', $clerk);
   $smarty->assign('apiKey', $apiKey);
   $smarty->assign('hasAddress', true);
   $smarty->assign('editor', $editor);
   $smarty->assign('lang',   $lang);
   $smarty->display('clerkMap.tpl');
}
