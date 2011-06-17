{include file="admin/menu.tpl"}
{gt text="Update FAQ" assign=templatetitle}
<div class="z-admincontainer">
    <div class="z-adminpageicon">{img modname='core' src='edit.png' set='icons/large' alt=''}</div>
    <h2>{$templatetitle}</h2>
    <form id="faq_admin_modifyform" class="z-form z-linear" action="{modurl modname="FAQ" type="admin" func="update"}" method="post" enctype="application/x-www-form-urlencoded">
        <div>
            <input type="hidden" name="authid" value="{insert name="generateauthkey" module="FAQ"}" />
            <input type="hidden" name="faq[faqid]" value="{$faqid|safetext}" />
            <input type="hidden" name="faq[submittedbyid]" value="{$submittedbyid|safetext}" />
            <fieldset>
                <legend>{gt text="$templatetitle"}</legend>
                <div class="z-formrow">
                    <label for="faq_question">{gt text="Question"}</label>
                    <textarea id="faq_question" name="faq[question]" rows="10" cols="50">{$question|safetext}</textarea>
                </div>
                <div class="z-formrow">
                    <label for="faq_urltitle">{gt text="PermaLink URL title"}</label>
                    <input id="faq_urltitle" name="faq[urltitle]" type="text" size="32" maxlength="255" value="{$urltitle|safetext}" />
                    <span class="z-sub">{gt text="(Blank = auto-generate)"}</span>
                </div>
                <div class="z-formrow">
                    <label for="faqanswer">{gt text="Answer"}</label>
                    <textarea id="faqanswer" name="faq[answer]" rows="10" cols="50">{$answer|safetext}</textarea>
                </div>
                {if $enablecategorization}
                <div class="z-formrow">
                    <label>{gt text="Category"}</label>
                    {gt text='Choose a category' assign='lblDef'}
                    {nocache}
                    {foreach from=$categories key=property item=category}
                    {array_field_isset array=$__CATEGORIES__ field=$property assign="catExists"}
                    {if $catExists}
                    {array_field_isset array=$__CATEGORIES__.$property field="id" returnValue=1 assign="selectedValue"}
                    {else}
                    {assign var="selectedValue" value="0"}
                    {/if}
                    <div class="z-formnote">{selector_category category=$category name="faq[__CATEGORIES__][$property]" field="id" selectedValue=$selectedValue defaultValue="0" defaultText=$lblDef}</div>
                    {/foreach}
                    {/nocache}
                </div>
                {/if}
            </fieldset>
            <fieldset>
                <legend>{gt text="Meta data"}</legend>
                <ul>
                    {if $submittedbyid neq 0}
                    {usergetvar name=uname uid=$submittedbyid assign=submittedby}
                    {/if}
                    {capture assign=faqsubmittedby}{$submittedby|userprofilelink}{/capture}
                    <li>{gt text="Submitted by %s" tag1=$faqsubmittedby}</li>

                    {usergetvar name=uname uid=$answeredbyid assign=uname}
                    {capture assign=faqansweredby}{$uname|userprofilelink}{/capture}
                    <li>{gt text="Answered by %s" tag1=$faqansweredby}</li>

                    {usergetvar name=uname uid=$cr_uid assign=uname}
                    {capture assign=faqcreatedby}{$uname|userprofilelink}{/capture}
                    <li>{gt text='Created by %1$s on %2$s' tag1=$faqcreatedby tag2=$cr_date|dateformat:'datetimelong'}</li>

                    {usergetvar name=uname uid=$lu_uid assign=uname}
                    {capture assign=faqupdatedby}{$uname|userprofilelink}{/capture}
                    <li>{gt text='Updated by %1$s on %2$s' tag1=$faqupdatedby tag2=$lu_date|dateformat:'datetimelong'}</li>
                </ul>
            </fieldset>
            {modcallhooks hookobject=item hookaction=modify hookid=$faqid module=FAQ}
            <div class="z-formbuttons">
                {button src='button_ok.png' set='icons/small' __alt="Update" __title="Update"}
                <a href="{modurl modname=FAQ type=admin func=view}">{img modname='core' src='button_cancel.png' set='icons/small'   __alt="Cancel" __title="Cancel"}</a>
            </div>
        </div>
    </form>
</div>
