<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
header('Content-Type: application/json');

$host     = "localhost:3306";
$user     = "root";
$pass     = "";
$database = "flood_relief_management_system";

$conn = mysqli_connect($host, $user, $pass, $database);

if (!$conn) {
    echo json_encode([
        'status' => 'error',
        'message' => 'Database connection failed: ' . mysqli_connect_error()
    ]);
    exit;
}

?>