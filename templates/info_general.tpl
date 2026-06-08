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

   <div class="accordion" onClick="flipPanel('whoNeeds', this);">Who needs to register or re-register?</div>
   <div class="panel" id='whoNeeds'>
          <ul style="padding-left: 20px;">
               <li>New voters (people who are just turning 18)</li>
               <li>People who are new to Michigan</li>
               <li>People who move to a new city within Michigan
                 (<b>Note:</b> if you move within a city where
                 you’re already registered, you only need to
                 update your address.)
               </li>
          </ul>
   </div>

   <div class="accordion" onClick="flipPanel('checkReg', this);">I haven't voted in a while.&nbsp; How can I check my registration?</div>
   <div class="panel" id='checkReg'>
      Check on-line with the <a href="https://mvic.sos.state.mi.us/Voter/Index">Secretary of State</a>.
   </div>

   <div class="accordion" onClick="flipPanel('howLate', this);">How late can I register to vote?</div>
   <div class="panel" id='howLate'>
              You can register to vote through Election Day.&nbsp;
              <a href="https://mvic.sos.state.mi.us/Home/RegisterToVote/#how">
                Here’s how to register on election day.</a>
   </div>

   <div class="accordion" onClick="flipPanel('elegible', this);">Who is eligible to vote?</div>
   <div class="panel" id='elegible'>
              To vote you must be:
                  <ul  style="padding-left: 20px;">
                    <li>A Michigan resident (at the time you register) and a resident
                      of your city or township for at least 30 days (when you vote)
                    </li>
                    <li>A United States citizen</li>
                    <li>At least 18 years of age (when you vote)</li>
                    <li>Not currently serving a sentence in jail or prison</li>
                  </ul>
   </div>
    
   <div class="accordion" onClick="flipPanel('student', this);">Can I vote as a student?</div>
   <div class="panel" id='student'>
              Yes. According to the Secretary of State's
              <a href="https://mvic.sos.state.mi.us/Home/RegisterToVote/#student">
                website
              </a>:
              <p>
                <b>If you're from Michigan and go to school...</b>
              <ul  style="padding-left: 40px;">
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

   <div class="accordion" onClick="flipPanel('emergency', this);">What if I have an emergency on Election Day?</div>
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

   <div class="accordion" onClick="flipPanel('changeVote', this);">Can I change my vote?</div>
   <div class="panel" id='changeVote'>
      If you would like to change your vote after returning your completed and signed absentee ballot to 
      your local clerk's office, your written and signed request must be received by your local clerk’s 
      office by 5 p.m. the second Friday before Election Day.
      <p/>
      Voters who wish to vote in person after obtaining an absentee ballot can do so at their early 
      voting site or Election Day polling place if they have not already returned their absentee ballot.&nbsp; 
      Voters may either submit their voted absentee ballot for tabulation at the early voting site or
      Election Day polling place or they may “spoil” their absentee ballot and be issued a new ballot.&nbsp;
      <p/>
      If you have already cast your ballot at an early voting or election day polling location, your vote cannot be changed.
  </div>

   <div class="accordion" onClick="flipPanel('trackBallot', this);">How do I track my ballot?</div>
   <div class="panel" id='trackBallot'>
             You can search by your name or driver's license number at
             <a href="https://michigan.gov/vote">
               Michigan.gov/vote</a>.
  </div>

   <div class="accordion" onClick="flipPanel('noBallot', this);">What if my ballot didn't arrive?</div>
   <div class="panel" id='noBallot'>
             At your polling place, you can sign a statement stating that the ballot
             was lost or destroyed and vote at the polls on Election Day or during
             the early voting period.
  </div>

   <div class="accordion" onClick="flipPanel('absenteeAlways', this);">How do I get an absentee ballot for every election?</div>
   <div class="panel" id='absenteeAlways'>
              When you <a href="https://www.michigan.gov/sos/elections/voting/absentee-voting#Request"
                >apply for an absentee ballot</a> for a specific upcoming election,
              you can choose to receive your absentee ballot for all future elections.
              If you want to automatically receive absentee ballots before <i>every</i>
              election, add your name to the Permanent Mailed Ballot list.
  </div>

   <div class="accordion" onClick="flipPanel('disability', this);">What help is there for people with disabilities?</div>
   <div class="panel" id='disability'>
          <ul  style="padding-left: 20px;">
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
                <li><a href="https://mvic.sos.state.mi.us/Home/AccessibleVoting"
                     >Learn more about accessible voting</a>.
                </li>
          </ul>
  </div>

   <div class="accordion" onClick="flipPanel('noId', this);">What if I don't have an ID on election day?</div>
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
