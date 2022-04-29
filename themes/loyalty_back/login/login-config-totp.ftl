<#import "template.ftl" as layout>
<@layout.registrationLayout displayRequiredFields=false displayMessage=!messagesPerField.existsError('totp','userLabel'); section>
    <#if section = "header">
    ${msg("loginTotpTitle")}
     <#elseif section = "form">
        <h2 class="login_title">${msg("totpTitle")}</h2>
        <ol id="kc-totp-settings">
        
            <li>
                <p>${msg("loginTotpStep1")?no_esc}</p>
            </li>

            <#if mode?? && mode = "manual">
                <li>
                    <p>${msg("loginTotpManualStep2")}</p>
                    <p><span id="kc-totp-secret-key">${totp.totpSecretEncoded}</span></p>
                    <p style="text-align: center;"><a href="${totp.qrUrl}" id="mode-barcode">${msg("loginTotpScanBarcode")}</a></p>
                </li>
                <li>
                    <p>${msg("loginTotpManualStep3")}</p>
                    <p>
                    <ul class="highlight_content">
                        <li id="kc-totp-type">${msg("loginTotpType")?no_esc}</li>
                        <li id="kc-totp-algorithm">${msg("loginTotpAlgorithm")?no_esc}</li>
                        <li id="kc-totp-digits">${msg("loginTotpDigits")?no_esc}</li>
                        <li id="kc-totp-period">${msg("loginTotpInterval")?no_esc}</li>
                        <#--  <#if totp.policy.type = "totp">
                            <li id="kc-totp-period"><b>${msg("loginTotpInterval")}:</b> ${totp.policy.period}</li>
                        <#elseif totp.policy.type = "hotp">
                            <li id="kc-totp-counter"><b>${msg("loginTotpCounter")}:</b> ${totp.policy.initialCounter}</li>
                        </#if>  -->
                    </ul>
                    </p>
                </li>
            <#else>
                <li>
                    <p>${msg("loginTotpStep2")}</p>
                    <img id="kc-totp-secret-qr-code" src="data:image/png;base64, ${totp.totpSecretQrCode}" alt="Figure: Barcode"><br/>
                    <p style="text-align: center;"><a href="${totp.manualUrl}" id="mode-manual">${msg("loginTotpUnableToScan")}</a></p>
                </li>
            </#if>
            <li>
                <p>${msg("loginTotpStep3")}</p>
                <#--  <p>${msg("loginTotpStep3DeviceName")}</p>  -->
            </li>
        </ol>

        <form action="${url.loginAction}" class="${properties.kcFormClass!}" id="kc-totp-settings-form" method="post">
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcInputWrapperClass!} opt_form">
                    <label for="totp" class="control-label">${msg("authenticatorCode")}<span class="required">*</span></label>
                    <div class="opt_form_input">
                        <input type="text" id="totp" name="totp" autocomplete="off" class="${properties.kcInputClass!}"
                            aria-invalid="<#if messagesPerField.existsError('totp')>true</#if>" placeholder="__ __ __ __ __ __"
                        />

                        <#if messagesPerField.existsError('totp')>
                            <span id="input-error-otp-code" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('totp'))?no_esc}
                            </span>
                        </#if>
                    </div>
                    

                </div>
                <input type="hidden" id="totpSecret" name="totpSecret" value="${totp.totpSecret}" />
                <#if mode??><input type="hidden" id="mode" name="mode" value="${mode}"/></#if>
            </div>

            <#--  <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcInputWrapperClass!} opt_form">
                    <label for="userLabel" class="control-label">${msg("loginTotpDeviceName")}<#if totp.otpCredentials?size gte 1><span class="required">*</span></#if></label>
                    <div class="opt_form_input">
                        <input type="text" class="${properties.kcInputClass!}" id="userLabel" name="userLabel" autocomplete="off"
                           aria-invalid="<#if messagesPerField.existsError('userLabel')>true</#if>" placeholder="${msg('loginUserPlaceholder')}"
                        />

                        <#if messagesPerField.existsError('userLabel')>
                            <span id="input-error-otp-label" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('userLabel'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </div>
            </div>  -->

            <#if isAppInitiatedAction??>
                <input type="submit"
                       class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}"
                       id="saveTOTPBtn" value="${msg("doSubmit")}"
                />
                <button type="submit"
                        class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!} ${properties.kcButtonLargeClass!}"
                        id="cancelTOTPBtn" name="cancel-aia" value="true" />${msg("doCancel")}
                </button>
            <#else>
                <input type="submit"
                       class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                       id="saveTOTPBtn" value="${msg("doSubmit")}"
                />
            </#if>
        </form>
        <hr>
        <div style="text-align: center">${msg("totpFooter")?no_esc}</div>
    </#if>
</@layout.registrationLayout>