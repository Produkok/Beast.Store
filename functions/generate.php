<?php
    require_once('session.php');
    $oldPin = $u['pinTrx'];
    $pinTrx = md5($_POST['pinTrx']);

    if(isset($pinTrx)){
	    if($pinTrx != $oldPin){
	    	header('location:../docs/?notif=1');
		    exit();
	    }
	    else {
	    	$kode_unik = substr(str_shuffle(1234567890),0,3);
	    	$usernya = $u['user'];
	    	$userID = $u['cuid'];
	    	$hitung = strlen($userID);
	    	if($hitung == 1){
	    		$digitnya = '00'.$userID;
	    	}
	    	else if($hitung == 2){
	    		$digitnya = '0'.$userID;
	    	}
	    	else {
	    		$digitnya = $userID;
	    	}
	    	$merchantID = 'T'.$kode_unik.$digitnya;
	    	$apikey = md5(md5($userID.$usernya.$digitnya));
	    	$query = mysqli_query($conn,"UPDATE `tb_user` SET `apikey` = '$apikey', `merchantid` = '$merchantID' WHERE cuid = '$userID'") or die(mysqli_error());
		    header('location:../docs/');
		    exit();
	    }
	}
?>