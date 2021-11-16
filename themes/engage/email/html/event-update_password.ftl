<html>
    <body bgcolor="#eaeaea" style="background-color:#eaeaea; font-family: sans-serif; -webkit-font-smoothing: antialiased; font-size: 14px; line-height: 1.4; margin: 0; padding: 0;">
        <table align="center" border="0" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse; border: 1px solid #D5D5D5;">
            <tr>
                <td>
                    <img alt="Qualifio" src="http://files.qualifio.com/images/banner_mail_gdpr2.jpg" style="width: 600px; max-height: 100px; max-width: 100%;" />
                </td>
            </tr>
            <tr>
                <td bgcolor="#ffffff" style="padding: 20px 50px 0px 50px;">
                    ${kcSanitize(msg("eventUpdatePasswordBodyHtml",event.date, event.ipAddress))?no_esc}
                </td>
            </tr>
        </table>
    </body>
</html>