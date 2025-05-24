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

$stat = mysqli_query($conn,"INSERT INTO `tb_stat` (`ip`, `date`, `hits`, `page`, `user`) VALUES ('$ip', '$date', 1, 'Register Akun', '$pengguna')") or die (mysqli_error());
if(isset($_GET['ref'])){
  $reff = $_GET['ref'];
  $cekAffiliate = mysqli_query($conn,"SELECT * FROM `tb_affiliate` WHERE ip = '$ip' AND trxID = ''") or die(mysqli_error());
  $ca = mysqli_num_rows($cekAffiliate);
  if($ca == 0){
    $insertAff = mysqli_query($conn,"INSERT INTO `tb_affiliate` (`ip`, `date`, `user`, `trxID`) VALUES ('$ip', '$date', '$reff', '')") or die (mysqli_error());
  }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Register Akun - <?php echo $s0['instansi']; ?></title>
  <meta name="description" content="<?php echo $s0['deskripsi']; ?>">
  <meta name="keywords" content="<?php echo $s0['keyword']; ?>">
  <meta property="og:title" content="Register Akun - <?php echo $s0['instansi']; ?>"/>
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
    <div class="pt-5 pb-5">
      <div class="container">
       <div class="row">
          <div class="col-lg-3"></div>
          <div class="col-lg-6">
            <div class="pt-5 pb-2 text-center">
              <a href="<?php echo $urlweb; ?>">
                <img src="<?php echo $urlweb; ?>/upload/<?php echo $s0['image']; ?>" class="img-fluid" style="display: block; margin: 0 auto;" alt="logo icon">
              </a>
              <p class="text-white">Silahkan Isi Form Dibawah Untuk Melakukan Pendaftaran Akun.</p>
              <hr>
            </div>
            <div class="pb-3">
              <div class="section">
                <div class="card-body">
                  <?php
                      error_reporting(0);
                      if (!empty($_GET['error'])) {
                        if ($_GET['error'] == 1) {
                          echo '
                            <div class="alert alert-warning alert-dismissible mb-3" role="alert">
                              <button type="button" class="close" data-dismiss="alert">&times;</button>
                              <div class="alert-icon">
                                <i class="fa fa-exclamation-triangle"></i>
                              </div>
                              <div class="alert-message">
                                <span><strong>Warning!</strong> Oops ... Sepertinya terjadi kesalahan!</span>
                              </div>
                            </div>
                          ';
                        }
                        if ($_GET['error'] == 2) {
                          echo '
                            <div class="alert alert-warning alert-dismissible mb-3" role="alert">
                              <button type="button" class="close" data-dismiss="alert">&times;</button>
                              <div class="alert-icon">
                                <i class="fa fa-exclamation-triangle"></i>
                              </div>
                              <div class="alert-message">
                                <span><strong>Warning!</strong> Oops ... Alamat Email atau Username sudah digunakan, gunakan alamat Email atau Username lainnya!</span>
                              </div>
                            </div>
                          ';
                        }
                        if ($_GET['error'] == 3) {
                          echo '
                            <div class="alert alert-success alert-dismissible mb-3" role="alert">
                              <button type="button" class="close" data-dismiss="alert">&times;</button>
                              <div class="alert-icon">
                                <i class="fa fa-check"></i>
                              </div>
                              <div class="alert-message">
                                <span><strong>Well Done!</strong> Pendaftaran berhasil , Silahkan login!!</span>
                              </div>
                            </div>
                          ';
                        }
                      }
                    ?>
                    <form role="form" class="mt-3" action="<?php echo $urlweb; ?>/functions/step-1.php" method="POST">
                      <div class="form-group mb-2">
                        <p class="text-white">Username</p>
                        <input type="text" name="user" class="form-control" value="" placeholder="Hanya Masukan Huruf kecil dan Angka Tanpa Spesial Karakter, Minimal 6 Karakter" pattern="[0-9a-z]{6,}" title="Hanya Masukan Huruf kecil dan Angka Tanpa Spasi, Minimal 6 Karakter" required>
                      </div>
                      <div class="form-group mb-2">
                        <p class="text-white">Password</p>
                        <input type="password" name="pass" class="form-control" value="" placeholder="Kombinasi Huruf dan Angka Tanpa Spesial Karakter, Minimal 8 Karakter" pattern="[A-Z0-9a-z]{8,}" title="Kombinasi Huruf dan Angka Tanpa Spesial Karakter, Minimal 8 Karakter" required>
                      </div>
                      <div class="form-group mb-2">
                        <p class="text-white">Nama Lengkap</p>
                        <input type="text" name="full_name" class="form-control" value="" placeholder="Nama Lengkap Anda" pattern="[A-Za-z\s]{8,}+" title="Hanya Masukan Huruf" required>
                      </div>
                      <div class="form-group mb-2">
                        <p class="text-white">Alamat Email</p>
                        <input type="email" name="email" class="form-control" placeholder="Alamat email valid" value="" required>
                      </div>
                      <div class="form-group mb-2">
                        <p class="text-white">No. Whatsapp</p>
                        <input type="text" name="no_hp" class="form-control" placeholder="No. Whatsapp aktif! Ex : 08123456789" value="" pattern="[0-9]+" title="Nomor Whatsapp Tidak Valid" required>
                      </div>
                      <div class="form-group mb-2">
                        <p class="text-white">PIN Transaksi</p>
                        <input type="password" name="pinTrx" class="form-control" placeholder="PIN Transaksi | 6 Digit" value="" pattern="[0-9]{6,6}+" title="Pin Transaksi 6 Digit" required>
                      </div>
                      <div class="form-group mb-2">
                        <p class="text-white">Diundang Oleh</p>
                        <input type="text" name="upline" class="form-control" value="<?php if(isset($_GET['ref'])) { echo $_GET['ref']; } ?>">
                      </div>
                      <button type="submit" name="submit" value="submit" class="btn btn-primary btn-block mt-3">Buat Akun</button>
                      <hr>
                        <p class="text-center text-white">Sudah Punya Akun?</p>
                        <a href="<?php echo $urlweb; ?>/login/" class="btn btn-danger btn-block">Masuk Akun!</a>
                    </form>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3"></div>
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
