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

   <style>
       .protestPanel      { display: none; }
       .protestPanel.show { display: block; }

       .outdented   { padding-left: 1.5em;  text-indent: -1.5em; }
       .indented    { padding-left: 1.5em;}
   </style>

   <script               src="share.js"></script>
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search02.js"></script>
</head>

<body style="font-family: Roboto;">

{include file="inc-topbar.tpl"}

<p style="font-size: 10%;">&nbsp;</p>

<div class="darkBlueText pageText unindentList">
   <p/>
   <b>THIS PAGE IS STILL EXPERIMENTAL</b>
   <p/>
   <b>Endorsed Candidates</b>
   <p/>
   Right now, only a very few Democratically-endorsed candidates have been identified.&nbsp;
   After the primary elections are over in August, we'll be able to post a fully-detailed list
   for your district.

   <center>
      <div style="padding-bottom: 0.5em;"><b>Nov 3, 2026</b> Democratic Party Endorsements</b></div>
      {$backclass=1}
         {foreach from=$rows item=row}
            <table width="90%" cellspacing="0" cellpadding="4" style="max-width: 30em;">
               <tr valign="top" class="back{$backclass}">
                  <td>{$row['miv_title']}</td>
                  <td align="right"><a href="singleCandidate.php?id={$row['iid']}" class="noUnderline">{$row['name']}</a></td>
               </tr>
            </table>
            {$backclass=1-$backclass}
         {/foreach}
   </center>
   <br/>

   Currently, the known endorsed candidates are:
   <ul style="margin-top: 0.3em;">
      <li>State attorney general: <a href="https://www.eliformichigan.com/">Eli Savit</a></li>
      <li>Secretary of State: <a href="https://garlingilchrist.com/">Garlin Gilchrist</a></li>
      <li>State Supreme Court: (2 seats):
         <ul>
            <li><a href="https://cavanaghforjustice.com/">Megan Cavanagh</a></li>
            <li><a href="https://www.noahhoodforjustice.com/">Noah Hood</a></li>
         </ul>
      </li>
      <li>State Board of Education: (2 seats)
         <ul>
            <li><a href="https://www.facebook.com/tiffanytilleyforstateboard/">Tiffany Tilley</a></li>
            <li>Judith Pritchett</li>
         </ul>
      </li>
      <li>University of Michigan Board of Regents: (2 seats)
         <ul>
            <li><a href="https://www.facebook.com/GoBlueVoteBrown/">Paul Brown</a></li>
            <li><a href="https://amirmakled.com/">Amir Makled</a></li>
         </ul>
      </li>
      <li>Michigan State University Board of Trustees:
         <ul>
            <li>Brianna Scott</li>
            <li>Kelly Tebay Zemke</li>
            </ul>
         </li>
      <li>Wayne State University Board of Governors: (2 seats)
         <ul>
            <li>Shereef Akeel</li>
            <li>Richard Mack</li>
         </ul>
      </li>
   </ul>

</div>


<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=true}

</body>
</html>
{/nocache}
