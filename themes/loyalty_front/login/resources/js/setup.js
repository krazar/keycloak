
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

    if (logoData){
        var logoUri = logoData.dataset?.uri;
        logo.style.backgroundImage = `url(${logoUri})`;
    }
    else {
        logo.remove();
    }




});











