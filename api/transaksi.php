<?php
ob_start();
session_start();
date_default_timezone_set("Asia/Jakarta");
include('../config/koneksi.php');
$ipUser = $_SERVER['REMOTE_ADDR'];
$sids = session_id();
$ceksession = mysqli_query($conn,"SELECT * FROM `tb_order` WHERE id_session = '$sids'") or die(mysqli_error());
$cs = mysqli_num_rows($ceksession);
if($cs == 0){
    $sid = session_id();
}
else{
    session_regenerate_id();
    $sid = session_id();
}

$created_date = date('Y-m-d H:i:s');

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
$produkCode = $array['kode_produk'];
$userID = $array['tujuan'];
if($array['server_id'] == ''){
    $zone_id = '';
}
else {
    $zone_id = $array['server_id'];
}
$nickname = '';

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
	$email = $cp['email'];
    $full_name = $cp['full_name'];
    $explode = explode(' ',$full_name);
    $noHp = $cp['no_hp'];
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
            $user_id = $cp['cuid'];
            $cekBalance = mysqli_query($conn,"SELECT * FROM `tb_balance` WHERE userID = '$user_id'") or die(mysqli_error());
            $cb = mysqli_fetch_array($cekBalance);
        	$cekProdukGame = mysqli_query($conn,"SELECT * FROM `tb_produk` WHERE `code` = '$produkCode'") or die(mysqli_error());
        	$cppg = mysqli_num_rows($cekProdukGame);
        	if($cppg == 0){
        	    $cekProdukEmoney = mysqli_query($conn,"SELECT * FROM `tb_prepaid` WHERE `code` = '$produkCode'") or die(mysqli_error());
        	    $cppe = mysqli_num_rows($cekProdukEmoney);
        	    if($cppe == 0){
        	        $response = array(
                    	"status" => 'false',
                    	"message" => 'Produk Tidak Tersedia'
                    );    
        	    }
        	    else {
        	        $cpe = mysqli_fetch_array($cekProdukEmoney);
            	    $productID = $cpe['cuid'];
            	    $productCategory = $cpe['kategori'];
                    $productTitle = $cpe['title'];
                    $jenisnya = $cpe['jenis'];
                    $productType = $cpe['product_type'];
                    $hargaModal = $cpe['harga_modal'];
                    $hargaJual = $cpe['harga_h2h'];
                    $komisinya = $cpe['komisi'];
                    $poinnya = $cpe['poin'];
                    $qty = 1;
                    
                    $getkategori = mysqli_query($conn,"SELECT * FROM `tb_kategori` WHERE kategori = '$productCategory'") or die(mysqli_error());
                    $gk = mysqli_fetch_array($getkategori);
                    $parentType = $gk['parent'];
                    
                    $potongan = 0;
                    $profit = $hargaJual - $hargaModal;
                    $totalProfit = $profit * $qty;
                    $subtotal = $hargaJual - $potongan;
                    
                    if($cb['active'] > $subtotal){
                        $insert = mysqli_query($conn,"INSERT INTO `tb_order` (`id_session`, `kd_transaksi`, `produkID`, `qty`, `harga_modal`, `harga_jual`, `harga`, `kode_unik`, `potongan`, `tukar_poin`, `sub_total`, `total_profit`, `voucher`, `komisi`, `poin`, `kategori`, `title`, `userID`, `zoneID`, `nickname`, `trxID`, `services`, `status_order`, `note`, `full_name`, `email`, `no_hp`, `metode`, `created_date`, `providerID`, `jenis`, `ipaddress`, `id_user`, `status`) VALUES ('$sid', '$refID', '$produkID', '$qty', '$hargaModal', '$hargaJual', '$subtotal', '0', '0', '0', '$subtotal', '$totalProfit', '', '$komisinya', '$poinnya', '$productCategory', '$productTitle', '$userID', '$zone_id', '$nickname', '', '$productCode', '', '', '$full_name', '$email', '$noHp', '999', '$created_date', '$jenisnya', '$parentType', '$ipAddress', '$user_id', 1)") or die(mysqli_error($conn));
                        $update2 = mysqli_query($conn,"UPDATE `tb_balance` SET active = active - '$subtotal', pending = pending + '$subtotal' WHERE userID = '$user_id'") or die(mysqli_error());    
                        $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$refID','$created_date','Pembelian Produk $productTitle','$subtotal',0,'Pembelian Produk $productTitle', '$jenisnya','$parentType','999','$user_id',1)") or die(mysqli_error());
                        
                        if($jenisnya == 4){
                            $sql_4 = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 4") or die(mysqli_error());
                            $s4 = mysqli_fetch_array($sql_4);
                            $apiKeys = $s4['api_key'];
                            $merchantCodes = $s4['merchant_code'];
                            $signe = $merchantCodes.$apiKeys;
                            $urlRequest = $s4['urlRequest'];
                            $sign = md5($signe);
                            
                            $curl1 = curl_init();
                                                        
                            curl_setopt_array($curl1, array(
                                CURLOPT_URL => $urlRequest.'/prepaid',
                                CURLOPT_RETURNTRANSFER => true,
                                CURLOPT_ENCODING => '',
                                CURLOPT_MAXREDIRS => 10,
                                CURLOPT_TIMEOUT => 0,
                                CURLOPT_FOLLOWLOCATION => true,
                                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                                CURLOPT_CUSTOMREQUEST => 'POST',
                                CURLOPT_POSTFIELDS => array('key' => $apiKeys, 'sign' => $sign, 'type' => 'order', 'service' => $produkCode, 'data_no' => $tujuan),
                            ));
                                                        
                            $response1 = curl_exec($curl1);
                                                        
                            curl_close($curl1);
                            $hasil = json_decode($response1, true);
                            $orderid = $hasil['data']['trxid'];
                            $order_status = $hasil['data']['status'];
                            
                            if($hasil['result'] == true){
                                $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `trxID` = '$orderid', status_order = '$order_status' WHERE kd_transaksi = '$refID'") or die(mysqli_error($conn));
                                $datae = array(
                            		"trxid" => $refID,
                            		"data" => $tujuan.$zone_id,
                                    "code" => $produkCode,
                                    "service" => $productTitle,
                                    "status" => 'Pending',
                                    "note" => ''
                            	);
                            }
                            else {
                                $message = $hasil['message'];
                                $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$refID','$created_date','Pengembalian Dana','$subtotal',0,'Pengembalian Dana', '$jenisnya','3','999','$user_id',1)") or die(mysqli_error($conn));
                                $update1 = mysqli_query($conn,"UPDATE `tb_balance` SET `active` = active + '$subtotal', `pending` = pending - '$subtotal' WHERE userID = '$user_id'") or die(mysqli_error($conn));
                                $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `status` = 3, `note` = '$message' WHERE kd_transaksi = '$refID'") or die(mysqli_error($conn));
                                $datae = array(
                            		"trxid" => $refID,
                            		"data" => $tujuan.$zone_id,
                                    "code" => $produkCode,
                                    "service" => $productTitle,
                                    "status" => 'Failed',
                                    "note" => $message
                            	);
                            }
                        }
                        else if($jenisnya == 5){
                            $sql_4 = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 5") or die(mysqli_error());
                            $s4 = mysqli_fetch_array($sql_4);
                            $apiKeys = $s4['api_key'];
                            $merchantCodes = $s4['merchant_code'];
                            $urlRequest = $s4['urlRequest'];
                            $signe = $merchantCodes.$apiKeys.$merchantRef;
                            $sign = md5($signe);
                            
                            $params = array(
                                'username' => $merchantCodes,
                                'buyer_sku_code' => $produkCode,
                                'customer_no' => $tujuan,
                                'ref_id' => $refID,
                                'sign' => $sign
                            );
                            $params_string = json_encode($params);
                            $url1 = $urlRequest.'/transaction';
                            $ch1 = curl_init();
                            curl_setopt($ch1, CURLOPT_URL, $url1); 
                            curl_setopt($ch1, CURLOPT_CUSTOMREQUEST, "POST");                                                                     
                            curl_setopt($ch1, CURLOPT_POSTFIELDS, $params_string);                                                                  
                            curl_setopt($ch1, CURLOPT_RETURNTRANSFER, true);                                                                      
                            curl_setopt($ch1, CURLOPT_HTTPHEADER, array(                                                                          
                                'Content-Type: application/json'                                                                       
                            ));   
                            curl_setopt($ch1, CURLOPT_SSL_VERIFYPEER, FALSE);
                                        
                            //execute post
                            $response1 = curl_exec($ch1);
                                    
                            curl_close($ch1);
                            $hasil = json_decode($response1, true);
                            $message = $hasil['data']['message'];
                            $order_status = $hasil['data']['status'];
                            
                            if($order_status != 'Gagal'){
                                $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `trxID` = '$orderid', status_order = '$order_status' WHERE kd_transaksi = '$refID'") or die(mysqli_error($conn));
                                $datae = array(
                            		"trxid" => $refID,
                            		"data" => $tujuan.$zone_id,
                                    "code" => $produkCode,
                                    "service" => $productTitle,
                                    "status" => 'Pending',
                                    "note" => ''
                            	);
                            }
                            else {
                                $message = $hasil['message'];
                                $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$refID','$created_date','Pengembalian Dana','$subtotal',0,'Pengembalian Dana', '$jenisnya','3','999','$user_id',1)") or die(mysqli_error($conn));
                                $update1 = mysqli_query($conn,"UPDATE `tb_balance` SET `active` = active + '$subtotal', `pending` = pending - '$subtotal' WHERE userID = '$user_id'") or die(mysqli_error($conn));
                                $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `status` = 3, `note` = '$message' WHERE kd_transaksi = '$refID'") or die(mysqli_error($conn));
                                $datae = array(
                            		"trxid" => $refID,
                            		"data" => $tujuan.$zone_id,
                                    "code" => $produkCode,
                                    "service" => $productTitle,
                                    "status" => 'Failed',
                                    "note" => $message
                            	);
                            }
                        }
                        
                        $response = array(
        	            	"status" => 'true',
        	            	"data" => $datae
        	            );
                    }
                    else {
                        $response = array(
                        	"status" => 'false',
                        	"message" => 'Transaksi Gagal, Saldo Tidak Mencukupi Untuk Melakukan Transaksi. Silahkan Top Up Saldo Anda Terlebih Dahulu'
                        );     
                    }
        	    }
        	}
        	else {
        	    $cpg = mysqli_fetch_array($cekProdukGame);
        	    $productID = $cpg['cuid'];
        	    $productCategory = $cpg['kategori'];
                $productTitle = $cpg['title'];
                $jenisnya = $cpg['jenis'];
                $productType = $cpg['product_type'];
                $hargaModal = $cpg['harga_modal'];
                $hargaJual = $cpg['harga_h2h'];
                $komisinya = $cpg['komisi'];
                $poinnya = $cpg['poin'];
                $qty = 1;
                
                $getkategori = mysqli_query($conn,"SELECT * FROM `tb_kategori` WHERE kategori = '$productCategory'") or die(mysqli_error());
                $gk = mysqli_fetch_array($getkategori);
                $parentType = $gk['parent'];
                
                $potongan = 0;
                $profit = $hargaJual - $hargaModal;
                $totalProfit = $profit * $qty;
                $subtotal = $hargaJual - $potongan;
                
                if($cb['active'] > $subtotal){
                    $insert = mysqli_query($conn,"INSERT INTO `tb_order` (`id_session`, `kd_transaksi`, `produkID`, `qty`, `harga_modal`, `harga_jual`, `harga`, `kode_unik`, `potongan`, `tukar_poin`, `sub_total`, `total_profit`, `voucher`, `komisi`, `poin`, `kategori`, `title`, `userID`, `zoneID`, `nickname`, `trxID`, `services`, `status_order`, `note`, `full_name`, `email`, `no_hp`, `metode`, `created_date`, `providerID`, `jenis`, `ipaddress`, `id_user`, `status`) VALUES ('$sid', '$refID', '$produkID', '$qty', '$hargaModal', '$hargaJual', '$subtotal', '0', '0', '0', '$subtotal', '$totalProfit', '', '$komisinya', '$poinnya', '$productCategory', '$productTitle', '$userID', '$zone_id', '$nickname', '', '$productCode', '', '', '$full_name', '$email', '$noHp', '999', '$created_date', '$jenisnya', '$parentType', '$ipAddress', '$user_id', 1)") or die(mysqli_error($conn));
                    $update2 = mysqli_query($conn,"UPDATE `tb_balance` SET active = active - '$subtotal', pending = pending + '$subtotal' WHERE userID = '$user_id'") or die(mysqli_error());    
                    $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$refID','$created_date','Pembelian Produk $productTitle','$subtotal',0,'Pembelian Produk $productTitle', '$jenisnya','$parentType','999','$user_id',1)") or die(mysqli_error());
                    
                    if($jenisnya == 4){
                        $sql_4 = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 4") or die(mysqli_error());
                        $s4 = mysqli_fetch_array($sql_4);
                        $apiKeys = $s4['api_key'];
                        $merchantCodes = $s4['merchant_code'];
                        $signe = $merchantCodes.$apiKeys;
                        $urlRequest = $s4['urlRequest'];
                        $sign = md5($signe);
                        
                        $curl1 = curl_init();
                                                    
                        curl_setopt_array($curl1, array(
                            CURLOPT_URL => $urlRequest.'/game-feature',
                            CURLOPT_RETURNTRANSFER => true,
                            CURLOPT_ENCODING => '',
                            CURLOPT_MAXREDIRS => 10,
                            CURLOPT_TIMEOUT => 0,
                            CURLOPT_FOLLOWLOCATION => true,
                            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                            CURLOPT_CUSTOMREQUEST => 'POST',
                            CURLOPT_POSTFIELDS => array('key' => $apiKeys, 'sign' => $sign, 'type' => 'order', 'service' => $produkCode, 'data_no' => $tujuan, 'data_zone' => $zone_id),
                        ));
                                                    
                        $response1 = curl_exec($curl1);
                                                    
                        curl_close($curl1);
                        $hasil = json_decode($response1, true);
                        $orderid = $hasil['data']['trxid'];
                        $order_status = $hasil['data']['status'];
                        
                        if($hasil['result'] == true){
                            $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `trxID` = '$orderid', status_order = '$order_status' WHERE kd_transaksi = '$refID'") or die(mysqli_error($conn));
                            $datae = array(
                        		"trxid" => $refID,
                        		"data" => $tujuan.$zone_id,
                                "code" => $produkCode,
                                "service" => $productTitle,
                                "status" => 'Pending',
                                "note" => ''
                        	);
                        }
                        else {
                            $message = $hasil['message'];
                            $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$refID','$created_date','Pengembalian Dana','$subtotal',0,'Pengembalian Dana', '$jenisnya','3','999','$user_id',1)") or die(mysqli_error($conn));
                            $update1 = mysqli_query($conn,"UPDATE `tb_balance` SET `active` = active + '$subtotal', `pending` = pending - '$subtotal' WHERE userID = '$user_id'") or die(mysqli_error($conn));
                            $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `status` = 3, `note` = '$message' WHERE kd_transaksi = '$refID'") or die(mysqli_error($conn));
                            $datae = array(
                        		"trxid" => $refID,
                        		"data" => $tujuan.$zone_id,
                                "code" => $produkCode,
                                "service" => $productTitle,
                                "status" => 'Failed',
                                "note" => $message
                        	);
                        }
                    }
                    else if($jenisnya == 5){
                        $sql_4 = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 5") or die(mysqli_error());
                        $s4 = mysqli_fetch_array($sql_4);
                        $apiKeys = $s4['api_key'];
                        $merchantCodes = $s4['merchant_code'];
                        $urlRequest = $s4['urlRequest'];
                        $signe = $merchantCodes.$apiKeys.$merchantRef;
                        $sign = md5($signe);
                        
                        $params = array(
                            'username' => $merchantCodes,
                            'buyer_sku_code' => $produkCode,
                            'customer_no' => $tujuan.$zone_id,
                            'ref_id' => $refID,
                            'sign' => $sign
                        );
                        $params_string = json_encode($params);
                        $url1 = $urlRequest.'/transaction';
                        $ch1 = curl_init();
                        curl_setopt($ch1, CURLOPT_URL, $url1); 
                        curl_setopt($ch1, CURLOPT_CUSTOMREQUEST, "POST");                                                                     
                        curl_setopt($ch1, CURLOPT_POSTFIELDS, $params_string);                                                                  
                        curl_setopt($ch1, CURLOPT_RETURNTRANSFER, true);                                                                      
                        curl_setopt($ch1, CURLOPT_HTTPHEADER, array(                                                                          
                            'Content-Type: application/json'                                                                       
                        ));   
                        curl_setopt($ch1, CURLOPT_SSL_VERIFYPEER, FALSE);
                                    
                        //execute post
                        $response1 = curl_exec($ch1);
                                
                        curl_close($ch1);
                        $hasil = json_decode($response1, true);
                        $message = $hasil['data']['message'];
                        $order_status = $hasil['data']['status'];
                        
                        if($order_status != 'Gagal'){
                            $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `trxID` = '$orderid', status_order = '$order_status' WHERE kd_transaksi = '$refID'") or die(mysqli_error($conn));
                            $datae = array(
                        		"trxid" => $refID,
                        		"data" => $tujuan.$zone_id,
                                "code" => $produkCode,
                                "service" => $productTitle,
                                "status" => 'Pending',
                                "note" => ''
                        	);
                        }
                        else {
                            $message = $hasil['message'];
                            $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$refID','$created_date','Pengembalian Dana','$subtotal',0,'Pengembalian Dana', '$jenisnya','3','999','$user_id',1)") or die(mysqli_error($conn));
                            $update1 = mysqli_query($conn,"UPDATE `tb_balance` SET `active` = active + '$subtotal', `pending` = pending - '$subtotal' WHERE userID = '$user_id'") or die(mysqli_error($conn));
                            $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `status` = 3, `note` = '$message' WHERE kd_transaksi = '$refID'") or die(mysqli_error($conn));
                            $datae = array(
                        		"trxid" => $refID,
                        		"data" => $tujuan.$zone_id,
                                "code" => $produkCode,
                                "service" => $productTitle,
                                "status" => 'Failed',
                                "note" => $message
                        	);
                        }
                    }
                    else if($jenisnya == 6){
                        $sql_5 = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 6") or die(mysqli_error());
                        $s5 = mysqli_fetch_array($sql_5);
                        $apiKeys = $s5['api_key'];
                        $merchantCodes = $s5['merchant_code'];
                        $gamesRequest = $s5['urlRequest'];
                        
                        $post_url = $gamesRequest.'/transaksi?user_code='.$merchantCodes.'&ref_id='.$merchantRef.'&player_id='.$dataNo.'&server_id='.$dataZone.'&kode_produk='.$servicess.'&secret='.$apiKeys;
                        $curl1 = curl_init();
                        curl_setopt_array($curl1, array(
                            CURLOPT_URL => $post_url,
                            CURLOPT_RETURNTRANSFER => true,
                            CURLOPT_ENCODING => '',
                            CURLOPT_MAXREDIRS => 10,
                            CURLOPT_TIMEOUT => 0,
                            CURLOPT_FOLLOWLOCATION => true,
                            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                            CURLOPT_CUSTOMREQUEST => 'GET',
                            CURLOPT_POSTFIELDS => '',
                            CURLOPT_HTTPHEADER => array(
                                'Content-Type: application/x-www-form-urlencoded'
                            ),
                        ));
                                                        
                        $response1 = curl_exec($curl1);
                        //echo $response1;
                        curl_close($curl1);
                        $hasil = json_decode($response1, true);
                        
                        $message = $hasil['sn'];
                        $order_status = $hasil['status'];
                        
                        if($order_status != 'Gagal'){
                            $orderid = $hasil['trx_id'];
                            $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `trxID` = '$orderid', status_order = '$order_status' WHERE kd_transaksi = '$refID'") or die(mysqli_error($conn));
                            $datae = array(
                        		"trxid" => $refID,
                        		"data" => $tujuan.$zone_id,
                                "code" => $produkCode,
                                "service" => $productTitle,
                                "status" => 'Pending',
                                "note" => ''
                        	);
                        }
                        else {
                            $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$refID','$created_date','Pengembalian Dana','$subtotal',0,'Pengembalian Dana', '$jenisnya','3','999','$user_id',1)") or die(mysqli_error($conn));
                            $update1 = mysqli_query($conn,"UPDATE `tb_balance` SET `active` = active + '$subtotal', `pending` = pending - '$subtotal' WHERE userID = '$user_id'") or die(mysqli_error($conn));
                            $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `status` = 3, `note` = '$message' WHERE kd_transaksi = '$refID'") or die(mysqli_error($conn));
                            $datae = array(
                        		"trxid" => $refID,
                        		"data" => $tujuan.$zone_id,
                                "code" => $produkCode,
                                "service" => $productTitle,
                                "status" => 'Failed',
                                "note" => $message
                        	);
                        }
                    }
                    else if($jenisnya == 9){
                        $sql_4 = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 9") or die(mysqli_error());
                        $s4 = mysqli_fetch_array($sql_4);
                        $apiKeys = $s4['api_key'];
                        $merchantCodes = $s4['merchant_code'];
                        $urlRequest = $s4['urlRequest'];
                        $signe = $merchantCodes.$apiKeys;
                        $sign = md5($signe);
                        
                        $post_url = $urlRequest.'/transaksi/http-get-v1?merchant='.$merchantCodes.'&secret='.$apiKeys.'&produk='.$servicess.'&tujuan='.$dataNo.$dataZone.'&ref=' . $merchantRef;
                        $curl1 = curl_init();
                        curl_setopt_array($curl1, array(
                            CURLOPT_URL => $post_url,
                            CURLOPT_RETURNTRANSFER => true,
                            CURLOPT_ENCODING => '',
                            CURLOPT_MAXREDIRS => 10,
                            CURLOPT_TIMEOUT => 0,
                            CURLOPT_FOLLOWLOCATION => true,
                            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                            CURLOPT_CUSTOMREQUEST => 'GET',
                            CURLOPT_POSTFIELDS => '',
                            CURLOPT_HTTPHEADER => array(
                                'Content-Type: application/x-www-form-urlencoded'
                            ),
                        ));
                                                    
                        $response1 = curl_exec($curl1);
                        $hasil = json_decode($response1, true);
                        
                        $message = $hasil['sn'];
                        $order_status = $hasil['status'];
                        
                        if($order_status != 'Gagal'){
                            $message = $hasil['error_msg'];
                            $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$refID','$created_date','Pengembalian Dana','$subtotal',0,'Pengembalian Dana', '$jenisnya','3','999','$user_id',1)") or die(mysqli_error($conn));
                            $update1 = mysqli_query($conn,"UPDATE `tb_balance` SET `active` = active + '$subtotal', `pending` = pending - '$subtotal' WHERE userID = '$user_id'") or die(mysqli_error($conn));
                            $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `status` = 3, `note` = '$message' WHERE kd_transaksi = '$refID'") or die(mysqli_error($conn));
                            $datae = array(
                        		"trxid" => $refID,
                        		"data" => $tujuan.$zone_id,
                                "code" => $produkCode,
                                "service" => $productTitle,
                                "status" => 'Failed',
                                "note" => $message
                        	);
                            
                        }
                        else {
                            $orderid = $hasil['data']['trxid'];
                            $order_status = $hasil['data']['status'];
                            $note = $hasil['data']['sn'];
                            $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `trxID` = '$orderid', status_order = '$order_status', note = '$note' WHERE kd_transaksi = '$refID'") or die(mysqli_error($conn));
                            $datae = array(
                        		"trxid" => $refID,
                        		"data" => $tujuan.$zone_id,
                                "code" => $produkCode,
                                "service" => $productTitle,
                                "status" => 'Pending',
                                "note" => $note
                        	);
                        }
                    }
                    
                    $response = array(
    	            	"status" => 'true',
    	            	"data" => $datae
    	            );
                }
                else {
                    $response = array(
                    	"status" => 'false',
                    	"message" => 'Transaksi Gagal, Saldo Tidak Mencukupi Untuk Melakukan Transaksi. Silahkan Top Up Saldo Anda Terlebih Dahulu'
                    );     
                }
        	}
        }
    }
}
json_encode($response);
echo json_encode($response);
?>