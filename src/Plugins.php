<?php
declare(strict_types=1);

namespace CharlesRothDotNet\MIV4;

use CharlesRothDotNet\Alfred\Str;

class Plugins {
   public static function fixCase(string $text): string {
      if (strtoupper($text) !== $text)  return $text;
      return ucwords(strtolower($text));
   }

   public static function addProtocol (string $url): string {
      if (empty($url))                     return "";
      if (Str::startsWith($url, "http"))   return $url;
      if (Str::startsWith($url, "mailto")) return $url;
      if (Str::contains($url, "@"))        return "mailto:$url";
      return "https://$url";
   }

   public static function stripProtocol(string $url): string {
      if (Str::startsWith($url, "mailto:"))             return Str::substringAfter($url, "mailto:");

      if (! Str::startsWith(strtolower($url), "http"))  return $url;
      if (! Str::contains($url, "://"))                 return $url;
      return Str::substringAfter($url, "://");
   }
}
