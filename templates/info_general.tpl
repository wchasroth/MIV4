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
      Check on-line with the <a href="https://mvic.sos.state.mi.us/Voter/Index"
                   onClick="return externalLink(this);" target="_blank"
           >Secretary of State</a>.
       </p>
   </div>

   <div class="accordion" onClick="flipPanel('howLate');">How late can I register to vote?</div>
   <div class="panel" id='howLate'>
       <p>
              You can register to vote through Election Day.&nbsp;
              <a href="https://mvic.sos.state.mi.us/Home/RegisterToVote/#how"
                   onClick="return externalLink(this);" target="_blank"
                >Here’s how to register on election day.</a>
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
              <a href="https://mvic.sos.state.mi.us/Home/RegisterToVote/#student"
                   onClick="return externalLink(this);" target="_blank"
                >website
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
       You can <a href="https://mvic.sos.state.mi.us/AVApplication/Index"
                 onClick="return externalLink(this);" target="_blank"
               >request an absentee ballot</a> online

       <span class='red'>
       or in person at the 
              <a href="clerkMap.php">{$clerkJurisdiction} Clerk's</a> office.
       </span>

       At the same time, you can also 
       <span class='red'>check the additional box to be added to</span>
       the permanent absentee ballot list, so that you 
       will automatically get a ballot for all future elections.
       </p>
       <p>
       See the Secretary of State's website for 
         <a href="https://www.michigan.gov/sos/elections/voting/absentee-voting"
              onClick="return externalLink(this);" target="_blank"
         >more information</a> about absentee voting.
       </p>
  </div>

   <div class="accordion" onClick="flipPanel('changeVote');">Can I change my vote?</div>
   <div class="panel" id='changeVote'>
      <ul>
      <li><b>If you turned in your absentee ballot:</b>
          You can submit a written and signed request to your local clerk's office to cancel 
          your ballot and receive a new one.&nbsp;
          Your request must be received by 5 pm at least two Fridays before Election day.&nbsp;
          We recommend submitting your request in person so you can get your new ballot right away.&nbsp;
          <a href="clerkMap.php">Find your local clerk's office</a>.
      <li><b>If you have your ballot:</b> 
          You can vote at a polling place or early voting site.&nbsp;
          Workers at the site will help you get a new ballot.&nbsp;
      <li><b>If you voted at an early voting or polling location</b>, 
         your vote cannot be changed.
      </ul>
  </div>

   <div class="accordion" onClick="flipPanel('trackBallot');">How do I track my ballot?</div>
   <div class="panel" id='trackBallot'>
       <ul>
       <li>Using the Michigan Secretary of State's website, you can 
          <a href="https://mvic.sos.state.mi.us/Voter/Index"
                   onClick="return externalLink(this);" target="_blank"
          >check the status</a>
           of your absentee ballot.</li>

       <li>Or you can 
           <a href="https://mvic.sos.state.mi.us/Voter/VoterSearch"
                   onClick="return externalLink(this);" target="_blank"
           >subscribe</a>
           to receive automatic emails when your ballot is&nbsp;
           <span class='red'>mailed to you,</span>
           received, and processed.
       </ul>
  </div>

   <div class="accordion" onClick="flipPanel('noBallot');">What if my ballot didn't arrive <span class="red">in the mail</span>?</div>
   <div class="panel" id='noBallot'>
       <ul>
           <li class="red">You can ask for a new ballot at your city or township clerk's office
               until 4 p.m. on the day before election day.
              </li>
           <li class="red">On election day, you can vote in person at your polling place.</li>
           <li class="red">Officials at either of these locations will guide you through the process.</li>
       </ul>
  </div>

   <div class="accordion" onClick="flipPanel('disability');">What help is there for people with disabilities?</div>
   <div class="panel" id='disability'>
          <ul>
                <li>Voters with print disabilities can 
                   <a href="https://mi.omniballot.us/sites/26/absentee/app/home"
                      onClick="return externalLink(this);" target="_blank"
                   >apply for an accessible ballot</a> 
                  that can be completed electronically, printed, and returned to your local clerk.
                </li>
                <li>All voters, including voters with disabilities, have access to a
                  Voter Assist Terminal in all polling places.&nbsp;
                  The Voter Assist Terminal&nbsp;
                  <span class='red'>
                     allows the voter to mark their choices
                     using the electronic interface and then print a ballot with
                     those choices marked.&nbsp;
                     The printed ballot is scanned into the tabulator machine
                  </span>
                  in exactly the same fashion as all other ballots.
                </li>
                <li><a href="https://mvic.sos.state.mi.us/Home/AccessibleVoting"
                       onClick="return externalLink(this);" target="_blank"
                    >Learn more about accessible voting</a>.
                </li>
          </ul>
  </div>

   <div class="accordion" id='noIdAccordion' onClick="flipPanel('noId');">What if I don't have an ID on election day?</div>
   <div class="panel" id='noId'>
       <ul>
           <li>If you don't have your ID with you,&nbsp;
             <span class='red'>
               you will be asked to sign a form to confirm your identity.&nbsp;
               Once you sign, 
             </span>
              the poll workers will check if you appear on the
              precinct's registration list.&nbsp; If you are on the list, you can still vote.&nbsp;
              <!--
               (You may be asked to sign a form confirming your identity.)
              -->
           </li>

           <!--
              <li>If you don't have your ID, <b>and</b> you are not on the precinct list, you can still
                  vote a "provisional" ballot.&nbsp; In that case, you must return within 6 days with
                  your ID to prove that you are a registered voter.&nbsp;
                  Learn more about <a href="https://www.wzzm13.com/article/news/politics/michigan-politics/what-is-provisional-ballot-how-do-they-work/69-054742fe-486b-425b-b0a0-80fc51b9a19d"
                                   target="_blank">provisional ballots</a> and how they work.
              </li>
           -->
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
