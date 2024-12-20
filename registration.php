<?php require_once ('header.php'); ?>

<?php
$statement = $pdo->prepare("SELECT * FROM tbl_settings WHERE id=1");
$statement->execute();
$result = $statement->fetchAll(PDO::FETCH_ASSOC);
foreach ($result as $row) {
    $banner_registration = $row['banner_registration'];
}
?>

<?php
if (isset($_POST['form1'])) {

    $valid = 1;

    if (empty($_POST['cust_name'])) {
        $valid = 0;
        $error_message .= "Customer Name can not be empty" . "<br>";
    }

    if (empty($_POST['cust_email'])) {
        $valid = 0;
        $error_message .= "Email Address can not be empty" . "<br>";
    } else {
        if (filter_var($_POST['cust_email'], FILTER_VALIDATE_EMAIL) === false) {
            $valid = 0;
            $error_message .= "Email address must be valid" . "<br>";
        } else {
            $statement = $pdo->prepare("SELECT * FROM tbl_customer WHERE cust_email=?");
            $statement->execute(array($_POST['cust_email']));
            $total = $statement->rowCount();
            if ($total) {
                $valid = 0;
                $error_message .= "Email Address Already Exists" . "<br>";
            }
        }
    }

    if (empty($_POST['cust_phone'])) {
        $valid = 0;
        $error_message .= "Phone Number can not be empty" . "<br>";
    }

    if (empty($_POST['cust_address'])) {
        $valid = 0;
        $error_message .= "Address can not be empty" . "<br>";
    }



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

    if (empty($_POST['cust_password']) || empty($_POST['cust_re_password'])) {
        $valid = 0;
        $error_message .= "Password can not be empty". "<br>";
    }

    if (!empty($_POST['cust_password']) && !empty($_POST['cust_re_password'])) {
        if ($_POST['cust_password'] != $_POST['cust_re_password']) {
            $valid = 0;
            $error_message .= "Passwords do not match". "<br>";
        }
    }

    if ($valid == 1) {

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

        echo "<script> alert('Waiting for admin approval!'); </script>";

        //     // Send email for confirmation of the account
        //     $to = $_POST['cust_email'];

        //     $subject = LANG_VALUE_150;
        //     $verify_link = BASE_URL.'verify.php?email='.$to.'&token='.$token;
        //     $message = ''.LANG_VALUE_151.'<br><br>

        //     <a href="'.$verify_link.'">'.$verify_link.'</a>';

        //     $headers = "From: crestha680@" . BASE_URL . "\r\n" .
        //                "Reply-To: crestha680@" . BASE_URL . "\r\n" .
        //                "X-Mailer: PHP/" . phpversion() . "\r\n" . 
        //                "MIME-Version: 1.0\r\n" . 
        //                "Content-Type: text/html; charset=ISO-8859-1\r\n";

        //     // Sending Email
        //     mail($to, $subject, $message, $headers);

        //     unset($_POST['cust_name']);
        //     unset($_POST['cust_cname']);
        //     unset($_POST['cust_email']);
        //     unset($_POST['cust_phone']);
        //     unset($_POST['cust_address']);
        //     unset($_POST['cust_city']);
        //     unset($_POST['cust_state']);
        //     unset($_POST['cust_zip']);

        //     $success_message = LANG_VALUE_152;
    }
}
?>

<div class="page-banner"
    style="background-color:#444;background-image: url(assets/uploads/<?php echo $banner_registration; ?>);">
    <div class="inner">
        <h1><?php echo "Customer Registration"; ?></h1>
    </div>
</div>

<div class="page">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="user-content">



                    <form action="" method="post" id="registrationForm">
                        <?php $csrf->echoInputField(); ?>
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-8">

                                <?php
                                if ($error_message != '') {
                                    echo "<div class='error' style='padding: 10px;background:#f1f1f1;margin-bottom:20px;'>" . $error_message . "</div>";
                                }
                                if ($success_message != '') {
                                    echo "<div class='success' style='padding: 10px;background:#f1f1f1;margin-bottom:20px;'>" . $success_message . "</div>";
                                }
                                ?>

                                <div class="col-md-6 form-group">
                                    <label for=""><?php echo "Full Name"; ?> *</label>
                                    <input type="text" class="form-control" name="cust_name" required
                                        >
                                </div>

                                <div class="col-md-6 form-group">
                                    <label for=""><?php echo "Email Address"; ?> *</label>
                                    <input type="email" class="form-control" name="cust_email" required
                                        value="" placeholder="Email">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label for=""><?php echo "Phone Number"; ?> *</label>
                                    <input type="number" class="form-control" name="cust_phone" id="phoneInput" placeholder="9XXXXXXXXX"required
                                        >
                                </div>
                                <div class="col-md-12 form-group">
                                    <label for=""><?php echo "Address"; ?> *</label>
                                    <textarea name="cust_address" required class="form-control" cols="30" rows="10" style="height:70px;"   >
                                
                                    </textarea> 
                                </div>


                                <div class="col-md-6 form-group">
                                    <label for=""><?php echo "City"; ?> *</label>
                                    <input type="text" class="form-control" name="cust_city" required
                                        value="<?php if (isset($_POST['cust_city'])) {
                                            // echo $_POST['cust_city'];
                                        } ?>">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label for=""><?php echo "State"; ?> *</label>
                                    <input type="text" class="form-control" name="cust_state" required
                                        value="<?php if (isset($_POST['cust_state'])) {
                                            // echo $_POST['cust_state'];
                                        } ?>">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label for=""><?php echo "Zip Code"; ?> *</label>
                                    <input type="text" class="form-control" name="cust_zip" required
                                        value="<?php if (isset($_POST['cust_zip'])) {
                                            // echo $_POST['cust_zip'];
                                        } ?>">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label for=""><?php echo "Password"; ?> *</label>
                                    <input type="password" id="myInput" class="form-control" name="cust_password" required> 
                                </div>
                                <div class="col-md-6 form-group">
                                    <label for=""><?php echo "Retype Password"; ?> *</label>
                                    <input type="password" class="form-control" name="cust_re_password" required>
                                </div>
                                <div class="col-md-6 form-group">
                                    <label for=""></label>
                                    <input type="submit" class="btn btn-danger mt-2" style="display:block;" value="<?php echo "Register"; ?>"
                                        name="form1">
                                </div>
                            </div>
                        </div>
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

  document.getElementById('registrationForm').addEventListener('submit', function (event) {
    var password = document.getElementById('myInput').value;
    var passwordRegex = /^(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$/;

    if (!passwordRegex.test(password)) {
      alert('Password must be at least 8 characters long, include at least one uppercase letter, one symbol, and one number.');
      event.preventDefault();
    }
  });

</script>