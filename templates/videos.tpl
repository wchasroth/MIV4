<!DOCTYPE html>
{nocache}
<html lang="en">
<head>
   {include file="inc-head.tpl"}

   <script               src="share.js"></script>
   <script               src="mivoter02.js"></script>
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search02.js"></script>
</head>

<body onLoad="initialize();">

{include file="inc-topbar.tpl"}

<div class="darkBlueText pageText unindentList" style="margin-top: 0.8ex;">

<b>Videos</b>
<p/>
We have several videos that help explain and publicize MIvoter.org:<br/>
<br/>

<ul>
<li><a href="video_frame.html?video=amir">Amir for America</a>'s
       hilarious introduction to <b>why</b> you need MIvoter.org.

<li><a href="video_frame.html?video=hannah1">June 2026 launch</a>
       of the upgraded MIvoter.org, with an emphasis on the 
       state-wide database of elected officials.
</ul>

</div>

<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress={$hasAddress} button=""}

</body>
</html>
{/nocache}
