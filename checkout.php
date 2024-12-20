<?php require_once ('header.php'); ?>

<?php
$statement = $pdo->prepare("SELECT * FROM tbl_settings WHERE id=1");
$statement->execute();
$result = $statement->fetchAll(PDO::FETCH_ASSOC);
foreach ($result as $row) {
    $banner_checkout = $row['banner_checkout'];
}
?>

<?php
if (!isset($_SESSION['cart_p_id'])) {
    header('location: cart.php');
    exit;
}
?>

<div class="page-banner" style="background-image: url(assets/uploads/<?php echo $banner_checkout; ?>)">
    <div class="overlay"></div>
    <div class="page-banner-inner">
        <h1><?php echo "Checkout"; ?></h1>
    </div>
</div>

<div class="page">
    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <?php if (!isset($_SESSION['customer'])): ?>
                    <p>
                        <a href="login.php"
                            class="btn btn-md btn-danger"><?php echo "Please login as customer to checkout"; ?></a>
                    </p>
                <?php else: ?>

                    <h3 class="special"><?php echo "Order Details"; ?></h3>
                    <div class="cart">
                        <table class="table table-responsive table-hover table-bordered">
                            <tr>
                                <th><?php echo "SN" ?></th>
                                <th><?php echo "Photo"; ?></th>
                                <th><?php echo "Product Name"; ?></th>
                                <th><?php echo "Size"; ?></th>
                                <th><?php echo "Color"; ?></th>
                                <th><?php echo "Price"; ?></th>
                                <th><?php echo "Quantity"; ?></th>
                                <th class="text-right"><?php echo "Total"; ?></th>
                            </tr>
                            <?php
                            $table_total_price = 0;

                            $i = 0;
                            foreach ($_SESSION['cart_p_id'] as $key => $value) {
                                $i++;
                                $arr_cart_p_id[$i] = $value;
                            }

                            $i = 0;
                            foreach ($_SESSION['cart_size_id'] as $key => $value) {
                                $i++;
                                $arr_cart_size_id[$i] = $value;
                            }

                            $i = 0;
                            foreach ($_SESSION['cart_size_name'] as $key => $value) {
                                $i++;
                                $arr_cart_size_name[$i] = $value;
                            }

                            $i = 0;
                            foreach ($_SESSION['cart_color_id'] as $key => $value) {
                                $i++;
                                $arr_cart_color_id[$i] = $value;
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
                            foreach ($_SESSION['cart_p_name'] as $key => $value) {
                                $i++;
                                $arr_cart_p_name[$i] = $value;
                            }

                            $i = 0;
                            foreach ($_SESSION['cart_p_featured_photo'] as $key => $value) {
                                $i++;
                                $arr_cart_p_featured_photo[$i] = $value;
                            }
                            ?>
                            <?php for ($i = 1; $i <= count($arr_cart_p_id); $i++): ?>
                                <tr>
                                    <td><?php echo $i; ?></td>
                                    <td>
                                        <img src="assets/uploads/<?php echo $arr_cart_p_featured_photo[$i]; ?>" alt="">
                                    </td>
                                    <td><?php echo $arr_cart_p_name[$i]; ?></td>
                                    <td><?php echo $arr_cart_size_name[$i]; ?></td>
                                    <td><?php echo $arr_cart_color_name[$i]; ?></td>
                                    <td><?php echo "Rs "; ?><?php echo $arr_cart_p_current_price[$i]; ?></td>
                                    <td><?php echo $arr_cart_p_qty[$i]; ?></td>
                                    <td class="text-right">
                                        <?php
                                        $row_total_price = $arr_cart_p_current_price[$i] * $arr_cart_p_qty[$i];
                                        $table_total_price = $table_total_price + $row_total_price;
                                        ?>
                                        <?php echo "Rs "; ?>
                                        <?php echo $row_total_price; ?>
                                    </td>
                                </tr>
                            <?php endfor; ?>
                            <tr>
                                <th colspan="7" class="total-text"><?php echo "Sub Total"; ?></th>
                                <th class="total-amount"><?php echo "Rs "; ?><?php echo $table_total_price; ?></th>
                                
                            </tr>
                            <?php
                            $statement = $pdo->prepare("SELECT * FROM tbl_delivery_cost");
                            // $statement->execute(array($_SESSION['customer']['cust_country']));
                            // $total = $statement->rowCount();
                            // if ($total) {
                            //     $result = $statement->fetchAll(PDO::FETCH_ASSOC);
                            //     foreach ($result as $row) {
                            //         $delivery_cost = $row['amount'];
                            //     }
                            // } else {
                            $statement = $pdo->prepare("SELECT * FROM tbl_delivery_cost_all WHERE sca_id=1");
                            $statement->execute();
                            $result = $statement->fetchAll(PDO::FETCH_ASSOC);
                            foreach ($result as $row) {
                                $delivery_cost = $row['amount'];
                            }
                            // }
                            ?>
                            <tr>
                                <td colspan="7" class="total-text"><?php echo "Delivery Cost"; ?></td>
                                <td class="total-amount"><?php echo "Rs "; ?><?php echo $delivery_cost; ?></td>
                            </tr>
                            <tr>
                                <th colspan="7" class="total-text"><?php echo "Total"; ?></th>
                                <th class="total-amount">
                                    <?php
                                    $final_total = $table_total_price + $delivery_cost;
                                    ?>
                                    <?php echo "Rs "; ?>     <?php echo $final_total; ?>
                                </th>
                            </tr>
                        </table>
                    </div>



                    <div class="billing-address">
                        <div class="row">
                            <div class="col-md-6">
                                <h3 class="special"><?php echo "Delivery Address"; ?></h3>
                                <table class="table table-responsive table-bordered table-hover table-striped bill-address">
                                    <tr>
                                        <td><?php echo "Full Name"; ?></td>
                                        <td><?php echo $_SESSION['customer']['cust_d_name']; ?></p>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td><?php echo "Phone Number"; ?></td>
                                        <td><?php echo $_SESSION['customer']['cust_d_phone']; ?></td>
                                    </tr>

                                    <tr>
                                        <td><?php echo "Address"; ?></td>
                                        <td>
                                            <?php echo nl2br($_SESSION['customer']['cust_d_address']); ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><?php echo "City"; ?></td>
                                        <td><?php echo $_SESSION['customer']['cust_d_city']; ?></td>
                                    </tr>
                                    <tr>
                                        <td><?php echo "State"; ?></td>
                                        <td><?php echo $_SESSION['customer']['cust_d_state']; ?></td>
                                    </tr>
                                    <tr>
                                        <td><?php echo "Zip Code"; ?></td>
                                        <td><?php echo $_SESSION['customer']['cust_d_zip']; ?></td>
                                    </tr>
                                </table>
                            </div>

                        </div>
                    </div>



                    <div class="cart-buttons">
                        <ul>
                            <li><a href="cart.php" class="btn btn-primary"><?php echo "Back to Cart"; ?></a></li>
                        </ul>
                    </div>

                    <div class="clear"></div>
                    <h3 class="special"><?php echo "Payment Section"; ?></h3>
                    <div class="row">

                        <?php
                        $checkout_access = 1;
                        if (
                            ($_SESSION['customer']['cust_d_name'] == '') ||
                            ($_SESSION['customer']['cust_d_phone'] == '') ||
                            ($_SESSION['customer']['cust_d_address'] == '') ||
                            ($_SESSION['customer']['cust_d_city'] == '') ||
                            ($_SESSION['customer']['cust_d_state'] == '') ||
                            ($_SESSION['customer']['cust_d_zip'] == '')
                        ) {
                            $checkout_access = 0;
                        }
                        ?>
                        <?php if ($checkout_access == 0): ?>
                            <div class="col-md-12">
                                <div style="color:red;font-size:22px;margin-bottom:50px;">
                                    You must have to fill up all the delivery information in order to checkout the order.
                                    Please fill up the information going to <a href="customer-delivery-update.php"
                                        style="color:red;text-decoration:underline;">this link</a>.
                                </div>
                            </div>
                        <?php else: ?>
                            <div class="col-md-4">

                                <div class="row">

                                    <div class="col-md-12 form-group">
                                        <label for=""><?php echo "Select Payment Method"; ?> *</label>
                                        <select name="payment_method" class="form-control" id="advFieldsStatus">
                                            <option value=""><?php echo "Select a method"; ?></option>
                                            <option value="debitcard"><?php echo "Debit Card"; ?></option>
                                            <option value="BankDeposit"><?php echo "Bank Deposit"; ?></option>
                                            <option value="Khalti"><?php echo "Khalti"; ?></option>
                                            <option value="COD"><?php echo "Cash on Delivery"; ?></option>
                                        </select>
                                    </div>

                                    <form class="debit_form" action="payment/bank/debitcard.php" method="post" id="debit_form"
                                        style="display:none; ">
                                        <div class="form-class" style="margin-bottom: 10px;">
                                            <label style="margin-right: 10px;">Card Holder Name * : </label> 
                                            <input type="text"  style="font-family: inherit;
  font-size: inherit;
  line-height: 3.5rem;
  margin-bottom: 5px;
  width: 178px;" id="textInput" name="card_holder_name"
                                                placeholder="Card holder name " required>
                                        </div>
                                        <div class="form-class" style="margin-bottom: 10px;">
                                        <label style="margin-right: 41px;">Card Number * : </label>
                                        <input style="font-family: inherit;
  font-size: inherit;
  line-height: 3.5rem;
  margin-bottom: 5px;
  width: 180px;" type="text"  name="card_number"
                                            placeholder="XXXX XXXX XXXX XXXX" id="numberInput" oninput="formatNumberInput(event)" onkeydown="restrictToNumbers(event)" maxlength="19" required>
                                        </div>
                                        <div class="form-class" style="margin-bottom: 10px;">
                                        <label style="margin-right: 100px;">CVV * : </label>
                                        <input  style="font-family: inherit;
  font-size: inherit;
  line-height: 3.5rem;
  margin-bottom: 5px;
  width: 177px;" type="password" name="card_cvv" id="cvv" placeholder="XXX "
                                            maxlength="3" required>
                                        </div>
                                        <div class="form-class" style="margin-bottom: 10px;">    
                                        <label style="margin-right: 56px;"> Expiry Date * :</label>
                                        <input  style="font-family: inherit;
  font-size: inherit;
  line-height: 3.5rem;
  margin-bottom: 5px;
  width: 177px;" type="month" id="expiryDate" name="card_expiry"
                                            placeholder="Enter expiry date " required> <br>
                                        </div>
                                        <input type="hidden" name="amount" value="<?php echo $final_total; ?>">

                                        <div class="col-md-12 form-group">
                                            <input type="submit" class="btn btn-info mt-3 p-2" value="<?php echo "Pay Now"; ?>"
                                                name="form1">
                                        </div>
                                    </form>



                                    <form action="payment/bank/init.php" method="post" id="bank_form" style="display:block;">

                                        <input type="hidden" name="amount" value="<?php echo $final_total; ?>">

                                        <div class="col-md-12 form-group">
                                            <label for=""><?php echo "Send to this Details"; ?></span></label><br>
                                            <?php
                                            $statement = $pdo->prepare("SELECT * FROM tbl_settings WHERE id=1");
                                            $statement->execute();
                                            $result = $statement->fetchAll(PDO::FETCH_ASSOC);
                                            foreach ($result as $row) {
                                                echo nl2br($row['bank_detail']);
                                            }
                                            ?>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <label for=""><?php echo "Transaction Information"; ?> <br><span
                                                    style="font-size:12px;font-weight:normal;">(<?php echo "Include transaction id and other information correctly"; ?>)</span></label>
                                            <textarea name="transaction_info" class="form-control" cols="30"
                                                rows="10"></textarea>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <input type="submit" class="btn btn-info" value="<?php echo "Pay Now"; ?>"
                                                name="form3">
                                        </div>
                                    </form>

                                    <form class="debit_form" action="payment/khalti.php" method="post" id="khalti"
                                        style="display:none; ">
                                        
                                        <div class="col-md-12 form-group">
                                            <input type="hidden" name="table_total" value="<?php echo $final_total; ?>" >
                                            <input type="submit" class="btn btn-info mt-3 p-2" value="<?php echo "Pay Now"; ?>"
                                                name="form2">
                                        </div>
                                    </form>

                                    
                                    <form class="debit_form" action="payment/cod.php" method="post" id="cod"
                                        style="display:none; ">
                                        
                                        <div class="col-md-12 form-group">
                                            <input type="hidden" name="table_total" value="<?php echo $final_total; ?>" >
                                            <input type="submit" class="btn btn-info mt-3 p-2" value="<?php echo "Pay Now"; ?>"
                                                name="form4">
                                        </div>
                                    </form>



                                </div>


                            </div>
                        <?php endif; ?>

                    </div>


                <?php endif; ?>

            </div>
        </div>
    </div>
</div>


<?php require_once ('footer.php'); ?>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const selectElement = document.getElementById('advFieldsStatus');
        const formElement = document.getElementById('debit_form');
        const bankform = document.getElementById('bank_form');
        const khalti = document.getElementById('khalti');
        const cod = document.getElementById('cod');


        selectElement.addEventListener('change', function () {
            if (selectElement.value === 'debitcard') {
                formElement.style.display = 'block';
                // bankform.style.display = 'none';
                // khalti.style.display = 'none';
            } else if (selectElement.value === 'BankDeposit'){
                // formElement.style.display = 'none';
                bankform.style.display = 'block';
                // khalti.style.display = 'none';
            }
            else if (selectElement.value === 'COD'){
                // formElement.style.display = 'none';
                cod.style.display = 'block';
                // khalti.style.display = 'none';
            }
            else {
                // formElement.style.display = 'none';
                // bankform.style.display = 'none';
                khalti.style.display = 'block';
            }
        });
    });
   // Disable current and previous months
   var currentDate = new Date();
    var nextMonth = currentDate.getMonth() + 1; // JavaScript months are 0-11
    var year = currentDate.getFullYear();
    if (nextMonth > 11) {
        nextMonth = 0;
        year += 1;
    }
    var formattedDate = new Date(year, nextMonth, 1).toISOString().slice(0, 7);
    // Set the min attribute of the input to the first day of the next month
    document.getElementById("expiryDate").setAttribute("min", formattedDate);



    document.querySelectorAll('input[type="number"]').forEach(function (input) {
        input.addEventListener('keydown', function (e) {
            // Prevent minus sign from being entered
            if (e.key === '-' || e.key === 'Subtract') {
                e.preventDefault();
            }
        });
    });

    document.querySelectorAll('input[type="text"]').forEach(function (input) {
        input.addEventListener('keydown', function (e) {
            // Prevent minus sign from being entered
            if (e.key === '-' || e.key === 'Subtract') {
                e.preventDefault();
            }
        });
    });

    document.querySelectorAll('input[type="password"]').forEach(function (input) {
        input.addEventListener('keydown', function (e) {
            // Prevent minus sign from being entered
            if (e.key === '-' || e.key === 'Subtract') {
                e.preventDefault();
            }
        });
    });


    document.querySelectorAll('input[type="number"]').forEach(function (input) {
        input.addEventListener('input', function () {
            if (this.value.length > 20) {
                this.value = this.value.slice(0, 20);
            }
        });
});

    document.getElementById('cvv').addEventListener('input', function (event) {
        // Use a regular expression to remove non-numeric characters
        this.value = this.value.replace(/\D/g, '');
    });
    document.getElementById('textInput').addEventListener('input', function() {
            const textInput = document.getElementById('textInput');
            const error = document.getElementById('error');
            const regex = /^[a-zA-Z]*$/;

            // Validate input against regex
            if (!regex.test(textInput.value)) {
                error.style.display = 'inline';
                textInput.value = textInput.value.replace(/[^a-zA-Z]/g, '');
            } else {
                error.style.display = 'none';
            }
        });

        document.getElementById('debit_form').addEventListener('submit', function(event) {
            const textInput = document.getElementById('textInput');
            const error = document.getElementById('error');
            const regex = /^[a-zA-Z]*$/;

            // Validate input again on form submission
            if (!regex.test(textInput.value)) {
                error.style.display = 'inline';
                event.preventDefault(); // Prevent form submission
            } else {
                error.style.display = 'none';
            }
        });

        function formatNumberInput(event) {
            const inputField = event.target;
            const cursorPosition = inputField.selectionStart;
            let value = inputField.value.replace(/\D+/g, ''); // Remove non-digit characters

            // Add space after every 4 digits
            let formattedValue = '';
            for (let i = 0; i < value.length; i++) {
                if (i > 0 && i % 4 === 0) {
                    formattedValue += ' ';
                }
                formattedValue += value[i];
            }

            // Determine the new cursor position
            const oldLength = inputField.value.length;
            const newLength = formattedValue.length;
            const spacesBeforeCursor = (inputField.value.slice(0, cursorPosition).match(/ /g) || []).length;
            const newCursorPosition = cursorPosition + (newLength - oldLength) + (formattedValue.slice(0, cursorPosition + (newLength - oldLength)).match(/ /g) || []).length - spacesBeforeCursor;

            // Update the input field value and cursor position
            inputField.value = formattedValue;
            inputField.selectionStart = inputField.selectionEnd = newCursorPosition;
        }

        function restrictToNumbers(event) {
            const key = event.key;
            if (!/[0-9]/.test(key) && key !== 'Backspace' && key !== 'Delete' && key !== 'ArrowLeft' && key !== 'ArrowRight' && key !== 'Tab') {
                event.preventDefault();
            }
        }
</script>