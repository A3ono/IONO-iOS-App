<?php
//including the file dboperation
require_once '../includes/DbOperation.php';

//creating a response array to store data
$response = array();

//creating a key in the response array to insert values
//this key will store an array iteself
$response['quotes'] = array();

//creating object of class DbOperation
$db = new DbOperation();

//getting the teams using the function we created
$quotes = $db->getQuote();

//looping through all the teams.
while($quote = $quotes->fetch_assoc()){
    //creating a temporary array
    $temp = array();

    //inserting the team in the temporary array
    $temp['c'] = $quote['c'];
    $temp['d']=$quote['d'];
    $temp['dp']=$quote['dp'];
    $temp['h']=$quote['h'];
    $temp['l']=$quote['l'];
    $temp['o']=$quote['o'];
    $temp['p']=$quote['p'];

    //inserting the temporary array inside response
    array_push($response['quotes'],$temp);
}

//displaying the array in json format
echo json_encode($response);
