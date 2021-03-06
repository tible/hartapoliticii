{* Smarty *}

<div style="padding-left:10px">
  <div class="search_declarations_panel">
    <form action="/" method="GET">
      <input type=hidden name="name" value="{$name}">
      <input type=hidden name="exp" value="person_declarations">

      <input type=text size=30 name=dq value="{$dq}"
             id="declarations_q">
      <input type=submit value="Caută" id="cauta">
    </form>
    <div class="small gray">
      Exemplu: "pensii", "taxe", etc
    </div>
  </div>
  <table width=100% cellspacing=2 cellpadding=2>
    {section name=n loop=$declarations}
    {strip}
      <tr>
      <td valign="top">
        <span class="light_gray">
          {$smarty.section.n.index+1+$start}
        </span>
      </td>
      <td valign="top">
       <span class="small">
         <em>{$declarations[n].time|date_format:"%d&nbsp;%b"}</em><br>
         <em>
           <span class="light_gray">
             {$declarations[n].time|date_format:"%Y"}
           </span>
         </em><br>
       </span>
      </td><td valign="top">

       <div class="small declaration_snippet">
         {$declarations[n].snippet|truncate:300:"...":true}&nbsp;
         <div class="declaration_source">
           <img src="images/popout_icon.gif" border="0"
                width="12" height="12">&nbsp;
           <span>
             Sursa: <a href="{$declarations[n].source}">stenograme parlament</a>
           </span>
         </div>
         </a>
       </div>
      </td>
      </tr>
    {/strip}
    {/section}
  </table>

  {if !$first_page}
    <a href="{$prev_page_link}">Prev</a>
  {else}
    Prev
  {/if}

  /

  {if !$last_page}
    <a href="{$next_page_link}">Next</a>
  {else}
    Next
  {/if}

</div>
