<?php

class Login
{
    public function getLoginDetails($cust_email)
    {
        // compulsory

        $dbhost = 'localhost';
        $dbname = 'ecommerceweb';
        $dbuser = 'root';
        $dbpass = '';
        try {
            $pdo = new PDO("mysql:host={$dbhost};dbname={$dbname}", $dbuser, $dbpass);
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }
        catch( PDOException $exception ) {
            echo "Connection error :" . $exception->getMessage();
        }
        
        //compulsory

        $statement = $pdo->prepare("SELECT * FROM tbl_customer WHERE cust_email=?");
        $statement->execute(array($cust_email));
        $result = $statement->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }
    public function getRows($cust_email)
    {
        $dbhost = 'localhost';
        $dbname = 'ecommerceweb';
        $dbuser = 'root';
        $dbpass = '';
        try {
            $pdo = new PDO("mysql:host={$dbhost};dbname={$dbname}", $dbuser, $dbpass);
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }
        catch( PDOException $exception ) {
            echo "Connection error :" . $exception->getMessage();
        }

        $statement = $pdo->prepare("SELECT * FROM tbl_customer WHERE cust_email=?");
        $statement->execute(array($cust_email));
        $total = $statement->rowCount();
        return $total;
    }


}

?>