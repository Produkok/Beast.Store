<?php
ob_start();
session_start();
date_default_timezone_set("Asia/Jakarta");
include('config/koneksi.php');
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

$sql_0 = mysqli_query($conn,"SELECT * FROM `tb_seo` WHERE cuid = 1") or die(mysqli_error());
$s0 = mysqli_fetch_array($sql_0);
$urlweb = $s0['urlweb'];
$urlwebs = $s0['urlweb'];

$sql_1b = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE cuid = 1") or die(mysqli_error());
$s1b = mysqli_fetch_array($sql_1b);
$sellerPhone = substr($s1b['no_hp'],1);
$sellerWa = $s1b['no_hp'];

$unik = date('Hs');
$kode_unik = substr(str_shuffle(1234567890),0,3);
$kd_transaksi = 'INV'.$unik.$kode_unik.'PAY';
$created_date = date('Y-m-d H:i:s');
$created_dates = date('Y-m-d');
$created_datess = date('Y-m-d H:i');

$userID = $_POST['userID'];
if(isset($_POST['zone_id'])){
    $zone_id = $_POST['zone_id'];
}
else {
    $zone_id = '';
}
if(isset($_POST['nickname'])){
    $nickname = str_replace(array( "’","'" ),"&apos;",$_POST['nickname']);
}
else {
    $nickname = '';
}

//About User
$ipaddress = $_POST['ipaddress'];
$last_id = $_POST['IDuser'];
$sql_11 = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE cuid = '$last_id'") or die(mysqli_error());
$s11 = mysqli_fetch_array($sql_11);
$email = $s11['email'];
$full_name = $s11['full_name'];
$explode = explode(' ',$full_name);
$noHp = $_POST['no_hp'];
$level = $s11['level'];

//About Product
$produkID = $_POST['produkID'];
$sql_1 = mysqli_query($conn,"SELECT * FROM `tb_produk` WHERE cuid = '$produkID'") or die(mysqli_error());
$s1 = mysqli_fetch_array($sql_1);
$productCode = $s1['code'];
$productCategory = $s1['kategori'];
$productTitle = $s1['title'];
$jenisnya = $s1['jenis'];
$productType = $s1['product_type'];
$komisinya = $s1['komisi'];
$poinnya = $s1['poin'];
$hargaModal = $s1['harga_modal'];
$qty = 1;

$getkategori = mysqli_query($conn,"SELECT * FROM `tb_kategori` WHERE kategori = '$productCategory'") or die(mysqli_error());
$gk = mysqli_fetch_array($getkategori);
$parentType = $gk['parent'];

if($s11['level'] == 'reseller'){
    $harga = $s1['harga_reseller'];
}
else {
    $harga = $s1['harga_jual'];
}

//About Payment Method

$abc = $_POST['metode'];
if($abc != 999){
    $getPayment = mysqli_query($conn,"SELECT * FROM `tb_bank` WHERE cuid = '$abc'") or die(mysqli_error());
    $gp = mysqli_fetch_array($getPayment);
    $paymentID = $gp['provider'];
    $bankCode = $gp['code'];
    $bankName = $gp['akun'];
    $noRek = $gp['no_rek'];
    $pemilik = $gp['pemilik'];
}
else {
    $paymentID = 999;
}

//About Voucher
if($_POST['apaandah'] == 7){
    $vouchers = $_POST['voucher'];
    $getVoucher = mysqli_query($conn,"SELECT * FROM `tb_reward` WHERE `title` = '$vouchers'") or die(mysqli_error());
    $gvv = mysqli_num_rows($getVoucher);
    if($gvv == 0){
        $voucher = 0;
        $potong = 0;
    }
    else {
        $gv = mysqli_fetch_array($getVoucher);
        $rewardID = $gv['cuid'];
        $kuota = $gv['kuota'];
        $jenisVoucher = $gv['jenis'];
        $minOrder = $gv['min_order'];
        $satuan = $gv['satuan'];
        $nilaiPotong = $gv['nominal'];
        
        $voucher = $vouchers;
        if($satuan == 0){
            $aa = $nilaiPotong/100;
            $potong = round($harga * $aa);
        }
        else {
            $potong = $nilaiPotong;
        }
        
        $updateVoucher = mysqli_query($conn,"UPDATE `tb_reward` SET `kuota` = kuota - 1 WHERE cuid = '$rewardID'") or die(mysqli_error());
    }
}
else {
    $voucher = 0;
    $potong = 0;
}

