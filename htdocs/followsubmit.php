<?php
declare(strict_types=1);

use CharlesRothDotNet\Alfred\DumbFileLogger;
use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\PdoHelper;
use CharlesRothDotNet\Alfred\SqlFields;
use CharlesRothDotNet\Alfred\SmartyPage;
use CharlesRothDotNet\MIV4\Uitext;

require_once("../vendor/autoload.php");

$address = trim($_COOKIE['miAddress'] ?? "");
if ($address === "") {
   header("Location: index.php");
   exit();
}

$env              = new EnvFile("_env");
$logger           = new DumbFileLogger($env->get('logFile'));
$pdo              = PdoHelper::makePdo($env);
$editor    = ! empty(trim($_COOKIE['editor'] ?? ""));
$lang      = trim($_COOKIE['lang']           ?? "");

$name  = $_POST['namefld']  ?? "";
$email = $_POST['emailfld'] ?? "";

$sqlFields = new SqlFields(['name' => $name, 'email' => $email]);
$pdo->runSF("INSERT INTO follow", "", $sqlFields);

$smarty = new SmartyPage();
$smarty->assign('address', $address);
$smarty->assign('hasAddress', true);
$smarty->assign('editor', $editor);
$smarty->assign('lang',   $lang);
$smarty->display('followsubmit.tpl');
