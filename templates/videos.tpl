<!DOCTYPE html>
{nocache}
<html lang="en">
<head>
   {include file="inc-head.tpl"}

   <script               src="share.js"></script>
   <script               src="mivoter02.js"></script>
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search03.js"></script>
    <style>
        .flex-container {
            display: flex;
            flex-wrap: wrap;
            gap: 1em;
            /* justify-content: center; */
        }
        .flex-item {
            max-width: 161px;
            flex: none;
            padding-bottom: 1em;
        }
    </style>
</head>

<body onLoad="initialize();">

{include file="inc-topbar.tpl"}

<div class="darkBlueText pageText unindentList" style="margin-top: 0.8ex;">

<div {if $editor} title='pg-videos-hdr' {/if} >
<b>Videos</b><br/>
<p/>
Learn more and share with your friends and neighbors
</div>
<p/>



<p/>
<div class="flex-container">
    <div class="flex-item">
        <a href="video_frame.html?video=amir"><img src="IMG/video-amir3.png" width="160"/></a><br/>
        <center {if $editor} title='pg-videos-v1' {/if} >Why you need MIvoter.org (1:00)</center>
    </div>
    <div class="flex-item">
        <a href="video_frame.html?video=hannah1"><img src="IMG/video-hannah1a.png" width="160"/></a><br/>
        <center {if $editor} title='pg-videos-v2' {/if} >How MIvoter.org helps Michigan voters like you (1:08)</center>
    </div>
    <div class="flex-item">
        <a href="video_frame.html?video=vannessa1"><img src="IMG/video-vannessa1.png" width="160"/></a><br/>
        <center {if $editor} title='pg-videos-v3' {/if} >Be a Voting Genius with MIvoter.org (0:25)</center>
    </div>
    <div class="flex-item">
        <a href="video_frame.html?video=hannah2"><img src="IMG/video-hannah4a.png" width="160"/></a><br/>
        <center {if $editor} title='pg-videos-v4' {/if} >MIvoter.org for elected officials (1:04)</center>
    </div>
    <div class="flex-item">
        <a href="video_frame.html?video=hannah5"><img src="IMG/video-hannah5a.png" width="160"/></a><br/>
        <center {if $editor} title='pg-videos-v5' {/if} >MIvoter.org... find information in about 10 seconds (0:55)</center>
    </div>
</div>
</center>

<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress={$hasAddress} button=""}

</body>
</html>
{/nocache}
