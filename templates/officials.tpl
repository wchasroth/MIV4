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

{include file="inc-official-block.tpl" block="0natl"  title="{$ui->get('pg-official-natl')}" rows=$blocks['0natl']}
{include file="inc-official-block.tpl" block="1state" title="{$ui->get('pg-official-state')}"    rows=$blocks['1state']}
{include file="inc-official-block.tpl" block="2cnty"  title=$titles['2cnty']   rows=$blocks['2cnty']}
{include file="inc-official-block.tpl" block="4juris" title=$titles['4juris']   rows=$blocks['4juris']}
{if $hasVillage}
   {include file="inc-official-block.tpl" block="5vill"  title=$titles['5vill']    rows=$blocks['5vill']}
{/if}
{include file="inc-official-block.tpl" block="6schl" title=$titles['6schl']     rows=$blocks['6schl']}
{include file="inc-official-block.tpl" block="7court" title="{$ui->get('pg-official-courts')}"   rows=$blocks['7court']}
{include file="inc-official-block.tpl" block="8univ" title="{$ui->get('pg-official-univ')}"   rows=$blocks['8univ']}

{foreach from=$colleges item=college}
   {include file="inc-official-block.tpl" block=$college['id'] title=$college['name']   rows=$college['rows']}
{/foreach}
</div>


<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=true button="officials"}

</body>
</html>
{/nocache}
