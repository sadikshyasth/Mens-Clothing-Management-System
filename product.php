<?php 

require_once('header.php'); 
require_once('Class/Product.php'); 
?>

<?php
if(!isset($_REQUEST['id'])) {
    header('location: index.php');
    exit;
} else {
    // Check the id is valid or not
    // $statement = $pdo->prepare("SELECT * FROM tbl_product WHERE p_id=?");
    // $statement->execute(array($_REQUEST['id']));
    // $total = $statement->rowCount();
    // $result = $statement->fetchAll(PDO::FETCH_ASSOC);7

    $product_object= new Product();
    $result= $product_object->getProductDetails($_REQUEST['id']);
    $total= $product_object->getRows($_REQUEST['id']);


    if( $total == 0 ) {
        header('location: index.php');
        exit;
    }
}

foreach($result as $row) {
    $p_name = $row['p_name'];
    $p_old_price = $row['p_old_price'];
    $p_current_price = $row['p_current_price'];
    $p_qty = $row['p_qty'];
    $p_featured_photo = $row['p_featured_photo'];
    $p_description = $row['p_description'];
    $p_short_description = $row['p_short_description'];
    $p_feature = $row['p_feature'];
    $p_condition = $row['p_condition'];
    $p_return_policy = $row['p_return_policy'];
    $p_total_view = $row['p_total_view'];
    $p_is_featured = $row['p_is_featured'];
    $p_is_active = $row['p_is_active'];
    $ecat_id = $row['ecat_id'];
}

