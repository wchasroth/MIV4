<!DOCTYPE html>
{nocache}
<html lang="en">
<head>
   {include file="inc-head.tpl"}
   
   <script               src="share.js"></script>
   <script               src="mivoter02.js"></script>
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search02.js"></script>
</head>

<body onLoad="initialize();">

{include file="inc-topbar.tpl"}

<div class="darkBlueText pageText unindentList" style="margin-top: 0.8ex;">
<b>Voting FAQ</b><br/>
<br/>

   {include file="inc-vq-whoeligible.tpl"}
   {include file="inc-vq-student.tpl"}
   {include file="inc-vq-register.pl"}
   {include file="inc-vq-checkreg.tpl"}
   {include file="inc-vq-howlate.tpl"}
   {include file="inc-vq-getballot.tpl"}
   {include file="inc-vq-trackballot.tpl"}
   {include file="inc-vq-noarrive.tpl"}
   {include file="inc-vq-disability.tpl"}
   {include file="inc-vq-changevote.tpl"}
   {include file="inc-vq-emergency.tpl"}
   {include file="inc-vq-noid.tpl"}
</div>

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=true button=""}

</body>
</html>
{/nocache}
