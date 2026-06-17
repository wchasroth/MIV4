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
   private string         $addressHashSalt;

   function __construct(AlfredPDO $pdo, DumbFileLogger $logger, string $addressHashSalt) {
      $this->pdo             = $pdo;
      $this->logger          = $logger;
      $this->addressHashSalt = $addressHashSalt;
   }

   public function write(string $sessionId, string $pageCode, array $miCodes, string $fullAddress): void {
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
         'hash_addr'  => $this->getHash($fullAddress)
      ]);
      $result = $this->pdo->runSF("INSERT INTO v4voter_log", "", $sqlFields, true);
      if ($result->failed()) $this->logger->log("VoterLog: " . $result->getError());
   }

   private function getReferer() {
      $referer = $_SERVER['HTTP_REFERER'] ?? '';
      if (Str::contains($referer, 'mivoter.org')) $referer = '';
      return $referer;
   }

   private function getHash(string $text): string {
      return (empty($text) ? "" : hash('sha256', $text . $this->addressHashSalt));
   }

}
//pageargs     varchar(40)

// ----DONE----
// B ballot (endorsed)
// H   home (both)

// C county display
// D display uitext pages
// F   faq
// I   info (any/all?)
// M
// O   official
// P   protests
