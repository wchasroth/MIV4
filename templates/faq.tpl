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

{$ui->get('pg-faq-top')}
<p/>

   <div class="accordion" onClick="flipPanel('whyAddress');">{$ui->get('pg-faq-whyaddr')}</div>
   <div class="panel" id='whyAddress'>
      <p>{$ui->get('pg-faq-whyaddr-text')}</p>
   </div>

   <div class="accordion" onClick="flipPanel('endorsed');">{$ui->get('pg-faq-endorsed')}</div>
   <div class="panel" id='endorsed'>
      <p>{$ui->get('pg-faq-endorsed-text')}</p>
   </div>

   <div class="accordion" onClick="flipPanel('whyDemocratic');">{$ui->get('pg-faq-whydem')}</div>
   <div class="panel" id='whyDemocratic'>
      <p>{$ui->get('pg-faq-whydem-text')}</p>
   </div>

   <div class="accordion" onClick="flipPanel('missingOffices');">{$ui->get('pg-faq-some')}</div>
   <div class="panel" id='missingOffices'>
      <p>{$ui->get('pg-faq-some-text')}</p>
   </div>

   <div class="accordion" onClick="flipPanel('votingDenied');">{$ui->get('pg-faq-denied')}</div>
   <div class="panel" id='votingDenied'>
      {$ui->get('pg-faq-denied-text')}
   </div>

   <div class="accordion" onClick="flipPanel('iAmCandidate');">{$ui->get('pg-faq-notme')}</div>
   <div class="panel" id='iAmCandidate'>
      <p>{$ui->get('pg-faq-notme-text')}</p>
   </div>

   <div class="accordion" onClick="flipPanel('whoIs');">{$ui->get('pg-faq-whois')}</div>
   <div class="panel" id='whoIs'>
      <p>{$ui->get('pg-faq-whois-text')}</p>
   </div>

   <div class="accordion" onClick="flipPanel('feedback');">{$ui->get('pg-faq-feedback')}</div>
   <div class="panel" id='feedback'>
      <p>{$ui->get('pg-faq-feedback-text')}</p>
   </div>

   <div class="accordion" onClick="flipPanel('video');">{$ui->get('pg-faq-video')}</div>
   <div class="panel" id='video'>
      <p>{$ui->get('pg-faq-video-text')}</p>
   </div>


</div>

<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress={$hasAddress} button=""}

</body>
</html>
{/nocache}
