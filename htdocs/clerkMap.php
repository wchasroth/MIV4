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
use CharlesRothDotNet\MIV4\Clerk;
use CharlesRothDotNet\MIV4\Utils;

require_once("../vendor/autoload.php");

$address = trim($_COOKIE['miAddress'] ?? "");
if ($address === "") {
   header("Location: index.php");
   exit();
}

$env     = new EnvFile("_env");
$logger  = new DumbFileLogger($env->get('logFile'));
$pdo     = PdoHelper::makePdo($env);
$miCodes = trim($_COOKIE['miCodes'] ?? "");
$codes   = json_decode($miCodes, true);
$apiKey  = $env->get('googleMapsApiKey');

$clerk = Clerk::getClerkInfo($pdo, intval($codes['county_code']), intval($codes['juris_code']));
$clerk['phoneDigits'] = Utils::phoneDigits($clerk['phone']);
$clerk['faxDigits']   = Utils::phoneDigits($clerk['fax']);

$smarty = new SmartyPage();
$smarty->assign('clerk', $clerk);
$smarty->assign('apiKey', $apiKey);
$smarty->display('clerkMap.tpl');
