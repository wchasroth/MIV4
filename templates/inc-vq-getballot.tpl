   <div class="accordion" onClick="flipPanel('absenteeAlways');">How do I get an absentee ballot?</div>
   <div class="panel" id='absenteeAlways'>
       <p>
       You can <a href="https://mvic.sos.state.mi.us/AVApplication/Index"
                 onClick="return externalLink(this);" target="_blank"
               >request an absentee ballot</a> online

       <span class='red'>
       or in person at
       {if $hasAddress}
              the <a href="clerkMap.php">{$clerkJurisdiction} Clerk's</a> office.
       {else}
              your local clerk's office.&nbsp; 
              (Enter your address at the top to find it.)&nbsp;
       {/if}
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

