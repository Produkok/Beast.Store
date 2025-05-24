<?php include('session.php'); ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Dashboard - <?php echo $s0['instansi']; ?></title>
  <meta name="description" content="<?php echo $s0['deskripsi']; ?>">
  <meta name="keywords" content="<?php echo $s0['keyword']; ?>">
  <meta property="og:title" content="Dashboard - <?php echo $s0['instansi']; ?>"/>
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
              <div class="section">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-6">
                      <small style=" font-size: 18px;">Selamat Datang</small>
                      <p style="line-height: 22px; font-size: 24px; color: #fff;"><?php echo $u['user']; ?><br>
                      <small class="text-white" style="font-size: 14px!important;">Terakhir Masuk : <?php echo date('d M Y H:i:s', strtotime($u['last_login'])); ?></small></p>
                    </div>
                    <div class="col-sm-6">
                      <div class="row">
                        <div class="col-6">
                          <a class="nav-link text-center" href="<?php echo $urlweb; ?>/wallet/" style="font-size: 12px; font-weight: 700!important;"><i class="fa fa-wallet fa-2x"></i><br>Top Up</a>
                        </div>
                        <div class="col-6">
                          <a class="nav-link text-center" href="#" data-toggle="modal" data-target="#modalBalance" style="font-size: 12px;  font-weight: 700!important; color: #fff; padding-top: 20px;">
                            Rp. <?php echo number_format($s3['active']); ?><br>Saldo Saya
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="mt-2 mb-3 text-white" style="background-color: var(--bg-cardcolor); color: #000; padding: 10px;">
                    <h5 class="text-white mb-0">INFORMASI AKUN</h5>
                  </div>
                  
                  <div class="row">
                    <div class="col-sm-6 mb-3">
                      <div class="text-white p-2 pb-0" style="background: #151819;">
                        <table class="table mb-0">
                          <tbody>
                            <tr class="text-white">
                              <td class="text-right" style="border-top: 0; text-transform: uppercase; font-size: 12px;">FULL NAME</td>
                              <td class="text-center" style="border-top: 0; text-transform: uppercase; font-size: 12px;">:</td>
                              <td class="text-left" style="border-top: 0; text-transform: uppercase; font-size: 12px;"><?php echo $u['full_name']; ?></td>
                            </tr>
                            <tr class="text-white">
                              <td class="text-right" style="border-top: 0; text-transform: uppercase; font-size: 12px;">EMAIL</td>
                              <td class="text-center" style="border-top: 0; text-transform: uppercase; font-size: 12px;">:</td>
                              <td class="text-left" style="border-top: 0; text-transform: uppercase; font-size: 12px;"><?php echo $u['email']; ?></td>
                            </tr>
                            <tr class="text-white">
                              <td class="text-right" style="border-top: 0; text-transform: uppercase; font-size: 12px;">JENIS MEMBER</td>
                              <td class="text-center" style="border-top: 0; text-transform: uppercase; font-size: 12px;">:</td>
                              <td class="text-left" style="border-top: 0; text-transform: uppercase; font-size: 12px;"><?php if($u['level'] == 'reseller') { echo ' Reseller'; } else { echo 'Basic'; } ?> Member</td>
                            </tr>
                            <tr class="text-white">
                              <td class="text-right" style="border-top: 0; text-transform: uppercase; font-size: 12px;">POIN SAYA</td>
                              <td class="text-center" style="border-top: 0; text-transform: uppercase; font-size: 12px;">:</td>
                              <td class="text-left" style="border-top: 0; text-transform: uppercase; font-size: 12px;"><?php echo $u['poin']; ?> Poin</td>
                            </tr>
                            <tr class="text-white">
                              <td class="text-right" style="border-top: 0; text-transform: uppercase; font-size: 12px;">AFFILIATE</td>
                              <td class="text-center" style="border-top: 0; text-transform: uppercase; font-size: 12px;">:</td>
                              <td class="text-left" style="border-top: 0; text-transform: uppercase; font-size: 12px;"><?php echo $u['reff']; ?></td>
                            </tr>
                            <tr class="text-white">
                              <td class="text-center" colspan="3" style="border-top: 0; text-transform: uppercase; font-size: 12px;">
                                <a href="<?php echo $urlweb; ?>/e_user/" class="btn btn-primary btn-block"><i class="fa fa-edit"></i>&nbsp; Ubah Profile</a>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                    </div>
                    <div class="col-sm-6 mb-3">
                      
                    </div>
                  </div>

                  <div class="mt-2 mb-3 text-white" style="background-color: var(--bg-cardcolor); color: #000; padding: 10px;">
                    <h5 class="text-white mb-0">RIWAYAT TRANSAKSI</h5>
                  </div>

                  <div class="row">
                    <?php
                      $transaksiUnpaid = mysqli_query($conn,"SELECT * FROM `tb_order` WHERE id_user = '$userID' AND status = 0") or die(mysqli_error());
                      $tu = mysqli_num_rows($transaksiUnpaid);
                      $transaksiPaid = mysqli_query($conn,"SELECT * FROM `tb_order` WHERE id_user = '$userID' AND status = 1") or die(mysqli_error());
                      $tp = mysqli_num_rows($transaksiPaid);
                      $transaksiFinish = mysqli_query($conn,"SELECT * FROM `tb_order` WHERE id_user = '$userID' AND status = 2") or die(mysqli_error());
                      $tf = mysqli_num_rows($transaksiFinish);
                      $transaksiGagal = mysqli_query($conn,"SELECT * FROM `tb_order` WHERE id_user = '$userID' AND status = 3") or die(mysqli_error());
                      $tg = mysqli_num_rows($transaksiGagal);
                    ?>
                    <div class="col-sm-3 col-6 text-center pt-3 pb-3">
                      <p class="text-warning" style="font-size: 32px; line-height: 22px; font-weight: 700!important; color: #fff;">
                        <?php echo number_format($tu); ?>
                      </p>
                      <p class="text-warning" style="color: #fff;">
                        BELUM BAYAR
                      </p>
                    </div>
                    <div class="col-sm-3 col-6 text-center pt-3 pb-3">
                      <p class="text-info" style="font-size: 32px; line-height: 22px; font-weight: 700!important; color: #fff;">
                        <?php echo number_format($tp); ?>
                      </p>
                      <p class="text-info" style="color: #fff;">
                        DIPROSES
                      </p>
                    </div>
                    <div class="col-sm-3 col-6 text-center pt-3 pb-3">
                      <p class="text-success" style="font-size: 32px; line-height: 22px; font-weight: 700!important; color: #fff;">
                        <?php echo number_format($tf); ?>
                      </p>
                      <p class="text-success" style="color: #fff;">
                        SELESAI
                      </p>
                    </div>
                    <div class="col-sm-3 col-6 text-center pt-3 pb-3">
                      <p class="text-danger" style="font-size: 32px; line-height: 22px; font-weight: 700!important; color: #fff;">
                        <?php echo number_format($tg); ?>
                      </p>
                      <p class="text-danger" style="color: #fff;">
                        GAGAL
                      </p>
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
    <script>
      $(document).ready(function() {
        //Default data table
        $('#default-datatable').DataTable();
      });
    </script>
</body>
</html>
