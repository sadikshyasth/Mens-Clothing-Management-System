<?php

class Footer
{
    public function getSubscriberDetails($subs_email)
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

        $statement = $pdo->prepare("SELECT * FROM tbl_subscriber WHERE subs_email=?");
		$statement->execute(array($subs_email));
		$total = $statement->rowCount();	
        return $total;
        
    }
    // public function getRows($subs_email)
    // {
    //     $dbhost = 'localhost';
    //     $dbname = 'ecommerceweb';
    //     $dbuser = 'root';
    //     $dbpass = '';
    //     try {
    //         $pdo = new PDO("mysql:host={$dbhost};dbname={$dbname}", $dbuser, $dbpass);
    //         $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    //     }
    //     catch( PDOException $exception ) {
    //         echo "Connection error :" . $exception->getMessage();
    //     }

    //     $statement = $pdo->prepare("SELECT * FROM tbl_subscriber WHERE subs_email=?");
	// 	$statement->execute(array($_POST['email_subscribe']));
	// 	$total = $statement->rowCount();
    // }


}

?>