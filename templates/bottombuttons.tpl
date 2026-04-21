
<div class="bottom" style='max-width: 25em; background-color: #003052; padding-bottom: 0px;'>
   <table width="93%" border='0' cellspacing=0 cellpadding=0 style='margin: auto;'>
      <tr>
         <td width="20%" id="candidates_td">
            {if $hasAddress}
               <div class="button" id="candidates">
                  <a class="buttonLink" href="/ballot/" onClick="return buttonSelect('candidates');">
                     <img src="IMG/waveButtonCandidates5.png" width="24" class="buttonImage"/><br/>
                     Endorsed<br/>Candidates
                  </a>
               </div>
            {else}
               <div class="button inactive">
                  <img src="IMG/waveButtonCandidates-deactivated2.png" width="24" class="buttonImage" /><br/>
                  Endorsed<br/>Candidates
               </div>
            {/if}
         </td>

         <td width="20%" id="howVote_td">
            {if $hasAddress}
               <div class="button" id="howVote_on">
                  <a class="buttonLink" href="/info/" onClick="return buttonSelect('howVote');">
                     <img src="IMG/waveButtonVote5.png" width="24" class="buttonImage"/><br/>
                     How to<br/>Vote
                  </a>
               </div>
            {else}
               <div class="button inactive">
                  <img src="IMG/waveButtonVote-deactivated3.png" width="24" class="buttonImage"/><br/>
                  How to<br/>Vote
               </div>
            {/if}
         </td>

         <td width="20%" id="officials_td">
            {if $hasAddress}
               <div class="button" id="officials_on">
                  <a class="buttonLink" id='btn_officials' href="/officials/" onClick="return buttonSelect('officials');">
                     <img src="IMG/waveButtonOfficials5.png" width="24" class="buttonImage" /><br/>
                     Current<br/>Officials
                  </a>
               </div>
            {else}
               <div class="button inactive">
                  <img src="IMG/waveButtonOfficials-deactivated5.png" width="24" class="buttonImage" /><br/>
                  Current<br/>Officials
               </div>
            {/if}
         </td>

         <td width="20%" id="faq_td">
            <div class="button">
               <a id='btn_faq' class="buttonLink" href="/faq/" onClick="return buttonSelect('faq');">
                  <img src="IMG/waveButtonFAQ5.png" width="24" class="buttonImage" /><br/>
                  Frequent<br/>Questions
               </a>
            </div>
         </td>
      </tr>
   </table>

</div>