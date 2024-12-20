<?php
ob_start();
session_start();
include ("../admin/inc/config.php");
include ("../admin/inc/functions.php");
// Getting all language variables into array as global variable
$i = 1;
$statement = $pdo->prepare("SELECT * FROM tbl_language");
$statement->execute();
$result = $statement->fetchAll(PDO::FETCH_ASSOC);
foreach ($result as $row) {
    define('LANG_VALUE_' . $i, $row['lang_value']);
    $i++;
}
?>
<?php
// Get the pidx from the URL
$pidx = $_GET['pidx'] ?? null;

if ($pidx) {
    $curl = curl_init();
    curl_setopt_array(
        $curl,
        array(
            CURLOPT_URL => 'https://a.khalti.com/api/v2/epayment/lookup/',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => json_encode(['pidx' => $pidx]),
            CURLOPT_HTTPHEADER => array(
                'Authorization: key live_secret_key_68791341fdd94846a146f0457ff7b455',
                'Content-Type: application/json',
            ),
        )
    );


    $response = curl_exec($curl);
    curl_close($curl);

    if ($response) {
        $responseArray = json_decode($response, true);
        switch ($responseArray['status']) {
            case 'Completed':
                //here you can write your logic to update the database


                if (!isset($_REQUEST['msg'])) {

                    $payment_date = date('Y-m-d H:i:s');
                    $payment_id = time();
                    $amount=$_SESSION['amount'] ;

                    $statement = $pdo->prepare("INSERT INTO tbl_payment (   
	                            customer_id,
	                            customer_name,
	                            customer_email,
	                            payment_date, 
	                            paid_amount,
	                           
	                            payment_method,
	                            payment_status,
	                            shipping_status,
	                            payment_id
	                        ) VALUES (?,?,?,?,?,?,?,?,?)");
                    $statement->execute(
                        array(
                            $_SESSION['customer']['cust_id'],
                            $_SESSION['customer']['cust_name'],
                            $_SESSION['customer']['cust_email'],
                            $payment_date,
                            $amount,

                            'Khalti',
                            'Pending',
                            'Pending',
                            $payment_id
                        )
                    );

                    $i = 0;
                    foreach ($_SESSION['cart_p_id'] as $key => $value) {
                        $i++;
                        $arr_cart_p_id[$i] = $value;
                    }

                    $i = 0;
                    foreach ($_SESSION['cart_p_name'] as $key => $value) {
                        $i++;
                        $arr_cart_p_name[$i] = $value;
                    }

                    $i = 0;
                    foreach ($_SESSION['cart_size_name'] as $key => $value) {
                        $i++;
                        $arr_cart_size_name[$i] = $value;
                    }

                    $i = 0;
                    foreach ($_SESSION['cart_color_name'] as $key => $value) {
                        $i++;
                        $arr_cart_color_name[$i] = $value;
                    }

                    $i = 0;
                    foreach ($_SESSION['cart_p_qty'] as $key => $value) {
                        $i++;
                        $arr_cart_p_qty[$i] = $value;
                    }

                    $i = 0;
                    foreach ($_SESSION['cart_p_current_price'] as $key => $value) {
                        $i++;
                        $arr_cart_p_current_price[$i] = $value;
                    }

                    $i = 0;
                    $statement = $pdo->prepare("SELECT * FROM tbl_product");
                    $statement->execute();
                    $result = $statement->fetchAll(PDO::FETCH_ASSOC);
                    foreach ($result as $row) {
                        $i++;
                        $arr_p_id[$i] = $row['p_id'];
                        $arr_p_qty[$i] = $row['p_qty'];
                    }

                    for ($i = 1; $i <= count($arr_cart_p_name); $i++) {
                        $statement = $pdo->prepare("INSERT INTO tbl_order (
	                        product_id,
	                        product_name,
	                        size, 
	                        color,
	                        quantity, 
	                        unit_price, 
	                        payment_id
	                        ) 
	                        VALUES (?,?,?,?,?,?,?)");
                        $sql = $statement->execute(
                            array(
                                $arr_cart_p_id[$i],
                                $arr_cart_p_name[$i],
                                $arr_cart_size_name[$i],
                                $arr_cart_color_name[$i],
                                $arr_cart_p_qty[$i],
                                $arr_cart_p_current_price[$i],
                                $payment_id
                            )
                        );

                        // Update the stock
                        for ($j = 1; $j <= count($arr_p_id); $j++) {
                            if ($arr_p_id[$j] == $arr_cart_p_id[$i]) {
                                $current_qty = $arr_p_qty[$j];
                                break;
                            }
                        }
                        $final_quantity = $current_qty - $arr_cart_p_qty[$i];
                        $statement = $pdo->prepare("UPDATE tbl_product SET p_qty=? WHERE p_id=?");
                        $statement->execute(array($final_quantity, $arr_cart_p_id[$i]));

                    }
                    unset($_SESSION['amount']);
                    unset($_SESSION['cart_p_id']);
                    unset($_SESSION['cart_size_id']);
                    unset($_SESSION['cart_size_name']);
                    unset($_SESSION['cart_color_id']);
                    unset($_SESSION['cart_color_name']);
                    unset($_SESSION['cart_p_qty']);
                    unset($_SESSION['cart_p_current_price']);
                    unset($_SESSION['cart_p_name']);
                    unset($_SESSION['cart_p_featured_photo']);

                    header('location: ../payment_success.php');

                }

                exit();
            case 'Expired':
                header("Location: ../payment_cancel.php");
                exit();
            case 'User canceled':
                //here you can write your logic to update the database
                header("Location: ../payment_cancel.php");
                exit();
            default:
                //here you can write your logic to update the database
                header("Location: checkout.php");
                exit();
        }
    }
}