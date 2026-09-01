<!DOCTYPE html>
{nocache}
<html lang="en">
<head>
   {include file="inc-head.tpl"}

   <style>
       .protestPanel      { display: none; }
       .protestPanel.show { display: block; }

       .outdented   { padding-left: 1.5em;  text-indent: -1.5em; }
       .indented    { padding-left: 1.5em;}
   </style>

   <script               src="mivoter02.js"></script>
   <script               src="share.js"></script>
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search03.js"></script>
</head>

<body onLoad="initialize(); setCounty({$county});">

{include file="inc-topbar.tpl"}

<div class="darkBlueText pageText unindentList" style="margin-top: 0.8ex;">
   <p/>
   <b {if $editor} title='pg-feedback-hdr' {/if}>Feedback</b>

   <form action="feedbacksubmit.php" method="POST">
   <span {if $editor} title='pg-feedback-name' {/if} >
   Your name (optional)<br/>
   </span>
   <input type="text" name="name"  style="width: 90%; max-width: 30em;"/>

   <p/>
   <span {if $editor} title='pg-feedback-email' {/if} >
   Your email address (if you want a response)<br/>
   </span>
   <input type="text" name="email" style="width: 90%;  max-width: 30em;"/>

   <p/>
   <span {if $editor} title='pg-feedback-name' {/if} >
   Your comments</br>
   </span>
   <textarea name="comments" rows="4" style="width: 90%;  font-family: inherit; font-size: inherit;"></textarea>

   <p/>
   <input type="submit" value="Send Feedback" {if $editor} title='pg-feedback-send' {/if} />

   </form>

</div>


<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=true}

</body>
</html>
{/nocache}
