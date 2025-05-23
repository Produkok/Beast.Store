<?php
ob_start();
session_start();
date_default_timezone_set("Asia/Jakarta");
include('../config/koneksi.php');
$ipUser = $_SERVER['REMOTE_ADDR'];

$sql_0 = mysqli_query($conn,"SELECT * FROM `tb_seo` WHERE cuid = 1") or die(mysqli_error());
$s0 = mysqli_fetch_array($sql_0);
$urlweb = $s0['urlweb'];

header('Content-type: application/json');
$request_json = file_get_contents('php://input');
$request_data = json_decode(json_encode($request_json),true);
$data = explode('&',$request_data);

$array = [];
foreach($data as $row){
    $par = explode('=', $row);
    $array[$par[0]] = $par[1];
}
$merchantCode = $array['merchant_code'];
$apiKey = $array['api_key'];
$refID = $array['ref_id'];

$response = array();
$cekPlayer = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE `apikey` = '$apiKey'") or die(mysqli_error());
$cpp = mysqli_num_rows($cekPlayer);
if($cpp == 0){
    $response = array(
    	"status" => 'false',
    	"message" => 'Invalid Api Key'
    );
}
else {
	$cp = mysqli_fetch_array($cekPlayer);
    $ipAddress = $cp['whitelist'];
    if($ipAddress == ''){
        $response = array(
        	"status" => 'false',
        	"message" => 'Invalid Request : Silahkan Whitelist IP : '.$ipUser
        );    
    }
    else {
    	$cekPlayer1 = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE `apikey` = '$apiKey' AND `whitelist` LIKE '%$ipUser%'") or die(mysqli_error());
        $cpp1 = mysqli_num_rows($cekPlayer1);
        if($cpp1 == 0){
            $response = array(
            	"status" => 'false',
            	"message" => 'Invalid Request : Silahkan Whitelist IP : '.$ipUser
            );    
        }
        else {
        	$cektrx = mysqli_query($conn,"SELECT * FROM `tb_order` WHERE `kd_transaksi` = '$refID'") or die(mysqli_error());
            $ctt = mysqli_num_rows($cektrx);
            if($ctt == 0){
            	$response = array(
	            	"status" => 'false',
	            	"message" => 'Transaksi Tidak Ditemukan'
	            );
            }
            else {
            	$ct = mysqli_fetch_array($cektrx);
            	if($ct['status'] == 0){
            		$status = 'Pending';
            	}
            	else if($ct['status'] == 1){
            		$status = 'On Proccess';
            	}
            	else if($ct['status'] == 2){
            		$status = 'Success';
            	}
            	else if($ct['status'] == 3){
            		$status = 'Failed';
            	}
            	$datae = array(
            		"trxid" => $ct['kd_transaksi'],
            		"data" => $ct['userID'].$ct['zoneID'],
                    "code" => $ct['produkID'],
                    "service" => $ct['services'],
                    "status" => $status,
                    "note" => $ct['note'],
                    "price" => $ct['userID']
            	);
            	$response = array(
	            	"status" => 'true',
	            	"data" => $datae
	            );
            }
        }
    }
}
json_encode($response);
echo json_encode($response);
?>