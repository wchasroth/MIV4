
<button class="accordion" onClick="flip('{$block}', this);">{$title}</button>
<div class="panel" id='{$block}'>
   <table>
      {foreach from=$rows item=row}
      <tr>
         <td>{$row['miv_title']} {$row['dist']}</td>
         <td>{$row['name']}</td>
      </tr>
      {/foreach}
   </table>
</div>
