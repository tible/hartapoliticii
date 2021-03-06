{* Smarty *}

<table width=970 cellspacing=10>
  <tr>
    <td width=210 valign="top">
      {* ------------------------------------------------------------------*}
      {* Show the politicians that are most present in the news. *}
      <p class="smalltitle">
        <strong>Cei mai mediatizați</strong><br>
      </p>
      <table width=100% cellspacing=4 cellpadding=0>
      {section name=c loop=$topPeople}
      {strip}
        <tr>
          <td valign="top" width=25>
            <img src="{$topPeople[c].tiny_photo}" width="22" height="30">
          </td>
          <td width=205 style="white-space:nowrap" class="medium">
            <a href="?name={$topPeople[c].name}">
              {$topPeople[c].display_name}
            </a>
            &nbsp;
            <img valign="absmiddle" src="images/transparent.png"
            {if ($topPeople[c].mentions_dif > 0)}
               class="up_arrow"
               title="{$topPeople[c].mentions_dif}
                      articole în plus față de săptămâna anterioară"
            {else}
              class="down_arrow"
              title="{$topPeople[c].mentions_dif*-1}
                     articole în minus față de săptămâna anterioară"
            {/if}
            >&nbsp;{$topPeople[c].mentions}
          </td>
        </tr>
      {/strip}
      {/section}
      </table>


      {* ------------------------------------------------------------------*}
      {* Show the presence for the senate. *}
      <p class="smalltitle">
        <strong>Prezența Senat</strong><br>
      </p>

      <table width=210 cellspacing=0 cellpadding=0>
        {include file="home_page_summary_presence_list.tpl"
            people=$top_senators}
        <tr>
          <td colspan="2">...</td>
        </tr>
        {include file="home_page_summary_presence_list.tpl"
            people=$bottom_senators}
      </table>

      {* ------------------------------------------------------------------*}
      {* Show the presence for the house of deputies. *}
      <p class="smalltitle">
        <strong>Prezența Cam. Dep.</strong><br>
      </p>

      <table width=210 cellspacing=0 cellpadding=0>
        {include file="home_page_summary_presence_list.tpl" people=$top_cdep}
        <tr>
          <td colspan="2">...</td>
        </tr>
      {include file="home_page_summary_presence_list.tpl" people=$bottom_cdep}
      </table>

    </td>

    <td valign="top" width="510">
      {* ------------------------------------------------------------------*}
      {* The main news section from the front page. *}
      <br>
      <div class="medium">

      <table cellspacing=2 cellpadding=2 class="recent_news">
        {section name=n loop=$news}
          <tr>
          <td valign="top">
            <span class="small">
              <em>{$news[n].time|date_format:"%e&nbsp;%b"}</em><br>
              <em><span class="light_gray">{$news[n].time|date_format:"%l%p"|replace:"PM":"pm"|replace:"AM":"am"}</span></em>
            </span>
          </td>

          {if $news[n].photo != ""}
            <td valign="top">
          {else}
            <td colspan="2" valign="top">
          {/if}

            <div class="recent_news_block">
              <div class="recent_news_title black_link">
                <a href="{$news[n].link}" target="_blank">
                  {$news[n].title}
                </a>
              </div>&nbsp;
              <nobr>
              <img src="images/popout_icon.gif" border="0" width="12"
                   height="12" hspace="5">
                <span class="gray medium">{$news[n].source}</span>
              </nobr>

              <div class="mentions_block">
                {section name=x loop=$news[n].people}
                {strip}
                  <div class="news_list_mention green_link">
                    <a href="?name={$news[n].people[x].name}">
                      {$news[n].people[x].display_name}
                    </a>
                  </div>
                {/strip}
                {/section}
              </div>
            </div>
          </td>

          {if $news[n].photo != ""}
            {* If this article has a photo, put a div here with that photo *}
            <td width="100" valign="top">
              <div class="container">
                <div class="photo">
                  <img src="{$news[n].photo}?width=100">
                </div>
              </div>
            </td>
          {/if}

          </tr>
        {/section}
      </table>
      </div>

      {*
      For now the score cards are going to be hard coded because:
        + there aren't that many
        + there need to be some changes to split them on cdep vs. senat tags
      TODO: make the list of public score cards dynamic, not hard coded.
      *}
      <p class="smalltitle">
        <strong>
          Busola politică pentru parlamentari
        </strong>
      </p>
      <div class="medium">
        <div class="gray" style="margin-left: 10px;">
          O listă de probleme și cum au votat parlamentarii români pe fiecare
          dintre aceste problematici generale.
        </div>
        <table cellspacing=10 cellpadding=0 class="recent_news">

          <tr>
          <td valign="top" width="200" class="small">
            <a href="/?cid=15&tagid=17&room=senat">
              Drepturi Civile Digitale - Senat
            </a>
          </td>

          <td valign="top">
            <span class="small">
              libertate de exprimare, dreptul la viață privată, open copyright.
              <div class="gray">Tag alcătuit de
                <a href="http://apti.ro">
                  <img src="http://apti.ro/sites/default/files/apti.png"
                     align="absmiddle" vspace=5 hspace=5
                     height="15" border=0></a>
              </div>
            </span>
          </td>
          </tr>

          <tr>
          <td valign="top" width="200" class="small">
            <a href="/?cid=15&tagid=17&room=cdep">
              Drepturi Civile Digitale - Cdep
            </a>
          </td>

          <td valign="top">
            <span class="small">
              libertate de exprimare, dreptul la viață privată, open copyright.
              <div class="gray">Tag alcătuit de
                <a href="http://apti.ro">
                  <img src="http://apti.ro/sites/default/files/apti.png"
                     align="absmiddle" vspace=5 hspace=5
                     height="15" border=0></a>
              </div>
            </span>
          </td>
          </tr>

          <tr>
          <td valign="top" width="200" class="small">
            <a href="/?cid=15&tagid=5&room=cdep">
              Despre Adrian Năstase - Cdep
            </a>
          </td>

          <td valign="top">
            <span class="small">
              votarea trimiterii lui în instanță.
              <div class="gray">Tag alcătuit de Vivi.</div>
            </span>
          </td>
          </tr>

        </table>
        <div class="gray" style="margin-left: 10px;">
         Mai multe detalii despre cum au fost alcătuite aceste clasamente
          <a href="http://www.hartapoliticii.ro/?p=4042">aici</a>.
        </div>
      </div>
    </td>

    <td valign="top" width="250">

      <div class="fb-like" style="margin-top: 15px;margin-bottom:15px;"
           data-href="http://hartapoliticii.ro"
           data-send="false" data-width="250" data-show-faces="false"
           data-action="like" data-font="verdana"></div>

      <!-- Place this tag where you want the +1 button to render -->
      <g:plusone annotation="inline" width="250" href="http://hartapoliticii.ro"></g:plusone>

      {literal}
      <!-- Place this render call where appropriate -->
      <script type="text/javascript">
        window.___gcfg = {lang: 'en'};

        (function() {
          var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
          po.src = 'https://apis.google.com/js/plusone.js';
          var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
        })();
      </script>
      {/literal}

     <p class="smalltitle">
       <strong>
         Blog
       </strong>
     </p>
      {* ------------------------------------------------------------------*}
      {* Show the most recent blog posts and maybe the number of comments. *}
      {section name=b loop=$blogposts}
        <div class="small home_blog_post">
          <span class="gray">
            <em>{$blogposts[b].d|date_format:"%d&nbsp;%b"}</em>
          </span>
          <span class="green_link">
            <a href="/?cid=16&p={$blogposts[b].id}">
              {$blogposts[b].post_title}</a>
          </span>
          <span class="gray home_blog_post_comments">
            <img src="i/comments_icon.png" align="absmiddle" alt="Comments"
                 title="Comments">
            {$blogposts[b].comment_count}
          </spam>
        </div>
      {/section}
      <span class="small">
        <em><a href="/?cid=16">vezi tot blogul...</a></em>
      </span>

      {* ------------------------------------------------------------------*}
      {* A list of active parties. *}
      <p class="smalltitle">
        <strong>
          Partide active
        </strong>
      </p>
      <table width="250">
      <tr>
        <td valign="center" align="center" width="70">
          <a href="/?cid=17&id=1">
            <img src="/images/parties/1.gif" height="50" border="0">
          </a>
        </td>
        <td valign="center" align="center" width="70">
          <a href="/?cid=17&id=2">
            <img src="/images/parties/2.jpg" width="50" border="0">
          </a>
        </td>
        <td valign="center" align="center" width="70">
          <a href="/?cid=17&id=7">
            <img src="/images/parties/7.jpg" width="50" border="0">
          </a>
        </td>
        <td valign="center" align="center" width="70">
          <a href="/?cid=17&id=14">
            <img src="/images/parties/14.jpg" width="50" border="0">
          </a>
        </td>
      </tr>
      </table>

      {* ------------------------------------------------------------------*}
      {* An explanatory text about this website. *}
      <p class="smalltitle">
        <strong>
          Despre acest site
        </strong>
      </p>
      <div class="small">
      Harta Politicii este o colecție de date despre politicienii români în
      speranța de a oferi cât mai mult context pentru fiecare politician.
      <p>
      Apoi cu aceste date am tras concluzii utile cum ar fi câte voturi au
      contat la alegerile parlamentare sau simulatorul de alegeri
      europarlamentare.

      <p>
      <b>Atenție</b>
      <p>
      Toate datele de pe acest site sunt alcătuite din informații prezente
      online. Deși eu sper că sunt corecte, este foarte posibil ca uneori să
      se strecoare erori neintenționate pentru care nu îmi asum răspunderea.
      </div>
    </td>
  </tr>
</table>
