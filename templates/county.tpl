<!DOCTYPE html>
{nocache}
<html lang="en">
<head>
   <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

   <meta        name="description" content="Find your Michigan Democratically-endorsed candidates" />
   <meta property="og:description" content="Find your Michigan Democratically-endorsed candidates" />

   <title>MIVoter</title>

   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto">
   <link rel="stylesheet" href="mivoter01.css">

   <script               src="mivoter02.js"></script>
   <script               src="share.js"></script>
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search02.js"></script>
</head>

<body style="font-family: Roboto;" onLoad="initialize();">

{include file="inc-topbar.tpl"}

<p style="font-size: 10%;">&nbsp;</p>

<div class="darkBlueText pageText unindentList">
         
         <p/>
         As we look forward to the 2026 elections, and reclaiming the U.S. House
         (and the Michigan State House), it's important
         to reach out and find community with like-minded people &mdash;
         for your own peace of mind, and to see how you might be able
         to help.

         <p/>

         You can start by connecting with your
         {$counties[0]['name']|fixCase} County Democratic party(ies):
   <!-- fixCase -->

         {foreach from=$counties item=county}

            {if $county['shortdesc']} 
               <p/><b>{$county['shortdesc']|fixCase}</b>
            {/if}

            {if $county['web']}
               <br/>&nbsp;&nbsp;&nbsp;<a href="{$county['web']|addProtocol}">{$county['web']|stripProtocol}</a>
            {/if}

            {if $county['email']}
               <br/>&nbsp;&nbsp;&nbsp;<a href="{$county['email']|addProtocol}">{$county['email']|stripProtocol}</a>
            {/if}

            {if $county['facebook']}
               <br/>&nbsp;&nbsp;&nbsp;<a href="{$county['facebook']|addProtocol}">{$county['facebook']|stripProtocol}</a>
            {/if}

            {if $county['twitter']}
               <br/>&nbsp;&nbsp;&nbsp;<a href="{$county['twitter']|addProtocol}">{$county['twitter']|stripProtocol}</a>
            {/if}

            {if $county['bluesky']}
               <br/>&nbsp;&nbsp;&nbsp;<a href="{$county['bluesky']|addProtocol}">{$county['bluesky']|stripProtocol}</a>
            {/if}

            {if $county['tiktok']}
               <br/>&nbsp;&nbsp;&nbsp;<a href="{$county['tiktok']|addProtocol}">{$county['tiktok']|stripProtocol}</a>
            {/if}

            {if $county['instagram']}
               <br/>&nbsp;&nbsp;&nbsp;<a href="{$county['instagram']|addProtocol}">{$county['instagram']|stripProtocol}</a>
            {/if}

            {if $county['volunteer']}
               <br/>&nbsp;&nbsp;&nbsp;<a href="{$county['volunteer']|addProtocol}">{$county['volunteer']|stripProtocol}</a>
            {/if}
         {/foreach}
</div>


<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=true}

</body>
</html>
{/nocache}
