<?php
declare(strict_types=1);

namespace CharlesRothDotNet\MIV4;

use CharlesRothDotNet\Alfred\AlfredPDO;
use CharlesRothDotNet\Alfred\DumbFileLogger;
use CharlesRothDotNet\Alfred\Str;

class Uitext {

   private array  $key2text = [];
   private string $lang;

   function __construct(AlfredPDO $pdo, DumbFileLogger $logger, string $lang, string ... $keys) {
      $lang  = (!empty($lang) ? "-$lang" : "");
      $likes = [];
      $ins   = [];
      foreach ($keys as $key) {
         if (Str::endsWith($key, '%'))  $likes[] = "id LIKE '$key$lang'";
         else                           $ins[]   = "'$key$lang'";
      }
      $inClause   = (count($ins) > 0 ? "id IN (" . Str::join($ins, ', ') . ")" : "");
      $likeClause = Str::join($likes, ' OR ');
      $combine    = (! empty($inClause)  &&  ! empty($likeClause) ? ' OR ' : '');

      $sql = "SELECT id, text FROM v4uitext WHERE $inClause $combine $likeClause";
//    $logger->log("Uitext SQL: " . $sql);
      $result = $pdo->run($sql);
      foreach ($result->getRows() as $row) $this->key2text[$row['id']] = $row['text'];
      $this->lang = $lang;
   }

   public function get(string $key): string {
      return $this->key2text[$key . $this->lang] ?? " (no value for '$key$this->lang') ";
   }

}