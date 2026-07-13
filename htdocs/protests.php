<?php
declare(strict_types=1);

use CharlesRothDotNet\Alfred\DumbFileLogger;
use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\PdoHelper;
use Smarty\Smarty;
use CharlesRothDotNet\Alfred\SmartyPage;
use CharlesRothDotNet\MIV4\Plugins;
use CharlesRothDotNet\MIV4\VoterLog;

require_once("../vendor/autoload.php");

$address = trim($_COOKIE['miAddress'] ?? "");
if ($address === "") {
   header("Location: index.php");
   exit();
}

$env              = new EnvFile("_env");
$logger           = new DumbFileLogger($env->get('logFile'));
$pdo              = PdoHelper::makePdo($env);
$logger = new DumbFileLogger($env->get('logFile'));

$miCodes = trim($_COOKIE['miCodes'] ?? "");
$codes = json_decode($miCodes, true);
$sessionId = trim($_COOKIE['sessionid'] ?? "");

date_default_timezone_set('America/New_York');
$voterLog = new VoterLog($pdo, $logger, $env->get('addressHashSalt'));
$voterLog->write($sessionId, 'P', $codes, $address);

$myCounty = $codes['county_code'];
$county = $_GET["county"] ?? $myCounty;  // ???? does this really get used?

// There's a better way to do this...
if ($county > 0) {
   $sql = "SELECT p.*, '' AS ctyname, s.name AS srcname, s.url AS srcurl "
        . "  FROM protests AS p       "
        . "  JOIN protest_source AS s "
        . "    ON p.source = s.id "
        . " WHERE p.day >= date(now()) "
        . "   AND p.publish = 1 ";
        $sql = $sql . " AND county = $county";
}
else {
   $sql = "SELECT p.*, co.name as ctyname, s.name AS srcname, s.url AS srcurl "
        . "  FROM protests AS p "
        . "  JOIN county   AS co "
        . "    ON (p.county = co.id) "
        . "  JOIN protest_source AS s "
        . "    ON p.source = s.id "
        . " WHERE p.day >= date(now()) "
        . "   AND p.publish = 1 ";
}

$sql = $sql . " ORDER BY day ASC ";

$result = $pdo->run($sql);
$protests = $result->getRows();
$noMore = count($protests) == 0;

$smarty = new SmartyPage();
$smarty->registerPlugin(Smarty::PLUGIN_MODIFIER, "shortDate",   [Plugins::class, "shortDate"]);
$smarty->registerPlugin(Smarty::PLUGIN_MODIFIER, "safe",        [Plugins::class, "safe"]);
$smarty->registerPlugin(Smarty::PLUGIN_MODIFIER, "showCounty",  [Plugins::class, "showCounty"]);
$smarty->registerPlugin(Smarty::PLUGIN_MODIFIER, "emailLinks",  [Plugins::class, "emailLinks"]);
$smarty->registerPlugin(Smarty::PLUGIN_MODIFIER, "hyperLinks",  [Plugins::class, "hyperLinks"]);
$smarty->registerPlugin(Smarty::PLUGIN_MODIFIER, "splitComma",  [Plugins::class, "splitComma"]);
$smarty->registerPlugin(Smarty::PLUGIN_MODIFIER, "showWithPrefix",  [Plugins::class, "showWithPrefix"]);

$smarty->assign('address', $address);
$smarty->assign('hasAddress', true);
$smarty->assign('county', $county);
$smarty->assign('protests', $protests);
$smarty->display('protests.tpl');
