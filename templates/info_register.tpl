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

         <b>Are you registered?</b>&nbsp;
         <br>Check on-line with the
         <a href="https://mvic.sos.state.mi.us/Voter/Index">
            Secretary of State</a>.
   <p></p>
  
         <b>Register on-line</b>&nbsp;
         <br>You can file your voter registration
        <a href="https://mvic.sos.state.mi.us/RegisterVoter/Index">
           on-line</a>
        if:
        <ul>
          <li>You have a valid Michigan driver’s license or state ID</li>
          <li>Your Michigan license or state ID has the correct address on it</li>
          <li>You haven’t applied for a duplicate license or state ID</li>
        </ul>
  
         <b>Register in person</b>&nbsp;
         <br>Go to any Secretary of State branch office or the
         <a href="clerkMap.php">{$clerkJurisdiction}</a>
           clerk's office.</b>

            <!-- (Recommended NOT to show county clerk, as local clerk closer/better)
               or <a href="#" onClick="if (do_county_clerk_map() == 'OK') openCurtain('county_clerk'); return false;">
                  | county_name | county</a>
            -->

   <p></p>
         <b>Military or Overseas</b>&nbsp;
           <br>See the
           <a href="https://www.fvap.gov/">
             Federal Voting Assistance Program</a>.
  
   <p></p>
      <b>More information</b>&nbsp;<br/>
      <a href="https://mvic.sos.state.mi.us/Home/"
         >See more from the Secretary of State</a>.
  
</div>

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=true button=""}

</body>
</html>
{/nocache}
