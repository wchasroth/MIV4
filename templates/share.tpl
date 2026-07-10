<!DOCTYPE html>
{nocache}
<html lang="en">
<head>
   {include file="inc-head.tpl"}

   <script               src="mivoter02.js"></script>
   <script               src="share.js"></script>
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search02.js"></script>

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
    </script>

</head>

<body onLoad="initialize();">

{include file="inc-topbar.tpl"}

<p style="font-size: 10%;">&nbsp;</p>

<div class="darkBlueText pageText unindentList">

               There are several ways you can share MIvoter.org with
               your friends:
               <ul>
               <li><a href='#' onClick="return sendEmail();">Email</a>
               <li><a href='#' onClick="return shareToFacebook();">Facebook</a>
               <li><a href='qr.html' target="_blank">QR code</a>
               <li><a href='#' onClick="return shareToTwitter();">X / Twitter</a>
               </ul>

         For other platforms (e.g. Instagram, TikTok, etc.) try using 
         this site on your phone -- the 'Share' button at the top right (box with up arrow) 
         will let you use any of your installed social media apps. <br/>
         <br/>
         (Each of links above will open a new tab; close it when you're finished.)
</div>
<br/>

<center>
<i><a href="index.php">(Return to home page)</a></i>
</center>


<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=true}

</body>
</html>
{/nocache}
