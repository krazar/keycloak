<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
    <#if section = "header">
        ${msg("updatePasswordTitle")}
    <#elseif section = "form">
    
        <#if messagesPerField.existsError('password-confirm')>
            <div class="qlf-alert-text qlf-alert-text--orange">
                <i class="qlf-alert-text__icon fas fa-exclamation-triangle"></i>
                <div class="qlf-alert-text__label">
                    ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                </div>
            </div>
        </#if>
        <#if messagesPerField.existsError('password')>
            <div class="qlf-alert-text qlf-alert-text--orange">
                <i class="qlf-alert-text__icon fas fa-exclamation-triangle"></i>
                <div class="qlf-alert-text__label">
                    ${kcSanitize(messagesPerField.get('password'))?no_esc}
                </div>
            </div>
        </#if>

        <form id="kc-passwd-update-form" action="${url.loginAction}" method="post" style="width: 270px; margin: auto;">
            <input type="text" id="username" name="username" value="${username}" autocomplete="username"
                   readonly="readonly" style="display:none;"/>
            <input type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>

                <div class="form-group wrapper__login__form__group">
                    <span class="wrapper__login__form__group__icon">
                        <i class="fal fa-lock-alt"></i>
                    </span>
                    <input type="password" id="password-new" name="password-new" class="${properties.kcInputClass!}"
                           autofocus autocomplete="new-password"
                           aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                           placeholder="${msg('passwordNew')}"
                    />

                </div>

                <div class="form-group wrapper__login__form__group">
                    <span class="wrapper__login__form__group__icon">
                        <i class="fal fa-lock-alt"></i>
                    </span>
                    <input type="password" id="password-confirm" name="password-confirm"
                           class="${properties.kcInputClass!}"
                           autocomplete="new-password"
                           aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                           placeholder="${msg('passwordConfirm')}"
                    />

            </div>
            
            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <#if isAppInitiatedAction??>
                            <div class="checkbox">
                                <label><input type="checkbox" id="logout-sessions" name="logout-sessions" value="on" checked> ${msg("logoutOtherSessions")}</label>
                            </div>
                        </#if>
                    </div>
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <#if isAppInitiatedAction??>
                        <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmitResetPassword")}" />
                        <button class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" type="submit" name="cancel-aia" value="true" />${msg("doCancel")}</button>
                    <#else>
                        <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmitResetPassword")}" />
                    </#if>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>