<?php
declare(strict_types=1);

use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\PdoHelper;
use CharlesRothDotNet\Alfred\IpAddress;
use CharlesRothDotNet\Alfred\SqlFields;

require_once("../vendor/autoload.php");

$env       = new EnvFile("_env");
$pdo       = PdoHelper::makePdo($env);
$redirect = $_GET['redirect'] ?? "";
$ipAddress = new IpAddress();
$sqlFields = new SqlFields(['ip' => $ipAddress->getIp(), 'ip_method' => $ipAddress->getMethod(),
   'redirect' => $redirect]);

$sql = "INSERT INTO v4redirects " . $sqlFields->getInsertFragment();
$result = $pdo->run($sql);
header("Location: https://www.mivoter.org");
