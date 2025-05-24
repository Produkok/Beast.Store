<?php
    require_once('session.php');
    $pass = $u['pass'];
    $oldointerx = $u['pinTrx'];
    $password = mysqli_real_escape_string($conn,$_POST['pass']);
    $pinTrx = md5($_POST['pinTrx']);
    $old_pinTrx = md5($_POST['old_pinTrx']);

    if(password_verify($password,$pass)){
        if($old_pinTrx == $oldointerx){
            $query = mysqli_query($conn,"UPDATE `tb_user` SET `pinTrx` = '$pinTrx' WHERE cuid = '$userID'") or die(mysqli_error());
            header('location:../e_user/?notif=2');
            exit();
        }
        else {
            header('location:../e_user/?notif=7');
            exit();
        }
    }
    else {
        header('location:../e_user/?notif=4');
        exit();
    } 
    
?>