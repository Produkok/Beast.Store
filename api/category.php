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

$apiKey = $array['api_key'];

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
            $getKategori = mysqli_query($conn,"SELECT * FROM `tb_kategori` WHERE `parent` NOT IN(5,7) ORDER BY kategori ASC");
            $datae = array();
            while($gk = mysqli_fetch_array($getKategori)){
                $datae[] = array(
                    "kategori" => $gk['kategori'],
                    "image" => $urlweb.'/upload/'.$gk['image'],
                    "type" => $gk['parent']
                );  
            }
            $response = array(
            	"status" => 'true',
            	"data" => $datae
            );
        }
    }
}
json_encode($response);
echo json_encode($response);
?>