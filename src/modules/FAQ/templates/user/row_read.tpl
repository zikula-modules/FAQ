<a id="faq{$faqid}"></a>
{if $shorturls and $shorturlstype eq 0 and $addcategorytitletopermalink}
<p><a href="{modurl modname="FAQ" func="display" faqid=$faqid cat=$__CATEGORIES__.Main.name}"><strong>{$question|modcallhooks|safehtml}</strong></a></p>
{else}
<p><a href="{modurl modname="FAQ" func="display" faqid=$faqid}"><strong>{$question|modcallhooks|safehtml}</strong></a></p>
{/if}
<p>{$answer|modcallhooks|safehtml}</p>
<hr />