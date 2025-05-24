      
        <header>
          <nav class="fixed-top shadow-sm pt-2 pb-2" style="background-color: <?php echo $buttonColor; ?>!important; z-index: 99999;">
            <div class="container">
              <a class="btn float-left" href="javascript:void();" onclick="openNav();" style="float: left; box-shadow: none!important">
                <i class="fa fa-bars" style="font-size: 24px; color: rgb(255,255,255,0.5)!important;"></i>
              </a>
              <a href="<?php echo $urlweb; ?>" style="float: left;">
                <img src="<?php echo $urlweb; ?>/upload/<?php echo $s0['image']; ?>" style="width: auto; height: 35px; margin-top: 5px; margin-right: 10px; color: #fff!important;" alt="logo icon">
              </a>
              <div class="dropdown" style="float:right; margin-top: 3px;">
                <a class="btn" data-toggle="dropdown" aria-expanded="false" style="font-size: 12px; box-shadow: none!important;">
                  <?php if(isset($_SESSION['user'])){ ?>
                  <span class="d-none d-sm-block"><i class="fa fa-user"></i> Hi, <?php echo $_SESSION['user']; ?></span>
                  <span class="d-block d-sm-none"><i class="fa fa-user"></i></span>
                  <?php } else { ?>
                  <span class="d-none d-sm-block" style="font-weight:bold;"><i class="fa fa-sign-in"></i> Masuk/Daftar</span>
                  <span class="d-block d-sm-none" style="font-size: 10px; font-weight:bold;"><i class="fa fa-user"></i> Masuk/Daftar</span>
                  <?php } ?>
                </a>
                <?php if(isset($_SESSION['user'])){ ?>
                <div class="dropdown-menu dropdown-menu-right pt-5 pl-1 pr-1 mt-2" style="border-radius: 0; width: 300px;">
                  <img src="<?php echo $urlweb; ?>/upload/<?php echo $s0['image']; ?>" class="mb-2" style="width: auto; height: 35px; display: block; margin: 0 auto;" alt="logo icon">
                  <p class="text-center" style="color: var(--font-color)!important;">Selamat Datang <?php echo $_SESSION['user']; ?>!</p>
                  <a class="dropdown-item" href="<?php echo $urlweb; ?>/dashboard/"><i class="fa fa-user" style="width: 20px;color: #fff;"></i> Akun Saya</a>
                  <a class="dropdown-item" href="<?php echo $urlweb; ?>/wallet/"><i class="fa fa-wallet" style="width: 20px;color: #fff;"></i> Saldo Akun</a>
                  <a class="dropdown-item" href="<?php echo $urlweb; ?>/poin/"><i class="fa fa-gift" style="width: 20px;color: #fff;"></i> Poin Saya</a>
                  <a class="dropdown-item" href="<?php echo $urlweb; ?>/refferal/"><i class="fa fa-users" style="width: 20px;color: #fff;"></i> Affiliate</a>
                  <a class="dropdown-item" href="<?php echo $urlweb; ?>/history/"><i class="fa fa-calendar" style="width: 20px;color: #fff;"></i> Riwayat Transaksi</a>
                  <a class="dropdown-item" href="<?php echo $urlweb; ?>/docs/"><i class="fa fa-cog" style="width: 20px;color: #fff;"></i> Pengaturan API</a>
                  <a class="dropdown-item" href="<?php echo $urlweb; ?>/logout/"><i class="fa fa-power-off" style="width: 20px;color: #fff;"></i> Logout</a>
                </div>
                <?php } else { ?>
                <div class="dropdown-menu dropdown-menu-right text-center pt-5 pl-1 pr-1 mt-2" style="border-radius: 0; width: 300px;">
                  <img src="<?php echo $urlweb; ?>/upload/<?php echo $s0['image']; ?>" class="mb-2" style="width: auto; height: 35px; display: block; margin: 0 auto;" alt="logo icon">
                  <p style="color: var(--font-color)!important;">Selamat Datang Guest!</p>
                  <a href="<?php echo $urlweb; ?>/login/" class="btn btn-primary mr-0" style="margin: 0!important; border-radius: 0; border-top-right-radius: 0px!important;  border-bottom-right-radius: 0px!important;">Masuk</a>
                  <a href="<?php echo $urlweb; ?>/register/" class="btn btn-primary ml-0" style="margin: 0!important; border-radius: 0; border-top-left-radius: 0px!important;  border-bottom-left-radius: 0px!important;">Daftar</a>
                </div>
                <?php } ?>
              </div>
            </div>
          </nav>
        </header>

        <div id="mySidenav" class="sidenav" style="padding-top: 5px!important;">
          <div class="p-2">
            <div class="row">
              <div class="col-9 pt-2">
                <a href="<?php echo $urlweb; ?>" style="float: left;">
                  <img src="<?php echo $urlweb; ?>/upload/<?php echo $s0['image']; ?>" style="width: auto; height: 35px; color: #fff!important;" alt="logo icon">
                </a>
              </div>
              <div class="col-3 text-center pt-3">
                <a href="javascript:void(0)" class="closebtn" style="margin-top: -10px; color:rgb(255,255,255,0.5);" onclick="closeNav()"><i class="fa fa-close"></i></a>
              </div>
            </div>
          </div>

          
          <div class="side_navigation pt-3">
            <ul class="nav flex-column">
              <li class="nav-item">
                <a href="<?php echo $urlweb; ?>" class="nav-link">
                  <i class="fa fa-arrow-right" style="width: 20px;"></i> Beranda
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="<?php echo $urlweb; ?>/cektrx/"><i class="fa fa-arrow-right" style="width: 20px; font-size: 14px;"></i> Cek Pesanan</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="<?php echo $urlweb; ?>/pricelist/"><i class="fa fa-arrow-right" style="width: 20px; font-size: 14px;"></i> Daftar Harga</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="<?php echo $urlweb; ?>/calc/"><i class="fa fa-arrow-right" style="width: 20px; font-size: 14px;"></i> Kalkulator ML</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="<?php echo $urlweb; ?>/testimonial/"><i class="fa fa-arrow-right" style="width: 20px; font-size: 14px;"></i> Testimonial</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="<?php echo $urlweb; ?>/blog/"><i class="fa fa-arrow-right" style="width: 20px; font-size: 14px;"></i> Blog</a>
              </li>
              <?php
                $sql_page = mysqli_query($conn,"SELECT * FROM `tb_page` WHERE status = 1 ORDER BY cuid ASC") or die(mysqli_error());
                while($sp = mysqli_fetch_array($sql_page)){
              ?>
              <li class="nav-item">
                <a class="nav-link" href="<?php echo $urlweb; ?>/page/?p=<?php echo $sp['slug']; ?>"><i class="fa fa-arrow-right" style="width: 20px; font-size: 14px;"></i> <?php echo $sp['nama_page']; ?></a>
              </li>
              <?php } ?>
              <li class="nav-item">
                <a class="nav-link" href="<?php echo $urlweb; ?>/contact/"><i class="fa fa-arrow-right" style="width: 20px; font-size: 14px;"></i> Hubungi Kami</a>
              </li>
            </ul>
          </div>
        </div>
