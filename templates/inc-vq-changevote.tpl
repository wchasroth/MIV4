   <div class="accordion" onClick="flipPanel('changeVote');">{$ui->get('inc-vq-change')}</div>
   <div class="panel" id='changeVote'>
      {if $hasAddress}
         {$ui->get('inc-vq-change-text')}
      {else}
         {$ui->get('inc-vq-change-text-noaddr')}
      {/if}
  </div>

