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
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search02.js"></script>
</head>

<body style="font-family: Roboto;">

{include file="inc-topbar.tpl"}

<img src="IMG/ourFutureOurVote.png" style="width: 100%;"><br/>

<p style="font-size: 10%;">&nbsp;</p>
<div class="darkBlueText pageText unindentList">
    <b>Enter your address</b> above to get tailored voting info <i><b>just for you</b></i>:
    <!-- <div style="height: 10px;">&nbsp;</div> -->

<!--    MIvoter.org is the <b>one stop shop</b> for all Michigan Democratic voters: -->
    <ul>
        <li>Endorsed candidates who will be on your ballot
        <li>Ways to cast your ballot
        <li>Current officials who serve you
        <li>Protests and events near you
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
