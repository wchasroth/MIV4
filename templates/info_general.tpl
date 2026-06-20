<!DOCTYPE html>
{nocache}
<html lang="en">
<head>
   <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   
   <meta        name="description" content="Find your Michigan Democratically-endorsed candidates" />
   <meta property="og:description" content="Find your Michigan Democratically-endorsed candidates" />
   
   <title>MIVoter</title>
   
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

<div class="darkBlueText pageText unindentList">

   <div class="accordion" onClick="flipPanel('whoNeeds');">Who needs to register or re-register?</div>
   <div class="panel" id='whoNeeds'>
          <ul>
               <li>New voters (people who are just turning 18)</li>
               <li>People who are new to Michigan</li>
               <li>People who move to a new city within Michigan
                 (<b>Note:</b> if you move within a city where
                 you’re already registered, you only need to
                 update your address.)
               </li>
          </ul>
   </div>

   <div class="accordion" onClick="flipPanel('checkReg');">I haven't voted in a while.&nbsp; How can I check my registration?</div>
   <div class="panel" id='checkReg'>
       <p>
      Check on-line with the <a href="https://mvic.sos.state.mi.us/Voter/Index">Secretary of State</a>.
       </p>
   </div>

   <div class="accordion" onClick="flipPanel('howLate');">How late can I register to vote?</div>
   <div class="panel" id='howLate'>
       <p>
              You can register to vote through Election Day.&nbsp;
              <a href="https://mvic.sos.state.mi.us/Home/RegisterToVote/#how">
                Here’s how to register on election day.</a>
       </p>
   </div>

   <div class="accordion" onClick="flipPanel('elegible');">Who is eligible to vote?</div>
   <div class="panel" id='elegible'>
       <p>
              To vote you must be:
                  <ul>
                    <li>A Michigan resident (at the time you register) and a resident
                      of your city or township for at least 30 days (when you vote)
                    </li>
                    <li>A United States citizen</li>
                    <li>At least 18 years of age (when you vote)</li>
                    <li>Not currently serving a sentence in jail or prison</li>
                  </ul>
       </p>
       <br/>
   </div>
    
   <div class="accordion" onClick="flipPanel('student');">Can I vote as a student?</div>
   <div class="panel" id='student'>
       <p>
              Yes. According to the Secretary of State's
              <a href="https://mvic.sos.state.mi.us/Home/RegisterToVote/#student">
                website
              </a>:
              <p>
                <b>If you're from Michigan and go to school...</b>
              <ul>
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
        </p>
  </div>

   <div class="accordion" onClick="flipPanel('emergency');">What if I have an emergency on Election Day?</div>
   <div class="panel" id='emergency'>
       <p>
              You may request an emergency absent voter ballot <i>after</i> the deadline
              for regular absent voter ballots has passed, but <i>before</i> 4 PM on
              Election Day.
              <p></p>
              The emergency must have made it impossible for you to apply for a regular
              absent voter ballot. Contact your
              <a href="clerkMap.php"><b>{$clerkJurisdiction} Clerk</b></a>
                for more information about emergency absent voter ballots.
       </p>
  </div>

   <div class="accordion" onClick="flipPanel('absenteeAlways');">How do I get an absentee ballot?</div>
   <div class="panel" id='absenteeAlways'>
       <p>
       You can <a href="https://mvic.sos.state.mi.us/AVApplication/Index">request an absentee ballot</a>
       online.&nbsp;
       At the same time, you can also be added to the permanent absentee ballot list, so that you 
       will automatically get a ballot for all future elections.
       </p>
       <p>
       See the Secretary of State's website for <a href="https://www.michigan.gov/sos/elections/voting/absentee-voting"
             >more information</a> about absentee voting.
       </p>
  </div>

   <div class="accordion" onClick="flipPanel('changeVote');">Can I change my vote?</div>
   <div class="panel" id='changeVote'>
       <p>
      If you would like to change your vote after returning your completed and signed absentee ballot to 
      your local clerk's office, your written and signed request must be received by your local clerk’s 
      office by 5 p.m. the second Friday before Election Day.
      </p>
       <p>
      Voters who wish to vote in person after obtaining an absentee ballot can do so at their early 
      voting site or Election Day polling place if they have not already returned their absentee ballot.&nbsp; 
      Voters may either submit their voted absentee ballot for tabulation at the early voting site or
      Election Day polling place or they may “spoil” their absentee ballot and be issued a new ballot.&nbsp;
      </p>
       <p>
      If you have already cast your ballot at an early voting or election day polling location, your vote cannot be changed.
       </p>
  </div>

   <div class="accordion" onClick="flipPanel('trackBallot');">How do I track my ballot?</div>
   <div class="panel" id='trackBallot'>
       <ul>
       <li>Using the Michigan Secretary of State's website,
       you can <a href="https://mvic.sos.state.mi.us/Voter/Index">check the status</a>
           of your absentee ballot.</li>
       <li>Or you can <a href="https://mvic.sos.state.mi.us/Voter/VoterSearch">subscribe</a>
           to receive automatic emails when your ballot is received and processed.
       </ul>
  </div>

   <div class="accordion" onClick="flipPanel('noBallot');">What if my ballot didn't arrive <span class="red">in the mail</span>?</div>
   <div class="panel" id='noBallot'>
       <ul>
           <li class="red">Prior to election day, you can ask for a new ballot at the clerk's office.</li>
           <li class="red">On election day, you can receive a new ballot at your polling place.</li>
           <li class="red">Officials at either of these locations will guide you through the process.</li>
       </ul>
  </div>

   <div class="accordion" onClick="flipPanel('disability');">What help is there for people with disabilities?</div>
   <div class="panel" id='disability'>
          <ul>
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

   <div class="accordion" id='noIdAccordion' onClick="flipPanel('noId');">What if I don't have an ID on election day?</div>
   <div class="panel" id='noId'>
       <ul>
           <li>If you don't have your ID with you, the poll workers will check if you appear on the
              precinct's registration list.&nbsp; If you are on the list, you can still vote.&nbsp;
               (You may be asked to sign a form confirming your identity.)
           </li>
           <li>If you don't have your ID, <b>and</b> you are not on the precinct list, you can still
               vote a "provisional" ballot.&nbsp; In that case, you must return within 6 days with
               your ID to prove that you are a registered voter.&nbsp;
               Learn more about <a href="https://www.wzzm13.com/article/news/politics/michigan-politics/what-is-provisional-ballot-how-do-they-work/69-054742fe-486b-425b-b0a0-80fc51b9a19d"
                                   target="_blank">provisional ballots</a> and how they work.
           </li>
       </ul>
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
