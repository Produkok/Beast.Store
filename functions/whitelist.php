<?php
    require_once('session.php');

    if(isset($_POST['ip_server'])){
    	$userID = $u['cuid'];
    	$ipServer = $_POST['ip_server'];
	    $query = mysqli_query($conn,"UPDATE `tb_user` SET `whitelist` = '$ipServer' WHERE cuid = '$userID'") or die(mysqli_error());
		header('location:../docs/');
		exit();
	}
?>