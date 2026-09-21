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
   {$ui->get('pg-info-reg1')}
 
   {if $hasAddress}
      {$ui->get('pg-info-reg2')|dollarDollar:$clerkJurisdiction}
   {else}
      {$ui->get('pg-info-reg2-noaddr')}
   {/if}

   <p/>
   {$ui->get('pg-info-reg3')}

      {include file="inc-vq-whoeligible.tpl"}
      {include file="inc-vq-student.tpl"}
      {include file="inc-vq-register.pl"}
      {include file="inc-vq-checkreg.tpl"}
      {include file="inc-vq-howlate.tpl"}
      {include file="inc-vq-disability.tpl"}
  
</div>

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=$hasAddress button=""}

</body>
</html>
{/nocache}
