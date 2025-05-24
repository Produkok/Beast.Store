<?php
ob_start();
session_start();
include('config/koneksi.php');
$sid = session_id();
$sql_0 = mysqli_query($conn,"SELECT * FROM `tb_seo` WHERE cuid = 1") or die(mysqli_error());
$s0 = mysqli_fetch_array($sql_0);
$urlweb = $s0['urlweb'];
$urlwebs = $s0['urlweb'];
$pengguna = $s0['user'];
$sql_1b = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE user = '$pengguna'") or die(mysqli_error());
$s1b = mysqli_fetch_array($sql_1b);
$ip = $_SERVER['REMOTE_ADDR'];
$date = date('Y-m-d');

$stat = mysqli_query($conn,"INSERT INTO `tb_stat` (`ip`, `date`, `hits`, `page`, `user`) VALUES ('$ip', '$date', 1, 'Order', '$pengguna')") or die (mysqli_error());
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Pembayaran - <?php echo $s0['instansi']; ?></title>
  <meta name="description" content="<?php echo $s0['deskripsi']; ?>">
  <meta name="keywords" content="<?php echo $s0['keyword']; ?>">
  <meta property="og:title" content="Pembayaran - <?php echo $s0['instansi']; ?>"/>
  <meta property="og:description" content="<?php echo $s0['deskripsi']; ?>" />
  <meta property="og:url" content="<?php echo $urlweb; ?>" />
  <meta property="og:image" content="<?php echo $urlweb; ?>/upload/<?php echo $s0['image']; ?>" />
  <meta name="resource-type" content="document" />
  <meta http-equiv="content-type" content="text/html; charset=US-ASCII" />
  <meta http-equiv="content-language" content="en-us" />
  <meta name="author" content="MRA Develompemt" />
  <meta name="contact" content="MRA Develompemt" />
  <meta name="copyright" content="Copyright (c) MRA Develompemt. All Rights Reserved." />
  <meta name="robots" content="index, nofollow">

  <link rel="shortcut icon" type="image/x-icon" href="<?php echo $urlweb; ?>/upload/favicon.png">

  <link rel="stylesheet" href="<?php echo $urlweb; ?>/assets/plugins/summernote/dist/summernote-bs4.css"/>
  <!--Select Plugins-->
  <link href="<?php echo $urlweb; ?>/assets/plugins/select2/css/select2.min.css" rel="stylesheet"/>
  <!-- simplebar CSS-->
  <link href="<?php echo $urlweb; ?>/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet"/>
  <!-- Bootstrap core CSS-->
  <link href="<?php echo $urlweb; ?>/assets/css/bootstrap.min.css" rel="stylesheet"/>
  <!--Data Tables -->
  <link href="<?php echo $urlweb; ?>/assets/plugins/bootstrap-datatable/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
  <link href="<?php echo $urlweb; ?>/assets/plugins/bootstrap-datatable/css/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css">
  <!-- animate CSS-->
  <link href="<?php echo $urlweb; ?>/assets/css/animate.css" rel="stylesheet" type="text/css"/>
  <!-- Icons CSS-->
  <link href="<?php echo $urlweb; ?>/assets/css/icons.css" rel="stylesheet" type="text/css"/>
  <!-- Horizontal menu CSS-->
  <link href="<?php echo $urlweb; ?>/assets/css/horizontal-menu.css" rel="stylesheet"/>
  <!-- Custom Style-->
  <link href="<?php echo $urlweb; ?>/assets/css/app-style.css" rel="stylesheet"/>
  <?php include('style.php'); ?>
 
</head>

