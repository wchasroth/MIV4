<?php
declare(strict_types=1);

namespace CharlesRothDotNet\MIV4;

class Utils {
   public static function phoneDigits(string $phone): string {
      return preg_replace('/[^0-9]/', '', $phone);
   }

}