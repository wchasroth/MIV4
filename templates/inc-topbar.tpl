
<style>
   .hamburgerTable {
      border-style: solid;
      border-color: black;
      border-width: 1px;
      border-radius: 10%;
      background-color: white;
      color: #003052;
      padding: 0.5em;
      white-space: nowrap;
   }
</style>

<div class="fullWidth" style="background-image: url('IMG/waveTopBackground5.png'); background-size: cover;">
   <div class="topBar">
      <a class="navbar-brand" href="index.php">
         <img src="IMG/waveLogo5.png" width="200" style="margin-top: 10px;"/>
      </a>

      <div style="margin-top: 20px; float: right;  position: relative;">

         <div id='hamburgerMenu' style="position: absolute; display: none; z-index: 10; left: -4.5em; top: 2.5em;">
            <table class="hamburgerTable" cellpadding='0' cellspacing='0'>
               <tr><td><a href="index.php"           >Home</a></td></tr>
               {if $hasAddress}
                  <tr><td><a href="info_general.php"    >FAQ: voting</a></td></tr>
               {/if}
               <tr><td><a href="faq.php"             >FAQ: mivoter</a></td></tr>
               {if $hasAddress}
                  <tr><td><a href="follow.php"          >Follow</a></td></tr>
               {/if}
               <tr><td><a href="#" onClick="share();">Share</a></td></tr>
               <tr><td><a href="video_frame.html"    >Video</a></td></tr>
            </table>
         </div>

         <img src="IMG/hamburger1.svg" width="35" style="margin-right: 7px; margin-top: -4px;" onClick="flip('hamburgerMenu');" />
      </div>

   </div>

   <div class="waveHeaderText" style="margin-left: 7px; margin-right: 7px; line-height: 130%; color: white;" >
      &nbsp;<i>Your</i> Michigan Voter Guide
   </div>


   <div style="height: 10px;">&nbsp;</div>

   <address-search address='{$address}'></address-search>
</div>
