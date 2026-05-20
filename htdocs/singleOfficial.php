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

$address = trim($_COOKIE['miAddress'] ?? "");
if ($address === "") {
   header("Location: index.php");
   exit();
}

$env              = new EnvFile("_env");
$logger           = new DumbFileLogger($env->get('logFile'));
$pdo              = PdoHelper::makePdo($env);

$id = $_GET["id"] ?? "";
if ($id === "") {
   header("Location: index.php");
   exit();
}

$miCodes = trim($_COOKIE['miCodes'] ?? "");
$codes = json_decode($miCodes, true);

$sql = "SELECT s.id, s.org, s.office, s.district, s.subdist, s.termcycle, "
     . "       i.name, i.party, i.address, i.phone, i.email, i.web, "
     . "       t.miv_title "
     . "  FROM      v4seats      AS s "
     . "  LEFT JOIN v4incumbents AS i ON (i.seat_id = s.id) "
     . "  LEFT JOIN s4titles     AS t ON (t.org = s.org AND t.office = s.office) "
     . " WHERE s.id = $id";
   ;
$result = $pdo->run($sql);
if ($result->failed()) {
   $logger->log("singleOfficial error: " . $result->getError());
   header("Location: index.php");
   exit();
}

$row    = $result->getRows()[0];
$name = $row['name'];
if ($name === strtoupper($name))   $name = ucwords(strtolower($name));
$party = $row['party'];
if (trim($party) !== "")  $party = "($party)";
$web = $row['web'];
if (Str::startsWith($web, "http")) $web = Str::substringAfter($web, "//");
$url = $row['web'];
if (! Str::startsWith($url, "http"))  $url = "https://" . $url;

$smarty = new SmartyPage();
$smarty->assign('name', $name);
$smarty->assign('title', $row['miv_title']);
$smarty->assign('party', $party);
$smarty->assign('address', $row['address']);
$smarty->assign('phone',   $row['phone']);
$smarty->assign('email',   $row['email']);
$smarty->assign('web',     $web);
$smarty->assign('url',     $url);
$smarty->display('singleOfficial.tpl');
