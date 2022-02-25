<html>
    <head>
        <meta charset=“utf-8”>
        <meta http-equiv=“Content-Type” content=“text/html; charset=UTF-8” />
        <title>Qualifio</title>
   </head>
    <body bgcolor="#eaeaea" style="background-color:#eaeaea; font-family: sans-serif; -webkit-font-smoothing: antialiased; font-size: 14px; line-height: 1.4; margin: 0; padding: 0;">
        <table align="center" border="0" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse; border: 1px solid #D5D5D5; margin-top: 25px; margin-bottom: 25px;">
            <tr>
                <td>
                    <img alt="Qualifio" src="http://files.qualifio.com/images/banner_mail_gdpr1.jpg" style="width: 600px; max-height: 100px; max-width: 100%;" />
                </td>
            </tr>
            <tr>
                <td bgcolor="#ffffff" style="padding: 50px; color: #666666; background-color:#ffffff;">
                    ${kcSanitize(msg("emailVerificationBodyHtml",link, linkExpiration, realmName, linkExpirationFormatter(linkExpiration)))?no_esc}
                </td>
            </tr>
        </table>
    </body>
</html>