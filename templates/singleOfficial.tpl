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

<body style="font-family: Roboto;" onLoad="initialize();">

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

<table width="100%" cellspacing="0" cellpadding="0">
    <tr class="zebra" valign="top"><td>Address</td> <td>{$address}</td></tr>
    <tr class="zebra" valign="top"><td>Phone</td>   <td><a href="tel:{$phone}">{$phone}</a></td></tr>
    <tr class="zebra" valign="top"><td>Email</td>   <td><a href="mailto:{$email}" target="_blank">{$email}</a></td></tr>
    <tr class="zebra" valign="top"><td>Web</td>   <td><a href="{$url}">{$web}</a></td></tr>
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
