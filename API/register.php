<?php

//importing required script
require_once '../includes/DbOperation.php';

$response = array();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (!verifyRequiredParams(array('email', 'password', 'f_name', 'l_name', 'phone'))) {
        //getting values
        $email = $_POST['email'];
        $password = $_POST['password'];
        $f_name = $_POST['f_name'];
        $l_name = $_POST['l_name'];
        $phone = $_POST['phone'];

        //creating db operation object
        $db = new DbOperation();

        //adding user to database
        $result = $db->createUser($email, $password, $f_name, $l_name, $phone);

        //making the response accordingly
        if ($result == USER_CREATED) {
            $response['error'] = false;
            $response['message'] = 'User created successfully';
        } elseif ($result == USER_ALREADY_EXIST) {
            $response['error'] = true;
            $response['message'] = 'User already exist';
        } elseif ($result == USER_NOT_CREATED) {
            $response['error'] = true;
            $response['message'] = 'Some error occurred';
        }
    } else {
        $response['error'] = true;
        $response['message'] = 'Required parameters are missing';
    }
} else {
    $response['error'] = true;
    $response['message'] = 'Invalid request';
}

//function to validate the required parameter in request
function verifyRequiredParams($required_fields)
{

    //Getting the request parameters
    $request_params = $_REQUEST;

    //Looping through all the parameters
    foreach ($required_fields as $field) {
        //if any requred parameter is missing
        if (!isset($request_params[$field]) || strlen(trim($request_params[$field])) <= 0) {

            return true;
        }
    }
    return false;
}

echo json_encode($response);
