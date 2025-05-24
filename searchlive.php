<?php
include('config/koneksi.php');
    
    $keyworde = $_GET['keyword'];
    $keyword = str_replace('_',' ',$keyworde);
    $output = "";
    
    $sql_0 = mysqli_query($conn,"SELECT * FROM `tb_seo` WHERE cuid = 1") or die(mysqli_error());
    $s0 = mysqli_fetch_array($sql_0);
    $urlweb = $s0['urlweb'];
    
    $sql_query = "SELECT * FROM `tb_kategori` WHERE kategori LIKE '%$keyword%' AND status = 1";
    $result = mysqli_query($conn, $sql_query);
    
    
    if($keyword != ''){
        if(mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_array($result)) {
                $kategori = $row['kategori'];
                $kategoriID = $row['cuid'];
                $parentType = $row['parent'];
                $sql_jenis = mysqli_query($conn,"SELECT * FROM `tb_jenis` WHERE cuid = '$parentType'") or die(mysqli_error($conn));
                $sj = mysqli_fetch_array($sql_jenis);
                $jenisnya = $sj['jenis'];
                if($jenisnya == 'Game'){
                  $hitung = mysqli_query($conn,"SELECT * FROM `tb_produk` WHERE kategori = '$kategori'") or die(mysqli_error());
                }
                else if($jenisnya == 'Pulsa'){
                  $hitung = mysqli_query($conn,"SELECT * FROM `tb_prepaid` WHERE brand = '$kategori'") or die(mysqli_error());
                }
                else if($jenisnya == 'Emoney'){
                  $hitung = mysqli_query($conn,"SELECT * FROM `tb_prepaid` WHERE brand = '$kategori'") or die(mysqli_error());
                }
                else if($jenisnya == 'Voucher'){
                  $hitung = mysqli_query($conn,"SELECT * FROM `tb_produk` WHERE brand = '$kategori'") or die(mysqli_error());
                }
                else if($jenisnya == 'Premium'){
                  $hitung = mysqli_query($conn,"SELECT * FROM `tb_produk` WHERE kategori = '$kategori'") or die(mysqli_error());
                }
                else if($jenisnya == 'Pascabayar'){
                  $hitung = mysqli_query($conn,"SELECT * FROM `tb_pascabayar` WHERE kategori = '$kategori'") or die(mysqli_error());
                }
                $h = mysqli_num_rows($hitung);
                if($h > 0){
			  
                //$output .= '<option value="' . $row['toko'] . '">';
                $output .='
                        <li class="list-group-item link-class" style="background: #000;">
                            <div class="media">
							  <img src="'.$urlweb.'/upload/'.$row['image'].'" class="align-self-center mr-3" width="40" height="40" alt="...">
							  <div class="media-body">
								<h5 class="mt-3" style="font-size: 14px; line-height: 12px; color: #fff;"><a href=" '.$urlweb.'/'.str_replace(' ','-',strtolower($sj['jenis'])).'/'.$row['slug'].'/" style="color: #fff;><span class="keyword">'.$row['kategori'].'</span></a></h5>
							  </div>
							</div>
                        </li>';
                }
            }
        } else {
          $output .= '
                    <li class="list-group-item link-class" style="background: #000; text-align: center;">
                        <div class="media">
                            <div class="media-body">
                               <h5 class="mt-3" style="font-size: 14px; line-height: 12px; color: #fff;">Produk Tidak Ditemukan</h5>
                            </div>
                        </div>
                    </li>';
        }
    } else{
        $output .='';
    }
    echo $output;
?>