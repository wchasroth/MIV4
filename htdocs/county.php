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

require_once("../vendor/autoload.php");

$address = trim($_COOKIE['miAddress'] ?? "");
if ($address === "") {
   header("Location: index.php");
   exit();
}

$env              = new EnvFile("_env");
$logger           = new DumbFileLogger($env->get('logFile'));
$pdo              = PdoHelper::makePdo($env);

$miCodes = trim($_COOKIE['miCodes'] ?? "");
$codes = json_decode($miCodes, true);
$myCounty = $codes['county_code'];

$county = $_GET["county"] ?? $myCounty;

$sql = "SELECT cc.*, co.name  "
     . "  FROM s4county_contacts AS cc "
     . "  JOIN s4counties        AS co "
     . "    ON (cc.county = co.id) "
     . " WHERE  cc.county = $county "
     . " ORDER BY cc.priority DESC, cc.shortdesc ";
$result = $pdo->run($sql);
$counties = $result->getRows();



$smarty = new SmartyPage();
$smarty->registerPlugin(Smarty::PLUGIN_MODIFIER, "fixCase",       [Plugins::class, "fixCase"]);
$smarty->registerPlugin(Smarty::PLUGIN_MODIFIER, "addProtocol",   [Plugins::class, "addProtocol"]);
$smarty->registerPlugin(Smarty::PLUGIN_MODIFIER, "stripProtocol", [Plugins::class, "stripProtocol"]);

$smarty->assign('address', $address);
$smarty->assign('county', $county);
$smarty->assign('counties', $counties);
$smarty->display('county.tpl');
