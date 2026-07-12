<script>
   function buttonSelect(buttonName) {
       buttonClicked = document.getElementById(buttonName + "_td");
       imgClicked    = document.getElementById(buttonName + "_img");
       if (buttonClicked) buttonClicked.style.backgroundColor = "#2d6887";
       if (imgClicked)    imgClicked.src = "IMG/button_" + buttonName + "_select.svg";
       return true;
   }
</script>

   <div class="bottomBar fullWidth">
      <table width="100%" border='0' cellspacing=0 cellpadding=0 style='margin: auto;'>
         <tr valign='top'>
            <td width="20%" id="endorsed_td">
               <div class="bottomButton">
                  <a class="whiteLink" href="endorsed.php" 
                     {if $hasAddress}  onClick="return buttonSelect('endorsed');"
                     {else}            onClick="alert('Nope'); return false;"
                     {/if}
                  ><img class="bottomButtonImage" id="endorsed_img" src="IMG/button_endorsed_normal.svg"/>
                   <div class="bottomButtonText" >Endorsed<br/>Candidates</div>
                  </a>
               </div>
            </td>
   
            <td width="20%" id="vote_td">
               <div class="bottomButton">
                  <a class="whiteLink" href="info.php" 
                     {if $hasAddress}  onClick="return buttonSelect('vote');"
                     {else}            onClick="alert('nope');  return false;"
                     {/if}
                  ><img class="bottomButtonImage" id="vote_img" src="IMG/button_vote_normal.svg" />
                   <div class="bottomButtonText" >How to<br/>Vote</div>
                  </a>
               </div>
            </td>
   
            <td width="20%" id="officials_td">
               <div class="bottomButton">
                  <a class="whiteLink" href="officials.php" 
                     {if $hasAddress}  onClick="return buttonSelect('officials');"
                     {else}            onClick="alert('nope');  return false;"
                     {/if}
                  ><img class="bottomButtonImage" id="officials_img" src="IMG/button_officials_normal.svg" />
                   <div class="bottomButtonText" >Current<br/>Officials</div>
                  </a>
               </div>
            </td>
   
            <td width="20%" id="civic_td">
               <div class="bottomButton">
                  <a class="whiteLink" href="faq.php" onClick="return buttonSelect('civic');"
                  ><img class="bottomButtonImage" id="civic_img" src="IMG/button_civic_normal.svg" />
                   <div class="bottomButtonText" >Civic<br/>Actions</div>
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
