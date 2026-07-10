<!DOCTYPE html>
{nocache}
<html lang="en">
<head>
   {include file="inc-head.tpl"}

   <script               src="share.js"></script>
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search02.js"></script>
</head>

<body>

{include file="inc-topbar.tpl"}

<p style="font-size: 10%;">&nbsp;</p>

<div class="darkBlueText pageText unindentList">
     <b>Thank you!</b><br/>
            <br/>
            We will send you (infrequent) updates via email.&nbsp;
            If you wish to be removed from this list,
            reply to emails with "unsubscribe".
            <!-- or to texts with STOP. -->
</div>
<br/>

<center>
<i><a href="index.php">(Return to home page)</a></i>
</center>


<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=true}

</body>
</html>
{/nocache}
