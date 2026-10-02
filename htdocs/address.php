<?php
declare(strict_types=1);

use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\PdoHelper;
use CharlesRothDotNet\Alfred\HttpGet;
use CharlesRothDotNet\Alfred\Str;
use CharlesRothDotNet\AddressService\AddressMatcher;
use CharlesRothDotNet\AddressService\ParsedAddress;
use CharlesRothDotNet\AddressService\StreetUtils;
use CharlesRothDotNet\AddressService\StreetTypes;

require_once('../vendor/autoload.php');

const MAX_ROWS = 50;

date_default_timezone_set("America/New_York");

$env = new EnvFile("_env");
$pdo = PdoHelper::makePdo($env);

$number  = HttpGet::number("num");
$street  = HttpGet::value("street");
$street  = Str::replaceAll($street, "-", " ");
$max     = HttpGet::number("max", MAX_ROWS);
$log     = HttpGet::number("log", 0);

$allowedOrigins = ['https://new.mivoter.org', 'https://mivoter.org', 'https://aws.mivoter.org', 'http://localhost', 'https://vopro.mivoter.org', 'https://alb.mivoter.org'];
$http_origin = $_SERVER['HTTP_ORIGIN'] ?? '';
if (in_array($http_origin, $allowedOrigins)) {
   header("Access-Control-Allow-Origin: $http_origin");
   header("Vary: Origin");
}

//header("Access-Control-Allow-Origin: https://new.mivoter.org");

if ($number == 0  &&  empty($street)) {
   header('Content-Type: application/json; charset=utf-8');
   echo '{"count": 0, "errorText":"YOU MUST SUPPLY a \'street\' querystring argument!"}';
   exit();
}

if (strlen($street) < 3) {
   header('Content-Type: application/json; charset=utf-8');
   echo '{"count": 0, "errorText":"street must be at least 3 characters long"}';
   exit();
}

$su      = new StreetUtils();
$addr    = new ParsedAddress($street);
$matcher = new AddressMatcher($pdo, $su, 'population desc', $max);
$results = $matcher->match($number, $addr);

if (hasZero($results)) {
   $results = $matcher->repeatWithoutRemovablePrefix($number, $addr, $results);
}

if (hasZero($results)  &&  $number > 0) {
   $results = $matcher->match(0, $addr);
}

if (hasZero($results)  &&  empty($addr->getCity())) {
   $st = new StreetTypes();
   $results = $matcher->repeatAddingCommaWhereNeeded($number, $addr, $st, $results);
}

$results['timems'] = $matcher->getElapsedTimeMs();
header('Content-Type: application/json; charset=utf-8');
$json = json_encode($results);
echo $json;

if ($log == 1) {
   $count   = $results['count'];
   $elapsed = $matcher->getElapsedTimeMs();
   $ip = $_SERVER['REMOTE_ADDR'] ?? "no-ip";
   error_log(date('Y-m-d H:i:s') . "  ip=$ip hits=$count timems=$elapsed street={$addr->getStreet()}, num=$number, city={$addr->getCity()}, zipcode={$addr->getZipLow()}-{$addr->getZipHigh()}\n",
          3, $env->get("logfile"));
}

function hasZero(array $results): bool {
   return intval($results['count']) === 0;
}
