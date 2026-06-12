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

$photoBase = $env->get('photoBase');
$miCodes = trim($_COOKIE['miCodes'] ?? "");
$codes = json_decode($miCodes, true);

$sql = "SELECT s.id, s.org, s.office, s.district, s.subdist, s.termcycle, "
     . "       i.name, i.web, i.headshot, i.description, "
     . "       t.miv_title "
     . "  FROM      v4seats      AS s "
     . "  LEFT JOIN v4candidates AS i ON (i.seat_id = s.id) "
     . "  LEFT JOIN s4titles     AS t ON (t.org = s.org AND t.office = s.office) "
     . " WHERE i.id = $id";
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

$web = $row['web'];
if (! Str::startsWith($web, "http")) $web = "https://$web";

$headshot = trim($row['headshot']);
if ($headshot === "")  $headshot = "IMG/noPerson.png";
$description = $row['description'];

$smarty = new SmartyPage();
$smarty->assign('name',      $name);
$smarty->assign('title',     $row['miv_title']);
$smarty->assign('web',       $web);
$smarty->assign('photoBase', $photoBase);
$smarty->assign('headshot',  $headshot);
$smarty->assign('description',  $description);
$smarty->display('singleCandidate.tpl');
