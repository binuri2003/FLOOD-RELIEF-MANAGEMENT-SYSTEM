<?php
session_start();

session_unset();
 
session_destroy();

header("Location: ../frontEnd/login.html?message=loggedout");
exit();
?>