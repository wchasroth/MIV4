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
       .urlColumn {
           /* max-width: 75%; */
           width: 80%;
           word-break: break-all;
       }
    </style>
</head>

<body onLoad="initialize();">

<div class="darkBlueText pageText unindentList" style="max-width: 30em;">

<table width="100%" style="font-size: 120%;">
    <tr valign="top">
        <td>{$name}<br>{$title} {$party}<br/><br/>
            <button class='roundButton' onClick="window.history.back();">Back</button>
        </td>
        <td align="right"><img src="{$headshot}" width="150"/></td>
    </tr>
    </tr>
</table>

<table cellspacing="0" cellpadding="0">
    <tr class="zebra" valign="top"><td>Address</td> <td>{$address}</td></tr>
    <tr class="zebra" valign="top"><td>Phone</td>   <td class="urlColumn"><a href="tel:{$phone}">{$phone}</a></td></tr>
    <tr class="zebra" valign="top"><td>Email</td>   <td class="urlColumn"><a href="mailto:{$email}"
                   onClick="return externalLink();" target="_blank"
            >{$email}</a></td></tr>
    <tr class="zebra" valign="top"><td>Web</td>   <td class="urlColumn"><a href="{$url}"
                   onClick="return externalLink();" target="_blank"
           >{$web}</a></td></tr>
    <tr class="zebra" valign="top"><td colspan="2" style="font-size: 90%;">
        Please use the contact information above for matters related to official businesss.&nbsp;
        Note that elected officers are prohibited from communicating about their campaign
        or candidacy through tax-payer-funded official emails or office calls.
    </td></tr>

</table>
</div>



<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

{include file="inc-bottombuttons.tpl" hasAddress=true}

</body>
</html>
{/nocache}