// Getting all categories name for breadcrumb
$statement = $pdo->prepare("SELECT
                        t1.ecat_id,
                        t1.ecat_name,
                        t1.mcat_id,

                        t2.mcat_id,
                        t2.mcat_name,
                        t2.tcat_id,

                        t3.tcat_id,
                        t3.tcat_name

                        FROM tbl_end_category t1
                        JOIN tbl_mid_category t2
                        ON t1.mcat_id = t2.mcat_id
                        JOIN tbl_top_category t3
                        ON t2.tcat_id = t3.tcat_id
                        WHERE t1.ecat_id=?");
$statement->execute(array($ecat_id));
$total = $statement->rowCount();
$result = $statement->fetchAll(PDO::FETCH_ASSOC);                            
foreach ($result as $row) {
    $ecat_name = $row['ecat_name'];
    $mcat_id = $row['mcat_id'];
    $mcat_name = $row['mcat_name'];
    $tcat_id = $row['tcat_id'];
    $tcat_name = $row['tcat_name'];
}


$p_total_view = $p_total_view + 1;

$statement = $pdo->prepare("UPDATE tbl_product SET p_total_view=? WHERE p_id=?");
$statement->execute(array($p_total_view,$_REQUEST['id']));


$statement = $pdo->prepare("SELECT * FROM tbl_product_size WHERE p_id=?");
$statement->execute(array($_REQUEST['id']));
$result = $statement->fetchAll(PDO::FETCH_ASSOC);                            
foreach ($result as $row) {
    $size[] = $row['size_id'];
}

$statement = $pdo->prepare("SELECT * FROM tbl_product_color WHERE p_id=?");
$statement->execute(array($_REQUEST['id']));
$result = $statement->fetchAll(PDO::FETCH_ASSOC);                            
foreach ($result as $row) {
    $color[] = $row['color_id'];
}


if(isset($_POST['form_review'])) {
    
    // $statement = $pdo->prepare("SELECT * FROM tbl_rating WHERE p_id=? AND cust_id=?");
    $statement->execute(array($_REQUEST['id'],$_SESSION['customer']['cust_id']));
    $total = $statement->rowCount();
    
    if($total) {
        $error_message = "You already have given a rating!"; 
    } else {
        // $statement = $pdo->prepare("INSERT INTO tbl_rating (p_id,cust_id,comment,rating) VALUES (?,?,?,?)");
        $statement->execute(array($_REQUEST['id'],$_SESSION['customer']['cust_id'],$_POST['comment'],$_POST['rating']));
        $success_message = "Rating is Submitted Successfully!";    
    }
    
}

// Getting the average rating for this product
$t_rating = 0;
// $statement = $pdo->prepare("SELECT * FROM tbl_rating WHERE p_id=?");
$statement->execute(array($_REQUEST['id']));
$tot_rating = $statement->rowCount();
if($tot_rating == 0) {
    $avg_rating = 0;
} else {
    $result = $statement->fetchAll(PDO::FETCH_ASSOC);                            
    foreach ($result as $row) {
        // $t_rating = $t_rating + $row['rating'];
    }
    $avg_rating = $t_rating / $tot_rating;
}


$statement = $pdo->prepare("SELECT * FROM tbl_product WHERE p_id=?");
	$statement->execute(array($_REQUEST['id']));
	$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
	foreach ($result as $row) {
		$stock = $row['p_qty'];
	}

if(isset($_POST['form_add_to_cart'])) {

	// getting the currect stock of this product
	$statement = $pdo->prepare("SELECT * FROM tbl_product WHERE p_id=?");
	$statement->execute(array($_REQUEST['id']));
	$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
	foreach ($result as $row) {
		$current_p_qty = $row['p_qty'];
	}
	if($_POST['p_qty'] > $current_p_qty):
		$temp_msg = 'Sorry! There are only '.$current_p_qty.' item(s) in stock';
		?>
		<script type="text/javascript">alert('<?php echo $temp_msg; ?>');</script>
		<?php
	else:
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
    else
    {

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
        

        $_SESSION['cart_p_id'][1] = $_REQUEST['id'];
        $_SESSION['cart_size_id'][1] = $size_id;
        $_SESSION['cart_size_name'][1] = $size_name;
        $_SESSION['cart_color_id'][1] = $color_id;
        $_SESSION['cart_color_name'][1] = $color_name;
        $_SESSION['cart_p_qty'][1] = $_POST['p_qty'];
        $_SESSION['cart_p_current_price'][1] = $_POST['p_current_price'];
        $_SESSION['cart_p_name'][1] = $_POST['p_name'];
        $_SESSION['cart_p_featured_photo'][1] = $_POST['p_featured_photo'];

        $success_message1 = 'Product is added to the cart successfully!';
    }
	endif;
}
?>

<?php
if($error_message1 != '') {
    echo "<script>alert('".$error_message1."')</script>";
}
if($success_message1 != '') {
    echo "<script>alert('".$success_message1."')</script>";
    header('location: product.php?id='.$_REQUEST['id']);
}
?>


<div class="page">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
                <!-- <div class="breadcrumb mb_30">
                    <ul>
                        <li><a href="<?php echo BASE_URL; ?>">Home</a></li>
                        <li>></li>
                        
                        <li><a href="<?php echo BASE_URL.'product-category.php?id='.$tcat_id.'&type=top-category' ?>"><?php echo $tcat_name; ?></a></li>
                        <li>></li>
                        <li><a href="<?php echo BASE_URL.'product-category.php?id='.$mcat_id.'&type=mid-category' ?>"><?php echo $mcat_name; ?></a></li>
                        <li>></li>
                        <li><a href="<?php echo BASE_URL.'product-category.php?id='.$ecat_id.'&type=end-category' ?>"><?php echo $ecat_name; ?></a></li>
                        <li>></li>
                        <li><?php echo $p_name; ?></li>
                    </ul>
                </div> -->

				<div class="product">
					<div class="row">
						<div class="col-md-5">
							<ul class="prod-slider">
                                
								
                                <div style="background-image: url(assets/uploads/<?php echo $p_featured_photo; ?>);">
                                    <a class="popup" href="assets/uploads/<?php echo $p_featured_photo; ?>"></a>
                                   </div>
								
                                <?php
                                $statement = $pdo->prepare("SELECT * FROM tbl_product_photo WHERE p_id=?");
                                $statement->execute(array($_REQUEST['id']));
                                $result = $statement->fetchAll(PDO::FETCH_ASSOC);
                                foreach ($result as $row) {
                                    ?>
                                    <li style="background-image: url(assets/uploads/product_photos/<?php echo $row['photo']; ?>);">
                                        <a class="popup" href="assets/uploads/product_photos/<?php echo $row['photo']; ?>"></a>
                                    </li>
                                    <?php
                                }
                                ?>
							</ul>
							<div id="prod-pager">
								<a data-slide-index="0" href=""><div class="prod-pager-thumb" style="background-image: url(assets/uploads/<?php echo $p_featured_photo; ?>"></div></a>
                                <?php
                                $i=1;
                                $statement = $pdo->prepare("SELECT * FROM tbl_product_photo WHERE p_id=?");
                                $statement->execute(array($_REQUEST['id']));
                                $result = $statement->fetchAll(PDO::FETCH_ASSOC);
                                foreach ($result as $row) {
                                    ?>
                                    <a data-slide-index="<?php echo $i; ?>" href=""><div class="prod-pager-thumb" style="background-image: url(assets/uploads/product_photos/<?php echo $row['photo']; ?>"></div></a>
                                    <?php
                                    $i++;
                                }
                                ?>
							</div>
						</div>
						<div class="col-md-7">
							<div class="p-title"><h2><?php echo $p_name; ?></h2></div>
							<div class="p-review">
								<div class="rating">
                                    <?php
                                    if($avg_rating == 0) {
                                        echo '';
                                    }
                                    elseif($avg_rating == 1.5) {
                                        echo '
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        ';
                                    } 
                                    elseif($avg_rating == 2.5) {
                                        echo '
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        ';
                                    }
                                    elseif($avg_rating == 3.5) {
                                        echo '
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        ';
                                    }
                                    elseif($avg_rating == 4.5) {
                                        echo '
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                        ';
                                    }
                                    else {
                                        for($i=1;$i<=5;$i++) {
                                            ?>
                                            <?php if($i>$avg_rating): ?>
                                                <i class="fa fa-star-o"></i>
                                            <?php else: ?>
                                                <i class="fa fa-star"></i>
                                            <?php endif; ?>
                                            <?php
                                        }
                                    }                                    
                                    ?>
                                </div>
							</div>
							<div class="p-short-des">
								<p>
									<?php echo $p_short_description; ?>
								</p>
							</div>
                            <form action="" method="post">
                            <div class="p-quantity">
                                <div class="row">
                                    <?php if(isset($size)): ?>
                                    <div class="col-md-12 mb_20">
                                        <?php echo "Select Size"; ?> <br>
                                        <select name="size_id" class="form-control select2" style="width:auto;">
                                            <?php
                                            $statement = $pdo->prepare("SELECT * FROM tbl_size");
                                            $statement->execute();
                                            $result = $statement->fetchAll(PDO::FETCH_ASSOC);
                                            foreach ($result as $row) {
                                                if(in_array($row['size_id'],$size)) {
                                                    ?>
                                                    <option value="<?php echo $row['size_id']; ?>"><?php echo $row['size_name']; ?></option>
                                                    <?php
                                                }
                                            }
                                            ?>
                                        </select>
                                    </div>
                                    <?php endif; ?>

                                    <?php if(isset($color)): ?>
                                    <div class="col-md-12">
                                        <?php echo "Select Color"; ?> <br>
                                        <select name="color_id" class="form-control select2" style="width:auto;">
                                            <?php
                                            $statement = $pdo->prepare("SELECT * FROM tbl_color");
                                            $statement->execute();
                                            $result = $statement->fetchAll(PDO::FETCH_ASSOC);
                                            foreach ($result as $row) {
                                                if(in_array($row['color_id'],$color)) {
                                                    ?>
                                                    <option value="<?php echo $row['color_id']; ?>"><?php echo $row['color_name']; ?></option>
                                                    <?php
                                                }
                                            }
                                            ?>
                                        </select>
                                    </div>
                                    <?php endif; ?>

                                </div>
                                
                            </div>
							<div class="p-price">
                                <span style="font-size:14px;"><?php echo "Product Price"; ?></span><br>
                                <span>
                                    <?php if($p_old_price!=''): ?>
                                        <del><?php echo "Rs"; ?><?php echo $p_old_price; ?></del>
                                    <?php endif; ?> 
                                        <?php echo "Rs"; ?><?php echo $p_current_price; ?>
                                </span>
                            </div>
                            <input type="hidden" name="p_current_price" value="<?php echo $p_current_price; ?>">
                            <input type="hidden" name="p_name" value="<?php echo $p_name; ?>">
                            <input type="hidden" name="p_featured_photo" value="<?php echo $p_featured_photo; ?>">
							<div class="p-quantity">
                                <?php echo "Quantity"; ?> <br>
								<input type="number" class="input-text qty" step="1" min="1" max="30" name="p_qty" value="1" title="Qty" size="4" pattern="[0-9]*" inputmode="numeric"> <br>
                                Stock: <?php echo $stock; ?>
							</div>
							<div class="btn-cart btn-cart1">
                                <?php
                                if($stock==0){
                                    ?>
                                    <input type="submit" disabled value="<?php echo "Add to Cart"; ?>" class="btn btn-outline-warning">
                                    <?php
                                }
                                else{
                                    ?>
                                    <input type="submit" value="<?php echo "Add to Cart"; ?>" name="form_add_to_cart">
                                    <?php
                                }
                                ?>
							</div>
                            </form>
							<div class="share">
                                <?php echo "Share This Product"; ?> <br>
								<div class="sharethis-inline-share-buttons"></div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation" class="active"><a href="#description" aria-controls="description" role="tab" data-toggle="tab"><?php echo "Product Description"; ?></a></li>
								<li role="presentation"><a href="#feature" aria-controls="feature" role="tab" data-toggle="tab"><?php echo "Features"; ?></a></li>
                                <!-- <li role="presentation"><a href="#condition" aria-controls="condition" role="tab" data-toggle="tab">
                                    <?php 
                                // echo "Conditions";
                                 ?></a></li> -->
                                <li role="presentation"><a href="#return_policy" aria-controls="return_policy" role="tab" data-toggle="tab"><?php echo "Return Policy"; ?></a></li>
                               <!-- <li role="presentation"><a href="#review" aria-controls="review" role="tab" data-toggle="tab"><?php echo "Reviews"; ?></a></li> -->
							</ul>

							<!-- Tab panes -->
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane active" id="description" style="margin-top: -30px;">
									<p>
                                        <?php
                                        if($p_description == '') {
                                            echo "No description found";
                                        } else {
                                            echo $p_description;
                                        }
                                        ?>
									</p>
								</div>
                                <div role="tabpanel" class="tab-pane" id="feature" style="margin-top: -30px;">
                                    <p>
                                        <?php
                                        if($p_feature == '') {
                                            echo "High Quality";
                                        } else {
                                            echo $p_feature;
                                        }
                                        ?>
                                    </p>
                                </div>
                                <!-- <div role="tabpanel" class="tab-pane" id="condition" style="margin-top: -30px;"> -->
                                    <!-- <p> -->
                                        <?php
                                        // if($p_condition == '') {
                                        //     echo "No condition found";
                                        // } else {
                                        //     echo $p_condition;
                                        // }
                                        ?>
                                    <!-- </p>
                                </div> -->
                                <div role="tabpanel" class="tab-pane" id="return_policy" style="margin-top: -30px;">
                                    <p>
                                        <?php
                                        if($p_return_policy == '') {
                                            echo "We accept returns of unworn and unwashed clothing within 3 days of purchase in case of size problem and damaged products.";
                                        } else {
                                            echo $p_return_policy;
                                        }
                                        ?>
                                    </p>
                                </div>
							</div> 
                             
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="product bg-gray pt_70 pb_70">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="headline">
                    <h2><?php echo "Related Products"; ?></h2>
                    <h3><?php echo "See all the related products from below"; ?></h3>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">

                <div class="product-carousel">

                    <?php
                    $statement = $pdo->prepare("SELECT * FROM tbl_product WHERE ecat_id=? AND p_id!=?");
                    $statement->execute(array($ecat_id,$_REQUEST['id']));
                    $result = $statement->fetchAll(PDO::FETCH_ASSOC);
                    foreach ($result as $row) {
                        ?>
                        <div class="item">
                            <div class="thumb">
                                <div class="photo" style="background-image:url(assets/uploads/<?php echo $row['p_featured_photo']; ?>);"></div>
                                <div class="overlay"></div>
                            </div>
                            <div class="text">
                                <h3><a href="product.php?id=<?php echo $row['p_id']; ?>"><?php echo $row['p_name']; ?></a></h3>
                                <h4>
                                    <?php echo "Rs"; ?><?php echo $row['p_current_price']; ?> 
                                    <?php if($row['p_old_price'] != ''): ?>
                                    <del>
                                        <?php echo "Rs"; ?><?php echo $row['p_old_price']; ?>
                                    </del>
                                    <?php endif; ?>
                                </h4>
                                <div class="rating">
                                    <?php
                                    $t_rating = 0;
                                    $statement1 = $pdo->prepare("SELECT * FROM tbl_rating WHERE p_id=?");
                                    // $statement1->execute(array($row['p_id']));
                                    $tot_rating = $statement1->rowCount();
                                    if($tot_rating == 0) {
                                        $avg_rating = 0;
                                    } else {
                                        $result1 = $statement1->fetchAll(PDO::FETCH_ASSOC);
                                        foreach ($result1 as $row1) {
                                            $t_rating = $t_rating + $row1['rating'];
                                        }
                                        $avg_rating = $t_rating / $tot_rating;
                                    }
                                    ?>
                                    <?php
                                    if($avg_rating == 0) {
                                        echo '';
                                    }
                                    elseif($avg_rating == 1.5) {
                                        echo '
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        ';
                                    } 
                                    elseif($avg_rating == 2.5) {
                                        echo '
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        ';
                                    }
                                    elseif($avg_rating == 3.5) {
                                        echo '
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        ';
                                    }
                                    elseif($avg_rating == 4.5) {
                                        echo '
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                        ';
                                    }
                                    else {
                                        for($i=1;$i<=5;$i++) {
                                            ?>
                                            <?php if($i>$avg_rating): ?>
                                                <i class="fa fa-star-o"></i>
                                            <?php else: ?>
                                                <i class="fa fa-star"></i>
                                            <?php endif; ?>
                                            <?php
                                        }
                                    }
                                    ?>
                                </div>
                                <p><a href="product.php?id=<?php echo $row['p_id']; ?>"><?php echo "Add to Cart"; ?></a></p>
                            </div>
                        </div>
                        <?php
                    }
                    ?>

                </div>

            </div>
        </div>
    </div>
</div>



<?php require_once('footer.php'); ?>  
