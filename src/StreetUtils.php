<?php
declare(strict_types=1);

namespace CharlesRothDotNet\MIV4;

use CharlesRothDotNet\Alfred\ArrayHelper;
use CharlesRothDotNet\Alfred\Str;

// This started life as just the cardinal directions, but we added more 'first word' terms that act/expand/shrink
// like cardinal directions -- e.g. "ST" for "SAINT" and "RT" for "ROUTE".
class StreetUtils {
   private array $directionsAndAbbreviations = [
      'N '         => 'NORTH ',     'S '         => 'SOUTH ',     'E '         => 'EAST ',      'W '         => 'WEST ',
      'NORTH '     => 'N ',         'SOUTH '     => 'S ',         'EAST '      => 'E ',         'WEST '      => 'W ',
      'NW '        => 'NORTHWEST ', 'SW '        => 'SOUTHWEST ', 'NE '        => 'NORTHEAST ', 'SE '        => 'SOUTHEAST ',
      'NORTHWEST ' => 'NW ',        'SOUTHWEST ' => 'SW ',        'NORTHEAST ' => 'NE ',        'SOUTHEAST ' => 'SE ',
   ];

   private array $wordsAndAbbreviations = [
      'ST '        => 'SAINT ',     'AX '        => 'AXE ',       'CO '        => 'COUNTY ',    'HI '        => 'HIGH ',
      'SAINT '     => 'ST ',        'AXE '       =>  'AX ',       'COUNTY '    => 'CO ',        'HIGH '      => 'HI ',
      'MT '        => 'MOUNT ',     'RT '        =>  'ROUTE ',    'JR '        => 'JUNIOR '
   ];

   private array $allTermsAndAbbreviations = [];

   private array $removablePrefixes;

   private array $simplifiedWords = [
      'ST.'  => 'ST',
      'U.S.' => 'US',
      'R.R'  => 'RR'
   ];

   public function __construct() {
      $this->allTermsAndAbbreviations = array_merge($this->directionsAndAbbreviations, $this->wordsAndAbbreviations);
      $this->removablePrefixes = array_merge (array_keys($this->allTermsAndAbbreviations), ['OLD ', 'NEW ']);
   }

   public function isDirection(string $word): bool {
      $word = strtoupper($word) . ' ';
      return isset($this->directionsAndAbbreviations[$word]);
   }

   public function removeDashes (string $street): string {
      if (Str::contains($street, "-")  &&  ! Str::contains($street, "-0", "-1", "-2", "-3", "-4", "-5", "-6", "-7", "-8", "-9")) {
         $street = Str::replaceAll($street, "-", " ");
         $street = preg_replace('/\s\s+/', ' ', $street);
      }
      return $street;
   }

   public function addCardinalDirectionVariants(array $streets): array {
      $add = [];
      foreach ($streets as $street) {
         foreach ($this->allTermsAndAbbreviations as $key => $value) {
            if (Str::startsWith($street, $key)) {
               $add[] = Str::replaceFirst($street, $key, $value);
               break;
            }
         }
      }
      return array_merge($streets, $add);
   }

   public function addVariantsForDottedNames(array $streets): array {
      $add = [];
      foreach ($streets as $street) {
         if (! Str::contains($street, '.'))  continue;

         $variant1 = $this->makeVariantWhereDotBecomes($street, ' ');
         $variant2 = $this->makeVariantWhereDotBecomes($street, '');
         if (! empty($variant1))      $add[] = $variant1;
         if ($variant2 != $variant1)  $add[] = $variant2;
      }
      return array_merge($streets, $add);
   }

   private function makeVariantWhereDotBecomes(string $street, string $dotReplacement): string {
      $words = Str::splitIntoTokens($street, ' ');
      $count = count($words);
      $found = false;
      for ($i=0;   $i<$count;   $i++) {
         $word = $words[$i];
         if (Str::contains($word, '.')  &&  ! $this->isDottedNumber($word)) {
            $words[$i] = trim(Str::replaceAll($word, '.', $dotReplacement));
            $found = true;
         }
      }
      return ($found ? Str::join($words, ' ') : "");
   }