if($_POST['point'] == '' || $_POST['point'] == 0){
    $tukarPoin = 0;
    $poinnya = 0;
}
else {
    $cekAdmin = mysqli_query($conn,"SELECT * FROM `tb_admin` WHERE cuid = 1") or die(mysqli_error());
    $ca = mysqli_fetch_array($cekAdmin);
    $tukarPoin = $ca['poin'];
    $poinnya = $_POST['point'] * $tukarPoin;
}

$potongan = $potong + $poinnya;
$profit = $harga - $hargaModal;
$totalProfit = $profit * $qty;
$subtotal = $harga - $potongan;
$subtotale = ($harga - $potongan) + $kode_unik;

$cekCape = mysqli_query($conn,"SELECT * FROM `tb_order` WHERE userID = '$userID' AND produkID = '$produkID' AND id_user = '$last_id' AND status = 0 AND created_date LIKE '$created_datess%'") or die(mysqli_error());
$ccc = mysqli_num_rows($cekCape);
if($ccc == 0){
    if($paymentID == 0){
        $expired_time = date('Y-m-d H:i:s', strtotime('+1 days'));
        $insert = mysqli_query($conn,"INSERT INTO `tb_order` (`id_session`, `kd_transaksi`, `produkID`, `qty`, `harga_modal`, `harga_jual`, `harga`, `kode_unik`, `potongan`, `tukar_poin`, `sub_total`, `total_profit`, `voucher`, `komisi`, `poin`, `kategori`, `title`, `userID`, `zoneID`, `nickname`, `trxID`, `services`, `status_order`, `note`, `full_name`, `email`, `no_hp`, `metode`, `created_date`, `providerID`, `jenis`, `ipaddress`, `id_user`, `status`) VALUES ('$sid', '$kd_transaksi', '$produkID', '$qty', '$hargaModal', '$harga', '$subtotal', '$kode_unik', '$potongan', '$tukarPoin', '$subtotale', '$totalProfit', '$voucher', '$komisinya', '$poinnya', '$productCategory', '$productTitle', '$userID', '$zone_id', '$nickname', '', '$productCode', '', '', '$full_name', '$email', '$noHp', '$abc', '$created_date', '$jenisnya', '$parentType', '$ipaddress', '$last_id', 0)") or die(mysqli_error($conn));

        $insert_tripay = mysqli_query($conn,"INSERT INTO `tb_tripay` (`userID`, `reference`, `merchant_ref`, `payment_method`, `payment_name`, `customer_email`, `customer_phone`, `amount`, `fee`, `amount_total`, `pay_code`, `checkout_url`, `status`, `paid_time`, `expired_time`, `providerID`, `jenis_transaksi`, `created_date`) VALUES ('$last_id', '', '$kd_transaksi', '$bankCode', '$bankName', '$email', '$noHp', '$subtotal', '$kode_unik', '$subtotale', '$noRek a/n $pemilik', '', 'UNPAID', '0000-00-00 00:00:00', '$expired_time', '$jenisnya', 1, '$created_date')") or die(mysqli_error($conn));

        $cekFonnte = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 8") or die(mysqli_error());
        $cf = mysqli_fetch_array($cekFonnte);
        if($cf['status'] == 1){
            $content = '*Terima Kasih telah memesan *' . $productTitle . '* *' . $userID . '*
Silahkan melakukan pembayaran sesuai dengan nominal, nomor rekening, dan bank dibawah ini:
                                
*Nominal :* Rp. ' . $subtotale . '
*Bank :* ' . $bankName . '
*Rekening :* ' . $noRek . ' a/n ' .$pemilik. '
*Berlaku Sampai :* ' . $expired_time . '
                                                
Jika kamu sudah melakukan pembayaran, silahkan cek status transaksi kamu di '.$urlweb.'/cektrx/ dan masukkan No.Invoice kamu *' . $kd_transaksi . '*
                                
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
            $signature = hash_hmac('sha256', $tripayCode.$kd_transaksi.$subtotal, $privateKey);
            $data = [
                'method'            => $bankCode,
                'merchant_ref'      => $kd_transaksi,
                'amount'            => $subtotal,
                'customer_name'     => $full_name,
                'customer_email'    => $email,
                'customer_phone'    => $noHp,
                'order_items'       => [
                    [
                        'sku'         => $kd_transaksi,
                        'name'        => 'Pembayaran Nomor Transaksi '.$kd_transaksi,
                        'price'       => $subtotal,
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
            $amount = $subtotal;
            $fee = $hasil['data']['total_fee'];
            $amount_total = $subtotal+ $fee;
            $pay_code = $hasil['data']['pay_code'];
            $checkout_url = $hasil['data']['checkout_url'];
            $status = $hasil['data']['status'];
            $expired_time = date('Y-m-d H:i:s', strtotime('+1 days'));

            $insert = mysqli_query($conn,"INSERT INTO `tb_order` (`id_session`, `kd_transaksi`, `produkID`, `qty`, `harga_modal`, `harga_jual`, `harga`, `kode_unik`, `potongan`, `tukar_poin`, `sub_total`, `total_profit`, `voucher`, `komisi`, `poin`, `kategori`, `title`, `userID`, `zoneID`, `nickname`, `trxID`, `services`, `status_order`, `note`, `full_name`, `email`, `no_hp`, `metode`, `created_date`, `providerID`, `jenis`, `ipaddress`, `id_user`, `status`) VALUES ('$sid', '$kd_transaksi', '$produkID', '$qty', '$hargaModal', '$harga', '$subtotal', '$kode_unik', '$potongan', '$tukarPoin', '$subtotale', '$totalProfit', '$voucher', '$komisinya', '$poinnya', '$productCategory', '$productTitle', '$userID', '$zone_id', '$nickname', '', '$productCode', '', '', '$full_name', '$email', '$noHp', '$abc', '$created_date', '$jenisnya', '$parentType', '$ipaddress', '$last_id', 0)") or die(mysqli_error($conn));

            $insert_tripay = mysqli_query($conn,"INSERT INTO `tb_tripay` (`userID`, `reference`, `merchant_ref`, `payment_method`, `payment_name`, `customer_email`, `customer_phone`, `amount`, `fee`, `amount_total`, `pay_code`, `checkout_url`, `status`, `paid_time`, `expired_time`, `providerID`, `jenis_transaksi`, `created_date`) VALUES ('$last_id', '$reference', '$merchant_ref', '$payment_method', '$payment_name', '$email', '$noHp', '$amount', '$fee', '$amount_total', '$pay_code', '$checkout_url', 'UNPAID', '0000-00-00 00:00:00', '$expired_time', '$jenisnya', 1, '$created_date')") or die(mysqli_error($conn));

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
                $content = '*Terima Kasih telah memesan *' . $productTitle . '* *' . $userID . '*
Silahkan melakukan pembayaran sesuai dengan nominal, nomor rekening, dan bank dibawah ini:
                                
*Nominal :* Rp. ' . $amount_total . '
*Bank :* ' . $payment_method . '
*Rekening :* ' . $caraBayar. '
*Berlaku Sampai :* ' . $expired_time . '
                                                
Jika kamu sudah melakukan pembayaran, silahkan cek status transaksi kamu di '.$urlweb.'/cektrx/ dan masukkan No.Invoice kamu *' . $kd_transaksi . '*
                                
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

                if($metode == 'OV'){
                    $a = ($subtotal * 1.67)/100;
                    $adminFee = round($a);
                    $amount_total = $subtotal + $adminFee;
                }
                else if($metode == 'SP'){
                    $a = ($subtotal * 2)/100;
                    $adminFee = round($a);
                    $amount_total = $subtotal + $adminFee;
                }
                else if($metode == 'LA'){
                    $a = ($subtotal * 1.67)/100;
                    $adminFee = round($a);
                    $amount_total = $subtotal + $adminFee;
                }
                else if($metode == 'SA'){
                    $a = ($subtotal * 4)/100;
                    $adminFee = round($a);
                    $amount_total = $subtotal + $adminFee;
                }
                else if($metode == 'DA'){
                    $a = ($subtotal * 1.67)/100;
                    $adminFee = round($a);
                    $amount_total = $subtotal + $adminFee;
                }
                else if($metode == 'AG'){
                    $adminFee = 1500;
                    $amount_total = $subtotal + $adminFee;
                }
                else if($metode == 'M2'){
                    $adminFee = 4000;
                    $amount_total = $subtotal + $adminFee;
                }
                else if($metode == 'BC'){
                    $adminFee = 5000;
                    $amount_total = $subtotal + $adminFee;
                }
                else if($metode == 'FT'){
                    $adminFee = 2500;
                    $amount_total = $subtotal + $adminFee;
                }
                else{
                    $adminFee = 3000;
                    $amount_total = $subtotal + $adminFee;
                }
                
                $insert = mysqli_query($conn,"INSERT INTO `tb_order` (`id_session`, `kd_transaksi`, `produkID`, `qty`, `harga_modal`, `harga_jual`, `harga`, `kode_unik`, `potongan`, `tukar_poin`, `sub_total`, `total_profit`, `voucher`, `komisi`, `poin`, `kategori`, `title`, `userID`, `zoneID`, `nickname`, `trxID`, `services`, `status_order`, `note`, `full_name`, `email`, `no_hp`, `metode`, `created_date`, `providerID`, `jenis`, `ipaddress`, `id_user`, `status`) VALUES ('$sid', '$kd_transaksi', '$produkID', '$qty', '$hargaModal', '$harga', '$subtotal', '$kode_unik', '$potongan', '$tukarPoin', '$subtotale', '$totalProfit', '$voucher', '$komisinya', '$poinnya', '$productCategory', '$productTitle', '$userID', '$zone_id', '$nickname', '', '$productCode', '', '', '$full_name', '$email', '$noHp', '$abc', '$created_date', '$jenisnya', '$parentType', '$ipaddress', '$last_id', 0)") or die(mysqli_error($conn));

                $insert_tripay = mysqli_query($conn,"INSERT INTO `tb_tripay` (`userID`, `reference`, `merchant_ref`, `payment_method`, `payment_name`, `customer_email`, `customer_phone`, `amount`, `fee`, `amount_total`, `pay_code`, `checkout_url`, `status`, `paid_time`, `expired_time`, `providerID`, `jenis_transaksi`, `created_date`) VALUES ('$last_id', '$reference', '$kd_transaksi', '$bankCode', '$bankName', '$email', '$noHp', '$subtotal', '$adminFee', '$amount_total', '$pay_code', '$checkout_url', 'UNPAID', '0000-00-00 00:00:00', '$expired_time', '$jenisnya', 1, '$created_date')") or die(mysqli_error($conn));

                $cekFonnte = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 8") or die(mysqli_error());
                $cf = mysqli_fetch_array($cekFonnte);
                if($cf['status'] == 1){
                    if($metode == 'OV' || $metode == 'SP' || $metode == 'LA' || $metode == 'SA' || $metode == 'DA'){
                        $caraBayar = $checkout_url;
                    }
                    else {
                        $caraBayar = $vaNumber;
                    }
                    $content = '*Terima Kasih telah memesan *' . $productTitle . '* *' . $userID . '*
Silahkan melakukan pembayaran sesuai dengan nominal, nomor rekening, dan bank dibawah ini:
                                
*Nominal :* Rp. ' . $amount_total . '
*Bank :* ' . $bankName . '
*Rekening :* ' . $caraBayar. '
*Berlaku Sampai :* ' . $expired_time . '
                                                
Jika kamu sudah melakukan pembayaran, silahkan cek status transaksi kamu di '.$urlweb.'/cektrx/ dan masukkan No.Invoice kamu *' . $kd_transaksi . '*
                                
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
    else if($paymentID == 999){
        $cekSaldo = mysqli_query($conn,"SELECT * FROM `tb_balance` WHERE userID = '$last_id'") or die(mysqli_error());
        $cs = mysqli_fetch_array($cekSaldo);
        $saldo_aktif = $cs['active'];
        if($saldo_aktif > $subtotal){
            $insert = mysqli_query($conn,"INSERT INTO `tb_order` (`id_session`, `kd_transaksi`, `produkID`, `qty`, `harga_modal`, `harga_jual`, `harga`, `kode_unik`, `potongan`, `tukar_poin`, `sub_total`, `total_profit`, `voucher`, `komisi`, `poin`, `kategori`, `title`, `userID`, `zoneID`, `nickname`, `trxID`, `services`, `status_order`, `note`, `full_name`, `email`, `no_hp`, `metode`, `created_date`, `providerID`, `jenis`, `ipaddress`, `id_user`, `status`) VALUES ('$sid', '$kd_transaksi', '$produkID', '$qty', '$hargaModal', '$harga', '$subtotal', '$kode_unik', '$potongan', '$tukarPoin', '$subtotale', '$totalProfit', '$voucher', '$komisinya', '$poinnya', '$productCategory', '$productTitle', '$userID', '$zone_id', '$nickname', '', '$productCode', '', '', '$full_name', '$email', '$noHp', '$abc', '$created_date', '$jenisnya', '$parentType', '$ipaddress', '$last_id', 0)") or die(mysqli_error($conn));
                
            header('Location:../order_saldo/?trxID='.$kd_transaksi);
            exit();
        }
        else {
            header('Location:../wallet/');
            exit();
        }
    }
}
else {
    $cc = mysqli_fetch_array($cekCape);
    $transactionID = $cc['kd_transaksi'];
    if($abc == 999){
        header('Location:../wallet/');
        exit();
    }
    else {
        header('Location:../payment/?trxID='.$transactionID);
        exit();
    }
}
?>