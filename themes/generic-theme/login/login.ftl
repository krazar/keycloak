<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("loginAccountTitle")}
    <#elseif section = "form">
        <script>
            document.getElementById('backToLoginLink').style.display = "none";
        </script>

        <div id="kc-header" class="${properties.kcHeaderClass!}">
            <img class="login-logo ${locale.currentLanguageTag}" src="https://auth.staging.k8s.qualifio.com/auth/resources/2well/login/loyalty_back/img/logo-qualifio-white.svg" alt="banner" width="100%">
        </div>

        <div class="login__title generic">
            ${msg("welcomeTitle")}
        </div>
        <div class="login__title ${locale.currentLanguageTag}"></div>




        <div class="login_title_after"></div>

        <div class="login__subtitle generic">
            ${msg("welcomeSubtitle")}
        </div>
        <div class="login__subtitle ${locale.currentLanguageTag}"></div>

        <div class="steps-box">
            <div class="program_step">
                <img src="${url.resourcesPath}/img/arrow-left.png" alt="arrow-left" width="70px" height="61px">
                <div class="program-step-div">
                    <p class="login-qualifio-p">
                        ${msg('welcomeQualifio')}
                    </p>
                    <#list social.providers?filter(p -> p.alias != "google") as qualifioProvider>
                        <p class="login-qualifio-p">
                            <a class="login-button" id="social-${qualifioProvider.alias}" type="button"
                               href="${qualifioProvider.loginUrl}">
                                <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${msg("goToProgram")} </span>
                            </a>
                        </p>
                    </#list>
                </div>
            </div>

            <div class="program_step">
                <img src="${url.resourcesPath}/img/arrow-right.png" alt="arrow-left" width="70px" height="61px">
                <div class="program-step-div">
                    <p class="login-qualifio-p">
                        ${msg('welcomeNoQualifio')}
                    </p>
                    <#list social.providers?filter(p -> p.alias == "google") as googleProvider>
                        <p class="login-qualifio-p">
                            <a class="login-button" id="social-${googleProvider.alias}" type="button"
                               href="${googleProvider.loginUrl}">
                                <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${msg("goToProgram")} </span>
                            </a>
                        </p>
                    </#list>
                </div>
            </div>
        </div>
        <div class="login-pf-confidentiality-footer">
            <span class="login_privacy_footer_part1 generic">
                ${msg('confidentialityWarning1')}
            </span>
            <span class="login_privacy_footer_part1 ${locale.currentLanguageTag}"></span>

            <a href="${msg('confidentialityWarningLink')}" target="_blank" class="login_privacy_footer_link generic" style="text-decoration: none">
                ${msg('confidentialityWarning2')}
            </a>
            <a href="${msg('confidentialityWarningLink')}" target="_blank" class="login_privacy_footer_link ${locale.currentLanguageTag}" style="text-decoration: none">
            </a>

            <span class="login_privacy_footer_part2 generic">
                ${msg('confidentialityWarning3')}
            </span>
            <span class="login_privacy_footer_part2 ${locale.currentLanguageTag}"></span>
        </div>

    </#if>

</@layout.registrationLayout>
