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

$pdo->run("DELETE FROM v4uitext WHERE id LIKE '%-es'");

$sql = "SELECT id, text FROM v4uitext WHERE id NOT LIKE '%-es'";
$result = $pdo->run($sql);
$rows   = $result->getRows();
foreach ($rows as $row) {
   $translated = $translator->translate($row['text']);
   echo $row['id'] . ": " . $row['text'] . "\n";
   echo "    $translated\n\n";

   $sqlFields = new SqlFields (['id' => $row['id'] . "-es", 'text' => $translated]);
   $result = $pdo->run("INSERT INTO v4uitext " . $sqlFields->getInsertFragment());
   if ($result->failed())  fwrite (STDERR, "Error: " . $result->getError() . "\n");
}

$translator->close();