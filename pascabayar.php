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
$cat = $_GET['cat'];
$sql_6 = mysqli_query($conn,"SELECT * FROM `tb_kategori` WHERE slug = '$cat'") or die(mysqli_error());
$s6 = mysqli_fetch_array($sql_6);
$catIDD = $s6['cuid'];
$jenisnya = $s6['parent'];
$brand = $s6['kategori'];
$sql_7 = mysqli_query($conn,"SELECT * FROM `tb_pascabayar` WHERE kategori = '$brand'") or die(mysqli_error());
$s77 = mysqli_num_rows($sql_7);

?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Tagihan Pascabayar - <?php echo $s0['instansi']; ?></title>
  <meta name="description" content="<?php echo $s0['deskripsi']; ?>">
  <meta name="keywords" content="<?php echo $s0['keyword']; ?>">
  <meta property="og:title" content="Tagihan Pascabayar - <?php echo $s0['instansi']; ?>"/>
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

    <div class="clearfix" style="padding-bottom: 4rem;"></div>
    <div class="pt-2 pb-5">
      <div class="container">
       <div class="row">
          <div class="col-sm-12 mb-0">
            <div class="card shadow-sm p-0 mb-3" style="border-radius: 10px;">
              <div class="card-body p-0 mb-0" style="border-radius: 10px;">
                <img src="<?php echo $urlweb; ?>/upload/<?php echo $s6['banimage']; ?>" class="mb-0" style="width: 100%; min-height: 175px; height: 100%; border-radius: 10px;">
              </div>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="card shadow-sm">
              <div class="card-body">
                <img src="<?php echo $urlweb; ?>/upload/<?php echo $s6['image']; ?>" class="img_product mb-3">
                <h5 style="letter-spacing: 2px;"><?php echo $s6['kategori']; ?></h5>
                <div class="text-justify pt-3 pb-3">
                  <strong>Cara Order :</strong><br>
                  <div style="font-size: 12px;">
                    <?php echo $s6['deskripsi']; ?>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-8">
            <div class="card shadow-sm mb-2" style="border-radius: 10px;">
              <div class="card-body mb-0" style="border-radius: 10px;">
                <div class="text-white text-center position-absolute circle-primary"><span>1</span></div>
                <h5 style="margin-left: 45px; margin-top: 5px;">Input ID Pelanggan</h5>
                <div class="form-row pt-3">
                  <?php
                    if($s77 == 1){
                      $s7 = mysqli_fetch_array($sql_7);
                      echo '
                        <div class="col-12">
                          <input type="number" name="userID" id="userID" class="form-control" placeholder="123456" >
                          <input type="hidden" name="produkID" id="produkID" value="'.$s7['cuid'].'" class="form-control">
                        </div>
                      ';
                    }
                    else {
                      echo '
                        <div class="col-6">
                          <input type="number" name="userID" id="userID" class="form-control" placeholder="123456" >
                        </div>
                        <div class="col-6">
                          <select name="produkID" id="produkID" class="form-control">  
                            <option value="">Jenis Layanan</option>';
                            while($s7 = mysqli_fetch_array($sql_7)){
                              echo '
                              <option value="'.$s7['cuid'].'">'.$s7['title'].'</option>';
                            }
                              echo '
                          </select>
                        </div>
                      ';
                    }
                  ?>
                  <button class="btn btn-primary btn-sm m-1" data-toggle="modal" data-target="#modalhelp"><i class="zmdi zmdi-help"></i> Bantuan</button>
                </div>
                <div class="modal fade" id="modalhelp">
                  <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content text-dark animated bounceIn" style="background: #1e2124;">
                      <div class="modal-body text-left" style="color: #fff!important;">
                        <?php
                          echo $s6['bantuan'];
                        ?>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="card shadow-sm mb-2" style="border-radius: 10px;">
              <div class="card-body mb-0" style="border-radius: 10px;">
                <div class="text-white text-center position-absolute circle-primary"><span>2</span></div>
                <h5 style="margin-left: 45px; margin-top: 5px;">Pilih Pembayaran</h5>
                <div class="accordion mt-3" id="accordionExample">
                <?php
                  for($i=0;$i<4;$i++){
                    $cekPayment = mysqli_query($conn,"SELECT * FROM `tb_bank` WHERE jenis = '$i' AND status = 1 AND userID = 1") or die(mysqli_error());
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
                        <div class="col-sm-4 col-6 p-1">
                          <input class="radio-nominal" type="radio" name="metode" value="<?php echo $cp['cuid']; ?>" id="flexRadioDefault<?php echo $no.$i; ?>">
                          <label for="flexRadioDefault<?php echo $no.$i; ?>">
                            <div class="row ml-2 mr-2 pb-0">
                              <div class="col-6 p-1">
                                <div style="background: #fff; width: 100px; height: 40px; overflow: hidden; border-radius: 5px;">
                                  <img src="<?php echo $cp['image']; ?>" style="display: block; width: 100%; height: 100%;">
                                </div>
                              </div>
                              <div class="col-6 p-1"></div>
                            </div>
                            <div class="row ml-2 mr-2 pt-0">
                              <div class="col-12 p-1">
                                <hr style="width: 100%; border: 1px solid #eee; margin-top: 5px; margin-bottom: 5px;">
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
            </div>
            <div class="card shadow-sm mb-2" style="border-radius: 10px;">
              <div class="card-body mb-0" style="border-radius: 10px;">
                <div class="text-white text-center position-absolute circle-primary"><span>3</span></div>
                <h5 style="margin-left: 45px; margin-top: 5px;">Beli!</h5>
                <div class="form-group pt-3">
                  <?php
                    if (isset($_SESSION['user'])) {
                      $user = mysqli_query($conn, "SELECT * FROM `tb_user` WHERE user = '" . $_SESSION['user'] . "'") or die(mysqli_error());
                      $u = mysqli_fetch_array($user);
                  ?>
                  <input type="hidden" name="full_name" id="fullname" class="form-control" value="<?php echo $u['full_name']; ?>">
                  <input type="hidden" name="email" id="email" class="form-control" value="<?php echo $u['email']; ?>">
                  <input type="hidden" name="IDuser" id="IDuser" class="form-control" value="<?php echo $u['cuid']; ?>">
                  <input type="hidden" name="ipaddress" id="ipaddress" class="form-control" value="<?php echo $ip; ?>">
                  <input type="text" name="no_hp" id="noHp" placeholder="Masukan No. Whatsapp | Ex : 08xxxxxx" class="form-control" value="" pattern="[0-9]+" title="No. Handphone Tidak Valid" required>
                  <?php } else { ?>
                  <input type="hidden" name="full_name" id="fullname" class="form-control" value="Guest">
                  <input type="hidden" name="email" id="email" class="form-control" value="<?php echo $s1b['email']; ?>">
                  <input type="hidden" name="IDuser" id="IDuser" class="form-control" value="1">
                  <input type="hidden" name="ipaddress" id="ipaddress" class="form-control" value="<?php echo $ip; ?>">
                  <input type="text" name="no_hp" id="noHp" placeholder="Masukan No. Whatsapp | Ex : 08xxxxxx" class="form-control" value="" pattern="[0-9]+" title="No. Handphone Tidak Valid" required>
                  <?php } ?>
                  <p class="col-12 mt-2" style="font-size: 10px; color: var(--font-color);">Isi nomor whatsapp kalian jika ingin mendapatkan notifikasi pesanan.<br />Dengan membeli otomatis saya menyutujui <a href="<?php echo $urlweb; ?>/page/?p=ketentuan-layanan" target="_blank" class="text-warning">Ketentuan Layanan</a>.</p>
                  <a id="submitId" value="submit" class="btn btn-primary text-white">Konfirmasi Beli <i class="fa fa-arrow-right"></i></a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="modal fade" id="formorder">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content text-white animated bounceIn" id="hasilnya" style="background: #151819;"></div>
        </div>
      </div>
      <div class="modal fade" id="formvoucher">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content text-white animated bounceIn" id="hasile" style="background: #151819;"></div>
        </div>
      </div>
    </div>
	  <div class="d-block d-sm-none" style="height: 100px;"></div>
    <!--Start Back To Top Button-->
    <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>
    <!--End Back To Top Button-->
	
	  <!--Start footer-->
    <?php include('footer.php'); ?>
    <script>
      $(document).ready(function() {
        $("#submitId").click(function () {
          uri = "<?php echo $urlweb; ?>/get_pasca.php?userID="+$("#userID").val()+"&produkID="+$("#produkID").val()+"&metode="+$('input:radio[name=metode]:checked').val()+"&IDuser="+$("#IDuser").val()+"&noHp="+$("#noHp").val()+"&voucher=";
          $('#formorder').modal('show');
          $('#hasilnya').load(uri);
          console.log(uri);
          return false;
        });
        $("#buttonSubmit").click(function () {
          $("#search_form").submit();
        })
      });
  </script>
</body>
</html>
