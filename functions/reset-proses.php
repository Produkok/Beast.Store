<?php
ob_start();
session_start();
date_default_timezone_set("Asia/Jakarta");
include('../config/koneksi.php');
include('../classes/class.phpmailer.php');
$token = session_id();
$sql_0 = mysqli_query($conn,"SELECT * FROM `tb_seo` WHERE cuid = 1") or die(mysqli_error());
$s0 = mysqli_fetch_array($sql_0);
$urlweb = $s0['urlweb'];

if(isset($_POST['submit'])){
    $re_pass = substr(str_shuffle('abcdefghijklmnopqrstuvwxyz123456789'),0,8);
    $pass = password_hash($re_pass,PASSWORD_DEFAULT);

    $email = $_POST['user'];
    $cekuser = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE email = '$email'") or die(mysqli_error());
    $cu = mysqli_num_rows($cekuser);
    $cus = mysqli_fetch_array($cekuser);
    $full_name = $cus['full_name'];
    $noHp = $cus['no_hp'];
    $explode = explode(' ',$cus['full_name']);
    $postID = $cus['cuid'];

    if($cu <= 0){
            header('location:'.$urlweb.'/forgot/?notif=1');
    }
    else{
        $cekFonnte = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 8") or die(mysqli_error());
        $cf = mysqli_fetch_array($cekFonnte);
        if($cf['status'] == 1){
            $content = 'Hai '.$full_name.', Anda baru saja melakukan permintaan Reset Password. dan berikut adalah password sementara Anda :
Username : '.$$cus['user'].'
Password : '.$re_pass.'

Silahkan Login menggunakan Username dan Password diatas, dan segera lakukan perubahan Password melalui profile Anda
Terima Kasih

            ';
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
            $update = mysqli_query($conn,"UPDATE `tb_user` SET pass = '$pass' WHERE email = '$email'") or die(mysqli_error());
            header('location:'.$urlweb.'/forgot/?notif=2'); 
            exit();
        }
    }
}
else {
    header('location:'.$urlweb);
}
?>