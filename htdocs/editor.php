<?php
declare(strict_types=1);

require_once("../vendor/autoload.php");

date_default_timezone_set('America/New_York');

setcookie("editor", "1", time() + (7 * 24 * 3600));
header   ("Location: index.php");
