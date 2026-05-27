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

   <button class="accordion" onClick="flipPanel('whoNeeds', this);">Who needs to register or re-register?</button>
   <div class="panel" id='whoNeeds'>
          <ul  style="padding-left: 0.5em;">
               <li>New voters (people who are just turning 18)</li>
               <li>People who are new to Michigan</li>
               <li>People who move to a new city within Michigan
                 (<b>Note:</b> if you move within a city where
                 you’re already registered, you only need to
                 update your address.)
               </li>
          </ul>
   </div>

   <button class="accordion" onClick="flipPanel('howLate', this);">How late can I register to vote?</button>
   <div class="panel" id='howLate'>
              You can register to vote through Election Day.&nbsp;
              <a href="https://mvic.sos.state.mi.us/Home/RegisterToVote/#how">
                Here’s how to register on election day.</a>
   </div>

   <button class="accordion" onClick="flipPanel('elegible', this);">Who is eligible to vote?</button>
   <div class="panel" id='elegible'>
              To vote you must be:
                  <ul  style="padding-left: 0.5em;">
                    <li>A Michigan resident (at the time you register) and a resident
                      of your city or township for at least 30 days (when you vote)
                    </li>
                    <li>A United States citizen</li>
                    <li>At least 18 years of age (when you vote)</li>
                    <li>Not currently serving a sentence in jail or prison</li>
                  </ul>
   </div>
    
   <button class="accordion" onClick="flipPanel('student', this);">Can I vote as a student?</button>
   <div class="panel" id='student'>
              Yes. According to the Secretary of State's
              <a href="https://mvic.sos.state.mi.us/Home/RegisterToVote/#student">
                website
              </a>:
              <p>
                <b>If you're from Michigan and go to school...</b>
              <ul  style="padding-left: 0.5em;">
                <li><b>In Michigan:</b> register to vote at either your school address or your
                  home address.
                </li>
                <li><b>Out of state:</b> register to vote at your home address in
                  Michigan.
                </li>
              </ul>
              <b>If you're from out of state and go to school in Michigan:</b> register to vote at
              your school address in Michigan. (Remember to update your address each time
              you move).
              </p>
  </div>

   <button class="accordion" onClick="flipPanel('emergency', this);">What if I have an emergency on Election Day?</button>
   <div class="panel" id='emergency'>
              You may request an emergency absent voter ballot <i>after</i> the deadline
              for regular absent voter ballots has passed, but <i>before</i> 4 PM on
              Election Day.
              <p></p>
              The emergency must have made it impossible for you to apply for a regular
              absent voter ballot. Contact your
              <a href="#" onClick="if (do_juris_clerk_map() == 'OK') openCurtain('juris_clerk');  return false;">
                <b>{{ jurisdiction }} Clerk</b>
              </a>
                for more information about emergency absent voter ballots.
  </div>

   <button class="accordion" onClick="flipPanel('changeVote', this);">Can I change my vote?</button>
   <div class="panel" id='changeVote'>

          <ul  style="padding-left: 0.5em;">
            <li><b>You can't spoil an absentee ballot that</b>
              <ul  style="padding-left: 0.5em;">
                <li>has been received by the clerk or</li>
                <li>had been returned to an Early Voting Site</li>
              </ul>
            </li>
            <li><b>Otherwise</b>, if you voted absentee and want to change your
              vote, you can submit a written request to your
              <a href="#" onClick="if (do_juris_clerk_map() == 'OK') openCurtain('juris_clerk');  return false;">
                 <b>{{ jurisdiction }} Clerk</b>
              </a>
              for a new ballot.
              <ul  style="padding-left: 0.5em;">
                <li>You'll sign a request and note whether you want a new
                  ballot mailed to you or if you'll pick it up at the clerk's
                  office. (Picking it up in person is recommended if you're
                  within 2 weeks of the election).
                </li>
                <li>If your ballot has already been returned, your request must
                  be received by 5 PM the Friday before the election.
                </li>
                <li>If you still have your ballot, you can spoil it in person at
                  the clerk's office until 4 PM the Monday prior to the election.
                </li>
              </ul>
            </li>
          </ul>
  </div>

   <button class="accordion" onClick="flipPanel('trackBallot', this);">How do I track my ballot?</button>
   <div class="panel" id='trackBallot'>
             You can search by your name or driver's license number at
             <a href="https://michigan.gov/vote">
               Michigan.gov/vote</a>.
  </div>

   <button class="accordion" onClick="flipPanel('noBallot', this);">What if my ballot didn't arrive?</ballot>
   <div class="panel" id='noBallot'>
             At your polling place, you can sign a statement stating that the ballot
             was lost or destroyed and vote at the polls on Election Day or during
             the early voting period.
  </div>

   <button class="accordion" onClick="flipPanel('absenteeAlways', this);">How do I get an absentee ballot for every election?</ballot>
   <div class="panel" id='absenteeAlways'>
              When you apply for an absentee ballot for a specific upcoming election,
              you can choose to receive your absentee ballot for all future elections.
              If you want to automatically receive absentee ballots before <i>every</i>
              election, add your name to the Permanent Mailed Ballot list.
  </div>

   <button class="accordion" onClick="flipPanel('disability', this);">What help is there for people with disabilities?</button>
   <div class="panel" id='disability'>
          <ul  style="padding-left: 0.5em;">
                <li>Voters with print disabilities can <a href="https://mi.omniballot.us/sites/26/absentee/app/home">
                  apply for an accessible ballot
                </a> that can be completed electronically, printed, and returned to your
                  local clerk.
                </li>
                <li>All voters, including voters with disabilities, have access to a
                  Voter Assist Terminal in all polling places. The Voter Assist Terminal
                  helps the voter mark a ballot. It marks the ballot with the voter's
                  choices but does not tally the votes. Once the ballot is marked, it
                  is counted in exactly the same fashion as all other ballots.
                </li>
                <li>Additional information is available at the Secretary of State's
                  <a href="https://mvic.sos.state.mi.us/Home/AccessibleVoting">
                    website.
                  </a>
                </li>
          </ul>
  </div>

   <button class="accordion" onClick="flipPanel('noId', this);">What if I don't have an ID on election day?</button>
   <div class="panel" id='noId'>
             You can still vote if you don't have an ID. A poll worker will ask you to
             sign a form saying you don't have an ID. Your ballot should be included
             with all others and counted on election day.
  </div>

  
</div>

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=true button=""}

</body>
</html>
{/nocache}
