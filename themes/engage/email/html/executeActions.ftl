<#outputformat "plainText">
<#assign requiredActionsText><#if requiredActions??><#list requiredActions><#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#sep></#items></#list></#if></#assign>
</#outputformat>

<html>
<body style="text-align: center">
<div style="background-color: #12384a; color: white; font: 14px 'Open Sans', sans-serif; padding: 50px">
    <div style="width: 85%;max-width: 225px;min-width: 225px;margin: 0 auto 40px;">
        <img src="https://manager.qualifio.com/app/imagesv03/flat_design/nav_general/logo-qualifio-white.svg">
    </div>
    ${kcSanitize(msg("executeActionsBodyHtml",link, linkExpiration, realmName, requiredActionsText, linkExpirationFormatter(linkExpiration)))?no_esc}
</div>
</body>
</html>
