<!DOCTYPE html>
{nocache}
<html lang="en">
<head>
   <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   
   <meta        name="description" content="Find your Michigan Democratically-endorsed candidates" />
   <meta property="og:description" content="Find your Michigan Democratically-endorsed candidates" />
   
   <title>MIVoter</title>
   
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto">
   <link rel="stylesheet" href="mivoter.css">

   <script               src="share.js"></script>
   <script               src="mivoter.js"></script>
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search02.js"></script>
</head>

<body style="font-family: Roboto;" onLoad="initialize();">

{include file="inc-topbar.tpl"}

<p style="font-size: 10%;">&nbsp;</p>

<div class="darkBlueText pageText unindentList">

{include file="inc-official-block.tpl" block="0natl"  title="National" rows=$blocks['0natl']}
{include file="inc-official-block.tpl" block="1state" title="State"    rows=$blocks['1state']}
{include file="inc-official-block.tpl" block="2cnty"  title=$titles['2cnty']   rows=$blocks['2cnty']}
{include file="inc-official-block.tpl" block="4juris" title=$titles['4juris']   rows=$blocks['4juris']}
{if $hasVillage}
   {include file="inc-official-block.tpl" block="5vill"  title=$titles['5vill']    rows=$blocks['5vill']}
{/if}
{include file="inc-official-block.tpl" block="6schl" title=$titles['6schl']     rows=$blocks['6schl']}
{include file="inc-official-block.tpl" block="7court" title="Courts"   rows=$blocks['7court']}
{include file="inc-official-block.tpl" block="8univ" title="Universities"   rows=$blocks['8univ']}

{foreach from=$colleges item=college}
   {include file="inc-official-block.tpl" block=$college['id'] title=$college['name']   rows=$college['rows']}
{/foreach}
</div>


<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=true button="officials_td"}

</body>
</html>
{/nocache}
