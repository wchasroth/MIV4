<!DOCTYPE html>
{nocache}
<html lang="en">
<head>
   {include file="inc-head.tpl"}

   <script               src="mivoter02.js"></script>
   <script               src="share.js"></script>
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search02.js"></script>

    <style>
      .followInput {
         width: 90%;
         margin-bottom: 1em;
         font-size: 110%;
      }
      
      .followInput::placeholder {
         font-weight: bold;
         opacity: 1;
      /* color: #094163; */
         color: #003052;
      }
      
      .followSubmit {
         color: white;
         background-color: #5cace6;
         border-color:     #5cace6;
         border-style:     solid;
         border-radius: 5px;
         font-size: 120%;
      }
   </style>

</head>

<body onLoad="initialize();">

{include file="inc-topbar.tpl"}

<div class="darkBlueText pageText unindentList" style="margin-top: 0.8ex;">
<center>
   <form action="followsubmit.php" method="POST">
      <p/>
      <input type='text'   name='namefld'  class="followInput" placeholder="Your name (optional)" /><br/>
      <input type='text'   name='emailfld' class="followInput" placeholder="Email Address"        /><br/>
      <p/>
      <input type='Submit' name='submit' class="followInput followSubmit" value='Sign Me Up'><br/>
   </form>
</center>
</div>

<center>
<i><a href="index.php">(Return to home page)</a></i>
</center>


<p>&nbsp;</p>

{include file="inc-trailer.tpl"}

{include file="inc-bottombuttons.tpl" hasAddress=true}

</body>
</html>
{/nocache}
