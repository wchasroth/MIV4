<?php
declare(strict_types=1);

namespace CharlesRothDotNet\MIV4;

use CharlesRothDotNet\Alfred\AlfredPDO;
use CharlesRothDotNet\Alfred\DumbFileLogger;
use CharlesRothDotNet\Alfred\SqlFields;
use CharlesRothDotNet\Alfred\IpAddress;
use CharlesRothDotNet\Alfred\Str;

class VoterLog {
   private AlfredPDO      $pdo;
   private DumbFileLogger $logger;

   function __construct(AlfredPDO $pdo, DumbFileLogger $logger) {
      $this->pdo = $pdo;
      $this->logger = $logger;
   }

   public function write(string $sessionId, string $pageCode, array $miCodes): void {
      $now = date('Y-m-d H:i:s');
      $ipAddress = new IpAddress();
      $sqlFields = new SqlFields(['sessionId' => $sessionId, 'timestamp' => $now, 'page' => $pageCode,
         'county'     => $miCodes['county_code']  ?? 0,
         'juris_code' => $miCodes['juris_code']   ?? 0,
         'zip'        => $miCodes['zipcode']      ?? 0,
         'wardpct'    => $miCodes['wardpct']      ?? '',
         'referer'    => $this->getReferer(),
         'ip'         => $ipAddress->getIp(),
         'ip_method'  => $ipAddress->getMethod(),
      ]);
      $result = $this->pdo->runSF("INSERT INTO v4voter_log", "", $sqlFields, true);
      if ($result->failed()) $this->logger->log("VoterLog: " . $result->getError());
   }

   private function getReferer() {
      $referer = $_SERVER['HTTP_REFERER'] ?? '';
      if (Str::contains($referer, 'mivoter.org')) $referer = '';
      return $referer;
   }

}
//new_addr     char(1)
//hash_addr    char(64)
//pageargs     varchar(40)
