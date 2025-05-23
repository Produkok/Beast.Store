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
$parent = $array['jenis'];

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
            if($parent == 1 || $parent == 2){
                $getKategori = mysqli_query($conn,"SELECT * FROM `tb_produk` WHERE `product_type` = '$parent' ORDER BY cuid ASC");
                $datae = array();
                while($gk = mysqli_fetch_array($getKategori)){
                    $datae[] = array(
                        "kategori" => $gk['kategori'],
                        "kode_produk" => $gk['code'],
                        "nama_produk" => $gk['title'],
                        "harga" => $gk['harga_h2h'],
                        "status" => $gk['status']
                    );  
                }
            }
            else if($parent == 3 || $parent == 4){
                $getKategori = mysqli_query($conn,"SELECT * FROM `tb_prepaid` WHERE `product_type` = '$parent' ORDER BY cuid ASC");
                $datae = array();
                while($gk = mysqli_fetch_array($getKategori)){
                    $datae[] = array(
                        "kategori" => $gk['brand'],
                        "subkategori" => $gk['kategori'],
                        "kode_produk" => $gk['code'],
                        "nama_produk" => $gk['title'],
                        "harga" => $gk['harga_h2h'],
                        "status" => $gk['status']
                    );  
                }
            }
            else if($parent == 5){
                $datae = array('Produk Tidak Tersedia');
            }
            else if($parent == 7){
                $getKategori = mysqli_query($conn,"SELECT * FROM `tb_pascabayar` ORDER BY cuid ASC");
                $datae = array();
                while($gk = mysqli_fetch_array($getKategori)){
                    $datae[] = array(
                        "kategori" => $gk['kategori'],
                        "kode_produk" => $gk['code'],
                        "nama_produk" => $gk['title'],
                        "status" => $gk['status']
                    );  
                }
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