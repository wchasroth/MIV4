<?php
declare(strict_types=1);

use CharlesRothDotNet\Alfred\DumbFileLogger;
use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\PdoHelper;
use CharlesRothDotNet\Alfred\SqlFields;
use CharlesRothDotNet\Alfred\SmartyPage;

require_once("../vendor/autoload.php");

$address = trim($_COOKIE['miAddress'] ?? "");
if ($address === "") {
   header("Location: index.php");
   exit();
}

$env              = new EnvFile("_env");
$logger           = new DumbFileLogger($env->get('logFile'));
$pdo              = PdoHelper::makePdo($env);

$name  = $_POST['name']     ?? "";
$email = $_POST['email']    ?? "";
$text  = $_POST['comments'] ?? "";

$sqlFields = new SqlFields(['name' => $name, 'email' => $email, 'comment' => $text]);
$pdo->runSF("INSERT INTO comments", "", $sqlFields);

$smarty = new SmartyPage();
$smarty->assign('address', $address);
$smarty->display('feedbacksubmit.tpl');

