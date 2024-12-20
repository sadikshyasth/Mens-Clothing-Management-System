<?php require_once ('header.php'); ?>

<?php
// Check if the customer is logged in or not
if (!isset($_SESSION['customer'])) {
    header('location: ' . BASE_URL . 'logout.php');
    exit;
} else {
    // If customer is logged in, but admin make him inactive, then force logout this user.
    $statement = $pdo->prepare("SELECT * FROM tbl_customer WHERE cust_id=? AND cust_status=?");
    $statement->execute(array($_SESSION['customer']['cust_id'], 0));
    $total = $statement->rowCount();
    if ($total) {
        header('location: ' . BASE_URL . 'logout.php');
        exit;
    }
}
?>

<?php
if (isset($_POST['form1'])) {

    $valid = 1;

    if (empty($_POST['cust_name'])) {
        $valid = 0;
        $error_message .= "Customer Name can not be empty" . "<br>";
    }

    if (empty($_POST['cust_phone'])) {
        $valid = 0;
        $error_message .= "Phone Number can not be empty" . "<br>";
    }

    if (empty($_POST['cust_address'])) {
        $valid = 0;
        $error_message .= "Address can not be empty" . "<br>";
    }

    // if (empty($_POST['cust_country'])) {
    //     $valid = 0;
    //     $error_message .= "You must have to select a country". "<br>";
    // }

    if (empty($_POST['cust_city'])) {
        $valid = 0;
        $error_message .= "City can not be empty" . "<br>";
    }

    if (empty($_POST['cust_state'])) {
        $valid = 0;
        $error_message .= "State can not be empty" . "<br>";
    }

    if (empty($_POST['cust_zip'])) {
        $valid = 0;
        $error_message .= "Zip Code can not be empty" . "<br>";
    }

    if ($valid == 1) {

        // update data into the database
        $statement = $pdo->prepare("UPDATE tbl_customer SET cust_name=?, cust_phone=?, cust_address=?, cust_city=?, cust_state=?, cust_zip=? WHERE cust_id=?");
        $statement->execute(
            array(
                strip_tags($_POST['cust_name']),
                // strip_tags($_POST['cust_cname']),
                strip_tags($_POST['cust_phone']),
                // strip_tags($_POST['cust_country']),
                strip_tags($_POST['cust_address']),
                strip_tags($_POST['cust_city']),
                strip_tags($_POST['cust_state']),
                strip_tags($_POST['cust_zip']),
                $_SESSION['customer']['cust_id']
            )
        );

        $success_message = "Profile Information is updated successfully";

        $_SESSION['customer']['cust_name'] = $_POST['cust_name'];
        // $_SESSION['customer']['cust_cname'] = $_POST['cust_cname'];
        $_SESSION['customer']['cust_phone'] = $_POST['cust_phone'];
        // $_SESSION['customer']['cust_country'] = $_POST['cust_country'];
        $_SESSION['customer']['cust_address'] = $_POST['cust_address'];
        $_SESSION['customer']['cust_city'] = $_POST['cust_city'];
        $_SESSION['customer']['cust_state'] = $_POST['cust_state'];
        $_SESSION['customer']['cust_zip'] = $_POST['cust_zip'];
    }
}
?>

<div class="page">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <?php require_once ('customer-sidebar.php'); ?>
            </div>
            <div class="col-md-12">
                <div class="user-content">
                    <h3>
                        <?php echo "Update Profile"; ?>
                    </h3>
                    <?php
                    if ($error_message != '') {
                        echo "<div class='error' style='padding: 10px;background:#f1f1f1;margin-bottom:20px;'>" . $error_message . "</div>";
                    }
                    if ($success_message != '') {
                        echo "<div class='success' style='padding: 10px;background:#f1f1f1;margin-bottom:20px;'>" . $success_message . "</div>";
                    }
                    ?>
                    <form action="" method="post">
                        <?php $csrf->echoInputField(); ?>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for=""><?php echo "Full Name"; ?> *</label>
                                    <input type="text" class="form-control" name="cust_name"
                                        value="<?php echo $_SESSION['customer']['cust_name']; ?>">
                                </div>

                                <div class="form-group">
                                    <label for=""><?php echo "Email Address"; ?> *</label>
                                    <input type="text" class="form-control" name=""
                                        value="<?php echo $_SESSION['customer']['cust_email']; ?>" disabled>
                                </div>
                                <div class="form-group">
                                    <label for=""><?php echo "Phone Number"; ?> *</label>
                                    <input type="number"  id="phoneInput" class="form-control" name="cust_phone"
                                        value="<?php echo $_SESSION['customer']['cust_phone']; ?>">
                                </div>
                                <div class="form-group">
                                    <label for=""><?php echo "Address"; ?> *</label>
                                    <textarea name="cust_address" class="form-control" cols="30" rows="10"
                                        style="height:70px;"><?php echo $_SESSION['customer']['cust_address']; ?></textarea>
                                </div>
                                

                                <div class="form-group">
                                    <label for=""><?php echo "City"; ?> *</label>
                                    <input type="text" class="form-control" name="cust_city"
                                        value="<?php echo $_SESSION['customer']['cust_city']; ?>">
                                </div>
                                <div class="form-group">
                                    <label for=""><?php echo "State"; ?> *</label>
                                    <input type="text" class="form-control" name="cust_state"
                                        value="<?php echo $_SESSION['customer']['cust_state']; ?>">
                                </div>
                                <div class="form-group">
                                    <label for=""><?php echo "Zip Code"; ?> *</label>
                                    <input type="text" class="form-control" name="cust_zip"
                                        value="<?php echo $_SESSION['customer']['cust_zip']; ?>">
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


<?php require_once ('footer.php'); ?>

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