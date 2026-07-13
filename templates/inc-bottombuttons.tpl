<script>
   function buttonSelect(buttonName) {
       buttonClicked = document.getElementById(buttonName + "_div");
       imgClicked    = document.getElementById(buttonName + "_img");
       if (buttonClicked) buttonClicked.style.backgroundColor = "#2d6887";
       if (imgClicked)    imgClicked.src = "IMG/button_" + buttonName + "_select.svg";
       return true;
   }
</script>

   <!-- Ensure these are already loaded and available to the browser, so that 
        the 'switch' to them appears instanteous.  -->
   <img src="IMG/button_endorsed_select.svg"  style="display: none;"/>
   <img src="IMG/button_vote_select.svg"      style="display: none;"/>
   <img src="IMG/button_officials_select.svg" style="display: none;"/>
   <img src="IMG/button_civic_select.svg"     style="display: none;"/>

   <style>
      #needAddress {
         position: relative;
         background-color: #e7f5fd;
         z-index: 10;
         bottom: 2em;
         left:   1em;
         border-style: solid;
         border-color: black;
         border-width: 1px;
         border-radius: 10%;
         padding: 0.5em;
         max-width: 12em;
         color: #003052;
         display: none;
      }
   </style>


   <div class="bottomBar fullWidth">
      <div id="needAddress">
         Please enter your address to see <b>your</b>
         candidates, voting info, or officials.
      </div>
      <div class="bottomStuff">
      <table width="100%" border='0' cellspacing=0 cellpadding=0 style='margin: auto;'>
         <tr valign='top'>
            <td width="20%" id="endorsed_td">
               <div class="bottomButton" id="endorsed_div">
                  <a class="whiteLink" href="endorsed.php" 
                     {if $hasAddress}  onClick="return buttonSelect('endorsed');"
                     {else}            onClick="flip('needAddress'); return false;"
                     {/if}
                  ><img class="bottomButtonImage" id="endorsed_img" src="IMG/button_endorsed_normal.svg"/>
                   <div class="bottomButtonText" >Endorsed<br/>Candidates</div>
                  </a>
               </div>
            </td>
   
            <td width="20%" id="vote_td">
               <div class="bottomButton" id="vote_div">
                  <a class="whiteLink" href="info.php" 
                     {if $hasAddress}  onClick="return buttonSelect('vote');"
                     {else}            onClick="flip('needAddress');  return false;"
                     {/if}
                  ><img class="bottomButtonImage" id="vote_img" src="IMG/button_vote_normal.svg" />
                   <div class="bottomButtonText" >How to<br/>Vote</div>
                  </a>
               </div>
            </td>
   
            <td width="20%" id="officials_td">
               <div class="bottomButton" id="officials_div">
                  <a class="whiteLink" href="officials.php" 
                     {if $hasAddress}  onClick="return buttonSelect('officials');"
                     {else}            onClick="flip('needAddress');  return false;"
                     {/if}
                  ><img class="bottomButtonImage" id="officials_img" src="IMG/button_officials_normal.svg" />
                   <div class="bottomButtonText" >Current<br/>Officials</div>
                  </a>
               </div>
            </td>
   
            <td width="20%" id="civic_td">
               <div class="bottomButton" id="civic_div">
                  <a class="whiteLink" href="civicActions.php" onClick="return buttonSelect('civic');"
                  ><img class="bottomButtonImage" id="civic_img" src="IMG/button_civic_normal.svg" />
                   <div class="bottomButtonText" >Civic<br/>Actions</div>
                  </a>
               </div>
            </td>
         </tr>
      </table>
      </div>
   
   </div>

{if $button != ''}
   <script>
      buttonSelect('{$button}')
   </script>
{/if}