   public function isDottedNumber(string $word): bool {
      if (! Str::contains($word, '.'))  return false;
      $len = strlen($word);
      for ($i=0;   $i<$len;   $i++) {
         $char = $word[$i];
         if ($char !== '.'  &&  ! ctype_digit($char)) return false;
      }
      return true;
   }

   public function addStreetsNamedWithNumber(array $streets, NumberedStreets $numberedStreets): array {
      $add = [];
      foreach ($streets as $street) {
         $alternateName = $this->generateAlternateNameForNumberedStreet($street, $numberedStreets);
         if (! empty($alternateName)) $add[] = $alternateName;
      }
      return array_merge($streets, $add);
   }

   public function addStreetTypeAbbreviations(array $streets, StreetTypes $st): array {
      $add = [];
      foreach ($streets as $street) {
         $words = Str::splitIntoTokens($street, ' ');
         ArrayHelper::append($add, $this->recursivelyAddAbbreviations($words, 1, $st));
      }
      return array_merge($streets, $add);
   }

   private function recursivelyAddAbbreviations(array &$words, int $wordNum, StreetTypes $st): array {
      if ($wordNum >= count($words))  return [];

      $add = [];
      $word = $words[$wordNum];
      if ( ! empty($variant = $st->getFullFromAbbrev($word))  ||
           ! empty($variant = $st->getAbbrevFromFull($word))) {
         $variantWords = $words;
         $variantWords[$wordNum] = $variant;
         $add[] = Str::join($variantWords, ' ');
         ArrayHelper::append($add, $this->recursivelyAddAbbreviations($variantWords, $wordNum+1, $st));
      }
      ArrayHelper::append($add, $this->recursivelyAddAbbreviations($words, $wordNum + 1, $st));
      return $add;
   }

   public function addStreetsWithRemovablePrefixes(array $streets): array {
      $add = [];
      foreach ($streets as $street) {
         foreach ($this->removablePrefixes as $prefix) {  // more efficient grabbing 1st word and checking against hash?
            if (Str::startsWith($street, $prefix)) {
               $add[] = Str::substringAfter($street, $prefix);
               break;
            }
         }
      }
      return array_merge($streets, $add);
   }

   public function hasRemovablePrefix(string $street): bool {
      $street = strtoupper($street);
      foreach ($this->removablePrefixes as $prefix) {  // more efficient grabbing 1st word and checking against hash?
         if (Str::startsWith($street, $prefix))  return true;
      }
      return false;
   }

   private function generateAlternateNameForNumberedStreet (string $street, NumberedStreets $numberedStreets): string {
      $tokens = Str::splitIntoTokens($street, " ");
      $tokenCount = count($tokens);
      for ($i=0;   $i<$tokenCount;   $i++) {
         $alternate = $numberedStreets->getAlternateNumberForm($tokens[$i]);
         if (!empty($alternate)) {
            $tokens[$i] = $alternate;
            return Str::join($tokens, " ");
         }
      }
      return "";
   }

   public function addNamesSplitByPrefixes(array $streets, PrefixNames $pn, StreetTypes $streetTypes): array {
      $add = [];
      foreach ($streets as $street) {
         $words = Str::splitIntoTokens($street, " ");

         // Exact match of prefix, followed by non-street-type: add both as single word (e.g. "NORTH POINT" => add "NORTHPOINT").
         if ($pn->isExactMatchForPrefix($words[0])) {
            if (count($words) > 1 &&  ! $streetTypes->isAbbrev($words[1])) {   // Some debate about whether 2nd clause should be included.  See unit-tests.
               $word0 = $words[0];
               array_shift($words);
               $add[] = $word0 . Str::join($words, " ");
            }
         }

         // If any prefix is initial substring of 1st word, then SPLIT the word, e.g. "NORTHPOINT" adds "NORTH POINT".
         else {
            $prefix = $pn->getPrefixThatIsInitialSubstringOf($words[0]);
            if (!empty($prefix)) {
               $rest = Str::substringAfter($street, $prefix);
               $add[] = $prefix . " " . $rest;
            }
         }
      }
      return array_merge($streets, $add);
   }
}
