<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        <div class="qlf-alert-text qlf-alert-text--orange">
            <i class="qlf-alert-text__icon fas fa-exclamation-triangle"></i>
            <div class="qlf-alert-text__label">
                ${msg("errorTitle")}
            </div>
        </div>
    <#elseif section = "form">
        <div id="kc-error-message">

            <div class="qlf-alert-text qlf-alert-text--orange">
            <i class="qlf-alert-text__icon fas fa-exclamation-triangle"></i>
            <div class="qlf-alert-text__label">
                <p class="instruction" style="color: #fba026">${kcSanitize(message.summary)?no_esc}</p>
            </div>
        </div>


            <#if client?? && client.baseUrl?has_content>
                <p><a id="backToApplication" href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
            </#if>
        </div>
    </#if>
</@layout.registrationLayout>