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

<p style="font-size: 10%;">&nbsp;</p>

<div class="darkBlueText pageText unindentList">
<b>Videos</b>
<p/>
We have several videos that help explain and publicize MIvoter.org:

<ul>
<li>

      <a href="video_frame.html">Take a look!</a>&nbsp;
      That's the wonderful
      <a href="https://www.youtube.com/c/AmirforAmerica/videos"
               onClick="return externalLink(this);" target="_blank"
             >Amir for America</a>,
      who has a whole series of hilarious and informative
      videos on getting people to vote.
      <br/>&nbsp;
   </div>


</div>

<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress={$hasAddress} button=""}

</body>
</html>
{/nocache}
