<?php
ob_start();
session_start();
include('config/koneksi.php');
$sql_0 = mysqli_query($conn,"SELECT * FROM `tb_seo` WHERE cuid = 1") or die(mysqli_error());
$s0 = mysqli_fetch_array($sql_0);
$urlweb = $s0['urlweb'];

error_reporting(0);
if($_GET['id']){
    $produkID = $_GET['id'];
    $kabupaten = mysqli_query($conn,"SELECT * FROM `tb_prepaid` WHERE cuid = '$produkID' ORDER BY cuid ASC");
    $kabupaten_row = mysqli_fetch_array($kabupaten);
    $brand = $kabupaten_row['kategori'];
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
                    <div class="row ml-2 mr-2 mb-2 pb-0">
                      <div class="col-6 p-1">
                        <div style="background: #fff; width: 100px; height: 40px; overflow: hidden; border-radius: 5px;">
                          <img src="<?php echo $cp['image']; ?>" style="display: block; width: 100%; height: 100%;">
                        </div>
                      </div>
                      <div class="col-6 p-1"></div>
                    </div>
                    <div class="row ml-2 mr-2 pt-0">
                      <div class="col-12 p-1">
                        <p style="font-weight: 700; font-size: 10px;">Rp. <?php echo number_format($harga); ?></p>
                        <hr style="width: 100%; border: 1px solid #eee; margin-top: 0px; margin-bottom: 5px;">
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
        <?php
          if(isset($_SESSION['user'])){
            $usernya = $_SESSION['user'];
            $cekUser = mysqli_query($conn,"SELECT * FROM `tb_user` WHERE user = '$usernya'");
            $cu = mysqli_fetch_array($cekUser); 
            $userIDnya = $cu['cuid'];
            $cekBalance = mysqli_query($conn,"SELECT * FROM `tb_balance` WHERE userID = '$userIDnya'") or die(mysqli_error());
            $cb = mysqli_fetch_array($cekBalance);
            if($cb['active'] > $harga){
        ?>
        <div class="card box_game mb-2">
          <div class="card-header pt-1 pb-0 pl-1 pr-1" id="headingOne">
            <div class="row">
              <div class="col-12">
                <h2 class="mb-0">
                <button class="btn btn-link btn-block pl-1 text-left" type="button" data-toggle="collapse" data-target="#collapseOne999" aria-expanded="true" aria-controls="collapseOne999">
                  <i class="zmdi zmdi-balance-wallet" style="font-size: 18px;"></i>&nbsp; Saldo Website
                </button>
                </h2>
              </div>
            </div>
          </div>
          <div id="collapseOne999" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
            <div class="card-body">
              <div class="row">
                <div class="col-sm-4 col-6 p-1">
                  <input class="radio-nominal" type="radio" name="metode" value="999" id="flexRadioDefault<?php echo $no.$i; ?>">
                  <label for="flexRadioDefault<?php echo $no.$i; ?>">
                    <div class="row ml-2 mr-2 mb-2 pb-0">
                      <div class="col-6 p-1">
                        <div style="background: #fff; width: 100px; height: 40px; overflow: hidden; border-radius: 5px;">
                          <img src="<?php $s0['image']; ?>/upload/<?php echo $s0['image']; ?>" style="display: block; width: 100%; height: 100%;">
                        </div>
                      </div>
                      <div class="col-6 p-1"></div>
                    </div>
                    <div class="row ml-2 mr-2 pt-0">
                      <div class="col-12 p-1">
                        <p style="font-weight: 700; font-size: 10px;">Rp. <?php echo number_format($harga); ?></p>
                        <hr style="width: 100%; border: 1px solid #eee; margin-top: 0px; margin-bottom: 5px;">
                        <p style="font-weight: 700; font-size: 10px;">Saldo Website</p>
                      </div>
                    </div>
                  </label>
                </div>
              </div>
            </div>
          </div>
          <div class="card-footer" style="background: none;" data-toggle="collapse" data-target="#collapseOne<?php echo $i; ?>" aria-expanded="true" aria-controls="collapseOne<?php echo $i; ?>">
            <div class="float: right;">
              <img src="<?php $s0['image']; ?>/upload/<?php echo $s0['image']; ?>" class="mr-1" style="float: right; display: block; width: auto; height: 15px; margin-left: 5px; background: #fff;">
            </div>
          </div>
        </div>
        <?php }} ?>
        <div class="alert alert-success alert-dismissible m-2" role="alert">
          <div class="alert-message text-center">
            <a class="text-dark"><strong>Perhatian!!</strong> Apabila Nominal yang Anda pilih kurang dari 10.000 silahkan menggunakan metode pembayaran QRIS atau Saldo Website.</a>
          </div>
        </div>
<?php
}
?>