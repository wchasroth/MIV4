<!DOCTYPE html>
{nocache}
<html lang="en">
<head>
   {include file="inc-head.tpl"}

   <script               src="mivoter02.js"></script>
   <script               src="share.js"></script>
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search03.js"></script>

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
        <td><a href="{$web}"
                   onClick="return externalLink(this);" target="_blank"
                   title="Candidate's website"
            >{$name} 
               <svg xmlns="http://w3.org" width="1em" viewBox="0 0 24 24" fill="none" 
                  stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"></path>
                  <polyline points="15 3 21 3 21 9"></polyline>
                  <line x1="10" y1="14" x2="21" y2="3"></line>
               </svg>
            </a><br>{$title}<br/><br/>
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
