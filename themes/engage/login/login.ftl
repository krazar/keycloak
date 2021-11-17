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
                <div class="${properties.kcFormGroupClass!}">

                    <#if usernameEditDisabled??>
                        <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" disabled
                        style="background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGP6zwAAAgcBApocMXEAAAAASUVORK5CYII='); cursor: auto;" />
                    <#else>
                        <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off"
                            aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                            style="background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGP6zwAAAgcBApocMXEAAAAASUVORK5CYII=');"
                            placeholder="${msg('email')}"
                            
                        />

                    </#if>
                </div>

                <div class="${properties.kcFormGroupClass!}">
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
                        <!-- idp ${p.displayName?lower_case} dddsdsdf-->
                        <#if p.displayName?lower_case == "google">
                            <a id="google__button" href="${p.loginUrl}">
                                <img src="${url.resourcesPath}/img/google-g-logo.svg">
                                <span>${msg("connectWithGoogle")}</span>
                            </a>
                        </#if>
                        <#if p.displayName?lower_case == "microsoft">
                            <a id="azure__button" href="${p.loginUrl}">
                                <img src="${url.resourcesPath}/img/azure-logo.svg">
                                <span>${msg("connectWithAzure")}</span>
                            </a>
                        </#if>

                        <#--  <a id="social-${p.alias}" class=" google__button ${properties.kcFormSocialAccountListButtonClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountGridItem!}</#if>"
                                type="button" href="${p.loginUrl}">
                            <#if p.iconClasses?has_content>
                                <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${p.displayName!}</span>
                            <#else>
                                <span class="${properties.kcFormSocialAccountNameClass!}">${p.displayName!}</span>
                            </#if>
                        </a>  -->
                    </#list>
                    <a id="sso__button" href="https://manager.qualifio.com/app/login-sso.cfm?iso=fr">
                        <span>${msg("connectWithSso")}</span>
                    </a>     
                    <div class="WFEMLUB" style="position: absolute; display: inline-block; bottom: 35px; right: -34px;" data-wfx-attr="true" aria-hidden="true" id="wfx-smartinfo">
                        <div class="">
                            <div class="gwt-HTML">
                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAABWzo5XAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyVpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTQ4IDc5LjE2NDAzNiwgMjAxOS8wOC8xMy0wMTowNjo1NyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDIxLjAgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6RkJEMTNFRjMzNjFDMTFFQUFBMzJFNzYwMEQ2MUREMzAiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6RkJEMTNFRjQzNjFDMTFFQUFBMzJFNzYwMEQ2MUREMzAiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpGQkQxM0VGMTM2MUMxMUVBQUEzMkU3NjAwRDYxREQzMCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpGQkQxM0VGMjM2MUMxMUVBQUEzMkU3NjAwRDYxREQzMCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PntHq/QAAAGbSURBVHjaYjQ9fI8BC2AGYksgdgRiaajYUyDeD8THgfgvTOEpG0UwzYLFkEggbgViRQbs4BEQ1wHxQmRBJiQ2GxAvBeJleAwBATkgXgBVywYTRHbRXCCOQtaRJcXHEC4nyMDJwsTw+Msvhkl33zAc/PwTJg1S+w+IY5FdFAfEMciGxIhxMyQoCTM8+vqLYefTT2CxCnVRdNfFmB25HwczCBSwTegqPv35z3D45WeG2MvPGWrvv2VY+Og9gzAHK4OfEBe60magYUws0JiRR5fd9O4bGKMDPhZGbGFmxQSNZoIgVJqf4fuffwz73v3AJu3IgpROsAJ7XnZw2HCxMDPMvveG4dmfv9iUybAQcgnIkG/A8Eq+8ASXIfB09BSfa0ABDApofIYAwRMWaJLHCkBpBhgjxAThfpCLDkCTPQaQAoZLs6IwmMYDQHqPgwz6A8S12FSocrIwuEvzgWk8oBaYcf8yIuX+JUAczUAaWAo0JAY90yZBMyyxYBlUD0bu/wV1ESgz3icQJolQtb+w5X4YWA7Eq4gt2GAAIMAADZB2882cIM4AAAAASUVORK5CYII=">
                            </div>
                        </div>
                    </div>   
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
