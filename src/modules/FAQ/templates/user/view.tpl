{if $func eq 'view' and $category}
{include file="user/menu.tpl"}
{array_field assign="categoryname" array=$category.display_name field=$lang}
{if $categoryname eq ''}{assign var="categoryname" value=$category.name}{/if}
{array_field assign="categorydesc" array=$category.display_desc field=$lang}

<h2>{$categoryname}</h2>
{if $categorydesc neq ''}<p>{$categorydesc}</p>{/if}

{else}

<h2>{gt text="Recent FAQs"}</h2>

{/if}

{modurl modname=FAQ type='user' func='view' prop=$property startnum=$startnum assign='returnurl'}

<h3>{gt text="Question"}</h3>
<ul>
    {foreach item=item from=$faqs}
    <li><a href="#faq{$item.faqid}"><em>{$item.question}</em></a></li>
    {/foreach}
</ul>

<h3>{gt text="Answer"}</h3>
{foreach item='item' from=$items}
{$item}
{/foreach}
{pager  show="page" rowcount=$pager.numitems limit=$pager.itemsperpage posvar='startnum' shift=1}
