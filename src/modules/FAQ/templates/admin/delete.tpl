{gt text="Delete FAQ" assign=templatetitle}
{include file="admin/menu.tpl"}
<div class="z-admincontainer">
    <div class="z-adminpageicon">{img modname='core' src='editdelete.png' set='icons/large' alt=$templatetitle}</div>
    <h2>{$templatetitle}</h2>
    <p class="z-warningmsg">{gt text="Do you really want to delete this FAQ?"}</p>
    <form class="z-form" action="{modurl modname="FAQ" type="admin" func="delete"}" method="post" enctype="application/x-www-form-urlencoded">
        <div>
            <input type="hidden" name="csrftoken" value="{insert name="csrftoken"}" />
            <input type="hidden" name="confirmation" value="1" />
            <input type="hidden" name="faqid" value="{$faqid|safetext}" />
            <fieldset>
                <legend>{gt text="Confirmation prompt"}</legend>
                <div class="z-formbuttons">
                    {button src='button_ok.png' set='icons/small' __alt="Confirm deletion?" __title="Confirm deletion?"}
                    <a href="{modurl modname=FAQ type=admin func=view}">{img modname='core' src='button_cancel.png' set='icons/small'   __alt="Cancel" __title="Cancel"}</a>
                </div>
            </fieldset>
        </div>
    </form>
</div>