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
$slug = $_GET['slug'];
$sql_page = mysqli_query($conn,"SELECT * FROM `tb_post` WHERE slug = '$slug'") or die(mysqli_error());
$sp = mysqli_fetch_array($sql_page);
$postID = $sp['cuid'];
$pageName = $sp['title'];
$contents = $sp['content'];
$excerpt_lengths = 20; // jumlah kata dalam excerpt
$explodes = explode(' ', strip_tags($contents));
$excerpts = implode(' ', array_slice($explodes, 0, $excerpt_lengths));
$stat = mysqli_query($conn,"INSERT INTO `tb_stat` (`ip`, `date`, `hits`, `page`, `user`) VALUES ('$ip', '$date', 1, '$pageName', '$pengguna')") or die (mysqli_error());
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title><?php echo $sp['title']; ?> - <?php echo $s0['instansi']; ?></title>
  <meta name="description" content="<?php echo $excerpts; ?>">
  <meta name="keywords" content="<?php echo $s0['keyword']; ?>">
  <meta property="og:title" content="<?php echo $sp['title']; ?> - <?php echo $s0['instansi']; ?>"/>
  <meta property="og:description" content="<?php echo $excerpts; ?>" />
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
            <div class="pt-3 pb-4">
              <h5>Blog</h5>
              <span class="strip-primary"></span>
            </div>
          </div>
          <div class="col-lg-8">
            <div class="pb-3">
              <div class="card" style="background: none;">
                <img src="<?php echo $urlweb; ?>/upload/<?php echo $sp['image']; ?>" class="card-img-top" style="border-radius: 8px;" alt="<?php echo $sp['title']; ?>">
                <div class="card-body">
                  <h5 style=" color: var(--font-color); font-weight: 700;"><?php echo $sp['title']; ?></h5>
                  <hr>
                  <?php echo $sp['content']; ?>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="pb-3">
              <div class="card">
                <div class="card-header" style="border-bottom: 1px solid #eee; color: var(--font-color);">News & Promo Lainnya</div>
                <div class="card-body">
                  <ul class="nav flex-column mb-3">
                    <?php
                      $sql_4 = mysqli_query($conn,"SELECT * FROM `tb_post` ORDER BY cuid DESC LIMIT 10") or die(mysqli_error());
                      while($s4 = mysqli_fetch_array($sql_4)){
                    ?>
                    <li class="nav-item">
                      <a class="nav-link" href="<?php echo $urlweb; ?>/blog/<?php echo $s4['slug']; ?>/"><?php echo $s4['title']; ?></a>
                    </li>
                    <?php } ?>
                  </ul>
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
