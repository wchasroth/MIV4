<?php
declare(strict_types=1);

use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\PdoHelper;
use CharlesRothDotNet\Alfred\SqlFields;

use CharlesRothDotNet\MIV4\SpanishTranslator;

require 'vendor/autoload.php';

$env     = new EnvFile("_env");
$pdo     = PdoHelper::makePdo($env);

$projectId = 'azure2-405122';
$translator = new SpanishTranslator('azure2-405122-da5c46dc0f97.json', $projectId);

$sql = "SELECT org, office, miv_title, shortname FROM s4titles";
$result = $pdo->run($sql);
$rows   = $result->getRows();
foreach ($rows as $row) {
   $org    = $row["org"];
   $office = $row["office"];
   $title  = $translator->translate($row['miv_title']);
   $short  = $translator->translate($row['shortname']);
   echo $row['org'] . ":" . $row['office'] . "  " . $row['miv_title'] . "\n";
   echo "    $short:    $title\n";
   if (!empty($title)) {
      $title = Str::replaceAll($title, "'", "''");
      $sql = "UPDATE s4titles SET miv_title_es='$title' WHERE org='$org' AND office='$office'";
      $pdo->run($sql);
   }
   if (!empty($short)) {
      $short = Str::replaceAll($short, "'", "''");
      $sql = "UPDATE s4titles SET short_es='$short' WHERE org='$org' AND office='$office'";
      $pdo->run($sql);
   }
}

$translator->close();