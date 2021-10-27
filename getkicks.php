<?php
//including the file dboperation
require_once '../includes/DbOperation.php';

//creating a response array to store data
$response = array();

//creating a key in the response array to insert values
//this key will store an array iteself
$response['kicks'] = array();

//creating object of class DbOperation
$db = new DbOperation();

//getting the teams using the function we created
$kicks = $db->getKicks();

//looping through all the teams.
while($October = $kicks->fetch_assoc()){
    //creating a temporary array
    $temp = array();

    //inserting the team in the temporary array
    $temp['shoes_name'] = $October['shoes_name'];
    $temp['shoes_date']=$October['shoes_date'];
    $temp['shoes_price']=$October['shoes_price'];

    //inserting the temporary array inside response
    array_push($response['kicks'],$temp);
}

//displaying the array in json format
echo json_encode($response);