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
$stat = mysqli_query($conn,"INSERT INTO `tb_stat` (`ip`, `date`, `hits`, `page`, `user`) VALUES ('$ip', '$date', 1, 'Beranda', '$pengguna')") or die (mysqli_error());
$sql_banner = mysqli_query($conn,"SELECT * FROM `tb_banner` WHERE cuid = 1") or die(mysqli_error());
$ssb = mysqli_fetch_array($sql_banner);
$status = $ssb['status'];
if($status == true){
    $cekPopup = mysqli_query($conn,"SELECT * FROM `tb_popup` WHERE ip = '$ip'") or die(mysqli_error());
    $cpp = mysqli_num_rows($cekPopup);
    if($cpp == 0){
        $pop = mysqli_query($conn,"INSERT INTO `tb_popup` (`ip`, `date`, `status`) VALUES ('$ip', '$date', 0)") or die (mysqli_error());
        $lihat = $status;
    }
    else {
        $cp = mysqli_fetch_array($cekPopup);
        $statusnya = $cp['status'];
        if($statusnya == 0){
            $lihat = $status;
        }
        else {
            $lihat = 'false';
        }
    }
}
else {
    $lihat = $status;
}
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
  <title><?php echo $s0['instansi']; ?></title>
  <meta name="description" content="<?php echo $s0['deskripsi']; ?>">
  <meta name="keywords" content="<?php echo $s0['keyword']; ?>">
  <meta property="og:title" content="<?php echo $s0['instansi']; ?>"/>
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
    <div class="pt-2 pb-3 area">
      <div class="container">
        <div class="carousel" style="z-index: 9999;" data-flickity='{ "wrapAround": true, "imagesLoaded": true, "percentPosition": false, "freeScroll": true, "autoPlay": true, "adaptiveHeight": true }'>
          <?php
            $sql_2 = mysqli_query($conn,"SELECT * FROM `tb_slide` ORDER BY cuid DESC LIMIT 5") or die(mysqli_error());
            $no=0;
            while($s2 = mysqli_fetch_array($sql_2)){
              $no++;
          ?>
          <img src="<?php echo $urlweb; ?>/upload/<?php echo $s2['image']; ?>" style="border-radius: 10px !important;" onClick="location.href='<?php echo $s2['deskripsi']; ?>';" alt="First slide">
          <?php } ?>
        </div>
        <ul class="circles">
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
        </ul>
      </div>
    </div>
    
    <?php
        $getProduk = mysqli_query($conn,"SELECT * FROM `tb_produk` WHERE harga_coret != 0 ORDER BY rand() LIMIT 6") or die(mysqli_error());
        $gpp = mysqli_num_rows($getProduk);
        if($gpp > 0){
    ?>
    <div class="pb-4">
      <div class="container">
        <div class="card shadow-sm pb-0" style="background-color: <?php echo $buttonColor; ?>!important; border-top-left-radius: 8px; border-top-right-radius: 8px;">
          <div class="card-body pb-0">
            <h5 style="z-index:9999;"><i class="fa fa-bolt"></i>&nbsp;Flash Sale</h5>
            <div class="row">
              <?php
                while($gp = mysqli_fetch_array($getProduk)){
                  $kategori = $gp['kategori'];
                  $sql_31 = mysqli_query($conn,"SELECT * FROM `tb_kategori` WHERE kategori = '$kategori'") or die(mysqli_error());
                  $s31 = mysqli_fetch_array($sql_31);
                  $kategoriID = $s31['cuid'];
                  $parentType = $s31['parent'];
                  $status = $s31['status'];
                  if($status == 1){
                      $sql_jenis = mysqli_query($conn,"SELECT * FROM `tb_jenis` WHERE cuid = '$parentType'") or die(mysqli_error($conn));
                      $sj = mysqli_fetch_array($sql_jenis);
                      if($kategoriID%2 == 0){
                        $bgContent = 'upload/2.png';
                      }
                      else if($kategoriID%3 == 0){
                        $bgContent = 'upload/3.png';
                      }
                      else {
                        $bgContent = 'upload/1.png';
                      }
                      if(isset($_SESSION['user'])){
                        $usernya = $_SESSION['user'];
                        $cekUser = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE user = '$usernya'");
                        $cu = mysqli_fetch_array($cekUser);
                        if($cu['level'] == 'reseller'){
                          $harga_jual = $gp['harga_reseller'];
                        }
                        else {
                          $harga_jual = $gp['harga_jual'];
                        }
                      }  
                      else {
                       $harga_jual = $gp['harga_reseller'];
                      }
              ?>
              <div class="col-lg-2 col-md-3 col-sm-4 col-4 p-1">
                <div class="card box_hover mb-3" style="background-color: var(--bg-cardcolor); border-radius: 10px;">
                  <a href="<?php echo $urlweb; ?>/<?php echo str_replace(' ','-',strtolower($sj['jenis'])); ?>/<?php echo $s31['slug']; ?>/" class="product_list">
                    <div class="box_image" style="background: url('<?php echo $urlweb; ?>/upload/<?php echo $s31['image']; ?>') no-repeat; background-size: 100% 100%; width: 100%; border-radius: 10px;">
                      <div class="box_content pt-3 pb-5" style="background: url('<?php echo $urlweb.'/'.$bgContent; ?>') no-repeat; background-size: 100% 100%; width: 100%; border-radius: 10px; padding: 15px;">
                        <img src="<?php echo $urlweb; ?>/upload/favicon.png" style="display: block; margin: 0 auto; width: 50px; height: 50px; margin-top: 15px; margin-bottom: 80px;">
                                
                      </div>
                      <div style="position: absolute; bottom: 15px; left: 10px;">
                        <div style="font-size: 12px; color: var(--font-color); font-weight: 700; letter-spacing: 2px;"><?php echo $gp['title']; ?></div>
                        <div style="font-size: 10px; color: var(--font-color);"><?php if($gp['harga_coret'] != 0){ echo '<strike>Rp. '.number_format($gp['harga_coret']).'</strike> - '; } ?><?php echo 'Rp. '.number_format($harga_jual); ?></div>
                      </div>
                    </div>
                  </a>
                </div>
              </div>
              <?php }} ?>
            </div>
          </div>
        </div>
      </div>
    </div>
    <?php } ?>

    <div class="pb-4">
      <div class="container">
        <h5>Populer</h5>
        <div class="row">
          <?php
            $sql_3 = mysqli_query($conn,"SELECT * FROM `tb_kategori` WHERE status = 1 AND populer = 1 ORDER BY rand() LIMIT 6") or die(mysqli_error($conn));
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
          <div class="col-lg-2 col-md-3 col-sm-4 col-4 p-1">
            <div class="card box_hover mb-3" style="background-color: var(--bg-cardcolor); border-radius: 10px;">
              <a href="<?php echo $urlweb; ?>/<?php echo str_replace(' ','-',strtolower($sj['jenis'])); ?>/<?php echo $s3['slug']; ?>/" class="product_list">
                <div class="box_image" style="background: url('<?php echo $urlweb; ?>/upload/<?php echo $s3['image']; ?>') no-repeat; background-size: 100% 100%; width: 100%; border-radius: 10px;">
                  <div class="box_content pt-3 pb-5" style="background: url('<?php echo $urlweb.'/'.$bgContent; ?>') no-repeat; background-size: 100% 100%; width: 100%; border-radius: 10px; padding: 15px;">
                    <img src="<?php echo $urlweb; ?>/upload/favicon.png" style="display: block; margin: 0 auto; width: 50px; height: 50px; margin-top: 15px; margin-bottom: 80px;">
                    <div style="font-size: 12px; color: var(--font-color); font-weight: 700; letter-spacing: 2px;"><?php echo $s3['kategori']; ?></div>
                    <div style="font-size: 10px; color: var(--font-color);"><?php echo $s3['subtitle']; ?></div>
                  </div>
                </div>
              </a>
            </div>
          </div>
          <?php }} ?>
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
              <a class="nav-link<?php if($no == 1) { echo ' active'; } ?>" id="<?php echo str_replace(' ','',strtolower($sj['jenis'])); ?>-tab" data-toggle="tab" href="#<?php echo str_replace(' ','',strtolower($sj['jenis'])); ?>" role="tab" aria-controls="<?php echo str_replace(' ','',strtolower($sj['jenis'])); ?>" aria-selected="true" style="font-size: 10px;">
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
                <a class="nav-link<?php if($no == 1) { echo ' active'; } ?>" id="<?php echo str_replace(' ','',strtolower($sj['jenis'])); ?>-tab" data-toggle="tab" href="#<?php echo str_replace(' ','',strtolower($sj['jenis'])); ?>" role="tab" aria-controls="<?php echo str_replace(' ','',strtolower($sj['jenis'])); ?>" aria-selected="true" style="font-size: 10px;">
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
                background: #000;
                margin-top:-2px;
                color: #fff;
              }
              .link-class{
                border-color:none;
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

    <div class="pb-4">
      <div class="container">
        <div class="tab-content" id="myTabContent">
          <?php
            $sql_jenis = mysqli_query($conn,"SELECT * FROM `tb_jenis` WHERE status = 1 ORDER BY sort ASC") or die(mysqli_error());
            $no = 0;
            while($sj = mysqli_fetch_array($sql_jenis)){
              $no++;
              $jenisnya = $sj['jenis'];
              if($jenisnya == 'Game'){
                $parent = 1;
                $table = 'tb_produk';
              }
              else if($jenisnya == 'Pulsa'){
                $parent = 3;
                $table = 'tb_prepaid';
              }
              else if($jenisnya == 'Emoney'){
                $parent = 4;
                $table = 'tb_prepaid';
              }
              else if($jenisnya == 'Voucher'){
                $parent = 8;
                $table = 'tb_produk';
              }
              else if($jenisnya == 'Premium'){
                $parent = 2;
                $table = 'tb_produk';
              }
              else if($jenisnya == 'Pascabayar'){
                $parent = 7;
                $table = 'tb_pascabayar';
              }
          ?>
          <div class="tab-pane fade<?php if($no == 1) { echo ' show active'; } ?> p-3" id="<?php echo str_replace(' ','',strtolower($sj['jenis'])); ?>" role="tabpanel" aria-labelledby="<?php echo str_replace(' ','',strtolower($sj['jenis'])); ?>-tab">
            <div class="row game">
              <?php
                $sql_3 = mysqli_query($conn,"SELECT * FROM `tb_kategori` WHERE parent = '$parent' AND status = 1 AND populer = 0 ORDER BY kategori ASC") or die(mysqli_error());
                while($s3 = mysqli_fetch_array($sql_3)){
                  $kategori = $s3['kategori'];
                  $kategoriID = $s3['cuid'];
                  if($jenisnya == 'Game'){
                    $hitung = mysqli_query($conn,"SELECT * FROM $table WHERE kategori = '$kategori'") or die(mysqli_error());
                  }
                  else if($jenisnya == 'Pulsa'){
                    $hitung = mysqli_query($conn,"SELECT * FROM $table WHERE brand = '$kategori'") or die(mysqli_error());
                  }
                  else if($jenisnya == 'Emoney'){
                    $hitung = mysqli_query($conn,"SELECT * FROM $table WHERE brand = '$kategori'") or die(mysqli_error());
                  }
                  else if($jenisnya == 'Voucher'){
                    $hitung = mysqli_query($conn,"SELECT * FROM $table WHERE brand = '$kategori'") or die(mysqli_error());
                  }
                  else if($jenisnya == 'Premium'){
                    $hitung = mysqli_query($conn,"SELECT * FROM $table WHERE kategori = '$kategori'") or die(mysqli_error());
                  }
                  else if($jenisnya == 'Pascabayar'){
                    $hitung = mysqli_query($conn,"SELECT * FROM $table WHERE kategori = '$kategori'") or die(mysqli_error());
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
          <?php } ?>
        </div>
      </div>
    </div>
    
    <div class="pb-4">
      <div class="container">
        <h5>
          News & Promo
          <span class="float-right" style="font-size: 12px;"><a href="<?php echo $urlweb; ?>/blog/">Lihat Semua</a></span>
        </h5>
        <span class="strip-primary"></span>
        <p>&nbsp;</p>
        <div class="row">
        <?php
          $sql_4 = mysqli_query($conn,"SELECT * FROM `tb_post` ORDER BY cuid DESC LIMIT 3") or die(mysqli_error());
          while($s4 = mysqli_fetch_array($sql_4)){
            $contents = $s4['content'];
            $excerpt_lengths = 20; // jumlah kata dalam excerpt
            $explodes = explode(' ', strip_tags($contents));
            $excerpts = implode(' ', array_slice($explodes, 0, $excerpt_lengths));
        ?>
        <div class="col-sm-4 p-1">
          <a href="<?php echo $urlweb; ?>/blog/<?php echo $s4['slug']; ?>/">
            <div class="card p-1" style="background: none;">
              <img src="<?php echo $urlweb; ?>/upload/<?php echo $s4['image']; ?>" class="card-img-top" style="border-radius: 8px;" alt="<?php echo $s4['title']; ?>">
              <div class="card-body p-1 pt-2 pb-2">
                <h5 style=" color: var(--font-color); font-weight: 700;"><?php echo $s4['title']; ?></h5>
                <p><?php echo $excerpts; ?></p>
              </div>
            </div>
          </a>
        </div>
        <?php } ?>
        </div>
      </div>
    </div>
    
    <div class="d-block d-sm-none" style="height: 100px;"></div>
    <!--Start Back To Top Button-->
    <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>
    <!--End Back To Top Button-->
    <div class="modal fade" id="exampleModal">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content text-dark animated bounceIn" style="background: #1e2124;">
          <div class="modal-body text-left" style="color: #fff!important;">
            <?php
              $sql_banner = mysqli_query($conn,"SELECT * FROM `tb_banner` WHERE cuid = 1") or die(mysqli_error());
              $ssb = mysqli_fetch_array($sql_banner);
              if($ssb['image'] != ''){
                echo '
                  <img src="'.$urlwebs.'/upload/'.$ssb['image'].'" class="img-fluid mb-3" style="display: block; margin: 0 auto;">
                ';
              }
              echo '<div style="margin: 15px!important;">'.$ssb['content'].'</div>';
            ?>
          </div>
          <div class="modal-footer">
            <div class="row" style="width: 100%;">
              <div class="col-8 text-left">
                <div class="form-group form-check mt-2">
                    <input type="checkbox" name="popup" class="form-check-input" value="1" id="exampleCheck1">
                    <label class="form-check-label text-white mt-1" for="exampleCheck1">Jangan Tayangkan Lagi</label>
                    <input type="hidden" name="ip" id="ipaddress" value="<?php echo $ip; ?>">
                </div>
              </div>
              <div class="col-4 text-right">
                  <button type="button" class="btn btn-warning" data-dismiss="modal" aria-label="Close">
                      Tutup
                  </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--Start footer-->
    <?php include('footer.php'); ?>
    <script>
      $(window).on('load', function() {
        $('#exampleModal').modal({show: <?php echo $lihat; ?>, backdrop: 'static', keyboard: false});
      });
      $(document).ready(function(){
        $("#exampleCheck1").change(function() {
            if(this.checked == true){
              $.ajax({
                url:"<?php echo $urlweb; ?>/popup.php",
                method:"POST",
                data:{id:1,ipaddress:$('#ipaddress').val()},
                success:function(data){
                    
                }  
              })
            }
        });
      });
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

