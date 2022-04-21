
var urlParams = new URLSearchParams(window.location.search);
var backUrl = urlParams.get('redirect_uri');

document.addEventListener("DOMContentLoaded", function(event) {
    var backToLogin = document.getElementById('backToLoginLink');
    if(backUrl){
        backToLogin.href = backUrl;
    }
    else {
        backToLogin?.remove();
    }

    var logoData = document.getElementById('logo-data');
    if (logoData){
        var logoUri = logoData.dataset?.uri;
        var logo = document.querySelector('.kc-logo-text');
        logo.style.backgroundImage = `url(${logoUri})`;
    }


});











