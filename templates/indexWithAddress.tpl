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

   <script               src="mivoter02.js"></script>
   <script               src="share.js"></script>
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search02.js"></script>
</head>

<body style="font-family: Roboto;" onLoad="initialize();">

{include file="inc-topbar.tpl"}

<p style="font-size: 10%;">&nbsp;</p>

<div class="darkBlueText pageText unindentList">

<b>Welcome!</b><br/><br/>
   Use the <b>buttons at the bottom</b> to see info just for you.
   <ul>
      <li>Learn about Endorsed Candidates
      <li>Learn where and How to Vote (&amp;&nbsp;registering to vote!)
      <li>See your Current Officials
      <li>Read answers to Frequent Questions
   </ul>

   <b>Ways you can defend democracy</b>
   <ul>
      <li><a href="county.php">County Parties</a>: Find your county's Democratic parties &amp; clubs,
           get their newsletters, and learn about events and opportunities to volunteer.
      <li><a href="protests.php">Protests</a>: See or add to a list of protests and other events in  your county.
      <li><a href="display.php?key=petitions">Ballot petitions</a>: Learn which to sign and which to avoid.
      <li><a href="display.php?key=whatcanido">More political actions</a> you can take.
<!--
      <li>Read how Trump's "big beautiful bill" <a href="https://docs.mivoter.org/BBB/slotkin.html" target="_blank">hurts Michiganders</a> -- and tell your friends and neighbors!
-->
   </ul>

   <b>Ways you can support MIvoter.org</b>:
   <ul>
      <li><a href="follow.php">Follow MIvoter</a> to receive a monthly email about other actions
      <li><a href="share.php">Share MIvoter</a> on social media
      <li>Share this <a href="video_frame.html">fun video</a> about MIvoter
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
