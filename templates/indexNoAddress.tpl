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
    <b>To get started,</b> enter your address in the box above.
    <div style="height: 10px;">&nbsp;</div>

    MIvoter.org is the <b>one stop shop</b> for all Michigan Democratic voters:
    <ul>
        <li>See <b>your</b> elected officials
        <li>Register to vote
        <li>See endorsed candidates
        <li>Find protests &amp; events
        <li>And much, much more
    </ul>

    <i style="font-size: 90%;">(We <b>never</b> track your address.&nbsp; Only your browser remembers it.)</i>
</div>


<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=false}

</body>
</html>
{/nocache}
