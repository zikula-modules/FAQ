{include file="user/menu.tpl"}
{if $categories}
<h2>{gt text="Categories"}</h2>
{foreach from=$categories key='property' item='category'}
<ul>
    {foreach from=$category.subcategories item='subcategory'}

    {* get the category name avoiding E_ALL errors *}
    {array_field assign="categoryname" array=$subcategory.display_name field=$lang}
    {if $categoryname eq ''}{assign var="categoryname" value=$subcategory.name}{/if}
    {array_field assign="categorydesc" array=$subcategory.display_desc field=$lang}

    {if $modvars.ZConfig.shorturls}
    <li><a href="{modurl modname='FAQ' type='user' func='view' prop=$property cat=$subcategory.path|replace:$category.path:''}" title="{$categorydesc}">{$categoryname}</a></li>
    {else}
    <li><a href="{modurl modname='FAQ' type='user' func='view' prop=$property cat=$subcategory.id}" title="{$categorydesc}">{$categoryname}</a></li>
    {/if}
    {/foreach}
</ul>
{/foreach}
{/if}

{modfunc modname='FAQ' type='user' func='view'}
