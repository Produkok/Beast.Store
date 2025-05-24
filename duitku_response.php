<?php
ob_start();
session_start();
include('config/koneksi.php');
$sql_0 = mysqli_query($conn,"SELECT * FROM `tb_seo` WHERE cuid = 1") or die(mysqli_error());
$s0 = mysqli_fetch_array($sql_0);
$urlweb = $s0['urlweb'];
$logoweb = $s0['image'];

$sql_user = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE cuid = 1") or die(mysqli_error());
$su = mysqli_fetch_array($sql_user);

$sql_5 = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 3") or die(mysqli_error());
$s5 = mysqli_fetch_array($sql_5);
$merchantCode = $s5['merchant_code'];

$apiKey = $s5['api_key']; // Your api key
$merchantCode = isset($_POST['merchantCode']) ? $_POST['merchantCode'] : null; 
$amount = isset($_POST['amount']) ? $_POST['amount'] : null; 
$merchantOrderId = isset($_POST['merchantOrderId']) ? $_POST['merchantOrderId'] : null; 
$productDetail = isset($_POST['productDetail']) ? $_POST['productDetail'] : null; 
$additionalParam = isset($_POST['additionalParam']) ? $_POST['additionalParam'] : null; 
$paymentMethod = isset($_POST['paymentCode']) ? $_POST['paymentCode'] : null; 
$resultCode = isset($_POST['resultCode']) ? $_POST['resultCode'] : null; 
$merchantUserId = isset($_POST['merchantUserId']) ? $_POST['merchantUserId'] : null; 
$reference = isset($_POST['reference']) ? $_POST['reference'] : null; 
$signature = isset($_POST['signature']) ? $_POST['signature'] : null; 

$paidTime = date('Y-m-d H:i:s');

