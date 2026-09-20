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

    <b>Early Voting</b><br/>
    <ul>

    <li>Early voting for the <b>November 2026 general election</b>&nbsp;
           must be available for all voters from 
        October 24 through November 1,&nbsp;
          although some clerks may choose to offer additional dates.
    </li>

    <li>Early in-person polling locations may be different than election day
        polling places.&nbsp;
        <a href="https://mvic.sos.state.mi.us/Voter/Index#early-voting-search-section"  target="_blank"
           >Find your early voting location</a>.
    <li><a href="https://www.michigan.gov/sos/elections/voting/early-in-person-voting"  target="_blank"
            >Learn more about early voting in Michigan</a>.
    </ul>

    <b>Voting in Person on Election Day (Tues Nov 3, 2026)</b>
    <ul>
    <li>
          If you are already registered, you must vote at your polling place if you vote on Election Day.&nbsp;
          If you are not already registered or need to update your registration, 
          you may do so at your city or township clerk’s office on Election Day 
          and request an absentee ballot to vote at the same time.
    </li>
    <li>
      <a href="https://mvic.sos.state.mi.us/Home/"  target="_blank"
      >Learn more about voting on election day</a> from the Secretary of State.
    </li>
    </ul>
    
      <b>Acceptable forms of ID.</b>&nbsp;  You can use:
      <ul>
        <li>Michigan driver's license or state ID&nbsp; (current or expired) </li>
        <li>A current driver's license or state ID from another state</li>
        <li>Federal or state-government issued ID with photo</li>
        <li>U.S. Passport&nbsp; or Passport Card</li>
        <li>Military ID with photo</li>
        <li>Student ID with photo</li>
        <li>Tribal ID with photo</li>
        <li>Local government issued ID
        </ul>
      </ul>


    <b>Frequent Questions</b><br/>
    {include file="inc-vq-whoeligible.tpl"}
    {include file="inc-vq-student.tpl"}
    {include file="inc-vq-disability.tpl"}
    {include file="inc-vq-emergency.tpl"}
    {include file="inc-vq-noid.tpl"}

</div>

<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=$hasAddress button=""}

</body>
</html>
{/nocache}
