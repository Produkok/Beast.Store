<?php
ob_start();
session_start();
include('config/koneksi.php');
$sql_0 = mysqli_query($conn,"SELECT * FROM `tb_seo` WHERE cuid = 1") or die(mysqli_error());
$s0 = mysqli_fetch_array($sql_0);
$urlweb = $s0['urlweb'];
$sql_4 = mysqli_query($conn,"SELECT * FROM `tb_tripayapi` WHERE cuid = 1") or die(mysqli_error());
$s4 = mysqli_fetch_array($sql_4);

//error_reporting(0);
if($_GET['id']){
  $voucher = mysqli_real_escape_string($conn,$_GET['id']);
  $jenisnya = $_GET['jenisnya'];
  $produkID = $_GET['produkID'];
  
  if($jenisnya == 1){
      $kabupaten = mysqli_query($conn,"SELECT * FROM `tb_produk` WHERE cuid = '".$produkID."'") or die(mysqli_error());
      $kk = mysqli_fetch_array($kabupaten);
      $kategorinya = $kk['kategori'];
  }
  else if($jenisnya == 2){
      $kabupaten = mysqli_query($conn,"SELECT * FROM `tb_produk` WHERE cuid = '".$produkID."'") or die(mysqli_error());
      $kk = mysqli_fetch_array($kabupaten);
      $kategorinya = $kk['kategori'];
  }
  else if($jenisnya == 3){
      $kabupaten = mysqli_query($conn,"SELECT * FROM `tb_prepaid` WHERE cuid = '".$produkID."'") or die(mysqli_error());
      $kk = mysqli_fetch_array($kabupaten);
      $kategorinya = $kk['brand'];
  }
  else if($jenisnya == 4){
      $kabupaten = mysqli_query($conn,"SELECT * FROM `tb_prepaid` WHERE cuid = '".$produkID."'") or die(mysqli_error());
      $kk = mysqli_fetch_array($kabupaten);
      $kategorinya = $kk['brand'];
  }
  
  
  if(isset($_SESSION['user'])){
    $usernya = $_SESSION['user'];
    $cekUser = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE user = '$usernya'");
    $cu = mysqli_fetch_array($cekUser);
    if($cu['level'] == 'reseller'){
       $harga = $kk['harga_reseller'];
    }
    else {
       $harga = $kk['harga_jual'];
    }
  }  
  else {
    $harga = $kk['harga_jual'];
  }
  
  if($voucher == ''){
      echo '
        <div class="modal-body pt-5 pb-5 text-center">
          <i class="fa fa-exclamation-triangle fa-5x mb-3" style="font-size: 100px;"></i><br>
          <p style="font-size: 18px;">Masukan Kode Voucher Terlebih Dahulu!</p>
          <button type="button" class="btn btn-primary btn-lg mt-3" style="line-height: 18px;" data-dismiss="modal">OK</button>
        </div>
      ';
  }
  else {
    $getVoucher = mysqli_query($conn,"SELECT * FROM `tb_reward` WHERE title = '$voucher'") or die(mysqli_error());
    $gvv = mysqli_num_rows($getVoucher);
    if($gvv == 0){
      echo '
        <div class="modal-body pt-5 pb-5 text-center">
          <i class="fa fa-exclamation-triangle fa-5x mb-3" style="font-size: 100px;"></i><br>
          <p style="font-size: 18px;">Voucher yang Anda Masukan Tidak Tersedia atau Sudah Kadaluarsa!</p>
          <button type="button" class="btn btn-primary btn-lg mt-3" style="line-height: 18px;" data-dismiss="modal">OK</button>
        </div>
      ';
    }
    else {
        $gv = mysqli_fetch_array($getVoucher);
        $kuota = $gv['kuota'];
        $jenisVoucher = $gv['jenis'];
        $minOrder = $gv['min_order'];
        
        if($kuota > 0){
            if($harga < $minOrder){
                echo '
                    <div class="modal-body pt-5 pb-5 text-center">
                      <i class="fa fa-exclamation-triangle fa-5x mb-3" style="font-size: 100px;"></i><br>
                      <p style="font-size: 18px;">Voucher Tidak dapat digunakan!<br>Minimal Transaksi Rp. '.number_format($minOrder).'!</p>
                      <button type="button" class="btn btn-primary btn-lg mt-3" style="line-height: 18px;" data-dismiss="modal">OK</button>
                    </div>
                ';
            }
            else {
                if($jenisnya == $jenisVoucher){
                    $getVoucherProduct = mysqli_query($conn,"SELECT * FROM `tb_reward_produk` WHERE `title` = '$voucher' AND `kategori` = '$kategorinya'") or die(mysqli_error());
                    $gvvp = mysqli_num_rows($getVoucherProduct);
                    if($gvvp == 0){
                        echo '
                            <div class="modal-body pt-5 pb-5 text-center">
                              <i class="fa fa-exclamation-triangle fa-5x mb-3" style="font-size: 100px;"></i><br>
                              <p style="font-size: 18px;">Voucher Tidak Tersedia untuk Produk Ini!</p>
                              <button type="button" class="btn btn-primary btn-lg mt-3" style="line-height: 18px;" data-dismiss="modal">OK</button>
                            </div>
                        ';     
                    }
                    else {
                        echo '
                            <div class="modal-body pt-5 pb-5 text-center">
                              <i class="fa fa-check fa-5x mb-3" style="font-size: 100px;"></i><br>
                              <p style="font-size: 18px;">Voucher Berhasil Digunakan!</p>
                              <button type="button" class="btn btn-primary btn-lg mt-3" style="line-height: 18px;" data-dismiss="modal">OK</button>
                            </div>
                        ';
                    }
                }
                else {
                    echo '
                        <div class="modal-body pt-5 pb-5 text-center">
                          <i class="fa fa-exclamation-triangle fa-5x mb-3" style="font-size: 100px;"></i><br>
                          <p style="font-size: 18px;">Voucher Tidak Tersedia untuk Produk Ini!</p>
                          <button type="button" class="btn btn-primary btn-lg mt-3" style="line-height: 18px;" data-dismiss="modal">OK</button>
                        </div>
                    '; 
                }
            }
        }
        else {
            echo '
                <div class="modal-body pt-5 pb-5 text-center">
                  <i class="fa fa-exclamation-triangle fa-5x mb-3" style="font-size: 100px;"></i><br>
                  <p style="font-size: 18px;">Voucher yang Anda Masukan Tidak Tersedia atau Sudah Kadaluarsa!</p>
                  <button type="button" class="btn btn-primary btn-lg mt-3" style="line-height: 18px;" data-dismiss="modal">OK</button>
                </div>
            ';
        }
    }
  }
}
else {
    echo '
        <div class="modal-body pt-5 pb-5 text-center">
          <i class="fa fa-exclamation-triangle fa-5x mb-3" style="font-size: 100px;"></i><br>
          <p style="font-size: 18px;">Masukan Kode Voucher Terlebih Dahulu!</p>
          <button type="button" class="btn btn-primary btn-lg mt-3" style="line-height: 18px;" data-dismiss="modal">OK</button>
        </div>
    ';
}
?>