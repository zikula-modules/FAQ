{include file="user/menu.tpl"}
{if $categories}
<h2>{gt text="Categories"}</h2>
{foreach from=$categories key=property item=category}
<ul>
    {foreach from=$category.subcategories item=subcategory}

    {* get the category name avoiding E_ALL errors *}
    {array_field_isset assign="categoryname" array=$subcategory.display_name field=$lang returnValue=1}
    {if $categoryname eq ''}{assign var="categoryname" value=$subcategory.name}{/if}
    {array_field_isset assign="categorydesc" array=$subcategory.display_desc field=$lang returnValue=1}

    {if $shorturls and $shorturlstype eq 0}
    <li><a href="{modurl modname=FAQ func=view prop=$property cat=$subcategory.path|replace:$category.path:''}" title="{$categorydesc}">{$categoryname}</a></li>
    {else}
    <li><a href="{modurl modname=FAQ func=view prop=$property cat=$subcategory.id}" title="{$categorydesc}">{$categoryname}</a></li>
    {/if}
    {/foreach}
</ul>
{/foreach}
{/if}

{modfunc modname=FAQ func=view}