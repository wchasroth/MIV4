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
Two of those seats are up for election 2026.&nbsp;

<p/>
But the primary election result shows one "Hanna Demerath" as running for a partial-term race.&nbsp;
So, somebody <b>else</b> resigned.&nbsp; Who?&nbsp; Who is she running to replace?

<p/>
Worse, our database shows <b>10</b> seats on the council, but a quick Google search says that
there are 7.&nbsp; So our data needs some TLC!

<p/>
<b>The Ask / The Solution</b>
<p/>

</div>

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=$hasAddress button=""}

</body>
</html>
{/nocache}
