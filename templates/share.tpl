<!DOCTYPE html>
{nocache}
<html lang="en">
<head>
   {include file="inc-head.tpl"}

   <script               src="mivoter02.js"></script>
   <script               src="share.js"></script>
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search03.js"></script>

   <script>
      function sendEmail() {
         let subject = "Personalized Michigan Democratic voter guide";
         let body    = "See this site for all of your Democratically-endorsed candidates:%0A%0Ahttps://mivoter.org";

         window.open("mailto:?subject=" + subject + "&body=" + body, "_blank"); 
         return false;
      }

      function shareToFacebook() {
         var url = "https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fmivoter.org%2F"
                 + "&t=Personalized%20Michigan%Democratic%20Voter%20Guide";
         window.open(url, "_blank");
         return false;
      }

      function shareToTwitter() {
         var url = 'http://twitter.com/share?'
                 + 'text=' + encodeURIComponent("Personalized Michigan Democratic Voter Guide")
                 + '&url=' + encodeURIComponent("https://mivoter.org");
         window.open(url, "_blank");
         return false;
      }

      function shareToBlueSky() {
         var url = 'https://bsky.app/intent/compose?'
                 + 'text=' + encodeURIComponent("Personalized Michigan Democratic Voter Guide at https://MIvoter.org");
         window.open(url, "_blank");
         return false;
      }
    </script>

</head>

<body onLoad="initialize();">

{include file="inc-topbar.tpl"}

<div class="darkBlueText pageText unindentList" style="margin-top: 0.8ex;">
   <span {if $editor} title='pg-share-hdr' {/if} >
     There are several ways you can share MIvoter.org with your friends:
   </span>
        <ul>
           <li><a href='#' onClick="return sendEmail();">Email</a>
           <li><a href='#' onClick="return shareToFacebook();">Facebook</a>
           <li><a href='qr.html' target="_blank">QR code</a>
           <li><a href='#' onClick="return shareToBlueSky();">Bluesky</a>
        </ul>

   <span {if $editor} title='pg-share-other' {/if} >
         For other platforms (e.g. Instagram, TikTok, etc.) try using 
         this site on your phone -- the 'Share' button at the top right (box with up arrow) 
         will let you use any of your installed social media apps. <br/>
         <br/>
         (Each of links above will open a new tab; close it when you're finished.)
   </span>
</div>
<br/>

<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=true}

</body>
</html>
{/nocache}
