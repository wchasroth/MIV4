   <div class="accordion" onClick="flipPanel('absenteeAlways');">{$ui->get('inc-vq-getballot')}</div>
   <div class="panel" id='absenteeAlways'>
     <p>
       {if $hasAddress}
          {$ui->get('inc-vq-getballot-text')|dollarDollar:$clerkJurisdiction}
       {else}
          {$ui->get('inc-vq-getballot-text-noaddr')}
       {/if}
     </p>
  </div>

