<?php
declare(strict_types=1);

use Smarty\Smarty;
use CharlesRothDotNet\Alfred\SmartyPage;

require_once("../vendor/autoload.php");

$address = $_COOKIE['address'] ?? "";

$smarty = new SmartyPage();
$smarty->assign ('address', $address);

if ($address === "")  $smarty->display('indexNoAddress.tpl');
else                  $smarty->display('indexWithAddress.tpl');