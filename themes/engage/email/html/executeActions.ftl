<#outputformat "plainText">
<#assign requiredActionsText>
<#assign invitationMail = false/>
<#if requiredActions??>
    <#assign invitationMail = requiredActions?seq_contains("VERIFY_EMAIL")>
    <#list requiredActions>
        <#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#sep>
        </#items>
    </#list>
    </#if>
</#assign>
</#outputformat>

<html>
    <head>
        <meta charset=“utf-8”>
        <meta http-equiv=“Content-Type” content=“text/html; charset=UTF-8” />
        <title>Qualifio</title>
    </head>
    <body bgcolor="#052b3d" style="background-color:#052b3d; font-family: sans-serif; -webkit-font-smoothing: antialiased; font-size: 14px; line-height: 1.4; margin: 0; padding: 0;">
        <table align="center" border="0" cellpadding="0" cellspacing="0" width="600" style="border: 1px solid #1f4557; margin-top: 25px; margin-bottom: 25px; border-radius: 5px; overflow: hidden;">
            <tr>
                <td>
                    <img alt="Qualifio" src="http://files.qualifio.com/images/banner_mail_gdpr1.jpg" style="width: 600px; max-height: 100px; max-width: 100%;" />
                </td>
            </tr>
            <tr>
                <td bgcolor="#ffffff" style="padding: 50px; color: #666666; background-color:#ffffff;">
                    <#if invitationMail>
                        ${kcSanitize(msg("executeInvitationBodyHtml",link, linkExpiration, realmName, requiredActionsText, linkExpirationFormatter(linkExpiration), msg('helpDeskLink')))?no_esc}
                    <#else>
                        ${kcSanitize(msg("executeActionsBodyHtml",link, linkExpiration, realmName, requiredActionsText, linkExpirationFormatter(linkExpiration)))?no_esc}
                    </#if>
                </td>
            </tr>
             <tr>
                <td bgcolor="#f2f2f2" style="padding: 15px 50px; background-color: #f2f2f2;">
                    <table align="center" border="0" cellpadding="0" cellspacing="0" width="500">
                        <tr>
                            <td width="33%" align="right">
                                <a href="https://www.instagram.com/qualifio/" target="_blank" style="text-decoration: none;"><img src="https://files.qualifio.com/images/instagram.png" alt="Instagram" style="width: 16px; height: 16px;"/></a>
                            </td>
                            <td width="33%" align="center">
                                <a href="https://www.facebook.com/qualifio" target="_blank" style="text-decoration: none;"><img src="https://files.qualifio.com/images/facebook.png" alt="Facebook" style="width: 16px; height: 16px;"/></a>
                            </td>
                            <td width="33%" align="left">
                                <a href="https://www.linkedin.com/company/qualifio" target="_blank" style="text-decoration: none;"><img src="https://files.qualifio.com/images/linkedin.png" alt="Linkedin" style="width: 16px; height: 16px;"/></a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </body>
</html>

