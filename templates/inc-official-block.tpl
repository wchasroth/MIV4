
{$backclass=0}
<button class="accordion" onClick="flipPanel('{$block}', this);">{$title}</button>
<div class="panel" id='{$block}'>
   {foreach from=$rows item=row}
      <table width="100%" cellspacing="0" cellpadding="8">
      <tr valign="top" class="back{$backclass}">
         <td>{$row['miv_title']}</td>
         <td align="right"><a href="singleOfficial.php?id={$row['id']}" class="noUnderline">{$row['name']}</a></td>
      </tr>
      </table>
      {$backclass=1-$backclass}
   {/foreach}
</div>