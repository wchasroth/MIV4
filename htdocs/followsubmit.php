<?php
declare(strict_types=1);

use CharlesRothDotNet\Alfred\DumbFileLogger;
use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\PdoHelper;
use CharlesRothDotNet\Alfred\SqlFields;
use CharlesRothDotNet\Alfred\SmartyPage;

require_once("../vendor/autoload.php");

$env              = new EnvFile("_env");
$logger           = new DumbFileLogger($env->get('logFile'));
$pdo              = PdoHelper::makePdo($env);

$name  = $_POST['namefld']  ?? "";
$email = $_POST['emailfld'] ?? "";

$sqlFields = new SqlFields(['name' => $name, 'email' => $email]);
$pdo->runSF("INSERT INTO follow", "", $sqlFields);

$smarty = new SmartyPage();
$smarty->display('followsubmit.tpl');
