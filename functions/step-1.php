<?php
ob_start();
session_start();
include('../config/koneksi.php');
include('../classes/class.phpmailer.php');
$sql_0 = mysqli_query($conn,"SELECT * FROM `tb_seo` WHERE cuid = 1") or die(mysqli_error());
$s0 = mysqli_fetch_array($sql_0);
$urlweb = $s0['urlweb'];
$token = session_id();
$full_name = mysqli_real_escape_string($conn,$_POST['full_name']);
$no_hp = mysqli_real_escape_string($conn,$_POST['no_hp']);
$usera = mysqli_real_escape_string($conn,$_POST['user']);
$usere = strtolower($usera);
$user = str_replace(' ','',$usere);
$email = mysqli_real_escape_string($conn,$_POST['email']);
$no_hp = mysqli_real_escape_string($conn,$_POST['no_hp']);
$passe = mysqli_real_escape_string($conn,$_POST['pass']);
$pass = password_hash($passe,PASSWORD_DEFAULT);
$pinTrx = md5($_POST['pinTrx']);
$level = 'user';
$join_date = date('Y-m-d H:i:s');

$cekemail = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE user = '$user' OR email = '$email'") or die (mysqli_error());
$q = mysqli_num_rows($cekemail);
if($q > 0){
    header('location:../register/?error=2');
}
else {
	if($_POST['upline'] == ''){
		$uplineID = 1;
	}
	else {
		$upline = $_POST['upline'];
		$cekUpline = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE user = '$upline'") or die (mysqli_error());
		$cu = mysqli_num_rows($cekUpline);
		if($cu == 0){
			$uplineID = 1;
		}
		else {
			$cuu = mysqli_fetch_array($cekUpline);
			$uplineID = $cuu['cuid'];
		}
	}
	
	

    $query = mysqli_query($conn,"INSERT INTO `tb_user` (`user`, `pass`, `token_id`, `image`, `full_name`, `email`, `no_hp`, `level`, `pinTrx`, `reff`, `uplineID`, `poin`, `apikey`, `merchantid`, `whitelist`, `join_date`, `last_login`, `status`) VALUES ('$user', '$pass', '0', 'avatar5.png', '$full_name', '$email', '$no_hp', 'user', '$pinTrx', 0, '$uplineID', 0, '', '', '', '$join_date', '$join_date', 1)") or die(mysqli_error());
    $last_id = mysqli_insert_id($conn);
    $query2 = mysqli_query($conn,"INSERT INTO `tb_balance` (`userID`, `active`, `pending`, `payout`, `created_date`) VALUES ('$last_id', 0, 0, 0, '$join_date')") or die(mysqli_error());
    $update = mysqli_query($conn,"UPDATE `tb_user` SET reff = reff + 1 WHERE cuid = '$uplineID'") or die(mysqli_error());
    
    header('location:../login/?notif=5');
	
}
?>