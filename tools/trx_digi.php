<?php
include('../config/koneksi.php');
$created_date = date('Y-m-d H:i:s');
$sql_0 = mysqli_query($conn,"SELECT * FROM `tb_seo` WHERE cuid = 1") or die(mysqli_error());
$s0 = mysqli_fetch_array($sql_0);
$urlweb = $s0['urlweb'];
$logoweb = $s0['image'];

$sql_user = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE cuid = 1") or die(mysqli_error());
$su = mysqli_fetch_array($sql_user);

$cektrx1 = mysqli_query($conn,"SELECT * FROM `tb_order` WHERE `status` = 1 AND `providerID` = 5") or die(mysqli_error());
$a=0;
while($cts1 = mysqli_fetch_array($cektrx1)){
    $a++;
    $b = $a-1;
    $usersID = $cts1['id_user'];
    $total = $cts1['sub_total'];
    $trxID = $cts1['kd_transaksi'];
    $metode = $cts1['metode'];
    $phone = $cts1['no_hp'];
    $txID = $cts1['trxID'];
    $kategori = $cts1['kategori'];
    $title = $cts1['title'];
    $userIDnya = $cts1['userID'];
    $zoneID = $cts1['zoneID'];
    $nickname = $cts1['nickname'];
    $statusOrder = $cts1['status_order'];
    $statusTrx = $cts1['status'];
    $catatan = $cts1['note'];
    $jenisnya = $cts1['jenis'];
    $providerID = $cts1['providerID'];
    $produkID = $cts1['produkID'];
    $ipaddress = $cts1['ipaddress'];
    $komisinya = $cts1['komisi'];
    $poinnya = $cts1['poin'];
    $paymentID = date('Ymds').$usersID;

    $cekAffiliate = mysqli_query($conn,"SELECT * FROM `tb_affiliate` WHERE ip = '$ipaddress' AND trxID = '' ORDER BY cuid DESC LIMIT 1") or die(mysqli_error());
    $ca = mysqli_num_rows($cekAffiliate);
    if($ca > 0){
        $caa = mysqli_fetch_array($cekAffiliate);
        $usernya = $caa['user'];
        $getUser = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE user = '$usernya'") or die(mysqli_error());
        $gu = mysqli_fetch_array($getUser);
        $uplineID = $gu['cuid'];
        $update = mysqli_query($conn,"UPDATE `tb_affiliate` SET trxID = '$trxID' WHERE ip = '$ipaddress' AND user = '$usernya'") or die(mysqli_error());
    }
    else {
        $getUser = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE cuid = '$usersID'") or die(mysqli_error());
        $gu = mysqli_fetch_array($getUser);
        $uplineID = $gu['uplineID'];
    }

    $sql_5 = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 5") or die(mysqli_error());
    $s5 = mysqli_fetch_array($sql_5);
    $merchantCodes = $s5['merchant_code'];
    $apiKey = $s5['api_key'];
    $urlRequest = $s5['urlRequest'];
    $signe = $merchantCodes.$apiKey.$trxID;
    $sign = md5($signe);

    if($jenisnya == 1){
        $sql_1 = mysqli_query($conn,"SELECT * FROM `tb_produk` WHERE cuid = '$produkID'") or die(mysqli_error());
        $s1 = mysqli_fetch_array($sql_1);
        $productCode = $s1['code'];
        $productCategory = $s1['kategori'];
        $productTitle = $s1['title'];

        $params = array(
            'username' => $merchantCodes,
            'buyer_sku_code' => $productCode,
            'customer_no' => $userIDnya.$zoneID,
            'ref_id' => $trxID,
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
        //echo $response1;
        curl_close($ch1);
        $hasil = json_decode($response1, true);
    }
    else if($jenisnya == 2){
        $sql_1 = mysqli_query($conn,"SELECT * FROM `tb_prepaid` WHERE cuid = '$produkID'") or die(mysqli_error());
        $s1 = mysqli_fetch_array($sql_1);
        $productCode = $s1['code'];
        $productCategory = $s1['brand'];
        $productTitle = $s1['title'];

        $params = array(
            'username' => $merchantCodes,
            'buyer_sku_code' => $productCode,
            'customer_no' => $userIDnya,
            'ref_id' => $trxID,
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
        // echo $response1;
        curl_close($ch1);
        $hasil = json_decode($response1, true);
    }
    else if($jenisnya == 4){
        $sql_1 = mysqli_query($conn,"SELECT * FROM `tb_pascabayar` WHERE cuid = '$produkID'") or die(mysqli_error());
        $s1 = mysqli_fetch_array($sql_1);
        $productCode = $s1['code'];
        $productCategory = $s1['kategori'];
        $productTitle = $s1['title'];

        $params = array(
            'commands' => 'status-pasca',
            'username' => $merchantCodes,
            'buyer_sku_code' => $productCode,
            'customer_no' => $userIDnya,
            'ref_id' => $trxID,
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
        // echo $response1;
        curl_close($ch1);
        $hasil = json_decode($response1, true);
    }

    $order_status = $hasil['data']['status'];
    $message = $hasil['data']['message'];
    $notes = $message.'<br>SN : '.str_replace(array( "’","'" ),"&apos;",$hasil['data']['sn']);

    if($order_status == 'Sukses'){
        if($metode == 999){
            $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `status` = 2, `status_order` = '$order_status', `note` = '$notes' WHERE kd_transaksi = '$trxID'") or die(mysqli_error($conn));
            $update = mysqli_query($conn,"UPDATE `tb_balance` SET `payout` = payout + '$total', `pending` = pending - '$total' WHERE userID = '$usersID'") or die(mysqli_error($conn));
            $update5 = mysqli_query($conn,"UPDATE `tb_user` SET `poin` = poin + '$poinnya' WHERE cuid = '$usersID'") or die(mysqli_error($conn));
            $update4 = mysqli_query($conn,"UPDATE `tb_balance` SET `active` = active + '$komisinya' WHERE userID = '$uplineID'") or die(mysqli_error($conn));
            $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$trxID','$created_date','Komisi','$komisinya',0,'Komisi Affiliasi', '$usersID','4','999','$uplineID',2)") or die(mysqli_error());
        }
        else {
            $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `status` = 2, `status_order` = '$order_status', `note` = '$notes' WHERE kd_transaksi = '$trxID'") or die(mysqli_error($conn));
            $update5 = mysqli_query($conn,"UPDATE `tb_user` SET `poin` = poin + '$poinnya' WHERE cuid = '$usersID'") or die(mysqli_error($conn));
            $update4 = mysqli_query($conn,"UPDATE `tb_balance` SET `active` = active + '$komisinya' WHERE userID = '$uplineID'") or die(mysqli_error($conn));
            $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$trxID','$created_date','Komisi','$komisinya',0,'Komisi Affiliasi', '$usersID','4','999','$uplineID',2)") or die(mysqli_error());
        }
        $content = '*Terima Kasih* Pesanan Anda Berhasil Diproses, berikut detail pesanan Anda :
                                                
No. Transaksi : '.$trxID.'                                                
Produk : '.$title.'
Data Tujuan : '.$userIDnya.' - '.$zoneID.'
Catatan : '.$notes.'
                                
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
                   'target' => $phone,
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
    else if($order_status == 'Gagal'){
        if($metode == 999){
            $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `status` = 3, `status_order` = 'failed', `note` = '$message' WHERE kd_transaksi = '$trxID'") or die(mysqli_error($conn));
            $update = mysqli_query($conn,"UPDATE `tb_balance` SET `active` = active + '$total', `pending` = pending - '$total' WHERE userID = '$usersID'") or die(mysqli_error($conn));
            $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$trxID','$created_date','Refund','$total',0,'Pengembalian Dana', '$providerID','3','999','$usersID',2)") or die(mysqli_error());
        }
        else {
            $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `status` = 3, `status_order` = 'failed', `note` = '$message' WHERE kd_transaksi = '$trxID'") or die(mysqli_error($conn));
            $update = mysqli_query($conn,"UPDATE `tb_balance` SET `active` = active + '$total' WHERE userID = '$usersID'") or die(mysqli_error($conn));
            $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$trxID','$created_date','Refund','$total',0,'Pengembalian Dana', '$providerID','3','$metode','$usersID',2)") or die(mysqli_error());
        }
        $content = '*Terima Kasih* *Pesanan Anda Gagal* Pesanan Anda Gagal Diproses dikarenakan produk sedang Cut Off/Gangguan, Dana Telah dikembalikan ke Saldo Akun Anda.
Berikut detail pesanan Anda :
                                                
No. Transaksi : '.$trxID.'                                                
Produk : '.$title.'
Data Tujuan : '.$userIDnya.' - '.$zoneID.'
Catatan : '.$message.'
                                
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
                   'target' => $phone,
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
?>