if(!empty($merchantCode) && !empty($amount) && !empty($merchantOrderId) && !empty($signature))
{
    $params = $merchantCode . $amount . $merchantOrderId . $apiKey;
    $calcSignature = md5($params);

    if($signature == $calcSignature)
    {
        if($resultCode == 00){
            //Your code here
            $paymentID = date('YmdHi');
            $cektrx = mysqli_query($conn,"SELECT * FROM `tb_tripay` WHERE merchant_ref = '$merchantOrderId'") or die(mysqli_error());
            $paidTime = date('Y-m-d H:i:s');
            $paymentID = date('YmdHi');
            $ct = mysqli_fetch_array($cektrx);
            $payment_method = $ct['payment_name'];
            $amount = $ct['amount'];
            $userID = $ct['userID'];
            $providerID = $ct['providerID'];
            $jenis_transaksi = $ct['jenis_transaksi'];
            $no_hp = $ct['customer_phone'];

            $content_payment = '*Terima Kasih* Pembayaran dengan No.Invoice *' . $merchantOrderId . '* Telah kami terima, Pesanan Anda sedang diproses.
                                                
silahkan cek status transaksi kamu di '.$urlweb.'/cektrx/ dan masukkan No.Invoice kamu *' . $merchantOrderId . '*
                                
Jika ada kendala, silahkan hubungi Layanan CS :
WA/TELEGRAM : '.$su['no_hp'];

            $cekFonnte = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 8") or die(mysqli_error());
            $cf = mysqli_fetch_array($cekFonnte);
            if($cf['status'] == 1){
                $curls = curl_init();
                
                curl_setopt_array($curls, array(
                    CURLOPT_URL => "https://api.fonnte.com/send",
                    CURLOPT_RETURNTRANSFER => true,
                    CURLOPT_ENCODING => "",
                    CURLOPT_MAXREDIRS => 10,
                    CURLOPT_TIMEOUT => 0,
                    CURLOPT_FOLLOWLOCATION => true,
                    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                    CURLOPT_CUSTOMREQUEST => "POST",
                    CURLOPT_POSTFIELDS => array(
                       'target' => $no_hp,
                       'message' => $content_payment,
                       'countryCode' => '62'),
                    CURLOPT_HTTPHEADER => array(
                        "Authorization: ".$cf['api_key']
                    ),
                ));
                    
                $response = curl_exec($curls);
                        
                        
                curl_close($curls);
                //echo $response;
                sleep(1); #do not delete!
            }
            
            if($providerID == 0){
                $ceksession = mysqli_query($conn,"SELECT * FROM `tb_transaksi` WHERE kd_transaksi = '$merchantOrderId'") or die(mysqli_error($conn));
                $cs = mysqli_fetch_array($ceksession);
                $userID = $cs['userID'];
                $getUSer = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE cuid = '$userID'") or die(mysqli_error($conn));
                $gu = mysqli_fetch_array($getUSer);
                $full_names = $gu['full_name'];
                $email = $gu['email'];
                $noHp = $gu['no_hp'];

                $update = mysqli_query($conn,"UPDATE `tb_transaksi` SET status = 1 WHERE kd_transaksi = '$merchantOrderId'") or die(mysqli_error());
                $update_tripay = mysqli_query($conn,"UPDATE `tb_tripay` SET `status` = 'PAID', `paid_time` = '$paidTime' WHERE `merchant_ref` = '$merchantOrderId'") or die(mysqli_error());
                $update_balace = mysqli_query($conn,"UPDATE `tb_balance` SET active = active + '$amount' WHERE userID = '$userID'") or die(mysqli_error());
            }
            else {
                $ceksession = mysqli_query($conn,"SELECT * FROM `tb_order` WHERE kd_transaksi = '$merchantOrderId'") or die(mysqli_error($conn));
                $cs = mysqli_fetch_array($ceksession);
                $full_names = $cs['full_name'];
                $email = $cs['email'];
                $noHp = $cs['no_hp'];
                $servicess = $cs['services'];
                $dataNo = $cs['userID'];
                $dataZone = $cs['zoneID'];
                $qty = $cs['qty'];
                $productTitle = $cs['title'];

                if($cs['status'] == 0){
                    $update = mysqli_query($conn,"UPDATE `tb_order` SET status = 1 WHERE kd_transaksi = '$merchantOrderId'") or die(mysqli_error());
                    $update_tripay = mysqli_query($conn,"UPDATE `tb_tripay` SET `status` = '$statusBayar', `paid_time` = '$paidTime' WHERE `merchant_ref` = '$merchantOrderId'") or die(mysqli_error());
                    if($providerID == 4){
                        $sql_5 = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 4") or die(mysqli_error());
                        $s5 = mysqli_fetch_array($sql_5);
                        $apiKeys = $s5['api_key'];
                        $merchantCodes = $s5['merchant_code'];
                        $vipRequest = $s5['urlRequest'];
                        $signe = $merchantCodes.$apiKeys;
                        $sign = md5($signe);

                        if($jenis_transaksi == 1){
                            $curl1 = curl_init();
                                                 
                            curl_setopt_array($curl1, array(
                                CURLOPT_URL => $vipRequest.'/game-feature',
                                CURLOPT_RETURNTRANSFER => true,
                                CURLOPT_ENCODING => '',
                                CURLOPT_MAXREDIRS => 10,
                                CURLOPT_TIMEOUT => 0,
                                CURLOPT_FOLLOWLOCATION => true,
                                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                                CURLOPT_CUSTOMREQUEST => 'POST',
                                CURLOPT_POSTFIELDS => array('key' => $apiKeys, 'sign' => $sign, 'type' => 'order', 'service' => $servicess, 'data_no' => $dataNo, 'data_zone' => $dataZone),
                            ));
                                                
                            $response1 = curl_exec($curl1);
                                               
                            curl_close($curl1);
                             
                        }
                        else if($jenis_transaksi == 2){
                            $curl1 = curl_init();
                                                    
                            curl_setopt_array($curl1, array(
                                CURLOPT_URL => $vipRequest.'/prepaid',
                                CURLOPT_RETURNTRANSFER => true,
                                CURLOPT_ENCODING => '',
                                CURLOPT_MAXREDIRS => 10,
                                CURLOPT_TIMEOUT => 0,
                                CURLOPT_FOLLOWLOCATION => true,
                                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                                CURLOPT_CUSTOMREQUEST => 'POST',
                                CURLOPT_POSTFIELDS => array('key' => $apiKeys, 'sign' => $sign, 'type' => 'order', 'service' => $servicess, 'data_no' => $dataNo),
                            ));
                                               
                            $response1 = curl_exec($curl1);
                                              
                            curl_close($curl1);
                        }
                        $hasil = json_decode($response1, true);
                        $orderid = $hasil['data']['trxid'];
                        $order_status = $hasil['data']['status'];

                        if($hasil['result'] == 'true'){
                            $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `trxID` = '$orderid', status_order = '$order_status' WHERE kd_transaksi = '$merchantOrderId'") or die(mysqli_error($conn));
                        }
                        else {
                            $update1 = mysqli_query($conn,"UPDATE `tb_balance` SET `active` = active + '$amount' WHERE userID = '$userID'") or die(mysqli_error($conn));
                            $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `status` = 3, `note` = '$order_status' WHERE kd_transaksi = '$merchantOrderId'") or die(mysqli_error($conn));
                            $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$merchantOrderId','$created_date','Pengembalian Dana','$amount',0,'Pengembalian Dana', '$providerID','3','999','$userID',2)") or die(mysqli_error());
                            $content = '*Mohon Maaf* Pesanan Anda Gagal Diproses dikarenakan produk sedang Cut Off/Gangguan
                                                
silahkan cek status transaksi kamu di '.$urlweb.'/cektrx/?trxNum='.$merchantOrderId.'

Daftar jadi member bayar pakai Saldo Lebih Murah
Klik: '.$urlweb.'/register/
                                
Jika ada kendala, silahkan hubungi Layanan CS :
WA/TELEGRAM : '.$su['no_hp'];

                            $cekFonnte = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 8") or die(mysqli_error());
                            $cf = mysqli_fetch_array($cekFonnte);
                            if($cf['status'] == 1){
                                $curl = curl_init();
                                            
                                curl_setopt_array($curl, array(
                                    CURLOPT_URL => "https://api.fonnte.com/send",
                                    CURLOPT_RETURNTRANSFER => true,
                                    CURLOPT_ENCODING => "",
                                    CURLOPT_MAXREDIRS => 10,
                                    CURLOPT_TIMEOUT => 0,
                                    CURLOPT_FOLLOWLOCATION => true,
                                    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                                    CURLOPT_CUSTOMREQUEST => "POST",
                                    CURLOPT_POSTFIELDS => array(
                                       'target' => $noHp,
                                       'message' => $content,
                                       'countryCode' => '62'),
                                    CURLOPT_HTTPHEADER => array(
                                       "Authorization: ".$cf['api_key']
                                    ),
                                ));
                                              
                                $response = curl_exec($curl);
                                curl_close($curl);
                                //echo $response;
                                sleep(1); #do not delete!
                            }
                        }
                    }
                    else if($providerID == 5){
                        $sql_5 = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 5") or die(mysqli_error());
                        $s5 = mysqli_fetch_array($sql_5);
                        $apiKeys = $s5['api_key'];
                        $merchantCodes = $s5['merchant_code'];
                        $digiRequest = $s5['urlRequest'];
                        $signe = $merchantCodes.$apiKeys.$merchantOrderId;
                        $sign = md5($signe);

                        if($jenis_transaksi == 1){
                            $params = array(
                                'username' => $merchantCodes,
                                'buyer_sku_code' => $servicess,
                                'customer_no' => $dataNo.$dataZone,
                                'ref_id' => $merchantOrderId,
                                'sign' => $sign
                            );
                            $params_string = json_encode($params);
                            $url1 = $digiRequest.'/transaction';
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
                        }
                        else if($jenis_transaksi == 2){
                            $params = array(
                                'username' => $merchantCodes,
                                'buyer_sku_code' => $servicess,
                                'customer_no' => $dataNo,
                                'ref_id' => $merchantOrderId,
                                'sign' => $sign
                            );
                            $params_string = json_encode($params);
                            $url1 = $digiRequest.'/transaction';
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
                        }
                        else if($jenis_transaksi == 4){
                            $params = array(
                                'commands' => 'pay-pasca',
                                'username' => $merchantCodes,
                                'buyer_sku_code' => $servicess,
                                'customer_no' => $dataNo,
                                'ref_id' => $merchantOrderId,
                                'sign' => $sign
                            );
                            $params_string = json_encode($params);
                            $url1 = $digiRequest.'/transaction';
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
                            echo $response1;
                            curl_close($ch1);
                            $hasil = json_decode($response1, true);
                        }

                        $message = $hasil['data']['message'];
                        $order_status = $hasil['data']['status'];
                        if($order_status != 'Gagal'){
                            $update3 = mysqli_query($conn,"UPDATE `tb_order` SET status_order = '$order_status', `note` = '$message' WHERE kd_transaksi = '$merchantOrderId'") or die(mysqli_error($conn));
                        }
                        else {
                            $update1 = mysqli_query($conn,"UPDATE `tb_balance` SET `active` = active + '$amount' WHERE userID = '$userID'") or die(mysqli_error($conn));
                            $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `status` = 3, `note` = '$message' WHERE kd_transaksi = '$merchantOrderId'") or die(mysqli_error($conn));
                            $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$merchantOrderId','$created_date','Pengembalian Dana','$amount',0,'Pengembalian Dana', '$providerID','3','999','$userID',2)") or die(mysqli_error());
                            $content = '*Mohon Maaf* Pesanan Anda Gagal Diproses dikarenakan produk sedang Cut Off/Gangguan
                                                
silahkan cek status transaksi kamu di '.$urlweb.'/cektrx/?trxNum='.$merchantOrderId.'

Daftar jadi member bayar pakai Saldo Lebih Murah
Klik: '.$urlweb.'/register/
                                
Jika ada kendala, silahkan hubungi Layanan CS :
WA/TELEGRAM : '.$su['no_hp'];

                            $cekFonnte = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 8") or die(mysqli_error());
                            $cf = mysqli_fetch_array($cekFonnte);
                            if($cf['status'] == 1){
                                $curl = curl_init();
                                           
                                curl_setopt_array($curl, array(
                                    CURLOPT_URL => "https://api.fonnte.com/send",
                                    CURLOPT_RETURNTRANSFER => true,
                                    CURLOPT_ENCODING => "",
                                    CURLOPT_MAXREDIRS => 10,
                                    CURLOPT_TIMEOUT => 0,
                                    CURLOPT_FOLLOWLOCATION => true,
                                    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                                    CURLOPT_CUSTOMREQUEST => "POST",
                                    CURLOPT_POSTFIELDS => array(
                                       'target' => $noHp,
                                       'message' => $content,
                                       'countryCode' => '62'),
                                    CURLOPT_HTTPHEADER => array(
                                       "Authorization: ".$cf['api_key']
                                    ),
                                ));
                                              
                                $response = curl_exec($curl);
                                curl_close($curl);
                                //echo $response;
                                sleep(1); #do not delete!
                            }
                        }
                    }
                    else if($providerID == 6){
                        $sql_5 = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 6") or die(mysqli_error());
                        $s5 = mysqli_fetch_array($sql_5);
                        $apiKeys = $s5['api_key'];
                        $merchantCodes = $s5['merchant_code'];
                        $gamesRequest = $s5['urlRequest'];

                        if($jenis_transaksi == 1){
                            $post_url = $gamesRequest.'/transaksi?user_code='.$merchantCodes.'&ref_id='.$merchantOrderId.'&player_id='.$dataNo.'&server_id='.$dataZone.'&kode_produk='.$servicess.'&secret='.$apiKeys;
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
                            echo $response1;
                            curl_close($curl1);
                            $hasil = json_decode($response1, true);
                        }

                        $message = $hasil['sn'];
                        $order_status = $hasil['status'];

                        if($order_status != 'Gagal'){
                            $orderid = $hasil['trx_id'];
                            $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `trxID` = '$orderid', status_order = '$order_status', note = '$message' WHERE kd_transaksi = '$merchantOrderId'") or die(mysqli_error($conn));
                        }
                        else {
                            $update1 = mysqli_query($conn,"UPDATE `tb_balance` SET `active` = active + '$amount' WHERE userID = '$userID'") or die(mysqli_error($conn));
                            $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `status` = 3, `note` = '$message' WHERE kd_transaksi = '$merchantOrderId'") or die(mysqli_error($conn));
                            $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$merchantOrderId','$created_date','Pengembalian Dana','$amount',0,'Pengembalian Dana', '$providerID','3','999','$userID',2)") or die(mysqli_error());
                            $content = '*Mohon Maaf* Pesanan Anda Gagal Diproses dikarenakan produk sedang Cut Off/Gangguan
                                                
silahkan cek status transaksi kamu di '.$urlweb.'/cektrx/?trxNum='.$merchantOrderId.'

Daftar jadi member bayar pakai Saldo Lebih Murah
Klik: '.$urlweb.'/register/
                                
Jika ada kendala, silahkan hubungi Layanan CS :
WA/TELEGRAM : '.$su['no_hp'];

                            $cekFonnte = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 8") or die(mysqli_error());
                            $cf = mysqli_fetch_array($cekFonnte);
                            if($cf['status'] == 1){
                                $curl = curl_init();
                                            
                                curl_setopt_array($curl, array(
                                    CURLOPT_URL => "https://api.fonnte.com/send",
                                    CURLOPT_RETURNTRANSFER => true,
                                    CURLOPT_ENCODING => "",
                                    CURLOPT_MAXREDIRS => 10,
                                    CURLOPT_TIMEOUT => 0,
                                    CURLOPT_FOLLOWLOCATION => true,
                                    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                                    CURLOPT_CUSTOMREQUEST => "POST",
                                    CURLOPT_POSTFIELDS => array(
                                       'target' => $noHp,
                                       'message' => $content,
                                       'countryCode' => '62'),
                                    CURLOPT_HTTPHEADER => array(
                                       "Authorization: ".$cf['api_key']
                                    ),
                                ));
                                             
                                $response = curl_exec($curl);
                                curl_close($curl);
                                //echo $response;
                                sleep(1); #do not delete!
                            }
                        }
                    }
                    else if($providerID == 9){
                        $sql_5 = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 9") or die(mysqli_error());
                        $s5 = mysqli_fetch_array($sql_5);
                        $apiKeys = $s5['api_key'];
                        $merchantCodes = $s5['merchant_code'];
                        $gamesRequest = $s5['urlRequest'];

                        if($jenis_transaksi == 1){
                            $post_url = $gamesRequest.'/transaksi/http-get-v1?merchant='.$merchantCodes.'&secret='.$apiKeys.'&produk='.$servicess.'&tujuan='.$dataNo.$dataZone.'&ref=' . $merchantOrderId;
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
                            echo $response1;
                            curl_close($curl1);
                            $hasil = json_decode($response1, true);
                        }

                        $message = $hasil['data']['sn'];
                        $order_status = $hasil['data']['status'];

                        if($order_status != 'Gagal'){
                            $orderid = $hasil['data']['trx_id'];
                            $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `trxID` = '$orderid', status_order = '$order_status', note = '$message' WHERE kd_transaksi = '$merchantOrderId'") or die(mysqli_error($conn));
                        }
                        else {
                            $update1 = mysqli_query($conn,"UPDATE `tb_balance` SET `active` = active + '$amount' WHERE userID = '$userID'") or die(mysqli_error($conn));
                            $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `status` = 3, `note` = '$message' WHERE kd_transaksi = '$merchantOrderId'") or die(mysqli_error($conn));
                            $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$merchantOrderId','$created_date','Pengembalian Dana','$amount',0,'Pengembalian Dana', '$providerID','3','999','$userID',2)") or die(mysqli_error());
                            $content = '*Mohon Maaf* Pesanan Anda Gagal Diproses dikarenakan produk sedang Cut Off/Gangguan
                                                
silahkan cek status transaksi kamu di '.$urlweb.'/cektrx/?trxNum='.$merchantOrderId.'

Daftar jadi member bayar pakai Saldo Lebih Murah
Klik: '.$urlweb.'/register/
                                
Jika ada kendala, silahkan hubungi Layanan CS :
WA/TELEGRAM : '.$su['no_hp'];

                            $cekFonnte = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 8") or die(mysqli_error());
                            $cf = mysqli_fetch_array($cekFonnte);
                            if($cf['status'] == 1){
                                $curl = curl_init();
                                            
                                curl_setopt_array($curl, array(
                                    CURLOPT_URL => "https://api.fonnte.com/send",
                                    CURLOPT_RETURNTRANSFER => true,
                                    CURLOPT_ENCODING => "",
                                    CURLOPT_MAXREDIRS => 10,
                                    CURLOPT_TIMEOUT => 0,
                                    CURLOPT_FOLLOWLOCATION => true,
                                    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                                    CURLOPT_CUSTOMREQUEST => "POST",
                                    CURLOPT_POSTFIELDS => array(
                                       'target' => $noHp,
                                       'message' => $content,
                                       'countryCode' => '62'),
                                    CURLOPT_HTTPHEADER => array(
                                       "Authorization: ".$cf['api_key']
                                    ),
                                ));
                                             
                                $response = curl_exec($curl);
                                curl_close($curl);
                                //echo $response;
                                sleep(1); #do not delete!
                            }
                        }
                    }
                    else {
                        if($jenis_transaksi == 1){
                            $update = mysqli_query($conn,"UPDATE `tb_order` SET status = 1 WHERE kd_transaksi = '$merchantOrderId'") or die(mysqli_error());
                            $update_tripay = mysqli_query($conn,"UPDATE `tb_tripay` SET `status` = '$statusBayar', `paid_time` = '$paidTime' WHERE `merchant_ref` = '$merchantOrderId'") or die(mysqli_error());
                        }
                    }
                }
            }
            
            echo "SUCCESS"; // Please response with success
        }
    }
    else
    {
        throw new Exception('Bad Signature');
    }
}
?>