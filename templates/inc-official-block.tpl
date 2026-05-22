
<button class="accordion" onClick="flip('{$block}', this);">{$title}</button>
<div class="panel" id='{$block}'>
   {foreach from=$rows item=row}
      <table width="100%">
      <tr valign="top">
         <td>{$row['miv_title']}</td>
         <td align="right"><a href="singleOfficial.php?id={$row['id']}" class="noUnderline">{$row['name']}</a></td>
      </tr>
      </table>
   {/foreach}
</div>