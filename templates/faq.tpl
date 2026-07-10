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
<b>Frequently Asked Questions</b>
<p/>

   <div class="accordion" onClick="flipPanel('whyAddress');">Why do you need my address?</div>
   <div class="panel" id='whyAddress'>
      <p>
      To find your voting districts and polling places.&nbsp;
      We do not store, share, or sell your address.&nbsp;
      Only your browser remembers it, in a cookie.&nbsp;
      Clicking on the round X in the address bar clears your address cookie.
      </p>
   </div>

   <div class="accordion" onClick="flipPanel('endorsed');">Endorsed by whom?</div>
   <div class="panel" id='endorsed'>
      <br/>
      Michigan Democratic Party endorses the following:
         <ul>
            <li>US candidates</li>
            <li>Statewide candidates</li>
            <li>Michigan State Senators/Representatives</li>
            <li>Statewide proposals</li>
         </ul>
         County Democratic Parties and Clubs endorse all other candidates.
       <br/>&nbsp;
   </div>

   <div class="accordion" onClick="flipPanel('whyDemocratic');">Why a Democratic-only voter guide?</div>
   <div class="panel" id='whyDemocratic'>
      <br/>
      To provide Democratic-leaning voters in Michigan with an easy way to find <b>all</b> candidates
      and proposals endorsed by the Democratic Party.&nbsp; (Especially the non-partisan
      races, like judges.)&nbsp;
      For a reliable non-partisan source of
      information about all candidates and proposals, see
      <a href="https://www.vote411.org/" target="_blank">vote411.org</a>.
      <br/>&nbsp;
   </div>

   <div class="accordion" onClick="flipPanel('missingOffices');">Why do I see only some offices?</div>
   <div class="panel" id='missingOffices'>
      <br/>
      If you don't see some candidates for your district, it's because we have not (yet)
      received information about endorsed Democratic candidates for your area.
      You can also try <a href="county.php">your local county's</a> Democratic party,
      or the <a href="https://michigandems.com/" target="_blank">MichiganDems</a>
      site for a listing of local candidates.
      <br/>&nbsp;
   </div>

   <div class="accordion" onClick="flipPanel('votingDenied');"
         >Who can I contact if I believe my right to vote has been unfairly denied?</div>
   <div class="panel" id='votingDenied'>
      <ul>
         <li>English, Spanish, Arabic: <a href="tel:+18336486837">833-MI-VOTES</a> 
                (Michigan Democrats Voter Protection Hotline)
         <li>English: <a href="tel:+18666878683">866-OUR-VOTE</a> -- <a href="https://www.lawyerscommittee.org/" target="_blank"
            >Lawyers' Committee for Civil Rights Under Law</a>

         <li>Spanish/English: <a href="tel:+18888398682">888-VE-Y-VOTA</a> -- <a href="https://naleo.org/" target="_blank"
            >NALEO Educational Fund</a>

         <li>Arabic/English:  <a href="tel:1+8449255287">844-YALLA-US</a> -- <a href="https://www.aaiusa.org/" target="_blank"
            >Arab American Institute (AAI)</a>

         <li>Asian Languages/English: <a href="tel:+18882748683">888-API-VOTE</a> --
            <a href="https://apiavote.org/" target="_blank">APIAVote</a> &amp;
            <a href="https://www.advancingjustice-aajc.org/" target="_blank"
               >Asian Americans Advancing Justice (AAJC)</a>
         <li>Text: <a href="sms:+18666878683">866-687-8683</a>
         <li>Or contact the non-partisan organization
              <a href="https://866ourvote.org/" target="_blank">Election Protection</a>
                  <i>(not affiliated with MIvoter.org)</i>
      </ul>
   </div>

   <div class="accordion" onClick="flipPanel('iAmCandidate');">I'm a Democratic candidate.&nbsp; Why don't I appear?</div>
   <div class="panel" id='iAmCandidate'>
      <br/>
      If you are a candidate and do not see your information, please contact us ASAP
      via the <a href="feedback.php">feedback</a> page.&nbsp;
      We especially
      need to hear from county Democratic party leaders about endorsements for their regions.
      <br/>&nbsp;
   </div>

   <div class="accordion" onClick="flipPanel('whoIs');">Who is MIvoter.org?</div>
   <div class="panel" id='whoIs'>
      <br/>
      This site was built by a group of passionate volunteers, working towards a more
      democratic Michigan.&nbsp; Candidate data was supplied by the Michigan Democratic Party,
      the relevant county Democratic parties, individual candidates, and their campaign websites.
      <br/>&nbsp;
   </div>

   <div class="accordion" onClick="flipPanel('feedback');">How do I send feedback?</div>
   <div class="panel" id='feedback'>
      <br/>
      We'd love to hear your <a href="feedback.php">feedback</a>, especially if you're having trouble
      with the site.
      <br/>&nbsp;
   </div>

   <div class="accordion" onClick="flipPanel('video');">There's a funny video about MIvoter?</div>
   <div class="panel" id='video'>
      <br/>
      Yes!&nbsp;
      <a href="video_frame.html">Take a look!</a>&nbsp;
      That's the wonderful
      <a href="https://www.youtube.com/c/AmirforAmerica/videos">Amir for America</a>,
      who has a whole series of hilarious and informative
      videos on getting people to vote.
      <br/>&nbsp;
   </div>


</div>

<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress={$hasAddress} button="faq_td"}

</body>
</html>
{/nocache}
