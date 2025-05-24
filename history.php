<?php include('session.php'); ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Riwayat Transaksi - <?php echo $s0['instansi']; ?></title>
  <meta name="description" content="<?php echo $s0['deskripsi']; ?>">
  <meta name="keywords" content="<?php echo $s0['keyword']; ?>">
  <meta property="og:title" content="Riwayat Transaksi - <?php echo $s0['instansi']; ?>"/>
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
              <div class="card shadow-sm">
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
                        <tr class="text-white" style="background-color: var(--secondary-color);">
                          <th class="text-center" style="vertical-align: middle; font-size: 12px; border: 0;">No</th>
                          <th class="text-center" style="vertical-align: middle; font-size: 12px; border: 0;">Tanggal</th>
                          <th class="text-center" style="vertical-align: middle; font-size: 12px; border: 0;">No. Transaksi</th>
                          <th class="text-center" style="vertical-align: middle; font-size: 12px; border: 0;">Produk</th>
                          <th class="text-center" style="vertical-align: middle; font-size: 12px; border: 0;">Harga</th>
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
                          $sql_1 = mysqli_query($conn,"SELECT * FROM `tb_order` WHERE id_user = '$userID' ORDER BY cuid DESC LIMIT $posisi, $batas") or die(mysqli_error());
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
                              $produkID = $s1['produkID'];
                              $kategori = $s1['kategori'];
                              $kdTransaksi = $s1['kd_transaksi'];
                              $cekTesti = mysqli_query($conn,"SELECT * FROM `tb_testi` WHERE kd_transaksi = '$kdTransaksi'") or die(mysqli_error());
                              $ct = mysqli_num_rows($cekTesti);
                              $sql_6 = mysqli_query($conn,"SELECT * FROM `tb_kategori` WHERE kategori = '$kategori'") or die(mysqli_error());
                              $s6 = mysqli_fetch_array($sql_6);
                              $catIDD = $s6['cuid'];
                        ?>
                        <tr>
                          <td class="text-center" style="vertical-align: middle; white-space: normal; color: var(--font-color); font-size: 10px; border: 0;"><?php echo $no; ?></td>
                          <td class="text-center" style="vertical-align: middle; white-space: normal; color: var(--font-color); font-size: 10px; border: 0;"><?php echo $s1['created_date']; ?></td>
                          <td class="text-center" style="vertical-align: middle; white-space: normal; color: var(--font-color); font-size: 10px; border: 0;"><a href="<?php echo $urlweb; ?>/cektrx/?trxNum=<?php echo $s1['kd_transaksi']; ?>" class="text-success"><?php echo $s1['kd_transaksi']; ?></a></td>
                          <td class="text-left" style="vertical-align: middle; white-space: normal; color: var(--font-color); font-size: 10px; border: 0;"><?php echo $s1['kategori']; ?><br><small><?php echo $s1['title']; ?></small><br><small><?php echo $s1['userID']; ?>(<?php echo $s1['zoneID']; ?>)</small></td>
                          <td class="text-center" style="vertical-align: middle; white-space: normal; color: var(--font-color); font-size: 10px; border: 0;"><?php echo number_format($s1['sub_total']); ?></td>
                          <td class="text-center" style="vertical-align: middle; white-space: normal; color: var(--font-color); font-size: 10px; border: 0;">
                            <?php
                              if($s1['status'] == 0){
                                echo '<span class="badge badge-primary p-2">Menunggu</span>';
                              }
                              else if($s1['status'] == 1){
                                echo '<span class="badge badge-warning p-2">Diproses</span>';
                              }
                              else if($s1['status'] == 2){
                                echo '<span class="badge badge-success p-2">Berhasil</span><br>';
                                if($ct == 0){
                                  echo '<span class="badge badge-primary p-2" data-toggle="modal" data-target="#formdepo'.$s1['cuid'].'" data-backdrop="static" data-keyboard="false">Feedback</span>';
                                }
                              }
                              else if($s1['status'] == 3){
                                echo '<span class="badge badge-danger p-2">Gagal</span>';
                              }
                            ?>
                          </td>
                        </tr>
                        <!-- Modal -->
                        <div class="modal fade" id="formdepo">
                          <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content animated bounceIn" style="background: #191f50!important; color: #fff!important;">
                              <div class="modal-header">
                                <h5 class="modal-title" style="color: #fff;">Form Feedback</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">&times;</span>
                                </button>
                              </div>
                              <div class="modal-body" style="white-space: normal;">
                                <p>Feedback Anda sangat berguna untuk memotivasi kami dalam memberikan pelayanan yang terbaik.</p>
                                <form role="form" action="<?php echo $urlweb; ?>/functions/feedback.php" method="post">
                                  <input type="hidden" name="full_name" class="form-control" value="<?php echo $u['email']; ?>">
                                  <input type="hidden" name="produkID" class="form-control" value="<?php echo $s6['cuid']; ?>">
                                  <input type="hidden" name="kd_transaksi" class="form-control" value="<?php echo $s1['kd_transaksi']; ?>">
                                  <textarea class="form-control mb-2" name="content"></textarea>
                                  <button type="submit" class="btn btn-warning btn-block">Submit</button>
                                </form>
                              </div>
                            </div>
                          </div>
                        </div>
                        <?php }} ?>
                      </tbody>
                    </table>
                  </div>
                  <?php
                    $apanya = mysqli_query($conn,"SELECT * FROM `tb_order` WHERE id_user = '$userID'") or die(mysqli_error());
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
                      <li class="page-item<?php echo $link_active; ?>"><a class="page-link" href="<?php echo $urlweb; ?>/history/?page=<?php echo $i; ?>" style="background: none; color: #fff;"><?php echo $i; ?></a></li>
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
