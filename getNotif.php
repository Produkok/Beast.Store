<?php
date_default_timezone_set("Asia/Jakarta");
include('config/koneksi.php');
$getOrder = mysqli_query($conn,"SELECT * FROM `tb_order` WHERE status = 2 ORDER BY rand() DESC LIMIT 1") or die(mysqli_error());
$go = mysqli_fetch_array($getOrder);
$noHp = substr($go['no_hp'], 0, -4) . 'xxx';
$data = array(
            'message' =>  $noHp.' Baru Saja Membeli Produk '.$go['kategori'].' '.$go['title'],
        );
 echo json_encode($data);
?>
