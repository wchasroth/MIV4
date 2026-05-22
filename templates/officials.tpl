<!DOCTYPE html>
{nocache}
<html lang="en">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<meta        name="description" content="Find your Michigan Democratically-endorsed candidates" />
<meta property="og:description" content="Find your Michigan Democratically-endorsed candidates" />

<title>MIVoter</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto">
<link rel="stylesheet" href="mivoter.css">

<head>
    <script               src="parseHouseStreet.js"></script>
    <script type="module" src="address-search02.js"></script>
    <script>
        function flip(id, obj) {
           panel = document.getElementById(id);
           if (panel.style.display === "block")  panel.style.display = "none";
           else {
               allPanels = document.getElementsByClassName('panel');
               for (const eachPanel of allPanels)  eachPanel.style.display = "none";
               panel.style.display = "block";
           }
        }
   </script>
    <style>
       .accordion {
          background-color: #eee;
          color: #444;
          cursor: pointer;
          padding: 18px;
          width: 100%;
          text-align: left;
          border: none;
          outline: none;
          transition: 0.4s;
          font-size: 120%;
       }
       .accordion:after {
           /* content: '\02795';*/ /* Unicode character for "plus" sign (+) */
           content: '\02228';   /* &#8964 */
           font-size: 23px;
           color: #777;
           float: right;
           margin-left: 5px;
       }

       .active:after {
           content: '\02227'
       }

       /* Add a background color to the button if it is clicked on (add the .active class with JS), and when you move the mouse over it (hover) */
       .active, .accordion:hover {
          background-color: #ccc;
       }

       /* Style the accordion panel. Note: hidden by default */
       .panel {
          padding: 0 18px;
          background-color: white;
          display: none;
          overflow: hidden;
       }
       .noUnderline { text-decoration: none; }
       .back0 { }
       .back1 { background-color: #f2f2f2; }
       a, a:visited { color: blue; }
   </style>
</head>

<body style="font-family: Roboto;">

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

{include file="inc-bottombuttons.tpl" hasAddress=true}

</body>
</html>
{/nocache}
