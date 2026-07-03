<!DOCTYPE html>
{nocache}
<html lang="en">
<head>
   <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   
   <meta        name="description" content="Find your Michigan Democratically-endorsed candidates" />
   <meta property="og:description" content="Find your Michigan Democratically-endorsed candidates" />
   
   <title>MIvoter</title>
   
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto">
   <link rel="stylesheet" href="mivoter02.css">

   <style>
       a { text-decoration: none; }
       a, a:visited { color: blue; }
       .pad { padding-bottom: 0.5em; }
   </style>
   <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key={$apiKey}&libraries=places"></script>
</head>

<body style="font-family: Roboto;">

<div class="darkBlueText pageText unindentList" style="max-width: 40em; font-size: 90%;">

 <table width="100%">
 <tr valign="top">
     <td><button class="roundButton" onClick="window.history.back();">Back</button></td>
     <td>&nbsp;&nbsp;</td>
     <td align="right">
         <b style="font-size: 125%;">{$clerk['jurisdiction']} Clerk</b><br/>
         <i>Click pin to get full map.</i>
     </td>
 </tr>
 </table>

<table width="100%">
    <tr><td class="pad" colspan="3"><b>Clerk: {$clerk['name']}</b></td></tr>
    <tr valign="top">
        <td class="pad"><b>Address:</b> {$clerk['street_address']}</td>
        <td></td>
        <td class="pad"><b>Mail:</b>    {$clerk['mailing_address']}</td>
    </tr>
    <tr valign="top">
        <td class="pad"><b>Phone:</b> <a href="tel:+1{$clerk['phoneDigits']}">{$clerk['phone']}</a></td>
        <td></td>
        <td class="pad"><b>Fax:</b>   {$clerk['fax']}</td>
    </tr>
    <tr valign="top">
        <td class="pad"><b>Email:</b>
            <a href="mailto:{$clerk['email']}">{$clerk['email']}</a></td>
        <td></td>
        <td class="pad"><b>Hours:</b>   {$clerk['hours']}</td>
    </tr>
</table>

<div id="clerkMap" style="width: 100vw; height: 400px; max-width: 40em;"></div>

<script>
    let lat  = {$clerk['lat']};
    let lng  = {$clerk['lng']};
    let addr = "{$clerk['street_address']}";

    let map = new google.maps.Map(document.getElementById('clerkMap'), {
        zoom: 12,
        center: new google.maps.LatLng(lat, lng),
        mapTypeId: google.maps.MapTypeId.ROADMAP
    });
    let infowindow = new google.maps.InfoWindow();
    const marker = new google.maps.Marker({
        position: new google.maps.LatLng(lat, lng),
        title: addr,
        map: map
    });
    marker.url = 'https://www.google.com/maps/place/' + addr.replace(' ', '+') + '/@' + lat + ',' + lng;
    marker.addListener('click', () => {
        window.location.assign(marker.url);
    });
</script>

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

{include file="inc-bottombuttons.tpl" hasAddress=true}

</body>
</html>
{/nocache}
