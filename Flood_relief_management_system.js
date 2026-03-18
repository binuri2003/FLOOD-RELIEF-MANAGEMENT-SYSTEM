window.onload = function() {
    var urlParams = new URLSearchParams(window.location.search);
    var status = urlParams.get('status');

    if (status === 'success') {
        var notify = document.getElementById('notification-box');
        if (notify) {
            notify.style.display = 'block';
            setTimeout(function() { 
                notify.style.display = 'none'; 
            }, 5000);
        }
    }

    if (status === 'error') {
        var errorNotify = document.getElementById('error-box');
        if (errorNotify) { 
            errorNotify.style.display = 'block'; 
        }
    }

    if (status === 'exists') {
        var duplicateBox = document.getElementById('duplicate-error');
        if (duplicateBox) { 
            duplicateBox.style.display = 'block'; 
        }
    }
};

function validateAuth() {
    var pass1 = document.getElementById("pass1").value;
    var pass2 = document.getElementById("pass2").value;
    if (pass1 != pass2) {
        alert("Passwords do not match.");
        return false; 
    }
    return true; 
}