<?php
require_once('session.php');

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

$sql_1b = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE cuid = 1") or die(mysqli_error());
$s1b = mysqli_fetch_array($sql_1b);
$sellerPhone = substr($s1b['no_hp'],1);
$sellerWa = $s1b['no_hp'];

$unik = date('Hs');
$kode_unik = substr(str_shuffle(1234567890),0,3);
$kd_transaksi = 'INV'.$unik.$kode_unik.'TOP';
$created_date = date('Y-m-d H:i:s');
$created_dates = date('Y-m-d');
$created_datess = date('Y-m-d H:i');

$email = $u['email'];
$full_name = $u['full_name'];
$explode = explode(' ',$full_name);
$noHp = $u['no_hp'];
$level = $u['level'];

$usersID = $u['cuid'];
$amounts = $_POST['nominal'];
$abc = $_POST['metode'];
$getPayment = mysqli_query($conn,"SELECT * FROM `tb_bank` WHERE cuid = '$abc'") or die(mysqli_error());
$gp = mysqli_fetch_array($getPayment);
$paymentID = $gp['provider'];
$bankCode = $gp['code'];
$bankName = $gp['akun'];
$noRek = $gp['no_rek'];
$pemilik = $gp['pemilik'];

$subtotale = $amounts + $kode_unik;

