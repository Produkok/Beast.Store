<?php
    require_once('session.php');
    $username = $u['user'];
    $full_name = mysqli_real_escape_string($conn,$_POST['full_name']);
    $email = mysqli_real_escape_string($conn,$_POST['email']);
    $no_hp = mysqli_real_escape_string($conn,$_POST['no_hp']);

    if($_POST['user'] == $u['user']){
    	$query = mysqli_query($conn,"UPDATE `tb_user` SET `full_name` = '$full_name', `no_hp` = '$no_hp', `email` ='$email' WHERE cuid = '$userID'") or die(mysqli_error());
    }
    header('location:../e_user/?notif=1');
?>