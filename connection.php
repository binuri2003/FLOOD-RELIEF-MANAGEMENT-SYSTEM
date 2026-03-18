<?php
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

$host = "localhost"; 
$user = "root";
$pass = "";
$dbname = "flood_relief_management_system";
$port = 3307;

try {
    $conn = mysqli_connect($host, $user, $pass, $dbname, $port);
} catch (mysqli_sql_exception $e) {
    die("Connection failed: " . $e->getMessage());
}
?>