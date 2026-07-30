   <div class="accordion" onClick="flipPanel('emergency');">What if I have an emergency on Election Day?</div>
   <div class="panel" id='emergency'>
       <p>
              You may request an emergency absent voter ballot <i>after</i> the deadline
              for regular absent voter ballots has passed, but <i>before</i> 4 PM on
              Election Day.
              <p></p>
              The emergency must have made it impossible for you to apply for a regular
              absent voter ballot. Contact your
              {if $hasAddress}
                 <a href="clerkMap.php"><b>{$clerkJurisdiction} Clerk</b></a>
              {else}
                 local clerk's office (enter your address above to find it)
              {/if}
              for more information about emergency absent voter ballots.
       </p>
  </div>

