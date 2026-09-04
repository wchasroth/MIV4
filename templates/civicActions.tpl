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
<b {if $editor} title='pg-civic-hdr' {/if}>{$ui->get('pg-civic-hdr')}</b>

<p/>
   <div {if $editor} title='pg-civic-defend' {/if}>
   {$ui->get('pg-civic-defend')}
   </div>

   <div {if $editor} title='pg-civic-support' {/if} >
   {$ui->get('pg-civic-support')}
   </div>
  
</div>

<p>&nbsp;</p>
<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress={$hasAddress} button="civic"}

</body>
</html>
{/nocache}
