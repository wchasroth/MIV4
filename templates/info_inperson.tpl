<!DOCTYPE html>
{nocache}
<html lang="en">
<head>
   <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   
   <meta        name="description" content="Find your Michigan Democratically-endorsed candidates" />
   <meta property="og:description" content="Find your Michigan Democratically-endorsed candidates" />
   
   <title>MIVoter</title>
   
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto">
   <link rel="stylesheet" href="mivoter.css">

   <script               src="share.js"></script>
   <script               src="mivoter02.js"></script>
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search02.js"></script>
</head>

<body style="font-family: Roboto;" onLoad="initialize();">

{include file="inc-topbar.tpl"}

<p style="font-size: 10%;">&nbsp;</p>

<div class="darkBlueText pageText unindentList">

    <b>Early Voting</b><br/>
    <ul>
    <li>Early in-person voting for the <b>August 2026 primary election</b>
       starts July 25, and runs through election day, August 4th.
    <li>Early voting for the <b>November 2026 general election</b> 
        starts October 24th, and runs through election day, Tuesday November 3rd.&nbsp;
    <li>Early in-person polling locations may be different than election day
        polling places.&nbsp;
        <a href="https://mvic.sos.state.mi.us/Voter/Index#early-voting-search-section"
           >Find your early voting location</a>.
    <li><a href="https://www.michigan.gov/sos/elections/voting/early-in-person-voting"
            >Learn more about early voting in Michigan</a>.
    </ul>

    <b>Voting in Person on Primary Election Day (Aug 4, 2026)</b>
    <ul>
    <li>You can vote at a polling place or a clerk's office
        (such as the <a href="clerkMap.php">{$clerkJurisdiction} Clerk</a>).
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

      <b>Bring Your ID.</b>&nbsp;  You can use:
      <ul>
        <li>Michigan driver's license or state ID</li>
        <li>Driver's license or state ID from another state</li>
        <li>Federal or state-government issued ID with photo</li>
        <li>U.S. Passport</li>
        <li>Military ID with photo</li>
        <li>Student ID with photo</li>
        <li>Tribal ID with photo</li>
      </ul>
      <b>Note:</b> You can still vote without your ID.&nbsp;
       See <a href="info_general.php#noIdAccordion">What if I don't have an ID?</a>.
      <br/>
      <br/>
      <a href="https://mvic.sos.state.mi.us/Home/">Learn more about voting on election day</a> from the Secretary of State.

  
</div>

<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=true button=""}

</body>
</html>
{/nocache}
