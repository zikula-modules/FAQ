{include file="admin/menu.tpl"}
<div class="z-admincontainer">
    <div class="z-adminpageicon">{img modname='core' src='configure.png' set='icons/large' __alt='Settings' }</div>
    <h2>{gt text="Settings"}</h2>
    <form class="z-form" action="{modurl modname="FAQ" type="admin" func="updateconfig"}" method="post" enctype="application/x-www-form-urlencoded">
        <div>
            <input type="hidden" name="csrftoken" value="{insert name="csrftoken"}" />
            <fieldset>
                <legend>{gt text="General settings"}</legend>
                <div class="z-formrow">
                    <label for="faq_enablecategorization">{gt text="Enable categorization"}</label>
                    <input id="faq_enablecategorization" type="checkbox" name="enablecategorization"{if $modvars.FAQ.enablecategorization} checked="checked"{/if} />
                </div>
                <div class="z-formrow">
                    <label for="faq_itemsperpage">{gt text="Items per page"}</label>
                    <input id="faq_itemsperpage" type="text" name="itemsperpage" size="3" value="{$modvars.FAQ.itemsperpage|safetext}" />
                </div>
            </fieldset>
            <fieldset>
                <legend>{gt text="PermaLinks"}</legend>
                <div class="z-formrow">
                    <label for="faq_addcategorytitletopermalink">{gt text="Add category title to PermaLink"}</label>
                    <input id="faq_addcategorytitletopermalink" type="checkbox" name="addcategorytitletopermalink"{if $modvars.FAQ.addcategorytitletopermalink} checked="checked"{/if} />
                </div>
            </fieldset>
            <div class="z-formbuttons">
                {button src='button_ok.png' set='icons/small' __alt="Update Configuration" __title="Update Configuration"}
                <a href="{modurl modname='FAQ' type='admin' func='view'}">{img modname='core' src='button_cancel.png' set='icons/small'   __alt="Cancel" __title="Cancel"}</a>
            </div>
        </div>
    </form>
</div>