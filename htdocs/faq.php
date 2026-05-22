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

require_once("../vendor/autoload.php");

//$env              = new EnvFile("_env");
//$logger           = new DumbFileLogger($env->get('logFile'));
//$pdo              = PdoHelper::makePdo($env);

$address = trim($_COOKIE['miAddress'] ?? "");

$smarty = new SmartyPage();
$smarty->assign('hasAddress', $address !== "");
$smarty->display('faq.tpl');