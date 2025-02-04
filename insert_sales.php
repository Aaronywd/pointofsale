<?php 
include 'server/connection.php';

if(isset($_POST['product'])){
    $user = $_SESSION['username'];
    $discount = floatval($_POST['discount']);
    $total = floatval($_POST['totalvalue']);
    $price = $_POST['price'];
    $product = $_POST['product'];
    $customer = $_POST['customer'];
    $quantity = $_POST['quantity'];
    $reciept = array();
    
    $query = '';
    
    // Sanitize customer name and get customer ID
    $customer = mysqli_real_escape_string($db, $customer);
    $customer_id = mysqli_query($db, "SELECT customer_id, firstname, lastname FROM customer WHERE CONCAT(firstname,' ',lastname) LIKE '$customer'");

    if(mysqli_num_rows($customer_id) == 0){
        echo "failure";
        exit;
    }

    $cust_id = mysqli_fetch_array($customer_id);
    $cust_id_new = $cust_id['customer_id'];
    $customer_name = $cust_id['firstname'] . ' ' . $cust_id['lastname'];

    // Start transaction
    mysqli_begin_transaction($db);
    
    try {
        // Insert main sales record
        $sql = "INSERT INTO sales(customer_id, username, discount, total) VALUES(?, ?, ?, ?)";
        $stmt = mysqli_prepare($db, $sql);
        mysqli_stmt_bind_param($stmt, "isdd", $cust_id_new, $user, $discount, $total);
        
        if (!mysqli_stmt_execute($stmt)) {
            throw new Exception("Failed to insert sale");
        }

        // Get the receipt number
        $reciept_no = mysqli_insert_id($db);
        
        // Process each product
        for($num = 0; $num < count($product); $num++){
            $product_id = mysqli_real_escape_string($db, $product[$num]);
            $qty_sold = intval($quantity[$num]);
            $price_item = floatval($price[$num]);

            // Get product name for logging
            $product_query = mysqli_query($db, "SELECT product_name FROM products WHERE product_no = '$product_id'");
            $product_data = mysqli_fetch_array($product_query);
            
            // Update product quantity
            $sql = "UPDATE products SET quantity = quantity - ? WHERE product_no = ? AND quantity >= ?";
            $stmt = mysqli_prepare($db, $sql);
            mysqli_stmt_bind_param($stmt, "isi", $qty_sold, $product_id, $qty_sold);
            
            if (!mysqli_stmt_execute($stmt)) {
                throw new Exception("Insufficient stock for product: " . $product_id);
            }

            // Insert sales product record
            $sql = "INSERT INTO sales_product(reciept_no, product_id, price, qty) VALUES(?, ?, ?, ?)";
            $stmt = mysqli_prepare($db, $sql);
            mysqli_stmt_bind_param($stmt, "isdi", $reciept_no, $product_id, $price_item, $qty_sold);
            
            if (!mysqli_stmt_execute($stmt)) {
                throw new Exception("Failed to record sale item");
            }

            // Log each product sale
            $sql = "INSERT INTO logs (username, purpose) VALUES(?, ?)";
            $stmt = mysqli_prepare($db, $sql);
            $purpose = "Sold " . $qty_sold . " " . $product_data['product_name'] . " to " . $customer_name;
            mysqli_stmt_bind_param($stmt, "ss", $user, $purpose);
            mysqli_stmt_execute($stmt);
        }

        // Log the total sale
        $sql = "INSERT INTO logs (username, purpose) VALUES(?, ?)";
        $stmt = mysqli_prepare($db, $sql);
        $purpose = "Sales completed - Receipt #" . $reciept_no . " - Total: ₱" . number_format($total, 2);
        mysqli_stmt_bind_param($stmt, "ss", $user, $purpose);
        mysqli_stmt_execute($stmt);

        // Commit transaction
        mysqli_commit($db);
        echo "success";
        
    } catch (Exception $e) {
        mysqli_rollback($db);
        echo "failure";
    }
}
?>