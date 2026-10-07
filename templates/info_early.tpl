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
      {$ui->get('pg-info-early') }

      <ol>
         {foreach from=$rows item=row}
            <li><a href="https://maps.google.com/maps?q={$row['map']}" target="_blank"
                >{$row['address']}</a><br/>
                {if $row['hours'] == '24'} 
                   (24/7)&nbsp;
                {else} 
                   {$row['hours']}<br/>
                {/if}
            </li>
         {/foreach}
      </ol>
     
      <!--
         county={$county}, juris={$juris}, ward={$ward}, pct={$pct}<br/>
       -->

   {elseif $hasAddress}
      <b>Early Voting Sites</b>
      <p/>
      Sorry, we could not find any early-voting sites in your area.
      <p/>
      You can also check the Secretary of State‘s website, under
         "<a href="https://mvic.sos.state.mi.us/Voter/Index#early-voting-search-section" target="_blank"
               >Search for your polling locations</a>".


   {else}
      {$ui->get('pg-info-early-noaddr') }

   {/if}

</div>

  
<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=$hasAddress}

</body>
</html>
{/nocache}
