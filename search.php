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
  <title>Pencarian Produk - <?php echo $s0['instansi']; ?></title>
  <meta name="description" content="<?php echo $s0['deskripsi']; ?>">
  <meta name="keywords" content="<?php echo $s0['keyword']; ?>">
  <meta property="og:title" content="Pencarian Produk - <?php echo $s0['instansi']; ?>"/>
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
  <!-- Custom Style--> 
  <link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">
  <script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
  <style type="text/css">
    .carousel img {
        width: 90%;
        margin-right: 10px;
    }
    .carousel div.card {
        width: 150px;
        height: 200px;
        margin-right: 10px;
    }
    button.flickity-button {
      display: none;
    }
    @media screen and ( max-width: 768px ) {
      /* half-width cells for larger devices */
      .carousel img { width: 90%; }
      .carousel div.card {
        width: 150px;
      }
    }
  </style>
 
</head>

<body>

  <!-- Start wrapper-->
  <div id="wrapper">

    <!--Start topbar header-->
    <?php include('top_menu.php'); ?>
    <!--End topbar header-->

    <div class="clearfix" style="padding-bottom: 4rem;"></div>
    <div class="pt-2 pb-3">
        <div class="container">
            <div class="carousel"
              data-flickity='{ "wrapAround": true, "imagesLoaded": true, "percentPosition": false, "freeScroll": true, "autoPlay": true, "adaptiveHeight": true }'>
                <?php
                    $sql_2 = mysqli_query($conn,"SELECT * FROM `tb_slide` ORDER BY cuid DESC LIMIT 5") or die(mysqli_error());
                    $no=0;
                    while($s2 = mysqli_fetch_array($sql_2)){
                        $no++;
                ?>
                <img src="<?php echo $urlweb; ?>/upload/<?php echo $s2['image']; ?>" style="border-radius: 10px !important;" onClick="location.href='<?php echo $s2['deskripsi']; ?>';" alt="First slide">
                <?php } ?>
            </div>
        </div>
    </div>

    <div class="container pb-2">
      <div class="row">
        <div class="col-6 d-none d-sm-block">
          <ul class="nav nav-tabs" id="myTab" role="tablist" style="width: 100%!important; border-bottom-left-radius: 10px !important; border-bottom-right-radius: 10px !important;">
            <?php
              $sql_jenis = mysqli_query($conn,"SELECT * FROM `tb_jenis` WHERE status = 1 ORDER BY sort ASC") or die(mysqli_error());
              $h = mysqli_num_rows($sql_jenis);
              $lebar = 100 / $h;
              $no = 0;
              while($sj = mysqli_fetch_array($sql_jenis)){
                $no++;
            ?>
            <li class="nav-item" role="presentation" style="text-align: center;">
              <a class="nav-link" href="<?php echo $urlweb; ?>/#<?php echo str_replace(' ','',strtolower($sj['jenis'])); ?>" style="font-size: 10px;">
                <?php echo $sj['jenis']; ?>
              </a>
            </li>
            <?php } ?>
          </ul>
        </div>
        <div class="col-12 d-block d-sm-none" style="width: 100%; height: 80px; overflow: hidden;">
          <div style="width: 100%; height: 100px; overflow: hidden; overflow-x: scroll">
            <ul class="nav nav-tabs" id="myTab" role="tablist" style="width: 525px; height: 100px;  border-bottom-left-radius: 10px !important; border-bottom-right-radius: 10px !important;">
              <?php
                $sql_jenis = mysqli_query($conn,"SELECT * FROM `tb_jenis` WHERE status = 1 ORDER BY sort ASC") or die(mysqli_error());
                $h = mysqli_num_rows($sql_jenis);
                $lebar = 100 / $h;
                $no = 0;
                while($sj = mysqli_fetch_array($sql_jenis)){
                  $no++;
              ?>
              <li class="nav-item" role="presentation" style="border-bottom-left-radius: 10px !important;">
                <a class="nav-link" href="<?php echo $urlweb; ?>/#<?php echo str_replace(' ','',strtolower($sj['jenis'])); ?>" style="font-size: 10px;">
                  <?php echo $sj['jenis']; ?>
                </a>
              </li>
              <?php } ?>
            </ul>
          </div>
        </div>
        <div class="col-sm-6 col-12">
          <form action="<?php echo $urlweb; ?>/search/" method="GET">
            <div class="input-group">
              <input type="text" class="form-control" id="keyword"  name="keyword" autocomplete="off" placeholder="Ketik Nama Produk ..." aria-label="Ketik Nama Produk ..." aria-describedby="button-addon2">
              <div class="input-group-append">
                <button class="btn btn-primary" type="submit" id="button-addon2" style="border-top-left-radius: 0px!important; border-bottom-left-radius: 0px!important;"><i class="fa fa-search"></i> Cari</button>
              </div>
            </div>
            <style>
              #result {
                position: absolute;
                width: 90%;
                max-width:90%;
                cursor: pointer;
                overflow-y: auto;
                max-height: 400px;
                box-sizing: border-box;
                z-index: 2;
                border-color: white;
                margin-top:-2px;
                color: #fff;
              }
              .link-class{
                border-color:white;
              }
              .list-group{
                background: #000;
                border-radius:0;
              }
              .link-class:hover{
                background-color:#000;
                color: #fff;
                cursor: pointer;
              }
            </style>
            <div class="container">
              <ul class="list-group" style="margin-left: 0!important;" id="result"></ul>
            </div>
          </form>
        </div>
      </div>
    </div>

    <div class="pt-3 pb-4">
      <div class="container">
        <div class="row game">
          <?php
            $keyword = mysqli_real_escape_string($conn,$_GET['keyword']);
            $sql_3 = mysqli_query($conn,"SELECT * FROM `tb_kategori` WHERE kategori LIKE '%$keyword%' AND status = 1 ORDER BY kategori ASC") or die(mysqli_error($conn));
            while($s3 = mysqli_fetch_array($sql_3)){
              $kategori = $s3['kategori'];
              $kategoriID = $s3['cuid'];
              $parentType = $s3['parent'];
              $sql_jenis = mysqli_query($conn,"SELECT * FROM `tb_jenis` WHERE cuid = '$parentType'") or die(mysqli_error($conn));
              $sj = mysqli_fetch_array($sql_jenis);
              $jenisnya = $sj['jenis'];
              if($jenisnya == 'Game'){
                $hitung = mysqli_query($conn,"SELECT * FROM `tb_produk` WHERE kategori = '$kategori'") or die(mysqli_error());
              }
              else if($jenisnya == 'Pulsa'){
                $hitung = mysqli_query($conn,"SELECT * FROM `tb_prepaid` WHERE brand = '$kategori'") or die(mysqli_error());
              }
              else if($jenisnya == 'Emoney'){
                $hitung = mysqli_query($conn,"SELECT * FROM `tb_prepaid` WHERE brand = '$kategori'") or die(mysqli_error());
              }
              else if($jenisnya == 'Voucher'){
                $hitung = mysqli_query($conn,"SELECT * FROM `tb_produk` WHERE brand = '$kategori'") or die(mysqli_error());
              }
              else if($jenisnya == 'Premium'){
                $hitung = mysqli_query($conn,"SELECT * FROM `tb_produk` WHERE kategori = '$kategori'") or die(mysqli_error());
              }
              else if($jenisnya == 'Pascabayar'){
                $hitung = mysqli_query($conn,"SELECT * FROM `tb_pascabayar` WHERE kategori = '$kategori'") or die(mysqli_error());
              }
              $h = mysqli_num_rows($hitung);
              if($h > 0){
                if($kategoriID%2 == 0){
                  $bgContent = 'upload/2.png';
                }
                else if($kategoriID%3 == 0){
                  $bgContent = 'upload/3.png';
                }
                else {
                  $bgContent = 'upload/1.png';
                }
          ?>
          <div class="col-sm-3 col-lg-2 col-4 p-1">
            <div class="card box_hover mb-3" style="background-color: var(--bg-cardcolor); border-radius: 10px;">
              <a href="<?php echo $urlweb; ?>/<?php echo str_replace(' ','-',strtolower($sj['jenis'])); ?>/<?php echo $s3['slug']; ?>/" class="product_list">
                <div class="box_image" style="background: url('<?php echo $urlweb; ?>/upload/<?php echo $s3['image']; ?>') no-repeat; background-size: 100% 100%; width: 100%; border-radius: 10px;">
                  <div class="box_content pt-3 pb-5" style="background: url('<?php echo $urlweb.'/'.$bgContent; ?>') no-repeat; background-size: 100% 100%; width: 100%; border-radius: 10px; padding: 15px;">
                    <img src="<?php echo $urlweb; ?>/upload/favicon.png" style="display: block; margin: 0 auto; width: 50px; height: 50px; margin-top: 15px; margin-bottom: 80px;">
                    <div style="font-size: 12px; min-height: 40px; color: var(--font-color); font-weight: 700; letter-spacing: 2px;"><?php echo $s3['kategori']; ?></div>
                  </div>
                </div>
              </a>
            </div>
          </div>
          <?php }} ?>
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
      $(document).ready(function(){
        $("#keyword").keyup(
          function(){
            var x = $("#keyword").val();
            var y = x.replace(/\s/g, '_');
            urli = "<?php echo $urlweb; ?>/searchlive.php?keyword="+y;
            $("#result").load(urli);
            console.log(urli);
            return false;
          }
        );
      });
    </script>
</body>
</html>
