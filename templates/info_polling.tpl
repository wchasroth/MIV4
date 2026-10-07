<!DOCTYPE html>
{nocache}
<html lang="en">

<head>
   {include file="inc-head.tpl"}

   <script               src="share.js"></script>
   <script               src="mivoter02.js"></script>
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search04.js"></script>
</head>

<body onLoad="initialize();">

{include file="inc-topbar.tpl"}

<div class="darkBlueText pageText unindentList" style="margin-top: 0.8ex;">
   {if $hasAddress && count($rows) > 0}
      {$ui->get('pg-info-polling')}

      <ol>
         {foreach from=$rows item=row}
            <li>{$row['location']}<br/>
                <a href="https://maps.google.com/maps?q={$row['map']}" target="_blank"
                   >{$row['address']}</a><br/>
            </li>
         {/foreach}
      </ol>

   {elseif $hasAddress}
      {$ui->get('pg-info-polling-nopoll')}

   {else}
      {$ui->get('pg-info-polling-noaddr')}

   {/if}

</div>

  
<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=$hasAddress}

</body>
</html>
{/nocache}
