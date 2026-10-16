<?php
declare(strict_types=1);

use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\PdoHelper;
use CharlesRothDotNet\Alfred\CsvFile;
use CharlesRothDotNet\Alfred\Str;

require 'vendor/autoload.php';

$env  = new EnvFile("_env");
$pdo  = PdoHelper::makePdo($env);
$csv  = new CsvFile();
$argv = $csv->extractFlags($argv);

if (count($argv) < 2) {
   fwrite(STDERR, "Usage: php insertVoterlog inputFile.tsv\n");
   exit(1);
}
if (! $csv->loadfile($argv[1]))  $csv->exitWithError();

$rowCount = $csv->getRowCount();
for ($i=1;   $i < $rowCount;   $i++) {
   $row = $csv->getRow($i);
   $values = sprintf ("('%s', '%s', '%s', '%s',     '%s', '%s',     '%s',      %d,     %d,  %d,         '%s',    '%s',    '%s', '%s')",
      $row['sessionid'], $row['timestamp'], $row['ip'], $row['ip_method'], $row['page'], $row['new_addr'], $row['hash_addr'],
      $row['county'], $row['zip'], $row['juris_code'], $row['wardpct'], $row['referer'], $row['language'], $row['pageargs']);
   $sql = "INSERT INTO v4voter_log "
      . " (sessionid, timestamp, ip, ip_method, page, new_addr, hash_addr, county, zip, juris_code, wardpct, referer, language, pageargs) "
      . " VALUES $values ";
   $result = $pdo->run($sql);
   if ($result->failed())  fwrite(STDERR, "failed: $sql\n");
}


