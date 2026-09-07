<!DOCTYPE html>
{nocache}
<html lang="en">
<head>
   {include file="inc-head.tpl"}

   <script               src="share.js"></script>
   <script               src="mivoter02.js"></script>
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search03.js"></script>
</head>

<body onLoad="initialize();">

{include file="inc-topbar.tpl"}

<div class="darkBlueText pageText unindentList" style="margin-top: 0.8ex;">
   <center>
      <table border="0">
         <tr valign='top'>
            <td>&nbsp;</td>
            <td><a href="info_register.php"><img src="IMG/voteRegister2.png"></a></td>
            <td>&nbsp;</td>
            <td class="howToVoteSpacer"><b><a href="info_register.php" {if $editor} title='pg-info-reg' {/if} 
                   >{$ui->get('pg-info-reg')}</a></b>
                <div class="howToVoteSubText" {if $editor} title='pg-info-reg-text' {/if} >
                   {$ui->get('pg-info-reg-text')}
                </div>
            </td>
         </tr>

         <tr><td style="font-size: 0.1em;">&nbsp;</td></tr>
         <tr valign='top'>
            <td></td>
            <td><a href="info_home.php"><img src="IMG/voteAtHome2.png"></a></td>
            <td></td>
            <td class="howToVoteSpacer"><a href="info_home.php" {if $editor} title='pg-info-votehome' {/if} 
                   >{$ui->get('pg-info-votehome')}</a>
                <div class="howToVoteSubText red" {if $editor} title='pg-info-votehome-text' {/if}>
                   {$ui->get('pg-info-votehome-text')}
                </div>
            </td>
         </tr>

         <tr><td style="font-size: 0.1em;">&nbsp;</td></tr>
         <tr valign='top'>
            <td></td>
            <td><a href="info_inperson.php"><img src="IMG/voteInPerson2.png"></a></td>
            <td></td>
            <td class="howToVoteSpacer"><a href="info_inperson.php" {if $editor} title='pg-info-voteip' {/if} 
                  >{$ui->get('pg-info-voteip')}</a>
                <div class="howToVoteSubText" {if $editor} title='pg-info-voteip-text' {/if} >
                  {$ui->get('pg-info-voteip-text')}
                </div>
            </td>
         </tr>
      </table>
   </center>

   <span class="red" {if $editor} title='pg-info-questions' {/if} >Questions?&nbsp;
      Call the Michigan Democratic Party's Voter Assistance Hotline at
      <a href="tel:+18336486837">833-MI-VOTES</a> (833-648-6837).
   </span>
</div>

<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=$hasAddress button="vote"}

</body>
</html>
{/nocache}
