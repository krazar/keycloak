<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
   
    <#if section = "header">
        <#if messageHeader??>
            ${messageHeader}
        <#else>
            ${message.summary}
        </#if>

    <#elseif section = "form">

        <#if !requiredActions??>
        <script>
            location.replace("${client.baseUrl}");
        </script>
        </#if>


        <#--  header is not the same with VERIFY_EMAIL  -->
        <#if requiredActions??>
            <#if requiredActions?seq_contains("VERIFY_EMAIL")>
                <div class="kc-welcome-to-qualifio-message">
                    <h2>${kcSanitize(msg('joinQualifio'))?no_esc}</h2>
                    <hr>
                    ${kcSanitize(msg('welcomeActionsIntroText'))?no_esc}<br/>
                </div>
                
            <#else>
               ${kcSanitize(msg('confirmExecutionOfActions'))?no_esc}<br/>
               
            </#if>
        </#if>

        <#--  common code   -->
        <#if requiredActions??>
            <#list requiredActions> 
                <b><#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#items></b>
            </#list>
        </#if>

        <#--  CTA is not the same with VERIFY_EMAIL  -->
        <#if requiredActions??>
            <#if requiredActions?seq_contains("VERIFY_EMAIL")>
                <a class="do-actions pf-c-button pf-m-primary pf-m-block btn-lg" href="${actionUri}">${kcSanitize(msg("welcomeActionsCtaLabel"))?no_esc}</a>

            <#else>
                <a class="do-actions pf-c-button pf-m-primary pf-m-block btn-lg" href="${actionUri}">${kcSanitize(msg("proceedWithAction"))?no_esc}</a>

            </#if>
        </#if>

    <#--  <div id="kc-info-message">  -->
        <#--  <p class="instruction">
            ${kcSanitize(msg('confirmExecutionOfActions'))?no_esc}<br/>
            <#if requiredActions??>
                <#list requiredActions> 
                    <b><#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#items></b>
                </#list>
            <#else>
            </#if>
        </p>  -->
        <#--  <#if skipLink??>
        <#else>
            <#if pageRedirectUri?has_content>
                <p><a class="do-actions pf-c-button pf-m-primary pf-m-block btn-lg"href="${pageRedirectUri}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
            <#elseif actionUri?has_content>
                <a class="do-actions pf-c-button pf-m-primary pf-m-block btn-lg" href="${actionUri}">${kcSanitize(msg("proceedWithAction"))?no_esc}</a>
            <#elseif (client.baseUrl)?has_content>
                <p><a class="do-actions pf-c-button pf-m-primary pf-m-block btn-lg" href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
            </#if>
        </#if>  -->
    <#--  </div>  -->
    </#if>
</@layout.registrationLayout>