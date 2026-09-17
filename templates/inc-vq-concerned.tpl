
{$mailvote = 0}
{if $mailvote == 0}
   <div class="accordion" onClick="flipPanel('concerned');">Concerned about your mailed ballot?</div>
   <div class="panel" id='concerned'>
         <p/>
         Legal cases so far have upheld our right to vote by mail.&nbsp;
         No matter what happens, you can always go to your clerk’s office, 
         request a ballot, and vote during the early voting period and up to 8 pm on Election Day.&nbsp;
         If you will be out of your district during this period, 
         be sure to drop your ballot at your clerk's drop box by 8pm on election day.

         <p/>
         You can find everything you need to know and where and when to vote at the Secretary of State’s site: 
         <a href="https://mi.gov/vote" target="_blank">mi.gov/vote</a>.
   </div>
{/if}

{if $mailvote == 2}
   <div class="accordion" onClick="flipPanel('worried');">What if I'm worried about voting by mail?</div>
   <div class="panel" id='worried'>
      <p/>
      Recent legal cases continue to uphold Michi&shy;ganders' rights to vote by mail.&nbsp;
      Here's what to know:
      <ul>
      <li><b>If you're already on the permanent mailed ballot list:</b>
        your ballot is coming and mail voting remains fully legal and protected.&nbsp;
        Return it by mail (2 weeks ahead), drop box, clerk's office, early voting site, 
        or your polling place by 8 pm on Election Day.
      <li><b>If you prefer to vote in person:</b>
          visit your clerk's office, vote during early voting, or go to your polling place on Election Day.
      <li><b>If your ballot didn't arrive:</b> see the FAQ <a href="#" onClick="return flipPanel('noBallot');"
                >What if my ballot didn't arrive in the mail?</a>
   </div>
{/if}

{if $mailvote == 1}
   <div class="accordion" onClick="flipPanel('concerned');">Concerned about your mailed ballot?</div>
   <div class="panel" id='concerned'>
       <p/>
       Recent legal cases continue to uphold our right to vote by mail.&nbsp;
       This includes requesting and receiving your ballot by mail,
       and mailing it back to your clerk.

       <p/>
       If you have concerns, you can go to your clerk’s office, and <b>get</b> a ballot.&nbsp;
       Whichever way you get it, you can:
       <ul>
       <li>mail it back (but allow 2 weeks for safety)
       <li>give it directly to your clerk's office during business hours
       <li>deliver it to any of your early voting locations
       <li>deliver it to your Election day polling place
       <li>put it in any secured, official ballot drop-box in your city or township.&nbsp;
       </ul>
       If you will be out of your district during voting days,
       put it in a drop box by 8 pm on Election day.

       <br>&nbsp;</br>
       You can find everything you need to know, and where and when to vote, at the Secretary of State’s site: 
       <a href="https://mi.gov/vote" target="_blank">mi.gov/vote</a>.
       </p>
  </div>
{/if}

