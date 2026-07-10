<!DOCTYPE html>
{nocache}
<html lang="en">
<head>
   {include file="inc-head.tpl"}

   <style>
       a { text-decoration: none; }
       a, a:visited { color: blue; }
       .pad { padding-bottom: 0.5em; }
   </style>
   <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key={$apiKey}&libraries=places"></script>
</head>

<body>

<div class="darkBlueText pageText unindentList" style="max-width: 40em; font-size: 90%;">

 <table width="100%">
 <tr valign="top">
     <td><button onClick="window.history.back();">Back</button></td>
     <td>&nbsp;&nbsp;</td>
     <td align="right">
         <b style="font-size: 125%;">Error</b><br/>
     </td>
 </tr>
 </table>
    <br/>
    An error has occurred in finding your city or township clerk.<br/>
    <br/>
    We have logged this error, and will investigate and correct it.&nbsp;
    Please try back again in a few days.

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

{include file="inc-bottombuttons.tpl" hasAddress=true}

</body>
</html>
{/nocache}
