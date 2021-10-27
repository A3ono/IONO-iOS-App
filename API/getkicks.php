<?php
require_once '../includes/DbOperation.php';

$response = array();

$response['kicks'] = array();

$db = new DbOperation();

$kicks = $db->getKicks();

//looping through kicks
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

echo json_encode($response);
