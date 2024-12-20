<?php

class Customer_psw
{
    public function getCustomer_psw($cust_id,$cust_status)
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
        
        $statement = $pdo->prepare("SELECT * FROM tbl_customer WHERE cust_id=? AND cust_status=?");
        $statement->execute(array($_SESSION['customer']['cust_id'],0));
        $total = $statement->rowCount();
    }

}
    ?>