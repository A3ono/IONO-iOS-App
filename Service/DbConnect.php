<?php

class DbConnect
{
    private $conn;

    function __construct()
    {
    }


    function connect()
    {
        require_once 'Config.php';

        // Connecting to mysql database
        $this->conn = new mysqli('localhost', 'root', '', 'iono');

        // Check for database connection error
        if (mysqli_connect_errno()) {
            echo "Failed to connect to MySQL: " . mysqli_connect_error();
        }

        // returning connection resource
        return $this->conn;
    }
}
