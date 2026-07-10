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

    <b>Early Voting</b><br/>
    <ul>
    <li>Early in-person voting for the <b>August 2026 primary election</b>&nbsp;
       <span class='red'>
          must be available for all voters from
       </span>
       July 25 through August 2,&nbsp;
       <span class='red'>
         although some clerks may choose to offer additional dates.
       </span>
    </li>

    <li>Early voting for the <b>November 2026 general election</b>&nbsp;
        <span class='red'>
           must be available for all voters from 
        </span>
        October 24 through November 1,&nbsp;
        <span class='red'>
          although some clerks may choose to offer additional dates.
        </span>
    </li>

    <li>Early in-person polling locations may be different than election day
        polling places.&nbsp;
        <a href="https://mvic.sos.state.mi.us/Voter/Index#early-voting-search-section"
                   onClick="return externalLink();" target="_blank"
           >Find your early voting location</a>.
    <li><a href="https://www.michigan.gov/sos/elections/voting/early-in-person-voting"
                   onClick="return externalLink();" target="_blank"
            >Learn more about early voting in Michigan</a>.
    </ul>

    <b>Voting in Person on Primary Election Day (Aug 4, 2026)</b>
    <ul>
    <li>
       <span class='red'>
          If you are already registered, you must vote at your polling place if you vote on Election Day.&nbsp;
          If you are not already registered or need to update your registration, 
          you may do so at your city or township clerk’s office on Election Day 
          and request an absentee ballot to vote at the same time.
       </span>
    </li>

<!--
    <li>You can vote at a polling place or a clerk's office
        (such as the <a href="clerkMap.php">{$clerkJurisdiction} Clerk</a>).
-->
    <li>As the election gets closer, we will provide the location of
    <b>your</b> polling place.
    </ul>
    
    <!--
      Your clerk's office is
      … [tailored to address]
      Eligible voters have until 8 p.m. on Election Day to visit their local clerk’s
      office to register to vote or update their registration address. In this situation, you can vote at the clerk’s office.
      Learn more about voting at a clerk's office.
    -->

    <!--
      <b>Voting in Person on Election Day (Nov 3)</b>
      <br>Your polling place is
      <ul>
        <li>| jwp |</li>
        <li>| polling_place['name'] |</li>
        <li>| polling_place['address'] |</li>
        <li>
          <a href="#" onClick="if (do_polling_place_map() == 'OK') openCurtain('polling_place');  return false;"
             >Map</a>
        </li>
      </ul>
     -->

      <b><span class='red'>Acceptable forms of</span> ID.</b>&nbsp;  You can use:
      <ul>
        <li>Michigan driver's license or state ID&nbsp;
           <span class='red'>(current or expired)</span>
        </li>
        <li><span class='red'>A current</span> driver's license or state ID from another state</li>
        <li>Federal or state-government issued ID with photo</li>
        <li>U.S. Passport&nbsp; <span class='red'>or Passport Card</span></li>
        <li>Military ID with photo</li>
        <li>Student ID with photo</li>
        <li>Tribal ID with photo</li>
        <li>
           <span class='red'>
              Local government issued ID
           </span>
        </ul>
      </ul>
      <b>Note:</b> You can still vote without your ID.&nbsp;
       See <a href="info_general.php#noIdAccordion">What if I don't have an ID?</a>.
      <br/>
      <br/>
      <a href="https://mvic.sos.state.mi.us/Home/"
                   onClick="return externalLink();" target="_blank"
      >Learn more about voting on election day</a> from the Secretary of State.

  
</div>

<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=true button=""}

</body>
</html>
{/nocache}
