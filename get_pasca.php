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
else if($_GET['noHp'] == '' || $_GET['metode'] == ''){
    echo '
        <div class="modal-body pt-5 pb-5 text-center">
          <i class="fa fa-exclamation-triangle fa-5x mb-3" style="font-size: 100px;"></i><br>
          <p style="font-size: 18px;">Silahkan Pesanan Anda Terlebih Dahulu</p>
          <button type="button" class="btn btn-primary btn-lg mt-3" style="line-height: 18px;" data-dismiss="modal">OK</button>
        </div>
    ';
}
else {
  $voucher = mysqli_real_escape_string($conn,$_GET['voucher']);
  if($voucher != ''){
    $getVoucher = mysqli_query($conn,"SELECT * FROM `tb_reward` WHERE title = '$voucher' AND status = 1") or die(mysqli_error());
    $gvv = mysqli_num_rows($getVoucher);
    if($gvv == 0){
      $apa = 'Voucher Tidak Valid';
      $potongan = 0;
    }
    else {
      $gv = mysqli_fetch_array($getVoucher);
      $apa = $voucher;
      $potongan = $gv['nominal'];
    }
  }
  
  $unik = date('Hs');
  $kode_unik = substr(str_shuffle(1234567890),0,3);
  $kd_transaksi = 'INV'.$unik.$kode_unik.'PAY';
  $produkID = $_GET['produkID'];
  $kabupaten = mysqli_query($conn,"SELECT * FROM `tb_pascabayar` WHERE cuid = '$produkID' ORDER BY cuid ASC");
  $kabupaten_row = mysqli_fetch_array($kabupaten);
  $jenisnya = $kabupaten_row['jenis'];
  
  $sql_4 = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 5") or die(mysqli_error());
  $s4 = mysqli_fetch_array($sql_4);
  $apiKeys = $s4['api_key'];
  $merchantCodes = $s4['merchant_code'];
  $signe = $merchantCodes.$apiKeys.$kd_transaksi;
  $sign = md5($signe);
      
  $params = array(
    'commands' => 'inq-pasca',
    'username' => $merchantCodes,
    'buyer_sku_code' => $kabupaten_row['code'],
    'customer_no' => $_GET['userID'],
    'ref_id' => $kd_transaksi,
    'sign' => $sign
  );
  $params_string = json_encode($params);
  $url1 = 'https://api.digiflazz.com/v1/transaction';
  $ch1 = curl_init();
  curl_setopt($ch1, CURLOPT_URL, $url1); 
  curl_setopt($ch1, CURLOPT_CUSTOMREQUEST, "POST");                                                                     
  curl_setopt($ch1, CURLOPT_POSTFIELDS, $params_string);                                                                  
  curl_setopt($ch1, CURLOPT_RETURNTRANSFER, true);                                                                      
  curl_setopt($ch1, CURLOPT_HTTPHEADER, array(                                                                          
    'Content-Type: application/json'                                                                       
  ));   
  curl_setopt($ch1, CURLOPT_SSL_VERIFYPEER, FALSE);
               
  //execute post
  $response1 = curl_exec($ch1);
  //echo $response1;
  curl_close($ch1);
  $hasils = json_decode($response1, true);

?>
<form role="form" id="search_form" action="<?php echo $urlweb; ?>/proses_pascabayar.php" method="POST">
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
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">Jenis Layanan</td>
          <td class="text-left p-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">:</td>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">
            <?php echo $kabupaten_row['title']; ?>
          </td>
        </tr>
        <tr>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">Data Tujuan</td>
          <td class="text-left p-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">:</td>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">
            <?php echo mysqli_real_escape_string($conn,$_GET['userID']); ?>
            <input type="hidden" class="form-control" name="userID" value="<?php echo mysqli_real_escape_string($conn,$_GET['userID']); ?>">
            <input type="hidden" class="form-control" name="trxID" value="<?php echo $kd_transaksi; ?>">
          </td>
        </tr>
        <tr>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">Data Pelanggan</td>
          <td class="text-left p-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">:</td>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">
            <?php echo $nickname; ?>
            <input type="hidden" class="form-control" name="nickname" value="<?php echo $nickname; ?>">
          </td>
        </tr>
        <tr>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">Jumlah Tagihan</td>
          <td class="text-left p-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">:</td>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">
            <?php echo number_format($priceTotal); ?>
            <input type="hidden" class="form-control" name="tagihan" value="<?php echo $priceTotal; ?>">
          </td>
        </tr>
        <tr>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">Kode Voucher</td>
          <td class="text-left p-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">:</td>
          <td class="text-left pt-2 pb-2" style="border: 0!important; vertical-align: middle; white-space: normal; word-break: normal; color: #fff;">
            <?php if($vouchers == ''){ echo 'Tidak Ada Voucher Digunakan'; } else { echo $voucher; } ?>
            <input type="hidden" class="form-control" name="voucher" value="<?php if($vouchers == ''){ echo ''; } else { echo $voucher; } ?>">
            <input type="hidden" class="form-control" name="apaandah" value="<?php if($vouchers == ''){ echo '0'; } else { echo $potongan; } ?>">
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
<?php } ?>