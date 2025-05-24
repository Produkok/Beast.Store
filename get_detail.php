<?php
ob_start();
session_start();
include('config/koneksi.php');
$sql_0 = mysqli_query($conn,"SELECT * FROM `tb_seo` WHERE cuid = 1") or die(mysqli_error());
$s0 = mysqli_fetch_array($sql_0);
$urlweb = $s0['urlweb'];
error_reporting(0);
if($_GET['userID'] == ''){
?>
<div class="modal-body pt-5 pb-5 text-center">
  <i class="fa fa-exclamation-triangle fa-5x mb-3" style="font-size: 100px;"></i><br>
  <p style="font-size: 18px;">Harap Masukan Data Tujuan</p>
  <button type="button" class="btn btn-primary btn-lg mt-3" style="line-height: 18px;" data-dismiss="modal">OK</button>
</div>
<?php
}
else if($_GET['produkID'] == 'undefined'){
    echo '
        <div class="modal-body pt-5 pb-5 text-center">
          <i class="fa fa-exclamation-triangle fa-5x mb-3" style="font-size: 100px;"></i><br>
          <p style="font-size: 18px;">Silahkan Pilih Produk Terlebih Dahulu</p>
          <button type="button" class="btn btn-primary btn-lg mt-3" style="line-height: 18px;" data-dismiss="modal">OK</button>
        </div>
    ';
}
else if($_GET['metode'] == 'undefined'){
    echo '
        <div class="modal-body pt-5 pb-5 text-center">
          <i class="fa fa-exclamation-triangle fa-5x mb-3" style="font-size: 100px;"></i><br>
          <p style="font-size: 18px;">Silahkan Pilih Metode Pembayaran Terlebih Dahulu</p>
          <button type="button" class="btn btn-primary btn-lg mt-3" style="line-height: 18px;" data-dismiss="modal">OK</button>
        </div>
    ';
}
else if($_GET['noHp'] == ''){
    echo '
        <div class="modal-body pt-5 pb-5 text-center">
          <i class="fa fa-exclamation-triangle fa-5x mb-3" style="font-size: 100px;"></i><br>
          <p style="font-size: 18px;">Silahkan Isi Nomor Whatsapp Anda Terlebih Dahulu</p>
          <button type="button" class="btn btn-primary btn-lg mt-3" style="line-height: 18px;" data-dismiss="modal">OK</button>
        </div>
    ';
}
else if($_GET['noHp'] == '' || $_GET['produkID'] == '' || $_GET['metode'] == ''){
    echo '
        <div class="modal-body pt-5 pb-5 text-center">
          <i class="fa fa-exclamation-triangle fa-5x mb-3" style="font-size: 100px;"></i><br>
          <p style="font-size: 18px;">Silahkan Pesanan Anda Terlebih Dahulu</p>
          <button type="button" class="btn btn-primary btn-lg mt-3" style="line-height: 18px;" data-dismiss="modal">OK</button>
        </div>
    ';
}
else {
  $produkID = $_GET['produkID'];
  $kabupaten = mysqli_query($conn,"SELECT * FROM `tb_produk` WHERE cuid = '$produkID' ORDER BY cuid ASC");
  $kabupaten_row = mysqli_fetch_array($kabupaten);
  $kategori = $kabupaten_row['kategori'];
  $productType = $kabupaten_row['product_type'];
  if(isset($_SESSION['user'])){
    $usernya = $_SESSION['user'];
    $cekUser = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE user = '$usernya'");
    $cu = mysqli_fetch_array($cekUser);
    if($cu['level'] == 'reseller'){
      $harga = $kabupaten_row['harga_reseller'];
    }
    else {
      $harga = $kabupaten_row['harga_jual'];
    }
  }
  else {
    $harga = $kabupaten_row['harga_jual'];
  }
  
  if($_GET['voucher'] == ''){
    $voucher = '';
    $potongan = 0;
    $apaadah = 1;
  }
  else {
    $vouchers = mysqli_real_escape_string($conn,$_GET['voucher']);
    $getVoucher = mysqli_query($conn,"SELECT * FROM `tb_reward` WHERE title = '$vouchers'") or die(mysqli_error());
    $gvv = mysqli_num_rows($getVoucher);
    if($gvv == 0){
      $voucher = '';
      $potongan = 0;
      $apaadah = 1;
    }
    else {
      $gv = mysqli_fetch_array($getVoucher);
      $voucher = $vouchers;
      $kuota = $gv['kuota'];
      $jenisVoucher = $gv['jenis'];
      $minOrder = $gv['min_order'];
      $satuan = $gv['satuan'];
      $nilaiPotong = $gv['nominal'];
            
      if($kuota > 0){
        if($harga < $minOrder){
          $voucher = '';
          $potongan = 0;
          $apaadah = 1;
        }
        else {
          if($productType == $jenisVoucher){
            $getVoucherProduct = mysqli_query($conn,"SELECT * FROM `tb_reward_produk` WHERE title = '$vouchers' AND kategori = '$kategori'") or die(mysqli_error());
            $gvvp = mysqli_num_rows($getVoucherProduct);
            if($gvvp == 0){
              $voucher = '';
              $potongan = 0;
              $apaadah = 1;
            }
            else {
              $voucher = $vouchers;
              $apaadah = 7;
              if($satuan == 0){
                $aa = $nilaiPotong/100;
                $potongan = round($harga * $aa);
              }
              else {
                $potongan = $nilaiPotong;
              }
            }
          }
          else {
            $voucher = '';
            $potongan = 0;
            $apaadah = 1;
          }
        }
      }
      else {
        $voucher = '';
        $potongan = 0;
        $apaadah = 1;
      }
    }
  }
  if($_GET['point'] == ''){
    $point = '';
  }
  else {
    $point = $_GET['point'];
  }
  $sql_12 = mysqli_query($conn,"SELECT * FROM `tb_kategori` WHERE kategori = '$kategori'") or die(mysqli_error());
  $s12 = mysqli_fetch_array($sql_12);
  $metode = $_GET['metode'];
  
  $getPayment = mysqli_query($conn,"SELECT * FROM `tb_bank` WHERE cuid = '$metode'") or die(mysqli_error());
  $gp = mysqli_fetch_array($getPayment);
  $cekID = $s12['cekID'];
  if($cekID == ''){
?>
<form role="form" id="search_form" action="<?php echo $urlweb; ?>/proses_order.php" method="POST">
  <div class="modal-body pt-5 pb-5 text-center">
    <i class="fa fa-check-circle fa-5x mb-3" style="font-size: 100px;"></i><br>
    <p style="font-size: 16px; text-align: left;">Terima Kasih, Berikut Adalah Data Pesanan Anda :</p>
    <table style="width: 100%;">
      <tbody>            
        <tr>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">Kategori Layanan</td>
          <td class="text-left p-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">:</td>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">
            <?php echo $kabupaten_row['kategori']; ?>
            <input type="hidden" class="form-control" name="produkID" value="<?php echo $_GET['produkID']; ?>" readonly>
            <input type="hidden" class="form-control" name="ipaddress" value="<?php echo $_GET['ipaddress']; ?>" readonly>
          </td>
        </tr>
        <tr>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">Nominal Layanan</td>
          <td class="text-left p-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">:</td>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">
            <?php echo $kabupaten_row['title']; ?>
          </td>
        </tr>
        <tr>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">Data Tujuan</td>
          <td class="text-left p-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">:</td>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">
            <?php echo $_GET['userID']; ?> <?php if($_GET['zoneID'] != 1) { ?>(<?php echo str_replace('_',' ',$_GET['zoneID']); ?>)<?php } ?>
            <input type="hidden" class="form-control" name="userID" value="<?php echo mysqli_real_escape_string($conn,$_GET['userID']); ?>">
            <input type="hidden" class="form-control" name="zone_id" value="<?php if($_GET['zoneID'] != 1) { echo str_replace('_',' ',$_GET['zoneID']); } ?>">
          </td>
        </tr>
        <tr>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">Kode Voucher</td>
          <td class="text-left p-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">:</td>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">
            <?php if($vouchers == ''){ echo 'Tidak Ada Voucher Digunakan'; } else { echo $voucher; } ?>
            <input type="hidden" class="form-control" name="voucher" value="<?php echo $voucher; ?>">
            <input type="hidden" class="form-control" name="apaandah" value="<?php echo $apaadah; ?>">
            <input type="hidden" class="form-control" name="point" value="<?php echo $point; ?>">
          </td>
        </tr>
        <tr>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">Metode Pembayaran</td>
          <td class="text-left p-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">:</td>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">
            <?php echo $gp['akun']; ?>
            <input type="hidden" class="form-control" name="metode" value="<?php echo $_GET['metode']; ?>">
          </td>
        </tr>
        <tr>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; color: #fff;"></td>
          <td class="text-left p-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;"></td>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; color: #fff;">
            <input type="hidden" name="IDuser" class="form-control" value="<?php echo $_GET['IDuser']; ?>">
            <input type="hidden" name="no_hp" class="form-control" value="<?php echo mysqli_real_escape_string($conn,$_GET['noHp']); ?>">
          </td>
        </tr>
        <tr>
          <td colspan="3" class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; color: #fff;">
            Pastikan data Tujuan Anda sudah benar. Kesalahan input data Tujuan bukan tanggung jawab kami.
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-danger" style="line-height: 18px;" data-dismiss="modal">Batal</button>
    <button type="submit" name="submit" id="buttonSubmit" style="line-height: 18px;" class="btn btn-primary">Lanjutkan Pembayaran <i class="fa fa-arrow-right"></i></button>
  </div>
</form>
<?php
  }
  else {
    if($_GET['zoneID'] == 1){
        $zoneID = '';
    }
    else {
        $zoneID = $_GET['zoneID'];
    }
    $userIDGame = mysqli_real_escape_string($conn,$_GET['userID']);
    $userGames = str_replace('_','#',$userIDGame);
    $userGame = str_replace('z10z',' ',$userGames);
    if($s12['kategori'] == 'Higgs Domino'){
        $merchantCodes = 'M231103YAYM1220GC';
        $apiKeys = '733e862a6ceabdf51d1aa830e35f7e517f1e7adfba769c27c48049a8446f1b06';
        $signe = $merchantCodes.$apiKeys;
        $sign = md5($signe);
        
        $post_url = 'https://v1.apigames.id/merchant/'.$merchantCodes.'/cek-username/higgs?user_id='.$userGame.'&signature='.$sign;
        $curl1 = curl_init();
        curl_setopt_array($curl1, array(
            CURLOPT_URL => $post_url,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'GET',
            CURLOPT_POSTFIELDS => '',
            CURLOPT_HTTPHEADER => array(
                'Content-Type: application/x-www-form-urlencoded'
            ),
        ));
                                            
        $response1 = curl_exec($curl1);
        curl_close($curl1);
        $hasils = json_decode($response1, true);
        //echo $response1; 
        
        $resultHasil = $hasils['data']['is_valid'];
        
    }
    else {
        $sql_4 = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 4") or die(mysqli_error());
        $s4 = mysqli_fetch_array($sql_4);
        $apiKeys = $s4['api_key'];
        $merchantCodes = $s4['merchant_code'];
        $signe = $merchantCodes.$apiKeys;
        $sign = md5($signe);
        $curl1 = curl_init();
        
        curl_setopt_array($curl1, array(
            CURLOPT_URL => 'https://vip-reseller.co.id/api/game-feature',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => array('key' => $apiKeys, 'sign' => $sign, 'type' => 'get-nickname', 'code' => $cekID, 'target' => $userGame, 'additional_target' => $zoneID),
        ));
                                        
        $response1 = curl_exec($curl1);
        curl_close($curl1);
        $hasils = json_decode($response1, true);
        //echo $response1; 
        
        $resultHasil = $hasils['result'];
        
    }
    
    
    if($resultHasil == false){
      echo '
        <div class="modal-body pt-5 pb-5 text-center">
          <i class="fa fa-exclamation-triangle fa-5x mb-3" style="font-size: 100px;"></i><br>
          <p style="font-size: 18px;">Masukan User ID Dengan Benar</p>
          <button type="button" class="btn btn-primary btn-lg mt-3" style="line-height: 18px;" data-dismiss="modal">OK</button>
        </div>
      ';
    }
    else {
        if($s12['kategori'] == 'Higgs Domino'){
            $nickname = $hasils['data']['username'];
        }
        else {
            $nickname = $hasils['data'];
        }
      
?>
<form role="form" id="search_form" action="<?php echo $urlweb; ?>/proses_order.php" method="POST">
  <div class="modal-body pt-5 pb-5 text-center">
    <i class="fa fa-check-circle fa-5x mb-3" style="font-size: 100px;"></i><br>
    <p style="font-size: 16px; text-align: left;">Terima Kasih, Berikut Adalah Data Pesanan Anda :</p>
    <table style="width: 100%;">
      <tbody>            
        <tr>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">Kategori Layanan</td>
          <td class="text-left p-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">:</td>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">
            <?php echo $kabupaten_row['kategori']; ?>
            <input type="hidden" class="form-control" name="produkID" value="<?php echo $_GET['produkID']; ?>" readonly>
            <input type="hidden" class="form-control" name="ipaddress" value="<?php echo $_GET['ipaddress']; ?>" readonly>
          </td>
        </tr>
        <tr>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">Nominal Layanan</td>
          <td class="text-left p-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">:</td>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">
            <?php echo $kabupaten_row['title']; ?>
          </td>
        </tr>
        <tr>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">Data Tujuan</td>
          <td class="text-left p-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">:</td>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">
            <?php echo $_GET['userID']; ?> <?php if($_GET['zoneID'] != 1) { ?>(<?php echo str_replace('_',' ',$_GET['zoneID']); ?>)<?php } ?>
            <input type="hidden" class="form-control" name="userID" value="<?php echo mysqli_real_escape_string($conn,$_GET['userID']); ?>">
            <input type="hidden" class="form-control" name="zone_id" value="<?php if($_GET['zoneID'] != 1) { echo str_replace('_',' ',$_GET['zoneID']); } ?>">
          </td>
        </tr>
        <tr>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">Nickname</td>
          <td class="text-left p-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">:</td>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">
            <?php echo $nickname; ?>
            <input type="hidden" class="form-control" name="nickname" value="<?php echo $nickname; ?>">
          </td>
        </tr>
        <tr>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">Kode Voucher</td>
          <td class="text-left p-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">:</td>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">
            <?php if($vouchers == ''){ echo 'Tidak Ada Voucher Digunakan'; } else { echo $voucher; } ?>
            <input type="hidden" class="form-control" name="voucher" value="<?php echo $voucher; ?>">
            <input type="hidden" class="form-control" name="apaandah" value="<?php echo $apaadah; ?>">
            <input type="hidden" class="form-control" name="point" value="<?php echo $point; ?>">
          </td>
        </tr>
        <tr>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">Metode Pembayaran</td>
          <td class="text-left p-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">:</td>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">
            <?php echo $gp['akun']; ?>
            <input type="hidden" class="form-control" name="metode" value="<?php echo $_GET['metode']; ?>">
          </td>
        </tr>
        <tr>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; color: #fff;"></td>
          <td class="text-left p-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;"></td>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; color: #fff;">
            <input type="hidden" name="IDuser" class="form-control" value="<?php echo $_GET['IDuser']; ?>">
            <input type="hidden" name="no_hp" class="form-control" value="<?php echo mysqli_real_escape_string($conn,$_GET['noHp']); ?>">
          </td>
        </tr>
        <tr>
          <td colspan="3" class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; color: #fff;">
            Pastikan data Tujuan Anda sudah benar. Kesalahan input data Tujuan bukan tanggung jawab kami.
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-danger" style="line-height: 18px;" data-dismiss="modal">Batal</button>
    <button type="submit" name="submit" id="buttonSubmit" style="line-height: 18px;" class="btn btn-primary">Lanjutkan Pembayaran <i class="fa fa-arrow-right"></i></button>
  </div>
</form>
<?php
    }
  }
}
?>