<?php
ob_start();
session_start();
include('../config/koneksi.php');
$sql_0 = mysqli_query($conn,"SELECT * FROM `tb_seo` WHERE cuid = 1") or die(mysqli_error());
$s0 = mysqli_fetch_array($sql_0);
$urlweb = $s0['urlweb'];
$logoweb = $s0['image'];

$sql_user = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE cuid = 1") or die(mysqli_error());
$su = mysqli_fetch_array($sql_user);

$sql_10 = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 7") or die(mysqli_error());
$s10 = mysqli_fetch_array($sql_10);
$api_token = $s10['private_key'];
$merchantID = $s10['merchant_code'];

$data = json_decode(file_get_contents('php://input'), true);

$token = $data['api_key'];
if ($api_token != strval($token)) {
    echo "invalid api token";
    exit;
}
        
//MODULE BANK (bca,bri,bni,mandiri)
$module = $data['module'];

//DATA MUTASI
foreach ($data['data_mutasi'] as $dtm) {
    //Tanggal Transaksi terjadi di bank
    $date = $dtm['transaction_date'];
    
    //Note atau deskripsi dari bank
    $note = $dtm['description'];
    
    //Tipe transaksi (DB ATAU CR)
    $type = $dtm['type'];
    
    //Jumlah Dana
    $amount = $dtm['amount'];
    
    //Saldo saat ini
    $saldo = $dtm['balance'];
    
    //ID Transaksi Mutasi 
    $id = $dtm['id'];
    
    //Module Bank 
    $module = $data['module'];
    
    $headers = [
        "Authorization: $api_token",
        'Content-Type: application/json'
    ];
    //validate transaction = 
    $result_v = http_get("https://mutasibank.co.id/api/v1/validate/$id", $headers);
    $data_r = json_decode($result_v);
    
    if ($data_r->valid && $data_r->data->amount == $amount) {
        //transaksi valid
        //proses untuk selanjutnya
        //Logic validasi transaksi selanjutnya ada disini
        $paidTime = date('Y-m-d H:i:s');
        $paymentID = date('YmdHi');
        
        if ($type === 'CR') { // dana masuk
            $cektrx = mysqli_query($conn,"SELECT * FROM `tb_tripay` WHERE amount_total = '$amount'") or die(mysqli_error());
            $ct = mysqli_fetch_array($cektrx);
              
            $merchantRef = $ct['merchant_ref'];
            $payment_method = $ct['payment_name'];
            $amount = $ct['amount'];
            $userID = $ct['userID'];
            $providerID = $ct['providerID'];
            $jenis_transaksi = $ct['jenis_transaksi'];

            $getUSer = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE cuid = '$userID'") or die(mysqli_error($conn));
            $gu = mysqli_fetch_array($getUSer);
            $no_hp = $gu['no_hp'];
            
            $content_payment = '*Terima Kasih* Pembayaran dengan No.Invoice ' . $merchantRef . '* Telah kami terima, Pesanan Anda sedang diproses.
                                                
silahkan cek status transaksi kamu di '.$urlweb.'/cektrx/?trxNum='.$merchantRef.'

Daftar jadi member bayar pakai Saldo Lebih Murah
Klik: '.$urlweb.'/register/

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
                $ceksession = mysqli_query($conn,"SELECT * FROM `tb_transaksi` WHERE kd_transaksi = '$merchantRef'") or die(mysqli_error($conn));
                $cs = mysqli_fetch_array($ceksession);
                $userID = $cs['userID'];
                $getUSer = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE cuid = '$userID'") or die(mysqli_error($conn));
                $gu = mysqli_fetch_array($getUSer);
                $full_names = $gu['full_name'];
                $email = $gu['email'];
                $noHp = $gu['no_hp'];
                if($cs['status'] == 0){
                    $update = mysqli_query($conn,"UPDATE `tb_transaksi` SET status = 1 WHERE kd_transaksi = '$merchantRef'") or die(mysqli_error());
                    $update_tripay = mysqli_query($conn,"UPDATE `tb_tripay` SET `status` = '$statusBayar', `paid_time` = '$paidTime' WHERE `merchant_ref` = '$merchantRef'") or die(mysqli_error());
                    $update_balace = mysqli_query($conn,"UPDATE `tb_balance` SET active = active + '$amount' WHERE userID = '$userID'") or die(mysqli_error());
                }
            }
            else {
                $ceksession = mysqli_query($conn,"SELECT * FROM `tb_order` WHERE kd_transaksi = '$merchantRef'") or die(mysqli_error($conn));
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
                    $update = mysqli_query($conn,"UPDATE `tb_order` SET status = 1 WHERE kd_transaksi = '$merchantRef'") or die(mysqli_error());
                    $update_tripay = mysqli_query($conn,"UPDATE `tb_tripay` SET `status` = '$statusBayar', `paid_time` = '$paidTime' WHERE `merchant_ref` = '$merchantRef'") or die(mysqli_error());
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
                            $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `trxID` = '$orderid', status_order = '$order_status' WHERE kd_transaksi = '$merchantRef'") or die(mysqli_error($conn));
                        }
                        else {
                            $update1 = mysqli_query($conn,"UPDATE `tb_balance` SET `active` = active + '$amount' WHERE userID = '$userID'") or die(mysqli_error($conn));
                            $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `status` = 3, `note` = '$order_status' WHERE kd_transaksi = '$merchantRef'") or die(mysqli_error($conn));
                            $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$merchantRef','$created_date','Pengembalian Dana','$amount',0,'Pengembalian Dana', '$providerID','3','100','$userID',2)") or die(mysqli_error());
                            $content = '*Mohon Maaf* Pesanan Anda Gagal Diproses dikarenakan produk sedang Cut Off/Gangguan
                                                
silahkan cek status transaksi kamu di '.$urlweb.'/cektrx/?trxNum='.$merchantRef.'

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
                        $signe = $merchantCodes.$apiKeys.$merchantRef;
                        $sign = md5($signe);

                        if($jenis_transaksi == 1){
                            $params = array(
                                'username' => $merchantCodes,
                                'buyer_sku_code' => $servicess,
                                'customer_no' => $dataNo.$dataZone,
                                'ref_id' => $merchantRef,
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
                                'ref_id' => $merchantRef,
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
                                'ref_id' => $merchantRef,
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
                            $update3 = mysqli_query($conn,"UPDATE `tb_order` SET status_order = '$order_status', `note` = '$message' WHERE kd_transaksi = '$merchantRef'") or die(mysqli_error($conn));
                        }
                        else {
                            $update1 = mysqli_query($conn,"UPDATE `tb_balance` SET `active` = active + '$amount' WHERE userID = '$userID'") or die(mysqli_error($conn));
                            $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `status` = 3, `note` = '$message' WHERE kd_transaksi = '$merchantRef'") or die(mysqli_error($conn));
                            $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$merchantRef','$created_date','Pengembalian Dana','$amount',0,'Pengembalian Dana', '$providerID','3','100','$userID',2)") or die(mysqli_error());
                            $content = '*Mohon Maaf* Pesanan Anda Gagal Diproses dikarenakan produk sedang Cut Off/Gangguan
                                                
silahkan cek status transaksi kamu di '.$urlweb.'/cektrx/?trxNum='.$merchantRef.'

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
                            $post_url = $gamesRequest.'/transaksi/http-get-v1?merchant='.$merchantCodes.'&secret='.$apiKeys.'&produk='.$servicess.'&tujuan='.$dataNo.$dataZone.'&ref=' . $merchantRef;
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
                            $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `trxID` = '$orderid', status_order = '$order_status', note = '$message' WHERE kd_transaksi = '$merchantRef'") or die(mysqli_error($conn));
                        }
                        else {
                            $update1 = mysqli_query($conn,"UPDATE `tb_balance` SET `active` = active + '$amount' WHERE userID = '$userID'") or die(mysqli_error($conn));
                            $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `status` = 3, `note` = '$message' WHERE kd_transaksi = '$merchantRef'") or die(mysqli_error($conn));
                            $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$merchantRef','$created_date','Pengembalian Dana','$amount',0,'Pengembalian Dana', '$providerID','3','100','$userID',2)") or die(mysqli_error());
                            $content = '*Mohon Maaf* Pesanan Anda Gagal Diproses dikarenakan produk sedang Cut Off/Gangguan
                                                
silahkan cek status transaksi kamu di '.$urlweb.'/cektrx/?trxNum='.$merchantRef.'

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
                            $update = mysqli_query($conn,"UPDATE `tb_order` SET status = 1 WHERE kd_transaksi = '$merchantRef'") or die(mysqli_error());
                            $update_tripay = mysqli_query($conn,"UPDATE `tb_tripay` SET `status` = '$statusBayar', `paid_time` = '$paidTime' WHERE `merchant_ref` = '$merchantRef'") or die(mysqli_error());
                        }
                    }
                }    
            }
        }
        
    }
    else {
        echo "Tansaksi $id not valid ";
    }
}

function http_get($url, $headers = array())
{

    // is cURL installed yet?
    if (!function_exists('curl_init')) {
        die('Sorry cURL is not installed!');
    }

    // OK cool - then let's create a new cURL resource handle
    $ch = curl_init();

    // Now set some options (most are optional)

    // Set URL to download
    curl_setopt($ch, CURLOPT_URL, $url);

    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    // Set a referer
    curl_setopt($ch, CURLOPT_REFERER, $url);

    // User agent
    curl_setopt($ch, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0");

    // Include header in result? (0 = yes, 1 = no)
    curl_setopt($ch, CURLOPT_HEADER, 0);

    // Should cURL return or print out the data? (true = return, false = print)
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    // Timeout in seconds
    curl_setopt($ch, CURLOPT_TIMEOUT, 240);

    // Download the given URL, and return output
    $output = curl_exec($ch);

    // Close the cURL resource, and free system resources
    curl_close($ch);

    return $output;
}

?>