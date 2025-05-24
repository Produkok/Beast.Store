<?php include('session.php'); ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Saldo Saya - <?php echo $s0['instansi']; ?></title>
  <meta name="description" content="<?php echo $s0['deskripsi']; ?>">
  <meta name="keywords" content="<?php echo $s0['keyword']; ?>">
  <meta property="og:title" content="Saldo Saya - <?php echo $s0['instansi']; ?>"/>
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
                    <div class="col-6 text-center pt-3 pb-3">
                      <p class="text-success" style="font-size: 18px; line-height: 22px; font-weight: 700!important; color: #fff;">
                        Rp. <?php echo number_format($s3['active']); ?>
                      </p>
                      <p class="text-success" style="color: #fff;">
                        TERSEDIA
                      </p>
                    </div>
                    <div class="col-6 text-center pt-3 pb-3">
                      <p class="text-danger" style="font-size: 18px; line-height: 22px; font-weight: 700!important; color: #fff;">
                        Rp. <?php echo number_format($s3['payout']); ?>
                      </p>
                      <p class="text-danger" style="color: #fff;">
                        TERPAKAI
                      </p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card mt-0 mb-0" style="background: none!important;">
                <div class="card-body p-0" style="background: none!important;">
                  <span class="float-right">
                    <button class="btn btn-primary text-white" data-toggle="modal" data-target="#formdepo" data-backdrop="static" data-keyboard="false"><i class="fa fa-plus mr-1"></i> Top Up</button>
                  </span>
                  <!-- Modal -->
                  <div class="modal fade" id="formdepo">
                    <div class="modal-dialog modal-dialog-centered">
                      <div class="modal-content animated bounceIn" style="background-color: var(--primary-color); color: #fff!important;">
                        <div class="modal-header">
                          <h5 class="modal-title" style="color: #fff;">Form Top Up Saldo</h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                        </div>
                        <div class="modal-body">
                          <form role="form" action="<?php echo $urlweb; ?>/functions/topup.php" method="post">
                            <div class="form-group mb-2">
                              <label style="color: #fff;">Nominal Top Up</label>
                              <input type="number" name="nominal" min="10000" max="4500000" step="1000" value="10000" class="form-control" required>
                              <input type="hidden" name="userID" class="form-control" value="<?php echo $userID; ?>">
                            </div>
                            <div class="form-group mb-2">
                              <label style="color: #fff;">Pilih Metode Pembayaran</label>
                              <div class="accordion mt-3" id="accordionExample">
                              <?php
                                for($i=0;$i<4;$i++){
                                  $cekPayment = mysqli_query($conn,"SELECT * FROM `tb_bank` WHERE jenis = '$i' AND status = 1 AND userID = 1") or die(mysqli_error($conn));
                                  $cpp = mysqli_num_rows($cekPayment);
                                  if($cpp > 0){
                              ?>
                              <div class="card box_game mb-2">
                                <div class="card-header pt-1 pb-0 pl-1 pr-1" id="headingOne">
                                  <div class="row">
                                    <div class="col-12">
                                      <h2 class="mb-0">
                                      <button class="btn btn-link btn-block pl-1 text-left" type="button" data-toggle="collapse" data-target="#collapseOne<?php echo $i; ?>" aria-expanded="true" aria-controls="collapseOne<?php echo $i; ?>">
                                        <?php
                                          if($i == 0){
                                            echo '<i class="zmdi zmdi-balance" style="font-size: 18px;"></i>&nbsp; Bank Transfer';
                                          }
                                          else if($i == 1){
                                            echo '<i class="zmdi zmdi-card" style="font-size: 18px;"></i>&nbsp; Virtual Account';
                                          }
                                          else if($i == 3){
                                            echo '<i class="zmdi zmdi-store" style="font-size: 18px;"></i>&nbsp; Convenience Store';
                                          }
                                          else if($i == 2){
                                            echo '<i class="zmdi zmdi-balance-wallet" style="font-size: 18px;"></i>&nbsp; E-Wallet';
                                          }
                                        ?>
                                        
                                      </button>
                                      </h2>
                                    </div>
                                  </div>
                                </div>
                                <div id="collapseOne<?php echo $i; ?>" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                                  <div class="card-body">
                                    <div class="row">
                                      <?php
                                        $no=0;
                                        while($cp = mysqli_fetch_array($cekPayment)){
                                          $no++;
                                      ?>
                                      <div class="col-6 p-1">
                                        <input class="radio-nominal" type="radio" name="metode" value="<?php echo $cp['cuid']; ?>" id="flexRadioDefault<?php echo $no.$i; ?>">
                                        <label for="flexRadioDefault<?php echo $no.$i; ?>">
                                          <div class="row ml-2 mr-2 mb-2 pb-0">
                                            <div class="col-6 p-1">
                                              <div style="background: #fff; width: 100px; height: 30px; overflow: hidden; border-radius: 5px;">
                                                <img src="<?php echo $cp['image']; ?>" style="display: block; width: 100%; height: 100%;">
                                              </div>
                                            </div>
                                            <div class="col-6 p-1"></div>
                                          </div>
                                          <div class="row ml-2 mr-2 pt-0">
                                            <div class="col-12 p-1">
                                              <hr style="width: 100%; border: 1px solid #eee; margin-top: 0px; margin-bottom: 5px;">
                                              <p style="font-weight: 700; font-size: 10px;"><?php echo $cp['akun']; ?></p>
                                            </div>
                                          </div>
                                        </label>
                                      </div>
                                      <?php } ?>
                                    </div>
                                  </div>
                                </div>
                                <div class="card-footer" style="background: none;" data-toggle="collapse" data-target="#collapseOne<?php echo $i; ?>" aria-expanded="true" aria-controls="collapseOne<?php echo $i; ?>">
                                  <div class="float: right;">
                                    <?php
                                      $cekPayment1 = mysqli_query($conn,"SELECT * FROM `tb_bank` WHERE jenis = '$i' AND status = 1 AND userID = 1 ORDER BY cuid ASC LIMIT 4") or die(mysqli_error());
                                      while($cp1 = mysqli_fetch_array($cekPayment1)){
                                    ?>
                                    <img src="<?php echo $cp1['image']; ?>" class="mr-1" style="float: right; display: block; width: auto; height: 15px; margin-left: 5px; background: #fff;">
                                    <?php } ?>
                                  </div>
                                </div>
                              </div>
                              <?php }} ?>
                              </div>
                            </div>
                            <div class="form-group mt-3">
                              <button type="submit" name="submit" class="btn btn-primary btn-block">Proses</button>
                            </div>
                          </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card shadow-sm mt-3">
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
                        <tr class="text-white" style="background-color: var(--secondary-color);">
                          <th class="text-center" style="vertical-align: middle; font-size: 12px; border: 0;">No</th>
                          <th class="text-center" style="vertical-align: middle; font-size: 12px; border: 0;">Tanggal</th>
                          <th class="text-center" style="vertical-align: middle; font-size: 12px; border: 0;">No. Transaksi</th>
                          <th class="text-center" style="vertical-align: middle; font-size: 12px; border: 0;">Jumlah</th>
                          <th class="text-center" style="vertical-align: middle; font-size: 12px; border: 0;">Note</th>
                          <th class="text-center" style="vertical-align: middle; font-size: 12px; border: 0;">Status</th>
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
                          $sql_1 = mysqli_query($conn,"SELECT * FROM `tb_transaksi` WHERE userID = '$userID' ORDER BY cuid DESC LIMIT $posisi, $batas") or die(mysqli_error());
                          $no = 0;
                          $s11 = mysqli_num_rows($sql_1);
                          if($s11 == 0){
                            echo '
                              <tr>
                                <td colspan="6" class="text-center" style="vertical-align: middle; white-space: normal; color: var(--font-color); font-size: 10px; border: 0;">Tidak Ada Transaksi</td>
                              </tr>
                            ';
                          }
                          else {
                            while($s1 = mysqli_fetch_array($sql_1)){
                              $no++;
                              $userID = $s1['userID'];
                              $sql_3 = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE cuid = '$userID'") or die(mysqli_error());
                              $s3 = mysqli_fetch_array($sql_3);
                        ?>
                        <tr>
                          <td class="text-center" style="vertical-align: middle; white-space: normal; color: var(--font-color); font-size: 10px; border: 0;"><?php echo $no; ?></td>
                          <td class="text-center" style="vertical-align: middle; white-space: normal; color: var(--font-color); font-size: 10px; border: 0;"><?php echo $s1['date']; ?></td>
                          <td class="text-center" style="vertical-align: middle; white-space: normal; color: var(--font-color); font-size: 10px; border: 0;"><a href="<?php echo $urlweb; ?>/payment/?trxID=<?php echo $s1['kd_transaksi']; ?>" class="text-success"><?php echo $s1['kd_transaksi']; ?></a></td>
                          <td class="text-right" style="vertical-align: middle; white-space: normal; color: var(--font-color); font-size: 10px; border: 0;"><?php echo number_format($s1['total']); ?></td>
                          <td class="text-center" style="vertical-align: middle; white-space: normal; color: var(--font-color); font-size: 10px; border: 0;"><?php echo $s1['note']; ?></td>
                          <td class="text-center" style="vertical-align: middle; white-space: normal; color: var(--font-color); font-size: 10px; border: 0;">
                            <?php
                              if($s1['status'] == 0){
                                echo '<span class="badge badge-warning p-2">Pending</span>';
                              }
                              else if($s1['status'] == 1){
                                echo '<span class="badge badge-success p-2">Success</span>';
                              }
                              else if($s1['status'] == 2){
                                echo '<span class="badge badge-danger p-2">Refund</span>';
                              }
                            ?>
                          </td>
                        </tr>
                        <?php }} ?>
                      </tbody>
                    </table>
                  </div>
                  <?php
                    $apanya = mysqli_query($conn,"SELECT * FROM `tb_transaksi` WHERE userID = '$userID'") or die(mysqli_error());
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
                      <li class="page-item<?php echo $link_active; ?>"><a class="page-link" href="<?php echo $urlweb; ?>/wallet/?page=<?php echo $i; ?>" style="background: none; color: #fff;"><?php echo $i; ?></a></li>
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
    <!--Start Back To Top Button-->
    <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>
    <!--End Back To Top Button-->
	
	  <!--Start footer-->
    <?php include('footer.php'); ?>
    <script>
      $(document).ready(function() {
        //Default data table
        $('#default-datatable').DataTable();
      });
    </script>
</body>
</html>
