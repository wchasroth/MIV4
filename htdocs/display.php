<?php
declare(strict_types=1);

use CharlesRothDotNet\Alfred\DumbFileLogger;
use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\PdoHelper;
use CharlesRothDotNet\Alfred\SmartyPage;
use CharlesRothDotNet\MIV4\VoterLog;

require_once("../vendor/autoload.php");

$key     = $_GET['key'] ?? "";
$address = trim($_COOKIE['miAddress'] ?? "");
if ($address === ""  ||  $key === "") {
   header("Location: index.php");
   exit();
}

$env              = new EnvFile("_env");
$logger           = new DumbFileLogger($env->get('logFile'));
$pdo              = PdoHelper::makePdo($env);

$miCodes   = trim($_COOKIE['miCodes'] ?? "");
$codes     = json_decode($miCodes, true) ?? [];
$sessionId = trim($_COOKIE['sessionid'] ?? "");

date_default_timezone_set('America/New_York');
$voterLog = new VoterLog($pdo, $logger, $env->get('addressHashSalt'));
$voterLog->write($sessionId, 'D', $codes, $address);

// id       | varchar(20)    | NO   | PRI | NULL              |                                               |
//| what     | varchar(40)    | YES  |     | NULL              |                                               |
//| who      | varchar(60)    | YES  |     | NULL              |                                               |
//| modified | datetime       | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
//| text     | varchar(10000) | YES  |     | NULL         

$sql = "SELECT text FROM uitext WHERE id='$key'";
$result = $pdo->run($sql);
$text = $result->getSingleValue('text');

$smarty = new SmartyPage();
//$smarty->registerPlugin(Smarty::PLUGIN_MODIFIER, "shortDate",   [Plugins::class, "shortDate"]);
//$smarty->registerPlugin(Smarty::PLUGIN_MODIFIER, "safe",        [Plugins::class, "safe"]);
//$smarty->registerPlugin(Smarty::PLUGIN_MODIFIER, "showCounty",  [Plugins::class, "showCounty"]);
//$smarty->registerPlugin(Smarty::PLUGIN_MODIFIER, "emailLinks",  [Plugins::class, "emailLinks"]);
//$smarty->registerPlugin(Smarty::PLUGIN_MODIFIER, "hyperLinks",  [Plugins::class, "hyperLinks"]);
//$smarty->registerPlugin(Smarty::PLUGIN_MODIFIER, "splitComma",  [Plugins::class, "splitComma"]);
//$smarty->registerPlugin(Smarty::PLUGIN_MODIFIER, "showWithPrefix",  [Plugins::class, "showWithPrefix"]);

$smarty->assign('text', $text);
$smarty->assign('address', $address);
$smarty->display('display.tpl');
