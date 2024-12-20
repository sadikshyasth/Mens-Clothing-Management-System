<?php require_once('header.php'); ?>

<?php
// Check if the customer is logged in or not
if(!isset($_SESSION['customer'])) {
    header('location: '.BASE_URL.'logout.php');
    exit;
} else {
    // If customer is logged in, but admin make him inactive, then force logout this user.
    $statement = $pdo->prepare("SELECT * FROM tbl_customer WHERE cust_id=? AND cust_status=?");
    $statement->execute(array($_SESSION['customer']['cust_id'],0));
    $total = $statement->rowCount();
    if($total) {
        header('location: '.BASE_URL.'logout.php');
        exit;
    }
}
?>

<?php
if (isset($_POST['form1'])) {


    // update data into the database
    $statement = $pdo->prepare("UPDATE tbl_customer SET 
                            cust_d_name=?,  
                            cust_d_phone=?,  
                            cust_d_address=?, 
                            cust_d_city=?, 
                            cust_d_state=?, 
                            cust_d_zip=?

                            WHERE cust_id=?");
    $statement->execute(array(
                            strip_tags($_POST['cust_d_name']),
                            
                            strip_tags($_POST['cust_d_phone']),
                            
                            strip_tags($_POST['cust_d_address']),
                            strip_tags($_POST['cust_d_city']),
                            strip_tags($_POST['cust_d_state']),
                            strip_tags($_POST['cust_d_zip']),
                            $_SESSION['customer']['cust_id']
                        ));  
   
    $success_message = "Delivery Information is updated successfully.";

    $_SESSION['customer']['cust_d_name'] = strip_tags($_POST['cust_d_name']);
    // $_SESSION['customer']['cust_d_cname'] = strip_tags($_POST['cust_d_cname']);
    $_SESSION['customer']['cust_d_phone'] = strip_tags($_POST['cust_d_phone']);
    // $_SESSION['customer']['cust_d_country'] = strip_tags($_POST['cust_d_country']);
    $_SESSION['customer']['cust_d_address'] = strip_tags($_POST['cust_d_address']);
    $_SESSION['customer']['cust_d_city'] = strip_tags($_POST['cust_d_city']);
    $_SESSION['customer']['cust_d_state'] = strip_tags($_POST['cust_d_state']);
    $_SESSION['customer']['cust_d_zip'] = strip_tags($_POST['cust_d_zip']);

}
?>

<div class="page">
    <div class="container">
        <div class="row">            
            <div class="col-md-12"> 
                <?php require_once('customer-sidebar.php'); ?>
            </div>
            <div class="col-md-12">
                <div class="user-content">
                    <?php
                    if($error_message != '') {
                        echo "<div class='error' style='padding: 10px;background:#f1f1f1;margin-bottom:20px;'>".$error_message."</div>";
                    }
                    if($success_message != '') {
                        echo "<div class='success' style='padding: 10px;background:#f1f1f1;margin-bottom:20px;'>".$success_message."</div>";
                    }
                    ?>
                    <form action="" method="post">
                        <?php $csrf->echoInputField(); ?>
                        <div class="row">
                            <div class="col-md-6">
                                <h3><?php echo "Update Delivery Address"; ?></h3>
                                <div class="form-group">
                                    <label for=""><?php echo "Full Name"; ?></label>
                                    <input type="text" class="form-control" name="cust_d_name" value="<?php echo $_SESSION['customer']['cust_d_name']; ?>">
                                </div>
                                
                                <div class="form-group">
                                    <label for=""><?php echo "Phone Number"; ?></label>
                                    <input type="number" id="phoneInput" class="form-control" name="cust_d_phone" value="<?php echo $_SESSION['customer']['cust_d_phone']; ?>">
                                </div>
                               
                                <div class="form-group">
                                    <label for=""><?php echo "Address"; ?></label>
                                    <textarea name="cust_d_address" class="form-control" cols="30" rows="10" style="height:100px;"><?php echo $_SESSION['customer']['cust_d_address']; ?></textarea>
                                </div>
                                <div class="form-group">
                                    <label for=""><?php echo "City"; ?></label>
                                    <input type="text" class="form-control" name="cust_d_city" value="<?php echo $_SESSION['customer']['cust_d_city']; ?>">
                                </div>
                                <div class="form-group">
                                    <label for=""><?php echo "State"; ?></label>
                                    <input type="text" class="form-control" name="cust_d_state" value="<?php echo $_SESSION['customer']['cust_d_state']; ?>">
                                </div>
                                <div class="form-group">
                                    <label for=""><?php echo "Zip Code"; ?></label>
                                    <input type="text" class="form-control" name="cust_d_zip" value="<?php echo $_SESSION['customer']['cust_d_zip']; ?>">
                                </div>
                            </div>
                        </div>
                        <input type="submit" class="btn btn-primary" value="<?php echo "Update"; ?>" name="form1">
                    </form>
                </div>                
            </div>
        </div>
    </div>
</div>


<?php require_once('footer.php'); ?>

<script>
      document.querySelectorAll('input[type="number"]').forEach(function (input) {
        input.addEventListener('keydown', function (e) {
            // Prevent minus sign from being entered
            if (e.key === '-' || e.key === 'Subtract') {
                e.preventDefault();
            }
        });
    });
    document.querySelectorAll('input[type="number"]').forEach(function (input) {
    input.addEventListener('input', function () {
      if (this.value.length > 10) {
        this.value = this.value.slice(0, 10);
      }
    });

    input.addEventListener('keydown', function (e) {
      if (this.value.length >= 10 && ![8, 37, 38, 39, 40, 46].includes(e.keyCode)) {
        e.preventDefault();
      }
    });
  });

  document.getElementById('phoneInput').addEventListener('input', function (event) {
    // Use a regular expression to remove non-numeric characters
    this.value = this.value.replace(/[^\d]/g, '');

    // Ensure the value starts with '9'
    if (this.value.length >= 1) {
      if (this.value.slice(0, 1) !== '9') {
        // If it doesn't start with '9', set the value to '9'
        this.value = '9';
      }
    } else {
      // If less than 2 characters, just ensure it starts with '9' and limit input
      this.value = '9'.slice(0, this.value.length);
    }
  });
</script>