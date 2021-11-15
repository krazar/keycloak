<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <#if properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#--  <link href="${url.resourcesPath}/css/manager.css" rel="stylesheet" />  -->
</head>

<body class="${properties.kcBodyClass!}">
<div class="${properties.kcLoginClass!}">
    <div class="login__header">
        <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
            <div id="kc-locale">
                <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                    <div class="kc-dropdown wrapper__login__form__lang" id="kc-locale-dropdown" >
                        <select id="localeSwitch">
                            <#list locale.supported as l>
                                <#if locale.current == l.label>
                                    <option value="${l.url}" selected="selected">${l.languageTag}</option>
                                <#else>
                                    <option value="${l.url}">${l.languageTag}</option>
                                </#if>
                            </#list>
                        </select>
                        <script>
                        document.getElementById('localeSwitch').onchange = function(e) {
                            window.location = e.srcElement.options[e.srcElement.selectedIndex].value;
                        };
                        </script>
                    </div>
                </div>
            </div>
        </#if>
    </div>
    <div class="login__content">
        <div id="kc-header" class="${properties.kcHeaderClass!}">
            <div id="kc-header-wrapper" class="${properties.kcHeaderWrapperClass!}">
                ${kcSanitize(msg("loginTitleHtml",(realm.displayNameHtml!'')))?no_esc}
            </div>
        </div>

        <div class="${properties.kcFormCardClass!}">
        
        <div id="kc-content">
            <div id="kc-content-wrapper">

            <#-- App-initiated actions should not see warning messages about the need to complete the action -->
            <#-- during login.                                                                               -->
            <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                <div class="alert-${message.type} ${properties.kcAlertClass!} pf-m-<#if message.type = 'error'>danger<#else>${message.type}</#if>">
                        <div class="pf-c-alert__icon">
                        <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                        <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                        <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                        <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                        </div>
                        <span class="${properties.kcAlertTitleClass!}">${kcSanitize(message.summary)?no_esc}</span>
                </div>
            </#if>

            <#nested "form">

            </div>
        </div>

        </div>
    </div>
    <div class="login__footer">
        <a href="https://qualifio.zendesk.com/hc/fr" target="_blank">Besoin d'aide ?</a> •
        <a href="https://qualifio.com/fr/politique-vie-privee/" target="_blank">Politique vie privée</a> •
        <a href="https://qualifio.com/blog/fr/" target="_blank">Blog</a>
    </div>
   
</div>
    
</body>
</html>
</#macro>
