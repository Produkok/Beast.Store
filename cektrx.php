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

$stat = mysqli_query($conn,"INSERT INTO `tb_stat` (`ip`, `date`, `hits`, `page`, `user`) VALUES ('$ip', '$date', 1, 'Cek Pesanan', '$pengguna')") or die (mysqli_error());
$created_date = date('Y-m-d H:i:s');

?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Cek Status Pesanan - <?php echo $s0['instansi']; ?></title>
  <meta name="description" content="<?php echo $s0['deskripsi']; ?>">
  <meta name="keywords" content="<?php echo $s0['keyword']; ?>">
  <meta property="og:title" content="Cek Status Pesanan - <?php echo $s0['instansi']; ?>"/>
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
    <?php include('top_menu.php'); ?>
    <!--End topbar header-->

    <div class="clearfix pt-5"></div>
    <div class="pt-5 pb-5">
      <div class="container">
       <div class="row">
          <div class="col-lg-12">
            <div class="pb-3">
              <div class="card shadow-sm">
                <div class="card-body">
                  <form role="form" class="mb-3" action="" method="GET">
                    <p>LACAK PESANAN DENGAN NOMOR TELEPON ATAU NOMOR TRANSAKSI</p>
                    <div class="input-group mb-3">
                      <input type="text" name="trxNum" class="form-control" placeholder="Masukan Nomor Handphone atau Nomor Transaksi Anda" aria-label="<?php if(isset($_GET['trxNum'])) { echo $_GET['trxNum']; } ?>" aria-describedby="button-addon2" style="height: 50px; border-top-left-radius: 25px; border-bottom-left-radius: 25px;">
                      <div class="input-group-append">
                        <button class="btn btn-primary text-white" type="submit" id="button-addon2" style="border-top-left-radius: 0px!important; border-bottom-left-radius: 0px!important;">CARI <i class="fa fa-arrow-right"></i></button>
                      </div>
                    </div>
                  </form>
                  <?php
                    error_reporting(0);
                    if(isset($_GET['trxNum'])){
                      $trxNum = mysqli_real_escape_string($conn,$_GET['trxNum']);
                      $cektrx = mysqli_query($conn,"SELECT * FROM `tb_order` WHERE `no_hp` = '$trxNum' OR `kd_transaksi` = '$trxNum'") or die(mysqli_error());
                      $ctt = mysqli_num_rows($cektrx);
                      if($ctt == 0){
                        echo '
                          <div class="modal-body pt-5 pb-5 text-center">
                            <i class="fa fa-exclamation-triangle fa-5x mb-3" style="font-size: 100px;"></i><br>
                            <p style="font-size: 18px;">Transaksi Yang Anda Cari Tidak ditemukan!</p>
                          </div>
                        ';
                      }
                      else {
                        $ct = mysqli_fetch_array($cektrx);
                        $trxID = $ct['trxID'];
                        $usersID = $ct['id_user'];
                        $total = $ct['sub_total'];
                        $jenis = $ct['jenis'];
                  ?>
                  <p>Transaksi Anda ditemukan, berikut adalah status pesanan dengan No. Transaksi <strong><?php echo $trxNum; ?></strong>.</p>
                  <hr style="background-color: var(--bg-color); opacity: .5;">
                  <div class="row">
                    <div class="col">
                      <p>No. Transaksi:</p>
                    </div>
                    <div class="col">
                      <strong><?php echo $trxNum; ?></strong>
                    </div>
                  </div>
                  <?php
                    if($ct['status'] == 0){
                  ?>
                  <hr style="background-color: #b8b8b8; opacity: .5;">
                  <div class="row">
                    <div class="col">
                      <p>Status Pesanan:</p>
                    </div>
                    <div class="col">
                      <a href="<?php echo $urlweb; ?>/payment/?trxID=<?php echo $_GET['trxNum']; ?>"><button class="btn btn-warning btn-sm"><strong>BELUM DIBAYAR</strong></button></a>
                    </div>
                  </div>
                  <?php
                    }
                    else {
                  ?>
                  <hr style="background-color: #b8b8b8; opacity: .5;">
                  <div class="row">
                    <div class="col">
                      <p>Status Pesanan:</p>
                    </div>
                    <div class="col">
                    <a href="#"><button class="btn <?php if($ct['status'] == 1){ echo 'btn-warning'; } else if($ct['status'] == 2){ echo 'btn-success'; } else if($ct['status'] == 3){ echo 'btn-danger'; } ?> btn-sm">
                      <strong>
                      <?php
                        if($ct['status'] == 1){
                          echo 'DIPROSES';
                        }
                        else if($ct['status'] == 2){
                          echo 'SELESAI';
                        }
                        else if($ct['status'] == 3){
                          echo 'GAGAL';
                        }
                      ?>  
                      </strong>
                    </button></a>
                    </div>
                  </div>
                  <hr style="background-color: #b8b8b8; opacity: .5;">
                  <div class="row">
                    <div class="col">
                      <p>Catatan:</p>
                    </div>
                    <div class="col">
                      <?php echo $ct['note']; ?>
                    </div>
                  </div>
                  <?php } ?>
                  <hr style="background-color: #b8b8b8; opacity: .5;">
                  <div class="row">
                    <div class="col">
                      <p>Kategori Layanan:</p>
                    </div>
                    <div class="col">
                      <strong><?php echo $ct['kategori']; ?></strong>
                    </div>
                  </div>
                  <hr style="background-color: #b8b8b8; opacity: .5;">
                  <div class="row">
                    <div class="col">
                      <p>Nominal Layanan:</p>
                    </div>
                    <div class="col">
                      <strong><?php echo $ct['title']; ?></strong>
                    </div>
                  </div>
                  <hr style="background-color: #b8b8b8; opacity: .5;">
                  <div class="row">
                    <div class="col">
                      <p>Data Target:</p>
                    </div>
                    <div class="col">
                      <strong><?php echo $ct['userID']; ?> (<?php echo $ct['zoneID']; ?>)<br><?php echo $ct['nickname']; ?></strong>
                    </div>
                  </div>
                  <hr style="background-color: #b8b8b8; opacity: .5;">
                  <p>Jika status pesanan <strong>GAGAL</strong> atau berstatus <strong>DIPROSES</strong> lebih dari 12 jam silahkan hubungi admin kami melalui Whatsapp.</p>
                  <div class="text-left">
                    <a href="https://wa.me/<?php echo $s1b['no_hp']; ?>" class="btn btn-success" target="_blank">Whatsapp Admin</a>
                  </div>
                  <?php }} ?>         
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="d-block d-sm-none" style="height: 100px;"></div>
    <!--Start Back To Top Button-->
    <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>
    <!--End Back To Top Button-->
  
    <!--Start footer-->
    <?php include('footer.php'); ?>
</body>
</html>
