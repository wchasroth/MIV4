<!DOCTYPE html>
{nocache}
<html lang="en">
<head>
   {include file="inc-head.tpl"}

   <script               src="share.js"></script>
   <script               src="mivoter02.js"></script>
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search03.js"></script>
</head>

<body onLoad="initialize();">

{include file="inc-topbar.tpl"}

<div class="darkBlueText pageText unindentList" style="margin-top: 0.8ex;">

<b>Videos</b><br/>
<p/>
Learn more and share with your friends and neighbors
<p/>

<table cellspacing="0" cellpadding="0">
    <tr valign="top">
        <td><a href="video_frame.html?video=amir"><img src="IMG/video-amir1.png" width="200"/></a></td>
        <td>&nbsp;&nbsp;&nbsp;</td>
        <td>Why you need MIvoter.org (1:00)</td>
    </tr>

    <tr><td>&nbsp;</td></tr>
    <tr valign="top">
        <td><img src="IMG/video-hannah1a.png" width="200"/></td>
        <td></td>
        <td>How MIvoter.org helps Michigan voters like you (1:08)</td>
    </tr>

    <tr><td>&nbsp;</td></tr>
    <tr valign="top">
        <td><img src="IMG/video-hannah2a.png" width="200"/></td>
        <td></td>
        <td>MIvoter.org for elected officials (1:04)</td>
    </tr>

</table>

</div>

<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress={$hasAddress} button=""}

</body>
</html>
{/nocache}
