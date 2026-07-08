<!DOCTYPE html>
{nocache}
<html lang="en">
<head>
   <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   
   <meta        name="description" content="Find your Michigan Democratically-endorsed candidates" />
   <meta property="og:description" content="Find your Michigan Democratically-endorsed candidates" />
   
   <title>MIvoter</title>
   
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto">
   <link rel="stylesheet" href="mivoter02.css">

   <script               src="share.js"></script>
   <script               src="mivoter02.js"></script>
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search02.js"></script>
</head>

<body style="font-family: Roboto;" onLoad="initialize();">

{include file="inc-topbar.tpl"}

<p style="font-size: 10%;">&nbsp;</p>

<span class="darkBlueText pageText unindentList">
   <span class="red">
    Want all your ballots mailed to you?&nbsp; Get on the permanent mail ballot list.&nbsp;
    <a href="permanent.php">Learn more</a>.
   </span>

    <p/>
      <b>Apply for ballot online</b>
      <ul>
      <li>You can <a href="https://mvic.sos.state.mi.us/AVApplication/Index">
         request a ballot online</a> if you're already registered to vote in
         Michigan.
      <li>Ballots are available starting 40 days before an election.
          <!--
      <li>The ballot request form <b>also</b> has an option to automatically
         receive ballots for <b>all</b> future elections, called the 
         "permanent mail ballot list".
         -->
      <li>
         <span class="red">
         <b>To receive ballots for all future elections in the mail</b>, select the "permanent mail ballot list"
          when you fill out your online ballot form.
        </span>
      </ul>
    
      <b>Request a ballot from your clerk</b><br>
      Your options include:
      <ul>
        <li>Call your clerk, and they'll send you an application that you return by mail&nbsp;
           <span class='red'>
             or in one of your city or township's ballot drop boxes.
           </span>
              </li>

        <li><a href="https://www.michigan.gov/sos/-/media/Project/Websites/sos/Elections/Election-Forms/Absent-Voter-Ballot-Application-Fillable.pdf"
             target="_blank">Download an application</a>  
            that you can fill in, and return by mail&nbsp;
            <span class='red'>
              or in one of your city or township's ballot drop boxes.
            </span>
        </li>

        <li>Go to your clerk's office and request a ballot in person.&nbsp;
            You can even fill out the ballot and return it while you're there.&nbsp;
          <b>Recommended if election day is less than two weeks away.</b></li>
           <ul>
              <li><a href="clerkMap.php"><b>{$clerkJurisdiction} Clerk</b></a></li>
    
              <!-- (Recommended NOT to show county clerk, local is closer/better/has more services)
                  <li><a href="#one_time_abs" 
                        onClick="if (do_county_clerk_map() == 'OK') openCurtain('county_clerk');  return false;">
                      <b>{{ county_name }} County Clerk</b></a>
                  </li>
              -->
           </ul>
      </ul>

      <b>Correcting Your Ballot</b><br/>
           If you have already sent in your ballot, and <b>want to change your vote</b>, 
           contact
           <a href="clerkMap.php">your clerk</a>.

      <p/>
      <b>Return Your Ballot</b><br>
       
       <span class="red">
          Your ballot must be received at your clerk’s office or deposited in your local ballot drop box 
          by 8 pm on Election Day for it to count.&nbsp;
          You can also scan your marked absent voter ballot into a tabulator machine at your 
          early voting site or at your Election Day polling place.
       </span>

       <p/>
       <span class="red">We will provide drop-box, polling place, and early voting locations closer to election day.</span>
    <!--
      <a href="#dropbox_section" onClick="return dropBoxMapCall();">Find your Drop Box Locations</a>.&nbsp;
      <br/><br/>
      (You can also find drop-boxes from the Secretary of State‘s website, under
         "<a href="https://mvic.sos.state.mi.us/Voter/Index/#yourclerk">Search for your city/township clerk</a>".)
         -->
      </p>
<p></p>

      <b>More about voting at home</b><br/>
      Learn more:
        <a href="https://mvic.sos.state.mi.us/Home/VoteAtHome">Secretary of State's absentee voting page</a>.

</div>

  
<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=true button=""}

</body>
</html>
{/nocache}
