window.onload = function() {
    loadUsers();
};

function showSection(sectionId) {
    document.getElementById("users").style.display = "none";
    document.getElementById("reports").style.display = "none";
    document.getElementById(sectionId).style.display = "block";
    
    if (sectionId == 'users') {
        loadUsers();
    }
    if (sectionId == 'reports') {
        loadSummary();
    }
}

function loadUsers() {
    fetch('admin_backenddev.php')
    .then(response => response.json())
    .then(users => {
        let html = '';
        for (let i = 0; i < users.length; i++) {
            let user = users[i];
            html += '<tr>';
            html += '<td>' + user.UserID + '</td>';
            html += '<td style="cursor:pointer; color:blue;" onclick="viewUserDetails(' + user.UserID + ')">' + user.FirstName + ' ' + user.LastName + '</td>';
            html += '<td>' + user.UserName + '</td>';
            html += '<td>' + (user.Address || 'N/A') + '</td>';
            html += '<td>' + user.Role + '</td>';
            html += '<td><button onclick="deleteUser(' + user.UserID + ',\'' + user.FirstName + ' ' + user.LastName + '\')" style="background:#dc3545; color:white; border:none; padding:5px 10px; cursor:pointer;">Delete</button></td>';
            html += '</tr>';
        }
        document.getElementById("userTableBody").innerHTML = html;
    })
    .catch(error => {
        document.getElementById("userTableBody").innerHTML = '<tr><td colspan="6" style="color:red; text-align:center;">Error loading users</td></tr>';
    });
}

function deleteUser(id, name) {
    if (confirm("Do you want to delete " + name + "?")) {

        fetch('admin_backenddev.php?deleteId=' + id)
        .then(response => response.text())
        .then(data => {
            alert("User deleted successfully!");
            loadUsers();
            loadSummary();
        })
        .catch(error => {
            alert("Error deleting user!");
        });
    }
}

function viewUserDetails(id) {
    fetch('admin_backenddev.php?userId=' + id)
    .then(response => response.json())
    .then(user => {
        let html = '';
        html += '<p><strong>Name:</strong> ' + (user.FirstName || '') + ' ' + (user.LastName || '') + '</p>';
        html += '<p><strong>Username:</strong> ' + (user.UserName || 'N/A') + '</p>';
        html += '<p><strong>Address:</strong> ' + (user.Address || 'Not provided') + '</p>';
        html += '<p><strong>Role:</strong> ' + (user.Role || 'N/A') + '</p>';
        document.getElementById("reportContent").innerHTML = html;
        document.getElementById("individualReport").style.display = "block";
    });
}

function loadSummary() {
    let area = document.getElementById("areaFilter").value;
    let relief = document.getElementById("reliefFilter").value;
    
    fetch('admin_backenddev.php?action=summary&area=' + area + '&reliefType=' + relief)
    .then(response => response.json())
    .then(data => {
        let html = '';
        html += '<li>Total Registered Users: ' + data.totalUsers + '</li>';
        html += '<li>High Severity Requests: ' + data.highSeverity + '</li>';
        html += '<li>' + data.typeName + ' Requests: ' + data.reliefCount + '</li>';
        
        if (data.highSeverity > data.totalUsers) {
            html += '<li style="color:blue; margin-top:10px;">Note: ' + data.highSeverity + ' high severity requests from ' + data.totalUsers + ' users means some users made multiple requests!</li>';
        }
        
        document.getElementById("summaryValues").innerHTML = html;
    });
}

function logout() {
    if (confirm("Do You Want to Logout?")) {
        window.location.href = "../backEnd/logout.php";
    }
}