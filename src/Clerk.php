<?php

namespace CharlesRothDotNet\MIV4;

use CharlesRothDotNet\Alfred\AlfredPDO;
use CharlesRothDotNet\Alfred\DumbFileLogger;

class Clerk {

   public static function getClerkInfo(AlfredPDO $pdo, int $countyId, int $jurisCode, DumbFileLogger $logger): array {
      $countyClause = ($countyId > 0 ? "county_code=$countyId AND " : "");
      $sql = "SELECT * FROM s4clerks WHERE $countyClause juris_code=$jurisCode";
      $result = $pdo->run($sql);
      if ($result->failed()  ||  $result->getRowCount() == 0) {
         if ($countyId > 0)  return self::getClerkInfo($pdo, 0, $jurisCode, $logger);

         $clerk = [];
         $fields = ['name', 'street_address', 'mailing_address', 'phone', 'fax', 'email', 'hours',
            'election_date', 'pre_hours', 'place_id', 'lat', 'lng', 'jurisdiction'];
         foreach ($fields as $field)  $clerk[$field] = '';
         return $clerk;
      }

      $clerk = $result->getRows()[0];
      $clerk['jurisdiction'] = self::getJurisdictionName($pdo, $jurisCode);
      return $clerk;
   }

   public static function getJurisdictionName (AlfredPDO $pdo, int $jurisCode): string {
      $sql = "SELECT name FROM s4jurisdictions WHERE id=$jurisCode";
      $result = $pdo->run($sql);
      return ($result->succeeded()  &&  $result->getRowCount() > 0)
         ? trim($result->getRows()[0]['name'])
         : '';
   }
}