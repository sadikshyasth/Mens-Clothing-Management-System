<?php

class Register
{
    public function insertCustomer()
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

        $token = sha1(time());
        $cust_datetime = date('Y-m-d h:i:s');
        // $cust_timestamp = time();

        // saving into the database
        $statement = $pdo->prepare("INSERT INTO tbl_customer (
                                        cust_name,
                                        cust_email,
                                        cust_phone,
                                        cust_address,
                                        cust_city,
                                        cust_state,
                                        cust_zip,

                                        cust_d_name,
                                        cust_d_phone,
                                        cust_d_address,
                                        cust_d_city,
                                        cust_d_state,
                                        cust_d_zip,

                                        cust_password,
                                        cust_token,
                                        cust_datetime,
                                        cust_status
                                    ) VALUES (?,?,?,?,?,?,?,  ?,?,?,?,?,?, ?,?,?,?)");
        $statement->execute(
            array(
                strip_tags($_POST['cust_name']),
                strip_tags($_POST['cust_email']),
                strip_tags($_POST['cust_phone']),
                strip_tags($_POST['cust_address']),
                strip_tags($_POST['cust_city']),
                strip_tags($_POST['cust_state']),
                strip_tags($_POST['cust_zip']),

                strip_tags($_POST['cust_name']),
                strip_tags($_POST['cust_phone']),
                strip_tags($_POST['cust_address']),
                strip_tags($_POST['cust_city']),
                strip_tags($_POST['cust_state']),
                strip_tags($_POST['cust_zip']),

                sha1($_POST['cust_password']),
                $token,
                $cust_datetime,
                //    $cust_timestamp,
                0,
            )
        );
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