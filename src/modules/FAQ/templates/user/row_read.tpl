<a id="faq{$faqid}"></a>
{if $shorturls and $addcategorytitletopermalink}
<p><a href="{modurl modname="FAQ" type='user' func="display" faqid=$faqid cat=$__CATEGORIES__.Main.name}"><strong>{$question|safehtml}{* $question|modcallhooks|safehtml *}</strong></a></p>
{else}
<p><a href="{modurl modname="FAQ" type='user' func="display" faqid=$faqid}"><strong>{$question|safehtml}{* $question|modcallhooks|safehtml *}</strong></a></p>
{/if}
<p>{$answer|safehtml}{* $answer|modcallhooks|safehtml *}</p>
<hr />
