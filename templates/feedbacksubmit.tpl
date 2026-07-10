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
     If you supplied an email address, we will respond once we have examined
     the issue.&nbsp;
     We appreciate any and all suggestions for improvement.

     <p/>
     If you haven't already, you might want to look through the 
     <a href="faq.php">FAQ</a> page -- it might help answer any
     questions you might have.
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
