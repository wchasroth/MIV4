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
    <style>
       tr:nth-child(odd of .zebra) { background-color: #f2f2f2;}
       td {
          padding: .4em;
       }
       a { text-decoration: none; }
    </style>
</head>

<body style="font-family: Roboto;">

<div class="darkBlueText pageText unindentList" style="max-width: 23em;">

<table width="100%" style="font-size: 120%;">
    <tr valign="top">
        <td>{$name}<br>{$title} {$party}</td>
        <td><img src="IMG/ourFutureOurVote.png" width="150"/></td>
        <td align="right"><button onClick="window.history.back();">Back</button></td>
    </tr>
</table>

<table width="100%" cellspacing="0" cellpadding="0">
    <tr class="zebra"><td>Address</td> <td>{$address}</td></tr>
    <tr class="zebra"><td>Phone</td>   <td><a href="tel:{$phone}">{$phone}</a></td></tr>
    <tr class="zebra"><td>Email</td>   <td>{$email}</td></tr>
    <tr class="zebra"><td>Web</td>   <td><a href="{$url}">{$web}</a></td></tr>
    <tr class="zebra"><td colspan="2" style="font-size: 90%;">
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
