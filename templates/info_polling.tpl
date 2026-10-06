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
      <b>Your Election Day Polling Place(s)</b>

      <ol>
         {foreach from=$rows item=row}
            <li>{$row['location']}<br/>
                <a href="https://maps.google.com/maps?q={$row['map']}" target="_blank"
                   >{$row['address']}</a><br/>
            </li>
         {/foreach}
      </ol>
     
      <!--
         county={$county}, juris={$juris}, ward={$ward}, pct={$pct}<br/>
       -->
   {elseif $hasAddress}
      <b>Your Election Day Polling Place(s)</b>
      <p/>
      Sorry, we could not your local polling place.
      <p/>
      You can also check the Secretary of State‘s website, under
         "<a href="https://mvic.sos.state.mi.us/Voter/Index#early-voting-search-section">Search for your polling locations</a>".


   {else}
      <b>Your Election Day Polling Place(s)</b>
      <p/>
      Please enter your address above, so that we can find your polling place.

      <p/>
      <i style="font-size: 90%;">(We <b>never</b> save your address.&nbsp; Only your browser remembers it.)</i>
   {/if}

</div>

  
<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=$hasAddress}

</body>
</html>
{/nocache}
