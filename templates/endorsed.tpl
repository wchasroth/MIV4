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

<div class="darkBlueText pageText unindentList" style="padding-top: 0.5em;">
   <b>Endorsed Candidates</b>
   <p/>
   Right now, there are only a few Democratically-endorsed candidates.&nbsp;
   After the August primary elections are over, you'll see a full list
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

   <!--
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
   -->

</div>


<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=true}

</body>
</html>
{/nocache}
