<?php
declare(strict_types=1);

use CharlesRothDotNet\Alfred\Str;
use CharlesRothDotNet\Alfred\EnvFile;
use CharlesRothDotNet\Alfred\PdoHelper;

use Google\Cloud\Translate\V3\Client\TranslationServiceClient;
use Google\Cloud\Translate\V3\TranslateTextRequest;

require 'vendor/autoload.php';

$env     = new EnvFile("_env");
$pdo     = PdoHelper::makePdo($env);

$translationServiceClient = new TranslationServiceClient([
    'credentials' => 'azure2-405122-da5c46dc0f97.json'
]);
$projectId = 'azure2-405122';
$formattedParent = TranslationServiceClient::locationName($projectId, 'global');

$sql = "SELECT id, text FROM v4uitext WHERE id NOT LIKE '%-es'";
$result = $pdo->run($sql);
$rows   = $result->getRows();
$count = 0;
foreach ($rows as $row) {
   $translated = translateToSpanish($row['text'], $translationServiceClient, $formattedParent);
   echo $row['id'] . ": " . $row['text'] . "\n";
   echo "    $translated\n\n";

   $sqlFields = new SqlFields (['id' => $row['id'] . "-es2", 'text' => $translated]);
   $result = $pdo->run("INSERT INTO v4uitext " . $sqlFields->getInsertFragment());
   if ($result->failed())  fwrite (STDERR, "Error: " . $result->getError() . "\n");

   ++$count;
   if ($count > 2)  break;
}

$translationServiceClient->close();

function translateToSpanish(string $text, TranslationServiceClient $client, $formattedParent): string {
   $translatedText = "";
   try {
      $request = (new TranslateTextRequest())
         ->setParent($formattedParent)
         ->setTargetLanguageCode('es')
         ->setSourceLanguageCode('en')
         ->setContents([$text]);

      $response = $client->translateText($request);

      foreach ($response->getTranslations() as $index => $translation) {
         $translatedText .= $translation->getTranslatedText();
      }
      usleep(100000); // Sleep for 0.1 seconds between batches

   } catch (Exception $e) {
      echo 'Error: ' . $e->getMessage();
   }

   return $translatedText;
}