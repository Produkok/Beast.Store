<?php
    require_once('session.php');
    $userIDnya = $u['cuid'];
    $pass = $u['pass'];
    $pin_trx = $u['pinTrx'];
    $password = mysqli_real_escape_string($conn,$_POST['pass']);
    $pinTrx = md5($_POST['pinTrx']);
    $merchantRef = $_POST['trxID'];
    $created_date = date('Y-m-d H:i:s');

    $sql_user = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE cuid = 1") or die(mysqli_error());
    $su = mysqli_fetch_array($sql_user);

    if(password_verify($password,$pass)){
        if($pinTrx != $pin_trx){
            header('location:../order_saldo/?trxID='.$merchantRef.'&notif=2');
            exit();
        }
        else {
            $cekApaan = mysqli_query($conn,"SELECT * FROM `tb_transaksi` WHERE `kd_transaksi` = '$merchantRef'") or die(mysqli_error());
            $ca = mysqli_num_rows($cekApaan);
            if($ca == 0){
                $cekTransaksi = mysqli_query($conn,"SELECT * FROM `tb_order` WHERE kd_transaksi = '$merchantRef'") or die(mysqli_error());
                $ct = mysqli_fetch_array($cekTransaksi);
                $full_names = $ct['full_name'];
                $email = $ct['email'];
                $noHp = $ct['no_hp'];
                $servicess = $ct['services'];
                $dataNo = $ct['userID'];
                $qty = $ct['qty'];
                $dataZone = $ct['zoneID'];
                $subtotal = $ct['sub_total'];
                $jenis_transaksi = $ct['jenis'];
                $komisinya = $ct['komisi'];
                $poinnya = $ct['poin'];
                $providerID = $ct['providerID'];
                $usersID = $ct['id_user'];
                $metodeBayar = $ct['metode'];
                $productTitle = $ct['title'];

                $content_payment = '*Terima Kasih* Pembayaran dengan No.Invoice ' . $merchantRef . '* Telah kami terima, Pesanan Anda sedang diproses.
                                                
silahkan cek status transaksi kamu di '.$urlweb.'/cektrx/?trxNum='.$merchantRef.'

Daftar jadi member bayar pakai Saldo Lebih Murah
Klik: '.$urlweb.'/register/

Jika ada kendala, silahkan hubungi Layanan CS :
WA/TELEGRAM : '.$su['no_hp'];

                $content = '*Pesanan Anda Gagal* Pesanan Anda Gagal Diproses dikarenakan produk sedang Cut Off/Gangguan, Dana Telah dikembalikan ke Saldo Akun Anda.
                                                
silahkan cek status transaksi kamu di '.$urlweb.'/cektrx/?trxNum='.$merchantRef.'

Daftar jadi member bayar pakai Saldo Lebih Murah
Klik: '.$urlweb.'/register/
                                
Jika ada kendala, silahkan hubungi Layanan CS :
WA/TELEGRAM : '.$su['no_hp'];

                $getBalance = mysqli_query($conn,"SELECT * FROM `tb_balance` WHERE userID = '$userIDnya'") or die(mysqli_error());
                $gb = mysqli_fetch_array($getBalance);
                $saldoAktif = $gb['active'];
                $newSaldo = $saldoAktif - $subtotal;

                if($metodeBayar == 999){

                    if($newSaldo < 0){
                        if($ct['status'] == 0){
                            $update = mysqli_query($conn,"UPDATE `tb_order` SET status = 3 WHERE kd_transaksi = '$merchantRef'") or die(mysqli_error());
                            $update1 = mysqli_query($conn,"UPDATE `tb_transaksi` SET status = 3, note = 'Saldo Tidak Cukup' WHERE kd_transaksi = '$merchantRef'") or die(mysqli_error());
                        }
                    }
                    else {
                        if($ct['status'] == 0){
                            $update2 = mysqli_query($conn,"UPDATE `tb_balance` SET active = active - '$subtotal', pending = pending + '$subtotal' WHERE userID = '$userIDnya'") or die(mysqli_error());
                            $update = mysqli_query($conn,"UPDATE `tb_order` SET status = 1 WHERE kd_transaksi = '$merchantRef'") or die(mysqli_error());
                            $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$merchantRef','$created_date','Pembelian Produk $productTitle','$subtotal',0,'Pembelian Produk $productTitle', '$providerID','$jenis_transaksi','999','$userIDnya',1)") or die(mysqli_error());

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
                                       'target' => $noHp,
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

                            if($providerID == 4){
                                $sql_4 = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 4") or die(mysqli_error());
                                $s4 = mysqli_fetch_array($sql_4);
                                $apiKeys = $s4['api_key'];
                                $merchantCodes = $s4['merchant_code'];
                                $signe = $merchantCodes.$apiKeys;
                                $urlRequest = $s4['urlRequest'];
                                $sign = md5($signe);
                                $curl1 = curl_init();

                                if($jenis_transaksi == 1){
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
                                        CURLOPT_POSTFIELDS => array('key' => $apiKeys, 'sign' => $sign, 'type' => 'order', 'service' => $servicess, 'data_no' => $dataNo, 'data_zone' => $dataZone),
                                    ));
                                                    
                                    $response1 = curl_exec($curl1);
                                                    
                                    curl_close($curl1);
                                    $hasil = json_decode($response1, true);
                                    $orderid = $hasil['data']['trxid'];
                                    $order_status = $hasil['data']['status'];
                                }
                                else if($jenis_transaksi == 2){
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
                                        CURLOPT_POSTFIELDS => array('key' => $apiKeys, 'sign' => $sign, 'type' => 'order', 'service' => $servicess, 'data_no' => $dataNo),
                                    ));
                                                    
                                    $response1 = curl_exec($curl1);
                                                    
                                    curl_close($curl1);
                                    $hasil = json_decode($response1, true);
                                    $orderid = $hasil['data']['trxid'];
                                    $order_status = $hasil['data']['status'];
                                }

                                if($hasil['result'] == true){
                                    $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `trxID` = '$orderid', status_order = '$order_status' WHERE kd_transaksi = '$merchantRef'") or die(mysqli_error($conn));
                                }
                                else {
                                    $message = $hasil['message'];
                                    $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$merchantRef','$created_date','Pengembalian Dana','$subtotal',0,'Pengembalian Dana', '$providerID','3','$payment_method','$userIDnya',1)") or die(mysqli_error($conn));
                                    $update1 = mysqli_query($conn,"UPDATE `tb_balance` SET `active` = active + '$subtotal', `pending` = pending - '$subtotal' WHERE userID = '$userIDnya'") or die(mysqli_error($conn));
                                    $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `status` = 3, `note` = '$message' WHERE kd_transaksi = '$merchantRef'") or die(mysqli_error($conn));

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
                                $sql_4 = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 5") or die(mysqli_error());
                                $s4 = mysqli_fetch_array($sql_4);
                                $apiKeys = $s4['api_key'];
                                $merchantCodes = $s4['merchant_code'];
                                $urlRequest = $s4['urlRequest'];
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
                                }

                                if($order_status != 'Gagal'){
                                    $update3 = mysqli_query($conn,"UPDATE `tb_order` SET status_order = '$order_status', `note` = '$message' WHERE kd_transaksi = '$merchantRef'") or die(mysqli_error($conn));
                                }
                                else {
                                    $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `status` = 3, `note` = '$message' WHERE kd_transaksi = '$merchantRef'") or die(mysqli_error($conn));
                                    $update1 = mysqli_query($conn,"UPDATE `tb_balance` SET `active` = active + '$subtotal', `pending` = pending - '$subtotal' WHERE userID = '$userIDnya'") or die(mysqli_error($conn));
                                    $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$merchantRef','$created_date','Pengembalian Dana','$subtotal',0,'Pengembalian Dana', '$providerID','3','999','$userIDnya',1)") or die(mysqli_error());

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
                                    echo $response1;
                                    curl_close($curl1);
                                    $hasil = json_decode($response1, true);
                                }
        
                                $message = $hasil['sn'];
                                $order_status = $hasil['status'];
        
                                if($order_status != 'Gagal'){
                                    $orderid = $hasil['trx_id'];
                                    $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `trxID` = '$orderid', status_order = '$order_status', note = '$message' WHERE kd_transaksi = '$merchantRef'") or die(mysqli_error($conn));
                                }
                                else {
                                    $update1 = mysqli_query($conn,"UPDATE `tb_balance` SET `active` = active + '$amount' WHERE userID = '$userID'") or die(mysqli_error($conn));
                                    $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `status` = 3, `note` = '$message' WHERE kd_transaksi = '$merchantRef'") or die(mysqli_error($conn));
                                    $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$merchantRef','$created_date','Pengembalian Dana','$amount',0,'Pengembalian Dana', '$providerID','3','100','$userID',2)") or die(mysqli_error());
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
                                $sql_4 = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 9") or die(mysqli_error());
                                $s4 = mysqli_fetch_array($sql_4);
                                $apiKeys = $s4['api_key'];
                                $merchantCodes = $s4['merchant_code'];
                                $urlRequest = $s4['urlRequest'];
                                $signe = $merchantCodes.$apiKeys;
                                $sign = md5($signe);

                                if($jenis_transaksi == 1){
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

                                    if ($hasil['status'] == 0) {
                                        $order_status = $hasil['error_msg'];
                                        $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `status` = 3, `note` = '$order_status' WHERE kd_transaksi = '$merchantRef'") or die(mysqli_error($conn));
                                        $update1 = mysqli_query($conn,"UPDATE `tb_balance` SET `active` = active + '$subtotal', `pending` = pending - '$subtotal' WHERE userID = '$userIDnya'") or die(mysqli_error($conn));
                                        $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$merchantRef','$created_date','Pengembalian Dana','$subtotal',0,'Pengembalian Dana','$providerID','3','999','$userIDnya',1)") or die(mysqli_error());
                                    }
                                    else {
                                        $orderid = $hasil['data']['trxid'];
                                        $order_status = $hasil['data']['status'];
                                        $note = $hasil['data']['sn'];
                                        $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `trxID` = '$orderid', status_order = '$order_status', note = '$note' WHERE kd_transaksi = '$merchantRef'") or die(mysqli_error($conn));
                                    }
                                }
                            }
                        }

                        header('location:../thank-you/?trxID='.$merchantRef.'&notif=1');
                        exit();
                    }

                }
                else {
                    $update = mysqli_query($conn,"UPDATE `tb_order` SET status = 3 WHERE kd_transaksi = '$merchantRef'") or die(mysqli_error());
                    $update1 = mysqli_query($conn,"UPDATE `tb_transaksi` SET status = 3, note = 'Saldo Tidak Cukup' WHERE kd_transaksi = '$merchantRef'") or die(mysqli_error());
                    $delete = mysqli_query($conn,"UPDATE `tb_user` SET status = 3 WHERE cuid = '$userIDnya'") or die(mysqli_error());
                    $_SESSION['user'] == '';
                    unset($_SESSION['user']);
                    session_destroy();
                    header('location:../thank-you/?trxID='.$merchantRef.'&notif=2');
                    exit();
                }
            }
            else{
                header('location:../thank-you/?trxID='.$merchantRef.'&notif=1');
                exit();
            }
        }
    }
    else {
        header('location:../order_saldo/?trxID='.$merchantRef.'&notif=1');
        exit();
    } 
    
?>