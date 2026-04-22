<!DOCTYPE html>
{nocache}
<html lang="en">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<meta        name="description" content="Find your Michigan Democratically-endorsed candidates" />
<meta property="og:description" content="Find your Michigan Democratically-endorsed candidates" />

<title>MIVoter</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto">

<head>
    <script               src="parseHouseStreet.js"></script>
    <script type="module" src="address-search02.js"></script>
    <script>
       function setAddressCookie (address) {
          document.cookie = "miAddress=" + value + "; path=/";
          location.href   = "/welcome.php";
       }
    </script>

    <style>
        @media screen and (min-width: 600px) {
            body {
                max-width: 750px!important;
                margin: 0 auto!important;
                background-position: center top;
                background-size: 750px;
            }
            .bottom {
                max-width: 750px!important;
            }
            /*
               body > div:nth-child(3) > img:nth-child(5) {
                   top: 300px!important;
               }
               .welcomeMessageStyle {
                   max-width: 550px!important;
                   margin: 0 100px!important;
                   margin-top: 200px !important;
               }
               .spacer {
                   height: 70px!important;
               }
               .bottomSpacer {
                   height: 1em;
               }
               .bottomFill {
                   padding-bottom: 1em;
               }
            */
        }

        /* For narrow phones, like the iPhone 5 -- shrink the font-size of the initial description under the logo */
        @media screen and (max-width: 330px) {
            .waveHeaderText {
                font-size: 108%;
                font-weight: bold;
                margin-top: 0.5em;
            }
        }
        @media screen and (min-width: 331px) {
            .waveHeaderText {
                font-size: 140%;
                font-weight: bold;
                margin-top: 0.5em;
            }
        }

        .unindentList ul { margin-left: -12px;  line-height: 120%; }
        .unindentList ol { margin-left: -12px;  line-height: 120%; }
        .unindentList li { margin-top: 0.4em;   line-height: 120%; }
        .unindentList li span {
            position: relative;
            left: -0.2em;
            line-height: 120%;
        }
        p { line-height: 120%; }
        p + ul { margin-top: -0.8em; }
        ul + p { margin-top: -0.8em; }

        html, body {
            height: 100%;
        }

        body {
            display: flex;
            flex-direction: column;
            max-width: 25em;
            margin-top: 1px;
            margin: 0;
        }

        .topBar {
            margin-left:  10px;
            margin-right: 10px;
        }
        .darkBlueText {
            color: #003052;
        }
        .pageText {
            margin-left: 10px;
            margin-right: 10px;
        }
        .button {
            padding-top:    10px;
            padding-bottom: 10px;
            margin-top:      5px;
            margin-bottom:   5px;
            color: white;
            line-height: 100%;
            font-size:   90%;
            text-align: center;
            text-decoration: none;
        }
        .inactive {
            background-color: rgb(151,151,151);
        }
        .buttonLink {
            text-decoration: none;
            color: inherit;
        }
        .buttonImage {
            margin-bottom: 5px;
        }
        /* --- The nailed-to-the-bottom webapp nav buttons ------- */
        .bottom {
            position: fixed;
            bottom: 0;
            width: 100%;
            margin-left: 0;
            background-color: #ffffff;
            z-index: 3;
        }
        .bottomSpacer {
            width: 100%;
            height: 0px;
            background-color: #003052;
        }
        .pill {
            border: none;
            background-color: #5cace6;
            color:  white;
            padding-top:    0px;
            padding-right:  0px;
            padding-bottom: 0px;
            padding-left: 4px;
            display: inline-block;
            margin:  4px 2px;
            border-radius: 20px;
            font-size: 100%;
            letter-spacing: .1rem;
            text-align: left;
            width: 7em;
        }

        .fullWidth {
           width: 100vw; 
           max-width: 750px;
        }

        address-search {
            font-family: 'Roboto';
            display: block;
            width: 93vw;
            max-width: 725px;
            margin: 0 10px 10px 10px;
            /* margin: 50px auto; */
        }

    </style>
</head>

<body style="font-family: Roboto;">

<div class="fullWidth" style="background-image: url('IMG/waveTopBackground5.png'); background-size: cover;">
   <div class="topBar">
      <a class="navbar-brand" href="/">
         <img src="IMG/waveLogo5.png" width="200" style="margin-top: 10px;"/>
      </a>
   </div>

   <div class="waveHeaderText" style="margin-left: 7px; margin-right: 7px; line-height: 130%; color: white;" >
      &nbsp;<i><u>Your</u></i>&nbsp; 2026 Michigan Voter Guide
   </div>
   <div style="height: 10px;">&nbsp;</div>

   <address-search address='{$address}'></address-search>
</div>

<p style="font-size: 10%;">&nbsp;</p>
<div class="darkBlueText pageText unindentList">
    address={$address}<br/>

    <b>To get started,</b> enter your address in the box above.
    <div style="height: 10px;">&nbsp;</div>

    MIvoter.org is the <b>one stop shop</b> for all Michigan Democratic voters:
    <ul>
        <li>See <b>your</b> elected officials
        <li>Register to vote
        <li>See endorsed candidates
        <li>Find protests &amp; events
        <li>And much, much more
    </ul>

    <i style="font-size: 90%;">(We <b>never</b> track your address.&nbsp; Only your browser remembers it.)</i>
</div>


<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
{include file="trailer.tpl"}


<div class="bottom" style='max-width: 25em; background-color: #003052; padding-bottom: 0px;'>
   {include file="bottombuttons.tpl" hasAddress=false}
</div>

<!-- 'Float' the bottom buttons up a little, depending on @media detection, see base.css and head.html -->
<div class="bottomSpacer">&nbsp;</div>

</body>
</html>
{/nocache}
