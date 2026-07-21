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

<img src="IMG/ourFutureOurVote2.png" style="width: 100%;">

<div class="darkBlueText pageText unindentList" style="margin-top: .8ex;">
    <b>Enter your address</b> above to find:

    <ul>
        <li>All elected officials serving you
        <li>How, where, and when you'll vote
        <li>Democratically endorsed candidates on your ballot
        <li>Protests and other civic actions near you
    </ul>

    <i style="font-size: 90%;">(We <b>never</b> save your address.&nbsp; Only your browser remembers it.)</i>
</div>


<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=false}

</body>
</html>
{/nocache}
