<?php
include('../config/koneksi.php');
$created_date = date('Y-m-d H:i:s');
$sql_0 = mysqli_query($conn,"SELECT * FROM `tb_seo` WHERE cuid = 1") or die(mysqli_error());
$s0 = mysqli_fetch_array($sql_0);
$urlweb = $s0['urlweb'];
$logoweb = $s0['image'];

$sql_user = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE cuid = 1") or die(mysqli_error());
$su = mysqli_fetch_array($sql_user);

$cektrx1 = mysqli_query($conn,"SELECT * FROM `tb_order` WHERE `status` = 1 AND `providerID` = 4") or die(mysqli_error());
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
  
    $sql_5 = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 4") or die(mysqli_error());
    $s5 = mysqli_fetch_array($sql_5);
    $merchantCodes = $s5['merchant_code'];
    $apiKey = $s5['api_key'];
    $urlRequest = $s5['urlRequest'];
    $signe = $merchantCodes.$apiKey;
    $sign = md5($signe);

    if($jenisnya == 1){
        $curl = curl_init();
        
        curl_setopt_array($curl, array(
            CURLOPT_URL => $urlRequest.'/game-feature',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => array(
                'key' => $apiKey,
                'sign' => $sign,
                'type' => 'status',
                'trxid' => $txID
            ),
        ));
        $response = curl_exec($curl);
                  
        curl_close($curl);
        //echo $response;
        $hasil = json_decode($response, true);
    }
    else if($jenisnya == 2){
        $curl = curl_init();
        
        curl_setopt_array($curl, array(
            CURLOPT_URL => $urlRequest.'/prepaid',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => array(
                'key' => $apiKey,
                'sign' => $sign,
                'type' => 'status',
                'trxid' => $txID
            ),
        ));
        $response = curl_exec($curl);
                  
        curl_close($curl);
        //echo $response;
        $hasil = json_decode($response, true);
    }

    $order_status = $hasil['data'][0]['status'];
    $order_note = str_replace(array( "’","'" ),"&apos;",$hasil['data'][0]['note']);

    if($statusOrder == 'waiting'){
        if($order_status == 'success'){
            if($metode == 999){
                $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `status` = 2, `status_order` = '$order_status', `note` = '$order_note' WHERE kd_transaksi = '$trxID'") or die(mysqli_error($conn));
                $update = mysqli_query($conn,"UPDATE `tb_balance` SET `payout` = payout + '$total', `pending` = pending - '$total' WHERE userID = '$usersID'") or die(mysqli_error($conn));
                $update5 = mysqli_query($conn,"UPDATE `tb_user` SET `poin` = poin + '$poinnya' WHERE cuid = '$usersID'") or die(mysqli_error($conn));
                $update4 = mysqli_query($conn,"UPDATE `tb_balance` SET `active` = active + '$komisinya' WHERE userID = '$uplineID'") or die(mysqli_error($conn));
                $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$trxID','$created_date','Komisi','$komisinya',0,'Komisi Affiliasi', '$usersID','4','999','$uplineID',2)") or die(mysqli_error());
            }
            else {
                $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `status` = 2, `status_order` = '$order_status', `note` = '$order_note' WHERE kd_transaksi = '$trxID'") or die(mysqli_error($conn));
                $update5 = mysqli_query($conn,"UPDATE `tb_user` SET `poin` = poin + '$poinnya' WHERE cuid = '$usersID'") or die(mysqli_error($conn));
                $update4 = mysqli_query($conn,"UPDATE `tb_balance` SET `active` = active + '$komisinya' WHERE userID = '$uplineID'") or die(mysqli_error($conn));
                $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$trxID','$created_date','Komisi','$komisinya',0,'Komisi Affiliasi', '$usersID','4','999','$uplineID',2)") or die(mysqli_error());
            }
            $content = '*Terima Kasih* Pesanan Anda Berhasil Diproses, berikut detail pesanan Anda :
                                                
No. Transaksi : '.$trxID.'                                                
Produk : '.$title.'
Data Tujuan : '.$userIDnya.' - '.$zoneID.'
Catatan : '.$order_note.'
                                
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
        else if($order_status == 'error'){
            if($metode == 'saldo'){
                $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `status` = 3, `status_order` = 'failed', `note` = '$order_note' WHERE kd_transaksi = '$trxID'") or die(mysqli_error($conn));
                $update = mysqli_query($conn,"UPDATE `tb_balance` SET `active` = active + '$total', `pending` = pending - '$total' WHERE userID = '$usersID'") or die(mysqli_error($conn));
                $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$trxID','$created_date','Refund','$total',0,'Pengembalian Dana', '$providerID','3','999','$usersID',2)") or die(mysqli_error());
            }
            else {
                $update3 = mysqli_query($conn,"UPDATE `tb_order` SET `status` = 3, `status_order` = 'failed', `note` = '$order_note' WHERE kd_transaksi = '$trxID'") or die(mysqli_error($conn));
                $update = mysqli_query($conn,"UPDATE `tb_balance` SET `active` = active + '$total' WHERE userID = '$usersID'") or die(mysqli_error($conn));
                $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$trxID','$created_date','Refund','$total',0,'Pengembalian Dana', '$providerID','3','$metode','$usersID',2)") or die(mysqli_error());
            }
            $content = '*Terima Kasih* *Pesanan Anda Gagal* Pesanan Anda Gagal Diproses dikarenakan produk sedang Cut Off/Gangguan, Dana Telah dikembalikan ke Saldo Akun Anda.
Berikut detail pesanan Anda :
                                                
No. Transaksi : '.$trxID.'                                                
Produk : '.$title.'
Data Tujuan : '.$userIDnya.' - '.$zoneID.'
Catatan : '.$order_note.'
                                
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
}
?>