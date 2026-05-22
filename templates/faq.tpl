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
    <script               src="parseHouseStreet.js"></script>
    <script type="module" src="address-search02.js"></script>
    <script>
        function flip(id, obj) {
           panel = document.getElementById(id);
           if (panel.style.display === "block")  panel.style.display = "none";
           else {
               allPanels = document.getElementsByClassName('panel');
               for (const eachPanel of allPanels)  eachPanel.style.display = "none";
               panel.style.display = "block";
           }
        }
   </script>
    <style>
       .accordion {
          background-color: #eee;
          color: #444;
          cursor: pointer;
          padding: 18px;
          width: 100%;
          text-align: left;
          border: none;
          outline: none;
          transition: 0.4s;
          font-size: 120%;
       }
       .accordion:after {
           /* content: '\02795';*/ /* Unicode character for "plus" sign (+) */
           content: '\02228';   /* &#8964 */
           font-size: 23px;
           color: #777;
           float: right;
           margin-left: 5px;
       }

       .active:after {
           content: '\02227'
       }

       /* Add a background color to the button if it is clicked on (add the .active class with JS), and when you move the mouse over it (hover) */
       .active, .accordion:hover {
          background-color: #ccc;
       }

       /* Style the accordion panel. Note: hidden by default */
       .panel {
          padding: 0 18px;
          background-color: white;
          display: none;
          overflow: hidden;
       }
       .noUnderline { text-decoration: none; }
       .back0 { }
       .back1 { background-color: #f2f2f2; }
       a, a:visited { color: blue; }
   </style>
</head>

<body style="font-family: Roboto;">

{include file="inc-topbar.tpl"}

<p style="font-size: 10%;">&nbsp;</p>

<div class="darkBlueText pageText unindentList">
Frequently Asked Questions

   <button class="accordion" onClick="flip('whyAddress', this);">Why do you need my address?</button>
   <div class="panel" id='whyAddress'>
      To find your voting districts and polling places.&nbsp;
      We do not store, share, or sell your address.&nbsp;
      Only your browser remembers it, in a cookie.&nbsp;
      Clicking on the round X in the address bar clears your address cookie.
   </div>

   <button class="accordion" onClick="flip('endorsed', this);">Endorsed by whom?</button>
   <div class="panel" id='endorsed'>
      <ul style="padding-left: 0.5em;">
         <li>Michigan Democratic Party endorses the following:</li>
         <ul style="padding-left: 0.5em;">
            <li>US candidates</li>
            <li>Statewide candidates</li>
            <li>Michigan State Senators/Representatives</li>
            <li>Statewide proposals</li>
         </ul>
         </li>
         <li>County Democratic Parties and Clubs endorse all other candidates.</li>
      </ul>
   </div>

   <button class="accordion" onClick="flip('whyDemocratic', this);">Why a Democratic-only voter guide?</button>
   <div class="panel" id='whyDemocratic'>
      To provide Democratic-leaning voters in Michigan with an easy way to find <b>all</b> candidates
      and proposals endorsed by the Democratic Party.&nbsp; (Especially the non-partisan
      races, like judges.)&nbsp;
      For a reliable non-partisan source of
      information about all candidates and proposals, see
      <a href="https://www.vote411.org/" target="_blank">vote411.org</a>.
   </div>

   <button class="accordion" onClick="flip('missingOffices', this);">Why do I see only some offices?</button>
   <div class="panel" id='missingOffices'>
      If you don't see some candidates for your district, it's because we have not (yet)
      received information about endorsed Democratic candidates for your area.
      You can also try <a href="county.php">your local county's</a> Democratic party,
      or the <a href="https://michigandems.com/" target="_blank">MichiganDems</a>
      site for a listing of local candidates.
   </div>

   <button class="accordion" onClick="flip('votingDenied', this);"
         >Who can I contact if I believe my right to vote has been unfairly denied?</button>
   <div class="panel" id='votingDenied'>
      Please contact the non-partisan organization
      <a href="https://866ourvote.org/">Election Protection</a><sup>*</sup>.
      <ul style="padding-inline-start: 0;">
         <li>English: 866-OUR-VOTE -- <a href="https://www.lawyerscommittee.org/"
         >Lawyers' Committee for Civil Rights Under Law</a>
         <li>Spanish/English: 888-VE-Y-VOTA-- <a href="https://naleo.org/"
         >NALEO Educational Fund</a>
         <li>Arabic/English: 844-YALLA-US -- <a href="https://www.aaiusa.org/"
         >Arab American Institute (AAI)</a>
         <li>Asian Languages/English: 888-API-VOTE --
            <a href="https://apiavote.org/">APIAVote</a> &amp;
            <a href="https://www.advancingjustice-aajc.org/"
            >Asian Americans Advancing Justice (AAJC)</a>
         <li>Text: <a href="sms:866-687-8683">866-687-8683</a>
      </ul>
      <sup>*</sup> Election Protection is not affiliated with MIvoter.org.
   </div>

   <button class="accordion" onClick="flip('iAmCandidate', this);">I'm a Democratic candidate.&nbsp; Why don't I appear?</button>
   <div class="panel" id='iAmCandidate'>
      If you are a candidate and do not see your information, please contact us ASAP at
      <a href="mailto:mivoter.org@gmail.com">mivoter.org@gmail.com</a>.&nbsp; We especially
      need to hear from county Democratic party leaders about endorsements for their regions.
   </div>

   <button class="accordion" onClick="flip('whoIs', this);">Who is MIvoter.org?</button>
   <div class="panel" id='whoIs'>
      This site was built by a group of passionate volunteers, working towards a more
      democratic Michigan.&nbsp; Candidate data was supplied by the Michigan Democratic Party,
      the Washtenaw County Democratic Party, individual candidates, and their campaign websites.
   </div>

   <button class="accordion" onClick="flip('feedback', this);">How do I send feedback?</button>
   <div class="panel" id='feedback'>
      We'd love to hear your <a href="feedback.php">feedback</a>, especially if you're having trouble
      with the site.
      <div style="margin-top: 6px;">
         You can also email us at <a href="mailto:mivoter.org@gmail.com" target="_blank">mivoter.org@gmail.com</a>.
      </div>
   </div>

   <button class="accordion" onClick="flip('video', this);">There's a funny video about MIvoter?</button>
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
<p>&nbsp;</p>
<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress={$hasAddress} button="faq_td"}

</body>
</html>
{/nocache}
