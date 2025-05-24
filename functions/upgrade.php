<?php
    require_once('session.php');

    $query = mysqli_query($conn,"UPDATE `tb_user` SET `level` = 'reseller' WHERE cuid = '$userID'") or die(mysqli_error());
    header('location:../e_user/');
    exit();
    
?>