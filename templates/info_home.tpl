<!DOCTYPE html>
{nocache}
<html lang="en">

<head>
   {include file="inc-head.tpl"}

   <script               src="share.js"></script>
   <script               src="mivoter02.js"></script>
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search03.js"></script>
</head>

<body onLoad="initialize();">

{include file="inc-topbar.tpl"}

<div class="darkBlueText pageText unindentList" style="margin-top: 0.8ex;">
   {if $hasAddress}
      {$ui->get('pg-info-home-1')|dollarDollar:$clerkJurisdiction}
      {$ui->get('pg-info-home-2')}
   {else}
      {$ui->get('pg-info-home-1-noaddr')}
      {$ui->get('pg-info-home-2-noaddr')}
   {/if}

   {$ui->get('pg-info-home-3')}

      {include file="inc-vq-whoeligible.tpl"}
      {include file="inc-vq-student.tpl"}
      {include file="inc-vq-getballot.tpl"}
      {include file="inc-vq-concerned.tpl"}
      {include file="inc-vq-trackballot.tpl"}
      {include file="inc-vq-noarrive.tpl"}
      {include file="inc-vq-disability.tpl"}
      {include file="inc-vq-changevote.tpl"}
      {include file="inc-vq-emergency.tpl"}
      {include file="inc-vq-noid.tpl"}

</div>

  
<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=$hasAddress}

</body>
</html>
{/nocache}
