<#import "template.ftl" as layout>
    <div style="padding-left: 10px; padding-top: 20px;">
        <span><a href="${msg('backToLoginUrl')}" class="backToLogin">&lt; ${msg("backToLogin")}</a></span>
    </div>  
<@layout.registrationLayout displayMessage=false; section>
   
    <#if section = "header">
        <#if messageHeader??>
            ${messageHeader}
        <#else>
            ${message.summary}
        </#if>

    <#elseif section = "form">

        <#if !requiredActions??>
            <#--  <#if client?? && client.baseUrl?has_content>
                <#assign backUrl = client.baseUrl >
            <#else>  -->
                <#assign backUrl = msg('backToLoginUrl') >
            <#--  </#if>  -->
            ${kcSanitize(msg('welcomeAllGoodText'))?no_esc}
            <a type="button" class="pf-c-button pf-m-primary pf-m-block btn-lg" style="margin-top: 30px" href="${backUrl}">
                <span>${kcSanitize(msg('welcomeAllGoodCtaText'))?no_esc}</span>
            </a>
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
                <#assign ctaText = "welcomeActionsCtaLabel">
            <#else>
                <#assign ctaText = "proceedWithAction">
            </#if>
            <#if pageRedirectUri?has_content>
                <p><a class="do-actions pf-c-button pf-m-primary pf-m-block btn-lg"href="${pageRedirectUri}">${kcSanitize(msg(ctaText))?no_esc}</a></p>
            <#elseif actionUri?has_content>
                <a class="do-actions pf-c-button pf-m-primary pf-m-block btn-lg" href="${actionUri}">${kcSanitize(msg(ctaText))?no_esc}</a>
            <#elseif (client.baseUrl)?has_content>
                <p><a class="do-actions pf-c-button pf-m-primary pf-m-block btn-lg" href="${client.baseUrl}">${kcSanitize(msg(ctaText))?no_esc}</a></p>
            </#if>
        </#if>
    </#if>
</@layout.registrationLayout>