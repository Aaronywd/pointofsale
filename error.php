<?php
if (isset($_SESSION['error'])) {
    echo '<script>swal("Error","'.$_SESSION['error'].'","error");</script>';
    unset($_SESSION['error']);
}
?>