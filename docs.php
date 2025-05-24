<?php include('session.php'); ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Pengaturan API - <?php echo $s0['instansi']; ?></title>
  <meta name="description" content="<?php echo $s0['deskripsi']; ?>">
  <meta name="keywords" content="<?php echo $s0['keyword']; ?>">
  <meta property="og:title" content="Pengaturan API - <?php echo $s0['instansi']; ?>"/>
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
              <?php
                if (!empty($_GET['notif'])) {
                  if ($_GET['notif'] == 1) {
                    echo '
                      <div class="alert alert-warning alert-dismissible mb-3" role="alert">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <div class="alert-icon">
                          <i class="fa fa-exclamation-triangle"></i>
                        </div>
                        <div class="alert-message">
                          <span><strong>Warning!</strong> Pin Transaksi Salah!</span>
                        </div>
                      </div>
                    ';
                  }
                }
              ?>
              <div class="card shadow-sm mb-3">
                <div class="card-body text-white">
                  <div class="row">
                    <div class="col-sm-6">
                      <label class="text-white">Merchant Code</label><br>
                      <?php if($u['merchantid'] != ''){ ?>
                      <p class="text-white"><?php echo $u['merchantid']; ?> <span class="badge badge-danger clip p-2 ml-3" style="font-size: 12px;" onclick="copy_merchant()" data-clipboard-text="<?php echo $u['merchantid']; ?>"><i class="fa fa-clone"></i> Copy</span></p>
                      <?php } ?>
                      <label class="text-white">API Key</label><br>
                      <?php if($u['apikey'] != ''){ ?>
                      <p class="text-white"><?php echo $u['apikey']; ?> <span class="badge badge-danger clip p-2 ml-3" style="font-size: 12px;" onclick="copy_apikey()" data-clipboard-text="<?php echo $u['apikey']; ?>"><i class="fa fa-clone"></i> Copy</span></p>
                      <?php } ?>
                      
                    </div>
                    <div class="col-sm-6 text-right">
                      <button class="btn btn-primary" data-toggle="modal" data-target="#formdepo" data-backdrop="static" data-keyboard="false">Generate API KEY</button>
                      <!-- Modal -->
                      <div class="modal fade" id="formdepo">
                        <div class="modal-dialog modal-dialog-centered">
                          <div class="modal-content animated bounceIn" style="background-color: var(--primary-color); color: #fff!important;">
                            <div class="modal-header">
                              <h5 class="modal-title" style="color: #fff;">Generate API Key</h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <div class="modal-body text-left">
                              <form role="form" action="<?php echo $urlweb; ?>/functions/generate.php" method="post">
                                <div class="form-group mb-2">
                                  <label class="text-white">Masukan PIN Transaksi Anda</label>
                                  <input type="password" class="form-control" name="pinTrx">
                                </div>
                                <button type="submit" class="btn btn-primary">Generate API KEY</button>
                              </form>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-sm-12">
                      <?php if($u['merchantid'] != ''){ ?>
                      <hr>
                      <form role="form" action="<?php echo $urlweb; ?>/functions/whitelist.php" method="POST">
                        <div class="form-group mb-2">
                          <label class="text-white">Masukan IP Server Anda</label>
                          <input type="text" class="form-control" name="ip_server" value="<?php echo $u['whitelist']; ?>">
                          <span>Pisahkan Dengan Koma (,) apabila lebih dari 1 IP</span>
                        </div>
                        <button type="submit" class="btn btn-danger">Whitelist IP</button>
                      </form>
                      <?php } ?>
                    </div>
                  </div>                  
                </div>
              </div>
              <div class="accordion" id="accordionExample">
                <div class="card box_game mb-2">
                  <div class="card-header pt-1 pb-0 pl-1 pr-1" id="headingOne">
                    <div class="row">
                      <div class="col-12">
                        <h2 class="mb-0">
                        <button class="btn btn-link btn-block pl-1 text-left" type="button" data-toggle="collapse" data-target="#collapseOne1" aria-expanded="true" aria-controls="collapseOne1">
                          1. Daftar kategori Produk
                        </button>
                        </h2>
                      </div>
                    </div>
                  </div>
                  <div id="collapseOne1" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                    <div class="card-body">
                      <p>Endpoint : <?php echo $urlweb; ?>/api/category <span class="badge badge-danger clip p-2 ml-3" style="font-size: 12px;" onclick="copy_category()" data-clipboard-text="<?php echo $urlweb; ?>/api/category"><i class="fa fa-clone"></i> Copy</span></p>
                      <ul class="nav nav-tabs" id="myTab" role="tablist" style="width: 100%!important; border-bottom-left-radius: 10px !important; border-bottom-right-radius: 10px !important;">
                        <li class="nav-item" role="presentation" style="width: 33.3%; border-bottom-left-radius: 10px !important;">
                          <a class="nav-link active text-white" id="parameter-cat" data-toggle="tab" href="#parameter_cat" role="tab" aria-controls="parameter_cat" aria-selected="true" style="font-size: 10px;">
                            Parameter
                          </a>
                        </li>
                        <li class="nav-item" role="presentation" style="width: 33.3%; border-bottom-left-radius: 10px !important;">
                          <a class="nav-link text-white" id="request-cat" data-toggle="tab" href="#request_cat" role="tab" aria-controls="request_cat" aria-selected="true" style="font-size: 10px;">
                            Contoh Request
                          </a>
                        </li>
                        <li class="nav-item" role="presentation" style="width: 33.3%; border-bottom-left-radius: 10px !important;">
                          <a class="nav-link text-white" id="response-cat" data-toggle="tab" href="#response_cat" role="tab" aria-controls="response_cat" aria-selected="true" style="font-size: 10px;">
                            Response
                          </a>
                        </li>
                      </ul>
                      <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active p-3" id="parameter_cat" role="tabpanel" aria-labelledby="parameter-cat">
                            <table class="table table-bordered text-white">
                                <tr>
                                    <td>api_key</td>
                                    <td>API KEY</td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab-pane fade p-3" id="request_cat" role="tabpanel" aria-labelledby="request-cat">
                            <code class="text-white">
                                $curl = curl_init();<br>
                               
                    		    curl_setopt_array($curl, array(<br>
                    		      CURLOPT_URL => '<?php echo $urlweb; ?>/api/category',<br>
                    		      CURLOPT_RETURNTRANSFER => true,<br>
                    		      CURLOPT_ENCODING => "",<br>
                    		      CURLOPT_MAXREDIRS => 10,<br>
                    		      CURLOPT_TIMEOUT => 0,<br>
                    		      CURLOPT_FOLLOWLOCATION => true,<br>
                    		      CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,<br>
                    		      CURLOPT_CUSTOMREQUEST => "POST",<br>
                    		      CURLOPT_POSTFIELDS => "api_key=[API_KEY]",<br>
                    		      CURLOPT_HTTPHEADER => array(<br>
                    		        "Content-Type: application/x-www-form-urlencoded",<br>
                    		        "Cache-Control: no-cache"<br>
                    		      ),<br>
                    		    ));<br>
                    		                            
                    		    $response = curl_exec($curl);<br>
                    		    curl_close($curl);<br>
                            </code>
                        </div>
                        <div class="tab-pane fade p-3" id="response_cat" role="tabpanel" aria-labelledby="response-cat">
                            <code class="text-white">
                                {<br>
                                    "status": true,<br>
                                    "data": {<br>
                                        "kategori": "Mobile Legend",<br>
                                        "image": "<?php echo $urlweb; ?>/upload/mobilelegend.png"<br>
                                        "type": "1"<br>
                                    }<br>
                                }
                            </code>
                            <p>&nbsp;</p>
                            <p>Jenis :</p>
                            <ol class="list-unstyled" style="font-size: 10px;">
                                <li>1 = Top Up</li>
                                <li>2 = Akun Premium</li>
                                <li>3 = Pulsa</li>
                                <li>4 = Emoney</li>
                                <li>5 = Social Media</li>
                                <li>7 = Pascabayar</li>
                            </ol>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="card box_game mb-2">
                  <div class="card-header pt-1 pb-0 pl-1 pr-1" id="headingOne">
                    <div class="row">
                      <div class="col-12">
                        <h2 class="mb-0">
                        <button class="btn btn-link btn-block pl-1 text-left" type="button" data-toggle="collapse" data-target="#collapseOne2" aria-expanded="true" aria-controls="collapseOne2">
                          2. Daftar Produk
                        </button>
                        </h2>
                      </div>
                    </div>
                  </div>
                  <div id="collapseOne2" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                    <div class="card-body">
                      <p>Endpoint : <?php echo $urlweb; ?>/api/produk <span class="badge badge-danger clip p-2 ml-3" style="font-size: 12px;" onclick="copy_game()" data-clipboard-text="<?php echo $urlweb; ?>/api/game"><i class="fa fa-clone"></i> Copy</span></p>
                      <ul class="nav nav-tabs" id="myTab" role="tablist" style="width: 100%!important; border-bottom-left-radius: 10px !important; border-bottom-right-radius: 10px !important;">
                        <li class="nav-item" role="presentation" style="width: 33.3%; border-bottom-left-radius: 10px !important;">
                          <a class="nav-link active text-white" id="parameter-game" data-toggle="tab" href="#parameter_game" role="tab" aria-controls="parameter_game" aria-selected="true" style="font-size: 10px;">
                            Parameter
                          </a>
                        </li>
                        <li class="nav-item" role="presentation" style="width: 33.3%; border-bottom-left-radius: 10px !important;">
                          <a class="nav-link text-white" id="request-game" data-toggle="tab" href="#request_game" role="tab" aria-controls="request_game" aria-selected="true" style="font-size: 10px;">
                            Contoh Request
                          </a>
                        </li>
                        <li class="nav-item" role="presentation" style="width: 33.3%; border-bottom-left-radius: 10px !important;">
                          <a class="nav-link text-white" id="response-game" data-toggle="tab" href="#response_game" role="tab" aria-controls="response_game" aria-selected="true" style="font-size: 10px;">
                            Response
                          </a>
                        </li>
                      </ul>
                      <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active p-3" id="parameter_game" role="tabpanel" aria-labelledby="parameter-game">
                            <table class="table table-bordered text-white">
                                <tr>
                                    <td>api_key</td>
                                    <td>API KEY</td>
                                </tr>
                                <tr>
                                    <td>jenis</td>
                                    <td>Lihat pada Tab Kategori Bagian Response</td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab-pane fade p-3" id="request_game" role="tabpanel" aria-labelledby="request-game">
                            <code class="text-white">
                                $curl = curl_init();<br>
                               
                    		    curl_setopt_array($curl, array(<br>
                    		      CURLOPT_URL => '<?php echo $urlweb; ?>/api/produk',<br>
                    		      CURLOPT_RETURNTRANSFER => true,<br>
                    		      CURLOPT_ENCODING => "",<br>
                    		      CURLOPT_MAXREDIRS => 10,<br>
                    		      CURLOPT_TIMEOUT => 0,<br>
                    		      CURLOPT_FOLLOWLOCATION => true,<br>
                    		      CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,<br>
                    		      CURLOPT_CUSTOMREQUEST => "POST",<br>
                    		      CURLOPT_POSTFIELDS => "api_key=[API_KEY]&jenis=[JENIS_PRODUK]",<br>
                    		      CURLOPT_HTTPHEADER => array(<br>
                    		        "Content-Type: application/x-www-form-urlencoded",<br>
                    		        "Cache-Control: no-cache"<br>
                    		      ),<br>
                    		    ));<br>
                    		                            
                    		    $response = curl_exec($curl);<br>
                    		    curl_close($curl);<br>
                            </code>
                        </div>
                        <div class="tab-pane fade p-3" id="response_game" role="tabpanel" aria-labelledby="response-game">
                            <code class="text-white">
                                {<br>
                                    "status": true,<br>
                                    "data": {<br>
                                        "kategori": "Mobile Legend",<br>
                                        "kode_produk": "123456",<br>
                                        "nama_produk": "344 Diamonds (312 + 32 Bonus)",<br>
                                        "harga": "152908",<br>
                                        "status": "Aktif"<br>
                                    }<br>
                                }
                            </code>
                        </div>
                      </div>
                      
                    </div>
                  </div>
                </div>

                <div class="card box_game mb-2">
                  <div class="card-header pt-1 pb-0 pl-1 pr-1" id="headingOne">
                    <div class="row">
                      <div class="col-12">
                        <h2 class="mb-0">
                        <button class="btn btn-link btn-block pl-1 text-left" type="button" data-toggle="collapse" data-target="#collapseOne5" aria-expanded="true" aria-controls="collapseOne5">
                          3. Proses Pesanan
                        </button>
                        </h2>
                      </div>
                    </div>
                  </div>
                  <div id="collapseOne5" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                    <div class="card-body">
                      <p>Endpoint : <?php echo $urlweb; ?>/api/transaksi <span class="badge badge-danger clip p-2 ml-3" style="font-size: 12px;" onclick="copy_transaksi()" data-clipboard-text="<?php echo $urlweb; ?>/api/transaksi"><i class="fa fa-clone"></i> Copy</span></p>
                      <ul class="nav nav-tabs" id="myTab" role="tablist" style="width: 100%!important; border-bottom-left-radius: 10px !important; border-bottom-right-radius: 10px !important;">
                        <li class="nav-item" role="presentation" style="width: 33.3%; border-bottom-left-radius: 10px !important;">
                          <a class="nav-link active text-white" id="parameter-transaksi" data-toggle="tab" href="#parameter_transaksi" role="tab" aria-controls="parameter_transaksi" aria-selected="true" style="font-size: 10px;">
                            Parameter
                          </a>
                        </li>
                        <li class="nav-item" role="presentation" style="width: 33.3%; border-bottom-left-radius: 10px !important;">
                          <a class="nav-link text-white" id="request-transaksi" data-toggle="tab" href="#request_transaksi" role="tab" aria-controls="request_transaksi" aria-selected="true" style="font-size: 10px;">
                            Contoh Request
                          </a>
                        </li>
                        <li class="nav-item" role="presentation" style="width: 33.3%; border-bottom-left-radius: 10px !important;">
                          <a class="nav-link text-white" id="response-transaksi" data-toggle="tab" href="#response_transaksi" role="tab" aria-controls="response_transaksi" aria-selected="true" style="font-size: 10px;">
                            Response
                          </a>
                        </li>
                      </ul>
                      <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active p-3" id="parameter_transaksi" role="tabpanel" aria-labelledby="parameter-transaksi">
                            <table class="table table-bordered text-white">
                                <tr>
                                    <td>merchant_code</td>
                                    <td>MERCHANT CODE</td>
                                </tr>
                                <tr>
                                    <td>api_key</td>
                                    <td>API KEY</td>
                                </tr>
                                <tr>
                                    <td>ref_id</td>
                                    <td>Nomor Transaksi yang di generate oleh User</td>
                                </tr>
                                <tr>
                                    <td>kode_produk</td>
                                    <td>Produk Tujuan, Kode bisa dilihat di <a href="<?php echo $urlweb; ?>/pricelist/" target="_blank"></a></td>
                                </tr>
                                <tr>
                                    <td>tujuan</td>
                                    <td>Player ID atau Nomor Tujuan</td>
                                </tr>
                                <tr>
                                    <td>server_id</td>
                                    <td>Server ID Tujuan<br><small>Kosongkan apabila Produk tidak memiliki Server ID</small></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab-pane fade p-3" id="request_transaksi" role="tabpanel" aria-labelledby="request-transaksi">
                            <code class="text-white">
                                $curl = curl_init();<br>
                               
                    		    curl_setopt_array($curl, array(<br>
                    		      CURLOPT_URL => '<?php echo $urlweb; ?>/api/transaksi',<br>
                    		      CURLOPT_RETURNTRANSFER => true,<br>
                    		      CURLOPT_ENCODING => "",<br>
                    		      CURLOPT_MAXREDIRS => 10,<br>
                    		      CURLOPT_TIMEOUT => 0,<br>
                    		      CURLOPT_FOLLOWLOCATION => true,<br>
                    		      CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,<br>
                    		      CURLOPT_CUSTOMREQUEST => "POST",<br>
                    		      CURLOPT_POSTFIELDS => "merchant_code=[MERCHANT_CODE]&api_key=[API_KEY]]&ref_id=[REF_ID]]&kode_produk=[KODE_PRODUK]&tujuan=[TUJUAN]&server_id=[SERVER_ID]",<br>
                    		      CURLOPT_HTTPHEADER => array(<br>
                    		        "Content-Type: application/x-www-form-urlencoded",<br>
                    		        "Cache-Control: no-cache"<br>
                    		      ),<br>
                    		    ));<br>
                    		                            
                    		    $response = curl_exec($curl);<br>
                    		    curl_close($curl);<br>
                            </code>
                        </div>
                        <div class="tab-pane fade p-3" id="response_transaksi" role="tabpanel" aria-labelledby="response-transaksi">
                            <code class="text-white">
                                {<br>
                                    "status": true,<br>
                                    "data": {<br>
                                        "trxid": "trxid_00112343",<br>
                                        "data": "087800001233",<br>
                                        "code": "123456",<br>
                                        "service": "Dana 10000",<br>
                                        "status": "pending",<br>
                                        "note": "",<br>
                                        "price": 10537<br>
                                    }<br>
                                }
                            </code>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="card box_game mb-2">
                  <div class="card-header pt-1 pb-0 pl-1 pr-1" id="headingOne">
                    <div class="row">
                      <div class="col-12">
                        <h2 class="mb-0">
                        <button class="btn btn-link btn-block pl-1 text-left" type="button" data-toggle="collapse" data-target="#collapseOne6" aria-expanded="true" aria-controls="collapseOne6">
                          4. Cek Status Pesanan
                        </button>
                        </h2>
                      </div>
                    </div>
                  </div>
                  <div id="collapseOne6" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                    <div class="card-body">
                      <p>Endpoint : <?php echo $urlweb; ?>/api/status <span class="badge badge-danger clip p-2 ml-3" style="font-size: 12px;" onclick="copy_status()" data-clipboard-text="<?php echo $urlweb; ?>/api/status"><i class="fa fa-clone"></i> Copy</span></p>
                      <ul class="nav nav-tabs" id="myTab" role="tablist" style="width: 100%!important; border-bottom-left-radius: 10px !important; border-bottom-right-radius: 10px !important;">
                        <li class="nav-item" role="presentation" style="width: 33.3%; border-bottom-left-radius: 10px !important;">
                          <a class="nav-link active text-white" id="parameter-status" data-toggle="tab" href="#parameter_status" role="tab" aria-controls="parameter_status" aria-selected="true" style="font-size: 10px;">
                            Parameter
                          </a>
                        </li>
                        <li class="nav-item" role="presentation" style="width: 33.3%; border-bottom-left-radius: 10px !important;">
                          <a class="nav-link text-white" id="request-status" data-toggle="tab" href="#request_status" role="tab" aria-controls="request_status" aria-selected="true" style="font-size: 10px;">
                            Contoh Request
                          </a>
                        </li>
                        <li class="nav-item" role="presentation" style="width: 33.3%; border-bottom-left-radius: 10px !important;">
                          <a class="nav-link text-white" id="response-status" data-toggle="tab" href="#response_status" role="tab" aria-controls="response_status" aria-selected="true" style="font-size: 10px;">
                            Response
                          </a>
                        </li>
                      </ul>
                      <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active p-3" id="parameter_status" role="tabpanel" aria-labelledby="parameter-status">
                            <table class="table table-bordered text-white">
                                <tr>
                                    <td>merchant_code</td>
                                    <td>MERCHANT CODE</td>
                                </tr>
                                <tr>
                                    <td>api_key</td>
                                    <td>API KEY</td>
                                </tr>
                                <tr>
                                    <td>ref_id</td>
                                    <td>Nomor Transaksi yang di generate oleh User</td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab-pane fade p-3" id="request_status" role="tabpanel" aria-labelledby="request-status">
                            <code class="text-white">
                                $curl = curl_init();<br>
                               
                    		    curl_setopt_array($curl, array(<br>
                    		      CURLOPT_URL => '<?php echo $urlweb; ?>/api/status',<br>
                    		      CURLOPT_RETURNTRANSFER => true,<br>
                    		      CURLOPT_ENCODING => "",<br>
                    		      CURLOPT_MAXREDIRS => 10,<br>
                    		      CURLOPT_TIMEOUT => 0,<br>
                    		      CURLOPT_FOLLOWLOCATION => true,<br>
                    		      CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,<br>
                    		      CURLOPT_CUSTOMREQUEST => "POST",<br>
                    		      CURLOPT_POSTFIELDS => "merchant_code=[MERCHANT_CODE]&api_key=[API_KEY]]&ref_id=[REF_ID]]",<br>
                    		      CURLOPT_HTTPHEADER => array(<br>
                    		        "Content-Type: application/x-www-form-urlencoded",<br>
                    		        "Cache-Control: no-cache"<br>
                    		      ),<br>
                    		    ));<br>
                    		                            
                    		    $response = curl_exec($curl);<br>
                    		    curl_close($curl);<br>
                            </code>
                        </div>
                        <div class="tab-pane fade p-3" id="response_status" role="tabpanel" aria-labelledby="response-status">
                            <code class="text-white">
                                {<br>
                                    "status": true,<br>
                                    "data": {<br>
                                        "trxid": "trxid_00112343",<br>
                                        "data": "087800001233",<br>
                                        "code": "123456",<br>
                                        "service": "Dana 10000",<br>
                                        "status": "sukses",<br>
                                        "note": "",<br>
                                        "price": 10537<br>
                                    }<br>
                                }
                            </code>
                        </div>
                      </div>
                      
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

      function copy_merchant() {
        alert("Merchant Code berhasil di Copy");
      }

      function copy_apikey() {
        alert("Api Key berhasil di Copy");
      }

      function copy_category() {
        alert("Endpoint berhasil di Copy");
      }

      function copy_game() {
        alert("Endpoint berhasil di Copy");
      }

      function copy_prepaid() {
        alert("Endpoint berhasil di Copy");
      }

      function copy_transaksi() {
        alert("Endpoint berhasil di Copy");
      }

      function copy_status() {
        alert("Endpoint berhasil di Copy");
      }

    </script>
    
</body>
</html>
