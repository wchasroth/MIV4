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
   Use the <b>buttons at the bottom</b> to see info just for you.
   <ul>
      <li>Learn about Endorsed Candidates
      <li>Learn where and How to Vote (&amp;&nbsp;registering to vote!)
      <li>See your Current Officials
      <li>Learn about civic actions <b>you</b> can take.
   </ul>

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
