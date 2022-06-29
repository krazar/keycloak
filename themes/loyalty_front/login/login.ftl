<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("loginAccountTitle")}
    <#elseif section = "form">
    <script>
        document.getElementById('backToLoginLink').style.display = "none";
    </script>

    <div id="kc-form" style="display: flex;">
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="wrapper__login__sso ${properties.kcFormSocialAccountSectionClass!}">
                <#--  <h4>${msg("identity-provider-login-label")}</h4>  -->

                <#--  todo make this dynamic  -->
                <div class="wrapper__login__sso__button">
                    <#list social.providers as p>
                        <a id="social-${p.alias}" type="button" href="${p.loginUrl}" style="background-color: #ffffff; color: #666666;">
                            <#if p.iconClasses?has_content>
                                <img src="${url.resourcesPath}/img/${p.displayName?lower_case}-g-logo.svg">
                                <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${msg("connectWith")} ${p.displayName}</span>
                            <#else>
                                <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${msg("connectWith")} ${p.displayName} </span>
                            </#if>
                        </a>
                    </#list>
                </div>
            </div>
        </#if>

    </div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container">
                <div id="kc-registration">
                    <span>${msg("noAccount")}
                     <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                </div>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>
