<?php
declare(strict_types=1);

use CharlesRothDotNet\Alfred\Str;
use Google\Cloud\Translate\V3\Client\TranslationServiceClient;
use Google\Cloud\Translate\V3\TranslateTextRequest;

require 'vendor/autoload.php';

// 1. Initialize the client. 
// It automatically picks up credentials if you set the GOOGLE_APPLICATION_CREDENTIALS env variable,
// or you can pass them directly in the 'credentials' config option:
$translationServiceClient = new TranslationServiceClient([
    'credentials' => 'azure2-405122-da5c46dc0f97.json'
]);

// 2. Define your project details and strings
$projectId = 'azure2-405122';
// V3 formats the project path as 'projects/{project-id}/locations/global'
$formattedParent = TranslationServiceClient::locationName($projectId, 'global');
echo "Block 1\n";

$contents = [
    'Hello, how are you?',
    'Good morning!',
    'Thank you for your help.'
];

try {
    // 3. Construct the request object
    $request = (new TranslateTextRequest())
        ->setParent($formattedParent)
        ->setTargetLanguageCode('es')
        ->setSourceLanguageCode('en') // Optional, but recommended
        ->setContents($contents);
    echo "Block 2\n";

    // 4. Call the API
    $response = $translationServiceClient->translateText($request);
    echo "Block 3\n";

    // 5. Output the results
    foreach ($response->getTranslations() as $index => $translation) {
        echo "Original: " . $contents[$index] . "\n";
        echo "Translated: " . $translation->getTranslatedText() . "\n\n";
    }

} catch (Exception $e) {
    echo 'Error: ' . $e->getMessage();
} finally {
    $translationServiceClient->close();
}

