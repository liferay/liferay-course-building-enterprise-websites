<div class="component-button text-break">
    <a
        class="btn"
        href="${configuration.link!""}"
        id="fragment-${fragmentEntryLinkNamespace}-link"
    >
        <span style="font-size: ${configuration.iconSize}">
            [@clay["icon"] symbol="${configuration.iconName}" /]
        </span>
        [#if configuration.hideLabel == false]
        <span>
            ${configuration.buttonLabel}
        </span>
        [/#if]
    </a>
</div>