<body>

  <!-- Start wrapper-->
  <div id="wrapper">

    <!--Start topbar header-->
    
    <!--End topbar header-->

    <div class="clearfix pt-5"></div>
    <div class="pb-5">
      <div class="container">
       <div class="row">
          <div class="col-sm-2"></div>
          <div class="col-sm-8 text-center">
            <?php
              error_reporting(0);
              $trxID = $_GET['trxID'];
              $sql_2 = mysqli_query($conn,"SELECT * FROM `tb_tripay` WHERE merchant_ref = '$trxID'") or die(mysqli_error());
              $s2 = mysqli_fetch_array($sql_2);
              if($s2['providerID'] != 0){
                $sql_3 = mysqli_query($conn,"SELECT * FROM `tb_order` WHERE kd_transaksi = '$trxID'") or die(mysqli_error());
                $s3 = mysqli_fetch_array($sql_3);
                $produkID = $s3['produkID'];
                $metode = $s3['metode'];
                $sql_4 = mysqli_query($conn,"SELECT * FROM `tb_produk` WHERE cuid = '$produkID'") or die(mysqli_error());
                $s4 = mysqli_fetch_array($sql_4);
                $sql_5 = mysqli_query($conn,"SELECT * FROM `tb_bank` WHERE cuid = '$metode'") or die(mysqli_error());
                $s5 = mysqli_fetch_array($sql_5);
              }
              else {
                $sql_3 = mysqli_query($conn,"SELECT * FROM `tb_transaksi` WHERE kd_transaksi = '$trxID'") or die(mysqli_error());
                $s3 = mysqli_fetch_array($sql_3);
                $metode = $s3['metode'];
                $sql_5 = mysqli_query($conn,"SELECT * FROM `tb_bank` WHERE cuid = '$metode'") or die(mysqli_error());
                $s5 = mysqli_fetch_array($sql_5);
              }
            ?>
            <div class="card shadow-sm" style="border-radius: 10px;">
              <div class="card-body text-center">
                <i class="fa fa-check-circle fa-5x mb-3" style="font-size: 100px;"></i><br>
                <p style="font-size: 18px;">Pesanan Berhasil Dibuat! Lakukan Pembayaran Sebelum :</p>
                <span class="mb-4 badge badge-danger p-2" style="font-size: 18px;"><?php echo date ('d F Y H:i:s', strtotime($s2['expired_time'])); ?></span>
                <h2 class="mb-4">Rp. <?php echo number_format($s2['amount_total']); ?></h2>
                <p class="text-center"><small>Lakukan Pembayaran Melalui No. Rekening/Virtual Account Berikut :</small></p>
                <table class="table mb-3">
                  <tbody>
                    <?php
                        if($s5['jenis'] != 2){
                    ?>
                    <tr>
                      <td style="vertical-align: middle; white-space: normal; border-top: 0; color: #fff;">
                        <img src="<?php echo $s5['image']; ?>" style="display: block; margin: 0 auto; margin-top: 10px; width:auto; height: 75px; background: #fff; border-radius: 10px;">
                        <?php if($s5['jenis'] == 0){ ?>
                        <p class="mt-3" style="font-size: 18px;">
                          <?php echo $s5['no_rek']; ?>
                          <span class="badge badge-danger clip p-2" style="font-size: 12px;" onclick="copy_virtualku()" data-clipboard-text="<?php echo $s5['no_rek']; ?>"><i class="fa fa-clone"></i></span>
                        </p>
                        <p>a/n <?php echo $s5['pemilik']; ?></p>
                        <?php } else { ?>
                        <p class="mt-3" style="font-size: 18px;">
                          <?php echo $s2['pay_code']; ?>
                          <span class="badge badge-danger clip p-2" onclick="copy_virtualku()" data-clipboard-text="<?php echo $s2['pay_code']; ?>">
                            <i class="fa fa-clone"></i>&nbsp; Copy
                          </span>
                        </p>
                        <?php } ?>
                        
                      </td>
                    </tr>
                    <?php
                      } else {
                         if($s2['payment_method'] == 'QRISC' || $s2['payment_method'] == 'QRIS' || $s2['payment_method'] == 'QRIS2' || $s2['payment_method'] == 'QRISCOP' || $s2['payment_method'] == 'QRISD' || $s2['payment_method'] == 'QRISNOBU'){
                    ?>
                    <tr>
                      <td style="vertical-align: middle; border-top: 0; color: #fff;">
                        <p class="mb-2">Scan QRCode Dibawah Untuk Melakukan Pembayaran</p>
                        <img src="https://tripay.co.id/qr/<?php echo $s2['reference']; ?>" style="display: block; margin: 0 auto; margin-top: 10px; width:100%; height: auto; cursor:zoom-in;" id="qr_code">
                      </td>
                    </tr>
                    <?php } else { ?>
                    <tr>
                      <td style="vertical-align: middle; border-top: 0; color: #fff;">
                        <p class="mb-2">Klik Tombol Dibawah Untuk Melakukan Pembayaran</p>
                        <a href="<?php echo $s2['checkout_url']; ?>" target="_blank" class="btn btn-primary btn-block">Bayar Sekarang</a>
                      </td>
                    </tr>
                    <?php }} ?>
                  </tbody>
                </table>
                <table class="table mb-3">
                  <tbody>
                    <tr class="bg-success">
                      <td class="text-left" colspan="2" style="vertical-align: middle; white-space: normal; color: #fff; border-top: 0; font-size: 12px;">Detail Pesanan :</td>
                    </tr>
                    <tr>
                      <td class="text-left" style="vertical-align: middle; white-space: normal; color: #fff; border-top: 0; font-size: 12px;">Tanggal Transaksi</td>
                      <td class="text-right" style="vertical-align: middle; white-space: normal; color: #fff; border-top: 0; font-size: 12px;"><?php echo $s2['created_date']; ?></td>
                    </tr>
                    <tr>
                      <td class="text-left" style="vertical-align: middle; white-space: normal; color: #fff; border-top: 0; font-size: 12px;">Total Belanja</td>
                      <td class="text-right" style="vertical-align: middle; white-space: normal; color: #fff; border-top: 0; font-size: 12px;">Rp. <?php echo number_format($s2['amount']); ?></td>
                    </tr>
                    <?php if($s2['providerID'] != 0){ ?>
                    <tr>
                      <td class="text-left" style="vertical-align: middle; white-space: normal; color: #fff; border-top: 0; font-size: 12px;">Total Potongan</td>
                      <td class="text-right" style="vertical-align: middle; white-space: normal; color: #fff; border-top: 0; font-size: 12px;">Rp. <?php echo number_format($s3['potongan']); ?></td>
                    </tr>
                    <?php } ?>
                    <tr>
                      <td class="text-left" style="vertical-align: middle; white-space: normal; color: #fff; border-top: 0; font-size: 12px;">Biaya Layanan / Admin</td>
                      <td class="text-right" style="vertical-align: middle; white-space: normal; color: #fff; border-top: 0; font-size: 12px;">Rp. <?php echo number_format($s2['fee']); ?></td>
                    </tr>
                    <tr>
                      <td class="text-left" style="vertical-align: middle; white-space: normal; color: #fff; border-top: 0; font-size: 12px;">Jumlah Pembayaran</td>
                      <td class="text-right" style="vertical-align: middle; white-space: normal; color: #fff; border-top: 0; font-size: 12px;">Rp. <?php echo number_format($s2['amount_total']); ?></td>
                    </tr>
                    <tr class="bg-success">
                      <td class="text-left" colspan="2" style="vertical-align: middle; white-space: normal; color: #fff; border-top: 0; font-size: 12px;">Rincian Pesanan :</td>
                    </tr>
                    <tr>
                      <td class="text-left" colspan="2" style="vertical-align: middle; white-space: normal; color: #fff; border-top: 0; font-size: 12px;">
                        <?php
                          if($s2['providerID'] == 0){
                            echo 'Top Up Saldo Rp. '.number_format($s2['amount']);
                          }
                          else {
                        ?>
                        Layanan : <?php echo ucwords(str_replace('-',' ',$s3['kategori'])); ?><br>
                        Produk : <?php echo $s3['title']; ?><br>
                        Tujuan : <?php echo $s3['userID']; ?><br>
                        Zone ID/ Server : <?php if($s3['zoneID'] == 'undefined' || $s3['zoneID'] == '') { echo ''; } else { echo '('.$s3['zoneID'].')'; } ?><br>
                        Nickname : <?php if($s3['nickname'] == '') { echo ''; } else { echo '('.$s3['nickname'].')'; } ?>
                        <?php } ?>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
            <a href="<?php echo $urlweb; ?>" class="btn btn-primary mt-3"><i class="fa fa-arrow-left"></i>&nbsp; Kembali Ke Beranda</a>
          </div>
          <div class="col-sm-2"></div>
       </div>
        
      </div>
    </div>
    <div class="d-block d-sm-none" style="height: 100px;"></div>
    <!--Start Back To Top Button-->
    <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>
    <!--End Back To Top Button-->
  
    <!--Start footer-->
    <script src="<?php echo $urlweb; ?>/assets/js/jquery.min.js"></script>
    <script src="<?php echo $urlweb; ?>/assets/js/popper.min.js"></script>
    <script src="<?php echo $urlweb; ?>/assets/js/bootstrap.min.js"></script>
    
    <!-- simplebar js -->
    <script src="<?php echo $urlweb; ?>/assets/plugins/simplebar/js/simplebar.js"></script>
    <!-- horizontal-menu js -->
    <script src="<?php echo $urlweb; ?>/assets/js/horizontal-menu.js"></script>
    
    <!-- Custom scripts -->
    <script src="<?php echo $urlweb; ?>/assets/plugins/summernote/dist/summernote-bs4.min.js"></script>
    <!--Select Plugins Js-->
    <script src="<?php echo $urlweb; ?>/assets/plugins/select2/js/select2.min.js"></script>
    <!--Data Tables js-->
    <script src="<?php echo $urlweb; ?>/assets/plugins/bootstrap-datatable/js/jquery.dataTables.min.js"></script>
    <script src="<?php echo $urlweb; ?>/assets/plugins/bootstrap-datatable/js/dataTables.bootstrap4.min.js"></script>
    <script src="<?php echo $urlweb; ?>/assets/plugins/bootstrap-datatable/js/dataTables.buttons.min.js"></script>
    <script src="<?php echo $urlweb; ?>/assets/plugins/bootstrap-datatable/js/buttons.bootstrap4.min.js"></script>
    <script src="<?php echo $urlweb; ?>/assets/plugins/bootstrap-datatable/js/jszip.min.js"></script>
    <script src="<?php echo $urlweb; ?>/assets/plugins/bootstrap-datatable/js/pdfmake.min.js"></script>
    <script src="<?php echo $urlweb; ?>/assets/plugins/bootstrap-datatable/js/vfs_fonts.js"></script>
    <script src="<?php echo $urlweb; ?>/assets/plugins/bootstrap-datatable/js/buttons.html5.min.js"></script>
    <script src="<?php echo $urlweb; ?>/assets/plugins/bootstrap-datatable/js/buttons.print.min.js"></script>
    <script src="<?php echo $urlweb; ?>/assets/plugins/bootstrap-datatable/js/buttons.colVis.min.js"></script>
    <script>
      $(document).ready(function() {
        //Default data table
        $('.default-datatable').DataTable();
        $('.single-select').select2();
      });
      function openNav() {
        document.getElementById("mySidenav").style.width = "300px";
      }

      function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
      }
      function myFunctiona() {
        var x = document.getElementById("showcallcenter");
        if (x.style.display === "none") {
          x.style.display = "block";
        } else {
          x.style.display = "none";
        }
      }
    </script>
    <script src="<?php echo $urlweb; ?>/assets/js/clipboard.min.js"></script>
    <script>

      var clipboard = new ClipboardJS('.clip');

      function copy_trxaku() {
        alert("No. Transaksi berhasil di Copy");
      }

      function copy_virtualku() {
        alert("Kode Pembayaran / No. Virtual Account berhasil di Copy");
      }

    </script>
</body>
</html>
