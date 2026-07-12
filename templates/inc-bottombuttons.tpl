<script>
   function buttonSelect(id) {
       buttonClicked = document.getElementById(id);
       if (buttonClicked) buttonClicked.style.backgroundColor = "#2d6887";
       return true;
   }
</script>

   <div class="bottom fullWidth" style="background-color: #003052; padding-bottom: 0px;">
      <table width="100%" border='0' cellspacing=0 cellpadding=0 style='margin: auto;'>
         <tr valign='top'>
            <td width="20%" id="candidates_td">
               <div class="button" id="candidates" style="position: relative;">
                  <a class="buttonLink" href="endorsed.php" 
                     {if $hasAddress}  onClick="return buttonSelect('candidates_td');"
                     {else}            onClick="alert('Nope'); return false;"
                     {/if}
                  ><img src="IMG/button_endorsed_normal.svg" class="buttonImage" style="width: 2.5em;"/>
                   <div style="position: absolute;  top: 2.5em; width: 100%;">Endorsed<br/>Candidates</div>
                  </a>
               </div>
            </td>
   
            <td width="20%" id="howVote_td">
               <div class="button" id="howVote_on" style="position: relative;">
                  <a class="buttonLink" href="info.php" 
                     {if $hasAddress}  onClick="return buttonSelect('howVote_td');"
                     {else}            onClick="alert('nope');  return false;"
                     {/if}
                  ><img src="IMG/button_vote_normal.svg" class="buttonImage" style="width: 2.5em;"/>
                   <div style="position: absolute;  top: 2.5em; width: 100%;">How to<br/>Vote</div>
                  </a>
               </div>
            </td>
   
            <td width="20%" id="officials_td">
               <div class="button" id="officials_on" style="position: relative;">
                  <a class="buttonLink" id='btn_officials' href="officials.php" 
                     {if $hasAddress}  onClick="return buttonSelect('officials');"
                     {else}            onClick="alert('nope');  return false;"
                     {/if}
                  ><img src="IMG/button_officials_normal.svg" class="buttonImage" style="width: 2.5em;"/>
                   <div style="position: absolute;  top: 2.5em; width: 100%;">Current<br/>Officials</div>
                  </a>
               </div>
            </td>
   
            <td width="20%" id="faq_td">
               <div class="button" style="position: relative;">
                  <a id='btn_faq' class="buttonLink" href="faq.php" onClick="return buttonSelect('faq');"
                  ><img src="IMG/button_civic_normal.svg" class="buttonImage" style="width: 2.5em;"/>
                   <div style="position: absolute;  top: 2.5em; width: 100%;">Civic<br/>Actions</div>
                  </a>
               </div>
            </td>
         </tr>
      </table>
   
   </div>

{if $button != ''}
   <script>
      buttonSelect('{$button}')
   </script>
{/if}
