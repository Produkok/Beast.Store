<?php
    require_once('session.php');
    $username = $u['user'];
    $userID = $u['cuid'];
    $full_name = mysqli_real_escape_string($conn,$_POST['full_name']);
    $produkID = mysqli_real_escape_string($conn,$_POST['produkID']);
    $kd_transaksi = mysqli_real_escape_string($conn,$_POST['kd_transaksi']);
    $content = mysqli_real_escape_string($conn,$_POST['content']);
    $created_date = date('Y-m-d H:i:s');

    $query = mysqli_query($conn,"INSERT INTO `tb_testi` (`kd_transaksi`, `produkID`, `full_name`, `content`, `date`, `status`, `userID`) VALUES ('$kd_transaksi','$produkID','$full_name','$content','$created_date',1,'$userID')") or die(mysqli_error());
    header('location:../history/');
?>