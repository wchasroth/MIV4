<?php
declare(strict_types=1);

namespace CharlesRothDotNet\MIV4;

use Google\Cloud\Translate\V3\Client\TranslationServiceClient;
use Google\Cloud\Translate\V3\TranslateTextRequest;

class SpanishTranslator {
   private TranslationServiceClient $client;
   private string $formattedParent;
   private string $error;

   public function __construct(string $credentialsFileName, string $projectId) {
      $this->client = new TranslationServiceClient(['credentials' => $credentialsFileName]);
      $this->formattedParent = TranslationServiceClient::locationName($projectId, 'global');
      $this->error = "";
   }

   public function translate(string $text): string {
      $translatedText = "";
      try {
         $request = (new TranslateTextRequest())
            ->setParent($this->formattedParent)
            ->setTargetLanguageCode('es')
            ->setSourceLanguageCode('en')
            ->setContents([$text]);

         $response = $this->client->translateText($request);

         foreach ($response->getTranslations() as $index => $translation) {
            $translatedText = $translation->getTranslatedText();
            break;
         }
         $this->error = "";
         usleep(100000); // Sleep for 0.1 seconds between batches
      }
      catch (Exception $e) {
         $this->error = $e->getMessage();
      }
      return $translatedText;
   }

   public function getError(): string {
      return $this->error;
   }

   public function hasError(): bool {
      return !empty($this->error);
   }

   public function close() {
      $this->client->close();
   }

}