<!DOCTYPE html>
{nocache}
<html lang="en">
<head>
   <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   
   <meta        name="description" content="Find your Michigan Democratically-endorsed candidates" />
   <meta property="og:description" content="Find your Michigan Democratically-endorsed candidates" />
   
   <title>MIVoter</title>
   
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto">
   <link rel="stylesheet" href="mivoter.css">

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

<body style="font-family: Roboto;" onLoad="initialize();">

{include file="inc-topbar.tpl"}

<p style="font-size: 10%;">&nbsp;</p>

<div class="darkBlueText pageText unindentList">
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
