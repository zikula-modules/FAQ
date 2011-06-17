{include file="user/menu.tpl"}

<h2>{gt text="Question"}</h2>
<p><strong>{$question|safehtml}{* $question|modcallhooks|safehtml *}</strong></p>

<h2>{gt text="Answer"}</h2>
<p>{$answer|safehtml}{* $answer|modcallhooks|safehtml *}</p>
<div style="border-top: 1px dashed #AAA">
    <ul>
        {if $submittedby neq ''}
        <li>{gt text="Submitted by %s" tag1=$submittedby}</li>
        {elseif $submittedbyid neq ''}
        {usergetvar name=uname uid=$submittedbyid assign=uname}
        {capture assign=faqsubmittedby}{$uname|userprofilelink}{/capture}
        <li>{gt text="Submitted by %s" tag1=$faqsubmittedby}</li>
        {/if}
        {if $answeredbyid neq ''}
        {usergetvar name=uname uid=$answeredbyid assign=uname}
        {capture assign=faqansweredby}{$uname|userprofilelink}{/capture}
        <li>{gt text="Answered by %s" tag1=$faqansweredby}</li>
        {/if}
    </ul>
</div>

{modurl modname='FAQ' type='user' func='display' faqid=$faqid assign='returnurl'}
{* modcallhooks hookobject=item hookaction=display hookid=$faqid module=FAQ returnurl=$returnurl *}
