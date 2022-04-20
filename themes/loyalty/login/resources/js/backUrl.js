
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

});











