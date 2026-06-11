<?php

namespace CharlesRothDotNet\MIV4;

use CharlesRothDotNet\Alfred\AlfredPDO;

class Clerk {

   public static function getClerkInfo(AlfredPDO $pdo, int $countyId, int $jurisCode): array {
      $sql = "SELECT * FROM s4clerks WHERE county_code=$countyId AND juris_code=$jurisCode";
      $result = $pdo->run($sql);
      if ($result->failed()  ||  $result->getRowCount() == 0) {
         $clerk = [];
         $fields = ['name', 'street_address', 'mailing_address', 'phone', 'fax', 'email', 'hours',
            'election_date', 'pre_hours', 'place_id', 'lat', 'lng'];
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