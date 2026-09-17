<?php
declare(strict_types=1);

namespace CharlesRothDotNet\MIV4;

class MiCodesDecoder {
   private static array $numericFields = ['id', 'juris_code', 'low', 'high', 'county_code',
      'sd_code', 'village_code', 'congress', 'senate', 'house', 'commissioner', 'num'];

   public static function decode(string $miCodes): array {
      $codes = json_decode(trim($miCodes), true);
      foreach (self::$numericFields as $field) $codes[$field] = intval($codes[$field] ?? "");
      return $codes;
   }

//     [id] => 11182
// [juris_code] => 3000
// [low] => 2600
// [high] => 2899
// [street] => LILLIAN RD
// [zipcode] => 48104
// [name] => Ann Arbor City
// [cityname] => Ann Arbor
// [county_code] => 81
// [sd_code] => 2820
// [wardpct] => 3029
// [village_code] => 0
// [congress] => 6
// [senate] => 15
// [house] => 33
// [commissioner] => 7
// [num] => 2630 )
}