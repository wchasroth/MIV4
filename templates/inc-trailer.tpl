<div style="position: relative;">
   <img src="IMG/footer-clean5d.png" class="fullWidth"/><br/>
   <div style="position: absolute; top: 20px; z-index: 2; width: 100%;">
      <center>
         <div class="bottomPill" onClick="share();">
            <img src="IMG/waveIconShare5.png"/>
            <span style="position: absolute; top: 14px;" {if $editor} title='btm-share' {/if} >{$ui->get('btm-share')}</span>
         </div>
         <br/>

         <div style="color: white;   font-size: 120%; margin-top: 0.5em;">
            <b {if $editor} title='btm-follow' {/if} >{$ui->get('btm-follow')}</b>

            <center style="margin-top: 0.5em;">
               <a href="https://www.facebook.com/mivoter.org"
                   onClick="return externalLink(this);" target="_blank"
                 ><img src="IMG/icon4-fb2.png" width="36" title="Facebook"/></a>&nbsp;

               <a href="https://www.instagram.com/mivoter.org5"
                   onClick="return externalLink(this);" target="_blank"
                 ><img src="IMG/icon4-inst2.png" width="36" title="Instagram"/></a>&nbsp;

               <a href="https://www.tiktok.com/@mivoter.org"
                   onClick="return externalLink(this);" target="_blank"
                 ><img src="IMG/icon4-tt2.png" width="36"   title="TikTok" /></a>&nbsp;

               <a href="https://bsky.app/profile/mivoterdotorg.bsky.social"
                   onClick="return externalLink(this);" target="_blank"
                 ><img src="IMG/icon4-bsky2.png" width="36"    title="BlueSky" /></a>&nbsp;

               <a href="https://www.youtube.com/@mivoter_org"
                   onClick="return externalLink(this);" target="_blank"
                 ><img src="IMG/icon4-yt3.png" width="36"   title="YouTube"/></a>&nbsp;
            </center>
         </div>

         <b>
            <div style="color: white;   font-size: 120%; margin-top: 0px; padding-left: 0.2em;" ignore='feedback'>
               <a href="feedback.php" class="whiteLink" style="font-size: 65%;" {if $editor} title='btm-feedback' {/if}>
                  {$ui->get('btm-feedback')}
               </a>
            </div>
         </b>


         <div style="color: white;   font-size: 70%; padding-left: 10px;  padding-right: 10px; max-width: 500px; margin-top: 10px; background-color: #003052;">
           <table>
              <tr valign='top'>
              <td><a href="https://michigandems.com" target="_blank"><img src="IMG/mdpLogo2.jpg" width="100"/></a></td>
              <td>&nbsp;&nbsp;</td>
              <td>
                <span {if $editor} title='btm-mivoter' {/if} >{$ui->get('btm-mivoter')}</span>
              </td>
              <td><a href="https://www.washtenawdems.org" target="_blank"><img src="IMG/wcdp-merged2.png" width="100"/></a></td>
              </tr>
            </table>

            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
         </div>
      </center>
   </div>
</div>
