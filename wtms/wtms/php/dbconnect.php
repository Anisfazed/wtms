<?php
$servername = "localhost";
$username   = "root";
$password   = "";
$dbname     = "wtms_db";

$conn = new mysqli($servername, $username, $password, $dbname);
// Enable error reporting
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
} else {
    echo "Connected successfully"; // Add this to confirm it works
}
?>