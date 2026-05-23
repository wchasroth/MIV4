<!DOCTYPE html>
{nocache}
<html lang="en">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<meta        name="description" content="Find your Michigan Democratically-endorsed candidates" />
<meta property="og:description" content="Find your Michigan Democratically-endorsed candidates" />

<title>MIVoter</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto">
<link rel="stylesheet" href="mivoter.css">

<head>
    <script               src="mivoter.js"></script>
    <script               src="parseHouseStreet.js"></script>
    <script type="module" src="address-search02.js"></script>
</head>

<body style="font-family: Roboto;">

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
        <ul  style="padding-left: 0.5em;">
          <li>You have a valid Michigan driver’s license or state ID</li>
          <li>Your Michigan license or state ID has the correct address on it</li>
          <li>You haven’t applied for a duplicate license or state ID</li>
        </ul>
  
   <p></p>
         <b>Register in person</b>&nbsp;
         <br>Go to any Secretary of State branch office or the
         <a href="#" onClick="if (do_juris_clerk_map() == 'OK') openCurtain('juris_clerk'); return false;">
          {{ jurisdiction }}</a>

            <!-- (Recommended NOT to show county clerk, as local clerk closer/better)
               or <a href="#" onClick="if (do_county_clerk_map() == 'OK') openCurtain('county_clerk'); return false;">
                  {{ county_name }} county</a>
            -->

        clerk's office.</b>
   
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
