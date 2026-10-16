<?php
declare(strict_types=1);

use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\PdoHelper;
use CharlesRothDotNet\Alfred\Str;

require 'vendor/autoload.php';

$env     = new EnvFile("_env");
$pdo     = PdoHelper::makePdo($env);

 
$timezone = new DateTimeZone('America/New_York');

$thisHour = new DateTimeImmutable('now', $timezone);
$thisDate = $thisHour->format('Y-m-d H:00:00');
$prevHour = $thisHour->modify("-1 hour");
$prevDate = $prevHour->format('Y-m-d H:00:00');
echo "$prevDate\n";
echo "$thisDate\n";

$sql = "SELECT * FROM v4voter_log WHERE timestamp >= '$prevDate' AND timestamp < '$thisDate'";

$result = $pdo->run($sql);
$rows   = $result->getRows();
foreach ($rows as $row) {

   echo $row['sessionid'] . "\t"
     .  $row['timestamp'] . "\t"
     .  $row['ip']        . "\t"
     .  $row['ip_method'] . "\t"
     .  $row['page']      . "\t"
     .  $row['new_addr']  . "\t"
     .  $row['hash_addr'] . "\t"
     .  $row['county']    . "\t"
     .  $row['zip']       . "\t"
     .  $row['juris_code'] . "\t"
     .  $row['wardpct']   . "\t"
     .  $row['referer']   . "\t"
     .  $row['language']  . "\t"
     .  $row['pageargs']  . "\n";
}


