<?php

namespace CharlesRothDotNet\MIV4;

use CharlesRothDotNet\Alfred\AlfredPDO;

class Clerk {

   public static function getClerkArray(AlfredPDO $pdo, int $countyId, int $jurisCode): array {
      $sql = "SELECT * FROM s4clerks WHERE county_code=$countyId AND juris_code=$jurisCode";
      $result = $pdo->run($sql);
      if ($result->failed()  ||  $result->getRowCount() == 0) {
         $clerk = [];
         $fields = ['name', 'street_address', 'mailing_address', 'phone', 'fax', 'email', 'hours',
            'election_date', 'pre_hours', 'place_id', 'lat', 'lng', 'county', 'jurisdiction'];
         foreach ($fields as $field)  $empty[$field] = '';
         return $clerk;
      }

      $clerk = $result->getRows()[0];

      $sql = "SELECT name FROM s4counties WHERE id=$countyId";
      $result = $pdo->run($sql);
      $clerk['county'] = $result->getRows()[0]['name'];

      $sql = "SELECT name FROM s4jurisdictions WHERE id=$jurisCode";
      $result = $pdo->run($sql);
      $clerk['jurisdiction'] = $result->getRows()[0]['name'];
      return $clerk;
   }
}