   <div class="accordion" onClick="flipPanel('emergency');">What if I have an emergency on Election Day?</div>
   <div class="panel" id='emergency'>
       <p>
              You may request an emergency absent voter ballot <i>after</i> the deadline
              for regular absent voter ballots has passed, but <i>before</i> 4 PM on
              Election Day.
              <p></p>
              The emergency must have made it impossible for you to apply for a regular
              absent voter ballot.&nbsp;
              For more information about emergency absent voter ballots,
              {if $hasAddress}
                 contact the
                 <a href="clerkMap.php"><b>{$clerkJurisdiction} Clerk</b></a>.
              {else}
                 contact your local clerk's office.&nbsp;
                 (To find your clerk, enter your address at the very top of this page.)
              {/if}
       </p>
  </div>

