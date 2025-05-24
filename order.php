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

?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Top Up Game - <?php echo $s0['instansi']; ?></title>
  <meta name="description" content="<?php echo $s0['deskripsi']; ?>">
  <meta name="keywords" content="<?php echo $s0['keyword']; ?>">
  <meta property="og:title" content="Top Up Game - <?php echo $s0['instansi']; ?>"/>
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
            <div class="card shadow-sm mb-3">
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

            <div class="card shadow-sm d-none d-sm-block">
              <div class="card-header text-white" style="border-bottom: 1px solid rgb(255,255,255,0.5);">Produk Game Lainnya</div>
              <div class="card-body p-0">
                <ul class="list-group" style="border-radius: 0;">
                  <?php
                    $getkategori = mysqli_query($conn,"SELECT * FROM `tb_kategori` WHERE `parent` = '$jenisnya' AND cuid != '$catIDD' ORDER BY rand() LIMIT 5") or die(mysqli_error());
                    while($gk = mysqli_fetch_array($getkategori)){

                  ?>
                  <li class="list-group-item" style="background: var(--primary-color); color: var(--font-color); border-radius: 0;">
                    <div class="media">
                      <img src="<?php echo $urlweb; ?>/upload/<?php echo $gk['image']; ?>" class="align-self-center mr-3" style="width: 50px; height: 50px;" alt="<?php echo $gk['kategori']; ?>">
                      <div class="media-body">
                      <h5 class="mt-3" style="font-size: 14px; line-height: 12px; color: #fff;"><a href="<?php echo $urlweb; ?>/game/<?php echo $gk['slug']; ?>/" style="color: #fff;"><?php echo $gk['kategori']; ?></a></h5>
                      </div>
                    </div>
                  </li>
                  <?php } ?>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-sm-8">
            <div class="card shadow-sm mb-2" style="border-radius: 10px;">
              <div class="card-body mb-0" style="border-radius: 10px;">
                <div class="text-white text-center position-absolute circle-primary"><span>1</span></div>
                <h5 style="margin-left: 45px; margin-top: 5px;">Input Data Tujuan</h5>
                <?php
                  error_reporting(0);
                  if($s6['kategori'] == 'Be The King'){
                    echo '
                      <div class="form-row pt-3">
                        <div class="col-6">
                          <input type="number" name="userID" id="userID" class="form-control" placeholder="Masukkan UID" required>
                        </div>
                        <div class="col-6">
                          <select name="zone_id" id="zoneID" class="form-control" required>
                            <option value="">Pilih Server</option>
                            <option value="Asia-S1">Asia-S1</option>
                            <option value="Asia-S2">Asia-S2</option>
                            <option value="Asia-S3">Asia-S3</option>
                            <option value="Asia-S4">Asia-S4</option>
                            <option value="Asia-S5">Asia-S5</option>
                            <option value="Asia-S6">Asia-S6</option>
                            <option value="Asia-S7">Asia-S7</option>
                            <option value="Asia-S8">Asia-S8</option>
                            <option value="Asia-S9">Asia-S9</option>
                            <option value="Asia-S10">Asia-S10</option>
                            <option value="Asia-S11">Asia-S11</option>
                            <option value="Asia-S12">Asia-S12</option>
                            <option value="Asia-S13">Asia-S13</option>
                            <option value="Asia-S14">Asia-S14</option>
                            <option value="Asia-S15">Asia-S15</option>
                            <option value="Asia-S16">Asia-S16</option>
                            <option value="Asia-S17">Asia-S17</option>
                            <option value="Asia-S18">Asia-S18</option>
                            <option value="Asia-S19">Asia-S19</option>
                            <option value="Asia-S20">Asia-S20</option>
                            <option value="Asia-S21">Asia-S21</option>
                            <option value="Asia-S22">Asia-S22</option>
                            <option value="Asia-S23">Asia-S23</option>
                            <option value="Asia-S24">Asia-S24</option>
                            <option value="Asia-S25">Asia-S25</option>
                            <option value="Asia-S26">Asia-S26</option>
                            <option value="Asia-S27">Asia-S27</option>
                            <option value="Asia-S28">Asia-S28</option>
                            <option value="Asia-S29">Asia-S29</option>
                            <option value="Asia-S30">Asia-S30</option>
                            <option value="Asia-S31">Asia-S31</option>
                            <option value="Asia-S32">Asia-S32</option>
                            <option value="Asia-S33">Asia-S33</option>
                            <option value="Asia-S34">Asia-S34</option>
                            <option value="Asia-S35">Asia-S35</option>
                            <option value="Asia-S36">Asia-S36</option>
                            <option value="Asia-S37">Asia-S37</option>
                            <option value="Asia-S38">Asia-S38</option>
                            <option value="Asia-S39">Asia-S39</option>
                            <option value="Asia-S40">Asia-S40</option>
                            <option value="Asia-S41">Asia-S41</option>
                            <option value="Asia-S42">Asia-S42</option>
                            <option value="Asia-S43">Asia-S43</option>
                            <option value="Asia-S44">Asia-S44</option>
                            <option value="Asia-S45">Asia-S45</option>
                            <option value="Asia-S46">Asia-S46</option>
                            <option value="Asia-S47">Asia-S47</option>
                            <option value="Asia-S48">Asia-S48</option>
                            <option value="Asia-S49">Asia-S49</option>
                            <option value="Asia-S50">Asia-S50</option>
                            <option value="Asia-S51">Asia-S51</option>
                            <option value="Asia-S52">Asia-S52</option>
                            <option value="Asia-S53">Asia-S53</option>
                            <option value="Asia-S54">Asia-S54</option>
                            <option value="Asia-S55">Asia-S55</option>
                            <option value="Asia-S56">Asia-S56</option>
                            <option value="Asia-S57">Asia-S57</option>
                            <option value="Asia-S58">Asia-S58</option>
                            <option value="Asia-S59">Asia-S59</option>
                            <option value="Asia-S60">Asia-S60</option>
                            <option value="Asia-S61">Asia-S61</option>
                            <option value="Asia-S62">Asia-S62</option>
                            <option value="Asia-S63">Asia-S63</option>
                            <option value="Asia-S64">Asia-S64</option>
                            <option value="Asia-S65">Asia-S65</option>
                            <option value="Asia-S66">Asia-S66</option>
                            <option value="Asia-S67">Asia-S67</option>
                            <option value="Asia-S68">Asia-S68</option>
                            <option value="Asia-S69">Asia-S69</option>
                            <option value="Asia-S70">Asia-S70</option>
                            <option value="Asia-S71">Asia-S71</option>
                            <option value="Asia-S72">Asia-S72</option>
                            <option value="Asia-S73">Asia-S73</option>
                            <option value="Asia-S74">Asia-S74</option>
                            <option value="Asia-S75">Asia-S75</option>
                            <option value="Asia-S76">Asia-S76</option>
                            <option value="Asia-S77">Asia-S77</option>
                            <option value="Asia-S78">Asia-S78</option>
                            <option value="Asia-S79">Asia-S79</option>
                            <option value="Asia-S80">Asia-S80</option>
                            <option value="Asia-S81">Asia-S81</option>
                            <option value="Asia-S82">Asia-S82</option>
                            <option value="Asia-S83">Asia-S83</option>
                            <option value="Asia-S84">Asia-S84</option>
                            <option value="Asia-S85">Asia-S85</option>
                            <option value="Asia-S86">Asia-S86</option>
                            <option value="Asia-S87">Asia-S87</option>
                            <option value="Asia-S88">Asia-S88</option>
                            <option value="Asia-S89">Asia-S89</option>
                            <option value="Asia-S90">Asia-S90</option>
                            <option value="Asia-S91">Asia-S91</option>
                            <option value="Asia-S92">Asia-S92</option>
                            <option value="Asia-S93">Asia-S93</option>
                            <option value="Asia-S94">Asia-S94</option>
                            <option value="Asia-S95">Asia-S95</option>
                            <option value="Asia-S96">Asia-S96</option>
                            <option value="Asia-S97">Asia-S97</option>
                            <option value="Asia-S98">Asia-S98</option>
                            <option value="Asia-S99">Asia-S99</option>
                            <option value="Asia-S100">Asia-S100</option>
                            <option value="Asia-S101">Asia-S101</option>
                            <option value="Asia-S102">Asia-S102</option>
                            <option value="Asia-S103">Asia-S103</option>
                            <option value="Asia-S104">Asia-S104</option>
                            <option value="Asia-S105">Asia-S105</option>
                            <option value="Asia-S106">Asia-S106</option>
                            <option value="Asia-S107">Asia-S107</option>
                            <option value="Asia-S108">Asia-S108</option>
                            <option value="Asia-S109">Asia-S109</option>
                            <option value="Asia-S110">Asia-S110</option>
                            <option value="Asia-S111">Asia-S111</option>
                            <option value="Asia-S112">Asia-S112</option>
                            <option value="Asia-S113">Asia-S113</option>
                            <option value="Asia-S114">Asia-S114</option>
                            <option value="Asia-S115">Asia-S115</option>
                            <option value="Asia-S116">Asia-S116</option>
                            <option value="Asia-S117">Asia-S117</option>
                            <option value="Asia-S118">Asia-S118</option>
                            <option value="Asia-S119">Asia-S119</option>
                            <option value="Asia-S120">Asia-S120</option>
                            <option value="Asia-S121">Asia-S121</option>
                            <option value="Asia-S122">Asia-S122</option>
                            <option value="Asia-S123">Asia-S123</option>
                            <option value="Asia-S124">Asia-S124</option>
                            <option value="Asia-S125">Asia-S125</option>
                            <option value="Asia-S126">Asia-S126</option>
                            <option value="Asia-S127">Asia-S127</option>
                          </select>
                        </div>
                        <button class="btn btn-primary btn-sm m-1" data-toggle="modal" data-target="#modalhelp"><i class="zmdi zmdi-help"></i> Bantuan</button>
                      </div>
                    ';
                  }
                  else if($s6['kategori'] == 'Mobile Legend' || $s6['kategori'] == 'Mobile Legends' || $s6['kategori'] == 'Mobile Legends A' || $s6['kategori'] == 'Mobile Legends B' || $s6['kategori'] == 'Mobile Legends Membership' || $s6['kategori'] == 'Mobile Legends Promo'){
                    echo '
                      <div class="form-row pt-3">
                        <div class="col-6">
                          <input type="number" name="userID" id="userID" class="form-control" placeholder="Masukkan User ID" required>
                        </div>
                        <div class="col-6">
                          <input type="number" name="zone_id" id="zoneID" class="form-control" placeholder="Masukkan Zone ID" required>
                        </div>
                        <button class="btn btn-primary btn-sm m-1" data-toggle="modal" data-target="#modalhelp"><i class="zmdi zmdi-help"></i> Bantuan</button>
                      </div>
                    ';
                  }
                  else if($s6['kategori'] == 'Mobile Legends Vilog' || $s6['kategori'] == 'Mobile Legends Joki Rank'){
                    echo '
                      <div class="form-row pt-3">
                        <div class="col-6">
                          <input type="number" name="userID" id="userID" class="form-control" placeholder="Masukkan Username + Password" required>
                        </div>
                        <div class="col-6">
                          <select name="zone_id" id="zoneID" class="form-control" required>
                            <option value="">Pilih Salah Satu</option>
                            <option value="Moonton"> Moonton</option>
                            <option value="Facebook"> Facebook</option>
                            <option value="TikTok"> TikTok</option>
                            <option value="VK"> VK</option>
                          </select>
                        </div>
                        <button class="btn btn-primary btn-sm m-1" data-toggle="modal" data-target="#modalhelp"><i class="zmdi zmdi-help"></i> Bantuan</button>
                      </div>
                    ';
                  }
                  else if($s6['kategori'] == 'Chimeraland'){
                    echo '
                      <div class="form-row pt-3">
                        <div class="col-6">
                          <input type="number" name="userID" id="userID" class="form-control" placeholder="Masukkan UID" required>
                        </div>
                        <div class="col-6"> 
                          <select name="zone_id" id="zoneID" class="form-control" required>  
                            <option value="">Pilih Server</option>
                            <option value="DeathQuay">DeathQuay</option>
                            <option value="CrosRiver">CrosRiver</option>
                            <option value="Buckland">Buckland</option>
                            <option value="BurntPlan">BurntPlan</option>
                            <option value="JadeCoast">JadeCoast</option>
                            <option value="PadHill">PadHill</option>
                            <option value="RoniLand">RoniLand</option>
                            <option value="BeautyLake">BeautyLake</option>
                            <option value="BlizzardBay">BlizzardBay</option>
                            <option value="LushField">LushField</option>
                            <option value="DustyPlan">DustyPlan</option>
                            <option value="IceRiver">IceRiver</option>
                            <option value="GreenGuilty">GreenGuilty</option>
                            <option value="AzureField">AzureField</option>
                            <option value="EosBeach">EosBeach</option>
                            <option value="TwilightBay">TwilightBay</option>
                            <option value="Gray Plain">Gray Plain</option>
                            <option value="SandSnow">SandSnow</option>
                          </select>
                        </div>
                        <button class="btn btn-primary btn-sm m-1" data-toggle="modal" data-target="#modalhelp"><i class="zmdi zmdi-help"></i> Bantuan</button>
                      </div>
                    ';
                  }
                  else if($s6['kategori'] == 'Genshin Impact'){
                    echo '
                      <div class="form-row pt-3">
                        <div class="col-6">
                          <input type="text" name="userID" id="userID" class="form-control" placeholder="Masukkan UID" required>
                        </div>
                        <div class="col-6"> 
                          <select name="zone_id" id="zoneID" class="form-control" required>  
                            <option value="">Pilih Server</option>
                            <option value="America">America</option>
                            <option value="Asia">Asia</option>
                            <option value="Europa">Europe</option>
                            <option value="TW_HK_MO">TW_HK_MO</option>
                          </select>
                        </div>
                        <button class="btn btn-primary btn-sm m-1" data-toggle="modal" data-target="#modalhelp"><i class="zmdi zmdi-help"></i> Bantuan</button>
                      </div>
                    ';
                  }
                  else if($s6['kategori'] == 'LifeAfter'){
                    echo '
                      <div class="form-row pt-3">
                        <div class="col-6">
                          <input type="number" name="userID" id="userID" class="form-control" placeholder="Masukkan UID" required>
                        </div>
                        <div class="col-6"> 
                          <select name="zone_id" id="zoneID" class="form-control" required> 
                            <option value="">Pilih Server</option>
                            <option value="MiskaTown">MiskaTown</option>
                            <option value="SandCastle">SandCastle</option>
                            <option value="MouthSwamp">MouthSwamp</option>
                            <option value="RedwoodTown">RedwoodTown</option>
                            <option value="Obelisk">Obelisk</option>
                            <option value="FallForest">FallForest</option>
                            <option value="MountSnow">MountSnow</option>
                            <option value="NancyCity">NancyCity</option>
                            <option value="CharlesTown">CharlesTown</option>
                            <option value="SnowHighlands">SnowHighlands</option>
                            <option value="Santopany">Santopany</option>
                            <option value="LevinCity">LevinCity</option>
                            <option value="NewLand">NewLand</option>
                            <option value="MileStone">MileStone</option>
                            <option value="ChaosOutpost">ChaosOutpost</option>
                            <option value="ChaosCity">ChaosCity</option>
                            <option value="TwinIslands">TwinIslands</option>
                            <option value="HopeWall">HopeWall</option>
                            <option value="IronStride">IronStride</option>
                          </select>
                        </div>
                        <button class="btn btn-primary btn-sm m-1" data-toggle="modal" data-target="#modalhelp"><i class="zmdi zmdi-help"></i> Bantuan</button>
                      </div>
                    ';
                  }
                  else if($s6['kategori'] == 'One Punch Man'){
                    echo '
                      <div class="form-row pt-3">
                        <div class="col-6">
                          <input type="text" name="userID" id="userID" class="form-control" placeholder="Masukkan User ID" required>
                        </div>
                        <div class="col-6">
                          <input type="text" name="zone_id" id="zoneID" class="form-control" placeholder="Masukkan Server ID" required>
                        </div>
                        <button class="btn btn-primary btn-sm m-1" data-toggle="modal" data-target="#modalhelp"><i class="zmdi zmdi-help"></i> Bantuan</button>
                      </div>
                    ';
                  }
                  else if($s6['kategori'] == 'RagnaroK M Eternal Love'){
                    echo '
                      <div class="form-row pt-3">
                        <div class="col-6">
                          <input type="text" name="userID" id="userID" class="form-control" placeholder="Masukkan UID" required>
                        </div>
                        <div class="col-6"> 
                          <select name="zone_id" id="zoneID" class="form-control" required>  
                            <option value="">Pilih Server</option>
                            <option value="Eternal Love">Eternal Love</option>
                            <option value="Midnight Party">Midnight Party</option>
                          </select>
                        </div>
                        <button class="btn btn-primary btn-sm m-1" data-toggle="modal" data-target="#modalhelp"><i class="zmdi zmdi-help"></i> Bantuan</button>
                      </div>
                    ';
                  }
                  else if($s6['kategori'] == 'RagnaroK X Next Generation'){
                    echo '
                      <div class="form-row pt-3">
                        <div class="col-6">
                          <input type="text" name="userID" id="userID" class="form-control" placeholder="Masukkan UID" required>
                        </div>
                        <div class="col-6"> 
                          <select name="zone_id" id="zoneID" class="form-control" required>  
                            <option value="">Pilih Server</option>
                            <option value="Opera Phantom">Opera Phantom</option>
                            <option value="Wing of Blessing">Wing of Blessing</option>
                            <option value="Royal Instrument">Royal Instrument</option>
                            <option value="Valhalla">Valhalla</option>
                            <option value="Gungnir">Gungnir</option>
                            <option value="Central Plains">Central Plains</option>
                            <option value="Dark Lord">Dark Lord</option>
                            <option value="Temple of Dawn">Temple of Dawn</option>
                            <option value="Golden Lava">Golden Lava</option>
                            <option value="Highland">Highland</option>
                            <option value="Demons Castle">Demons Castle</option>
                            <option value="Sealed Island">Sealed Island</option>
                            <option value="Sipera">Sipera</option>
                            <option value="Silent Ship">Silent Ship</option>
                            <option value="Golden Route">Golden Route</option>
                            <option value="Sapir">Sapir</option>
                            <option value="Rose Red">Rose Red</option>
                            <option value="Kingdom of Freedom">Kingdom of Freedom</option>
                            <option value="Nicola">Nicola</option>
                            <option value="Crystal Waterfall">Crystal Waterfall</option>
                            <option value="Bifrost">Bifrost</option>
                            <option value="Nastia">Nastia</option>
                            <option value="Strouf Treasury">Strouf Treasury</option>
                            <option value="Green Tranquil Pond">Green Tranquil Pond</option>
                            <option value="Ingael">Ingael</option>
                            <option value="Tome of Glory">Tome of Glory</option>
                            <option value="Incense Pavilion">Incense Pavilion</option>
                            <option value="Carew">Carew</option>
                            <option value="Boulders and Horns">Boulders and Horns</option>
                            <option value="Exquisite Pond">Exquisite Pond</option>
                            <option value="Nemesis">Nemesis</option>
                            <option value="Bright Lotus Pond">Bright Lotus Pond</option>
                            <option value="Seocho Market">Seocho Market</option>
                            <option value="Eudora">Eudora</option>
                            <option value="Moonlit Temple">Moonlit Temple</option>
                            <option value="Hidden Wood Ruins">Hidden Wood Ruins</option>
                            <option value="Dungeon Throne">Dungeon Throne</option>
                            <option value="Ayothaya">Ayothaya</option>
                            <option value="Luzhon">Luzhon</option>
                            <option value="Majapahit">Majapahit</option>
                            <option value="Garden City">Garden City</option>
                            <option value="Manila">Manila</option>
                            <option value="Sukhothai">Sukhothai</option>
                            <option value="Tossakan">Tossakan</option>
                            <option value="Badang">Badang</option>
                            <option value="Lapulapu">Lapulapu</option>
                            <option value="Gatotkaca">Gatotkaca</option>
                            <option value="Srikandi">Srikandi</option>
                            <option value="Kumpakan">Kumpakan</option>
                            <option value="Angeling">Angeling</option>
                            <option value="Deviling">Deviling</option>
                            <option value="Ghostring">Ghostring</option>
                            <option value="Mastering">Mastering</option>
                            <option value="Xu Nu">Xu Nu</option>
                            <option value="Song Tu">Song Tu</option>
                            <option value="Half Anniversary">Half Anniversary</option>             
                          </select>
                        </div>
                        <button class="btn btn-primary btn-sm m-1" data-toggle="modal" data-target="#modalhelp"><i class="zmdi zmdi-help"></i> Bantuan</button>
                      </div>
                    ';
                  }
                  else {
                    echo '
                      <div class="form-row pt-3">
                        <div class="col-12">
                          <input type="text" name="userID" id="userID" class="form-control" placeholder="Masukan User ID / Player ID/ UID / IGG ID / Nomor Tujuan" required>
                          <input type="hidden" name="zone_id" id="zoneID" class="form-control" placeholder="Masukkan Zone ID" value="1">
                        </div>
                        <button class="btn btn-primary btn-sm m-1" data-toggle="modal" data-target="#modalhelp"><i class="zmdi zmdi-help"></i> Bantuan</button>
                      </div>
                    ';
                  }
                ?>
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
                <h5 style="margin-left: 45px; margin-top: 5px;">Pilih Item / Layanan</h5>
                <?php
                    $cekSub = mysqli_query($conn,"SELECT * FROM `tb_subkategori` WHERE catID = '$catIDD' ORDER BY cuid ASC") or die(mysqli_error());
                    $css = mysqli_num_rows($cekSub);
                    if($css > 0){
                        $nos = 0;
                        while($cs = mysqli_fetch_array($cekSub)){
                            $nos++;
                            $subkat = $cs['cuid'];
                ?>
                <div class="row pt-3 pl-2 pr-2 mb-2">
                  <div class="col-12">
                    <p><strong><i class="fa fa-fire text-warning"></i>&nbsp; <?php echo $cs['title']; ?></strong></p>
                  </div>
                  <?php
                    $kabupaten = mysqli_query($conn,"SELECT * FROM `tb_produk` WHERE kategori = '".$s6['kategori']."' AND subkategori = '$subkat' AND status = 1 ORDER BY harga_jual ASC") or die(mysqli_error());
                    $noe=0;
                    while ($kk = mysqli_fetch_array($kabupaten)) {
                        $noe++;
                        if(isset($_SESSION['user'])){
                          $usernya = $_SESSION['user'];
                          $cekUser = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE user = '$usernya'");
                          $cu = mysqli_fetch_array($cekUser);
                          if($cu['level'] == 'reseller'){
                            $harga_jual = $kk['harga_reseller'];
                          }
                          else {
                            $harga_jual = $kk['harga_jual'];
                          }
                        }  
                        else {
                          $harga_jual = $kk['harga_reseller'];
                        }
                  ?>
                  <div class="col-sm-4 col-6 p-1 text-left">
                    <input required="" type="radio" id="layanan_<?php echo $subkat.$noe; ?>" class="radio-nominale" name="produkID" value="<?php echo $kk['cuid']; ?>">
                    <label for="layanan_<?php echo $subkat.$noe; ?>" class=" text-left" style="font-size: 10px;">
                      <div class="row">
                        <div class="col-9">
                          <div style="min-height: 45px!important;"><strong><?php echo $kk['title']; ?></strong></div>
                          <?php if($kk['harga_coret'] != 0){ echo '<strike>Rp. '.number_format($kk['harga_coret']).'</strike> - '; } ?><?php echo 'Rp. '.number_format($harga_jual); ?>
                        </div>
                        <div class="col-3 p-1">
                          <img src="<?php echo $urlweb; ?>/upload/<?php echo $s6['subimage']; ?>" class="img-fluid">
                        </div>
                      </div>
                    </label>
                  </div>
                  <?php } ?>
                </div>
                <?php }} ?>
                <div class="row pt-3 pl-2 pr-2 mb-2">
                  <div class="col-12">
                    <p><strong><i class="fa fa-star text-warning"></i>&nbsp; Top Up Instant</strong></p>
                  </div>
                  <?php
                    $kabupaten = mysqli_query($conn,"SELECT * FROM `tb_produk` WHERE kategori = '".$s6['kategori']."' AND subkategori = 0 AND status = 1 ORDER BY harga_jual ASC") or die(mysqli_error());
                    $skk = mysqli_num_rows($kabupaten);
                    if($skk == 0){
                      echo '
                        <div class="col-12">
                          <div class="alert alert-warning alert-dismissible mt-3 mb-0" role="alert">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <div class="alert-icon">
                            <i class="fa fa-exclamation-triangle"></i>
                            </div>
                            <div class="alert-message">
                            <span><strong>Information!</strong> Produk sedang tidak tersedia.</span>
                            </div>
                          </div>
                        </div>
                      ';
                    }
                    else {
                      $no=0;
                      while ($kk = mysqli_fetch_array($kabupaten)) {
                        $no++;
                        if(isset($_SESSION['user'])){
                          $usernya = $_SESSION['user'];
                          $cekUser = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE user = '$usernya'");
                          $cu = mysqli_fetch_array($cekUser);
                          if($cu['level'] == 'reseller'){
                            $harga_jual = $kk['harga_reseller'];
                          }
                          else {
                            $harga_jual = $kk['harga_jual'];
                          }
                        }  
                        else {
                          $harga_jual = $kk['harga_reseller'];
                        }
                  ?>
                  <div class="col-sm-4 col-6 p-1 text-left">
                    <input required="" type="radio" id="layanan_<?php echo $no; ?>" class="radio-nominale" name="produkID" value="<?php echo $kk['cuid']; ?>">
                    <label for="layanan_<?php echo $no; ?>" class=" text-left" style="font-size: 10px;">
                      <div class="row">
                        <div class="col-9">
                          <div style="min-height: 45px!important;"><strong><?php echo $kk['title']; ?></strong></div>
                          <?php if($kk['harga_coret'] != 0){ echo '<strike>Rp. '.number_format($kk['harga_coret']).'</strike> - '; } ?><?php echo 'Rp. '.number_format($harga_jual); ?>
                        </div>
                        <div class="col-3 p-1">
                          <img src="<?php echo $urlweb; ?>/upload/<?php echo $s6['subimage']; ?>" class="img-fluid">
                        </div>
                      </div>
                    </label>
                  </div>
                  <?php }} ?>
                </div>
              </div>
            </div>
            <div class="card shadow-sm mb-2" style="border-radius: 10px;">
              <div class="card-body mb-0" style="border-radius: 10px;">
                <div class="text-white text-center position-absolute circle-primary"><span>3</span></div>
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
                        <div class="col-sm-12 col-12 text-center p-1">
                          Silahkan Pilih Produk Terlebih Dahulu!
                        </div>
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
                <div class="text-white text-center position-absolute circle-primary"><span>4</span></div>
                <h5 style="margin-left: 45px; margin-top: 5px;">Kode Promo/Voucher</h5>
                <div class="form-group pt-3">
                  <input type="text" name="kode_voucher" id="voucher" placeholder="Masukan Kode Promo/Voucher apabila ada" class="form-control" value="">
                  <input type="hidden" name="jenisnya" id="jenisnya"  class="form-control" value="<?php echo $jenisnya; ?>">
                </div>
                <button type="button" id="submitVoucher" class="btn btn-danger btn-sm text-white" style="float: left; margin-right: 35px;">Gunakan Kode Voucher</button>
                <?php
                  if (isset($_SESSION['user'])) {
                    $user = mysqli_query($conn, "SELECT * FROM `tb_user` WHERE user = '" . $_SESSION['user'] . "'") or die(mysqli_error());
                    $u = mysqli_fetch_array($user);
                    if($u['poin'] >= 100){
                ?>
                <div class="form-group form-check pt-2">
                  <input type="checkbox" class="form-check-input" id="exampleCheck1" name="point" value="<?php echo $u['poin']; ?>">
                  <label class="form-check-label text-white" for="exampleCheck1">Tukar <?php echo $u['poin']; ?> Poin Saya</label>
                </div>
                <?php }} ?>
              </div>
            </div>
            <div class="card shadow-sm mb-2" style="border-radius: 10px;">
              <div class="card-body mb-0" style="border-radius: 10px;">
                <div class="text-white text-center position-absolute circle-primary"><span>5</span></div>
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
        $("input:radio[name=produkID]").change(function (){
          url = "<?php echo $urlweb; ?>/select_game.php?id="+$('input:radio[name=produkID]:checked').val();
          $('#accordionExample').load(url);
          //console.log(url);
          return false;
        });
        $("#submitVoucher").click(function (){
          urle = "<?php echo $urlweb; ?>/select_voucher.php?id="+$('#voucher').val()+"&jenisnya="+$('#jenisnya').val()+"&produkID="+$('input:radio[name=produkID]:checked').val();
          $('#formvoucher').modal('show');
          $('#hasile').load(urle);
          //console.log(url);
          return false;
        });
        $("#submitId").click(function () {
          var uid = $("#userID").val();
          var replaces = uid.replace(' ','z10z');
          var replace = replaces.replace("#", "_");
          uri = "<?php echo $urlweb; ?>/get_detail.php?userID="+replace+"&zoneID="+$("#zoneID").val()+"&produkID="+$('input:radio[name=produkID]:checked').val()+"&metode="+$('input:radio[name=metode]:checked').val()+"&IDuser="+$("#IDuser").val()+"&noHp="+$("#noHp").val()+"&voucher="+$("#voucher").val()+"&ipaddress="+$("#ipaddress").val()+"&poin="+$("input:checkbox[name=point]:checked").val();
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
