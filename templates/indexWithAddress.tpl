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

<div class="darkBlueText pageText unindentList" style="margin-top: .8ex;">

<b>Welcome!</b><br/><br/>
   Click the <b>buttons at the bottom</b> for info tailored to your address:
   <ul>
      <li>Endorsed Candidates
      <li>How to Vote
      <li>Current Officials
      <li>Civic actions
   </ul>

   <i style="font-size: 90%;">(We <b>never</b> save your address.&nbsp; Only your browser remembers it.)</i>
</div>


<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=true}

</body>
</html>
{/nocache}
