
<button class="accordion" onClick="flip('{$block}', this);">{$title}</button>
<div class="panel" id='{$block}'>
   <table width="100%">
      {foreach from=$rows item=row}
      <tr>
         <td>{$row['miv_title']} {$row['dist']}</td>
         <td align="right"><a href="singleOfficial.php?id={$row['id']}">{$row['name']}</a></td>
      </tr>
      {/foreach}
   </table>
</div>