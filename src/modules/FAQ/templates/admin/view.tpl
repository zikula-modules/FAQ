{ajaxheader modname=FAQ filename=faq.js nobehaviour=true noscriptaculous=true}
{include file="admin/menu.tpl"}
{gt text="View FAQ list" assign=templatetitle}
<div class="z-admincontainer">
    <div class="z-adminpageicon">{img modname='core' src='windowlist.png' set='icons/large' alt=''}</div>
    <h2>{$templatetitle}</h2>
    {if $enablecategorization and $numproperties gt 0}
    <form action="{modurl modname=FAQ type=admin func=view}" method="post" enctype="application/x-www-form-urlencoded">
        <div id="faq_multicategory_filter">
            <label for="faq_property">{gt text="Category"}</label>
            {gt text='Choose a category' assign='lblDef'}
            {nocache}
            {if $numproperties gt 1}
            {html_options id="faq_property" name="faq_property" options=$properties selected=$property}
            {else}
            <input type="hidden" id="faq_property" name="faq_property" value="{$property}" />
            {/if}
            <div id="faq_category_selectors" style="display:inline">
                {foreach from=$catregistry key=prop item=cat}
                {assign var=propref value=$prop|string_format:'faq_%s_category'}
                {if $property eq $prop}
                {assign var="selectedValue" value=$category}
                {else}
                {assign var="selectedValue" value=0}
                {/if}
                <noscript>
                    <div class="property_selector_noscript"><label for="{$propref}">{$prop}</label>:</div>
                </noscript>
                {selector_category category=$cat name=$propref selectedValue=$selectedValue allValue=0 allText=$lblDef editLink=false}
                {/foreach}
            </div>
            {/nocache}
            <input name="submit" type="submit" value="{gt text="Filter"}" />
            <input name="clear" type="submit" value="{gt text="Reset"}" />
        </div>
    </form>
    {/if}
    <table class="z-datatable">
        <thead>
            <tr>
                <th>{gt text="Internal ID"}</th>
                <th>{gt text="Question"}</th>
                <th>{gt text="Answered"}</th>
                {if $enablecategorization}
                <th>{gt text="Category"}</th>
                {/if}
                <th>{gt text="Options"}</th>
            </tr>
        </thead>
        <tbody>
            {foreach from=$faqs item=faq}
            <tr class="{cycle values="z-odd,z-even"}">
                <td>{$faq.faqid|safehtml}</td>
                <td>{$faq.question|strip_tags|safehtml|truncate:30}</td>
                <td>
                    {if $faq.answer neq ''}
                    {img modname='core' set='icons/extrasmall' src='button_ok.png'  __alt='Yes'  __title='Yes'}
                    {else}
                    {img modname='core' set='icons/extrasmall' src='button_cancel.png'  __alt='No'  __title='No'}
                    {/if}
                </td>
                {if $enablecategorization}
                <td>
                    {assignedcategorieslist item=$faq}
                </td>
                {/if}
                <td>
                    {foreach item=option from=$faq.options}
                    <a href="{$option.url|safetext}">{img modname='core' set='icons/extrasmall' src=$option.image title=$option.title alt=$option.title}</a>
                    {/foreach}
                </td>
            </tr>
            {foreachelse}
            <tr class="z-datatableempty"><td colspan="5">{gt text="No items found."}</td></tr>
            {/foreach}
        </tbody>
    </table>
    {pager rowcount=$pager.numitems limit=$pager.itemsperpage posvar=startnum shift=1 img_prev=images/icons/extrasmall/previous.png img_next=images/icons/extrasmall/next.png}
</div>