<?php
include 'connection.php';

$fname = $_POST['first_name'];
$lname = $_POST['last_name'];
$addr  = $_POST['address'];
$uname = $_POST['username'];
$pass  = $_POST['password'];
$role  = $_POST['role'];

try {
    $check_sql = "SELECT UserName FROM user WHERE UserName = ?";
    $check_stmt = mysqli_prepare($conn, $check_sql);
    mysqli_stmt_bind_param($check_stmt, "s", $uname);
    mysqli_stmt_execute($check_stmt);
    mysqli_stmt_store_result($check_stmt);

    if (mysqli_stmt_num_rows($check_stmt) > 0) {
        header("Location: ../frontEnd/register.html?status=exists");
        exit();
    }
    mysqli_stmt_close($check_stmt);

    mysqli_begin_transaction($conn);

    $sql = "INSERT INTO user (FirstName, LastName, Address, UserName, Password, Role) 
            VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, "ssssss", $fname, $lname, $addr, $uname, $pass, $role);

    if (mysqli_stmt_execute($stmt)) {

        $newUserID = mysqli_insert_id($conn);
        
        if (isset($_POST['phone_number']) && !empty($_POST['phone_number'])) {
            $phone = $_POST['phone_number'];
            $contact_sql = "INSERT INTO user_contact (UserID, ContactNumber) VALUES (?, ?)";
            $contact_stmt = mysqli_prepare($conn, $contact_sql);
            mysqli_stmt_bind_param($contact_stmt, "is", $newUserID, $phone);
            mysqli_stmt_execute($contact_stmt);
            mysqli_stmt_close($contact_stmt);
        }
        if ($role === 'User') {
            $link_sql = "INSERT INTO affected_person (UserID) VALUES (?)";
            $link_stmt = mysqli_prepare($conn, $link_sql);
            mysqli_stmt_bind_param($link_stmt, "i", $newUserID);
            mysqli_stmt_execute($link_stmt);
            mysqli_stmt_close($link_stmt);
        } else if ($role === 'Admin') {
            $admin_sql = "INSERT INTO admin (UserID) VALUES (?)";
            $admin_stmt = mysqli_prepare($conn, $admin_sql);
            mysqli_stmt_bind_param($admin_stmt, "i", $newUserID);
            mysqli_stmt_execute($admin_stmt);
            mysqli_stmt_close($admin_stmt);
        }

        mysqli_commit($conn); 
        header("Location: ../frontEnd/login.html?status=success");
        exit();
    } else {
        mysqli_rollback($conn); 
    }
    mysqli_stmt_close($stmt);

} catch (mysqli_sql_exception $e) {
    mysqli_rollback($conn);
    if ($e->getCode() == 1062) {
        header("Location: ../frontEnd/register.html?status=exists");
        exit();
    } else {
        echo "Database Error: " . $e->getMessage();
    }
}

mysqli_close($conn);
?>