<!DOCTYPE html>
{nocache}
<html lang="en">
<head>
   {include file="inc-head.tpl"}

   <script               src="share.js"></script>
   <script               src="mivoter02.js"></script>
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search03.js"></script>
</head>

<body onLoad="initialize();">

{include file="inc-topbar.tpl"}

<div class="darkBlueText pageText unindentList" style="margin-top: 0.8ex;">
<b>Help with Primary Election Results</b>

<p/>
Dear friends &amp; colleagues:

<p/>
We're looking for some help integrating the primary election results with
our candidate data -- so that we can show the best possible information to
voters in November.&nbsp;
<p/>
Basically, if you're good at doing Google searches -- you can be a big help.&nbsp;
(No programming skills needed!)

<p/>
<b>So, what's the problem?</b>
<p>
We already know most of the offices or "seats" that are up for election in November.&nbsp;
<b>Except</b> -- there are about 100 elected officials in Michigan, who resigned before their
term was over.&nbsp; We even know many of the people who are running to replace them.&nbsp;
But we don't know <b>who</b> they are replacing!

<p/>
Here's a specific example that will make this clearer.&nbsp;
The city of Mount Pleasant, in the county of Isabella, is supposed to have 7 council ("comission") members.&nbsp;
Two of those seats are up for election in 2026.&nbsp;

<p/>
But the primary election result shows one "Hanna Demerath" as running for a partial-term race,
but we have no record of someone resigning.&nbsp;
So, who is she running to replace?&nbsp; For which seat?

<p/>
Worse, our database shows <b>10</b> seats on the council, but a quick Google search says that
there are 7.&nbsp; So our data needs some help!

<p/>
<b>The Ask / The Solution</b>
<p/>
We have a
   <a href="https://docs.google.com/spreadsheets/d/1J7NENS0v8IYd42w7LjSU-1LSJk0YjGuRNUV2Mew3qLw/edit?gid=579881375#gid=579881375"
      target="_blank">spreadsheet</a>
   of "problem" races (like Mount Pleasant), where something's wrong or
incomplete.&nbsp;
We want volunteers to pick a few (or more) rows from this sheet, and resolve each problem.

   <p/>
   If you're interested, email <a href="mailto:wchasroth@gmail.com" target="_blank">Charles</a>,
   and he'll give you (readonly) access to our Candidate editor application.&nbsp;
   There you can see the data that we have currently.&nbsp;
   You'll also get write-access to the spreadsheet
   (so that you can "claim" some races by adding your initials
   to the "Initials" column.&nbsp;

   <p/>
   From there, it's just a matter of doing Google (or other) searches to find (a) what offices
   and officers really currently exist, (b) who or what seat the "problem" candidate is running
   to replace, and (c) what corrections we need to make to our database.

   <p/>
   <b>The Candidate Editor</b>
   <p/>
   Once you're signed up, you'll see pages like the example below, for the Mount Pleasant case.&nbsp;
   The first image is the "Candidate Editor" page, that shows the seats open for this election.&nbsp;
   (The little pull-down menu is a list of candidates known to have filed to run, which has some
   duplications.)
   <img src="IMG/primary-1.png"/>

   <p/>
   The second image is the "Officials" (aka Incumbents) page for the same city.&nbsp;
   You can see it has too many (10 instead of 7) offices, some of which are duplicates.
   <p/>
   <img src="IMG/primary-2.png"/>

   <p/>
   <b>The Desired Result</b>
   <p/>
   <ol>
      <li>Search for the jurisdiction (city, township, whatever), and find out who the current members really are.</li>
      <li>Compare that to what appears in our "Officials" editor, and note what should be fixed.&nbsp;
         Most column headers in that editor have "hover-overs" that explain what they mean.&nbsp;
         The "Next" column, in particular is important -- normally this is the next year that office should be up for election.
      </li>
      <li>Search for the candidate named in the "problem" row in the spreadsheet.&nbsp;
      Try to find out who they are replacing.&nbsp;
         (Sometimes, they may be 'replacing' themselves -- e.g. they may have been appointed, temporarily, to fill a seat --
         and now are running to officially fill that seat for the rest of the normal term.)
      </li>
      <li>Email <a href="mailto:wchasroth@gmail.com" target="_blank">Charles</a> everything that you found, and how you
          think our data should be fixed.
      </li>
      <li><b>OPTIONAL:</b>
         If you'd like to actually use our editor directly, to make these fixes, let's chat, and we'll review how to use
         the editor in more detail.&nbsp;  But just sending us an email with your conclusions is still a HUGE amount
         of help.
      </li>
   </ol>

   Most of these "problems" should take only ~15-20 minutes to search for, examine, and suggest fixes for.&nbsp;
   YMMV, of course.&nbsp;
   So if you're interested, pick a small handful, and see if this works for you.&nbsp;
   If not, that's fine -- and "thank you for playing!".




</div>

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=$hasAddress button=""}

</body>
</html>
{/nocache}
