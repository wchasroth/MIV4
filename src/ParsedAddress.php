<?php
declare(strict_types=1);

namespace CharlesRothDotNet\MIV4;

use CharlesRothDotNet\Alfred\Str;

class ParsedAddress {
   private string $original;
   private string $street;
   private string $city = "";
   private int $ziplow  = 0;
   private int $ziphigh = 0;

   public function __construct(string $address) {
      $address = Str::replaceAll($address, "%",  " ");
      $address = Str::replaceAll($address, "\n", " ");
      $address = Str::replaceAll($address, "\n", " ");
      $this->original = $address;
      $this->street   = $address;

     if (preg_match("/[0-9]{5}$/", $address)) {    // ends in 5 digit zipcode
         $zip = substr($address, -5);
         $this->ziplow  = intval($zip);
         $this->ziphigh = $this->ziplow;
         $this->street = Str::substringBeforeLast($address, $zip);
         $this->street = trim($this->street, " ,\n\r\t\v\x00");  // Note comma!
      }
      else if (preg_match("/, *[0-9]+$/", $address)) {  // ends in comma, some number of digits -- start of zipcode.
         $this->street = trim(Str::substringBeforeLast($address, ","));
         $zip = intval(Str::substringAfterLast($address, ","));
         if      ($zip <    10)  { $this->ziplow = $zip * 10000;  $this->ziphigh = $this->ziplow + 9999; }
         else if ($zip <   100)  { $this->ziplow = $zip *  1000;  $this->ziphigh = $this->ziplow +  999; }
         else if ($zip <  1000)  { $this->ziplow = $zip *   100;  $this->ziphigh = $this->ziplow +   99; }
         else if ($zip < 10000)  { $this->ziplow = $zip *    10;  $this->ziphigh = $this->ziplow +    9; }
      }

      $this->street = $this->removeApartment($this->street);

      if (Str::contains($this->street, ",")) {         // Split off presumed city name from street name.
         $this->city   =      Str::substringAfter ($this->street, ",");
         $this->city   = trim(Str::replaceAll($this->city, ",", " "));
         $this->street = trim(Str::substringBefore($this->street, ","));
         if (preg_match("/ MI$/i", $this->city))  $this->city = substr($this->city, 0, -3);  // remove trailing "MI" from city.
      }

      $this->street = $this->removeMultipleSpaces         ($this->street);
      $this->street = $this->removeTrailingDotFromEachWord($this->street);
      $this->city   = $this->removeMultipleSpaces         ($this->city);
      $this->city   = $this->removeTrailingDotFromEachWord($this->city);
   }

   public function getOriginal(): string {
      return $this->original;
   }

   private function removeApartment(string $text): string {
      if (preg_match('/[ ,]Apt[ \.]/i', $text)) {
         $text = preg_replace('/, *Apt\.{0,1} *[0-9]+/i', ', ', $text, 1, $count);
         if ($count > 0)  return $text;
         $text = preg_replace( '/ +Apt\.{0,1} *[0-9]+/i', ' ',  $text, 1);
         return $text;
      }
      if (preg_match('/#/', $text)) {
         $text = preg_replace('/, *# *[0-9]+/', ', ', $text, 1, $count);
         if ($count > 0)  return $text;
         $text = preg_replace( '/ *# *[0-9]+/', ' ',  $text, 1);
         return $text;
      }
      return $text;
   }

   private function removeMultipleSpaces(string $text): string {
      return Str::contains($text, "  ")
           ? Str::join(Str::splitIntoTokens($text, " "), " ")
           : $text;
   }

   private function removeTrailingDotFromEachWord(string $text): string {
      if (! Str::contains($text, ".")) return $text;

      $words      = Str::splitIntoTokens($text, " ");
      $countWords = count($words);
      $changed    = false;
      for ($i=0;   $i < $countWords;   $i++) {
         $word = $words[$i];
         $len  = strlen($word);
         $pos  = Str::indexOf($word, '.');
         if ($pos == $len-1  &&  $len >= 2  &&  ctype_alpha($word[$len-2])) {  // Only 1 dot, at end, preceded by letter.
            $words[$i] = substr($word, 0, $len-1);
            $changed = true;
         }
      }

      return ($changed ? Str::join($words, ' ') : $text);
   }

   public function getStreet(): string {
      return $this->street;
   }

   public function getCity(): string {
      return $this->city;
   }

   public function getZipLow(): int {
      return $this->ziplow;
   }

   public function getZipHigh(): int {
      return $this->ziphigh;
   }

}
