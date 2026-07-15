<!DOCTYPE html>
{nocache}
<html lang="en">
<head>
   {include file="inc-head.tpl"}

   <script               src="mivoter02.js"></script>
   <script               src="share.js"></script>
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search02.js"></script>
</head>

<body onLoad="initialize();">

{include file="inc-topbar.tpl"}

<img src="IMG/ourFutureOurVote.png" style="width: 100%;">

<div class="darkBlueText pageText unindentList" style="margin-top: .8ex;">
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
