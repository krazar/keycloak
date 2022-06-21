
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

    console.log('hellooooo');

    if (logoData) {
        var logoUri = logoData.dataset?.uri;
        if(logo) {
            logo.style.backgroundImage = `url(${logoUri})`;
        }
        else {
            var customLogo = document.createElement("div");
            customLogo.className="kc-logo-text"
            customLogo.style.backgroundImage = "url(https://www.svgrepo.com/show/303110/apple-black-logo.svg)"
            var header = document.getElementById("kc-header");
            header.appendChild(customLogo);
        }
    }
    else {
        logo?.remove();
    }
    
});











