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
<b>Frequently Asked Questions</b>
<p/>

   <div class="accordion" onClick="flipPanel('whyAddress', this);">Why do you need my address?</div>
   <div class="panel" id='whyAddress'>
      To find your voting districts and polling places.&nbsp;
      We do not store, share, or sell your address.&nbsp;
      Only your browser remembers it, in a cookie.&nbsp;
      Clicking on the round X in the address bar clears your address cookie.
   </div>

   <div class="accordion" onClick="flipPanel('endorsed', this);">Endorsed by whom?</div>
   <div class="panel" id='endorsed'>
      Michigan Democratic Party endorses the following:
         <ul>
            <li>US candidates</li>
            <li>Statewide candidates</li>
            <li>Michigan State Senators/Representatives</li>
            <li>Statewide proposals</li>
         </ul>
         County Democratic Parties and Clubs endorse all other candidates.</li>
   </div>

   <div class="accordion" onClick="flipPanel('whyDemocratic', this);">Why a Democratic-only voter guide?</div>
   <div class="panel" id='whyDemocratic'>
      To provide Democratic-leaning voters in Michigan with an easy way to find <b>all</b> candidates
      and proposals endorsed by the Democratic Party.&nbsp; (Especially the non-partisan
      races, like judges.)&nbsp;
      For a reliable non-partisan source of
      information about all candidates and proposals, see
      <a href="https://www.vote411.org/" target="_blank">vote411.org</a>.
   </div>

   <div class="accordion" onClick="flipPanel('missingOffices', this);">Why do I see only some offices?</div>
   <div class="panel" id='missingOffices'>
      If you don't see some candidates for your district, it's because we have not (yet)
      received information about endorsed Democratic candidates for your area.
      You can also try <a href="county.php">your local county's</a> Democratic party,
      or the <a href="https://michigandems.com/" target="_blank">MichiganDems</a>
      site for a listing of local candidates.
   </div>

   <div class="accordion" onClick="flipPanel('votingDenied', this);"
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

   <div class="accordion" onClick="flipPanel('iAmCandidate', this);">I'm a Democratic candidate.&nbsp; Why don't I appear?</div>
   <div class="panel" id='iAmCandidate'>
      If you are a candidate and do not see your information, please contact us ASAP at
      <a href="mailto:mivoter.org@gmail.com">mivoter.org@gmail.com</a>.&nbsp; We especially
      need to hear from county Democratic party leaders about endorsements for their regions.
   </div>

   <div class="accordion" onClick="flipPanel('whoIs', this);">Who is MIvoter.org?</div>
   <div class="panel" id='whoIs'>
      This site was built by a group of passionate volunteers, working towards a more
      democratic Michigan.&nbsp; Candidate data was supplied by the Michigan Democratic Party,
      the relevant county Democratic parties, individual candidates, and their campaign websites.
   </div>

   <div class="accordion" onClick="flipPanel('feedback', this);">How do I send feedback?</div>
   <div class="panel" id='feedback'>
      We'd love to hear your <a href="feedback.php">feedback</a>, especially if you're having trouble
      with the site.
      <div style="margin-top: 6px;">
         You can also email us at <a href="mailto:mivoter.org@gmail.com" target="_blank">mivoter.org@gmail.com</a>.
      </div>
   </div>

   <div class="accordion" onClick="flipPanel('video', this);">There's a funny video about MIvoter?</div>
   <div class="panel" id='video'>
      Yes!&nbsp;
      <a href="video_frame.html">Take a look!</a>&nbsp;
      That's the wonderful
      <a href="https://www.youtube.com/c/AmirforAmerica/videos">Amir for America</a>,
      who has a whole series of hilarious and informative
      videos on getting people to vote.
   </div>


</div>

<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress={$hasAddress} button="faq_td"}

</body>
</html>
{/nocache}
