<!DOCTYPE html>
{nocache}
<html lang="en">

<head>
   {include file="inc-head.tpl"}

   <script               src="share.js"></script>
   <script               src="mivoter02.js"></script>
   <script               src="parseHouseStreet.js"></script>
</head>

<body onLoad="initialize();">

{include file="inc-topbar.tpl"}

<div class="darkBlueText pageText unindentList" style="margin-top: 0.8ex;">
   {if $hasAddress && count($rows) > 0}
      <b>Drop Boxes</b>

      <p/>
      You can return your filled-in absentee ballot at any of these 
      secured drop-boxes.&nbsp;

      <ol>
         {foreach from=$rows item=row}
            <li><a href="https://maps.google.com/maps?q={$row['map']}" target="_blank"
                >{$row['address']}</a><br/>
                {if $row['hours'] == '24'} 
                   (24/7)&nbsp;
                {else} 
                   {$row['hours']}<br/>
                {/if}
                {$row['directions']}
            </li>
         {/foreach}
      </ol>
     
      <!--
         county={$county}, juris={$juris}, ward={$ward}, pct={$pct}<br/>
       -->
   {elseif $hasAddress}
      <b>Drop Boxes</b>
      <p/>
      Sorry, we could not find any drop-boxes in your area.
      <p/>
      You can also check the Secretary of State‘s website, under
         "<a href="https://mvic.sos.state.mi.us/Voter/Index/#yourclerk" target="_blank">Search for your city/township clerk</a>".


   {else}
      <b>Drop Boxes</b>
      <p/>
      Please enter your address above, so that we can find the drop-boxes
      in your area.

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
