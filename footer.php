            
    <footer id="aboutus" style="background-color: var(--secondary-color)!important;">
      <div class="pt-5 pb-5" bis_skin_checked="1">
        <div class="container" bis_skin_checked="1">
          <div class="row" bis_skin_checked="1">
            <div class="col-lg-6 col-sm-6" bis_skin_checked="1">
              <img src="<?php echo $urlweb; ?>/upload/<?php echo $s0['image']; ?>" style="width: auto; height: 50px; margin-bottom: 15px;" alt="logo icon">
              <p><?php echo $s0['foot_text']; ?></p>
              <p><i class="fab fa-whatsapp pr-3"></i>: <?php echo $s1b['no_hp']; ?></p>
              <p><i class="fas fa-headphones pr-3"></i>: 24 Jam (hindari trx di jam 00:00 s/d 00:30)</p>
              <hr>
            </div>
            <div class="col-lg-6 col-sm-6" bis_skin_checked="1">
                <div class="row">
                  <div class="col-lg-4 col-md-6 col-sm-6 col-6" bis_skin_checked="1">
                    <h5 class="pb-2">Peta Situs</h5>
                    <ul class="nav flex-column mb-3">  
                      <li class="nav-item">
                        <a class="nav-link" href="<?php echo $urlweb; ?>" style="color: var(--font-color); font-size: 12px;">Beranda</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="<?php echo $urlweb; ?>/cektrx/" style="color: var(--font-color); font-size: 12px;">Cek Pesanan</a>
                      </li>
                      <?php if(isset($_SESSION['user'])){ ?>
                      <li class="nav-item">
                        <a class="nav-link" href="<?php echo $urlweb; ?>/dashboard/" style="color: var(--font-color); font-size: 12px;">Akun Saya</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="<?php echo $urlweb; ?>/logout/" style="color: var(--font-color); font-size: 12px;">Logout</a>
                      </li>
                      <?php } else { ?>
                      <li class="nav-item">
                        <a class="nav-link" href="<?php echo $urlweb; ?>/login/" style="color: var(--font-color); font-size: 12px;">Masuk</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="<?php echo $urlweb; ?>/register/" style="color: var(--font-color); font-size: 12px;">Daftar</a>
                      </li>
                      <?php } ?>
                      <li class="nav-item">
                        <a class="nav-link" href="<?php echo $urlweb; ?>/contact/" style="color: var(--font-color); font-size: 12px;">Hubungi Kami</a>
                      </li>
                    </ul>
                  </div>
                  <div class="col-lg-4 col-md-6 col-sm-6 col-6" bis_skin_checked="1">
                    <h5 class="pb-2">Top Up lainnya</h5>
                    <ul class="nav flex-column mb-4">
                      <?php
                        $sql_3 = mysqli_query($conn,"SELECT * FROM `tb_kategori` WHERE parent = 1 AND status = 1 ORDER BY rand() LIMIT 5") or die(mysqli_error($conn));
                        while($s3 = mysqli_fetch_array($sql_3)){
                          $kategori = $s3['kategori'];
                          $kategoriID = $s3['cuid'];
                          $parentType = $s3['parent'];
                          $sql_jenis = mysqli_query($conn,"SELECT * FROM `tb_jenis` WHERE cuid = '$parentType'") or die(mysqli_error($conn));
                          $sj = mysqli_fetch_array($sql_jenis);
                          $hitung = strlen($kategori);
                          if($hitung > 18){
                            $tulisKategori = substr($kategori,0,18).'...';
                          }
                          else {
                            $tulisKategori = $kategori;
                          }
                      ?>
                      <li class="nav-item">
                        <a class="nav-link" href="<?php echo $urlweb; ?>/<?php echo str_replace(' ','-',strtolower($sj['jenis'])); ?>/<?php echo $s3['slug']; ?>/" style="color: var(--font-color); font-size: 12px;"><?php echo $tulisKategori; ?></a>
                      </li>
                      <?php } ?>
                    </ul>
                  </div>
                  <div class="col-lg-4 col-md-6 col-sm-12 col-12" bis_skin_checked="1">
                    <h5 class="pb-2">Ikuti Kami</h5>
                    <?php
                        $sql_social = mysqli_query($conn,"SELECT * FROM `tb_social` WHERE status = 1 ORDER BY cuid ASC") or die(mysqli_error());
                        while($sc = mysqli_fetch_array($sql_social)){
                    ?>
                    <a href="<?php echo $sc['alamat']; ?>" target="_blank"><div style="float: left; background: <?php echo $sc['bg_color']; ?>!important; width: 30px; height: 30px; font-size: 18px; line-height: 30px; color: #fff!important; margin-right:3px; margin-bottom: 5px;" class="text-center"><i class="<?php echo $sc['icon_image']; ?>"></i></div></a>
                    <?php } ?>
                  </div>
                </div>
            </div>
          </div>

          <div class="text-center pt-2 pb-2" bis_skin_checked="1">
            © Copyright <?php echo date('Y'); ?>. All Rights Reserved
          </div>
        </div>
      </div>
    </footer>
    <!--End footer-->
    <?php
        $getWa = mysqli_query($conn,"SELECT * FROM `tb_livechat` WHERE cuid = 1") or die(mysqli_error());
        $gw = mysqli_fetch_array($getWa);
        if($gw['status'] == 1){
            $contente = str_replace(' ','%20',$gw['content']);
    ?>
    <div style="position:fixed; bottom: 20px; right: 20px; width: 55px; z-index: 9999;">
        <a href="https://api.whatsapp.com/send?phone=<?php echo $gw['no_wa']; ?>&text=<?php echo $contente; ?>" target="_blank"><div style="float: left; width: 55px; height: 55px; font-size: 28px; line-height: 55px; color: #fff!important; border-radius:50%;" class="bg-success text-center"><i class="fab fa-whatsapp"></i></div></a>
    </div>
    <?php } ?>
  </div><!--End wrapper-->
  <?php
    $getOrder1 = mysqli_query($conn,"SELECT * FROM `tb_order` WHERE status = 2") or die(mysqli_error());
    $go1 = mysqli_num_rows($getOrder1);
    if($go1 > 0){
  ?>
  <div id="getNotif" class="d-none d-sm-block" style="position: fixed; bottom: 2%; left: 10px; z-index: 1; width: 300px;">
    <div class="alert alert-dismissible" style="background-color: var(--bg-cardcolor); color: #fff;" role="alert">
      <div class="alert-icon"><i class="fa fa-bullhorn"></i></div><div class="alert-message" id="notif-message"></div>
    </div>
  </div>
  <?php } ?>
  <!-- Bootstrap core JavaScript-->
  <script src="<?php echo $urlweb; ?>/assets/js/jquery.min.js"></script>
  <script src="<?php echo $urlweb; ?>/assets/js/popper.min.js"></script>
  <script src="<?php echo $urlweb; ?>/assets/js/bootstrap.min.js"></script>
  
  <!-- simplebar js -->
  <script src="<?php echo $urlweb; ?>/assets/plugins/simplebar/js/simplebar.js"></script>
  <!-- horizontal-menu js -->
  <script src="<?php echo $urlweb; ?>/assets/js/horizontal-menu.js"></script>
  
  <!-- Custom scripts -->
  <script src="<?php echo $urlweb; ?>/assets/plugins/summernote/dist/summernote-bs4.min.js"></script>
  <!--Select Plugins Js-->
  <script src="<?php echo $urlweb; ?>/assets/plugins/select2/js/select2.min.js"></script>
  <!--Data Tables js-->
  <script src="<?php echo $urlweb; ?>/assets/plugins/bootstrap-datatable/js/jquery.dataTables.min.js"></script>
  <script src="<?php echo $urlweb; ?>/assets/plugins/bootstrap-datatable/js/dataTables.bootstrap4.min.js"></script>
  <script src="<?php echo $urlweb; ?>/assets/plugins/bootstrap-datatable/js/dataTables.buttons.min.js"></script>
  <script src="<?php echo $urlweb; ?>/assets/plugins/bootstrap-datatable/js/buttons.bootstrap4.min.js"></script>
  <script src="<?php echo $urlweb; ?>/assets/plugins/bootstrap-datatable/js/jszip.min.js"></script>
  <script src="<?php echo $urlweb; ?>/assets/plugins/bootstrap-datatable/js/pdfmake.min.js"></script>
  <script src="<?php echo $urlweb; ?>/assets/plugins/bootstrap-datatable/js/vfs_fonts.js"></script>
  <script src="<?php echo $urlweb; ?>/assets/plugins/bootstrap-datatable/js/buttons.html5.min.js"></script>
  <script src="<?php echo $urlweb; ?>/assets/plugins/bootstrap-datatable/js/buttons.print.min.js"></script>
  <script src="<?php echo $urlweb; ?>/assets/plugins/bootstrap-datatable/js/buttons.colVis.min.js"></script>
  <script>
    $(document).ready(function() {
      //Default data table
      $('.default-datatable').DataTable();
      $('.single-select').select2();
      function showNotif(message) {
        $('#notif-message').text(message);
        $('#getNotif').fadeIn(500).delay(10000).fadeOut(500);
      }
      $.ajax({
        url: '<?php echo $urlweb; ?>/getNotif.php',dataType: 'json',success: function(data) {
          if (data.message) {
            showNotif(data.message);
          }
        },
        error: function(
          jqXHR, textStatus, errorThrown) {
            console.log(textStatus, errorThrown);
          }
      });
      setInterval(function() {
        $.ajax({
          url: '<?php echo $urlweb; ?>/getNotif.php',dataType: 'json',success: function(data) {
            if (data.message) {showNotif(data.message);}},error: function(jqXHR, textStatus, errorThrown) {
              console.log(textStatus, errorThrown);
            }
          });
        }, 12000);
    });
    function openNav() {
      document.getElementById("mySidenav").style.width = "300px";
    }

    function closeNav() {
      document.getElementById("mySidenav").style.width = "0";
    }
    function myFunctiona() {
      var x = document.getElementById("showcallcenter");
      if (x.style.display === "none") {
        x.style.display = "block";
      } else {
        x.style.display = "none";
      }
    }
  </script>