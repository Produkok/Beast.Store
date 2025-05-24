<?php include('session.php'); ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Profile Saya - <?php echo $s0['instansi']; ?></title>
  <meta name="description" content="<?php echo $s0['deskripsi']; ?>">
  <meta name="keywords" content="<?php echo $s0['keyword']; ?>">
  <meta property="og:title" content="Profile Saya - <?php echo $s0['instansi']; ?>"/>
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
          <div class="col-sm-3 d-none d-sm-block">
            <?php include('sidebar.php'); ?>
          </div>
          <div class="col-sm-9">
            <div class="pb-3">
              <div class="card shadow-sm">
                <div class="card-body p-0">
                  <ul class="nav nav-tabs" id="myTab" role="tablist" style="width: 100%!important; border-bottom-left-radius: 10px !important; border-bottom-right-radius: 10px !important;">
                    <li class="nav-item" role="presentation" style="width: 33.3%; border-bottom-left-radius: 10px !important;">
                      <a class="nav-link<?php if(!isset($_GET['notif']) || $_GET['notif'] == 1){ echo ' active'; } ?> text-white" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="true" style="font-size: 10px;">
                        Profile
                      </a>
                    </li>
                    <li class="nav-item" role="presentation" style="width: 33.3%; border-bottom-left-radius: 10px !important;">
                      <a class="nav-link<?php if(isset($_GET['notif'])) { if($_GET['notif'] == 2 || $_GET['notif'] == 4){ echo ' active'; }} ?> text-white" id="security-tab" data-toggle="tab" href="#security" role="tab" aria-controls="security" aria-selected="true" style="font-size: 10px;">
                        Security
                      </a>
                    </li>
                    <li class="nav-item" role="presentation" style="width: 33.3%; border-bottom-left-radius: 10px !important;">
                      <a class="nav-link<?php if(isset($_GET['notif'])) { if($_GET['notif'] == 3 || $_GET['notif'] == 5 || $_GET['notif'] == 6){ echo ' active'; }} ?> text-white" id="passowrd-tab" data-toggle="tab" href="#passowrd" role="tab" aria-controls="passowrd" aria-selected="true" style="font-size: 10px;">
                        Password
                      </a>
                    </li>
                  </ul>
                  <?php
                    error_reporting(0);
                    if (!empty($_GET['notif'])) {
                      if ($_GET['notif'] == 1) {
                        echo '
                          <div class="alert alert-success alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <div class="alert-icon">
                              <i class="fa fa-check"></i>
                            </div>
                            <div class="alert-message">
                              <span><strong>Well done!</strong> Profil berhasil disimpan!</span>
                            </div>
                          </div>
                        ';
                      }
                      if ($_GET['notif'] == 2) {
                        echo '
                          <div class="alert alert-success alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <div class="alert-icon">
                              <i class="fa fa-check"></i>
                            </div>
                            <div class="alert-message">
                              <span><strong>Well done!</strong> Pin Transaksi berhasil disimpan!</span>
                            </div>
                          </div>
                        ';
                      }
                      if ($_GET['notif'] == 3) {
                        echo '
                          <div class="alert alert-success alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <div class="alert-icon">
                              <i class="fa fa-check"></i>
                            </div>
                            <div class="alert-message">
                              <span><strong>Well done!</strong> Password berhasil disimpan!</span>
                            </div>
                          </div>
                        ';
                      }
                      if ($_GET['notif'] == 4) {
                        echo '
                          <div class="alert alert-warning alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <div class="alert-icon">
                              <i class="fa fa-exclamation-circle"></i>
                            </div>
                            <div class="alert-message">
                              <span><strong>Warning!</strong> Password yang Anda Masukan Salah!</span>
                            </div>
                          </div>
                        ';
                      }
                      if ($_GET['notif'] == 5) {
                        echo '
                          <div class="alert alert-warning alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <div class="alert-icon">
                              <i class="fa fa-exclamation-circle"></i>
                            </div>
                            <div class="alert-message">
                              <span><strong>Warning!</strong> Password yang Anda Masukan Tidak Sama!</span>
                            </div>
                          </div>
                        ';
                      }
                      if ($_GET['notif'] == 6) {
                        echo '
                          <div class="alert alert-warning alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <div class="alert-icon">
                              <i class="fa fa-exclamation-circle"></i>
                            </div>
                            <div class="alert-message">
                              <span><strong>Warning!</strong> Password yang Anda Masukan Salah!</span>
                            </div>
                          </div>
                        ';
                      }
                      if ($_GET['notif'] == 7) {
                        echo '
                          <div class="alert alert-warning alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <div class="alert-icon">
                              <i class="fa fa-exclamation-circle"></i>
                            </div>
                            <div class="alert-message">
                              <span><strong>Warning!</strong> Pin Transaksi yang Anda Masukan Salah!</span>
                            </div>
                          </div>
                        ';
                      }
                      if ($_GET['notif'] == 8) {
                        echo '
                          <div class="alert alert-warning alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <div class="alert-icon">
                              <i class="fa fa-exclamation-circle"></i>
                            </div>
                            <div class="alert-message">
                              <span><strong>Warning!</strong> Pin Transaksi Baru Telah Dikirim Ke Email Anda!</span>
                            </div>
                          </div>
                        ';
                      }
                      if ($_GET['notif'] == 9) {
                        echo '
                          <div class="alert alert-success alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <div class="alert-icon">
                              <i class="fa fa-check"></i>
                            </div>
                            <div class="alert-message">
                              <span><strong>Well done!</strong> Kami telah mengirimkan PIN Sementara ke nomor Whatsapp Anda!</span>
                            </div>
                          </div>
                        ';
                      }
                    }
                  ?>
                  <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade<?php if(!isset($_GET['notif']) || $_GET['notif'] == 1){ echo ' show active'; } ?> p-3" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                      <form role="form" class="mt-3" action="<?php echo $urlweb; ?>/functions/edit-user.php" method="POST">
                        <div class="form-group mb-2">
                          <p>Username</p>
                          <input type="text" name="user" class="form-control" value="<?php echo $u['user']; ?>" style="color: #fff!important;" readonly>
                        </div>
                        <div class="form-group mb-2">
                          <p>Nama Lengkap</p>
                          <input type="text" name="full_name" class="form-control" value="<?php echo $u['full_name']; ?>" required>
                        </div>
                        <div class="form-group mb-2">
                          <p>Alamat Email</p>
                          <input type="email" name="email" class="form-control" value="<?php echo $u['email']; ?>" required>
                        </div>
                        <div class="form-group mb-2">
                          <p>No. Whatsapp</p>
                          <input type="text" name="no_hp" class="form-control" value="<?php echo $u['no_hp']; ?>" pattern="[0-9]+" title="No. Whatsapp Tidak Valid" required>
                        </div>
                        <button type="submit" name="submit" value="submit" class="btn btn-primary btn-block mt-3">Simpan</button>
                        
                      </form>
                    </div>
                    <div class="tab-pane<?php if($_GET['notif'] == 2 || $_GET['notif'] == 4 || $_GET['notif'] == 7 || $_GET['notif'] == 8){ echo ' show active'; } ?> fade p-3" id="security" role="tabpanel" aria-labelledby="security-tab">
                      <form role="form" class="mt-3" action="<?php echo $urlweb; ?>/functions/security.php" method="POST">
                        <div class="form-group mb-2">
                          <p>Pin Transaksi Lama</p>
                          <input type="password" name="old_pinTrx" class="form-control" value="" pattern="[0-9]{6,6}+" title="Masukan 6 Angka" required>
                        </div>
                        <div class="form-group mb-2">
                          <p>Pin Transaksi Baru</p>
                          <input type="password" name="pinTrx" class="form-control" value="" pattern="[0-9]{6,6}+" title="Masukan 6 Angka" required>
                        </div>
                        <div class="form-group mb-2">
                          <p>Masukan Password</p>
                          <input type="password" name="pass" class="form-control" required>
                        </div>
                        <button type="submit" name="submit" value="submit" class="btn btn-primary btn-block mt-3">Simpan</button>
                        <a href="<?php echo $urlweb; ?>/functions/reset-pin.php" class="btn btn-danger btn-block">Reset PIN Transaksi!</a>
                      </form>
                    </div>
                    <div class="tab-pane fade<?php if($_GET['notif'] == 3 || $_GET['notif'] == 5 || $_GET['notif'] == 6){ echo ' show active'; } ?> p-3" id="passowrd" role="tabpanel" aria-labelledby="passowrd-tab">
                      <form role="form" class="mt-3" action="<?php echo $urlweb; ?>/functions/password.php" method="POST">
                        <div class="form-group mb-2">
                          <p>Password Baru</p>
                          <input type="password" name="pass" class="form-control" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Kombinasi Huruf dan Angka, Minimal 8 Karakter" required>
                        </div>
                        <div class="form-group mb-2">
                          <p>Ulangi Password Baru</p>
                          <input type="password" name="repass" class="form-control" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Kombinasi Huruf dan Angka, Minimal 8 Karakter" required>
                        </div>
                        <div class="form-group mb-2">
                          <p>Password Lama</p>
                          <input type="password" name="old_pass" class="form-control" required>
                        </div>
                        <button type="submit" name="submit" value="submit" class="btn btn-primary btn-block mt-3">Simpan</button>
                        
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <!--Start Back To Top Button-->
    <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>
    <!--End Back To Top Button-->
  
    <!--Start footer-->
    <?php include('footer.php'); ?>
    <script src="<?php echo $urlweb; ?>/assets/js/clipboard.min.js"></script>
    <script>

      var clipboard = new ClipboardJS('.clip');

      function copy_affiliate() {
        alert("Link Affiliate berhasil di Copy");
      }

    </script>
</body>
</html>
