<?php

class Cart
{
    public function addToCart()
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
        // compulsory

        if(isset($_POST['form_add_to_cart'])) {

            // getting the currect stock of this product
            $statement = $pdo->prepare("SELECT * FROM tbl_product WHERE p_id=?");
            $statement->execute(array($_REQUEST['id']));
            $result = $statement->fetchAll(PDO::FETCH_ASSOC);							
            foreach ($result as $row) {
                $current_p_qty = $row['p_qty'];
            }
            if($_POST['p_qty'] > $current_p_qty){
                $temp_msg = 'Sorry! There are only '.$current_p_qty.' item(s) in stock';
                ?>
                <script type="text/javascript">alert('<?php echo $temp_msg; ?>');</script>
                <?php
            }
                
            else{
                if(isset($_SESSION['cart_p_id']))
            {
                $arr_cart_p_id = array();
                $arr_cart_size_id = array();
                $arr_cart_color_id = array();
                $arr_cart_p_qty = array();
                $arr_cart_p_current_price = array();
        
                $i=0;
                foreach($_SESSION['cart_p_id'] as $key => $value) 
                {
                    $i++;
                    $arr_cart_p_id[$i] = $value;
                }
        
                $i=0;
                foreach($_SESSION['cart_size_id'] as $key => $value) 
                {
                    $i++;
                    $arr_cart_size_id[$i] = $value;
                }
        
                $i=0;
                foreach($_SESSION['cart_color_id'] as $key => $value) 
                {
                    $i++;
                    $arr_cart_color_id[$i] = $value;
                }
        
        
                $added = 0;
                if(!isset($_POST['size_id'])) {
                    $size_id = 0;
                } else {
                    $size_id = $_POST['size_id'];
                }
                if(!isset($_POST['color_id'])) {
                    $color_id = 0;
                } else {
                    $color_id = $_POST['color_id'];
                }
                for($i=1;$i<=count($arr_cart_p_id);$i++) {
                    if( ($arr_cart_p_id[$i]==$_REQUEST['id']) && ($arr_cart_size_id[$i]==$size_id) && ($arr_cart_color_id[$i]==$color_id) ) {
                        $added = 1;
                        break;
                    }
                }
                if($added == 1) {
                   $error_message1 = 'This product is already added to the shopping cart.';
                } else {
        
                    $i=0;
                    foreach($_SESSION['cart_p_id'] as $key => $res) 
                    {
                        $i++;
                    }
                    $new_key = $i+1;
        
                    if(isset($_POST['size_id'])) {
        
                        $size_id = $_POST['size_id'];
        
                        $statement = $pdo->prepare("SELECT * FROM tbl_size WHERE size_id=?");
                        $statement->execute(array($size_id));
                        $result = $statement->fetchAll(PDO::FETCH_ASSOC);                            
                        foreach ($result as $row) {
                            $size_name = $row['size_name'];
                        }
                    } else {
                        $size_id = 0;
                        $size_name = '';
                    }
                    
                    if(isset($_POST['color_id'])) {
                        $color_id = $_POST['color_id'];
                        $statement = $pdo->prepare("SELECT * FROM tbl_color WHERE color_id=?");
                        $statement->execute(array($color_id));
                        $result = $statement->fetchAll(PDO::FETCH_ASSOC);                            
                        foreach ($result as $row) {
                            $color_name = $row['color_name'];
                        }
                    } else {
                        $color_id = 0;
                        $color_name = '';
                    }
                  
        
                    $_SESSION['cart_p_id'][$new_key] = $_REQUEST['id'];
                    $_SESSION['cart_size_id'][$new_key] = $size_id;
                    $_SESSION['cart_size_name'][$new_key] = $size_name;
                    $_SESSION['cart_color_id'][$new_key] = $color_id;
                    $_SESSION['cart_color_name'][$new_key] = $color_name;
                    $_SESSION['cart_p_qty'][$new_key] = $_POST['p_qty'];
                    $_SESSION['cart_p_current_price'][$new_key] = $_POST['p_current_price'];
                    $_SESSION['cart_p_name'][$new_key] = $_POST['p_name'];
                    $_SESSION['cart_p_featured_photo'][$new_key] = $_POST['p_featured_photo'];
        
                    $success_message1 = 'Product is added to the cart successfully!';
                }
                
            }
            }
            if(isset($_SESSION['cart_p_id']))
            {
                $arr_cart_p_id = array();
                $arr_cart_size_id = array();
                $arr_cart_color_id = array();
                $arr_cart_p_qty = array();
                $arr_cart_p_current_price = array();
        
                $i=0;
                foreach($_SESSION['cart_p_id'] as $key => $value) 
                {
                    $i++;
                    $arr_cart_p_id[$i] = $value;
                }
        
                $i=0;
                foreach($_SESSION['cart_size_id'] as $key => $value) 
                {
                    $i++;
                    $arr_cart_size_id[$i] = $value;
                }
        
                $i=0;
                foreach($_SESSION['cart_color_id'] as $key => $value) 
                {
                    $i++;
                    $arr_cart_color_id[$i] = $value;
                }
        
        
                $added = 0;
                if(!isset($_POST['size_id'])) {
                    $size_id = 0;
                } else {
                    $size_id = $_POST['size_id'];
                }
                if(!isset($_POST['color_id'])) {
                    $color_id = 0;
                } else {
                    $color_id = $_POST['color_id'];
                }
                for($i=1;$i<=count($arr_cart_p_id);$i++) {
                    if( ($arr_cart_p_id[$i]==$_REQUEST['id']) && ($arr_cart_size_id[$i]==$size_id) && ($arr_cart_color_id[$i]==$color_id) ) {
                        $added = 1;
                        break;
                    }
                }
                if($added == 1) {
                   $error_message1 = 'This product is already added to the shopping cart.';
                } else {
        
                    $i=0;
                    foreach($_SESSION['cart_p_id'] as $key => $res) 
                    {
                        $i++;
                    }
                    $new_key = $i+1;
        
                    if(isset($_POST['size_id'])) {
        
                        $size_id = $_POST['size_id'];
        
                        $statement = $pdo->prepare("SELECT * FROM tbl_size WHERE size_id=?");
                        $statement->execute(array($size_id));
                        $result = $statement->fetchAll(PDO::FETCH_ASSOC);                            
                        foreach ($result as $row) {
                            $size_name = $row['size_name'];
                        }
                    } else {
                        $size_id = 0;
                        $size_name = '';
                    }
                    
                    if(isset($_POST['color_id'])) {
                        $color_id = $_POST['color_id'];
                        $statement = $pdo->prepare("SELECT * FROM tbl_color WHERE color_id=?");
                        $statement->execute(array($color_id));
                        $result = $statement->fetchAll(PDO::FETCH_ASSOC);                            
                        foreach ($result as $row) {
                            $color_name = $row['color_name'];
                        }
                    } else {
                        $color_id = 0;
                        $color_name = '';
                    }
                  
        
                    $_SESSION['cart_p_id'][$new_key] = $_REQUEST['id'];
                    $_SESSION['cart_size_id'][$new_key] = $size_id;
                    $_SESSION['cart_size_name'][$new_key] = $size_name;
                    $_SESSION['cart_color_id'][$new_key] = $color_id;
                    $_SESSION['cart_color_name'][$new_key] = $color_name;
                    $_SESSION['cart_p_qty'][$new_key] = $_POST['p_qty'];
                    $_SESSION['cart_p_current_price'][$new_key] = $_POST['p_current_price'];
                    $_SESSION['cart_p_name'][$new_key] = $_POST['p_name'];
                    $_SESSION['cart_p_featured_photo'][$new_key] = $_POST['p_featured_photo'];
        
                    $success_message1 = 'Product is added to the cart successfully!';
                }
                
            }
        
        }
    }    
}

?>