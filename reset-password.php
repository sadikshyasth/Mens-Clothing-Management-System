<?php require_once('header.php'); ?>

<?php
$statement = $pdo->prepare("SELECT * FROM tbl_settings WHERE id=1");
$statement->execute();
$result = $statement->fetchAll(PDO::FETCH_ASSOC);                            
foreach ($result as $row) {
    $banner_reset_password = $row['banner_reset_password'];
}
?>

<?php
if( !isset($_GET['email']) || !isset($_GET['token']) )
{
    header('location: '.BASE_URL.'login.php');
    exit;
}

$statement = $pdo->prepare("SELECT * FROM tbl_customer WHERE cust_email=? AND cust_token=?");
$statement->execute(array($_GET['email'],$_GET['token']));
$result = $statement->fetchAll(PDO::FETCH_ASSOC);
$tot = $statement->rowCount();
if($tot == 0)
{
    header('location: '.BASE_URL.'login.php');
    exit;
}
foreach ($result as $row) {
    $saved_time = $row['cust_timestamp'];
}

$error_message2 = '';
if(time() - $saved_time > 86400)
{
    $error_message2 = "The password reset email time (24 hours) has expir...";
}

if(isset($_POST['form1'])) {

    $valid = 1;
    
    if( empty($_POST['cust_new_password']) || empty($_POST['cust_re_password']) )
    {
        $valid = 0;
        $error_message .= "Please enter new and retype passwords".'\\n';
    }
    else
    {
        if($_POST['cust_new_password'] != $_POST['cust_re_password'])
        {
            $valid = 0;
            $error_message .= "Passwords do not match".'\\n';
        }
    }   

    if($valid == 1) {

        $cust_new_password = strip_tags($_POST['cust_new_password']);
        $statement = $pdo->prepare("UPDATE tbl_customer SET cust_password=?, cust_token=?, cust_timestamp=? WHERE cust_email=?");
        $statement->execute(array(md5($cust_new_password),'','',$_GET['email']));
        
        header('location: '.BASE_URL.'reset-password-success.php');
    }

    
}
?>

<div class="page-banner" style="background-color:#444;background-image: url(assets/uploads/<?php echo $banner_reset_password; ?>);">
    <div class="inner">
        <h1><?php echo "Change Password"; ?></h1>
    </div>
</div>

<div class="page">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="user-content">
                    <?php
                    if($error_message != '') {
                        echo "<script>alert('".$error_message."')</script>";
                    }
                    ?>
                    <?php if($error_message2 != ''): ?>
                        <div class="error"><?php echo $error_message2; ?></div>
                    <?php else: ?>
                        <form action="" method="post">
                            <?php $csrf->echoInputField(); ?>
                            <div class="row">
                                <div class="col-md-4"></div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for=""><?php echo "New Password"; ?> *</label>
                                        <input type="password" class="form-control" name="cust_new_password">
                                    </div>
                                    <div class="form-group">
                                        <label for=""><?php echo "Retype New Password"; ?> *</label>
                                        <input type="password" class="form-control" name="cust_re_password">
                                    </div>
                                    <div class="form-group">
                                        <label for=""></label>
                                        <input type="submit" class="btn btn-primary" value="<?php echo "Change Password"; ?>" name="form1">
                                    </div>
                                </div>
                            </div>                        
                        </form>
                    <?php endif; ?>
                    
                </div>                
            </div>
        </div>
    </div>
</div>

<?php require_once('footer.php'); ?>