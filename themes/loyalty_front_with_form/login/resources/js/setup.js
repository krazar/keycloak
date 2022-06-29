
var urlParams = new URLSearchParams(window.location.search);
var backUrl = urlParams.get('redirect_uri');

document.addEventListener("DOMContentLoaded", function(event) {
    var backToLogin = document.getElementById('backToLoginLink');
    var logo = document.querySelector('.kc-logo-text');
    var logoData = document.getElementById('logo-data');


    if(backUrl){
        backToLogin.href = backUrl.split("?")[0];
    }
    else {
        backToLogin?.remove();
    }

    if (logoData) {
        var logoUri = logoData.dataset?.uri;
        if(logo) {
            logo.style.backgroundImage = `url(${logoUri})`;
            logo.style.backgroundSize = "contain";
            logo.style.backgroundPosition = "center";
        }
        else {
            var customLogo = document.createElement("div");
            customLogo.className="kc-logo-text"
            customLogo.style.backgroundImage = `url(${logoUri})`
            customLogo.style.backgroundSize = "contain";
            customLogo.style.backgroundPosition = "center";
            var header = document.getElementById("kc-header");
            header.appendChild(customLogo);
        }
    }
    else {
        logo?.remove();
    }

});











