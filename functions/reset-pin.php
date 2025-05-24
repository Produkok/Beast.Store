<?php
include('session.php');

    
    $re_pass = substr(str_shuffle(123456789),0,6);
    $pass = md5($re_pass);

    $email = $u['email'];
    $cekuser = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE email = '$email'") or die(mysqli_error());
    $cu = mysqli_num_rows($cekuser);
    $cus = mysqli_fetch_array($cekuser);
    $full_name = $cus['full_name'];
    $noHp = $cus['no_hp'];
    $explode = explode(' ',$cus['full_name']);
    $postID = $cus['cuid'];

    
    $cekFonnte = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 8") or die(mysqli_error());
    $cf = mysqli_fetch_array($cekFonnte);
    if($cf['status'] == 1){
        $content = 'Hai '.$full_name.', Anda baru saja melakukan permintaan Reset PIN Transaksi. dan berikut adalah PIN Transaksi sementara Anda :
PIN Transaksi : '.$re_pass.'

Silahkan Login dan segera lakukan perubahan PIN Transaksi melalui profile Anda
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
        $update = mysqli_query($conn,"UPDATE `tb_user` SET pinTrx = '$pass' WHERE email = '$email'") or die(mysqli_error());
        header('location:'.$urlweb.'/e_user/?notif=8'); 
            exit();
    }
?>