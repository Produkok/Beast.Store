<?php include('session.php'); ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Affiliate - <?php echo $s0['instansi']; ?></title>
  <meta name="description" content="<?php echo $s0['deskripsi']; ?>">
  <meta name="keywords" content="<?php echo $s0['keyword']; ?>">
  <meta property="og:title" content="Affiliate - <?php echo $s0['instansi']; ?>"/>
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
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-4">
                      <img src="<?php echo $urlweb; ?>/upload/refer.png" class="img-fluid" style="display: block; margin: 0 auto;">
                    </div>
                    <div class="col-sm-8">
                      <p style="font-size: 18px;">Bagikan link referral ke teman anda dan Dapatkan Komisi Menarik dari setiap transaksi yang dilakukan oleh affiliate Anda :</p>
                      <div class="input-group">
                        <input type="text" class="form-control text-white" style="color: #000!important;" value="<?php echo $urlweb; ?>/register/?ref=<?php echo $u['user']; ?>" aria-describedby="button-addon2" disabled>
                        <div class="input-group-append">
                          <button class="btn btn-danger clip" onclick="copy_affiliate()" data-clipboard-text="<?php echo $urlweb; ?>/register/?ref=<?php echo $u['user']; ?>" style="border: 0!important; border-top-left-radius: 0px!important;  border-bottom-left-radius: 0px!important;" id="button-addon2">
                            <i class="fa fa-copy"></i> Salin
                          </button>
                        </div>
                      </div>
                    </div>
                    <div class="col-sm-12 mt-3">
                      <div class="table-responsive">
                        <table class="table table-striped">
                          <thead>
                            <tr class="text-white" style="background-color: var(--secondary-color);">
                              <th class="text-center" style="vertical-align: middle; font-size: 12px; border: 0;">#</th>
                              <th class="text-center" style="vertical-align: middle; font-size: 12px; border: 0;">Username</th>
                              <th class="text-center" style="vertical-align: middle; font-size: 12px; border: 0;">Affiliate Commission</th>
                            </tr>
                          </thead>
                          <tbody>
                            <?php
                              error_reporting(0);
                              $batas = 20;
                              $page = isset( $_GET['page'] ) ? $_GET['page'] : "";
                              if ( empty( $page ) ) {
                                $posisi = 0;
                                $page = 1;
                              } else {
                                $posisi = ( $page - 1 ) * $batas;
                              }
                              $sql_1 = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE `uplineID` = '$userID' ORDER BY cuid ASC LIMIT $posisi, $batas") or die(mysqli_error());
                              $no=0;
                              $s11 = mysqli_num_rows($sql_1);
                              if($s11 == 0){
                                echo '
                                  <tr>
                                    <td colspan="3" class="text-center" style="vertical-align: middle; white-space: normal; color: var(--font-color); font-size: 10px; border: 0;">Data Tidak Tersedia</td>
                                  </tr>
                                ';
                              }
                              else {
                                while($s1 = mysqli_fetch_array($sql_1)){
                                  $no++;
                                  $cuid = $s1['cuid'];
                                  $sql_jenis = mysqli_query($conn,"SELECT SUM(komisi) as totalKomisi FROM `tb_order` WHERE id_user = '$cuid' AND status = 2") or die(mysqli_error());
                                  $sj = mysqli_fetch_array($sql_jenis);
                            ?>
                            <tr>
                              <td class="text-center" style="vertical-align: middle; white-space: normal; color: var(--font-color); font-size: 10px; border: 0;"><?php echo $no; ?></td>
                              <td class="text-left" style="vertical-align: middle; white-space: normal; color: var(--font-color); font-size: 10px; border: 0;">
                                <?php echo $s1['user']; ?>
                              </td>
                              <td class="text-right" style="vertical-align: middle; white-space: normal; color: var(--font-color); font-size: 10px; border: 0;">
                                Rp. <?php echo number_format($sj['totalKomisi']); ?>
                              </td>
                            </tr>
                            <?php }} ?>
                          </tbody>
                        </table>
                      </div>
                      <span><small>* Komisi Affiliasi diambil dari markup harga jual basic member atau reseller member.</small></span>
                      <?php
                        $apanya = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE `uplineID` = '$userID'") or die(mysqli_error());
                        $jml_data = mysqli_num_rows($apanya);
                        if($jml_data > $batas){
                      ?>
                      <nav>
                        <ul class="pagination pagination-separate pagination-outline-success justify-content-end">
                          <?php
                            $JmlHalaman = ceil($jml_data/$batas);
                            $jumlah_number = 5;        
                            $start_number = ($page > $jumlah_number)? $page - $jumlah_number : 1;
                            $end_number = ($page < ($JmlHalaman - $jumlah_number))? $page + $jumlah_number : $JmlHalaman;
                            for($i = $start_number; $i <= $end_number; $i++){
                              $link_active = ($page == $i)? ' active' : '';
                          ?>
                          <li class="page-item<?php echo $link_active; ?>"><a class="page-link" href="<?php echo $urlweb; ?>/refferal/?page=<?php echo $i; ?>" style="background: none; color: #fff;"><?php echo $i; ?></a></li>
                          <?php } ?>
                        </ul>
                      </nav>
                      <?php } ?>
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
