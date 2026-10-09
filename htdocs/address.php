<?php
declare(strict_types=1);

use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\PdoHelper;
use CharlesRothDotNet\Alfred\HttpGet;
use CharlesRothDotNet\Alfred\Str;
use CharlesRothDotNet\Alfred\DumbFileLogger;
use CharlesRothDotNet\MIV4\AddressMatcher;
use CharlesRothDotNet\MIV4\ParsedAddress;
use CharlesRothDotNet\MIV4\StreetUtils;
use CharlesRothDotNet\MIV4\StreetTypes;

require_once('../vendor/autoload.php');

const MAX_ROWS = 10;

date_default_timezone_set("America/New_York");

$env = new EnvFile("_env");
$pdo = PdoHelper::makePdo($env);

$referrerName = $_SERVER['HTTP_REFERER'] ?? 'unknown';
$http_origin  = $_SERVER['HTTP_ORIGIN']  ?? '';

//---Not the most secure, but this will filter out obvious/naive attacks.
$logger = new DumbFileLogger($env->get('logFile'));
if (! empty($http_origin)  ||  ! Str::contains($referrerName, $env->get('domain'))) {
   $logger->log("http_origin=$http_origin, referrer=$referrerName");
   exit(1);
}

$number  = HttpGet::number("num");
$street  = HttpGet::value("street");
$street  = Str::replaceAll($street, "-", " ");
$max     = HttpGet::number("max", MAX_ROWS);
$log     = HttpGet::number("log", 0);
$logger->log("Address max: $max");

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
