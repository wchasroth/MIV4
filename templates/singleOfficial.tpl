<!DOCTYPE html>
{nocache}
<html lang="en">
<head>
   {include file="inc-head.tpl"}

   <script               src="mivoter02.js"></script>
   <script               src="share.js"></script>
   <script               src="parseHouseStreet.js"></script>
   <script type="module" src="address-search03.js"></script>

   <style>
       tr:nth-child(odd of .zebra) { background-color: #f2f2f2;}
       td {
          padding: .4em;
       }
       a { text-decoration: none; }
       a, a:visited { color: blue; }
       .urlColumn {
           /* max-width: 75%; */
           width: 80%;
           word-break: break-all;
       }
    </style>
</head>

<body onLoad="initialize();">

<div class="darkBlueText pageText unindentList" style="max-width: 30em;">

<table width="100%" style="font-size: 120%;">
    <tr valign="top">
        <td>{$name}<br>{$title} {$party}<br/><br/>
            <button class='roundButton' onClick="window.history.back();" {if $editor} title='pg-1official-back' {/if}>Back</button>
        </td>
        <td align="right"><img src="{$headshot}" width="150"/></td>
    </tr>
    </tr>
</table>

<table cellspacing="0" cellpadding="0">
    <tr class="zebra" valign="top"><td {if $editor} title='pg-1official-addr' {/if} >{$ui->get('pg-1official-addr')}</td> <td>{$address}</td></tr>
    <tr class="zebra" valign="top"><td {if $editor} title='pg-1official-phone' {/if} >{$ui->get('pg-1official-phone')}</td>   
            <td class="urlColumn"><a href="tel:{$phone}">{$phone}</a></td></tr>
    <tr class="zebra" valign="top"><td {if $editor} title='pg-1official-email' {/if} >{$ui->get('pg-1official-email')}</td>   <td class="urlColumn"><a href="mailto:{$email}"
                   onClick="return externalLink(this);" target="_blank"
            >{$email}</a></td></tr>
    <tr class="zebra" valign="top"><td {if $editor} title='pg-1official-web' {/if} >{$ui->get('pg-1official-web')}</td>   <td class="urlColumn"><a href="{$url}"
                   onClick="return externalLink(this);" target="_blank"
           >{$web}</a></td></tr>
    <tr class="zebra" valign="top"><td colspan="2" style="font-size: 90%;" {if $editor} title='pg-1official-disclaim' {/if} >
        {$ui->get('pg-1official-disclaim')}
    </td></tr>

</table>
</div>



<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

{include file="inc-bottombuttons.tpl" hasAddress=true}

</body>
</html>
{/nocache}
