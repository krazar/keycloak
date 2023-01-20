<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("loginAccountTitle")}
    <#elseif section = "form">
        <script>
            document.getElementById('backToLoginLink').style.display = "none";
        </script>

        <div id="kc-header" class="${properties.kcHeaderClass!}">
            <img src="https://files.qualifio.com/library/qualifio_showcases/images/2023/football%20loyalty/banner-loyalty-desktop.png" alt="banner" width="100%">
        </div>

        <div class="login__title">
            ${msg("welcomeTitle")}
        </div>
        <div class="login_title_after"></div>

        <div class="login__subtitle">
            ${msg("welcomeSubtitle")} 😉
        </div>

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

    </#if>

</@layout.registrationLayout>
