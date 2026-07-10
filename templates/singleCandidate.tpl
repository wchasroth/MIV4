<!DOCTYPE html>
{nocache}
<html lang="en">
<head>
   {include file="inc-head.tpl"}

   <script               src="mivoter02.js"></script>
   <script               src="share.js"></script>
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search02.js"></script>

   <style>
       tr:nth-child(odd of .zebra) { background-color: #f2f2f2;}
       td {
          padding: .4em;
       }
       a { text-decoration: none; }
       a, a:visited { color: blue; }
    </style>
</head>

<body onLoad="initialize();">

<div class="darkBlueText pageText unindentList" style="max-width: 30em;">

<table width="100%" style="font-size: 120%;">
    <tr valign="top">
        <td><a href="{$web}">{$name}</a><br>{$title}<br/><br/>
            <button class="roundButton" onClick="window.history.back();">Back</button>
        </td>
        <td align="right"><img src="{$photoBase}/{$headshot}" width="150"/></td>
    </tr>
    </tr>
</table>

{$description}

</div>



<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

{include file="inc-bottombuttons.tpl" hasAddress=true}

</body>
</html>
{/nocache}
