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
  <title>Kalkulator ML - <?php echo $s0['instansi']; ?></title>
  <meta name="description" content="<?php echo $s0['deskripsi']; ?>">
  <meta name="keywords" content="<?php echo $s0['keyword']; ?>">
  <meta property="og:title" content="Kalkulator ML - <?php echo $s0['instansi']; ?>"/>
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
  <style>
    .slidecontainer {
      width: 100%;
    }

    .sliders {
      -webkit-appearance: none;
      width: 100%;
      height: 25px;
      background-color: var(--bg-cardcolor);
      outline: none;
      opacity: 0.7;
      -webkit-transition: 0.2s;
      transition: opacity 0.2s;
      border-radius: 12px;
    }

    .sliders:hover {
      opacity: 1;
    }

    .sliders::-webkit-slider-thumb {
      -webkit-appearance: none;
      appearance: none;
      width: 25px;
      height: 25px;
      background-color: var(--bg-cardcolor);
      cursor: pointer;
      border-radius: 12px;
    }

    .sliders::-moz-range-thumb {
      width: 25px;
      height: 25px;
      background: #fff;
      cursor: pointer;
    }
  </style>
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
            <div class="pb-3">
              <div class="section">
                <div class="card-body">
                  <ul class="nav nav-tabs" id="myTab" role="tablist" style="width: 100%!important; border-bottom-left-radius: 10px !important; border-bottom-right-radius: 10px !important;">
                    <li class="nav-item" role="presentation" style="width: 33.3%; border-bottom-left-radius: 10px !important;">
                      <a class="nav-link active" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="true" style="font-size: 10px; color: #fff;">
                        Hitung Win Rate
                      </a>
                    </li>
                    <li class="nav-item" role="presentation" style="width: 33.3%; border-bottom-left-radius: 10px !important;">
                      <a class="nav-link" id="upgrade-tab" data-toggle="tab" href="#upgrade" role="tab" aria-controls="upgrade" aria-selected="true" style="font-size: 10px; color: #fff;">
                        Hitung Point Zodiac
                      </a>
                    </li>
                    <li class="nav-item" role="presentation" style="width: 33.3%; border-bottom-left-radius: 10px !important;">
                      <a class="nav-link" id="affiliate-tab" data-toggle="tab" href="#affiliate" role="tab" aria-controls="affiliate" aria-selected="true" style="font-size: 10px; color: #fff;">
                        Hitung Magic Wheel
                      </a>
                    </li>
                  </ul>  
                  <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active p-3 pt-5" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                      <p>Win-Rate Mobile Legends Digunakan untuk menghitung total pertandingan yang harus ditempuh untuk mencapai target Win Rate yang diinginkan.</p>
                      <form class="mb-3">
                        <div class="mb-1"><label class="mb-1 text-white" for="idMatch">Total Pertandingan Anda</label>
                          <input type="number" class="form-control" placeholder="Contoh: 351" autofocus="" autocomplete="off" id="tMatch" class="form-control"><br>
                        </div>
                        <div class="mb-1"><label class="text-white mb-1" for="tWr">Total Win Rate Anda (%)</label>
                          <input type="number" class="form-control" placeholder="Contoh: 51.4%" step="any" autocomplete="off" id="tWr" class="form-control"><br>
                        </div>
                        <div class="mb-1"><label class="mb-1 text-white" for="wrReq">Win Rate yang anda inginkan (%)</label>
                          <input type="number" class="form-control" placeholder="Contoh: 70%" step="any" autocomplete="off" id="wrReq" class="form-control"><br>
                        </div>
                        <button class="btn btn-primary text-white d-block w-100" type="button" id="hasil">Hasil</button>
                      </form>
                      <span id="resultText" class="text-center d-block"> </span>
                      <script type="text/javascript">
                        // Variables
                        const tMatch = document.querySelector("#tMatch");
                        const tWr = document.querySelector("#tWr");
                        const wrReq = document.querySelector("#wrReq");
                        const hasil = document.querySelector("#hasil");
                        const resultText = document.querySelector("#resultText");

                        // Functions
                        function res() {
                          const resultNum = rumus(tMatch.value, tWr.value, wrReq.value);
                          const text =
                            `<div class="alert alert-success text-center alert-dismissible mb-3" role="alert">
                              <button type="button" class="close" data-dismiss="alert">&times;</button>
                              <div class="alert-message">Anda memerlukan sekitar <strong>${resultNum}</strong> win tanpa lose untuk mendapatkan win rate <strong>${wrReq.value}%</strong></div>
                             </div>`;
                          resultText.innerHTML = text;
                        }

                        function rumus(tMatch, tWr, wrReq) {
                          let tWin = tMatch * (tWr / 100);
                          let tLose = tMatch - tWin;
                          let sisaWr = 100 - wrReq;
                          let wrResult = 100 / sisaWr;
                          let seratusPersen = tLose * wrResult;
                          let final = seratusPersen - tMatch;
                          return Math.round(final);
                        }

                        // Main
                        window.addEventListener("load", init);

                        function init() {
                          load();
                          eventListener();
                        }
                        function load() {}
                        function eventListener() {
                          hasil.addEventListener("click", res);
                        }
                      </script>
                    </div>
                    <div class="tab-pane fade p-3 pt-5" id="upgrade" role="tabpanel" aria-labelledby="upgrade-tab">
                      <p>Kalkulator Zodiac untuk mengetahui total maksimal diamond yang kamu butuhkan untuk mendapatkan skin Zodiac.</p>
                      <h5 class="mb-2 text-center text-white">Geser Sesuai Point Zodiac Anda</h5>
                      <div class="slidecontainer">
                        <span color="white text-center">Star Point Anda :</span>
                        <span id="f" style="font-weight:bold;color:#30cdf8">50</span>
                        <input type="range" min="0" max="99" value="50" name="sld6" class="sliders mt-2 mb-2" id="myRange" onchange="show_value2(this.value)">
                        <span class="text-white text-center">Membutuhkan Maksimal :</span>
                        <span class="text-white text-center" id="slider_value2" style="font-weight:bold;"></span>
                        <i class="fas fa-gem" style="color: #00c8c8"></i>
                      </div>
                      <script>
                        function show_value2(x) {
                          if (x < 90) {
                            yz = Math.ceil((2000 - x * 20) * 850 / 1000);
                          }
                          if (x > 89) {
                            yz = Math.ceil((2000 - x * 20));
                          }
                          document.getElementById("slider_value2").innerHTML = yz;
                        }
                      </script>
                      <script>
                        var slideCol = document.getElementById("myRange");
                        var y = document.getElementById("f");
                        y.innerHTML = slideCol.value;
                        slideCol.oninput = function () {
                          y.innerHTML = this.value;
                        }
                      </script>
                    </div>
                    <div class="tab-pane fade p-3 pt-5" id="affiliate" role="tabpanel" aria-labelledby="affiliate-tab">
                      <p>Kalkulator Magic Wheel untuk mengetahui total maksimal diamond yang kamu butuhkan untuk mendapatkan skin LEGEND.</p>
                      <h5 class="mb-2 text-center text-white">Geser Sesuai Point Magic Wheel Anda</h5>
                      <div class="slidecontainer">
                        <span color="white text-center">Point Magic Wheel Anda :</span>
                        <span id="gh" style="font-weight:bold;color:#30cdf8">100</span>
                        <input type="range" min="0" max="300" value="100" name="sld6" class="sliders mt-2 mb-2" id="myRanges" onchange="show_value3(this.value)">
                        <span class="text-white text-center">Membutuhkan Maksimal :</span>
                        <span class="text-white text-center" id="slider_value3" style="font-weight:bold;"></span>
                        <i class="fas fa-gem" style="color: #00c8c8"></i>
                      </div>
                      <script>
                        function show_value3(x) {
                          if (x < 196) {
                            sisa_spin = 200 - x;
                            jumlah_spin = Math.ceil(sisa_spin / 5);
                            yz = jumlah_spin * 270;
                          }

                          if (x > 195) {
                            sisa_spin = 200 - x;
                            yz = sisa_spin * 60;
                          }
                          document.getElementById("slider_value3").innerHTML = yz;
                        }
                      </script>
                      <script>
                        var slideCols = document.getElementById("myRanges");
                        var z = document.getElementById("gh");
                        z.innerHTML = slideCols.value;
                        slideCols.oninput = function () {
                          z.innerHTML = this.value;
                        }
                      </script>
                    </div>
                  </div>       
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
