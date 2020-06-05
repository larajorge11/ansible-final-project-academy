<?php
$servername = "10.0.1.5";
$username = "root";
$password = "JORlaresp1970!";
$db_name = "crud";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $db_name);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
?>