<?php
ob_start();
session_start();
include('config/koneksi.php');

$sql_5 = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 1") or die(mysqli_error());
$s5 = mysqli_fetch_array($sql_5);
$tripayApi = $s5['api_key'];

$curls = curl_init();
                               
curl_setopt_array($curls, array(
    CURLOPT_FRESH_CONNECT     => true,
    CURLOPT_URL               => "https://tripay.co.id/api/merchant/payment-channel",
    CURLOPT_RETURNTRANSFER    => true,
    CURLOPT_HEADER            => false,
    CURLOPT_HTTPHEADER        => array(
        "Authorization: Bearer ".$tripayApi
    ),
    CURLOPT_FAILONERROR       => false
));
                                  
$responses = curl_exec($curls);
$errs = curl_error($curls);
curl_close($curls);
echo !empty($err) ? $err : $responses;
$hasils = json_decode($responses, true);
for ($i=0; $i < count($hasils['data']); $i++) {
$kategori = $hasils['data'][$i]['group'];
$fee_flat = $hasils['data'][$i]['total_fee']['flat'];
$percent = $hasils['data'][$i]['total_fee']['percent']/100;
$code = $hasils['data'][$i]['code'];
$akun = $hasils['data'][$i]['name'];
$image = $hasils['data'][$i]['icon_url'];
if($kategori == 'Virtual Account'){
    $jenis = 1;
}
else if($kategori == 'Convenience Store'){
    $jenis = 3;
}
else if($kategori == 'E-Wallet'){
    $jenis = 2;
}
$insert = mysqli_query($conn,"INSERT INTO `tb_bank` (`image`, `code`, `akun`, `pemilik`, `no_rek`, `feeAdmin`, `feePersen`, `jenis`, `provider`, `status`, `userID`) VALUES ('$image','$code','$akun','','','$fee_flat','$percent','$jenis', 1, 0, 1)") or die(mysqli_error());
}
?>