$cekCape = mysqli_query($conn,"SELECT * FROM `tb_transaksi` WHERE userID = '$usersID' AND providerID = 0 AND status = 0 AND date LIKE '$created_datess%'") or die(mysqli_error());
$ccc = mysqli_num_rows($cekCape);
if($ccc == 0){
    if($paymentID == 0){
        $expired_time = date('Y-m-d H:i:s', strtotime('+1 days'));
        $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$kd_transaksi','$created_date','Top Up Saldo','$amounts',0,'Top Up Saldo', '0','1','$abc','$usersID',0)") or die(mysqli_error());
        $insert_tripay = mysqli_query($conn,"INSERT INTO `tb_tripay` (`userID`, `reference`, `merchant_ref`, `payment_method`, `payment_name`, `customer_email`, `customer_phone`, `amount`, `fee`, `amount_total`, `pay_code`, `checkout_url`, `status`, `paid_time`, `expired_time`, `providerID`, `jenis_transaksi`, `created_date`) VALUES ('$usersID', '', '$kd_transaksi', '$bankCode', '$bankName', '$email', '$noHp', '$amounts', '$kode_unik', '$subtotale', '$noRek a/n $pemilik', '', 'UNPAID', '0000-00-00 00:00:00', '$expired_time', '0', 0, '$created_date')") or die(mysqli_error($conn));
        $cekFonnte = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 8") or die(mysqli_error());
        $cf = mysqli_fetch_array($cekFonnte);
        if($cf['status'] == 1){
            $content = '*Terima Kasih. Permintaan Top Up Saldo Dibuat*
Silahkan melakukan pembayaran sesuai dengan nominal, nomor rekening, dan bank dibawah ini:
                                
*Nominal :* Rp. ' . $subtotale . '
*Bank :* ' . $bankName . '
*Rekening :* ' . $noRek . ' a/n ' .$pemilik. '
*Berlaku Sampai :* ' . $expired_time . '
                                                
Jika kamu sudah melakukan pembayaran, Saldo akan * Otomatis * Ditambahkan pada Saldo Akun Anda
                                
Jika ada kendala, silahkan hubungi Layanan CS :
WA/TELEGRAM : '.$sellerWa;
            
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
        header('Location:../payment/?trxID='.$kd_transaksi);
        exit();

    }
    else if($paymentID == 1){
        $sql_5 = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 1") or die(mysqli_error());
        $s5 = mysqli_fetch_array($sql_5);
        $privateKey = $s5['private_key'];
        $tripayApi = $s5['api_key'];
        $tripayCode = $s5['merchant_code'];
        $urlRequest = $s5['urlRequest'];

        $cektrx = mysqli_query($conn,"SELECT * FROM `tb_tripay` WHERE merchant_ref = '$kd_transaksi'") or die(mysqli_error($conn));
        $ct = mysqli_num_rows($cektrx);
        if($ct == 0){
            $signature = hash_hmac('sha256', $tripayCode.$kd_transaksi.$amounts, $privateKey);
            $data = [
                'method'            => $bankCode,
                'merchant_ref'      => $kd_transaksi,
                'amount'            => $amounts,
                'customer_name'     => $full_name,
                'customer_email'    => $email,
                'customer_phone'    => $noHp,
                'order_items'       => [
                    [
                        'sku'         => $kd_transaksi,
                        'name'        => 'Pembayaran Nomor Transaksi '.$kd_transaksi,
                        'price'       => $amounts,
                        'quantity'    => 1
                    ]
                ],
                'callback_url'      => $urlweb.'/tripay_response.php',
                'return_url'        => $urlweb,
                'expired_time'      => (time()+(24*60*60)), // 24 jam
                'signature'         => $signature
            ];
                                                            
            $curl = curl_init();
                                           
            curl_setopt_array($curl, array(
                CURLOPT_FRESH_CONNECT     => true,
                CURLOPT_URL               => $urlRequest."/transaction/create",
                CURLOPT_RETURNTRANSFER    => true,
                CURLOPT_HEADER            => false,
                CURLOPT_HTTPHEADER        => array(
                    "Authorization: Bearer ".$tripayApi
                ),
                CURLOPT_FAILONERROR       => false,
                CURLOPT_POST              => true,
                CURLOPT_POSTFIELDS        => http_build_query($data)
            ));
                                                                                                        
            $response = curl_exec($curl);
            $err = curl_error($curl);
                                                                                                        
            curl_close($curl);                                                           
            $hasil = json_decode($response, true);

            $reference = $hasil['data']['reference'];
            $merchant_ref = $hasil['data']['merchant_ref'];
            $payment_method = $hasil['data']['payment_method'];
            $payment_name = $hasil['data']['payment_name'];
            $customer_email = $hasil['data']['customer_email'];
            $customer_phone = $hasil['data']['customer_phone'];
            $amount = $amounts;
            $fee = $hasil['data']['total_fee'];
            $amount_total = $amounts+ $fee;
            $pay_code = $hasil['data']['pay_code'];
            $checkout_url = $hasil['data']['checkout_url'];
            $status = $hasil['data']['status'];
            $expired_time = date('Y-m-d H:i:s', strtotime('+1 days'));

            $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$kd_transaksi','$created_date','Top Up Saldo','$amounts',0,'Top Up Saldo', '0','1','$abc','$usersID',0)") or die(mysqli_error());

            $insert_tripay = mysqli_query($conn,"INSERT INTO `tb_tripay` (`userID`, `reference`, `merchant_ref`, `payment_method`, `payment_name`, `customer_email`, `customer_phone`, `amount`, `fee`, `amount_total`, `pay_code`, `checkout_url`, `status`, `paid_time`, `expired_time`, `providerID`, `jenis_transaksi`, `created_date`) VALUES ('$usersID', '$reference', '$merchant_ref', '$payment_method', '$payment_name', '$email', '$noHp', '$amount', '$fee', '$amount_total', '$pay_code', '$checkout_url', 'UNPAID', '0000-00-00 00:00:00', '$expired_time', '0', 0, '$created_date')") or die(mysqli_error($conn));

            $cekFonnte = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 8") or die(mysqli_error());
            $cf = mysqli_fetch_array($cekFonnte);
            if($cf['status'] == 1){
                if($payment_method == 'QRISC' || $payment_method == 'QRIS' || $payment_method == 'QRIS2' || $payment_method == 'QRISCOP' || $payment_method == 'QRISD' || $payment_method == 'QRISNOBU'){
                    $caraBayar = $urlweb.'/payment/?trxID='.$kd_transaksi;
                }
                else if($payment_method == 'OVO'){
                    $caraBayar = $checkout_url;
                }
                else {
                    $caraBayar = $pay_code;
                }
                $content = '*Terima Kasih. Permintaan Top Up Saldo Dibuat
Silahkan melakukan pembayaran sesuai dengan nominal, nomor rekening, dan bank dibawah ini:
                                
*Nominal :* Rp. ' . $amount_total . '
*Bank :* ' . $payment_method . '
*Rekening :* ' . $caraBayar. '
*Berlaku Sampai :* ' . $expired_time . '
                                                
Jika kamu sudah melakukan pembayaran, Saldo akan * Otomatis * Ditambahkan pada Saldo Akun Anda
                                
Jika ada kendala, silahkan hubungi Layanan CS :
WA/TELEGRAM : '.$sellerWa;
            
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
            header('Location:../payment/?trxID='.$kd_transaksi);
            exit();
        }
        else {
            header('Location:../payment/?trxID='.$kd_transaksi);
            exit();
        }
    }
    else if($paymentID == 2){
        
    }
    else if($paymentID == 3){
        $sql_5 = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 3") or die(mysqli_error());
        $s5 = mysqli_fetch_array($sql_5);
        $privateKey = $s5['private_key'];
        $tripayApi = $s5['api_key'];
        $tripayCode = $s5['merchant_code'];
        $urlRequest = $s5['urlRequest'];
        $callbackUrl = $urlwebs.'/duitku_response/'; // url untuk callback
        $returnUrl = $urlwebs; // url untuk redirect
        $expiryPeriod = 60;
        $expired_time = date('Y-m-d H:i:s', strtotime('+60 Minutes', strtotime($created_date)));

        $cektrx = mysqli_query($conn,"SELECT * FROM `tb_tripay` WHERE merchant_ref = '$kd_transaksi'") or die(mysqli_error($conn));
        $ct = mysqli_num_rows($cektrx);
        if($ct == 0){
            $signature = md5($tripayCode . $kd_transaksi . $subtotal . $tripayApi);
            $catatan = 'Pembelian dengan No. Pesanan '.$kd_transaksi;

            $customerDetail = array(
                'firstName' => $explode[0],
                'lastName' => $explode[1],
                'email' => $email,
                'phoneNumber' => $noHp,
                'billingAddress' => '',
                'shippingAddress' => ''
            );
    
            $params = array(
                'merchantCode' => $tripayCode,
                'paymentAmount' => $subtotal,
                'paymentMethod' => $bankCode,
                'merchantOrderId' => $kd_transaksi,
                'productDetails' => $catatan,
                'additionalParam' => '',
                'merchantUserInfo' => '',
                'customerVaName' => $full_name,
                'email' => $email,
                'phoneNumber' => $noHp,
                'itemDetails' => '',
                'customerDetail' => $customerDetail,
                'callbackUrl' => $callbackUrl,
                'returnUrl' => $returnUrl,
                'signature' => $signature,
                'expiryPeriod' => $expiryPeriod
            );
    
            $params_string = json_encode($params);
            echo $params_string;
            $url = $urlRequest.'/v2/inquiry';
            $ch = curl_init();
    
            curl_setopt($ch, CURLOPT_URL, $url); 
            curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");                                                                     
            curl_setopt($ch, CURLOPT_POSTFIELDS, $params_string);                                                                  
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);                                                                      
            curl_setopt($ch, CURLOPT_HTTPHEADER, array(                                                                          
                'Content-Type: application/json',                                                                                
                'Content-Length: ' . strlen($params_string))                                                                       
            );   
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
    
            //execute post
            $request = curl_exec($ch);
            $err = curl_error($ch);
            $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            if($httpCode == 200){
                $result = json_decode($request, true);
                //header('location: '. $result['paymentUrl']);
                $checkout_url = $result['paymentUrl'];
                $reference = $result['reference'];
                $pay_code = $result['vaNumber'];
                $statusMessage = $result['statusCode'];
                if($statusMessage == 00){
                    $statusCode = 'SUCCESS';
                }
                else if($statusMessage == 01){
                   $statusCode = 'PENDING'; 
                }
                else if($statusMessage == 02){
                    $statusCode = 'EXPIRED';
                }

                if($bankCode == 'OV'){
                    $a = ($amounts * 1.67)/100;
                    $adminFee = round($a);
                    $amount_total = $amounts + $adminFee;
                }
                else if($bankCode == 'SP'){
                    $a = ($amounts * 2)/100;
                    $adminFee = round($a);
                    $amount_total = $amounts + $adminFee;
                }
                else if($bankCode == 'LA'){
                    $a = ($amounts * 1.67)/100;
                    $adminFee = round($a);
                    $amount_total = $amounts + $adminFee;
                }
                else if($bankCode == 'SA'){
                    $a = ($amounts * 4)/100;
                    $adminFee = round($a);
                    $amount_total = $amounts + $adminFee;
                }
                else if($bankCode == 'DA'){
                    $a = ($amounts * 1.67)/100;
                    $adminFee = round($a);
                    $amount_total = $amounts + $adminFee;
                }
                else if($bankCode == 'AG'){
                    $adminFee = 1500;
                    $amount_total = $amounts + $adminFee;
                }
                else if($bankCode == 'M2'){
                    $adminFee = 4000;
                    $amount_total = $amounts + $adminFee;
                }
                else if($bankCode == 'BC'){
                    $adminFee = 5000;
                    $amount_total = $amounts + $adminFee;
                }
                else if($bankCode == 'FT'){
                    $adminFee = 2500;
                    $amount_total = $amounts + $adminFee;
                }
                else{
                    $adminFee = 3000;
                    $amount_total = $amounts + $adminFee;
                }
                
                $insert_transaksi = mysqli_query($conn,"INSERT INTO `tb_transaksi` (`kd_transaksi`, `date`, `transaksi`, `total`, `saldo`, `note`, `providerID`, `jenis`, `metode`, `userID`, `status`) VALUES ('$kd_transaksi','$created_date','Top Up Saldo','$amounts',0,'Top Up Saldo', '0','1','$abc','$usersID',0)") or die(mysqli_error());

                $insert_tripay = mysqli_query($conn,"INSERT INTO `tb_tripay` (`userID`, `reference`, `merchant_ref`, `payment_method`, `payment_name`, `customer_email`, `customer_phone`, `amount`, `fee`, `amount_total`, `pay_code`, `checkout_url`, `status`, `paid_time`, `expired_time`, `providerID`, `jenis_transaksi`, `created_date`) VALUES ('$usersID', '$reference', '$kd_transaksi', '$bankCode', '$bankName', '$email', '$noHp', '$amounts', '$adminFee', '$amount_total', '$pay_code', '$checkout_url', 'UNPAID', '0000-00-00 00:00:00', '$expired_time', '0', 0, '$created_date')") or die(mysqli_error($conn));

                $cekFonnte = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 8") or die(mysqli_error());
                $cf = mysqli_fetch_array($cekFonnte);
                if($cf['status'] == 1){
                    if($bankCode == 'OV' || $bankCode == 'SP' || $bankCode == 'LA' || $bankCode == 'SA' || $bankCode == 'DA'){
                        $caraBayar = $checkout_url;
                    }
                    else {
                        $caraBayar = $vaNumber;
                    }
                    $content = '*Terima Kasih. Permintaan Top Up Saldo Dibuat
Silahkan melakukan pembayaran sesuai dengan nominal, nomor rekening, dan bank dibawah ini:
                                
*Nominal :* Rp. ' . $amount_total . '
*Bank :* ' . $bankName . '
*Rekening :* ' . $caraBayar. '
*Berlaku Sampai :* ' . $expired_time . '
                                                
Jika kamu sudah melakukan pembayaran, Saldo akan * Otomatis * Ditambahkan pada Saldo Akun Anda
                                
Jika ada kendala, silahkan hubungi Layanan CS :
WA/TELEGRAM : '.$sellerWa;
            
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
            header('Location:../payment/?trxID='.$kd_transaksi);
            exit();
        }
    }
}
else {
    $cc = mysqli_fetch_array($cekCape);
    $transactionID = $cc['kd_transaksi'];
    header('Location:../payment/?trxID='.$transactionID);
    exit();
}
?>