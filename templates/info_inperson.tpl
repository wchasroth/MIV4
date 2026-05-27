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
   <script               src="mivoter.js"></script>
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search02.js"></script>
</head>

<body style="font-family: Roboto;">

{include file="inc-topbar.tpl"}

<p style="font-size: 10%;">&nbsp;</p>

<div class="darkBlueText pageText unindentList">

      <b>Early Voting</b><br/>
  Early in-person voting for the August 2026 primary election starts
        July 25, and runs through election day, August 4th.
       <p/>
       Early voting for the November 2026 general election starts October 24th,
        and runs through election day, Tuesday November 3rd.&nbsp;
       Check the
      <a href="https://www.michigan.gov/sos/elections/voting/early-in-person-voting">
        Michigan Secretary of State</a> web site for the latest information.

<p></p>
      <b>Voting in Person on Election Day (Nov 3)</b>
      <br>Your polling place is
      <ul>
        <li>{{ jwp }}</li>
        <li>{{ polling_place['name'] }}</li>
        <li>{{ polling_place['address'] }}</li>
        <li>
          <a href="#" onClick="if (do_polling_place_map() == 'OK') openCurtain('polling_place');  return false;"
             >Map</a>
        </li>
      </ul>

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
      <b>Note:</b> You can still vote without ID.&nbsp; You just have to sign an
      affidavit affirming your identity.</b>

<p></p>
<p>
      <a href="https://mvic.sos.state.mi.us/Home/">See more from the Secretary of State</a>
</p>



  
</div>

<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=true button=""}

</body>
</html>
{/nocache}
