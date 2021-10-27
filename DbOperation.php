<?php

class DbOperation
{
    private $conn;

    //Constructor
    function __construct()
    {
        require_once dirname(__FILE__) . '/Config.php';
        require_once dirname(__FILE__) . '/DbConnect.php';
        // opening db connection
        $db = new DbConnect();
        $this->conn = $db->connect();
    }


    public function createUser($email, $pass, $l_name, $f_name, $phone)
    {
        if (!$this->isUserExist($email, $l_name, $phone)) {
            $password = md5($pass);
            $stmt = $this->conn->prepare("INSERT INTO users2 (email, password, f_name, l_name, phone) VALUES (?, ?, ?, ?, ?)");
            $stmt->bind_param("sssss", $email, $password, $f_name, $l_name, $phone);
            if ($stmt->execute()) {
                return USER_CREATED;
            } else {
                return USER_NOT_CREATED;
            }
        } else {
            return USER_ALREADY_EXIST;
        }
    }


    private function isUserExist($email, $l_name, $phone)
    {
        $stmt = $this->conn->prepare("SELECT id FROM users2 WHERE email = ? OR l_name = ? OR phone = ?");
        $stmt->bind_param("sss", $email, $l_name, $phone);
        $stmt->execute();
        $stmt->store_result();
        return $stmt->num_rows > 0;
    }
    

    public function userLogin($email, $pass)
    {
        $password = md5($pass);
        $stmt = $this->conn->prepare("SELECT id FROM users2 WHERE email = ? AND password = ?");
        $stmt->bind_param("ss", $email, $password);
        $stmt->execute();
        $stmt->store_result();
        return $stmt->num_rows > 0;
    }


   public function getUserByEmail($email)
    {
        $stmt = $this->conn->prepare("SELECT id, email, phone FROM users2 WHERE email = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $stmt->bind_result($id, $email, $phone);
        $stmt->fetch();
        $user = array();
        $user['id'] = $id;
       // $user['username'] = $uname;
        $user['email'] = $email;
        $user['phone'] = $phone;
        return $user;
    }

  }
