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

      <b>Apply for ballot online</b><br>
      You can <a href="https://mvic.sos.state.mi.us/AVApplication/Index">
      request a ballot online</a> if you're already registered to vote in
      Michigan.&nbsp;
      The ballot request form <b>also</b> has an option to automatically
      receive ballots for <b>all</b> future elections.
    
      <p></p>
      <b>Request a ballot from your clerk</b><br>
      Your options include:
      <ul>
        <li>Call your clerk, and they'll mail you an application that you return by mail</li>
        <li><a
            href="https://mvic.sos.state.mi.us/Home/VoteAtHome#apply">
          Download an application</a> that you return by mail
        </li>
        <li>Go to your clerk's office and request a ballot in person.&nbsp;
            You can even fill out the ballot and return it while you're there.&nbsp;
          <b>**Recommended if election day is less than two weeks away.</b></li>
           <ul>
              <li><a href="#one_time_abs" onClick="if (do_juris_clerk_map() == 'OK') openCurtain('juris_clerk');  return false;">
                <b>{{ jurisdiction }} Clerk</b></a>
              </li>
    
              <!-- (Recommended NOT to show county clerk, local is closer/better/has more services)
                  <li><a href="#one_time_abs" 
                        onClick="if (do_county_clerk_map() == 'OK') openCurtain('county_clerk');  return false;">
                      <b>{{ county_name }} County Clerk</b></a>
                  </li>
              -->
           </ul>
      </ul>

      <b>Deadlines for Requesting a Ballot</b>
      <ul>
        <li>Requests for an absent voter ballot must be <i><u>received</u></i>
          by your city or township clerk no later than 5 PM on the Friday
          before the election.
        </li>
        <li>If you're already registered, you can request an absent voter
          ballot <i><u>in person</u></i> at your clerk's office up until
          4 PM on the day of the election.
        </li>
        <li>If you're registered or updating your address at your clerk's
          office on Election Day, you can request an absent voter ballot
          at the same time you register.
        </li>
      </ul>

      <b>Return Your Ballot</b><br>
      You can return your ballot by mail (but allow 2 weeks),
      or at your clerk's office,
      or at a drop box.&nbsp; 
    
      See <a href="#dropbox_section" onClick="return dropBoxMapCall();">your Drop Box Locations</a>.&nbsp;
      <br/><br/>
      (You can also find drop-boxes from the Secretary of State‘s website, under
         "<a href="https://mvic.sos.state.mi.us/Voter/Index/#yourclerk">Search for your city/township clerk</a>".)
      </p>
<p></p>

      <b>More about voting at home</b><br/>
      See the
        <a href="https://mvic.sos.state.mi.us/Home/VoteAtHome">Secretary of State's website</a>.

</div>

  
<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=true button=""}

</body>
</html>
{/nocache}
