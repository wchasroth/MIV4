
<style>
   .hamburgerTable {
      border-style: solid;
      border-color: black;
      border-width: 1px;
      border-radius: 1em;
      background-color: white;
      color: #003052;
      padding: 0.5em;
      white-space: nowrap;
   }
</style>

<script>
   function setLanguage(lang) {
      document.cookie = "lang=" + lang + "; max-age=604800; path=/";
      window.location.reload();
   }
</script>

<div class="fullWidth" style="background-image: url('IMG/waveTopBackground5.png'); background-size: cover;">
   <div class="topBar">
      <a class="navbar-brand" href="index2.php">
         <img src="IMG/waveLogo5.png" width="200" style="margin-top: 10px;"/>
      </a>


      <div style="margin-top: 20px; float: right;  position: relative;">

         <table cellspacing="0" cellpadding="0" style="margin-right: 7px; margin-top: -4px;">
         <tr valign='top'>
            <td>
               <div style="width: 37px; height: 37px;  background-image: url('IMG/blue-circle-dark.png'); position: relative;">
                  <div style="position: relative; left: 6px; top: 10px; font-size: 16px; color: white;"
                     {if $lang == 'esp'} onClick="setLanguage('');"    title="Use English">Eng</div>
                     {else }             onClick="setLanguage('esp');" title="Utiliza el español">Esp</div>
                     {/if}
               </div>
            </td>
            <td>&nbsp;&nbsp;</td>
            <td>
               <div id='hamburgerMenu' style="position: absolute; display: none; z-index: 10; left: -4.5em; top: 2.5em;">
                  <table class="hamburgerTable" cellpadding='0' cellspacing='0'>
                     <tr><td><a href="index2.php"           {if $editor} title='ham-home'  {/if} >Home</a></td></tr>
                     <tr><td><a href="vote_faq.php"         {if $editor} title='ham-vote'  {/if} >Voting FAQ</a></td></tr>
                     <tr><td><a href="#" onClick="share();" {if $editor} title='ham-share' {/if} >Share</a></td></tr>
                     <tr><td><a href="feedback.php"         {if $editor} title='ham-feed'  {/if} >Feedback</a></td></tr>
                     <tr><td><a href="faq.php"              {if $editor} title='ham-abt'   {/if} >About MIvoter</a></td></tr>
                     <tr><td><a href="videos.php"           {if $editor} title='ham-vid'   {/if} >Worth Watching</a></td></tr>
                  </table>
               </div>
               <img src="IMG/hamburger1.svg" width="37" onClick="flip('hamburgerMenu');" />
            </td>
         </tr>
         </table>
      </div>

   </div>

   <div class="waveHeaderText" style="margin-left: 7px; margin-right: 7px; line-height: 130%; color: white;" 
      {if $editor} title='top-yourguide' {/if} >
      &nbsp;<i>Your</i> Michigan Voter Guide
   </div>


   <div style="height: 10px;">&nbsp;</div>

   <address-search address='{$address}'></address-search>
</div>
