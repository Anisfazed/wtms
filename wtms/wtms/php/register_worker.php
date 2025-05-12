<?php
error_reporting(0);
header("Access-Control-Allow-Origin: *");

if (!isset($_POST)) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die;
}

include_once("dbconnect.php");

// Retrieve and sanitize data
$name = $_POST['full_name'];
$email = $_POST['email'];
$password = sha1($_POST['password']);
$phone = $_POST['phone'];
$address = $_POST['address'];

// Correct SQL statement (column names in backticks)
$sqlinsert = "INSERT INTO `workers` (`full_name`, `email`, `password`, `phone`, `address`) 
              VALUES ('$name', '$email', '$password', '$phone', '$address')";

try {
    if ($conn->query($sqlinsert) === TRUE) {
        $response = array('status' => 'success', 'data' => null);
    } else {
        $response = array('status' => 'failed', 'data' => null);
    }
    sendJsonResponse($response);
} catch (Exception $e) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
}

function sendJsonResponse($sentArray)
{
    header('Content-Type: application/json');
    echo json_encode($sentArray);
}
?>
