<?php
declare(strict_types=1);

namespace CharlesRothDotNet\MIV4;

use CharlesRothDotNet\Alfred\Str;

class StreetTypes {
   private array $fullToAbbrevs = [];
   private array $abbrevsToFull = [
      'AVE'  => 'AVENUE',
      'BLF'  => 'BLUFF',
      'BLFS' => 'BUFFS',
      'BLVD' => 'BOULEVARD',
      'BND'  => 'BEND',
      'BR'   => 'BRANCH',
      'BRG'  => 'BRIDGE',
      'BRK'  => 'BROOK',
      'CB'   => 'CLUB',
      'CIR'  => 'CIRCLE',
      'CL'   => 'CLOSE',
      'CLB'  => 'CLUB',
      'CMNS' => 'COMMONS',
      'CN'   => 'CENTER',
      'COR'  => 'CORNER',
      'CORS' => 'CORNERS',
      'CP'   => 'CAMP',
      'CRES' => 'CRESCENT',
      'CRK'  => 'CREEK',
      'CRST' => 'CREST',
      'CSWY' => 'CAUSEWAY',
      'CT'   => 'COURT',
      'CTR'  => 'CENTER',
      'CU'   => 'CURVE',
      'CV'   => 'COVE',
      'CYN'  => 'CANYON',
      'DR'   => 'DRIVE',
      'EXT'  => 'EXTENSION',
      'FD'   => 'FORD',
      'FLDS' => 'FIELDS',
      'FRK'  => 'FORK',
      'FRST' => 'FOREST',
      'FW'   => 'FREEWAY',
      'FWY'  => 'FREEWAY',
      'GDNS' => 'GARDENS',
      'GLN'  => 'GLEN',
      'GRN'  => 'GREEN',
      'GRV'  => 'GROVE',
      'GTWY' => 'GATEWAY',
      'HBR'  => 'HARBOR',
      'HL'   => 'HILL',
      'HLS'  => 'HILLS',
      'HTS'  => 'HEIGHTS',
      'HVN'  => 'HAVEN',
      'HWY'  => 'HIGHWAY',
      'JCT'  => 'JUNCTION',
      'KNL'  => 'KNOLL',
      'KNLS' => 'KNOLLS',
      'LDG'  => 'LODGE',
      'LK'   => 'LAKE',
      'LN'   => 'LANE',
      'LNDG' => 'LANDING',
      'MDW'  => 'MEADOW',
      'MDWS' => 'MEADOWS',
      'MI'   => 'MILE',
      'ML'   => 'MILL',
      'MNR'  => 'MANOR',
      'MT'   => 'MOUNT',
      'MTN'  => 'MOUNTAIN',
      'NB'   => 'NORTHBOUND',
      'PC'   => 'PLACE',
      'PKWY' => 'PARKWAY',
      'PL'   => 'PLACE',
      'PLNS' => 'PLAINS',
      'PLZ'  => 'PLAZA',
      'PNE'  => 'PINE',
      'PNES' => 'PINES',
      'PRT'  => 'PORT',
      'PS'   => 'PASS',
      'PSGE' => 'PASSAGE',
      'PT'   => 'POINT',
      'PTH'  => 'PATH',
      'RD'   => 'ROAD',
      'RDG'  => 'RIDGE',
      'RIV'  => 'RIVER',
      'RT'   => 'ROUTE',
      'RTE'  => 'ROUTE',
      'SA'   => 'STATION',
      'SHL'  => 'SHOAL',
      'SHR'  => 'SHORE',
      'SHRS' => 'SHORES',
      'SK'   => 'SKYWAY',
      'SM'   => 'STREAM',
      'SMT'  => 'SUMMIT',
      'SO'   => 'SOUTH',
      'SPG'  => 'SPRING',
      'SPGS' => 'SPRINGS',
      'SQ'   => 'SQUARE',
      'ST'   => 'STREET',
      'STA'  => 'STATION',
      'STRM' => 'STREAM',
      'TER'  => 'TERRACE',
      'TRAK' => 'TRACK',
      'TRCE' => 'TRACE',
      'TRL'  => 'TRAIL',
      'TRLR' => 'TRAILER',
      'VIS'  => 'VISTA',
      'VLG'  => 'VILLAGE',
      'VLY'  => 'VALLEY',
      'VW'   => 'VIEW',
      'XING' => 'CROSSING'
   ];

   function __construct() {
      $this->fullToAbbrevs = array_flip($this->abbrevsToFull);
   }

   public function isAbbrev(string $abbrev): bool {
      return isset($this->abbrevsToFull[$abbrev]);
   }

   public function isFull(string $fullName): bool {
      return isset($this->fullToAbbrevs[$fullName]);
   }

   public function isAStreetType(string $text): bool {
      return $this->isAbbrev($text) || $this->isFull($text);
   }

   public function getFullFromAbbrev(string $abbrev): string {
      return $this->abbrevsToFull[$abbrev] ?? "";
   }

   public function getAbbrevFromFull(string $fullName): string {
      return $this->fullToAbbrevs[$fullName] ?? "";
   }

}
