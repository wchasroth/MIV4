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

<div class="darkBlueText pageText unindentList" style="margin-top: 0.8ex;">
         
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
               <br/>&nbsp;&nbsp;&nbsp;<a href="{$county['web']|addProtocol}"
                   onClick="return externalLink(this);" target="_blank"
                >{$county['web']|stripProtocol}</a>
            {/if}

            {if $county['email']}
               <br/>&nbsp;&nbsp;&nbsp;<a href="{$county['email']|addProtocol}"
                  onClick="return externalLink(this);" target="_blank"
                >{$county['email']|stripProtocol}</a>
            {/if}

            {if $county['facebook']}
               <br/>&nbsp;&nbsp;&nbsp;<a href="{$county['facebook']|addProtocol}"
                  onClick="return externalLink(this);" target="_blank"
                 >{$county['facebook']|stripProtocol}</a>
            {/if}

            {if $county['twitter']}
               <br/>&nbsp;&nbsp;&nbsp;<a href="{$county['twitter']|addProtocol}"
                   onClick="return externalLink(this);" target="_blank"
                  >{$county['twitter']|stripProtocol}</a>
            {/if}

            {if $county['bluesky']}
               <br/>&nbsp;&nbsp;&nbsp;<a href="{$county['bluesky']|addProtocol}"
                   onClick="return externalLink(this);" target="_blank"
                 >{$county['bluesky']|stripProtocol}</a>
            {/if}

            {if $county['tiktok']}
               <br/>&nbsp;&nbsp;&nbsp;<a href="{$county['tiktok']|addProtocol}"
                   onClick="return externalLink(this);" target="_blank"
                 >{$county['tiktok']|stripProtocol}</a>
            {/if}

            {if $county['instagram']}
               <br/>&nbsp;&nbsp;&nbsp;<a href="{$county['instagram']|addProtocol}"
                   onClick="return externalLink(this);" target="_blank"
                 >{$county['instagram']|stripProtocol}</a>
            {/if}

            {if $county['volunteer']}
               <br/>&nbsp;&nbsp;&nbsp;<a href="{$county['volunteer']|addProtocol}"
                   onClick="return externalLink(this);" target="_blank"
                 >{$county['volunteer']|stripProtocol}</a>
            {/if}
         {/foreach}
</div>


<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=true}

</body>
</html>
{/nocache}
