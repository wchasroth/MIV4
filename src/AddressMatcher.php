<?php
declare(strict_types=1);

namespace CharlesRothDotNet\MIV4;

use CharlesRothDotNet\Alfred\AlfredPDO;
use CharlesRothDotNet\Alfred\Str;

class AddressMatcher {
   private AlfredPDO   $pdo;
   private StreetUtils $su;
   private int    $time0;
   private string $orderBy = 'name';
   private int    $maxRows;

   public function __construct(AlfredPDO $pdo, StreetUtils $su, string $orderBy, int $maxRows) {
      $this->pdo = $pdo;
      $this->su = $su;
      $this->time0   = hrtime(true);
      $this->orderBy = $orderBy;
      $this->maxRows = min($maxRows, 20);
   }

   public function match(int $number, ParsedAddress $address): array {
      $sql = "SELECT s.id, s.juris_code, s.low, s.high, s.street, s.zipcode, j.name, z.cityname, "
         . "         s.county_code, s.juris_code, s.sd_code, s.wardpct, s.village_code, s.congress, "
         . "         s.senate, s.house, s.commissioner "
         . "  FROM s4streetnames        AS n "
         . "  JOIN s4streets            AS s  ON (n.original = s.street) "
         . "  LEFT JOIN s4jurisdictions AS j  ON (j.id = s.juris_code) "
         . "  LEFT JOIN zip2city     AS z  ON (s.zipcode = z.zipcode) "  // Join to list of cities by zipcode, so we can match townships OR cities!
         . " WHERE n.name LIKE :street ";

      $street = strtoupper($address->getStreet());
      $street = AbbreviationHandler::simplify($street);
      $preparedFields = [':street' => $street . '%'];

      if ($number > 0) {
         $sql = $sql . " AND $number BETWEEN low AND high ";
         $side = ($number & 1 ? "('O', 'B')" : "('E', 'B')");
         $sql = $sql . " AND side in $side ";
      }

      if (!empty($address->getCity())) {
         $sql = $sql . " AND (j.name LIKE :jurisname  OR  z.cityname LIKE :jurisname) ";
         $preparedFields[':jurisname'] = $address->getCity() . '%';
      }

      if ($address->getZipLow() > 0)  $sql = $sql . " AND s.zipcode BETWEEN {$address->getZipLow()} AND {$address->getZipHigh()} ";

      // Dedup rows that have ALL of the same district-related codes.
      $sql = $sql . " GROUP BY county_code, juris_code, sd_code, wardpct, village_code, congress, senate, house, commissioner, zipcode ";
      $sql = $sql . " ORDER BY j.$this->orderBy ";
      $sql = $sql . " LIMIT " . strval($this->maxRows+1);

      $result = $this->pdo->run($sql, $preparedFields, true);

      $errorText = "";
      $errorCode = 0;
      if ($result->failed()) {
         $errorText = $result->getError();
         $errorCode = 1;
      }

      $rows = $result->getRows();
      $countRows = count($rows);
      if ($countRows > $this->maxRows) {
         unset($rows[$this->maxRows]);
         $countRows = count($rows);
         $errorText = "Too many rows";
         $errorCode = 2;
      }

      for ($i = 0;   $i < $countRows;   $i++) {
         if ($number > 0) $rows[$i]['num'] = $number;
         else {
            $low  = $rows[$i]['low'];
            $high = $rows[$i]['high'];

            if ($low == $high) $rows[$i]['num'] = $low;
            else               $rows[$i]['num'] = "{$rows[$i]['low']}-{$rows[$i]['high']}";
         }
      }

      $data = ['count' => $countRows, 'timems' => 0, 'errorCode' => $errorCode, 'errorText' => $errorText, 'sql' => $result->getRawSql(),
         'rows' => $rows];
      return $data;
   }

   public function repeatWithoutRemovablePrefix(int $number, ParsedAddress $addr, array $results): array {
      if (! $this->su->hasRemovablePrefix($addr->getStreet()))  return $results;

      $addressNoPrefix = Str::substringAfter($addr->getOriginal(), " ");
      $newAddress = new ParsedAddress($addressNoPrefix);
      return $this->match($number, $newAddress);
   }

   public function getElapsedTimeMs(): int {
      return intdiv((hrtime(true) - $this->time0), 1000000);
   }

   public function repeatAddingCommaWhereNeeded(int $number, ParsedAddress $address, StreetTypes $st, array $result): array {
      $words = Str::splitIntoTokens($address->getOriginal());
      $wordCount = count($words);
      for ($i=$wordCount-2;   $i > 0;   $i--) {   // Next to last thru 2nd word ONLY!
         $word = strtoupper($words[$i]);
         if ($this->su->isDirection($word)  ||  $st->isAStreetType($word)) {
            $words[$i] = $words[$i] . ",";
            $addressWithComma = new ParsedAddress(Str::join($words, ' '));
            return $this->match($number, $addressWithComma);
         }
      }
      return $result;
   }
}
