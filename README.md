# keycloak

Custom built keycloak image based on Bitnami's image.

## How to customize the theme

Take a look at: https://www.keycloak.org/docs/latest/server_development/index.html#_themes to get all informations about how to customize a theme. 

In our case (for now), we only need to customize the login screens. The login theme can be found under `themes/qualifio/login`.

To run the image in local, do the following comand `docker-compose up`. Then visit http://localhost/auth/ and click on "Administration Console". 

You can also visit different screens to see your theme in action : 
- Login page: http://localhost/auth/realms/master/protocol/openid-connect/auth?client_id=security-admin-console&redirect_uri=http%3A%2F%2Flocalhost%2Fauth%2Fadmin%2Fmaster%2Fconsole%2F&state=4c7311f7-850d-475b-8725-cd39aa62cede&response_mode=fragment&response_type=code&scope=openid&nonce=61ba9017-6e31-4d5e-8f86-d4f4cb7a0c5c&code_challenge=hagSKr7xZjrHI4ev8qPLb1nTHfZWUVd_LbSP5kax3ks&code_challenge_method=S256
  - Submit an invalid email/password to see an error message
- Invalid request: http://localhost/auth/realms/master/protocol/openid-connect/auth
- An error occured: http://localhost/auth/realms/master/login-actions/authenticate?execution=ba47dd20-38e7-487f-8b96-cb3af43ee8b0&client_id=security--console&tab_id=wezb3XNZetA
- Client (client id) not found: http://localhost/auth/realms/master/protocol/openid-connect/auth?client_id=invalid-client&redirect_uri=http%3A%2F%2Flocalhost%2Fauth%2Fadmin%2Fmaster%2Fconsole%2F%23%2Frealms%2Fmaster&state=c434f8d6-5422-4bd6-b3f7-ff6c686671a2&response_mode=fragment&response_type=code&scope=openid&nonce=fbe3f484-fdfe-4f12-8451-f59b37d20278&code_challenge=UH138F-5sk30vPHfVPSebDeLS3Rn44DEDE2eZDLYXgs&code_challenge_method=S256
- Invalid redirect uri: http://localhost/auth/realms/master/protocol/openid-connect/auth?client_id=security-admin-console&redirect_uri=invalid&nonce=fb30fd97-a1d6-4253-b6a0-b8da950f7eaf&code_challenge=xVjozvv26ncOIiIF8s5r8m9wkFAyq92SI-GSrIAT6PU&code_challenge_method=S256
- Page not found: http://localhost/auth/realms/master/protocol/not-found/auth?client_id=security-admin-console&redirect_uri=http%3A%2F%2Flocalhost%2Fauth%2Fadmin%2Fmaster%2Fconsole%2F&state=be1cd3c2-46fd-4a24-8a6f-33ea1ef29994&response_mode=fragment&response_type=code&scope=openid&nonce=6dba81a9-17f5-4f03-8847-8c926d9ef765&code_challenge=zOiwJBYc_T6if7phnmdHR_Jzck8-Tih_YvADzo9Jd0I&code_challenge_method=S256
- Forgot Your Password (maybe not usefull in our case): http://localhost/auth/realms/master/login-actions/reset-credentials?client_id=security-admin-console&tab_id=B4ujmzHBTyw
- Register (probably not usefull neither): http://localhost/auth/realms/master/login-actions/registration?client_id=security-admin-console&tab_id=B4ujmzHBTyw

> Note that in local the theme is automatically configured to be the "qualifio" theme but in staging and production it must be configured at the master realm level.

> Note 2 : currently the theme files are cached, meaning that each time you do a change you must hard reload your page to force clearing the cache and actually see your changes (it's not really convenient but we didn't find a solution for now).
