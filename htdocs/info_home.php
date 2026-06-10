<?php
declare(strict_types=1);

use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\PdoHelper;
use CharlesRothDotNet\Alfred\Str;
use CharlesRothDotNet\EditorV4\EnvHelper;
use Smarty\Smarty;
use CharlesRothDotNet\Alfred\SmartyPage;
use CharlesRothDotNet\MIV4\Clerk;

require_once("../vendor/autoload.php");

$address = trim($_COOKIE['miAddress'] ?? "");
if ($address === "") {
   header("Location: index.php");
   exit();
}

$env     = new EnvFile("_env");
$pdo     = PdoHelper::makePdo($env);
$miCodes = trim($_COOKIE['miCodes'] ?? "");
$codes   = json_decode($miCodes, true);

$clerkJurisdiction = Clerk::getJurisdictionName($pdo, intval($codes['juris_code']));

$smarty = new SmartyPage();
$smarty->assign('address', $address);
$smarty->assign('clerkJurisdiction', $clerkJurisdiction);
$smarty->display('info_home.tpl');
