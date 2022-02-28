<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("loginAccountTitle")}
    <#elseif section = "form">
    <#if messagesPerField.existsError('username','password')>
        <div class="qlf-alert-text qlf-alert-text--orange">
            <i class="qlf-alert-text__icon fas fa-exclamation-triangle"></i>
            <div class="qlf-alert-text__label">
                ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
            </div>
        </div>
    </#if>
    <div id="kc-form" style="display: flex;">
      <div id="kc-form-wrapper" style="wrapper__login__form">
        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <div class="${properties.kcFormGroupClass!} wrapper__login__form__group">

                    <#if usernameEditDisabled??>
                        <span class="wrapper__login__form__group__icon">
                            <i class="fal fa-envelope"></i>
                        </span>
                        <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" disabled
                        style="background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGP6zwAAAgcBApocMXEAAAAASUVORK5CYII='); cursor: auto;" />
                    <#else>
                        <span class="wrapper__login__form__group__icon">
                            <i class="fal fa-envelope"></i>
                        </span>
                        <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off"
                            aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                            style="background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGP6zwAAAgcBApocMXEAAAAASUVORK5CYII=');"
                            placeholder="${msg('email')}"
                            
                        />

                    </#if>
                </div>

                <div class="${properties.kcFormGroupClass!} wrapper__login__form__group">
                    <span class="wrapper__login__form__group__icon">
                        <i class="fal fa-lock-alt"></i>
                    </span>
                    <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off"
                           aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                           style="background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGP6zwAAAgcBApocMXEAAAAASUVORK5CYII=');"
                           placeholder="${msg('password')}"
                    />
                </div>

                <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                    <div id="kc-form-options">
                        <#if realm.rememberMe && !usernameEditDisabled??>
                            <div class="checkbox">
                                <label>
                                    <#if login.rememberMe??>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                    <#else>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                    </#if>
                                </label>
                            </div>
                        </#if>
                        </div>
                        

                  </div>

                  <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                      <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                      <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                  </div>
                  <div class="wrapper__login__form__link ${properties.kcFormOptionsWrapperClass!}">
                            <#if realm.resetPasswordAllowed>
                                <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                            </#if>
                        </div>
            </form>
        </#if>
       </div>

        <#if realm.password && social.providers??>
            <div class="wrapper__login__choice">
                <p class=" wrapper__login__sso__choice__txt">${msg("chooseIdps")}</p>
            </div>
            <div id="kc-social-providers" class="wrapper__login__sso ${properties.kcFormSocialAccountSectionClass!}">
                <#--  <h4>${msg("identity-provider-login-label")}</h4>  -->

                <#--  todo make this dynamic  -->
                <div class="wrapper__login__sso__button">
                    <#list social.providers as p>
                        <a id="social-${p.alias}" class="google__button"
                                type="button" href="${p.loginUrl}">
                            <#if p.iconClasses?has_content>
                                <img src="${url.resourcesPath}/img/${p.displayName?lower_case}-g-logo.svg">
                                <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${msg("connectWith${p.displayName}")}</span>
                            <#else>
                                <span class="${properties.kcFormSocialAccountNameClass!}">${msg("connectWith${p.displayName}")}</span>
                            </#if>
                        </a>
                    </#list>
                    <a id="sso__button" href="https://manager.qualifio.com/app/login-sso.cfm?iso=fr">
                        <span>${msg("connectWithSso")}</span>
                    </a>     
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
