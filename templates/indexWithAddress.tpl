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
</head>

<body style="font-family: Roboto;">

{include file="inc-topbar.tpl"}

<p style="font-size: 10%;">&nbsp;</p>
<div class="darkBlueText pageText unindentList">
    <b>Congratulations!  You have entered an address!</b>

    <p/>
    <i style="font-size: 90%;">(We <b>never</b> track your address.&nbsp; Only your browser remembers it.)</i>
</div>


<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=true}

</body>
</html>
{/nocache}
