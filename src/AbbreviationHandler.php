<?php
declare(strict_types=1);

namespace CharlesRothDotNet\MIV4;

use CharlesRothDotNet\Alfred\Str;

class AbbreviationHandler {

   public static function simplify(string $street): string {
      if (! Str::contains($street, '.'))  return $street;

      $words   = Str::splitIntoTokens($street, ' ');
      $count   = count($words);
      $changed = false;
      for ($i=0;   $i<$count;   $i++) {
         $word = $words[$i];
         if      ($word == "ST.")  return self::reassemble($words, $i, "ST");
         else if ($word == "U.S.") return self::reassemble($words, $i, "US");
         else if ($word == "R.R.") return self::reassemble($words, $i, "RR");
      }
      return $street;
   }

   private static function reassemble(array &$words, int $i, string $newValue): string {
      $words[$i] = $newValue;
      return Str::join($words, " ");
   }

   public static function fixAbbrevsThatShouldBeCapitalized(string $street): string {
      $words = Str::splitIntoTokens($street, ' ');
      $count = count($words);
      $changed = $count;
      for ($i=0;   $i<$count;   $i++) {
         $word = $words[$i];
         if (Str::startsWith($word, "Us")  &&  strlen($word) > 2  &&  ctype_digit($word[2])) {
            $words[$i] = "US" . substr($word, 2);
         }
         else if ($word == "Us")    $words[$i] = "US";
         else if ($word == "Ne")    $words[$i] = "NE";
         else if ($word == "Nw")    $words[$i] = "NW";
         else if ($word == "Se")    $words[$i] = "SE";
         else if ($word == "Sw")    $words[$i] = "SW";
         else if ($word == "Mi")    $words[$i] = "MI";
         else if ($word == "Po")    $words[$i] = "PO";
         else if ($word == "Rr")    $words[$i] = "RR";
         else if ($word == "Usfs")  $words[$i] = "USFS";
         else --$changed;
      }

      return ($changed > 0  ?  Str::join($words, ' ')  :  $street);
   }
}
