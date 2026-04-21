<?php
declare(strict_types=1);

use Smarty\Smarty;
use CharlesRothDotNet\Alfred\SmartyPage;

require_once("../vendor/autoload.php");

$smarty = new SmartyPage();
$smarty->display('index.tpl');