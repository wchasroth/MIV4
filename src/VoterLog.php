<?php
declare(strict_types=1);

namespace CharlesRothDotNet\MIV4;

use CharlesRothDotNet\Alfred\AlfredPDO;
use CharlesRothDotNet\Alfred\SqlFields;
use CharlesRothDotNet\Alfred\IpAddress;
use CharlesRothDotNet\Alfred\Str;

class VoterLog {
   public static function write(AlfredPDO $pdo, string $sessionId, string $pageCode, array $miCodes): void {
      $now = date('Y-m-d H:i:s');
      $ipAddress = new IpAddress();
      $sqlFields = new SqlFields(['sessionId' => $sessionId, 'timestamp' => $now, 'page' => $pageCode,
         'county'     => $miCodes['county_code']  ?? 0,
         'juris_code' => $miCodes['juris_code']   ?? 0,
         'zip'        => $miCodes['zipcode']      ?? 0,
         'wardpct'    => $miCodes['wardpct']      ?? '',
         'referer'    => self::getReferer(),
         'ip'         => $ipAddress->getIp(),
         'ip_method'  => $ipAddress->getMethod(),
      ]);
      $pdo->runSF("INSERT INTO v4voter_log", "", $sqlFields, true);
   }

   private static function getReferer() {
      $referer = $_SERVER['HTTP_REFERER'] ?? '';
      if (Str::contains($referer, 'mivoter.org')) $referer = '';
      return $referer;
   }

}
//new_addr     char(1)
//hash_addr    char(64)
//pageargs     varchar(40)
