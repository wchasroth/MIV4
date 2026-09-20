   <div class="accordion" onClick="flipPanel('emergency');">{$ui->get('inc-vq-emerg')}</div>
   <div class="panel" id='emergency'>
      <p>
         {if $hasAddress}
            {$ui->get('inc-vq-emerg-text')|dollarDollar:$clerkJurisdiction}
         {else}
            {$ui->get('inc-vq-emerg-text-noaddr')}
         {/if}
       </p>
  </div>

