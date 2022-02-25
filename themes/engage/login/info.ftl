<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
   
    <#if section = "header">
        <#if messageHeader??>
            ${messageHeader}
        <#else>
            ${message.summary}
        </#if>

    <#elseif section = "form">
    <!--- qualifio hack to intercept action page --->
    <div id="kc-welcome-to-qualifio-message">
        <#if requiredActions??>
            <#list requiredActions> 
                <#items as reqActionItem>
                    <#if msg("requiredAction.${reqActionItem}") == "Verify Email">
                    <h2>${kcSanitize(msg('joinQualifio'))?no_esc}</h2>
                    <!-- for nico: add dash here -->
                    </#if>
                </#items>
            </#list>
        </#if>
    </div>

    <div id="kc-info-message">
        <p class="instruction">
            ${kcSanitize(msg('confirmExecutionOfActions'))?no_esc}
            <#if requiredActions??>
                <#list requiredActions> 
                    <b><#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#items></b>
                </#list>
            <#else>
            </#if>
        </p>
        <#if skipLink??>
        <#else>
            <#if pageRedirectUri?has_content>
                <p><a href="${pageRedirectUri}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
            <#elseif actionUri?has_content>
                <!-- for nico: transform to amazing button -->
                <p><a href="${actionUri}">${kcSanitize(msg("proceedWithAction"))?no_esc}</a></p>
            <#elseif (client.baseUrl)?has_content>
                <p><a href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
            </#if>
        </#if>
    </div>
    </#if>
</@layout.registrationLayout>