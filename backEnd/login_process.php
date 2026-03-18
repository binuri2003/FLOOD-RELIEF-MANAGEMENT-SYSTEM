<?php
session_start();

$servername = "127.0.0.1";
$username   = "root";
$password   = "";
$database   = "flood_relief_management_system";

$conn = mysqli_connect($servername, $username, $password, $database);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$uname = trim($_POST['username'] ?? '');
$pass  = trim($_POST['password'] ?? '');

if (empty($uname) || empty($pass)) {
    header("Location: ../frontEnd/login.html?status=empty");
    exit();
}

$sql = "SELECT * FROM user WHERE UserName = ? AND Password = ?";
$stmt = mysqli_prepare($conn, $sql);

mysqli_stmt_bind_param($stmt, "ss", $uname, $pass);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);

if ($result && mysqli_num_rows($result) > 0) {

    $row = mysqli_fetch_assoc($result);

    $_SESSION['user_id'] = $row['UserID'];
    $_SESSION['role'] = $row['Role'];

    $role = strtolower($row['Role']);

    if ($role === 'admin') {
        header("Location: ../adminpart/adminFrontend.html");
        exit();
    }

    else if ($role === 'customer' || $role === 'user') {
        header("Location: ../userpart/user_home.html");
        exit();
    }

    else {
        header("Location: ../frontEnd/login.html?status=invalidrole");
        exit();
    }

} else {

    header("Location: ../frontEnd/login.html?status=error");
    exit();

}

mysqli_stmt_close($stmt);
mysqli_close($conn);
?>
