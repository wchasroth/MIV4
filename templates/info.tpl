<!DOCTYPE html>
{nocache}
<html lang="en">
<head>
   {include file="inc-head.tpl"}

   <script               src="share.js"></script>
   <script               src="mivoter02.js"></script>
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search02.js"></script>
</head>

<body onLoad="initialize();">

{include file="inc-topbar.tpl"}

<p style="font-size: 10%;">&nbsp;</p>

<div class="darkBlueText pageText unindentList">
<!--
   <span class="red">Michigan law ensures that you have options for how to cast your ballot, 
    and all of them are simple and safe.</span>
-->
   <center>
      <table border="0">
         <tr valign='top'>
            <td>&nbsp;</td>
            <td><a href="info_register.php"><img src="IMG/voteRegister2.png"></a></td>
            <td>&nbsp;</td>
            <td class="howToVoteSpacer"><b><a href="info_register.php">Register to Vote</a></b>
                <div class="howToVoteSubText">
                   Make sure you can vote!&nbsp;
                   Check your status, or learn how to register on-line or in-person.
                </div>
            </td>
         </tr>

         <tr><td style="font-size: 0.1em;">&nbsp;</td></tr>
         <tr valign='top'>
            <td></td>
            <td><a href="info_general.php"><img src="IMG/voteGeneralInfo2.png"></a></td>
            <td></td>
            <td class="howToVoteSpacer"><a href="info_general.php"><b>General Info</b></a>
                <div class="howToVoteSubText">
                   Frequently asked questions about registration,
                   eligibility, absentee ballots, and more.
                </div>
            </td>
         </tr>

         <tr><td style="font-size: 0.1em;">&nbsp;</td></tr>
         <tr valign='top'>
            <td></td>
            <td><a href="info_home.php"><img src="IMG/voteAtHome2.png"></a></td>
            <td></td>
            <td class="howToVoteSpacer"><a href="info_home.php"><b>Vote at Home</b></a>
                <div class="howToVoteSubText red">
                   Anyone can vote absentee for a single election or for every election by signing up for 
                   the permanent mail ballot list.&nbsp;
                </div>
            </td>
         </tr>

         <tr><td style="font-size: 0.1em;">&nbsp;</td></tr>
         <tr valign='top'>
            <td></td>
            <td><a href="info_inperson.php"><img src="IMG/voteInPerson2.png"></a></td>
            <td></td>
            <td class="howToVoteSpacer"><a href="info_inperson.php"><b>Vote in Person</b></a>
                <div class="howToVoteSubText">
                   Where to vote, in-person, on Election Day,
                   or in the 9 days of "early&nbsp;voting".
                </div>
            </td>
         </tr>
      </table>
   </center>

   <span class="red">Questions?&nbsp;
      Call the Michigan Democratic Party's Voter Assistance Hotline at
      <a href="tel:+18336486837">833-MI-VOTES</a> (833-648-6837).
   </span>
</div>

<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=true button="vote"}

</body>
</html>
{/nocache}
