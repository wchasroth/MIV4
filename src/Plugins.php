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

   public static function shortDate(string $date): string {
      return $date;
   }

   public static function safe(string $text): string {
      return $text;
   }

   public static function showCounty(string $county): string {
      return $county;
   }

   public static function emailLinks(string $emails): string {
      return $emails;
   }

   public static function hyperLinks(string $links): string {
      return $links;
   }

   public static function splitComma(string $words): string {
      return $words;
   }

   public static function showWithPrefix(string $text, string $prefix): string {
      return $prefix . ":" . $text;
   }
}
