-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 24, 2025 at 04:03 PM
-- Server version: 10.5.22-MariaDB-cll-lve
-- PHP Version: 8.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_topup`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `cuid` int(11) NOT NULL,
  `com_ref` int(11) NOT NULL,
  `poin` int(11) NOT NULL,
  `upgrade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`cuid`, `com_ref`, `poin`, `upgrade`) VALUES
(1, 0, 10, 25);

-- --------------------------------------------------------

--
-- Table structure for table `tb_affiliate`
--

CREATE TABLE `tb_affiliate` (
  `cuid` int(11) NOT NULL,
  `ip` text NOT NULL,
  `date` date NOT NULL,
  `user` text NOT NULL,
  `trxID` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_backup`
--

CREATE TABLE `tb_backup` (
  `cuid` int(11) NOT NULL,
  `file_name` text NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_balance`
--

CREATE TABLE `tb_balance` (
  `cuid` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `pending` int(11) NOT NULL,
  `payout` int(11) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_balance`
--

INSERT INTO `tb_balance` (`cuid`, `userID`, `active`, `pending`, `payout`, `created_date`) VALUES
(1, 1, 68003, 0, 0, '2022-12-14 23:59:55'),
(20, 49, 0, 0, 0, '2023-11-03 13:52:33'),
(22, 51, 10000, 0, 0, '2023-12-30 01:58:57');

-- --------------------------------------------------------

--
-- Table structure for table `tb_bank`
--

CREATE TABLE `tb_bank` (
  `cuid` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` text NOT NULL,
  `akun` text NOT NULL,
  `pemilik` text NOT NULL,
  `no_rek` text NOT NULL,
  `feeAdmin` text NOT NULL,
  `feePersen` text NOT NULL,
  `jenis` int(2) NOT NULL,
  `provider` int(2) NOT NULL,
  `status` int(2) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_bank`
--

INSERT INTO `tb_bank` (`cuid`, `image`, `code`, `akun`, `pemilik`, `no_rek`, `feeAdmin`, `feePersen`, `jenis`, `provider`, `status`, `userID`) VALUES
(17, 'https://assets.tripay.co.id/upload/payment-icon/aQTdaUC2GO1593660384.png', 'ALFAMIDI', 'Alfamidi', '', '', '3500', '0', 3, 1, 0, 1),
(16, 'https://assets.tripay.co.id/upload/payment-icon/zNzuO5AuLw1583513974.png', 'INDOMARET', 'Indomaret', '', '', '3500', '0', 3, 1, 0, 1),
(15, 'https://assets.tripay.co.id/upload/payment-icon/jiGZMKp2RD1583433506.png', 'ALFAMART', 'Alfamart', '', '', '3500', '0', 3, 1, 0, 1),
(14, 'https://assets.tripay.co.id/upload/payment-icon/3IXRIbogu11664370160.png', 'BNCVA', 'BNC Virtual Account', '', '', '4250', '0', 1, 1, 0, 1),
(13, 'https://assets.tripay.co.id/upload/payment-icon/F3pGzDOLUz1644245546.png', 'DANAMONVA', 'Danamon Virtual Account', '', '', '4250', '0', 1, 1, 0, 1),
(12, 'https://assets.tripay.co.id/upload/payment-icon/ysiSToLvKl1644244798.png', 'OCBCVA', 'OCBC NISP Virtual Account', '', '', '4250', '0', 1, 1, 0, 1),
(11, 'https://assets.tripay.co.id/upload/payment-icon/tEclz5Assb1643375216.png', 'BSIVA', 'BSI Virtual Account', '', '', '4250', '0', 1, 1, 0, 1),
(10, 'https://assets.tripay.co.id/upload/payment-icon/WtEJwfuphn1614003973.png', 'CIMBVA', 'CIMB Niaga Virtual Account', '', '', '4250', '0', 1, 1, 0, 1),
(9, 'https://assets.tripay.co.id/upload/payment-icon/GGwwcgdYaG1611929720.png', 'MUAMALATVA', 'Muamalat Virtual Account', '', '', '4250', '0', 1, 1, 0, 1),
(8, 'https://assets.tripay.co.id/upload/payment-icon/KHcqcmqVFQ1607091889.png', 'SMSVA', 'Sinarmas Virtual Account', '', '', '4250', '0', 1, 1, 0, 1),
(7, 'https://assets.tripay.co.id/upload/payment-icon/ytBKvaleGy1605201833.png', 'BCAVA', 'BCA Virtual Account', '', '', '5500', '0', 1, 1, 0, 1),
(6, 'https://assets.tripay.co.id/upload/payment-icon/T9Z012UE331583531536.png', 'MANDIRIVA', 'Mandiri Virtual Account', '', '', '4250', '0', 1, 1, 0, 1),
(5, 'https://assets.tripay.co.id/upload/payment-icon/8WQ3APST5s1579461828.png', 'BRIVA', 'BRI Virtual Account', '', '', '4250', '0', 1, 1, 0, 1),
(4, 'https://assets.tripay.co.id/upload/payment-icon/n22Qsh8jMa1583433577.png', 'BNIVA', 'BNI Virtual Account', '', '', '4250', '0', 1, 1, 0, 1),
(3, 'https://assets.tripay.co.id/upload/payment-icon/szezRhAALB1583408731.png', 'PERMATAVA', 'Permata Virtual Account', '', '', '4250', '0', 1, 1, 0, 1),
(2, 'https://topupgame.my.id/upload/BCAVA.png', 'BCAVA', 'Bank Central Asia (BCA)', 'Testing Aja', '123456789', '0', '0', 0, 0, 1, 1),
(18, 'https://assets.tripay.co.id/upload/payment-icon/fH6Y7wDT171586199243.png', 'OVO', 'OVO', '', '', '0', '0.03', 2, 1, 0, 1),
(19, 'https://assets.tripay.co.id/upload/payment-icon/8ewGzP6SWe1649667701.png', 'QRIS2', 'QRIS', '', '', '750', '0.007', 2, 1, 0, 1),
(20, 'https://assets.tripay.co.id/upload/payment-icon/sj3UHLu8Tu1655719621.png', 'DANA', 'DANA', '', '', '0', '0.01', 2, 1, 0, 1),
(21, 'https://assets.tripay.co.id/upload/payment-icon/d204uajhlS1655719774.png', 'SHOPEEPAY', 'ShopeePay', '', '', '0', '0.03', 2, 1, 0, 1),
(22, 'https://assets.tripay.co.id/upload/payment-icon/T9Z012UE331583531536.png', 'M2', 'Mandiri Virtual Account', '', '', '4000', '0', 1, 3, 0, 1),
(23, 'https://assets.tripay.co.id/upload/payment-icon/n22Qsh8jMa1583433577.png', 'I1', 'BNI Virtual Account', '', '', '3000', '0', 1, 3, 0, 1),
(24, 'https://assets.tripay.co.id/upload/payment-icon/8WQ3APST5s1579461828.png', 'BR', 'BRI Virtual Account', '', '', '3000', '0', 1, 3, 0, 1),
(25, 'https://assets.tripay.co.id/upload/payment-icon/WtEJwfuphn1614003973.png', 'B1', 'CIMB Niaga Virtual Account', '', '', '3000', '0', 1, 3, 0, 1),
(26, 'https://assets.tripay.co.id/upload/payment-icon/szezRhAALB1583408731.png', 'BT', 'Permata Virtual Account', '', '', '3000', '0', 1, 3, 0, 1),
(27, 'https://images.duitku.com/hotlink-ok/VA.PNG', 'VA', 'Maybank Virtual Account', '', '', '3000', '0', 1, 3, 0, 1),
(28, 'https://assets.tripay.co.id/upload/payment-icon/3IXRIbogu11664370160.png', 'NC', 'BNC Virtual Account', '', '', '3000', '0', 1, 3, 0, 1),
(29, 'https://images.duitku.com/hotlink-ok/A1.PNG', 'A1', 'ATM Bersama', '', '', '3000', '0', 1, 3, 0, 1),
(30, 'https://images.duitku.com/hotlink-ok/FT.PNG', 'FT', 'Pegadaian/ALFA/Pos', '', '', '2500', '0', 3, 3, 0, 1),
(31, 'https://images.duitku.com/hotlink-ok/IR.PNG', 'IR', 'Indomaret', '', '', '2500', '0', 3, 3, 0, 1),
(32, 'https://assets.tripay.co.id/upload/payment-icon/sj3UHLu8Tu1655719621.png', 'DA', 'DANA', '', '', '0', '0.0167', 2, 3, 0, 1),
(33, 'https://assets.tripay.co.id/upload/payment-icon/d204uajhlS1655719774.png', 'SP', 'Shopee Pay', '', '', '0', '0.04', 2, 3, 0, 1),
(34, 'https://images.duitku.com/hotlink-ok/LQ.PNG', 'LQ', 'LinkAja', '', '', '0', '0.0167', 2, 3, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_banner`
--

CREATE TABLE `tb_banner` (
  `cuid` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_banner`
--

INSERT INTO `tb_banner` (`cuid`, `image`, `content`, `status`) VALUES
(1, '', '', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `tb_banners`
--

CREATE TABLE `tb_banners` (
  `cuid` int(11) NOT NULL,
  `catID` int(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_diskon`
--

CREATE TABLE `tb_diskon` (
  `cuid` int(255) NOT NULL,
  `kategori` text NOT NULL,
  `diskon` text NOT NULL,
  `satuan` int(2) NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_diskon`
--

INSERT INTO `tb_diskon` (`cuid`, `kategori`, `diskon`, `satuan`, `status`) VALUES
(1, 'Free Fire', '5', 0, 0),
(2, 'Mobile Legends A', '7', 0, 0),
(3, 'Mobile Legends B', '5', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenis`
--

CREATE TABLE `tb_jenis` (
  `cuid` int(11) NOT NULL,
  `jenis` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort` int(2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_jenis`
--

INSERT INTO `tb_jenis` (`cuid`, `jenis`, `image`, `sort`, `status`) VALUES
(1, 'Game', 'fas fa-gamepad', 0, 1),
(2, 'Premium', 'fas fa-shopping-bag', 0, 1),
(3, 'Pulsa', 'fas fa-mobile-alt', 0, 1),
(4, 'Emoney', 'fab fa-google-wallet', 0, 1),
(6, 'Voucher', 'fas fa-gift', 0, 1),
(7, 'Pascabayar', 'fas fa-wallet', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `cuid` int(11) NOT NULL,
  `slug` text NOT NULL,
  `kategori` text NOT NULL,
  `cekID` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `parent` int(11) NOT NULL DEFAULT 0,
  `deskripsi` text NOT NULL,
  `bantuan` text NOT NULL,
  `subtitle` text NOT NULL,
  `subimage` varchar(255) NOT NULL,
  `banimage` varchar(255) NOT NULL DEFAULT 'banimage.jpg',
  `margin_basic` int(3) NOT NULL,
  `margin_reseller` int(3) NOT NULL,
  `margin_hh` int(3) NOT NULL,
  `komisi` int(3) NOT NULL,
  `populer` int(2) NOT NULL,
  `sort` int(2) NOT NULL,
  `created_date` date NOT NULL,
  `user` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_kategori`
--

INSERT INTO `tb_kategori` (`cuid`, `slug`, `kategori`, `cekID`, `image`, `parent`, `deskripsi`, `bantuan`, `subtitle`, `subimage`, `banimage`, `margin_basic`, `margin_reseller`, `margin_hh`, `komisi`, `populer`, `sort`, `created_date`, `user`, `status`) VALUES
(1, 'apexlegendsmobile', 'Apex Legends Mobile', '', 'apex_legends_mobile.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 0),
(2, 'arenaofvalor', 'Arena Of Valor', 'arena-of-valor', 'arena_of_valor.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 1, 0, '0000-00-00', 'master', 1),
(3, 'au2mobile', 'AU2 MOBILE', '', 'au2_mobile.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(4, 'betheking', 'Be The King', '', 'be_the_king.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 1, 0, '0000-00-00', 'master', 1),
(5, 'chimeraland', 'Chimeraland', '', 'chimeraland.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(6, 'callofdutymobile', 'Call of Duty MOBILE', 'call-of-duty-mobile', 'call_of_duty_mobile.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(7, 'dragonraja', 'Dragon Raja', 'dragon-raja', 'dragon_raja.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(8, 'dragonnestmseakoram', 'Dragon Nest M - Sea Koram', '', 'dragon_nest.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(9, 'freefire', 'Free Fire', 'free-fire', 'free_fire.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 1, 0, '0000-00-00', 'master', 1),
(10, 'freefiremax', 'Free Fire Max', 'free-fire-max', 'free_fire.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(11, 'freefirepromo', 'Free Fire Promo', 'free-fire', 'free_fire.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(13, 'genshinimpact', 'Genshin Impact', 'genshin-impact', 'genshin_impact.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(14, 'honkaiimpact3', 'Honkai Impact 3', '', 'honkai_impact.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(15, 'higgsdomino', 'Higgs Domino', 'higgs', 'higgs_domino.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 0),
(16, 'hyperfront', 'Hyper Front', '', 'hyper_front.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(17, 'laplacem', 'Laplace M', 'laplace-m', 'laplace_m.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(18, 'leagueoflegends', 'League of Legends', 'league-of-legends-wild-rift', 'league_of_legends.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 1, 0, '0000-00-00', 'master', 1),
(19, 'lifeafter', 'LifeAfter', '', 'lifeafter.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(20, 'lightofthel', 'Light of Thel', '', 'light_of_thel.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(21, 'lita', 'Lita', '', 'lita-icon.webp', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(22, 'lordsmobile', 'Lords Mobile', 'lords-mobile', 'lords_mobile.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 1, 0, '0000-00-00', 'master', 1),
(23, 'lostsaga', 'Lost Saga', '', 'lost_saga.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(24, 'marvelsuperwar', 'Marvel Super War', 'marvel-super-war', 'marvel_super_war.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(25, 'mobilelegend', 'Mobile Legend', 'mobile-legends', 'mobile_legend.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(26, 'mobilelegendsa', 'Mobile Legends A', 'mobile-legends', 'mobile_legends_a.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banner_ml.jpg', 4, 3, 3, 1, 1, 0, '0000-00-00', 'master', 1),
(27, 'mobilelegendsb', 'Mobile Legends B', 'mobile-legends', 'mobile_legends_b.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banner_ml.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(29, 'mobilelegendsvilog', 'Mobile Legends Vilog', 'mobile-legends', 'ml-vilog-iconn.jpg', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(30, 'mobilelegendsjokirank', 'Mobile Legends Joki Rank', 'mobile-legends', 'ml-joki-1-icon.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(31, 'mobilelegendsmembership', 'Mobile Legends Membership', 'mobile-legends', 'mobile_legends_membership.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(32, 'omegalegends', 'Omega Legends', '', 'omega_legends.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(33, 'onepunchman', 'One Punch Man', '', 'one_punch_man.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(34, 'pointblank', 'Point Blank', 'point-blank', 'point_blank.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(35, 'pokertexas', 'Poker Texas', '', 'poker_texas.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(36, 'pubgmobile', 'PUBG MOBILE', '', 'pubgm_global.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(37, 'pubgmindoa', 'PUBGM INDO A', '', 'pubgm_indo_a.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(38, 'pubgmindob', 'PUBGM INDO B', '', 'pubgm_indo_b.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(39, 'ragnarokmeternallove', 'Ragnarok M: Eternal Love', 'ragnarok-m-eternal-love-big-cat-coin', 'ragnarok_m_eternal_love.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(40, 'ragnarokxnextgeneration', 'RagnaroK X Next Generation', '', 'ragnarox-icon.jpg', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(41, 'rideoutheroes', 'Ride Out Heroes', '', 'ride_out_heroes.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(42, 'rulesofsurvivalpc', 'Rules of Survival PC', '', 'rules_of_survival_mobile.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(43, 'sausageman', 'Sausage Man', '', 'sausage_man.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(44, 'steamwalletcode', 'Steam Wallet Code', '', 'steam-icon-2.jpg', 2, '<ol style=\"margin-left: -25px;\">\r\n                          <li>Masukan UserID dan Zone / Server ID</li>\r\n                          <li>Pilih Layanan Yang Diinginkan</li>\r\n                          <li>Pilih Metode Pembayaran</li>\r\n                          <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                          <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                          <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n                      </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(45, 'supersus', 'Super Sus', '', 'super_sus.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(46, 'tomandjerrychase', 'Tom and Jerry Chase', 'tom-and-jerry-chase', 'tom_and_jerry_chase.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(47, 'toweroffantasy', 'Tower of Fantasy', '', 'tower-of-fantasy-icon.webp', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(48, 'valorant', 'Valorant', '', 'valorant.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(49, 'zepeto', 'Zepeto', 'zepeto', 'zepeto.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(50, 'youtubepremium', 'Youtube Premium', '', 'youtube_premium.png', 2, '<ol style=\"margin-left: -25px;\">\r\n                          <li>Masukan UserID dan Zone / Server ID</li>\r\n                          <li>Pilih Layanan Yang Diinginkan</li>\r\n                          <li>Pilih Metode Pembayaran</li>\r\n                          <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                          <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                          <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n                      </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(57, 'axis', 'AXIS', '', 'axis.png', 3, '<ol style=\"margin-left: -25px;\">\r\n                          <li>Masukan Nomor Handphone</li>\r\n                          <li>Pilih Jenis Layanan</li>\r\n                          <li>Pilih Layanan Yang Diinginkan</li>\r\n                          <li>Pilih Metode Pembayaran</li>\r\n                          <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                          <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                          <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>\r\n                      </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 0),
(58, 'bribrizzi', 'BRI BRIZZI', '', 'bri_brizzi.png', 4, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan Nomor Tujuan</li>\r\n                <li>Pilih Nominal Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(59, 'byu', 'BY.U', '', 'byu.png', 3, '<ol style=\"margin-left: -25px;\">\r\n                          <li>Masukan Nomor Handphone</li>\r\n                          <li>Pilih Jenis Layanan</li>\r\n                          <li>Pilih Layanan Yang Diinginkan</li>\r\n                          <li>Pilih Metode Pembayaran</li>\r\n                          <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                          <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                          <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>\r\n                      </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(60, 'dana', 'DANA', '', 'dana.png', 4, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan Nomor Tujuan</li>\r\n                <li>Pilih Nominal Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(61, 'doku', 'DOKU', '', 'doku.png', 4, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan Nomor Tujuan</li>\r\n                <li>Pilih Nominal Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(62, 'gopay', 'GO PAY', '', 'go_pay.png', 4, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan Nomor Tujuan</li>\r\n                <li>Pilih Nominal Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(63, 'grab', 'GRAB', '', 'grab.png', 4, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan Nomor Tujuan</li>\r\n                <li>Pilih Nominal Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(64, 'indosat', 'INDOSAT', '', 'indosat.png', 3, '<ol style=\"margin-left: -25px;\">\r\n                          <li>Masukan Nomor Handphone</li>\r\n                          <li>Pilih Jenis Layanan</li>\r\n                          <li>Pilih Layanan Yang Diinginkan</li>\r\n                          <li>Pilih Metode Pembayaran</li>\r\n                          <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                          <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                          <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>\r\n                      </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(66, 'linkaja', 'LINKAJA', '', 'linkaja.png', 4, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan Nomor Tujuan</li>\r\n                <li>Pilih Nominal Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(67, 'mandirietoll', 'MANDIRI E-TOLL', '', 'mandiri_etoll.png', 4, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan Nomor Tujuan</li>\r\n                <li>Pilih Nominal Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(68, 'maxim', 'MAXIM', '', 'maxim.png', 4, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan Nomor Tujuan</li>\r\n                <li>Pilih Nominal Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(69, 'ovo', 'OVO', '', 'ovo.png', 4, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan Nomor Tujuan</li>\r\n                <li>Pilih Nominal Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(70, 'shopeepay', 'SHOPEE PAY', '', 'shopee_pay.png', 4, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan Nomor Tujuan</li>\r\n                <li>Pilih Nominal Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(71, 'smartfren', 'SMARTFREN', '', 'smart.png', 3, '<ol style=\"margin-left: -25px;\">\r\n                          <li>Masukan Nomor Handphone</li>\r\n                          <li>Pilih Jenis Layanan</li>\r\n                          <li>Pilih Layanan Yang Diinginkan</li>\r\n                          <li>Pilih Metode Pembayaran</li>\r\n                          <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                          <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                          <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>\r\n                      </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 0),
(72, 'tapcashbni', 'TAPCASH BNI', '', 'tapcash_bni.png', 4, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan Nomor Tujuan</li>\r\n                <li>Pilih Nominal Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(73, 'telkomsel', 'TELKOMSEL', '', 'telkomsel.png', 3, '<ol style=\"margin-left: -25px;\">\r\n                          <li>Masukan Nomor Handphone</li>\r\n                          <li>Pilih Jenis Layanan</li>\r\n                          <li>Pilih Layanan Yang Diinginkan</li>\r\n                          <li>Pilih Metode Pembayaran</li>\r\n                          <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                          <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                          <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>\r\n                      </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(74, 'tixid', 'TIX ID', '', 'tixid.png', 4, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan Nomor Tujuan</li>\r\n                <li>Pilih Nominal Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(75, 'tri', 'TRI', '', 'tri.png', 3, '<ol style=\"margin-left: -25px;\">\r\n                          <li>Masukan Nomor Handphone</li>\r\n                          <li>Pilih Jenis Layanan</li>\r\n                          <li>Pilih Layanan Yang Diinginkan</li>\r\n                          <li>Pilih Metode Pembayaran</li>\r\n                          <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                          <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                          <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>\r\n                      </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(76, 'xl', 'XL', '', 'xl.png', 3, '<ol style=\"margin-left: -25px;\">\r\n                          <li>Masukan Nomor Handphone</li>\r\n                          <li>Pilih Jenis Layanan</li>\r\n                          <li>Pilih Layanan Yang Diinginkan</li>\r\n                          <li>Pilih Metode Pembayaran</li>\r\n                          <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                          <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                          <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>\r\n                      </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(77, 'pln', 'PLN', '', 'lightning.png', 4, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan Nomor Tujuan</li>\r\n                <li>Pilih Nominal Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(78, 'canvapro', 'Canva Pro', '', 'canva_pro.png', 2, '<ol style=\"margin-left: -25px;\">\r\n                          <li>Masukan UserID dan Zone / Server ID</li>\r\n                          <li>Pilih Layanan Yang Diinginkan</li>\r\n                          <li>Pilih Metode Pembayaran</li>\r\n                          <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                          <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                          <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n                      </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(79, 'disneyhotstar', 'Disney Hotstar', '', 'disney_hotstar.png', 2, '<ol style=\"margin-left: -25px;\">\r\n                          <li>Masukan UserID dan Zone / Server ID</li>\r\n                          <li>Pilih Layanan Yang Diinginkan</li>\r\n                          <li>Pilih Metode Pembayaran</li>\r\n                          <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                          <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                          <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n                      </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(80, 'garenashellmurah', 'Garena Shell Murah', '', 'garena_shell_promo.png', 2, '<ol style=\"margin-left: -25px;\">\r\n                          <li>Masukan UserID dan Zone / Server ID</li>\r\n                          <li>Pilih Layanan Yang Diinginkan</li>\r\n                          <li>Pilih Metode Pembayaran</li>\r\n                          <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                          <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                          <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n                      </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(81, 'iqiyipremium', 'iQIYI Premium', '', 'iqiyi_premium.png', 2, '<ol style=\"margin-left: -25px;\">\r\n                          <li>Masukan UserID dan Zone / Server ID</li>\r\n                          <li>Pilih Layanan Yang Diinginkan</li>\r\n                          <li>Pilih Metode Pembayaran</li>\r\n                          <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                          <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                          <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n                      </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(82, 'netflixpremium', 'Netflix Premium', '', 'netflix_premium.png', 2, '<ol style=\"margin-left: -25px;\">\r\n                          <li>Masukan UserID dan Zone / Server ID</li>\r\n                          <li>Pilih Layanan Yang Diinginkan</li>\r\n                          <li>Pilih Metode Pembayaran</li>\r\n                          <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                          <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                          <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n                      </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(83, 'spotifypremium', 'Spotify Premium', '', 'spotify_premium.png', 2, '<ol style=\"margin-left: -25px;\">\r\n                          <li>Masukan UserID dan Zone / Server ID</li>\r\n                          <li>Pilih Layanan Yang Diinginkan</li>\r\n                          <li>Pilih Metode Pembayaran</li>\r\n                          <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                          <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                          <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n                      </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 0),
(84, 'vidiopremier', 'Vidio Premier', '', 'vidio_premier.png', 2, '<ol style=\"margin-left: -25px;\">\r\n                          <li>Masukan UserID dan Zone / Server ID</li>\r\n                          <li>Pilih Layanan Yang Diinginkan</li>\r\n                          <li>Pilih Metode Pembayaran</li>\r\n                          <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                          <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                          <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n                      </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 0);
INSERT INTO `tb_kategori` (`cuid`, `slug`, `kategori`, `cekID`, `image`, `parent`, `deskripsi`, `bantuan`, `subtitle`, `subimage`, `banimage`, `margin_basic`, `margin_reseller`, `margin_hh`, `komisi`, `populer`, `sort`, `created_date`, `user`, `status`) VALUES
(85, 'wetvpremium', 'WeTV Premium', '', 'wetv_premium.png', 2, '<ol style=\"margin-left: -25px;\">\r\n                          <li>Masukan UserID dan Zone / Server ID</li>\r\n                          <li>Pilih Layanan Yang Diinginkan</li>\r\n                          <li>Pilih Metode Pembayaran</li>\r\n                          <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                          <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                          <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n                      </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(90, 'bpjskesehatan', 'BPJS KESEHATAN', '', 'bpjs_kesehatan.png', 7, '<ol style=\"margin-left: -25px;\">                 <li>Masukan Nomor Tujuan</li>                 <li>Pilih Nominal Yang Diinginkan</li>                 <li>Pilih Metode Pembayaran</li>                 <li>Masukan No. Whatsapp Anda</li>                 <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>                 <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>               </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(91, 'gasnegara', 'GAS NEGARA', '', 'gas_negara.png', 7, '<ol style=\"margin-left: -25px;\">                 <li>Masukan Nomor Tujuan</li>                 <li>Pilih Nominal Yang Diinginkan</li>                 <li>Pilih Metode Pembayaran</li>                 <li>Masukan No. Whatsapp Anda</li>                 <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>                 <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>               </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(92, 'hppascabayar', 'HP PASCABAYAR', '', 'hp_pascabayar.png', 7, '<ol style=\"margin-left: -25px;\">                 <li>Masukan Nomor Tujuan</li>                 <li>Pilih Nominal Yang Diinginkan</li>                 <li>Pilih Metode Pembayaran</li>                 <li>Masukan No. Whatsapp Anda</li>                 <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>                 <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>               </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(93, 'internetpascabayar', 'INTERNET PASCABAYAR', '', 'internet_pascabayar.png', 7, '<ol style=\"margin-left: -25px;\">                 <li>Masukan Nomor Tujuan</li>                 <li>Pilih Nominal Yang Diinginkan</li>                 <li>Pilih Metode Pembayaran</li>                 <li>Masukan No. Whatsapp Anda</li>                 <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>                 <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>               </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(94, 'multifinance', 'MULTIFINANCE', '', 'multifinance.png', 7, '<ol style=\"margin-left: -25px;\">                 <li>Masukan Nomor Tujuan</li>                 <li>Pilih Nominal Yang Diinginkan</li>                 <li>Pilih Metode Pembayaran</li>                 <li>Masukan No. Whatsapp Anda</li>                 <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>                 <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>               </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(95, 'plnpascabayar', 'PLN PASCABAYAR', '', 'pln_pascabayar.png', 7, '<ol style=\"margin-left: -25px;\">                 <li>Masukan Nomor Tujuan</li>                 <li>Pilih Nominal Yang Diinginkan</li>                 <li>Pilih Metode Pembayaran</li>                 <li>Masukan No. Whatsapp Anda</li>                 <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>                 <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>               </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(96, 'tvpascabayar', 'TV PASCABAYAR', '', 'tv_pascabayar.png', 7, '<ol style=\"margin-left: -25px;\">                 <li>Masukan Nomor Tujuan</li>                 <li>Pilih Nominal Yang Diinginkan</li>                 <li>Pilih Metode Pembayaran</li>                 <li>Masukan No. Whatsapp Anda</li>                 <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>                 <li>Tunggu Proses 1-2 Menit, Pesanan Anda akan Masuk Secara Otomatis</li>               </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 0, 0, '0000-00-00', 'master', 1),
(97, 'aceracer', 'Ace Racer', '', 'ace_racer.png', 1, '<ol style=\"margin-left: -25px;\">\r\n                <li>Masukan UserID dan Zone / Server ID</li>\r\n                <li>Pilih Layanan Yang Diinginkan</li>\r\n                <li>Pilih Metode Pembayaran</li>\r\n                <li>Masukan No. Whatsapp Anda agar mendapapat notifikasi</li>\r\n                <li>Klik Beli Sekarang dan Selesaikan Pembayaran</li>\r\n                <li>Tunggu Proses 1-2 Menit (event max 2jam) , Pesanan Anda akan Masuk Secara Otomatis</li>\r\n              </ol>', '', '', 'subimage.png', 'banimage.jpg', 4, 3, 3, 1, 1, 0, '0000-00-00', 'master', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_konfirmasi`
--

CREATE TABLE `tb_konfirmasi` (
  `cuid` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `paymentID` varchar(25) NOT NULL,
  `kd_transaksi` varchar(25) NOT NULL,
  `image` varchar(255) NOT NULL,
  `tanggal` datetime NOT NULL,
  `bank_tujuan` text NOT NULL,
  `total` int(11) NOT NULL,
  `metode` varchar(25) NOT NULL DEFAULT 'transfer',
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_livechat`
--

CREATE TABLE `tb_livechat` (
  `cuid` int(255) NOT NULL,
  `no_wa` text NOT NULL,
  `content` text NOT NULL,
  `status` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_livechat`
--

INSERT INTO `tb_livechat` (`cuid`, `no_wa`, `content`, `status`) VALUES
(1, '6281389820762', 'Hallo, Apa Kabar', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_menu_admin`
--

CREATE TABLE `tb_menu_admin` (
  `cuid` int(255) NOT NULL,
  `menu` text NOT NULL,
  `slug` text NOT NULL,
  `icon` text NOT NULL,
  `parent` int(11) NOT NULL,
  `tambah` int(2) NOT NULL,
  `ubah` int(2) NOT NULL,
  `hapus` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_menu_admin`
--

INSERT INTO `tb_menu_admin` (`cuid`, `menu`, `slug`, `icon`, `parent`, `tambah`, `ubah`, `hapus`) VALUES
(1, 'Information', '#', '', 0, 0, 0, 0),
(2, 'Transaction', '#', '', 0, 0, 0, 0),
(3, 'System', '#', '', 0, 0, 0, 0),
(4, 'Article', 'post', 'edit', 1, 1, 1, 1),
(5, 'Content Page', 'page', 'bookmark', 1, 1, 1, 1),
(6, 'Slide Show', 'slide', 'album', 1, 1, 1, 1),
(7, 'Social Media', 'social', 'share', 1, 0, 1, 0),
(8, 'Member', '#', 'users', 1, 0, 0, 0),
(9, 'Basic Member', 'member', '', 8, 0, 1, 1),
(10, 'Reseller Member', 'reseller', '', 8, 1, 1, 1),
(11, 'H2H Member', 'member_hh', '', 8, 0, 0, 0),
(13, 'Refferal List', 'refferal', '', 8, 0, 0, 0),
(14, 'Balance Member', 'balance', '', 8, 1, 1, 0),
(15, 'Product', '#', 'device-gamepad', 1, 0, 0, 0),
(16, 'Category Services', 'jenis', '', 15, 0, 1, 0),
(17, 'Category Product', 'category', '', 15, 1, 1, 1),
(18, 'Product Game', 'product', '', 15, 1, 1, 1),
(19, 'Product Prepaid', 'prepaid', '', 15, 1, 1, 1),
(20, 'Voucher', 'voucher', '', 15, 1, 1, 1),
(21, 'Order', '#', 'shopping-cart', 2, 0, 0, 0),
(22, 'Order List', 'order', '', 21, 0, 1, 1),
(23, 'Order Manual', 'order_manual', '', 21, 0, 1, 1),
(24, 'Top Up Request', 'topup', 'currency-dollar', 2, 0, 0, 0),
(25, 'Payment Method', 'payment_method', 'calendar', 2, 1, 0, 1),
(26, 'Manage API', '#', 'api-app', 3, 0, 0, 0),
(27, 'Provider', 'provider', '', 26, 0, 1, 0),
(28, 'Payment Gateway', 'payment_gateway', '', 26, 0, 1, 0),
(29, 'Cekmutasi', 'cekmutasi', '', 26, 0, 0, 0),
(30, 'Whatsapp', 'whatsapp', '', 26, 0, 0, 0),
(31, 'Settings', '#', 'settings', 3, 0, 0, 0),
(32, 'Website', 'setting', '', 31, 0, 0, 0),
(33, 'Live Chat', 'livechat', '', 31, 0, 0, 0),
(34, 'Pop Up Homepage', 'banner', '', 31, 0, 0, 0),
(35, 'Services', 'service', '', 31, 0, 0, 0),
(36, 'subCategory Product', 'subcategory', '', 15, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_menu_admin_list`
--

CREATE TABLE `tb_menu_admin_list` (
  `cuid` int(255) NOT NULL,
  `userID` int(255) NOT NULL,
  `menuID` int(255) NOT NULL,
  `parent` int(11) NOT NULL,
  `tambah` int(2) NOT NULL,
  `ubah` int(2) NOT NULL,
  `hapus` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_notif`
--

CREATE TABLE `tb_notif` (
  `cuid` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `note` text NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_order`
--

CREATE TABLE `tb_order` (
  `cuid` int(11) NOT NULL,
  `id_session` varchar(255) NOT NULL,
  `kd_transaksi` varchar(25) NOT NULL,
  `produkID` int(11) NOT NULL,
  `harga_modal` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `potongan` int(11) NOT NULL,
  `tukar_poin` int(15) NOT NULL,
  `kode_unik` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `total_profit` int(11) NOT NULL,
  `voucher` text NOT NULL,
  `komisi` int(11) NOT NULL,
  `poin` int(11) NOT NULL,
  `kategori` text NOT NULL,
  `title` text NOT NULL,
  `userID` text NOT NULL,
  `zoneID` text NOT NULL,
  `nickname` text NOT NULL,
  `trxID` text NOT NULL,
  `services` text NOT NULL,
  `status_order` text NOT NULL,
  `note` text NOT NULL,
  `full_name` text NOT NULL,
  `email` text NOT NULL,
  `no_hp` text NOT NULL,
  `metode` text NOT NULL,
  `created_date` datetime NOT NULL,
  `providerID` int(11) NOT NULL,
  `jenis` int(11) NOT NULL,
  `ipaddress` text NOT NULL,
  `id_user` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_page`
--

CREATE TABLE `tb_page` (
  `cuid` int(11) NOT NULL,
  `slug` text NOT NULL,
  `nama_page` text NOT NULL,
  `content` longtext NOT NULL,
  `image` varchar(255) NOT NULL,
  `video` varchar(255) NOT NULL,
  `created_date` date NOT NULL,
  `last_update` date NOT NULL,
  `user` text NOT NULL,
  `status` int(2) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_page`
--

INSERT INTO `tb_page` (`cuid`, `slug`, `nama_page`, `content`, `image`, `video`, `created_date`, `last_update`, `user`, `status`) VALUES
(5, 'kebijakan-privasi', 'Kebijakan Privasi', 'Edit', '', '', '0000-00-00', '2022-04-23', 'master', 1),
(3, 'faq', 'FAQ', 'Edit', '', '', '0000-00-00', '2022-04-23', 'master', 1),
(2, 'informasi-reseller', 'Informasi Reseller', '<p>Hasilkan cuan dengan rebahan</p>', '', '', '0000-00-00', '2023-10-14', 'master', 1),
(1, 'tentang-kami', 'Tentang Kami', '<p><b>FloraGaming<br></b><span style=\"color: var(--bs-card-color); background-color: var(--bs-card-bg); font-family: var(--bs-body-font-family); font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Jasa layanan pembayaran untuk seluruh game online dan produk digital lainnya yang ada di Indonesia,dengan cukup memiliki satu akses akun di FloraGaming kalian sudah bisa melakukan pembayaran untuk seluruh game atau produk digital yang ada di indonesia.</span></p><p><b>VISI</b><br>Menjadi platform top up terbaik untuk beragam game online dan produk digital lainnya yang beredar di Indonesia</p><p><b>Misi</b><br>Memberikan layanan yang mudah dengan harga yang bersaing di pasar digital</p>', '', '', '0000-00-00', '2023-10-14', 'master', 1),
(4, 'ketentuan-layanan', 'Ketentuan Layanan', 'Edit', '', '', '0000-00-00', '2022-04-23', 'master', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pascabayar`
--

CREATE TABLE `tb_pascabayar` (
  `cuid` int(11) NOT NULL,
  `slug` text NOT NULL,
  `code` text NOT NULL,
  `title` text NOT NULL,
  `kategori` text NOT NULL,
  `harga_modal` int(15) NOT NULL,
  `harga_jual` int(15) NOT NULL,
  `harga_reseller` int(15) NOT NULL,
  `harga_h2h` int(15) NOT NULL,
  `image` varchar(255) NOT NULL,
  `currency` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `jenis` int(11) NOT NULL,
  `product_type` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_pascabayar`
--

INSERT INTO `tb_pascabayar` (`cuid`, `slug`, `code`, `title`, `kategori`, `harga_modal`, `harga_jual`, `harga_reseller`, `harga_h2h`, `image`, `currency`, `status`, `created_date`, `jenis`, `product_type`) VALUES
(40156, 'womfinance', 'PMF5', 'Wom Finance', 'MULTIFINANCE', 150, 150, 150, 0, 'multifinance.png', '', 1, '2023-01-31', 4, 6),
(40157, 'xlpostpaid', 'PASCAHP5', 'XL Postpaid', 'HP PASCABAYAR', 150, 150, 150, 0, 'hp_pascabayar.png', '', 1, '2023-01-31', 4, 6),
(40155, 'threepostpaid', 'PASCAHP4', 'Three Postpaid', 'HP PASCABAYAR', 150, 150, 150, 0, 'hp_pascabayar.png', '', 1, '2023-01-31', 4, 6),
(40153, 'telkompstn', 'PINTTLKM', 'TELKOMPSTN', 'INTERNET PASCABAYAR', 1475, 1475, 1475, 0, 'internet_pascabayar.png', '', 1, '2023-01-31', 4, 6),
(40149, 'smartfrenpostpaid', 'PASCAHP3', 'Smartfren Postpaid', 'HP PASCABAYAR', 150, 150, 150, 0, 'hp_pascabayar.png', '', 1, '2023-01-31', 4, 6),
(40151, 'speedy&indihome', 'PINTINDI', 'SPEEDY & INDIHOME', 'INTERNET PASCABAYAR', 1475, 1475, 1475, 0, 'internet_pascabayar.png', '', 1, '2023-01-31', 4, 6),
(40148, 'plnpascabayar', 'PPLN', 'Pln Pascabayar', 'PLN PASCABAYAR', 625, 625, 625, 0, 'pln_pascabayar.png', '', 1, '2023-01-31', 4, 6),
(40013, 'myrepublic', 'PINTMYRP', 'MyRepublic', 'INTERNET PASCABAYAR', 150, 150, 150, 0, 'internet_pascabayar.png', '', 1, '2023-01-31', 4, 6),
(40011, 'megaautofinance', 'PMF3', 'Mega Auto Finance', 'MULTIFINANCE', 150, 150, 150, 0, 'multifinance.png', '', 1, '2023-01-31', 4, 6),
(40012, 'megacentralfinance', 'PMF4', 'Mega Central Finance', 'MULTIFINANCE', 150, 150, 150, 0, 'multifinance.png', '', 1, '2023-01-31', 4, 6),
(40010, 'matrix', 'PASCAHP2', 'Matrix', 'HP PASCABAYAR', 150, 150, 150, 0, 'hp_pascabayar.png', '', 1, '2023-01-31', 4, 6),
(40009, 'indovision', 'PTVINDV', 'INDOVISION', 'TV PASCABAYAR', 150, 150, 150, 0, 'tv_pascabayar.png', '', 1, '2023-01-31', 4, 6),
(40007, 'halopostpaid', 'PASCAHP1', 'Halo Postpaid', 'HP PASCABAYAR', 150, 150, 150, 0, 'hp_pascabayar.png', '', 1, '2023-01-31', 4, 6),
(40006, 'gasnegara', 'PGASN', 'Gas Negara', 'GAS NEGARA', 2075, 2075, 2075, 0, 'gas_negara.png', '', 1, '2023-01-31', 4, 6),
(40005, 'firstmedia', 'PTVFM', 'FIRSTMEDIA', 'TV PASCABAYAR', 150, 150, 150, 0, 'tv_pascabayar.png', '', 1, '2023-01-31', 4, 6),
(40000, 'bpjskesehatan', 'PBPJS', 'Bpjs Kesehatan', 'BPJS KESEHATAN', 1525, 1525, 1525, 0, 'bpjs_kesehatan.png', '', 1, '2023-01-31', 4, 6),
(40002, 'cbn', 'PINTCBN', 'CBN', 'INTERNET PASCABAYAR', 150, 150, 150, 0, 'internet_pascabayar.png', '', 1, '2023-01-31', 4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pemesan`
--

CREATE TABLE `tb_pemesan` (
  `cuid` int(11) NOT NULL,
  `id_session` varchar(100) NOT NULL,
  `kd_transaksi` varchar(25) NOT NULL,
  `full_name` text NOT NULL,
  `email` text NOT NULL,
  `alamat` text NOT NULL,
  `provinsi` text NOT NULL,
  `city` text NOT NULL,
  `kecamatan` text NOT NULL,
  `kelurahan` text NOT NULL,
  `kode_pos` text NOT NULL,
  `no_hp` text NOT NULL,
  `kode_unik` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `no_resi` varchar(100) NOT NULL,
  `tgl_kirim` date NOT NULL,
  `metode` text NOT NULL,
  `userID` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_poin`
--

CREATE TABLE `tb_poin` (
  `cuid` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `pending` int(11) NOT NULL,
  `payout` int(11) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_popup`
--

CREATE TABLE `tb_popup` (
  `cuid` int(11) NOT NULL,
  `ip` text NOT NULL,
  `date` date NOT NULL,
  `status` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_post`
--

CREATE TABLE `tb_post` (
  `cuid` int(11) NOT NULL,
  `slug` text NOT NULL,
  `title` text NOT NULL,
  `meta_desc` text NOT NULL,
  `keyword` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `video` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `author` text NOT NULL,
  `kategori` text NOT NULL,
  `created_date` date NOT NULL,
  `last_update` date NOT NULL,
  `user` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_prepaid`
--

CREATE TABLE `tb_prepaid` (
  `cuid` int(11) NOT NULL,
  `slug` text NOT NULL,
  `code` text NOT NULL,
  `title` text NOT NULL,
  `kategori` text NOT NULL,
  `brand` text NOT NULL,
  `harga_modal` int(15) NOT NULL,
  `harga_jual` int(15) NOT NULL,
  `harga_reseller` int(15) NOT NULL,
  `harga_h2h` int(15) NOT NULL,
  `harga_coret` int(15) NOT NULL,
  `komisi` int(11) NOT NULL,
  `poin` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `jenis` int(2) NOT NULL,
  `product_type` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_prepaid`
--

INSERT INTO `tb_prepaid` (`cuid`, `slug`, `code`, `title`, `kategori`, `brand`, `harga_modal`, `harga_jual`, `harga_reseller`, `harga_h2h`, `harga_coret`, `komisi`, `poin`, `image`, `status`, `created_date`, `jenis`, `product_type`) VALUES
(40002, '1gbnasional+4gb(01.00-09.00)1hari', 'TDN5', '1GB Nasional + 4GB (01.00 - 09.00) 1 Hari', 'paket-internet', 'TRI', 5230, 5439, 5387, 5387, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(40009, 'alwayson1.5gb', 'TDA15', 'AlwaysOn 1.5 GB', 'paket-internet', 'TRI', 15555, 16177, 16022, 16022, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(40010, 'alwayson10gb+unlimited', 'TDAUNL10', 'AlwaysOn 10 GB + Unlimited', 'paket-internet', 'TRI', 73525, 76466, 75731, 75731, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(40013, 'alwayson16gb+unlimited', 'TDAUNL16', 'AlwaysOn 16 GB + Unlimited', 'paket-internet', 'TRI', 105450, 109668, 108614, 108614, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(40014, 'alwayson2gb', 'TDA2', 'AlwaysOn 2 GB', 'paket-internet', 'TRI', 17805, 18517, 18339, 18339, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(40015, 'alwayson3gb', 'TDA3', 'AlwaysOn 3 GB', 'paket-internet', 'TRI', 20500, 21320, 21115, 21115, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(40017, 'alwayson50gb', 'TDA50', 'AlwaysOn 50 GB', 'paket-internet', 'TRI', 138775, 144326, 142938, 142938, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(40018, 'alwayson6gb', 'TDA6', 'AlwaysOn 6 GB', 'paket-internet', 'TRI', 28097, 29221, 28940, 28940, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(40019, 'alwayson6gb+unlimited', 'TDAUNL6', 'AlwaysOn 6 GB + Unlimited', 'paket-internet', 'TRI', 72775, 75686, 74958, 74958, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(40020, 'alwayson8gb', 'TDA8', 'AlwaysOn 8 GB', 'paket-internet', 'TRI', 40974, 42613, 42203, 42203, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(40021, 'alwayson80gb', 'TDA80', 'AlwaysOn 80 GB', 'paket-internet', 'TRI', 282195, 293483, 290661, 290661, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(40022, 'anynet300menit90hari', 'XTLP30090', 'AnyNet 300 Menit 90 Hari', 'paket-telepon', 'XL', 98875, 102830, 101841, 101841, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(40038, 'axis10.000', 'AX10', 'Axis 10.000', 'pulsa-reguler', 'AXIS', 10780, 11211, 11103, 11103, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40039, 'axis100.000', 'AX100', 'Axis 100.000', 'pulsa-reguler', 'AXIS', 98950, 102908, 101919, 101919, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40040, 'axis15.000', 'AX15', 'Axis 15.000', 'pulsa-reguler', 'AXIS', 15080, 15683, 15532, 15532, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40042, 'axis25.000', 'AX25', 'Axis 25.000', 'pulsa-reguler', 'AXIS', 25010, 26010, 25760, 25760, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40043, 'axis30.000', 'AX30', 'Axis 30.000', 'pulsa-reguler', 'AXIS', 30105, 31309, 31008, 31008, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40044, 'axis5.000', 'AX5', 'Axis 5.000', 'pulsa-reguler', 'AXIS', 5986, 6225, 6166, 6166, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40045, 'axis50.000', 'AX50', 'Axis 50.000', 'pulsa-reguler', 'AXIS', 49895, 51891, 51392, 51392, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40046, 'axisdatabronet10gb/30hari(sulutra)', 'AXDSULUTRA10GB', 'Axis Data Bronet 10 GB / 30 Hari (Sulutra)', 'paket-internet', 'AXIS', 22260, 23150, 22928, 22928, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40047, 'axisdatabronet16gb/30hari(sulutra)', 'AXDSULUTRA16GB', 'Axis Data Bronet 16 GB / 30 Hari (Sulutra)', 'paket-internet', 'AXIS', 32250, 33540, 33218, 33218, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40048, 'axisdatabronet3gb/30hari(sulutra)', 'AXDSULUTRA3GB', 'Axis Data Bronet 3 GB / 30 Hari (Sulutra)', 'paket-internet', 'AXIS', 15555, 16177, 16022, 16022, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40049, 'axisdatabronet6gb/30hari(sulutra)', 'AXDSULUTRA6GB', 'Axis Data Bronet 6 GB / 30 Hari (Sulutra)', 'paket-internet', 'AXIS', 17350, 18044, 17871, 17871, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40050, 'axisdatajawa1.5gb5hari', 'AXDJAWA', 'Axis Data Jawa 1.5 GB 5 Hari', 'paket-internet', 'AXIS', 10137, 10542, 10441, 10441, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40051, 'axisdatakzlchat/30hari', 'AXKZLC30', 'Axis Data KZL Chat / 30 Hari', 'paket-internet', 'AXIS', 14835, 15428, 15280, 15280, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40052, 'axisdatakzlchat/7hari', 'AXKZLC7', 'Axis Data KZL Chat / 7 Hari', 'paket-internet', 'AXIS', 5013, 5214, 5163, 5163, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40055, 'axisdatakzlgamesvainglory1gb/30hari', 'AXKZLGV130', 'Axis Data KZL Games Vainglory 1 GB / 30 Hari', 'paket-internet', 'AXIS', 9950, 10348, 10249, 10249, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40057, 'axisdatakzlsosmed+chat/30hari', 'AXKZLSC30', 'Axis Data KZL Sosmed + Chat / 30 Hari', 'paket-internet', 'AXIS', 19750, 20540, 20343, 20343, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40059, 'axisdatakzlsosmed/30hari', 'AXKZLS30', 'Axis Data KZL Sosmed / 30 Hari', 'paket-internet', 'AXIS', 14855, 15449, 15301, 15301, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40060, 'axisdatakzlsosmed/7hari', 'AXKZLS7', 'Axis Data KZL Sosmed / 7 Hari', 'paket-internet', 'AXIS', 5018, 5219, 5169, 5169, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40061, 'axisdatamini1gb/5hari', 'AXDM15', 'Axis Data Mini 1 GB / 5 Hari', 'paket-internet', 'AXIS', 7705, 8013, 7936, 7936, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40063, 'axisdatamini2gb/5hari', 'AXDM25', 'Axis Data Mini 2 GB / 5 Hari', 'paket-internet', 'AXIS', 13460, 13998, 13864, 13864, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40065, 'axisdatamini3gb/15hari', 'AXDM315', 'Axis Data Mini 3 GB / 15 Hari', 'paket-internet', 'AXIS', 20560, 21382, 21177, 21177, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40067, 'axisdatamini5gb/15hari', 'AXDM515', 'Axis Data Mini 5 GB / 15 Hari', 'paket-internet', 'AXIS', 30600, 31824, 31518, 31518, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40068, 'axisdatamini5gb/5hari', 'AXDM55', 'Axis Data Mini 5 GB / 5 Hari', 'paket-internet', 'AXIS', 23150, 24076, 23845, 23845, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40069, 'axisowsem16gb+unlimitedgames/30hari', 'AXDO16', 'Axis OWSEM 16 GB + Unlimited Games / 30 Hari', 'paket-internet', 'AXIS', 39675, 41262, 40865, 40865, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40070, 'axisowsem24gb+unlimitedgames/30hari', 'AXDO24', 'Axis OWSEM 24 GB + Unlimited Games / 30 Hari', 'paket-internet', 'AXIS', 40599, 42223, 41817, 41817, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40071, 'axisowsem32gb+unlimitedgames/30hari', 'AXDO32', 'Axis OWSEM 32 GB + Unlimited Games / 30 Hari', 'paket-internet', 'AXIS', 48950, 50908, 50419, 50419, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40072, 'axisowsem48gb+unlimitedgames/30hari', 'AXDO48', 'Axis OWSEM 48 GB + Unlimited Games / 30 Hari', 'paket-internet', 'AXIS', 57975, 60294, 59714, 59714, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40073, 'axispulsatransfer10.000', 'AT10', 'Axis Pulsa Transfer 10.000', 'pulsa-transfer', 'AXIS', 10455, 10873, 10769, 10769, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40074, 'axispulsatransfer100.000', 'AT100', 'Axis Pulsa Transfer 100.000', 'pulsa-transfer', 'AXIS', 94225, 97994, 97052, 97052, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40075, 'axispulsatransfer15.000', 'AT15', 'Axis Pulsa Transfer 15.000', 'pulsa-transfer', 'AXIS', 14756, 15346, 15199, 15199, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40076, 'axispulsatransfer25.000', 'AT25', 'Axis Pulsa Transfer 25.000', 'pulsa-transfer', 'AXIS', 24460, 25438, 25194, 25194, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40077, 'axispulsatransfer30.000', 'AT30', 'Axis Pulsa Transfer 30.000', 'pulsa-transfer', 'AXIS', 28494, 29634, 29349, 29349, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40078, 'axispulsatransfer35.000', 'AT35', 'Axis Pulsa Transfer 35.000', 'pulsa-transfer', 'AXIS', 33500, 34840, 34505, 34505, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40079, 'axispulsatransfer40.000', 'AT40', 'Axis Pulsa Transfer 40.000', 'pulsa-transfer', 'AXIS', 38065, 39588, 39207, 39207, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40080, 'axispulsatransfer45.000', 'AT45', 'Axis Pulsa Transfer 45.000', 'pulsa-transfer', 'AXIS', 42630, 44335, 43909, 43909, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40081, 'axispulsatransfer5.000', 'AT5', 'Axis Pulsa Transfer 5.000', 'pulsa-transfer', 'AXIS', 5555, 5777, 5722, 5722, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40082, 'axispulsatransfer50.000', 'AT50', 'Axis Pulsa Transfer 50.000', 'pulsa-transfer', 'AXIS', 47174, 49061, 48589, 48589, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40083, 'axispulsatransfer60.000', 'AT60', 'Axis Pulsa Transfer 60.000', 'pulsa-transfer', 'AXIS', 56154, 58400, 57839, 57839, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40084, 'axispulsatransfer75.000', 'AT75', 'Axis Pulsa Transfer 75.000', 'pulsa-transfer', 'AXIS', 70476, 73295, 72590, 72590, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40085, 'axispulsatransfer90.000', 'AT90', 'Axis Pulsa Transfer 90.000', 'pulsa-transfer', 'AXIS', 84860, 88254, 87406, 87406, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40086, 'axistambahmasaaktifkartu30hari', 'AMA30', 'Axis Tambah Masa Aktif Kartu 30 Hari', 'paket-internet', 'AXIS', 7650, 7956, 7880, 7880, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40087, 'axistambahmasaaktifkartu4bulan', 'AMA120', 'Axis Tambah Masa Aktif Kartu 4 Bulan', 'paket-internet', 'AXIS', 10650, 11076, 10970, 10970, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40088, 'axistelepon100menitsemuaop/30hari', 'AXTLP10030', 'Axis Telepon 100 Menit Semua Op / 30 Hari', 'paket-telepon', 'AXIS', 25295, 26307, 26054, 26054, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40089, 'axistelepon30menitsemuaop/7hari', 'AXTLP307', 'Axis Telepon 30 Menit Semua Op / 7 Hari', 'paket-telepon', 'AXIS', 8035, 8356, 8276, 8276, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40090, 'axisteleponsepuasnyasesama/14hari', 'AXTLP14', 'Axis Telepon Sepuasnya Sesama / 14 Hari', 'paket-telepon', 'AXIS', 350, 364, 361, 361, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40091, 'brizzi100.000', 'BRIZZI100', 'BRIZZI 100.000', 'saldo-emoney', 'BRI BRIZZI', 100450, 104468, 103464, 103464, 0, 0, 0, 'bri_brizzi.png', 1, '2023-10-08', 4, 4),
(40092, 'brizzi20.000', 'BRIZZI20', 'BRIZZI 20.000', 'saldo-emoney', 'BRI BRIZZI', 20825, 21658, 21450, 21450, 0, 0, 0, 'bri_brizzi.png', 1, '2023-10-08', 4, 4),
(40093, 'brizzi200.000', 'BRIZZI200', 'BRIZZI 200.000', 'saldo-emoney', 'BRI BRIZZI', 200450, 208468, 206464, 206464, 0, 0, 0, 'bri_brizzi.png', 1, '2023-10-08', 4, 4),
(40094, 'brizzi50.000', 'BRIZZI50', 'BRIZZI 50.000', 'saldo-emoney', 'BRI BRIZZI', 50725, 52754, 52247, 52247, 0, 0, 0, 'bri_brizzi.png', 1, '2023-10-08', 4, 4),
(40095, 'bronet1gb/30hari', 'AXDB1', 'BRONET 1 GB / 30 Hari', 'paket-internet', 'AXIS', 10260, 10670, 10568, 10568, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40096, 'bronet10gb/60hari', 'AXDB10', 'BRONET 10 GB / 60 Hari', 'paket-internet', 'AXIS', 77566, 80669, 79893, 79893, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40097, 'bronet12gb/60hari', 'AXDB12', 'BRONET 12 GB / 60 Hari', 'paket-internet', 'AXIS', 95890, 99726, 98767, 98767, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40098, 'bronet16gb/60hari', 'AXDB16', 'BRONET 16 GB / 60 Hari', 'paket-internet', 'AXIS', 109300, 113672, 112579, 112579, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40099, 'bronet2gb/30hari', 'AXDB2', 'BRONET 2 GB / 30 Hari', 'paket-internet', 'AXIS', 26125, 27170, 26909, 26909, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40100, 'bronet2gb/60hari', 'AXDB260', 'BRONET 2 GB / 60 Hari', 'paket-internet', 'AXIS', 25410, 26426, 26172, 26172, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40101, 'bronet2gb/7hari', 'AXDB224', 'BRONET 2 GB / 7 Hari', 'paket-internet', 'AXIS', 16151, 16797, 16636, 16636, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40102, 'bronet3gb/30hari', 'AXDB3', 'BRONET 3 GB / 30 Hari', 'paket-internet', 'AXIS', 14375, 14950, 14806, 14806, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40103, 'bronet3gb/60hari', 'AXDB360', 'BRONET 3 GB / 60 Hari', 'paket-internet', 'AXIS', 32100, 33384, 33063, 33063, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40104, 'bronet5gb/30hari', 'AXDB5', 'BRONET 5 GB / 30 Hari', 'paket-internet', 'AXIS', 26050, 27092, 26832, 26832, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40105, 'bronet5gb/60hari', 'AXDB560', 'BRONET 5 GB / 60 Hari', 'paket-internet', 'AXIS', 48125, 50050, 49569, 49569, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40106, 'bronet8gb/30hari', 'AXDB8', 'BRONET 8 GB / 30 Hari', 'paket-internet', 'AXIS', 31581, 32844, 32528, 32528, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40107, 'bronet8gb/60hari', 'AXDB860', 'BRONET 8 GB / 60 Hari', 'paket-internet', 'AXIS', 65127, 67732, 67081, 67081, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40108, 'by.u1.000', 'BYU1', 'By.U 1.000', 'pulsa-reguler', 'BY.U', 1915, 1992, 1972, 1972, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40109, 'by.u10.000', 'BYU10', 'By.U 10.000', 'pulsa-reguler', 'BY.U', 10328, 10741, 10638, 10638, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40110, 'by.u100.000', 'BYU100', 'By.U 100.000', 'pulsa-reguler', 'BY.U', 99300, 103272, 102279, 102279, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40111, 'by.u15.000', 'BYU15', 'By.U 15.000', 'pulsa-reguler', 'BY.U', 15235, 15844, 15692, 15692, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40112, 'by.u2.000', 'BYU2', 'By.U 2.000', 'pulsa-reguler', 'BY.U', 3650, 3796, 3760, 3760, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40113, 'by.u20.000', 'BYU20', 'By.U 20.000', 'pulsa-reguler', 'BY.U', 20155, 20961, 20760, 20760, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40114, 'by.u25.000', 'BYU25', 'By.U 25.000', 'pulsa-reguler', 'BY.U', 24910, 25906, 25657, 25657, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40115, 'by.u3.000', 'BYU3', 'By.U 3.000', 'pulsa-reguler', 'BY.U', 3785, 3936, 3899, 3899, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40116, 'by.u30.000', 'BYU30', 'By.U 30.000', 'pulsa-reguler', 'BY.U', 29775, 30966, 30668, 30668, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40117, 'by.u35.000', 'BYU35', 'By.U 35.000', 'pulsa-reguler', 'BY.U', 34910, 36306, 35957, 35957, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40118, 'by.u4.000', 'BYU4', 'By.U 4.000', 'pulsa-reguler', 'BY.U', 4820, 5013, 4965, 4965, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40119, 'by.u40.000', 'BYU40', 'By.U 40.000', 'pulsa-reguler', 'BY.U', 40025, 41626, 41226, 41226, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40120, 'by.u45.000', 'BYU45', 'By.U 45.000', 'pulsa-reguler', 'BY.U', 44830, 46623, 46175, 46175, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40121, 'by.u5.000', 'BYU5', 'By.U 5.000', 'pulsa-reguler', 'BY.U', 5680, 5907, 5850, 5850, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40122, 'by.u50.000', 'BYU50', 'By.U 50.000', 'pulsa-reguler', 'BY.U', 49725, 51714, 51217, 51217, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40123, 'by.u55.000', 'BYU55', 'By.U 55.000', 'pulsa-reguler', 'BY.U', 54695, 56883, 56336, 56336, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40124, 'by.u6.000', 'BYU6', 'By.U 6.000', 'pulsa-reguler', 'BY.U', 6855, 7129, 7061, 7061, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40125, 'by.u60.000', 'BYU60', 'By.U 60.000', 'pulsa-reguler', 'BY.U', 59775, 62166, 61568, 61568, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40126, 'by.u65.000', 'BYU65', 'By.U 65.000', 'pulsa-reguler', 'BY.U', 65175, 67782, 67130, 67130, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40127, 'by.u7.000', 'BYU7', 'By.U 7.000', 'pulsa-reguler', 'BY.U', 7855, 8169, 8091, 8091, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40128, 'by.u70.000', 'BYU70', 'By.U 70.000', 'pulsa-reguler', 'BY.U', 70175, 72982, 72280, 72280, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40129, 'by.u75.000', 'BYU75', 'By.U 75.000', 'pulsa-reguler', 'BY.U', 74620, 77605, 76859, 76859, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40130, 'by.u8.000', 'BYU8', 'By.U 8.000', 'pulsa-reguler', 'BY.U', 8855, 9209, 9121, 9121, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40131, 'by.u80.000', 'BYU80', 'By.U 80.000', 'pulsa-reguler', 'BY.U', 80175, 83382, 82580, 82580, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40132, 'by.u85.000', 'BYU85', 'By.U 85.000', 'pulsa-reguler', 'BY.U', 85175, 88582, 87730, 87730, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40133, 'by.u9.000', 'BYU9', 'By.U 9.000', 'pulsa-reguler', 'BY.U', 9605, 9989, 9893, 9893, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40134, 'by.u90.000', 'BYU90', 'By.U 90.000', 'pulsa-reguler', 'BY.U', 90175, 93782, 92880, 92880, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40135, 'by.u95.000', 'BYU95', 'By.U 95.000', 'pulsa-reguler', 'BY.U', 95175, 98982, 98030, 98030, 0, 0, 0, 'by.u.png', 1, '2023-10-08', 4, 3),
(40158, 'danarp10.000', 'DANA10', 'DANA Rp 10.000', 'saldo-emoney', 'DANA', 10230, 10639, 10537, 10537, 0, 0, 0, 'dana.png', 1, '2023-10-08', 4, 4),
(40159, 'danarp100.000', 'DANA100', 'DANA Rp 100.000', 'saldo-emoney', 'DANA', 100250, 104260, 103258, 103258, 0, 0, 0, 'dana.png', 1, '2023-10-08', 4, 4),
(40160, 'danarp15.000', 'DANA15', 'DANA Rp 15.000', 'saldo-emoney', 'DANA', 15260, 15870, 15718, 15718, 0, 0, 0, 'dana.png', 1, '2023-10-08', 4, 4),
(40161, 'danarp150.000', 'DANA150', 'DANA Rp 150.000', 'saldo-emoney', 'DANA', 150305, 156317, 154814, 154814, 0, 0, 0, 'dana.png', 1, '2023-10-08', 4, 4),
(40162, 'danarp20.000', 'DANA20', 'DANA Rp 20.000', 'saldo-emoney', 'DANA', 20260, 21070, 20868, 20868, 0, 0, 0, 'dana.png', 1, '2023-10-08', 4, 4),
(40164, 'danarp25.000', 'DANA25', 'DANA Rp 25.000', 'saldo-emoney', 'DANA', 25260, 26270, 26018, 26018, 0, 0, 0, 'dana.png', 1, '2023-10-08', 4, 4),
(40166, 'danarp30.000', 'DANA30', 'DANA Rp 30.000', 'saldo-emoney', 'DANA', 30260, 31470, 31168, 31168, 0, 0, 0, 'dana.png', 1, '2023-10-08', 4, 4),
(40168, 'danarp40.000', 'DANA40', 'DANA Rp 40.000', 'saldo-emoney', 'DANA', 40260, 41870, 41468, 41468, 0, 0, 0, 'dana.png', 1, '2023-10-08', 4, 4),
(40170, 'danarp50.000', 'DANA50', 'DANA Rp 50.000', 'saldo-emoney', 'DANA', 50260, 52270, 51768, 51768, 0, 0, 0, 'dana.png', 1, '2023-10-08', 4, 4),
(40172, 'danarp60.000', 'DANA60', 'DANA Rp 60.000', 'saldo-emoney', 'DANA', 60325, 62738, 62135, 62135, 0, 0, 0, 'dana.png', 1, '2023-10-08', 4, 4),
(40173, 'danarp70.000', 'DANA70', 'DANA Rp 70.000', 'saldo-emoney', 'DANA', 70305, 73117, 72414, 72414, 0, 0, 0, 'dana.png', 1, '2023-10-08', 4, 4),
(40174, 'danarp75.000', 'DANA75', 'DANA Rp 75.000', 'saldo-emoney', 'DANA', 75260, 78270, 77518, 77518, 0, 0, 0, 'dana.png', 1, '2023-10-08', 4, 4),
(40175, 'danarp80.000', 'DANA80', 'DANA Rp 80.000', 'saldo-emoney', 'DANA', 80240, 83450, 82647, 82647, 0, 0, 0, 'dana.png', 1, '2023-10-08', 4, 4),
(40177, 'danarp90.000', 'DANA90', 'DANA Rp 90.000', 'saldo-emoney', 'DANA', 90675, 94302, 93395, 93395, 0, 0, 0, 'dana.png', 1, '2023-10-08', 4, 4),
(40190, 'doku65.000', 'MAXIMDRIVER65', 'Doku 65.000', 'saldo-emoney', 'DOKU', 65950, 68588, 67929, 67929, 0, 0, 0, 'doku.png', 1, '2023-10-08', 4, 4),
(40191, 'doku85.000', 'MAXIMDRIVER85', 'Doku 85.000', 'saldo-emoney', 'DOKU', 85950, 89388, 88529, 88529, 0, 0, 0, 'doku.png', 1, '2023-10-08', 4, 4),
(40192, 'doku95.000', 'MAXIMDRIVER95', 'Doku 95.000', 'saldo-emoney', 'DOKU', 95950, 99788, 98829, 98829, 0, 0, 0, 'doku.png', 1, '2023-10-08', 4, 4),
(40265, 'giftdata1gb', 'IGK1000', 'GIFT DATA 1 GB', 'paket-internet', 'INDOSAT', 8150, 8476, 8395, 8395, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40266, 'giftdata1gb', 'IGK1500', 'GIFT DATA 1 GB', 'paket-internet', 'INDOSAT', 12150, 12636, 12515, 12515, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40267, 'giftdata10gb', 'IGK10000', 'GIFT DATA 10 GB', 'paket-internet', 'INDOSAT', 75975, 79014, 78254, 78254, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40268, 'giftdata100mb', 'IGK100', 'GIFT DATA 100 MB', 'paket-internet', 'INDOSAT', 950, 988, 979, 979, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40269, 'giftdata2gb', 'IGK2000', 'GIFT DATA 2 GB', 'paket-internet', 'INDOSAT', 16150, 16796, 16635, 16635, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40271, 'giftdata200mb', 'IGK200', 'GIFT DATA 200 MB', 'paket-internet', 'INDOSAT', 1750, 1820, 1803, 1803, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40272, 'giftdata3gb', 'IGK3000', 'GIFT DATA 3 GB', 'paket-internet', 'INDOSAT', 17175, 17862, 17690, 17690, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40273, 'giftdata3.5gb', 'IGK3500', 'GIFT DATA 3.5 GB', 'paket-internet', 'INDOSAT', 26900, 27976, 27707, 27707, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40275, 'giftdata4gb', 'IGK4000', 'GIFT DATA 4 GB', 'paket-internet', 'INDOSAT', 32205, 33493, 33171, 33171, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40276, 'giftdata4.5gb', 'IGK4500', 'GIFT DATA 4.5 GB', 'paket-internet', 'INDOSAT', 33775, 35126, 34788, 34788, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40277, 'giftdata400mb', 'IGK400', 'GIFT DATA 400 MB', 'paket-internet', 'INDOSAT', 3350, 3484, 3451, 3451, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40278, 'giftdata5gb', 'IGK5000', 'GIFT DATA 5 GB', 'paket-internet', 'INDOSAT', 40150, 41756, 41355, 41355, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40279, 'giftdata500mb', 'IGK500', 'GIFT DATA 500 MB', 'paket-internet', 'INDOSAT', 4150, 4316, 4275, 4275, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40280, 'giftdata6gb', 'IGK6000', 'GIFT DATA 6 GB', 'paket-internet', 'INDOSAT', 48150, 50076, 49595, 49595, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40281, 'giftdata600mb', 'IGK600', 'GIFT DATA 600 MB', 'paket-internet', 'INDOSAT', 6635, 6900, 6834, 6834, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40282, 'giftdata7gb', 'IGK7000', 'GIFT DATA 7 GB', 'paket-internet', 'INDOSAT', 56150, 58396, 57835, 57835, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40283, 'giftdata700mb', 'IGK700', 'GIFT DATA 700 MB', 'paket-internet', 'INDOSAT', 5750, 5980, 5923, 5923, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40284, 'giftdata8gb', 'IGK8000', 'GIFT DATA 8 GB', 'paket-internet', 'INDOSAT', 64150, 66716, 66075, 66075, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40285, 'giftdata800mb', 'IGK800', 'GIFT DATA 800 MB', 'paket-internet', 'INDOSAT', 8655, 9001, 8915, 8915, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40286, 'giftdata9gb', 'IGK9000', 'GIFT DATA 9 GB', 'paket-internet', 'INDOSAT', 72150, 75036, 74315, 74315, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40287, 'giftdata900mb', 'IGK900', 'GIFT DATA 900 MB', 'paket-internet', 'INDOSAT', 9660, 10046, 9950, 9950, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40295, 'gopay10.000', 'GOPAY10', 'Go Pay 10.000', 'saldo-emoney', 'GO PAY', 10455, 10873, 10769, 10769, 0, 0, 0, 'go_pay.png', 1, '2023-10-08', 4, 4),
(40296, 'gopay100.000', 'GOPAY100', 'Go Pay 100.000', 'saldo-emoney', 'GO PAY', 100475, 104494, 103489, 103489, 0, 0, 0, 'go_pay.png', 1, '2023-10-08', 4, 4),
(40297, 'gopay15.000', 'GOPAY15', 'Go Pay 15.000', 'saldo-emoney', 'GO PAY', 15410, 16026, 15872, 15872, 0, 0, 0, 'go_pay.png', 1, '2023-10-08', 4, 4),
(40298, 'gopay150.000', 'GOPAY150', 'Go Pay 150.000', 'saldo-emoney', 'GO PAY', 150475, 156494, 154989, 154989, 0, 0, 0, 'go_pay.png', 1, '2023-10-08', 4, 4),
(40299, 'gopay20.000', 'GOPAY20', 'Go Pay 20.000', 'saldo-emoney', 'GO PAY', 20460, 21278, 21074, 21074, 0, 0, 0, 'go_pay.png', 1, '2023-10-08', 4, 4),
(40301, 'gopay25.000', 'GOPAY25', 'Go Pay 25.000', 'saldo-emoney', 'GO PAY', 25460, 26478, 26224, 26224, 0, 0, 0, 'go_pay.png', 1, '2023-10-08', 4, 4),
(40303, 'gopay30.000', 'GOPAY30', 'Go Pay 30.000', 'saldo-emoney', 'GO PAY', 30475, 31694, 31389, 31389, 0, 0, 0, 'go_pay.png', 1, '2023-10-08', 4, 4),
(40304, 'gopay35.000', 'GOPAY35', 'Go Pay 35.000', 'saldo-emoney', 'GO PAY', 35475, 36894, 36539, 36539, 0, 0, 0, 'go_pay.png', 1, '2023-10-08', 4, 4),
(40305, 'gopay40.000', 'GOPAY40', 'Go Pay 40.000', 'saldo-emoney', 'GO PAY', 40370, 41985, 41581, 41581, 0, 0, 0, 'go_pay.png', 1, '2023-10-08', 4, 4),
(40306, 'gopay45.000', 'GOPAY45', 'Go Pay 45.000', 'saldo-emoney', 'GO PAY', 45400, 47216, 46762, 46762, 0, 0, 0, 'go_pay.png', 1, '2023-10-08', 4, 4),
(40307, 'gopay5.000', 'GOPAY5', 'Go Pay 5.000', 'saldo-emoney', 'GO PAY', 5405, 5621, 5567, 5567, 0, 0, 0, 'go_pay.png', 1, '2023-10-08', 4, 4),
(40308, 'gopay50.000', 'GOPAY50', 'Go Pay 50.000', 'saldo-emoney', 'GO PAY', 50475, 52494, 51989, 51989, 0, 0, 0, 'go_pay.png', 1, '2023-10-08', 4, 4),
(40310, 'gopay55.000', 'GOPAY55', 'Go Pay 55.000', 'saldo-emoney', 'GO PAY', 55370, 57585, 57031, 57031, 0, 0, 0, 'go_pay.png', 1, '2023-10-08', 4, 4),
(40311, 'gopay60.000', 'GOPAY60', 'Go Pay 60.000', 'saldo-emoney', 'GO PAY', 60450, 62868, 62264, 62264, 0, 0, 0, 'go_pay.png', 1, '2023-10-08', 4, 4),
(40312, 'gopay65.000', 'GOPAY65', 'Go Pay 65.000', 'saldo-emoney', 'GO PAY', 66050, 68692, 68032, 68032, 0, 0, 0, 'go_pay.png', 1, '2023-10-08', 4, 4),
(40313, 'gopay70.000', 'GOPAY70', 'Go Pay 70.000', 'saldo-emoney', 'GO PAY', 70475, 73294, 72589, 72589, 0, 0, 0, 'go_pay.png', 1, '2023-10-08', 4, 4),
(40314, 'gopay75.000', 'GOPAY75', 'Go Pay 75.000', 'saldo-emoney', 'GO PAY', 75425, 78442, 77688, 77688, 0, 0, 0, 'go_pay.png', 1, '2023-10-08', 4, 4),
(40315, 'gopay80.000', 'GOPAY80', 'Go Pay 80.000', 'saldo-emoney', 'GO PAY', 80475, 83694, 82889, 82889, 0, 0, 0, 'go_pay.png', 1, '2023-10-08', 4, 4),
(40316, 'gopay85.000', 'GOPAY85', 'Go Pay 85.000', 'saldo-emoney', 'GO PAY', 85475, 88894, 88039, 88039, 0, 0, 0, 'go_pay.png', 1, '2023-10-08', 4, 4),
(40317, 'gopay90.000', 'GOPAY90', 'Go Pay 90.000', 'saldo-emoney', 'GO PAY', 90455, 94073, 93169, 93169, 0, 0, 0, 'go_pay.png', 1, '2023-10-08', 4, 4),
(40318, 'gopay95.000', 'GOPAY95', 'Go Pay 95.000', 'saldo-emoney', 'GO PAY', 95370, 99185, 98231, 98231, 0, 0, 0, 'go_pay.png', 1, '2023-10-08', 4, 4),
(40319, 'gopaydriver10.000', 'GOPAYD10', 'Go Pay Driver 10.000', 'saldo-emoney', 'GO PAY DRIVER', 10250, 10250, 10250, 10250, 0, 0, 0, 'go_pay_driver.png', 1, '2023-10-08', 4, 4),
(40320, 'gopaydriver100.000', 'GOPAYD100', 'Go Pay Driver 100.000', 'saldo-emoney', 'GO PAY DRIVER', 100250, 100250, 100250, 100250, 0, 0, 0, 'go_pay_driver.png', 1, '2023-10-08', 4, 4),
(40321, 'gopaydriver15.000', 'GOPAYD15', 'Go Pay Driver 15.000', 'saldo-emoney', 'GO PAY DRIVER', 15250, 15250, 15250, 15250, 0, 0, 0, 'go_pay_driver.png', 1, '2023-10-08', 4, 4),
(40322, 'gopaydriver150.000', 'GOPAYD150', 'Go Pay Driver 150.000', 'saldo-emoney', 'GO PAY DRIVER', 150250, 150250, 150250, 150250, 0, 0, 0, 'go_pay_driver.png', 1, '2023-10-08', 4, 4),
(40323, 'gopaydriver20.000', 'GOPAYD20', 'Go Pay Driver 20.000', 'saldo-emoney', 'GO PAY DRIVER', 20250, 20250, 20250, 20250, 0, 0, 0, 'go_pay_driver.png', 1, '2023-10-08', 4, 4),
(40324, 'gopaydriver200.000', 'GOPAYD200', 'Go Pay Driver 200.000', 'saldo-emoney', 'GO PAY DRIVER', 200250, 200250, 200250, 200250, 0, 0, 0, 'go_pay_driver.png', 1, '2023-10-08', 4, 4),
(40325, 'gopaydriver25.000', 'GOPAYD25', 'Go Pay Driver 25.000', 'saldo-emoney', 'GO PAY DRIVER', 25250, 25250, 25250, 25250, 0, 0, 0, 'go_pay_driver.png', 1, '2023-10-08', 4, 4),
(40327, 'gopaydriver30.000', 'GOPAYD30', 'Go Pay Driver 30.000', 'saldo-emoney', 'GO PAY DRIVER', 30275, 30275, 30275, 30275, 0, 0, 0, 'go_pay_driver.png', 1, '2023-10-08', 4, 4),
(40329, 'gopaydriver35.000', 'GOPAYD35', 'Go Pay Driver 35.000', 'saldo-emoney', 'GO PAY DRIVER', 35275, 35275, 35275, 35275, 0, 0, 0, 'go_pay_driver.png', 1, '2023-10-08', 4, 4),
(40330, 'gopaydriver40.000', 'GOPAYD40', 'Go Pay Driver 40.000', 'saldo-emoney', 'GO PAY DRIVER', 40275, 40275, 40275, 40275, 0, 0, 0, 'go_pay_driver.png', 1, '2023-10-08', 4, 4),
(40331, 'gopaydriver45.000', 'GOPAYD45', 'Go Pay Driver 45.000', 'saldo-emoney', 'GO PAY DRIVER', 45325, 45325, 45325, 45325, 0, 0, 0, 'go_pay_driver.png', 1, '2023-10-08', 4, 4),
(40332, 'gopaydriver50.000', 'GOPAYD50', 'Go Pay Driver 50.000', 'saldo-emoney', 'GO PAY DRIVER', 50250, 50250, 50250, 50250, 0, 0, 0, 'go_pay_driver.png', 1, '2023-10-08', 4, 4),
(40334, 'gopaydriver55.000', 'GOPAYD55', 'Go Pay Driver 55.000', 'saldo-emoney', 'GO PAY DRIVER', 55300, 55300, 55300, 55300, 0, 0, 0, 'go_pay_driver.png', 1, '2023-10-08', 4, 4),
(40335, 'gopaydriver60.000', 'GOPAYD60', 'Go Pay Driver 60.000', 'saldo-emoney', 'GO PAY DRIVER', 60300, 60300, 60300, 60300, 0, 0, 0, 'go_pay_driver.png', 1, '2023-10-08', 4, 4),
(40336, 'gopaydriver65.000', 'GOPAYD65', 'Go Pay Driver 65.000', 'saldo-emoney', 'GO PAY DRIVER', 65300, 65300, 65300, 65300, 0, 0, 0, 'go_pay_driver.png', 1, '2023-10-08', 4, 4),
(40337, 'gopaydriver70.000', 'GOPAYD70', 'Go Pay Driver 70.000', 'saldo-emoney', 'GO PAY DRIVER', 70235, 70235, 70235, 70235, 0, 0, 0, 'go_pay_driver.png', 1, '2023-10-08', 4, 4),
(40338, 'gopaydriver75.000', 'GOPAYD75', 'Go Pay Driver 75.000', 'saldo-emoney', 'GO PAY DRIVER', 75250, 75250, 75250, 75250, 0, 0, 0, 'go_pay_driver.png', 1, '2023-10-08', 4, 4),
(40339, 'gopaydriver80.000', 'GOPAYD80', 'Go Pay Driver 80.000', 'saldo-emoney', 'GO PAY DRIVER', 80300, 80300, 80300, 80300, 0, 0, 0, 'go_pay_driver.png', 1, '2023-10-08', 4, 4),
(40340, 'gopaydriver85.000', 'GOPAYD85', 'Go Pay Driver 85.000', 'saldo-emoney', 'GO PAY DRIVER', 85300, 85300, 85300, 85300, 0, 0, 0, 'go_pay_driver.png', 1, '2023-10-08', 4, 4),
(40341, 'gopaydriver90.000', 'GOPAYD90', 'Go Pay Driver 90.000', 'saldo-emoney', 'GO PAY DRIVER', 90300, 90300, 90300, 90300, 0, 0, 0, 'go_pay_driver.png', 1, '2023-10-08', 4, 4),
(40342, 'gopaydriver95.000', 'GOPAYD95', 'Go Pay Driver 95.000', 'saldo-emoney', 'GO PAY DRIVER', 95300, 95300, 95300, 95300, 0, 0, 0, 'go_pay_driver.png', 1, '2023-10-08', 4, 4),
(40351, 'grabdriver100.000', 'GRABD100', 'Grab Driver 100.000', 'saldo-emoney', 'GRAB DRIVER', 101045, 101045, 101045, 101045, 0, 0, 0, 'grab_driver.png', 1, '2023-10-08', 4, 4),
(40352, 'grabdriver150.000', 'GRABD150', 'Grab Driver 150.000', 'saldo-emoney', 'GRAB DRIVER', 151045, 151045, 151045, 151045, 0, 0, 0, 'grab_driver.png', 1, '2023-10-08', 4, 4),
(40353, 'grabdriver200.000', 'GRABD200', 'Grab Driver 200.000', 'saldo-emoney', 'GRAB DRIVER', 201325, 201325, 201325, 201325, 0, 0, 0, 'grab_driver.png', 1, '2023-10-08', 4, 4),
(40354, 'grabdriver250.000', 'GRABD250', 'Grab Driver 250.000', 'saldo-emoney', 'GRAB DRIVER', 251325, 251325, 251325, 251325, 0, 0, 0, 'grab_driver.png', 1, '2023-10-08', 4, 4),
(40355, 'grabdriver50.000', 'GRABD50', 'Grab Driver 50.000', 'saldo-emoney', 'GRAB DRIVER', 50945, 50945, 50945, 50945, 0, 0, 0, 'grab_driver.png', 1, '2023-10-08', 4, 4),
(40356, 'grabpenumpang100.000', 'GRAB100', 'Grab Penumpang 100.000', 'saldo-emoney', 'GRAB', 100060, 104062, 103062, 103062, 0, 0, 0, 'grab.png', 1, '2023-10-08', 4, 4),
(40357, 'grabpenumpang150.000', 'GRAB150', 'Grab Penumpang 150.000', 'saldo-emoney', 'GRAB', 150875, 156910, 155401, 155401, 0, 0, 0, 'grab.png', 1, '2023-10-08', 4, 4),
(40358, 'grabpenumpang20.000', 'GRAB20', 'Grab Penumpang 20.000', 'saldo-emoney', 'GRAB', 20045, 20847, 20646, 20646, 0, 0, 0, 'grab.png', 1, '2023-10-08', 4, 4),
(40359, 'grabpenumpang200.000', 'GRAB200', 'Grab Penumpang 200.000', 'saldo-emoney', 'GRAB', 200950, 208988, 206979, 206979, 0, 0, 0, 'grab.png', 1, '2023-10-08', 4, 4),
(40360, 'grabpenumpang25.000', 'GRAB25', 'Grab Penumpang 25.000', 'saldo-emoney', 'GRAB', 25045, 26047, 25796, 25796, 0, 0, 0, 'grab.png', 1, '2023-10-08', 4, 4),
(40361, 'grabpenumpang40.000', 'GRAB40', 'Grab Penumpang 40.000', 'saldo-emoney', 'GRAB', 40060, 41662, 41262, 41262, 0, 0, 0, 'grab.png', 1, '2023-10-08', 4, 4),
(40362, 'grabpenumpang50.000', 'GRAB50', 'Grab Penumpang 50.000', 'saldo-emoney', 'GRAB', 50060, 52062, 51562, 51562, 0, 0, 0, 'grab.png', 1, '2023-10-08', 4, 4),
(40363, 'grabpenumpang75.000', 'GRAB75', 'Grab Penumpang 75.000', 'saldo-emoney', 'GRAB', 75060, 78062, 77312, 77312, 0, 0, 0, 'grab.png', 1, '2023-10-08', 4, 4),
(40366, 'indosat10.000', 'I10', 'Indosat 10.000', 'pulsa-reguler', 'INDOSAT', 10830, 11263, 11155, 11155, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40368, 'indosat10.000', 'I102', 'Indosat 10.000', 'pulsa-reguler', 'INDOSAT', 10945, 11383, 11273, 11273, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40369, 'indosat100.000', 'I100', 'Indosat 100.000', 'pulsa-reguler', 'INDOSAT', 96800, 100672, 99704, 99704, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40370, 'indosat12.000', 'I12', 'Indosat 12.000', 'pulsa-reguler', 'INDOSAT', 12150, 12636, 12515, 12515, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40371, 'indosat125.000', 'I125', 'Indosat 125.000', 'pulsa-reguler', 'INDOSAT', 121575, 126438, 125222, 125222, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40372, 'indosat1250smssesama+250smsoperatorlain/30hari', 'ISMS150030', 'Indosat 1250 SMS Sesama + 250 SMS Operator Lain / 30 Hari', 'paket-telepon', 'INDOSAT', 10205, 10613, 10511, 10511, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40373, 'indosat15.000', 'I15', 'Indosat 15.000', 'pulsa-reguler', 'INDOSAT', 15300, 15912, 15759, 15759, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40374, 'indosat150.000', 'I150', 'Indosat 150.000', 'pulsa-reguler', 'INDOSAT', 144950, 150748, 149299, 149299, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40375, 'indosat175.000', 'I175', 'Indosat 175.000', 'pulsa-reguler', 'INDOSAT', 168000, 174720, 173040, 173040, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40377, 'indosat20.000', 'I20', 'Indosat 20.000', 'pulsa-reguler', 'INDOSAT', 20520, 21341, 21136, 21136, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40378, 'indosat200.000', 'I200', 'Indosat 200.000', 'pulsa-reguler', 'INDOSAT', 186865, 194340, 192471, 192471, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40379, 'indosat2000smssesama+500smsoperatorlain', 'ISMS2500', 'Indosat 2000 SMS Sesama + 500 SMS Operator Lain', 'paket-telepon', 'INDOSAT', 28025, 29146, 28866, 28866, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40380, 'indosat25.000', 'I25', 'Indosat 25.000', 'pulsa-reguler', 'INDOSAT', 25025, 26026, 25776, 25776, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40382, 'indosat30.000', 'I30', 'Indosat 30.000', 'pulsa-reguler', 'INDOSAT', 29805, 30997, 30699, 30699, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40384, 'indosat40.000', 'I40', 'Indosat 40.000', 'pulsa-reguler', 'INDOSAT', 39560, 41142, 40747, 40747, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40385, 'indosat5.000', 'IM5', 'Indosat 5.000', 'pulsa-reguler', 'INDOSAT', 5885, 6120, 6062, 6062, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40386, 'indosat5.000', 'IP5', 'Indosat 5.000', 'pulsa-reguler', 'INDOSAT', 5909, 6145, 6086, 6086, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40387, 'indosat50.000', 'I50', 'Indosat 50.000', 'pulsa-reguler', 'INDOSAT', 49650, 51636, 51140, 51140, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40389, 'indosat60.000', 'I60', 'Indosat 60.000', 'pulsa-reguler', 'INDOSAT', 58790, 61142, 60554, 60554, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40390, 'indosat600smssesama+200smsoperatorlain', 'ISMS800', 'Indosat 600 SMS Sesama + 200 SMS Operator Lain', 'paket-telepon', 'INDOSAT', 11810, 12282, 12164, 12164, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40391, 'indosat80.000', 'I80', 'Indosat 80.000', 'pulsa-reguler', 'INDOSAT', 78725, 81874, 81087, 81087, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40392, 'indosat90.000', 'I90', 'Indosat 90.000', 'pulsa-reguler', 'INDOSAT', 87275, 90766, 89893, 89893, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40397, 'indosatfreedom10gb/30hari', 'IDFI102', 'Indosat Freedom 10 GB / 30 Hari', 'paket-internet', 'INDOSAT', 40175, 41782, 41380, 41380, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40405, 'indosatfreedom3gb/30hari', 'IDFI330', 'Indosat Freedom 3 GB / 30 Hari', 'paket-internet', 'INDOSAT', 17900, 18616, 18437, 18437, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40406, 'indosatfreedom30gb/30hari', 'IDFI3030', 'Indosat Freedom 30 GB / 30 Hari', 'paket-internet', 'INDOSAT', 88400, 91936, 91052, 91052, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40407, 'indosatfreedom4gb/30hari', 'IDFI430', 'Indosat Freedom 4 GB / 30 Hari', 'paket-internet', 'INDOSAT', 25800, 26832, 26574, 26574, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40409, 'indosatfreedom50gb/30hari', 'IDFI5030', 'Indosat Freedom 50 GB / 30 Hari', 'paket-internet', 'INDOSAT', 119150, 123916, 122725, 122725, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40410, 'indosatfreedom8gb/30hari', 'IDFI830', 'Indosat Freedom 8 GB / 30 Hari', 'paket-internet', 'INDOSAT', 37025, 38506, 38136, 38136, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40412, 'indosatfreedomcombo14gb/30hari', 'IDFC14', 'Indosat Freedom Combo 14 GB / 30 Hari', 'paket-internet', 'INDOSAT', 56550, 58812, 58247, 58247, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40413, 'indosatfreedomcombo20gb/30hari', 'IDFC20', 'Indosat Freedom Combo 20 GB / 30 Hari', 'paket-internet', 'INDOSAT', 64222, 66791, 66149, 66149, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40414, 'indosatfreedomcombo30gb/30hari', 'IDFC30', 'Indosat Freedom Combo 30 GB / 30 Hari', 'paket-internet', 'INDOSAT', 85825, 89258, 88400, 88400, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40416, 'indosatfreedomcombo40gb/30hari', 'IDFC40', 'Indosat Freedom Combo 40 GB / 30 Hari', 'paket-internet', 'INDOSAT', 98975, 102934, 101944, 101944, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40417, 'indosatfreedomcombo50gb/30hari', 'IDFC50', 'Indosat Freedom Combo 50 GB / 30 Hari', 'paket-internet', 'INDOSAT', 133150, 138476, 137145, 137145, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40419, 'indosatfreedomcombo6gb/30hari', 'IDFC6', 'Indosat Freedom Combo 6 GB / 30 Hari', 'paket-internet', 'INDOSAT', 31995, 33275, 32955, 32955, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40420, 'indosatfreedomcombo8gb/30hari', 'IDFC8', 'Indosat Freedom Combo 8 GB / 30 Hari', 'paket-internet', 'INDOSAT', 39900, 41496, 41097, 41097, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40421, 'indosatfreedomkuotaharian14gb/14hari', 'IFH1414', 'Indosat Freedom Kuota Harian 14 GB / 14 Hari', 'paket-internet', 'INDOSAT', 46300, 48152, 47689, 47689, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40422, 'indosatfreedomkuotaharian28gb/28hari', 'IFH2828', 'Indosat Freedom Kuota Harian 28 GB / 28 Hari', 'paket-internet', 'INDOSAT', 83475, 86814, 85979, 85979, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40423, 'indosatfreedomkuotaharian7gb/7hari', 'IFH77', 'Indosat Freedom Kuota Harian 7 GB / 7 Hari', 'paket-internet', 'INDOSAT', 26510, 27570, 27305, 27305, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40424, 'indosatfreedoml', 'IDF1', 'Indosat Freedom L', 'paket-internet', 'INDOSAT', 102800, 106912, 105884, 105884, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40425, 'indosatfreedomlonglife12gb/90hari', 'IDFL12', 'Indosat Freedom Longlife 12 GB / 90 Hari', 'paket-internet', 'INDOSAT', 64275, 66846, 66203, 66203, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40426, 'indosatfreedomlonglife20gb/60hari', 'IDFL20', 'Indosat Freedom Longlife 20 GB / 60 Hari', 'paket-internet', 'INDOSAT', 85375, 88790, 87936, 87936, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40427, 'indosatfreedomlonglife30gb/90hari', 'IDFL30', 'Indosat Freedom Longlife 30 GB / 90 Hari', 'paket-internet', 'INDOSAT', 118625, 123370, 122184, 122184, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40428, 'indosatfreedomlonglife36gb/60hari', 'IDFL36', 'Indosat Freedom Longlife 36 GB / 60 Hari', 'paket-internet', 'INDOSAT', 123150, 128076, 126845, 126845, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40429, 'indosatfreedomlonglife54gb/90hari', 'IDFL54', 'Indosat Freedom Longlife 54 GB / 90 Hari', 'paket-internet', 'INDOSAT', 170275, 177086, 175383, 175383, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40431, 'indosatfreedomm', 'IDF2', 'Indosat Freedom M', 'paket-internet', 'INDOSAT', 65950, 68588, 67929, 67929, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40432, 'indosatfreedomu1gb+2gbapps/7hari', 'IDIU12', 'Indosat Freedom U 1 GB + 2 GB Apps / 7 Hari', 'paket-internet', 'INDOSAT', 14910, 15506, 15357, 15357, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40433, 'indosatfreedomu1gb+4.5gbapps/30hari', 'IDIU1', 'Indosat Freedom U 1 GB + 4.5 GB Apps / 30 Hari', 'paket-internet', 'INDOSAT', 31835, 33108, 32790, 32790, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40434, 'indosatfreedomu10gb+25gbapps/30hari', 'IDIU10', 'Indosat Freedom U 10 GB + 25 GB Apps / 30 Hari', 'paket-internet', 'INDOSAT', 92675, 96382, 95455, 95455, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40435, 'indosatfreedomu15gb+25gbapps/30hari', 'IDIU152', 'Indosat Freedom U 15 GB + 25 GB Apps / 30 Hari', 'paket-internet', 'INDOSAT', 124675, 129662, 128415, 128415, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40438, 'indosatfreedomu2gb+7.5gbapps/30hari', 'IDIU2752', 'Indosat Freedom U 2 GB + 7.5 GB Apps / 30 Hari', 'paket-internet', 'INDOSAT', 49627, 51612, 51116, 51116, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40439, 'indosatfreedomu3gb+15gbapps/30hari', 'IDIU32', 'Indosat Freedom U 3 GB + 15 GB Apps / 30 Hari', 'paket-internet', 'INDOSAT', 69750, 72540, 71843, 71843, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40440, 'indosatfreedomu3gb+15gbapps/30hari', 'IDIU3', 'Indosat Freedom U 3 GB + 15 GB Apps / 30 Hari', 'paket-internet', 'INDOSAT', 73650, 76596, 75860, 75860, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40441, 'indosatfreedomu5gb/30hari', 'IDIU530', 'Indosat Freedom U 5 GB / 30 Hari', 'paket-internet', 'INDOSAT', 72575, 75478, 74752, 74752, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40442, 'indosatfreedomu7gb+20gbapps/30hari', 'IDIU72', 'Indosat Freedom U 7 GB + 20 GB Apps / 30 Hari', 'paket-internet', 'INDOSAT', 90650, 94276, 93370, 93370, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40443, 'indosatfreedomu7gb+20gbapps/30hari', 'IDIU7', 'Indosat Freedom U 7 GB + 20 GB Apps / 30 Hari', 'paket-internet', 'INDOSAT', 95550, 99372, 98417, 98417, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40444, 'indosatfreedomxl', 'IDF3', 'Indosat Freedom XL', 'paket-internet', 'INDOSAT', 198875, 206830, 204841, 204841, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40446, 'indosatpulsatransfer10.000', 'IT10', 'Indosat Pulsa Transfer 10.000', 'pulsa-transfer', 'INDOSAT', 9995, 10395, 10295, 10295, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40447, 'indosatpulsatransfer100.000', 'IT100', 'Indosat Pulsa Transfer 100.000', 'pulsa-transfer', 'INDOSAT', 92325, 96018, 95095, 95095, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40448, 'indosatpulsatransfer15.000', 'IT15', 'Indosat Pulsa Transfer 15.000', 'pulsa-transfer', 'INDOSAT', 14470, 15049, 14904, 14904, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40449, 'indosatpulsatransfer150.000', 'IT150', 'Indosat Pulsa Transfer 150.000', 'pulsa-transfer', 'INDOSAT', 137260, 142750, 141378, 141378, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40450, 'indosatpulsatransfer20.000', 'IT20', 'Indosat Pulsa Transfer 20.000', 'pulsa-transfer', 'INDOSAT', 18880, 19635, 19446, 19446, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40451, 'indosatpulsatransfer25.000', 'IT25', 'Indosat Pulsa Transfer 25.000', 'pulsa-transfer', 'INDOSAT', 23868, 24823, 24584, 24584, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40452, 'indosatpulsatransfer30.000', 'IT30', 'Indosat Pulsa Transfer 30.000', 'pulsa-transfer', 'INDOSAT', 28353, 29487, 29204, 29204, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40453, 'indosatpulsatransfer40.000', 'IT40', 'Indosat Pulsa Transfer 40.000', 'pulsa-transfer', 'INDOSAT', 37303, 38795, 38422, 38422, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40455, 'indosatpulsatransfer60.000', 'IT60', 'Indosat Pulsa Transfer 60.000', 'pulsa-transfer', 'INDOSAT', 55541, 57763, 57207, 57207, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40456, 'indosatpulsatransfer70.000', 'IT70', 'Indosat Pulsa Transfer 70.000', 'pulsa-transfer', 'INDOSAT', 64600, 67184, 66538, 66538, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40457, 'indosatpulsatransfer80.000', 'IT80', 'Indosat Pulsa Transfer 80.000', 'pulsa-transfer', 'INDOSAT', 73155, 76081, 75350, 75350, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40458, 'indosatpulsatransfer90.000', 'IT90', 'Indosat Pulsa Transfer 90.000', 'pulsa-transfer', 'INDOSAT', 82331, 85624, 84801, 84801, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40462, 'indosattelepon1000menitsesama/1hari', 'ITLP10001', 'Indosat Telepon 1000 Menit Sesama / 1 Hari', 'paket-telepon', 'INDOSAT', 5810, 6042, 5984, 5984, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40463, 'indosattelepon250menitsesama/30hari', 'ITLP25030', 'Indosat Telepon 250 Menit Sesama / 30 Hari', 'paket-telepon', 'INDOSAT', 29175, 30342, 30050, 30050, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40464, 'indosattelepon300menitsesama/7hari', 'ITLP3007', 'Indosat Telepon 300 Menit Sesama / 7 Hari', 'paket-telepon', 'INDOSAT', 15160, 15766, 15615, 15615, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40465, 'indosatteleponunlimitedsesama+250menitsemuaop/30hari', 'ITLPU25030', 'Indosat Telepon Unlimited Sesama + 250 Menit Semua Op / 30 Hari', 'paket-telepon', 'INDOSAT', 47300, 49192, 48719, 48719, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40466, 'indosatteleponunlimitedsesama+30menitsemuaop/14hari', 'ITLPU3014', 'Indosat Telepon Unlimited Sesama + 30 Menit Semua Op / 14 Hari', 'paket-telepon', 'INDOSAT', 15595, 16219, 16063, 16063, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40467, 'indosatteleponunlimitedsesama+30menitsemuaop/7hari', 'ITLPU307', 'Indosat Telepon Unlimited Sesama + 30 Menit Semua Op / 7 Hari', 'paket-telepon', 'INDOSAT', 12750, 13260, 13133, 13133, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40468, 'indosatteleponunlimitedsesama+5menitsemuaop/1hari', 'ITLPU51', 'Indosat Telepon Unlimited Sesama + 5 Menit Semua Op / 1 Hari', 'paket-telepon', 'INDOSAT', 3640, 3786, 3749, 3749, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40469, 'indosatteleponunlimitedsesama+50menitsemuaop/7hari', 'ITLPU507', 'Indosat Telepon Unlimited Sesama + 50 Menit Semua Op / 7 Hari', 'paket-telepon', 'INDOSAT', 16650, 17316, 17150, 17150, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40470, 'indosatteleponunlimitedsesama+60menitsemuaop/30hari', 'ITLPU6030', 'Indosat Telepon Unlimited Sesama + 60 Menit Semua Op / 30 Hari', 'paket-telepon', 'INDOSAT', 24340, 25314, 25070, 25070, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40471, 'indosatteleponunlimitedsesama/30hari', 'ITLPU30', 'Indosat Telepon Unlimited Sesama / 30 Hari', 'paket-telepon', 'INDOSAT', 8950, 9308, 9219, 9219, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40472, 'indosatyellow1gb/1hari', 'IDY11', 'Indosat Yellow 1 GB / 1 Hari', 'paket-internet', 'INDOSAT', 3925, 4082, 4043, 4043, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40473, 'indosatyellow1gb/15hari', 'IDY115', 'Indosat Yellow 1 GB / 15 Hari', 'paket-internet', 'INDOSAT', 8285, 8616, 8534, 8534, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40475, 'indosatyellow1gb/3hari', 'IDY13', 'Indosat Yellow 1 GB / 3 Hari', 'paket-internet', 'INDOSAT', 4484, 4663, 4619, 4619, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40476, 'indosatyellow1gb/7hari', 'IDY17', 'Indosat Yellow 1 GB / 7 Hari', 'paket-internet', 'INDOSAT', 8155, 8481, 8400, 8400, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40478, 'indosatyellow2gb/3hari', 'IDY23', 'Indosat Yellow 2 GB / 3 Hari', 'paket-internet', 'INDOSAT', 5355, 5569, 5516, 5516, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40479, 'indosatyellow2gb/7hari', 'IDY27', 'Indosat Yellow 2 GB / 7 Hari', 'paket-internet', 'INDOSAT', 8005, 8325, 8245, 8245, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40480, 'indosatyellow3gb/3hari', 'IDY33', 'Indosat Yellow 3 GB / 3 Hari', 'paket-internet', 'INDOSAT', 5445, 5663, 5608, 5608, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40481, 'indosatyellow3gb/7hari', 'IDY37', 'Indosat Yellow 3 GB / 7 Hari', 'paket-internet', 'INDOSAT', 9980, 10379, 10279, 10279, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40484, 'indosatyellowgift1gb/1hari', 'IDYG11', 'Indosat Yellow Gift 1 GB / 1 Hari', 'paket-internet', 'INDOSAT', 3805, 3957, 3919, 3919, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40485, 'indosatyellowgift1gb/15hari', 'IDYG115', 'Indosat Yellow Gift 1 GB / 15 Hari', 'paket-internet', 'INDOSAT', 13160, 13686, 13555, 13555, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40487, 'indosatyellowgift1gb/7hari', 'IDYG17', 'Indosat Yellow Gift 1 GB / 7 Hari', 'paket-internet', 'INDOSAT', 8450, 8788, 8704, 8704, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40488, 'indosatyellowgift2gb/3hari', 'IDYG23', 'Indosat Yellow Gift 2 GB / 3 Hari', 'paket-internet', 'INDOSAT', 4815, 5008, 4959, 4959, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40490, 'indosatyellowgift700mb/1hari', 'IDYG7', 'Indosat Yellow Gift 700 MB / 1 Hari', 'paket-internet', 'INDOSAT', 3485, 3624, 3590, 3590, 0, 0, 0, 'indosat.png', 1, '2023-10-08', 4, 3),
(40492, 'k-vision&golpaketbein(bein)30hari', 'KVISIONBEIN', 'K-VISION & GOL Paket Bein (BEIN) 30 Hari', 'streaming-tv', 'K-VISION DAN GOL', 73275, 73275, 73275, 73275, 0, 0, 0, 'k-vision_dan_gol.png', 1, '2023-10-08', 4, 3),
(40493, 'k-vision&golpaketgilabola(gb01)30hari', 'KVISIONGB01', 'K-VISION & GOL PAKET GILA BOLA (GB01) 30 Hari', 'streaming-tv', 'K-VISION DAN GOL', 34860, 34860, 34860, 34860, 0, 0, 0, 'k-vision_dan_gol.png', 1, '2023-10-08', 4, 3),
(40494, 'k-vision&golpaketjawa(jw01)30hari', 'KVISIONJW01', 'K-VISION & GOL Paket Jawa (JW01) 30 Hari', 'streaming-tv', 'K-VISION DAN GOL', 22400, 22400, 22400, 22400, 0, 0, 0, 'k-vision_dan_gol.png', 1, '2023-10-08', 4, 3),
(40495, 'k-vision&golpaketjuara(j01)30hari', 'KVISIONJ01', 'K-VISION & GOL PAKET JUARA (J01) 30 Hari', 'streaming-tv', 'K-VISION DAN GOL', 177260, 177260, 177260, 177260, 0, 0, 0, 'k-vision_dan_gol.png', 1, '2023-10-08', 4, 3),
(40496, 'k-vision&golpaketjuara(j03)90hari', 'KVISIONJ03', 'K-VISION & GOL PAKET JUARA (J03) 90 Hari', 'streaming-tv', 'K-VISION DAN GOL', 444260, 444260, 444260, 444260, 0, 0, 0, 'k-vision_dan_gol.png', 1, '2023-10-08', 4, 3),
(40497, 'k-vision&golpaketjuara(j06)180hari', 'KVISIONJ06', 'K-VISION & GOL PAKET JUARA (J06) 180 Hari', 'streaming-tv', 'K-VISION DAN GOL', 800260, 800260, 800260, 800260, 0, 0, 0, 'k-vision_dan_gol.png', 1, '2023-10-08', 4, 3);
INSERT INTO `tb_prepaid` (`cuid`, `slug`, `code`, `title`, `kategori`, `brand`, `harga_modal`, `harga_jual`, `harga_reseller`, `harga_h2h`, `harga_coret`, `komisi`, `poin`, `image`, `status`, `created_date`, `jenis`, `product_type`) VALUES
(40498, 'k-vision&golpaketjuara(j12)360hari', 'KVISIONJ12', 'K-VISION & GOL PAKET JUARA (J12) 360 Hari', 'streaming-tv', 'K-VISION DAN GOL', 1334260, 1334260, 1334260, 1334260, 0, 0, 0, 'k-vision_dan_gol.png', 1, '2023-10-08', 4, 3),
(40499, 'k-vision&golpaketolahraga(g01)30hari', 'KVISIONG01', 'K-VISION & GOL PAKET OLAHRAGA (G01) 30 Hari', 'streaming-tv', 'K-VISION DAN GOL', 111400, 111400, 111400, 111400, 0, 0, 0, 'k-vision_dan_gol.png', 1, '2023-10-08', 4, 3),
(40500, 'k-vision100.000', 'KVISION100', 'K-VISION 100.000', 'streaming-tv', 'K-VISION DAN GOL', 89150, 89150, 89150, 89150, 0, 0, 0, 'k-vision_dan_gol.png', 1, '2023-10-08', 4, 3),
(40501, 'k-vision125.000', 'KVISION125', 'K-VISION 125.000', 'streaming-tv', 'K-VISION DAN GOL', 111400, 111400, 111400, 111400, 0, 0, 0, 'k-vision_dan_gol.png', 1, '2023-10-08', 4, 3),
(40502, 'k-vision150.000', 'KVISION150', 'K-VISION 150.000', 'streaming-tv', 'K-VISION DAN GOL', 133650, 133650, 133650, 133650, 0, 0, 0, 'k-vision_dan_gol.png', 1, '2023-10-08', 4, 3),
(40503, 'k-vision180.000', 'KVISION180', 'K-VISION 180.000', 'streaming-tv', 'K-VISION DAN GOL', 160350, 160350, 160350, 160350, 0, 0, 0, 'k-vision_dan_gol.png', 1, '2023-10-08', 4, 3),
(40504, 'k-vision200.000', 'KVISION200', 'K-VISION 200.000', 'streaming-tv', 'K-VISION DAN GOL', 178150, 178150, 178150, 178150, 0, 0, 0, 'k-vision_dan_gol.png', 1, '2023-10-08', 4, 3),
(40505, 'k-vision250.000', 'KVISION250', 'K-VISION 250.000', 'streaming-tv', 'K-VISION DAN GOL', 225150, 225150, 225150, 225150, 0, 0, 0, 'k-vision_dan_gol.png', 1, '2023-10-08', 4, 3),
(40506, 'k-vision300.000', 'KVISION300', 'K-VISION 300.000', 'streaming-tv', 'K-VISION DAN GOL', 267150, 267150, 267150, 267150, 0, 0, 0, 'k-vision_dan_gol.png', 1, '2023-10-08', 4, 3),
(40507, 'k-vision50.000', 'KVISION50', 'K-VISION 50.000', 'streaming-tv', 'K-VISION DAN GOL', 44650, 44650, 44650, 44650, 0, 0, 0, 'k-vision_dan_gol.png', 1, '2023-10-08', 4, 3),
(40508, 'k-vision540.000', 'KVISION540', 'K-VISION 540.000', 'streaming-tv', 'K-VISION DAN GOL', 480750, 480750, 480750, 480750, 0, 0, 0, 'k-vision_dan_gol.png', 1, '2023-10-08', 4, 3),
(40509, 'k-vision80.000', 'KVISION80', 'K-VISION 80.000', 'streaming-tv', 'K-VISION DAN GOL', 71350, 71350, 71350, 71350, 0, 0, 0, 'k-vision_dan_gol.png', 1, '2023-10-08', 4, 3),
(40510, 'linkajarp10.000', 'LINKAJA10', 'LinkAja Rp 10.000', 'saldo-emoney', 'LINKAJA', 10255, 10665, 10563, 10563, 0, 0, 0, 'linkaja.png', 1, '2023-10-08', 4, 4),
(40512, 'linkajarp15.000', 'LINKAJA', 'LinkAja Rp 15.000', 'saldo-emoney', 'LINKAJA', 14660, 15246, 15100, 15100, 0, 0, 0, 'linkaja.png', 1, '2023-10-08', 4, 4),
(40514, 'linkajarp20.000', 'LINKAJA20', 'LinkAja Rp 20.000', 'saldo-emoney', 'LINKAJA', 20200, 21008, 20806, 20806, 0, 0, 0, 'linkaja.png', 1, '2023-10-08', 4, 4),
(40516, 'linkajarp25.000', 'LINKAJA25', 'LinkAja Rp 25.000', 'saldo-emoney', 'LINKAJA', 24365, 25340, 25096, 25096, 0, 0, 0, 'linkaja.png', 1, '2023-10-08', 4, 4),
(40518, 'linkajarp30.000', 'LINKAJA30', 'LinkAja Rp 30.000', 'saldo-emoney', 'LINKAJA', 30215, 31424, 31121, 31121, 0, 0, 0, 'linkaja.png', 1, '2023-10-08', 4, 4),
(40519, 'linkajarp40.000', 'LINKAJA40', 'LinkAja Rp 40.000', 'saldo-emoney', 'LINKAJA', 39380, 40955, 40561, 40561, 0, 0, 0, 'linkaja.png', 1, '2023-10-08', 4, 4),
(40520, 'linkajarp50.000', 'LINKAJA50', 'LinkAja Rp 50.000', 'saldo-emoney', 'LINKAJA', 49380, 51355, 50861, 50861, 0, 0, 0, 'linkaja.png', 1, '2023-10-08', 4, 4),
(40521, 'linkajarp60.000', 'LINKAJA60', 'LinkAja Rp 60.000', 'saldo-emoney', 'LINKAJA', 59380, 61755, 61161, 61161, 0, 0, 0, 'linkaja.png', 1, '2023-10-08', 4, 4),
(40522, 'linkajarp70.000', 'LINKAJA70', 'LinkAja Rp 70.000', 'saldo-emoney', 'LINKAJA', 69275, 72046, 71353, 71353, 0, 0, 0, 'linkaja.png', 1, '2023-10-08', 4, 4),
(40523, 'linkajarp80.000', 'LINKAJA80', 'LinkAja Rp 80.000', 'saldo-emoney', 'LINKAJA', 79380, 82555, 81761, 81761, 0, 0, 0, 'linkaja.png', 1, '2023-10-08', 4, 4),
(40524, 'linkajarp90.000', 'LINKAJA90', 'LinkAja Rp 90.000', 'saldo-emoney', 'LINKAJA', 89380, 92955, 92061, 92061, 0, 0, 0, 'linkaja.png', 1, '2023-10-08', 4, 4),
(40533, 'mandirie-toll10.000', 'MANDIRIETOLL10', 'Mandiri E-Toll 10.000', 'saldo-emoney', 'MANDIRI E-TOLL', 11100, 11544, 11433, 11433, 0, 0, 0, 'mandiri_e-toll.png', 1, '2023-10-08', 4, 4),
(40535, 'mandirie-toll150.000', 'MANDIRIETOLL150', 'Mandiri E-Toll 150.000', 'saldo-emoney', 'MANDIRI E-TOLL', 150675, 156702, 155195, 155195, 0, 0, 0, 'mandiri_e-toll.png', 1, '2023-10-08', 4, 4),
(40536, 'mandirie-toll20.000', 'MANDIRIETOLL20', 'Mandiri E-Toll 20.000', 'saldo-emoney', 'MANDIRI E-TOLL', 21100, 21944, 21733, 21733, 0, 0, 0, 'mandiri_e-toll.png', 1, '2023-10-08', 4, 4),
(40539, 'mandirie-toll30.000', 'MANDIRIETOLL30', 'Mandiri E-Toll 30.000', 'saldo-emoney', 'MANDIRI E-TOLL', 31125, 32370, 32059, 32059, 0, 0, 0, 'mandiri_e-toll.png', 1, '2023-10-08', 4, 4),
(40540, 'mandirie-toll40.000', 'MANDIRIETOLL40', 'Mandiri E-Toll 40.000', 'saldo-emoney', 'MANDIRI E-TOLL', 41125, 42770, 42359, 42359, 0, 0, 0, 'mandiri_e-toll.png', 1, '2023-10-08', 4, 4),
(40542, 'mandirie-toll75.000', 'MANDIRIETOLL75', 'Mandiri E-Toll 75.000', 'saldo-emoney', 'MANDIRI E-TOLL', 76100, 79144, 78383, 78383, 0, 0, 0, 'mandiri_e-toll.png', 1, '2023-10-08', 4, 4),
(40543, 'maximdriver10.000', 'MAXIMDRIVER10', 'Maxim Driver 10.000', 'saldo-emoney', 'MAXIM', 10750, 11180, 11073, 11073, 0, 0, 0, 'maxim.png', 1, '2023-10-08', 4, 4),
(40544, 'maximdriver100.000', 'MAXIMDRIVER100', 'Maxim Driver 100.000', 'saldo-emoney', 'MAXIM', 100950, 104988, 103979, 103979, 0, 0, 0, 'maxim.png', 1, '2023-10-08', 4, 4),
(40545, 'maximdriver15.000', 'MAXIMDRIVER15', 'Maxim Driver 15.000', 'saldo-emoney', 'MAXIM', 15950, 16588, 16429, 16429, 0, 0, 0, 'maxim.png', 1, '2023-10-08', 4, 4),
(40546, 'maximdriver20.000', 'MAXIMDRIVER20', 'Maxim Driver 20.000', 'saldo-emoney', 'MAXIM', 20950, 21788, 21579, 21579, 0, 0, 0, 'maxim.png', 1, '2023-10-08', 4, 4),
(40547, 'maximdriver25.000', 'MAXIMDRIVER25', 'Maxim Driver 25.000', 'saldo-emoney', 'MAXIM', 25950, 26988, 26729, 26729, 0, 0, 0, 'maxim.png', 1, '2023-10-08', 4, 4),
(40548, 'maximdriver30.000', 'MAXIMDRIVER30', 'Maxim Driver 30.000', 'saldo-emoney', 'MAXIM', 30950, 32188, 31879, 31879, 0, 0, 0, 'maxim.png', 1, '2023-10-08', 4, 4),
(40549, 'maximdriver35.000', 'MAXIMDRIVER35', 'Maxim Driver 35.000', 'saldo-emoney', 'MAXIM', 35950, 37388, 37029, 37029, 0, 0, 0, 'maxim.png', 1, '2023-10-08', 4, 4),
(40550, 'maximdriver40.000', 'MAXIMDRIVER40', 'Maxim Driver 40.000', 'saldo-emoney', 'MAXIM', 40950, 42588, 42179, 42179, 0, 0, 0, 'maxim.png', 1, '2023-10-08', 4, 4),
(40551, 'maximdriver45.000', 'MAXIMDRIVER45', 'Maxim Driver 45.000', 'saldo-emoney', 'MAXIM', 45950, 47788, 47329, 47329, 0, 0, 0, 'maxim.png', 1, '2023-10-08', 4, 4),
(40552, 'maximdriver50.000', 'MAXIMDRIVER50', 'Maxim Driver 50.000', 'saldo-emoney', 'MAXIM', 50950, 52988, 52479, 52479, 0, 0, 0, 'maxim.png', 1, '2023-10-08', 4, 4),
(40553, 'maximdriver60.000', 'MAXIMDRIVER60', 'Maxim Driver 60.000', 'saldo-emoney', 'MAXIM', 60950, 63388, 62779, 62779, 0, 0, 0, 'maxim.png', 1, '2023-10-08', 4, 4),
(40554, 'maximdriver70.000', 'MAXIMDRIVER70', 'Maxim Driver 70.000', 'saldo-emoney', 'MAXIM', 70950, 73788, 73079, 73079, 0, 0, 0, 'maxim.png', 1, '2023-10-08', 4, 4),
(40555, 'maximdriver80.000', 'MAXIMDRIVER80', 'Maxim Driver 80.000', 'saldo-emoney', 'MAXIM', 80950, 84188, 83379, 83379, 0, 0, 0, 'maxim.png', 1, '2023-10-08', 4, 4),
(40556, 'maximdriver90.000', 'MAXIMDRIVER90', 'Maxim Driver 90.000', 'saldo-emoney', 'MAXIM', 90950, 94588, 93679, 93679, 0, 0, 0, 'maxim.png', 1, '2023-10-08', 4, 4),
(40618, 'nexparabolapaketchampions+ligaindonesia1musim(2500)', 'NEXCHAMPS2500', 'Nex Parabola Paket Champions + Liga Indonesia 1 Musim (2500)', 'streaming-tv', 'NEX PARABOLA', 559960, 559960, 559960, 559960, 0, 0, 0, 'nex_parabola.png', 1, '2023-10-08', 4, 3),
(40619, 'nexparabolapaketchampions+ligaindonesia180hari(2506)', 'NEXCHAMPS2506', 'Nex Parabola Paket Champions + Liga Indonesia 180 Hari (2506)', 'streaming-tv', 'NEX PARABOLA', 319660, 319660, 319660, 319660, 0, 0, 0, 'nex_parabola.png', 1, '2023-10-08', 4, 3),
(40620, 'nexparabolapaketchampions+ligaindonesia30hari(2501)', 'NEXCHAMPS2501', 'Nex Parabola Paket Champions + Liga Indonesia 30 Hari (2501)', 'streaming-tv', 'NEX PARABOLA', 61560, 61560, 61560, 61560, 0, 0, 0, 'nex_parabola.png', 1, '2023-10-08', 4, 3),
(40621, 'nexparabolapaketchampions+ligaindonesia90hari(2503)', 'NEXCHAMPS2503', 'Nex Parabola Paket Champions + Liga Indonesia 90 Hari (2503)', 'streaming-tv', 'NEX PARABOLA', 168360, 168360, 168360, 168360, 0, 0, 0, 'nex_parabola.png', 1, '2023-10-08', 4, 3),
(40622, 'nexparabolapaketdiamond+ligaindonesia180hari(2906)', 'NEXALLCHANNEL2906', 'Nex Parabola Paket Diamond + Liga Indonesia 180 Hari (2906)', 'streaming-tv', 'NEX PARABOLA', 764660, 764660, 764660, 764660, 0, 0, 0, 'nex_parabola.png', 1, '2023-10-08', 4, 3),
(40623, 'nexparabolapaketdiamond+ligaindonesia30hari(2901)', 'NEXALLCHANNEL2901', 'Nex Parabola Paket Diamond + Liga Indonesia 30 Hari (2901)', 'streaming-tv', 'NEX PARABOLA', 150560, 150560, 150560, 150560, 0, 0, 0, 'nex_parabola.png', 1, '2023-10-08', 4, 3),
(40624, 'nexparabolapaketdiamond+ligaindonesia90hari(2903)', 'NEXALLCHANNEL2903', 'Nex Parabola Paket Diamond + Liga Indonesia 90 Hari (2903)', 'streaming-tv', 'NEX PARABOLA', 408660, 408660, 408660, 408660, 0, 0, 0, 'nex_parabola.png', 1, '2023-10-08', 4, 3),
(40625, 'nexparabolapaketligaindonesia180hari(1906)', 'NEXLIGA1906', 'Nex Parabola Paket Liga Indonesia 180 Hari (1906)', 'streaming-tv', 'NEX PARABOLA', 212860, 212860, 212860, 212860, 0, 0, 0, 'nex_parabola.png', 1, '2023-10-08', 4, 3),
(40626, 'nexparabolapaketligaindonesia30hari(1901)', 'NEXLIGA1901', 'Nex Parabola Paket Liga Indonesia 30 Hari (1901)', 'streaming-tv', 'NEX PARABOLA', 61560, 61560, 61560, 61560, 0, 0, 0, 'nex_parabola.png', 1, '2023-10-08', 4, 3),
(40627, 'nexparabolapaketligaindonesia90hari(1903)', 'NEXLIGA1903', 'Nex Parabola Paket Liga Indonesia 90 Hari (1903)', 'streaming-tv', 'NEX PARABOLA', 114960, 114960, 114960, 114960, 0, 0, 0, 'nex_parabola.png', 1, '2023-10-08', 4, 3),
(40628, 'nexparabolapaketmola+ligaindonesia1musim(2700)', 'NEXTMOLA2700', 'Nex Parabola Paket Mola + Liga Indonesia 1 Musim (2700)', 'streaming-tv', 'NEX PARABOLA', 470960, 470960, 470960, 470960, 0, 0, 0, 'nex_parabola.png', 1, '2023-10-08', 4, 3),
(40629, 'nexparabolapaketmola+ligaindonesia180hari(2706)', 'NEXMOLAS2706', 'Nex Parabola Paket Mola + Liga Indonesia 180 Hari (2706)', 'streaming-tv', 'NEX PARABOLA', 426460, 426460, 426460, 426460, 0, 0, 0, 'nex_parabola.png', 1, '2023-10-08', 4, 3),
(40631, 'nexparabolapaketmola+ligaindonesia90hari(2703)', 'NEXMOLA2703', 'Nex Parabola Paket Mola + Liga Indonesia 90 Hari (2703)', 'streaming-tv', 'NEX PARABOLA', 221760, 221760, 221760, 221760, 0, 0, 0, 'nex_parabola.png', 1, '2023-10-08', 4, 3),
(40635, 'orangetv100.000', 'OTV100', 'Orange TV 100.000', 'streaming-tv', 'ORANGE TV', 93250, 93250, 93250, 93250, 0, 0, 0, 'orange_tv.png', 1, '2023-10-08', 4, 3),
(40636, 'orangetv300.000', 'OTV300', 'Orange TV 300.000', 'streaming-tv', 'ORANGE TV', 291150, 291150, 291150, 291150, 0, 0, 0, 'orange_tv.png', 1, '2023-10-08', 4, 3),
(40637, 'orangetv50.000', 'OTV50', 'Orange TV 50.000', 'streaming-tv', 'ORANGE TV', 46750, 46750, 46750, 46750, 0, 0, 0, 'orange_tv.png', 1, '2023-10-08', 4, 3),
(40638, 'orangetv80.000', 'OTV80', 'Orange TV 80.000', 'streaming-tv', 'ORANGE TV', 74250, 74250, 74250, 74250, 0, 0, 0, 'orange_tv.png', 1, '2023-10-08', 4, 3),
(40640, 'ovo10.000', 'OVO10', 'OVO 10.000', 'saldo-emoney', 'OVO', 10625, 11050, 10944, 10944, 0, 0, 0, 'ovo.png', 1, '2023-10-08', 4, 4),
(40641, 'ovo100.000', 'OVO100', 'OVO 100.000', 'saldo-emoney', 'OVO', 99775, 103766, 102768, 102768, 0, 0, 0, 'ovo.png', 1, '2023-10-08', 4, 4),
(40642, 'ovo15.000', 'OVO15', 'OVO 15.000', 'saldo-emoney', 'OVO', 15960, 16598, 16439, 16439, 0, 0, 0, 'ovo.png', 1, '2023-10-08', 4, 4),
(40644, 'ovo20.000', 'OVO20', 'OVO 20.000', 'saldo-emoney', 'OVO', 19660, 20446, 20250, 20250, 0, 0, 0, 'ovo.png', 1, '2023-10-08', 4, 4),
(40646, 'ovo25.000', 'OVO25', 'OVO 25.000', 'saldo-emoney', 'OVO', 24660, 25646, 25400, 25400, 0, 0, 0, 'ovo.png', 1, '2023-10-08', 4, 4),
(40648, 'ovo30.000', 'OVO30', 'OVO 30.000', 'saldo-emoney', 'OVO', 29675, 30862, 30565, 30565, 0, 0, 0, 'ovo.png', 1, '2023-10-08', 4, 4),
(40650, 'ovo40.000', 'OVO40', 'OVO 40.000', 'saldo-emoney', 'OVO', 39775, 41366, 40968, 40968, 0, 0, 0, 'ovo.png', 1, '2023-10-08', 4, 4),
(40653, 'ovo50.000', 'OVO50', 'OVO 50.000', 'saldo-emoney', 'OVO', 49775, 51766, 51268, 51268, 0, 0, 0, 'ovo.png', 1, '2023-10-08', 4, 4),
(40655, 'ovo60.000', 'OVO60', 'OVO 60.000', 'saldo-emoney', 'OVO', 59825, 62218, 61620, 61620, 0, 0, 0, 'ovo.png', 1, '2023-10-08', 4, 4),
(40657, 'ovo70.000', 'OVO70', 'OVO 70.000', 'saldo-emoney', 'OVO', 69775, 72566, 71868, 71868, 0, 0, 0, 'ovo.png', 1, '2023-10-08', 4, 4),
(40659, 'ovo75.000', 'OVO75', 'OVO 75.000', 'saldo-emoney', 'OVO', 74775, 77766, 77018, 77018, 0, 0, 0, 'ovo.png', 1, '2023-10-08', 4, 4),
(40660, 'ovo80.000', 'OVO80', 'OVO 80.000', 'saldo-emoney', 'OVO', 79825, 83018, 82220, 82220, 0, 0, 0, 'ovo.png', 1, '2023-10-08', 4, 4),
(40662, 'ovo90.000', 'OVO90', 'OVO 90.000', 'saldo-emoney', 'OVO', 89825, 93418, 92520, 92520, 0, 0, 0, 'ovo.png', 1, '2023-10-08', 4, 4),
(40664, 'owsem1gb+1gb4g/30hari', 'AXDO114', 'OWSEM 1 GB + 1 GB 4G / 30 Hari', 'paket-internet', 'AXIS', 16599, 17263, 17097, 17097, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40665, 'owsem1gb+3gb4g/30hari', 'AXDO134', 'OWSEM 1 GB + 3 GB 4G / 30 Hari', 'paket-internet', 'AXIS', 28425, 29562, 29278, 29278, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40666, 'owsem2gb+6gb4g/30hari', 'AXDO264', 'OWSEM 2 GB + 6 GB 4G / 30 Hari', 'paket-internet', 'AXIS', 44727, 46516, 46069, 46069, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40667, 'owsem3gb+9gb4g/30hari', 'AXDO394', 'OWSEM 3 GB + 9 GB 4G / 30 Hari', 'paket-internet', 'AXIS', 60249, 62659, 62056, 62056, 0, 0, 0, 'axis.png', 1, '2023-10-08', 4, 3),
(40668, 'pln10.000', 'PLN10', 'PLN 10.000', 'token-pln', 'PLN', 10830, 11263, 11155, 11155, 0, 0, 0, 'pln.png', 1, '2023-10-08', 4, 3),
(40669, 'pln100.000', 'PLN100', 'PLN 100.000', 'token-pln', 'PLN', 100140, 104146, 103144, 103144, 0, 0, 0, 'pln.png', 1, '2023-10-08', 4, 3),
(40670, 'pln15.000', 'PLN15', 'PLN 15.000', 'token-pln', 'PLN', 15880, 16515, 16356, 16356, 0, 0, 0, 'pln.png', 1, '2023-10-08', 4, 3),
(40671, 'pln20.000', 'PLNP20', 'PLN 20.000', 'token-pln', 'PLN Promo', 20140, 20140, 20140, 20140, 0, 0, 0, 'pln_promo.png', 1, '2023-10-08', 4, 3),
(40672, 'pln20.000', 'PLN20', 'PLN 20.000', 'token-pln', 'PLN', 20157, 20963, 20762, 20762, 0, 0, 0, 'pln.png', 1, '2023-10-08', 4, 3),
(40673, 'pln200.000', 'PLN200', 'PLN 200.000', 'token-pln', 'PLN', 200140, 208146, 206144, 206144, 0, 0, 0, 'pln.png', 1, '2023-10-08', 4, 3),
(40674, 'pln5.000', 'PLN5', 'PLN 5.000', 'token-pln', 'PLN', 5875, 6110, 6051, 6051, 0, 0, 0, 'pln.png', 1, '2023-10-08', 4, 3),
(40675, 'pln50.000', 'PLN50', 'PLN 50.000', 'token-pln', 'PLN', 50175, 52182, 51680, 51680, 0, 0, 0, 'pln.png', 1, '2023-10-08', 4, 3),
(40676, 'pln50.000', 'PLNP50', 'PLN 50.000', 'token-pln', 'PLN Promo', 50192, 50192, 50192, 50192, 0, 0, 0, 'pln_promo.png', 1, '2023-10-08', 4, 3),
(40677, 'pln500.000', 'PLN500', 'PLN 500.000', 'token-pln', 'PLN', 500140, 520146, 515144, 515144, 0, 0, 0, 'pln.png', 1, '2023-10-08', 4, 3),
(40702, 'shopeepay10.000', 'SHP10', 'SHOPEE PAY 10.000', 'saldo-emoney', 'SHOPEE PAY', 10705, 11133, 11026, 11026, 0, 0, 0, 'shopee_pay.png', 1, '2023-10-08', 4, 4),
(40703, 'shopeepay100.000', 'SHP100', 'SHOPEE PAY 100.000', 'saldo-emoney', 'SHOPEE PAY', 100685, 104712, 103706, 103706, 0, 0, 0, 'shopee_pay.png', 1, '2023-10-08', 4, 4),
(40704, 'shopeepay14.500', 'SHP14', 'SHOPEE PAY 14.500', 'saldo-emoney', 'SHOPEE PAY', 14360, 14934, 14791, 14791, 0, 0, 0, 'shopee_pay.png', 1, '2023-10-08', 4, 4),
(40705, 'shopeepay15.000', 'SHP15', 'SHOPEE PAY 15.000', 'saldo-emoney', 'SHOPEE PAY', 15650, 16276, 16120, 16120, 0, 0, 0, 'shopee_pay.png', 1, '2023-10-08', 4, 4),
(40706, 'shopeepay150.000', 'SHP150', 'SHOPEE PAY 150.000', 'saldo-emoney', 'SHOPEE PAY', 150925, 156962, 155453, 155453, 0, 0, 0, 'shopee_pay.png', 1, '2023-10-08', 4, 4),
(40707, 'shopeepay20.000', 'SHP20', 'SHOPEE PAY 20.000', 'saldo-emoney', 'SHOPEE PAY', 20670, 21497, 21290, 21290, 0, 0, 0, 'shopee_pay.png', 1, '2023-10-08', 4, 4),
(40709, 'shopeepay25.000', 'SHP25', 'SHOPEE PAY 25.000', 'saldo-emoney', 'SHOPEE PAY', 25650, 26676, 26420, 26420, 0, 0, 0, 'shopee_pay.png', 1, '2023-10-08', 4, 4),
(40711, 'shopeepay30.000', 'SHP30', 'SHOPEE PAY 30.000', 'saldo-emoney', 'SHOPEE PAY', 30685, 31912, 31606, 31606, 0, 0, 0, 'shopee_pay.png', 1, '2023-10-08', 4, 4),
(40713, 'shopeepay35.000', 'SHP35', 'SHOPEE PAY 35.000', 'saldo-emoney', 'SHOPEE PAY', 35685, 37112, 36756, 36756, 0, 0, 0, 'shopee_pay.png', 1, '2023-10-08', 4, 4),
(40714, 'shopeepay40.000', 'SHP40', 'SHOPEE PAY 40.000', 'saldo-emoney', 'SHOPEE PAY', 40705, 42333, 41926, 41926, 0, 0, 0, 'shopee_pay.png', 1, '2023-10-08', 4, 4),
(40715, 'shopeepay45.000', 'SHP45', 'SHOPEE PAY 45.000', 'saldo-emoney', 'SHOPEE PAY', 45685, 47512, 47056, 47056, 0, 0, 0, 'shopee_pay.png', 1, '2023-10-08', 4, 4),
(40716, 'shopeepay50.000', 'SHP50', 'SHOPEE PAY 50.000', 'saldo-emoney', 'SHOPEE PAY', 50615, 52640, 52133, 52133, 0, 0, 0, 'shopee_pay.png', 1, '2023-10-08', 4, 4),
(40717, 'shopeepay55.000', 'SHP55', 'SHOPEE PAY 55.000', 'saldo-emoney', 'SHOPEE PAY', 55695, 57923, 57366, 57366, 0, 0, 0, 'shopee_pay.png', 1, '2023-10-08', 4, 4),
(40718, 'shopeepay60.000', 'SHP60', 'SHOPEE PAY 60.000', 'saldo-emoney', 'SHOPEE PAY', 60750, 63180, 62573, 62573, 0, 0, 0, 'shopee_pay.png', 1, '2023-10-08', 4, 4),
(40719, 'shopeepay65.000', 'SHP65', 'SHOPEE PAY 65.000', 'saldo-emoney', 'SHOPEE PAY', 65705, 68333, 67676, 67676, 0, 0, 0, 'shopee_pay.png', 1, '2023-10-08', 4, 4),
(40720, 'shopeepay70.000', 'SHP70', 'SHOPEE PAY 70.000', 'saldo-emoney', 'SHOPEE PAY', 70775, 73606, 72898, 72898, 0, 0, 0, 'shopee_pay.png', 1, '2023-10-08', 4, 4),
(40721, 'shopeepay75.000', 'SHP74', 'SHOPEE PAY 75.000', 'saldo-emoney', 'SHOPEE PAY', 74700, 77688, 76941, 76941, 0, 0, 0, 'shopee_pay.png', 1, '2023-10-08', 4, 4),
(40723, 'shopeepay85.000', 'SHP85', 'SHOPEE PAY 85.000', 'saldo-emoney', 'SHOPEE PAY', 85660, 89086, 88230, 88230, 0, 0, 0, 'shopee_pay.png', 1, '2023-10-08', 4, 4),
(40724, 'shopeepay90.000', 'SHP90', 'SHOPEE PAY 90.000', 'saldo-emoney', 'SHOPEE PAY', 90685, 94312, 93406, 93406, 0, 0, 0, 'shopee_pay.png', 1, '2023-10-08', 4, 4),
(40725, 'shopeepay95.000', 'SHP95', 'SHOPEE PAY 95.000', 'saldo-emoney', 'SHOPEE PAY', 95660, 99486, 98530, 98530, 0, 0, 0, 'shopee_pay.png', 1, '2023-10-08', 4, 4),
(40734, 'smart10.000', 'SMT10', 'Smart 10.000', 'pulsa-reguler', 'SMART', 9905, 9905, 9905, 9905, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40736, 'smart100.000', 'SMT100', 'Smart 100.000', 'pulsa-reguler', 'SMART', 96300, 96300, 96300, 96300, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40737, 'smart12gbkuotamalam/30hari', 'SMDM12', 'Smart 12 GB Kuota Malam / 30 Hari', 'paket-internet', 'SMART', 23400, 23400, 23400, 23400, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40738, 'smart15.000', 'SMT15', 'Smart 15.000', 'pulsa-reguler', 'SMART', 14825, 14825, 14825, 14825, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40739, 'smart150.000', 'SMT150', 'Smart 150.000', 'pulsa-reguler', 'SMART', 148075, 148075, 148075, 148075, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40740, 'smart16gb/30hari', 'SMD162', 'Smart 16 GB / 30 Hari', 'paket-internet', 'SMART', 48400, 48400, 48400, 48400, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40741, 'smart16gb/30hari', 'SMD16', 'Smart 16 GB / 30 Hari', 'paket-internet', 'SMART', 48450, 48450, 48450, 48450, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40742, 'smart2gb/7hari', 'SMD2', 'Smart 2 GB / 7 Hari', 'paket-internet', 'SMART', 8580, 8580, 8580, 8580, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40743, 'smart2.5gb/7hari', 'SMD25', 'Smart 2.5 GB / 7 Hari', 'paket-internet', 'SMART', 18700, 18700, 18700, 18700, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40744, 'smart20.000', 'SMT20', 'Smart 20.000', 'pulsa-reguler', 'SMART', 19660, 19660, 19660, 19660, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40746, 'smart25.000', 'SMT25', 'Smart 25.000', 'pulsa-reguler', 'SMART', 24460, 24460, 24460, 24460, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40749, 'smart30gb/30hari', 'SMD302', 'Smart 30 GB / 30 Hari', 'paket-internet', 'SMART', 72750, 72750, 72750, 72750, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40750, 'smart30gb/30hari', 'SMD30', 'Smart 30 GB / 30 Hari', 'paket-internet', 'SMART', 73775, 73775, 73775, 73775, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40751, 'smart30.000', 'SMT30', 'Smart 30.000', 'pulsa-reguler', 'SMART', 29485, 29485, 29485, 29485, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40754, 'smart4gb/14hari', 'SMD4', 'Smart 4 GB / 14 Hari', 'paket-internet', 'SMART', 16505, 16505, 16505, 16505, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40755, 'smart5.000', 'SMT5', 'Smart 5.000', 'pulsa-reguler', 'SMART', 5050, 5050, 5050, 5050, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40757, 'smart50.000', 'SMT50', 'Smart 50.000', 'pulsa-reguler', 'SMART', 48965, 48965, 48965, 48965, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40759, 'smart60.000', 'SMT60', 'Smart 60.000', 'pulsa-reguler', 'SMART', 58650, 58650, 58650, 58650, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40760, 'smart75.000', 'SMT75', 'Smart 75.000', 'pulsa-reguler', 'SMART', 73500, 73500, 73500, 73500, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40761, 'smart8gb/14hari', 'SMD8', 'Smart 8 GB / 14 Hari', 'paket-internet', 'SMART', 33700, 33700, 33700, 33700, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40762, 'smartinternet10.000', 'SMI10', 'Smart Internet 10.000', 'paket-internet', 'SMART', 10955, 10955, 10955, 10955, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40764, 'smartinternet150.000', 'SMI150', 'Smart Internet 150.000', 'paket-internet', 'SMART', 133020, 133020, 133020, 133020, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40765, 'smartinternet20.000', 'SMI20', 'Smart Internet 20.000', 'paket-internet', 'SMART', 18149, 18149, 18149, 18149, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40766, 'smartinternet200.000', 'SMI200', 'Smart Internet 200.000', 'paket-internet', 'SMART', 177820, 177820, 177820, 177820, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40767, 'smartinternet30.000', 'SMI30', 'Smart Internet 30.000', 'paket-internet', 'SMART', 26149, 26149, 26149, 26149, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40768, 'smartinternet40.000', 'SMI40', 'Smart Internet 40.000', 'paket-internet', 'SMART', 55125, 55125, 55125, 55125, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40769, 'smartinternet60.000', 'SMI60', 'Smart Internet 60.000', 'paket-internet', 'SMART', 59650, 59650, 59650, 59650, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40774, 'smartfrenkuotanonstop100.000', 'SMUNL30', 'Smartfren Kuota Nonstop 100.000', 'paket-internet', 'SMART', 97475, 97475, 97475, 97475, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40775, 'smartfrenkuotanonstop30.000', 'SMUNL6', 'Smartfren Kuota Nonstop 30.000', 'paket-internet', 'SMART', 36625, 36625, 36625, 36625, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40776, 'smartfrenkuotanonstop45.000', 'SMUNL10', 'Smartfren Kuota Nonstop 45.000', 'paket-internet', 'SMART', 52050, 52050, 52050, 52050, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40777, 'smartfrenkuotanonstop65.000', 'SMUNL18', 'Smartfren Kuota Nonstop 65.000', 'paket-internet', 'SMART', 72825, 72825, 72825, 72825, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40778, 'smartfrenunlimited1,5gb/28hari', 'SMSUNL100', 'Smartfren Unlimited 1,5GB/28 Hari', 'paket-internet', 'SMART', 103777, 103777, 103777, 103777, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40779, 'smartfrenunlimited1gb/14hari', 'SMSUNL40', 'Smartfren Unlimited 1GB/14 Hari', 'paket-internet', 'SMART', 46875, 46875, 46875, 46875, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40780, 'smartfrenunlimited1gb/28hari', 'SMSUNL80', 'Smartfren Unlimited 1GB/28 Hari', 'paket-internet', 'SMART', 84375, 84375, 84375, 84375, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40781, 'smartfrenunlimited1gb/7hari', 'SMSUNL20', 'Smartfren Unlimited 1GB/7 Hari', 'paket-internet', 'SMART', 26042, 26042, 26042, 26042, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40782, 'smartfrenunlimited500mb/28hari', 'SMSUNL60', 'Smartfren Unlimited 500MB/28 Hari', 'paket-internet', 'SMART', 67475, 67475, 67475, 67475, 0, 0, 0, 'smart.png', 1, '2023-10-08', 4, 3),
(40808, 'tapcashbni50.000', 'TAPCASHBNI50', 'Tapcash BNI 50.000', 'saldo-emoney', 'TAPCASH BNI', 52050, 54132, 53612, 53612, 0, 0, 0, 'tapcash_bni.png', 1, '2023-10-08', 4, 4),
(40809, 'teleponsemuaop(20menit,1hari)', 'STLP201', 'Telepon Semua Op (20 Menit, 1Hari)', 'paket-telepon', 'TELKOMSEL', 5205, 5413, 5361, 5361, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40810, 'telkomsel(350menittsel+50menitallopr+200sms)/7hari', 'STLP4007', 'Telkomsel (350 Menit Tsel + 50 Menit All Opr + 200SMS) / 7 Hari', 'paket-telepon', 'TELKOMSEL', 24615, 25600, 25353, 25353, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40811, 'telkomsel1.000', 'SM1', 'Telkomsel 1.000', 'pulsa-reguler', 'TELKOMSEL', 1755, 1825, 1808, 1808, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40813, 'telkomsel10.000', 'SM10', 'Telkomsel 10.000', 'pulsa-reguler', 'TELKOMSEL', 10125, 10530, 10429, 10429, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40814, 'telkomsel10.000', 'SP10', 'Telkomsel 10.000', 'pulsa-reguler', 'TELKOMSEL', 10175, 10582, 10480, 10480, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40815, 'telkomsel100.000', 'SM100', 'Telkomsel 100.000', 'pulsa-reguler', 'TELKOMSEL', 97575, 101478, 100502, 100502, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40818, 'telkomsel15.000', 'SP15', 'Telkomsel 15.000', 'pulsa-reguler', 'TELKOMSEL', 14935, 15532, 15383, 15383, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40819, 'telkomsel15.000', 'SM15', 'Telkomsel 15.000', 'pulsa-reguler', 'TELKOMSEL', 14940, 15538, 15388, 15388, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40820, 'telkomsel150.000', 'SM150', 'Telkomsel 150.000', 'pulsa-reguler', 'TELKOMSEL', 148875, 154830, 153341, 153341, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40821, 'telkomsel1500smssemuaop/30hari', 'SSMS150030', 'Telkomsel 1500 SMS Semua Op / 30 Hari', 'paket-telepon', 'TELKOMSEL', 21225, 22074, 21862, 21862, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40822, 'telkomsel2.000', 'SM2', 'Telkomsel 2.000', 'pulsa-reguler', 'TELKOMSEL', 2925, 3042, 3013, 3013, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40824, 'telkomsel20.000', 'S20', 'Telkomsel 20.000', 'pulsa-reguler', 'TELKOMSEL', 19965, 20764, 20564, 20564, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40825, 'telkomsel20.000', 'SM20', 'Telkomsel 20.000', 'pulsa-reguler', 'TELKOMSEL', 19990, 20790, 20590, 20590, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40827, 'telkomsel200.000', 'SM200', 'Telkomsel 200.000', 'pulsa-reguler', 'TELKOMSEL', 196775, 204646, 202678, 202678, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40828, 'telkomsel2000smssemuaop/30hari', 'SSMS200030', 'Telkomsel 2000 SMS Semua Op / 30 Hari', 'paket-telepon', 'TELKOMSEL', 25900, 26936, 26677, 26677, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40829, 'telkomsel25.000', 'SM25', 'Telkomsel 25.000', 'pulsa-reguler', 'TELKOMSEL', 24935, 25932, 25683, 25683, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40830, 'telkomsel250smssemuaop/1hari', 'SSMS2501', 'Telkomsel 250 SMS Semua Op / 1 Hari', 'paket-telepon', 'TELKOMSEL', 6225, 6474, 6412, 6412, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40831, 'telkomsel3.000', 'SM3', 'Telkomsel 3.000', 'pulsa-reguler', 'TELKOMSEL', 3580, 3723, 3687, 3687, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40832, 'telkomsel30.000', 'SM30', 'Telkomsel 30.000', 'pulsa-reguler', 'TELKOMSEL', 30060, 31262, 30962, 30962, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40833, 'telkomsel35.000', 'SM35', 'Telkomsel 35.000', 'pulsa-reguler', 'TELKOMSEL', 34905, 36301, 35952, 35952, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40834, 'telkomsel4.000', 'SM4', 'Telkomsel 4.000', 'pulsa-reguler', 'TELKOMSEL', 4830, 5023, 4975, 4975, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40835, 'telkomsel40.000', 'SM40', 'Telkomsel 40.000', 'pulsa-reguler', 'TELKOMSEL', 39274, 40845, 40452, 40452, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40836, 'telkomsel45.000', 'SM45', 'Telkomsel 45.000', 'pulsa-reguler', 'TELKOMSEL', 44780, 46571, 46123, 46123, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40837, 'telkomsel5.000', 'SM5', 'Telkomsel 5.000', 'pulsa-reguler', 'TELKOMSEL', 5255, 5465, 5413, 5413, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40838, 'telkomsel5.000', 'SP5', 'Telkomsel 5.000', 'pulsa-reguler', 'TELKOMSEL', 5392, 5608, 5554, 5554, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40839, 'telkomsel50.000', 'SM50', 'Telkomsel 50.000', 'pulsa-reguler', 'TELKOMSEL', 49600, 51584, 51088, 51088, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40841, 'telkomsel60.000', 'SM60', 'Telkomsel 60.000', 'pulsa-reguler', 'TELKOMSEL', 59900, 62296, 61697, 61697, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40842, 'telkomsel65.000', 'SM65', 'Telkomsel 65.000', 'pulsa-reguler', 'TELKOMSEL', 64930, 67527, 66878, 66878, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40843, 'telkomsel70.000', 'SM70', 'Telkomsel 70.000', 'pulsa-reguler', 'TELKOMSEL', 69575, 72358, 71662, 71662, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40844, 'telkomsel75.000', 'SM75', 'Telkomsel 75.000', 'pulsa-reguler', 'TELKOMSEL', 73095, 76019, 75288, 75288, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40845, 'telkomsel75.000', 'SP75', 'Telkomsel 75.000', 'pulsa-reguler', 'TELKOMSEL', 73395, 76331, 75597, 75597, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40846, 'telkomsel80.000', 'SM80', 'Telkomsel 80.000', 'pulsa-reguler', 'TELKOMSEL', 79405, 82581, 81787, 81787, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40847, 'telkomsel85.000', 'SM85', 'Telkomsel 85.000', 'pulsa-reguler', 'TELKOMSEL', 84355, 87729, 86886, 86886, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40848, 'telkomsel90.000', 'SM90', 'Telkomsel 90.000', 'pulsa-reguler', 'TELKOMSEL', 89305, 92877, 91984, 91984, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40849, 'telkomsel95.000', 'SM95', 'Telkomsel 95.000', 'pulsa-reguler', 'TELKOMSEL', 94405, 98181, 97237, 97237, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40850, 'telkomselcombo10gb/30hari', 'SDPC10', 'Telkomsel COMBO 10 GB / 30 Hari', 'paket-internet', 'TELKOMSEL', 122675, 127582, 126355, 126355, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40851, 'telkomseldata1gb+2gbgame/30hari', 'SDFG3', 'Telkomsel Data 1 GB + 2 GB Game / 30 Hari', 'paket-internet', 'TELKOMSEL', 24150, 25116, 24875, 24875, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40852, 'telkomseldata1gb+5gbvideomax/30hari', 'SDMV6', 'Telkomsel Data 1 GB + 5 GB Videomax / 30 Hari', 'paket-internet', 'TELKOMSEL', 24650, 25636, 25390, 25390, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40853, 'telkomseldata1gb+500mbyoutube/30hari', 'TPY1', 'Telkomsel Data 1 GB + 500 MB Youtube / 30 Hari', 'paket-internet', 'TELKOMSEL', 24800, 25792, 25544, 25544, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40854, 'telkomseldata15gb+40gbvideomax/30hari', 'SDMV55', 'Telkomsel Data 15 GB + 40 GB Videomax / 30 Hari', 'paket-internet', 'TELKOMSEL', 156149, 162395, 160833, 160833, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40855, 'telkomseldata3gb+12gbvideomax/30hari', 'SDMV15', 'Telkomsel Data 3 GB + 12 GB Videomax / 30 Hari', 'paket-internet', 'TELKOMSEL', 56149, 58395, 57833, 57833, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40856, 'telkomseldata7gb+28gbvideomax/30hari', 'SDMV35', 'Telkomsel Data 7 GB + 28 GB Videomax / 30 Hari', 'paket-internet', 'TELKOMSEL', 106149, 110395, 109333, 109333, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40857, 'telkomseldatabulk1gb/30hari', 'SDB11', 'Telkomsel Data Bulk 1 GB / 30 Hari', 'paket-internet', 'TELKOMSEL', 15150, 15756, 15605, 15605, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40858, 'telkomseldatabulk1gb/30hari', 'SDB1', 'Telkomsel Data Bulk 1 GB / 30 Hari', 'paket-internet', 'TELKOMSEL', 23700, 24648, 24411, 24411, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40859, 'telkomseldatabulk12gb/30hari', 'SDB12', 'Telkomsel Data Bulk 12 GB / 30 Hari', 'paket-internet', 'TELKOMSEL', 101900, 105976, 104957, 104957, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40860, 'telkomseldatabulk17gb/30hari', 'SDB17', 'Telkomsel Data Bulk 17 GB / 30 Hari', 'paket-internet', 'TELKOMSEL', 149650, 155636, 154140, 154140, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40862, 'telkomseldatabulk28gb/30hari', 'SDB28', 'Telkomsel Data Bulk 28 GB / 30 Hari', 'paket-internet', 'TELKOMSEL', 175350, 182364, 180611, 180611, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40865, 'telkomseldatabulk4.5gb/30hari', 'SDB45', 'Telkomsel Data Bulk 4.5 GB / 30 Hari', 'paket-internet', 'TELKOMSEL', 81850, 85124, 84306, 84306, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40867, 'telkomseldatabulk50gb/30hari', 'SDB50', 'Telkomsel Data Bulk 50 GB / 30 Hari', 'paket-internet', 'TELKOMSEL', 198260, 206190, 204208, 204208, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40868, 'telkomseldatabulk8gb/30hari', 'SDB8', 'Telkomsel Data Bulk 8 GB / 30 Hari', 'paket-internet', 'TELKOMSEL', 74150, 77116, 76375, 76375, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40871, 'telkomseldatacombosakti11gb', 'SDCS11', 'Telkomsel Data Combo Sakti 11 GB', 'paket-internet', 'TELKOMSEL', 56950, 59228, 58659, 58659, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40890, 'telkomseldataflash1gb/30hari', 'SDF1', 'Telkomsel Data Flash 1 GB / 30 Hari', 'paket-internet', 'TELKOMSEL', 14150, 14716, 14575, 14575, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40891, 'telkomseldataflash100.000', 'SDF12', 'Telkomsel Data Flash 100.000', 'paket-internet', 'TELKOMSEL', 101150, 105196, 104185, 104185, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40892, 'telkomseldataflash12gb/30hari', 'SDF1230', 'Telkomsel Data Flash 12 GB / 30 Hari', 'paket-internet', 'TELKOMSEL', 94650, 98436, 97490, 97490, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40893, 'telkomseldataflash150.000', 'SDF150', 'Telkomsel Data Flash 150.000', 'paket-internet', 'TELKOMSEL', 153050, 159172, 157642, 157642, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40894, 'telkomseldataflash2gb/30hari', 'SDF2', 'Telkomsel Data Flash 2 GB / 30 Hari', 'paket-internet', 'TELKOMSEL', 27250, 28340, 28068, 28068, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40895, 'telkomseldataflash200.000', 'SDF50', 'Telkomsel Data Flash 200.000', 'paket-internet', 'TELKOMSEL', 199150, 207116, 205125, 205125, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40896, 'telkomseldataflash250mb/7hari', 'SDF250', 'Telkomsel Data Flash 250 MB / 7 Hari', 'paket-internet', 'TELKOMSEL', 5800, 6032, 5974, 5974, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40897, 'telkomseldataflash3gb/30hari', 'SDF3', 'Telkomsel Data Flash 3 GB / 30 Hari', 'paket-internet', 'TELKOMSEL', 34375, 35750, 35406, 35406, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40898, 'telkomseldataflash4gb/30hari', 'SDF4', 'Telkomsel Data Flash 4 GB / 30 Hari', 'paket-internet', 'TELKOMSEL', 35850, 37284, 36926, 36926, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40899, 'telkomseldataflash5gb/30hari', 'SDF5', 'Telkomsel Data Flash 5 GB / 30 Hari', 'paket-internet', 'TELKOMSEL', 41625, 43290, 42874, 42874, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40900, 'telkomseldataflash5gb/30hari', 'SD5', 'Telkomsel Data Flash 5 GB / 30 Hari', 'paket-internet', 'TELKOMSEL', 53150, 55276, 54745, 54745, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40901, 'telkomseldataflash68.000', 'SDF65', 'Telkomsel Data Flash 68.000', 'paket-internet', 'TELKOMSEL', 68650, 71396, 70710, 70710, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40903, 'telkomseldataflash85.000', 'SDF8', 'Telkomsel Data Flash 85.000', 'paket-internet', 'TELKOMSEL', 97650, 101556, 100580, 100580, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40908, 'telkomseldatamalam1gb/1hari', 'SDM511', 'Telkomsel Data Malam 1 GB / 1 Hari', 'paket-internet', 'TELKOMSEL', 3809, 3961, 3923, 3923, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40909, 'telkomseldatamalam15gb/30hari', 'SDM1530', 'Telkomsel Data Malam 15 GB / 30 Hari', 'paket-internet', 'TELKOMSEL', 27760, 28870, 28593, 28593, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40910, 'telkomseldatamalam5gb/1hari', 'SDM51', 'Telkomsel Data Malam 5 GB / 1 Hari', 'paket-internet', 'TELKOMSEL', 8005, 8325, 8245, 8245, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40911, 'telkomseldatamalam5gb/30hari', 'SDM530', 'Telkomsel Data Malam 5 GB / 30 Hari', 'paket-internet', 'TELKOMSEL', 16100, 16744, 16583, 16583, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40912, 'telkomseldatamaxstream12gb/30hari', 'SDM12', 'Telkomsel Data Maxstream 12 GB / 30 Hari', 'paket-internet', 'TELKOMSEL', 50400, 52416, 51912, 51912, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40913, 'telkomseldatamaxstream5gb/30hari', 'SDM5', 'Telkomsel Data Maxstream 5 GB / 30 Hari', 'paket-internet', 'TELKOMSEL', 20400, 21216, 21012, 21012, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40914, 'telkomseldatamini1gb/3hari', 'SDM1', 'Telkomsel Data Mini 1 GB / 3 Hari', 'paket-internet', 'TELKOMSEL', 17375, 18070, 17896, 17896, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40915, 'telkomseldatamini1gb/7hari', 'SDM17', 'Telkomsel Data Mini 1 GB / 7 Hari', 'paket-internet', 'TELKOMSEL', 16660, 17326, 17160, 17160, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40916, 'telkomseldatamini1.5gb/14hari', 'SDM1514', 'Telkomsel Data Mini 1.5 GB / 14 Hari', 'paket-internet', 'TELKOMSEL', 26275, 27326, 27063, 27063, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40919, 'telkomseldatamini2gb/14hari', 'SDM214', 'Telkomsel Data Mini 2 GB / 14 Hari', 'paket-internet', 'TELKOMSEL', 32400, 33696, 33372, 33372, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40920, 'telkomseldatamini2gb/3hari', 'SDM2', 'Telkomsel Data Mini 2 GB / 3 Hari', 'paket-internet', 'TELKOMSEL', 34125, 35490, 35149, 35149, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40922, 'telkomseldatamini5gb/7hari', 'SDM57', 'Telkomsel Data Mini 5 GB / 7 Hari', 'paket-internet', 'TELKOMSEL', 54675, 56862, 56315, 56315, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40949, 'telkomselgamesmax25.000', 'SDGM252', 'Telkomsel GamesMax 25.000', 'paket-internet', 'TELKOMSEL', 22860, 23774, 23546, 23546, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40950, 'telkomselgamesmax25.000', 'SDGM25', 'Telkomsel GamesMax 25.000', 'paket-internet', 'TELKOMSEL', 24675, 25662, 25415, 25415, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40952, 'telkomselgamesmaxunlimitedplaysilverfreefire/30hari', 'GMFF', 'Telkomsel GamesMAX Unlimited Play Silver Free Fire / 30 Hari', 'paket-internet', 'TELKOMSEL', 23150, 24076, 23845, 23845, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40955, 'telkomselgamesmaxunlimitedplaysilvermobilelegends/30hari', 'GMML', 'Telkomsel GamesMAX Unlimited Play Silver Mobile Legends / 30 Hari', 'paket-internet', 'TELKOMSEL', 22525, 23426, 23201, 23201, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40956, 'telkomselpaketinternetfacebook1gb/1hari', 'TPF11', 'Telkomsel Paket Internet Facebook 1 GB / 1 Hari', 'paket-internet', 'TELKOMSEL', 6675, 6942, 6875, 6875, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40957, 'telkomselpaketinternetfacebook1gb/3hari', 'TPF13', 'Telkomsel Paket Internet Facebook 1 GB / 3 Hari', 'paket-internet', 'TELKOMSEL', 11700, 12168, 12051, 12051, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40958, 'telkomselpaketinternetfacebook1gb/7hari', 'TPF17', 'Telkomsel Paket Internet Facebook 1 GB / 7 Hari', 'paket-internet', 'TELKOMSEL', 19375, 20150, 19956, 19956, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40960, 'telkomselpaketinternetfacebook2gb/7hari', 'TPF27', 'Telkomsel Paket Internet Facebook 2 GB / 7 Hari', 'paket-internet', 'TELKOMSEL', 21425, 22282, 22068, 22068, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40961, 'telkomselpaketinternetfacebook3gb/7hari', 'TPF37', 'Telkomsel Paket Internet Facebook 3 GB / 7 Hari', 'paket-internet', 'TELKOMSEL', 26100, 27144, 26883, 26883, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40963, 'telkomselpaketinternetinstagram1gb/3hari', 'TPI13', 'Telkomsel Paket Internet Instagram 1 GB / 3 Hari', 'paket-internet', 'TELKOMSEL', 11700, 12168, 12051, 12051, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40964, 'telkomselpaketinternetinstagram1gb/7hari', 'TPI17', 'Telkomsel Paket Internet Instagram 1 GB / 7 Hari', 'paket-internet', 'TELKOMSEL', 19375, 20150, 19956, 19956, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40966, 'telkomselpaketinternetinstagram2gb/7hari', 'TPI27', 'Telkomsel Paket Internet Instagram 2 GB / 7 Hari', 'paket-internet', 'TELKOMSEL', 21425, 22282, 22068, 22068, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40967, 'telkomselpaketinternetinstagram3gb/7hari', 'TPI37', 'Telkomsel Paket Internet Instagram 3 GB / 7 Hari', 'paket-internet', 'TELKOMSEL', 26100, 27144, 26883, 26883, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40968, 'telkomselpaketinternetwhatsapp1gb/1hari', 'TPW11', 'Telkomsel Paket Internet Whatsapp 1 GB / 1 Hari', 'paket-internet', 'TELKOMSEL', 5650, 5876, 5820, 5820, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40969, 'telkomselpaketinternetwhatsapp1gb/3hari', 'TPW13', 'Telkomsel Paket Internet Whatsapp 1 GB / 3 Hari', 'paket-internet', 'TELKOMSEL', 11700, 12168, 12051, 12051, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40970, 'telkomselpaketinternetwhatsapp1gb/7hari', 'TPW17', 'Telkomsel Paket Internet Whatsapp 1 GB / 7 Hari', 'paket-internet', 'TELKOMSEL', 19375, 20150, 19956, 19956, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40971, 'telkomselpaketinternetwhatsapp10gb/30hari', 'TPW1030', 'Telkomsel Paket Internet Whatsapp 10 GB / 30 Hari', 'paket-internet', 'TELKOMSEL', 62125, 64610, 63989, 63989, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40972, 'telkomselpaketinternetwhatsapp2gb/3hari', 'TPW23', 'Telkomsel Paket Internet Whatsapp 2 GB / 3 Hari', 'paket-internet', 'TELKOMSEL', 13655, 14201, 14065, 14065, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40973, 'telkomselpaketinternetwhatsapp2gb/7hari', 'TPW27', 'Telkomsel Paket Internet Whatsapp 2 GB / 7 Hari', 'paket-internet', 'TELKOMSEL', 13660, 14206, 14070, 14070, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40974, 'telkomselpaketinternetwhatsapp3gb/7hari', 'TPW37', 'Telkomsel Paket Internet Whatsapp 3 GB / 7 Hari', 'paket-internet', 'TELKOMSEL', 26060, 27102, 26842, 26842, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40975, 'telkomselpaketinternetwhatsapp5gb/30hari', 'TPW530', 'Telkomsel Paket Internet Whatsapp 5 GB / 30 Hari', 'paket-internet', 'TELKOMSEL', 36075, 37518, 37157, 37157, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40976, 'telkomselpaketinternetyoutube1gb/1hari', 'TPY11', 'Telkomsel Paket Internet Youtube 1 GB / 1 Hari', 'paket-internet', 'TELKOMSEL', 4210, 4378, 4336, 4336, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40979, 'telkomselpaketinternetyoutube2gb/3hari', 'TPY23', 'Telkomsel Paket Internet Youtube 2 GB / 3 Hari', 'paket-internet', 'TELKOMSEL', 14105, 14669, 14528, 14528, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40983, 'telkomselpulsatransfer10.000', 'ST10', 'Telkomsel Pulsa Transfer 10.000', 'pulsa-transfer', 'TELKOMSEL', 10355, 10769, 10666, 10666, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40984, 'telkomselpulsatransfer100.000', 'ST100', 'Telkomsel Pulsa Transfer 100.000', 'pulsa-transfer', 'TELKOMSEL', 94309, 98081, 97138, 97138, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40985, 'telkomselpulsatransfer110.000', 'ST110', 'Telkomsel Pulsa Transfer 110.000', 'pulsa-transfer', 'TELKOMSEL', 105785, 110016, 108959, 108959, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40990, 'telkomselpulsatransfer15.000', 'ST15', 'Telkomsel Pulsa Transfer 15.000', 'pulsa-transfer', 'TELKOMSEL', 15405, 16021, 15867, 15867, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40996, 'telkomselpulsatransfer20.000', 'ST20', 'Telkomsel Pulsa Transfer 20.000', 'pulsa-transfer', 'TELKOMSEL', 20536, 21357, 21152, 21152, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(40998, 'telkomselpulsatransfer25.000', 'ST25', 'Telkomsel Pulsa Transfer 25.000', 'pulsa-transfer', 'TELKOMSEL', 24858, 25852, 25604, 25604, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41000, 'telkomselpulsatransfer30.000', 'ST30', 'Telkomsel Pulsa Transfer 30.000', 'pulsa-transfer', 'TELKOMSEL', 29323, 30496, 30203, 30203, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41002, 'telkomselpulsatransfer35.000', 'ST35', 'Telkomsel Pulsa Transfer 35.000', 'pulsa-transfer', 'TELKOMSEL', 33773, 35124, 34786, 34786, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41003, 'telkomselpulsatransfer40.000', 'ST40', 'Telkomsel Pulsa Transfer 40.000', 'pulsa-transfer', 'TELKOMSEL', 38223, 39752, 39370, 39370, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41004, 'telkomselpulsatransfer45.000', 'ST45', 'Telkomsel Pulsa Transfer 45.000', 'pulsa-transfer', 'TELKOMSEL', 42673, 44380, 43953, 43953, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41005, 'telkomselpulsatransfer5.000', 'ST5', 'Telkomsel Pulsa Transfer 5.000', 'pulsa-transfer', 'TELKOMSEL', 6405, 6661, 6597, 6597, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41006, 'telkomselpulsatransfer50.000', 'ST50', 'Telkomsel Pulsa Transfer 50.000', 'pulsa-transfer', 'TELKOMSEL', 47568, 49471, 48995, 48995, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41008, 'telkomselpulsatransfer55.000', 'ST55', 'Telkomsel Pulsa Transfer 55.000', 'pulsa-transfer', 'TELKOMSEL', 52309, 54401, 53878, 53878, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41009, 'telkomselpulsatransfer60.000', 'ST60', 'Telkomsel Pulsa Transfer 60.000', 'pulsa-transfer', 'TELKOMSEL', 56468, 58727, 58162, 58162, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41010, 'telkomselpulsatransfer65.000', 'ST65', 'Telkomsel Pulsa Transfer 65.000', 'pulsa-transfer', 'TELKOMSEL', 61259, 63709, 63097, 63097, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41011, 'telkomselpulsatransfer70.000', 'ST70', 'Telkomsel Pulsa Transfer 70.000', 'pulsa-transfer', 'TELKOMSEL', 65368, 67983, 67329, 67329, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41012, 'telkomselpulsatransfer75.000', 'ST75', 'Telkomsel Pulsa Transfer 75.000', 'pulsa-transfer', 'TELKOMSEL', 69850, 72644, 71946, 71946, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41013, 'telkomselpulsatransfer80.000', 'ST80', 'Telkomsel Pulsa Transfer 80.000', 'pulsa-transfer', 'TELKOMSEL', 74684, 77671, 76925, 76925, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41014, 'telkomselpulsatransfer85.000', 'ST85', 'Telkomsel Pulsa Transfer 85.000', 'pulsa-transfer', 'TELKOMSEL', 79159, 82325, 81534, 81534, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41015, 'telkomselpulsatransfer90.000', 'ST90', 'Telkomsel Pulsa Transfer 90.000', 'pulsa-transfer', 'TELKOMSEL', 83734, 87083, 86246, 86246, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41016, 'telkomselpulsatransfer95.000', 'ST95', 'Telkomsel Pulsa Transfer 95.000', 'pulsa-transfer', 'TELKOMSEL', 88225, 91754, 90872, 90872, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41017, 'telkomseltambahmasaaktifkartu10hari', 'TMAS10', 'Telkomsel Tambah Masa Aktif Kartu 10 Hari', 'paket-internet', 'TELKOMSEL', 3761, 3911, 3874, 3874, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41018, 'telkomseltambahmasaaktifkartu15hari', 'TMAS15', 'Telkomsel Tambah Masa Aktif Kartu 15 Hari', 'paket-internet', 'TELKOMSEL', 5640, 5866, 5809, 5809, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41019, 'telkomseltambahmasaaktifkartu180hari', 'TMAS180', 'Telkomsel Tambah Masa Aktif Kartu 180 Hari', 'paket-internet', 'TELKOMSEL', 56695, 58963, 58396, 58396, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41020, 'telkomseltambahmasaaktifkartu30hari', 'TMA30', 'Telkomsel Tambah Masa Aktif Kartu 30 Hari', 'paket-internet', 'TELKOMSEL', 12525, 13026, 12901, 12901, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41021, 'telkomseltambahmasaaktifkartu30hari', 'TMA302', 'Telkomsel Tambah Masa Aktif Kartu 30 Hari', 'paket-internet', 'TELKOMSEL', 13200, 13728, 13596, 13596, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41022, 'telkomseltambahmasaaktifkartu360hari', 'TMAS360', 'Telkomsel Tambah Masa Aktif Kartu 360 Hari', 'paket-internet', 'TELKOMSEL', 104275, 108446, 107403, 107403, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41023, 'telkomseltambahmasaaktifkartu5hari', 'TMAS5', 'Telkomsel Tambah Masa Aktif Kartu 5 Hari', 'paket-internet', 'TELKOMSEL', 2450, 2548, 2524, 2524, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41024, 'telkomseltambahmasaaktifkartu90hari', 'TMAS90', 'Telkomsel Tambah Masa Aktif Kartu 90 Hari', 'paket-internet', 'TELKOMSEL', 30410, 31626, 31322, 31322, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41026, 'telkomseltelepon100.000', 'STLP100', 'Telkomsel Telepon 100.000', 'paket-telepon', 'TELKOMSEL', 89175, 92742, 91850, 91850, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41027, 'telkomseltelepon1000menitsesama,100menitsemuaop/30hari', 'STLP10100302', 'Telkomsel Telepon 1000 Menit Sesama, 100 Menit Semua Op / 30 Hari', 'paket-telepon', 'TELKOMSEL', 54655, 56841, 56295, 56295, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3);
INSERT INTO `tb_prepaid` (`cuid`, `slug`, `code`, `title`, `kategori`, `brand`, `harga_modal`, `harga_jual`, `harga_reseller`, `harga_h2h`, `harga_coret`, `komisi`, `poin`, `image`, `status`, `created_date`, `jenis`, `product_type`) VALUES
(41029, 'telkomseltelepon130.000', 'STLP130', 'Telkomsel Telepon 130.000', 'paket-telepon', 'TELKOMSEL', 100775, 104806, 103798, 103798, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41030, 'telkomseltelepon170menitsesama+30menitsemuaop/3hari', 'STLP1903', 'Telkomsel Telepon 170 Menit Sesama + 30 Menit Semua Op / 3 Hari', 'paket-telepon', 'TELKOMSEL', 10610, 11034, 10928, 10928, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41031, 'telkomseltelepon1700menitonnet/7hari', 'STLP17007', 'Telkomsel Telepon 1700 Menit On Net / 7 Hari', 'paket-telepon', 'TELKOMSEL', 40700, 42328, 41921, 41921, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41032, 'telkomseltelepon20.000', 'STLP20', 'Telkomsel Telepon 20.000', 'paket-telepon', 'TELKOMSEL', 12675, 13182, 13055, 13055, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41033, 'telkomseltelepon200menitsesama/30hari', 'STLP2003', 'Telkomsel Telepon 200 Menit Sesama / 30 Hari', 'paket-telepon', 'TELKOMSEL', 56575, 58838, 58272, 58272, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41034, 'telkomseltelepon25menitsesama/1hari', 'STLP251', 'Telkomsel Telepon 25 Menit Sesama / 1 Hari', 'paket-telepon', 'TELKOMSEL', 4505, 4685, 4640, 4640, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41035, 'telkomseltelepon25.000', 'STLP25', 'Telkomsel Telepon 25.000', 'paket-telepon', 'TELKOMSEL', 20390, 21206, 21002, 21002, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41037, 'telkomseltelepon350menitsesama+50menitsemuaop/7hari', 'STLP3557', 'Telkomsel Telepon 350 Menit Sesama + 50 Menit Semua Op / 7 Hari', 'paket-telepon', 'TELKOMSEL', 21060, 21902, 21692, 21692, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41038, 'telkomseltelepon5menitsesama/1hari', 'STLP51', 'Telkomsel Telepon 5 Menit Sesama / 1 Hari', 'paket-telepon', 'TELKOMSEL', 2230, 2319, 2297, 2297, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41039, 'telkomseltelepon5.000', 'STLP5', 'Telkomsel Telepon 5.000', 'paket-telepon', 'TELKOMSEL', 5065, 5268, 5217, 5217, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41040, 'telkomseltelepon50menitsesama/3hari', 'STLP503', 'Telkomsel Telepon 50 Menit Sesama / 3 Hari', 'paket-telepon', 'TELKOMSEL', 11860, 12334, 12216, 12216, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41041, 'telkomseltelepon50menitsesama/7hari', 'STLP507', 'Telkomsel Telepon 50 Menit Sesama / 7 Hari', 'paket-telepon', 'TELKOMSEL', 26650, 27716, 27450, 27450, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41042, 'telkomseltelepon50.000', 'STLP50', 'Telkomsel Telepon 50.000', 'paket-telepon', 'TELKOMSEL', 47775, 49686, 49208, 49208, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41043, 'telkomseltelepon80.000', 'STLP80', 'Telkomsel Telepon 80.000', 'paket-telepon', 'TELKOMSEL', 91025, 94666, 93756, 93756, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41044, 'telkomseltelepon9000menitonnet/30hari', 'STLP900030', 'Telkomsel Telepon 9000 Menit On Net / 30 Hari', 'paket-telepon', 'TELKOMSEL', 101075, 105118, 104107, 104107, 0, 0, 0, 'telkomsel.png', 1, '2023-10-08', 4, 3),
(41049, 'three1.000', 'T1', 'Three 1.000', 'pulsa-reguler', 'TRI', 1466, 1525, 1510, 1510, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41051, 'three10.000', 'T10', 'Three 10.000', 'pulsa-reguler', 'TRI', 10605, 11029, 10923, 10923, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41052, 'three100.000', 'T100', 'Three 100.000', 'pulsa-reguler', 'TRI', 97881, 101796, 100817, 100817, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41053, 'three15.000', 'T15', 'Three 15.000', 'pulsa-reguler', 'TRI', 15110, 15714, 15563, 15563, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41054, 'three150.000', 'T150', 'Three 150.000', 'pulsa-reguler', 'TRI', 146675, 152542, 151075, 151075, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41055, 'three2.000', 'T2', 'Three 2.000', 'pulsa-reguler', 'TRI', 2431, 2528, 2504, 2504, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41056, 'three20.000', 'T20', 'Three 20.000', 'pulsa-reguler', 'TRI', 20010, 20810, 20610, 20610, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41058, 'three25.000', 'T25', 'Three 25.000', 'pulsa-reguler', 'TRI', 24730, 25719, 25472, 25472, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41059, 'three3.000', 'T3', 'Three 3.000', 'pulsa-reguler', 'TRI', 3405, 3541, 3507, 3507, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41060, 'three30.000', 'T30', 'Three 30.000', 'pulsa-reguler', 'TRI', 29630, 30815, 30519, 30519, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41062, 'three4.000', 'T4', 'Three 4.000', 'pulsa-reguler', 'TRI', 4580, 4763, 4717, 4717, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41063, 'three40.000', 'T40', 'Three 40.000', 'pulsa-reguler', 'TRI', 39642, 41228, 40831, 40831, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41064, 'three5.000', 'T5', 'Three 5.000', 'pulsa-reguler', 'TRI', 5638, 5864, 5807, 5807, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41065, 'three50.000', 'T50', 'Three 50.000', 'pulsa-reguler', 'TRI', 48875, 50830, 50341, 50341, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41067, 'three75.000', 'T75', 'Three 75.000', 'pulsa-reguler', 'TRI', 74397, 77373, 76629, 76629, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41068, 'three80.000', 'T80', 'Three 80.000', 'pulsa-reguler', 'TRI', 78492, 81632, 80847, 80847, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41069, 'threepulsatransfer10.000', 'TT', 'Three Pulsa Transfer 10.000', 'pulsa-transfer', 'TRI', 10475, 10894, 10789, 10789, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41070, 'threepulsatransfer100.000', 'TT100', 'Three Pulsa Transfer 100.000', 'pulsa-transfer', 'TRI', 95955, 99793, 98834, 98834, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41071, 'threepulsatransfer15.000', 'TT15', 'Three Pulsa Transfer 15.000', 'pulsa-transfer', 'TRI', 14886, 15481, 15333, 15333, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41072, 'threepulsatransfer20.000', 'TT20', 'Three Pulsa Transfer 20.000', 'pulsa-transfer', 'TRI', 19459, 20237, 20043, 20043, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41073, 'threepulsatransfer25.000', 'TT25', 'Three Pulsa Transfer 25.000', 'pulsa-transfer', 'TRI', 24570, 25553, 25307, 25307, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41074, 'threepulsatransfer30.000', 'TT30', 'Three Pulsa Transfer 30.000', 'pulsa-transfer', 'TRI', 29124, 30289, 29998, 29998, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41075, 'threepulsatransfer35.000', 'TT35', 'Three Pulsa Transfer 35.000', 'pulsa-transfer', 'TRI', 33717, 35066, 34729, 34729, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41076, 'threepulsatransfer40.000', 'TT40', 'Three Pulsa Transfer 40.000', 'pulsa-transfer', 'TRI', 39172, 40739, 40347, 40347, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41077, 'threepulsatransfer45.000', 'TT45', 'Three Pulsa Transfer 45.000', 'pulsa-transfer', 'TRI', 43792, 45544, 45106, 45106, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41078, 'threepulsatransfer5.000', 'TT5', 'Three Pulsa Transfer 5.000', 'pulsa-transfer', 'TRI', 5669, 5896, 5839, 5839, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41079, 'threepulsatransfer50.000', 'TT50', 'Three Pulsa Transfer 50.000', 'pulsa-transfer', 'TRI', 47963, 49882, 49402, 49402, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41080, 'threepulsatransfer55.000', 'TT55', 'Three Pulsa Transfer 55.000', 'pulsa-transfer', 'TRI', 53736, 55885, 55348, 55348, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41081, 'threepulsatransfer60.000', 'TT60', 'Three Pulsa Transfer 60.000', 'pulsa-transfer', 'TRI', 58200, 60528, 59946, 59946, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41082, 'threepulsatransfer65.000', 'TT65', 'Three Pulsa Transfer 65.000', 'pulsa-transfer', 'TRI', 62875, 65390, 64761, 64761, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41083, 'threepulsatransfer70.000', 'TT70', 'Three Pulsa Transfer 70.000', 'pulsa-transfer', 'TRI', 66465, 69124, 68459, 68459, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41084, 'threepulsatransfer75.000', 'TT75', 'Three Pulsa Transfer 75.000', 'pulsa-transfer', 'TRI', 71323, 74176, 73463, 73463, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41085, 'threepulsatransfer80.000', 'TT80', 'Three Pulsa Transfer 80.000', 'pulsa-transfer', 'TRI', 76259, 79309, 78547, 78547, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41086, 'threepulsatransfer85.000', 'TT85', 'Three Pulsa Transfer 85.000', 'pulsa-transfer', 'TRI', 80285, 83496, 82694, 82694, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41087, 'threepulsatransfer90.000', 'TT90', 'Three Pulsa Transfer 90.000', 'pulsa-transfer', 'TRI', 85529, 88950, 88095, 88095, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41088, 'threepulsatransfer95.000', 'TT95', 'Three Pulsa Transfer 95.000', 'pulsa-transfer', 'TRI', 90164, 93771, 92869, 92869, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41090, 'tixid10.000', 'TIXID10', 'TIX ID 10.000', 'saldo-emoney', 'TIX ID', 10655, 11081, 10975, 10975, 0, 0, 0, 'tix_id.png', 1, '2023-10-08', 4, 4),
(41091, 'tixid100.000', 'TIXID100', 'TIX ID 100.000', 'saldo-emoney', 'TIX ID', 100675, 104702, 103695, 103695, 0, 0, 0, 'tix_id.png', 1, '2023-10-08', 4, 4),
(41092, 'tixid200.000', 'TIXID200', 'TIX ID 200.000', 'saldo-emoney', 'TIX ID', 200675, 208702, 206695, 206695, 0, 0, 0, 'tix_id.png', 1, '2023-10-08', 4, 4),
(41093, 'tixid25.000', 'TIXID25', 'TIX ID 25.000', 'saldo-emoney', 'TIX ID', 26385, 27440, 27177, 27177, 0, 0, 0, 'tix_id.png', 1, '2023-10-08', 4, 4),
(41095, 'tri250smsalloperator7hari', 'TSMS2507', 'Tri 250 SMS ALL Operator 7 Hari', 'paket-telepon', 'TRI', 5780, 6011, 5953, 5953, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41096, 'tri250smsalloperatorsampaimasaaktifkartu', 'TSMS250', 'Tri 250 SMS ALL Operator Sampai Masa Aktif Kartu', 'paket-telepon', 'TRI', 10445, 10863, 10758, 10758, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41098, 'tridata1gb/7hari', 'TD1GB', 'Tri Data 1 GB / 7 Hari', 'paket-internet', 'TRI', 13835, 14388, 14250, 14250, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41099, 'tridata10gb/30hari', 'TD10GB', 'Tri Data 10 GB / 30 Hari', 'paket-internet', 'TRI', 54225, 56394, 55852, 55852, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41100, 'tridata10gb(semuajaringan)+10gb(youtube+netflix)/30hari', 'TD10GBYTN', 'Tri Data 10 GB( Semua Jaringan) + 10GB ( Youtube + Netflix) / 30 Hari', 'paket-internet', 'TRI', 67800, 70512, 69834, 69834, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41101, 'tridata12gb/30hari', 'TD12GB', 'Tri Data 12 GB / 30 Hari', 'paket-internet', 'TRI', 48325, 50258, 49775, 49775, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41102, 'tridata15gb/30hari', 'TD15GB', 'Tri Data 15 GB / 30 Hari', 'paket-internet', 'TRI', 60150, 62556, 61955, 61955, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41103, 'tridata2.75gb/7hari', 'TD275', 'Tri Data 2.75 GB / 7 Hari', 'paket-internet', 'TRI', 15410, 16026, 15872, 15872, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41104, 'tridata20gb/30hari', 'TD20GB', 'Tri Data 20 GB / 30 Hari', 'paket-internet', 'TRI', 67650, 70356, 69680, 69680, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41105, 'tridata22gb+unlimitedyoutubedanviu/30hari', 'TD10GBUNL', 'Tri Data 22 GB + Unlimited YouTube Dan VIU / 30 Hari', 'paket-internet', 'TRI', 70581, 73404, 72698, 72698, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41106, 'tridata30gb/30hari', 'TD30GB', 'Tri Data 30 GB / 30 Hari', 'paket-internet', 'TRI', 75150, 78156, 77405, 77405, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41107, 'tridata33gb/30hari', 'TD33GB', 'Tri Data 33 GB / 30 Hari', 'paket-internet', 'TRI', 84175, 87542, 86700, 86700, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41109, 'tridata38gb/30hari', 'TD38GB', 'Tri Data 38 GB / 30 Hari', 'paket-internet', 'TRI', 82125, 85410, 84589, 84589, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41110, 'tridata4g10gb/30hari', 'TD4G10', 'Tri Data 4G 10 GB / 30 Hari', 'paket-internet', 'TRI', 49300, 51272, 50779, 50779, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41111, 'tridata4g12gb/30hari', 'TD4G12', 'Tri Data 4G 12 GB / 30 Hari', 'paket-internet', 'TRI', 49850, 51844, 51346, 51346, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41112, 'tridata4g15gb/30hari', 'TD4G15', 'Tri Data 4G 15 GB / 30 Hari', 'paket-internet', 'TRI', 58583, 60926, 60340, 60340, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41115, 'tridata4g38gb/30hari', 'TD4G38', 'Tri Data 4G 38 GB / 30 Hari', 'paket-internet', 'TRI', 81428, 84685, 83871, 83871, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41117, 'tridata50gb/30hari', 'TD50GB', 'Tri Data 50 GB / 30 Hari', 'paket-internet', 'TRI', 110150, 114556, 113455, 113455, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41121, 'tridatahappy1gb/1hari', 'DTHP511', 'Tri Data Happy 1 GB / 1 Hari', 'paket-internet', 'TRI', 3750, 3900, 3863, 3863, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41122, 'tridatahappy1gb/3hari', 'DTHP1', 'Tri Data Happy 1 GB / 3 Hari', 'paket-internet', 'TRI', 6530, 6791, 6726, 6726, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41123, 'tridatahappy1.5gb/1hari', 'DTHP151', 'Tri Data Happy 1.5 GB / 1 Hari', 'paket-internet', 'TRI', 3476, 3615, 3580, 3580, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41124, 'tridatahappy1.5gb/7hari', 'DTHP157', 'Tri Data Happy 1.5 GB / 7 Hari', 'paket-internet', 'TRI', 8626, 8971, 8885, 8885, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41125, 'tridatahappy100gb/30hari', 'DTHP10030', 'Tri Data Happy 100 GB / 30 Hari', 'paket-internet', 'TRI', 195700, 203528, 201571, 201571, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41126, 'tridatahappy11gb/30hari', 'DTHP1130', 'Tri Data Happy 11 GB / 30 Hari', 'paket-internet', 'TRI', 42036, 43717, 43297, 43297, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41127, 'tridatahappy12gb/30hari', 'DTHP12', 'Tri Data Happy 12 GB / 30 Hari', 'paket-internet', 'TRI', 51606, 53670, 53154, 53154, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41128, 'tridatahappy14gb/30hari', 'DTHP1430', 'Tri Data Happy 14 GB / 30 Hari', 'paket-internet', 'TRI', 54975, 57174, 56624, 56624, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41129, 'tridatahappy18gb/30hari', 'DTHP18', 'Tri Data Happy 18 GB / 30 Hari', 'paket-internet', 'TRI', 77535, 80636, 79861, 79861, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41130, 'tridatahappy2gb/1hari', 'DTHP21', 'Tri Data Happy 2 GB / 1 Hari', 'paket-internet', 'TRI', 5149, 5355, 5303, 5303, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41131, 'tridatahappy2gb/5hari', 'DTHP2', 'Tri Data Happy 2 GB / 5 Hari', 'paket-internet', 'TRI', 9549, 9931, 9835, 9835, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41132, 'tridatahappy2.5gb/1hari', 'DTHP251', 'Tri Data Happy 2.5 GB / 1 Hari', 'paket-internet', 'TRI', 5580, 5803, 5747, 5747, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41134, 'tridatahappy26gb/30hari', 'DTHP2630', 'Tri Data Happy 26 GB / 30 Hari', 'paket-internet', 'TRI', 77475, 80574, 79799, 79799, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41135, 'tridatahappy3gb/3hari', 'DTHP3', 'Tri Data Happy 3 GB / 3 Hari', 'paket-internet', 'TRI', 9500, 9880, 9785, 9785, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41136, 'tridatahappy3gb/30hari', 'DTHP330', 'Tri Data Happy 3 GB / 30 Hari', 'paket-internet', 'TRI', 14209, 14777, 14635, 14635, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41137, 'tridatahappy3gb/7hari', 'DTHP37', 'Tri Data Happy 3 GB / 7 Hari', 'paket-internet', 'TRI', 14150, 14716, 14575, 14575, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41138, 'tridatahappy3.5gb/5hari', 'DTHP35', 'Tri Data Happy 3.5 GB / 5 Hari', 'paket-internet', 'TRI', 13877, 14432, 14293, 14293, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41139, 'tridatahappy30gb/30hari', 'DTHP3030', 'Tri Data Happy 30 GB / 30 Hari', 'paket-internet', 'TRI', 67900, 70616, 69937, 69937, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41140, 'tridatahappy4.5gb/30hari', 'DTHP430', 'Tri Data Happy 4.5 GB / 30 Hari', 'paket-internet', 'TRI', 20650, 21476, 21270, 21270, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41142, 'tridatahappy45gb/30hari', 'DTHP4530', 'Tri Data Happy 45 GB / 30 Hari', 'paket-internet', 'TRI', 99530, 103511, 102516, 102516, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41143, 'tridatahappy5gb/1hari', 'DTHP51', 'Tri Data Happy 5 GB / 1 Hari', 'paket-internet', 'TRI', 9545, 9927, 9831, 9831, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41144, 'tridatahappy5gb/3hari', 'DTHP53', 'Tri Data Happy 5 GB / 3 Hari', 'paket-internet', 'TRI', 14293, 14865, 14722, 14722, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41145, 'tridatahappy5gb/7hari', 'DTHP57', 'Tri Data Happy 5 GB / 7 Hari', 'paket-internet', 'TRI', 18542, 19284, 19098, 19098, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41146, 'tridatahappy5gb/7hari', 'DTHP5', 'Tri Data Happy 5 GB / 7 Hari', 'paket-internet', 'TRI', 25650, 26676, 26420, 26420, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41147, 'tridatahappy52gb/30hari', 'DTHP52', 'Tri Data Happy 52 GB / 30 Hari', 'paket-internet', 'TRI', 71395, 74251, 73537, 73537, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41148, 'tridatahappy55gb/30hari', 'DTHP5530', 'Tri Data Happy 55 GB / 30 Hari', 'paket-internet', 'TRI', 111485, 115944, 114830, 114830, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41149, 'tridatahappy6gb/5hari', 'DTHP6', 'Tri Data Happy 6 GB / 5 Hari', 'paket-internet', 'TRI', 18095, 18819, 18638, 18638, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41150, 'tridatahappy7gb/30hari', 'DTHP730', 'Tri Data Happy 7 GB / 30 Hari', 'paket-internet', 'TRI', 28190, 29318, 29036, 29036, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41151, 'tridatahappy9gb/10hari', 'DTHP9', 'Tri Data Happy 9 GB / 10 Hari', 'paket-internet', 'TRI', 26200, 27248, 26986, 26986, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41152, 'tridatahappy9gb/10hari', 'DTHP910', 'Tri Data Happy 9 GB / 10 Hari', 'paket-internet', 'TRI', 27620, 28725, 28449, 28449, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41153, 'tridatahome117gb/30hari', 'TDH117', 'Tri Data Home 117 GB / 30 Hari', 'paket-internet', 'TRI', 112150, 116636, 115515, 115515, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41154, 'tridatahome150gb/30hari', 'TDH150', 'Tri Data Home 150 GB / 30 Hari', 'paket-internet', 'TRI', 143050, 148772, 147342, 147342, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41155, 'tridatamini1gb/5hari', 'TDM1', 'Tri Data Mini 1 GB / 5 Hari', 'paket-internet', 'TRI', 8500, 8840, 8755, 8755, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41156, 'tridatamini1.5gb/5hari', 'TDM15', 'Tri Data Mini 1.5 GB / 5 Hari', 'paket-internet', 'TRI', 9160, 9526, 9435, 9435, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41157, 'tridatamini1.5gb/7hari', 'TDM157', 'Tri Data Mini 1.5 GB / 7 Hari', 'paket-internet', 'TRI', 12149, 12635, 12513, 12513, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41158, 'tridatamini5gb/7hari', 'TDM57', 'Tri Data Mini 5 GB / 7 Hari', 'paket-internet', 'TRI', 19410, 20186, 19992, 19992, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41161, 'trimixcombo2gb+20menit', 'TDMC2', 'Tri Mix Combo 2 GB + 20 Menit', 'paket-internet', 'TRI', 34850, 36244, 35896, 35896, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41163, 'trimixcombo38gb+30menit', 'TDMC38', 'Tri Mix Combo 38 GB + 30 Menit', 'paket-internet', 'TRI', 89650, 93236, 92340, 92340, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41164, 'trimixsmall2.75gb3hari', 'TDMS275', 'Tri Mix Small 2.75 GB 3 Hari', 'paket-internet', 'TRI', 10873, 11308, 11199, 11199, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41165, 'trimixsmall3gb3hari', 'TDMS3', 'Tri Mix Small 3 GB 3 Hari', 'paket-internet', 'TRI', 19794, 20586, 20388, 20388, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41166, 'trimixsmall3.75gb14hari', 'TDMS375', 'Tri Mix Small 3.75 GB 14 Hari', 'paket-internet', 'TRI', 24511, 25491, 25246, 25246, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41167, 'trimixsmall5gb1hari', 'TDMS5', 'Tri Mix Small 5 GB 1 Hari', 'paket-internet', 'TRI', 5052, 5254, 5204, 5204, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41168, 'trimixsuper10gb30hari', 'TDMS10', 'Tri Mix Super 10 GB 30 Hari', 'paket-internet', 'TRI', 49375, 51350, 50856, 50856, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41169, 'trimixsuper24gb30hari', 'TDMS24', 'Tri Mix Super 24 GB 30 Hari', 'paket-internet', 'TRI', 88074, 91597, 90716, 90716, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41170, 'trimixsuper30gb30hari', 'TDMS30', 'Tri Mix Super 30 GB 30 Hari', 'paket-internet', 'TRI', 97821, 101734, 100756, 100756, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41171, 'trinelpon++10.000', 'TTLP10', 'Tri Nelpon++ 10.000', 'paket-telepon', 'TRI', 10255, 10665, 10563, 10563, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41174, 'tritambahmasaaktifkartu4bulan', 'TMA120', 'Tri Tambah Masa Aktif Kartu 4 Bulan', 'paket-internet', 'TRI', 3400, 3536, 3502, 3502, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41175, 'tritelepon150menitkesemuaop30hari', 'TTLP15030', 'Tri Telepon 150 Menit Ke Semua Op 30 Hari', 'paket-telepon', 'TRI', 29875, 31070, 30771, 30771, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41176, 'tritelepon20menitkesemuaop7hari', 'TTLP207', 'Tri Telepon 20 Menit Ke Semua Op 7 Hari', 'paket-telepon', 'TRI', 5110, 5314, 5263, 5263, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41178, 'tritelepon60menitkesemuaoperator30hari', 'TTLP6030', 'Tri Telepon 60 Menit Ke Semua Operator 30 Hari', 'paket-telepon', 'TRI', 15025, 15626, 15476, 15476, 0, 0, 0, 'tri.png', 1, '2023-10-08', 4, 3),
(41309, 'xl10.000', 'XLP10', 'Xl 10.000', 'pulsa-reguler', 'XL', 10905, 11341, 11232, 11232, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41310, 'xl100.000', 'XLP100', 'Xl 100.000', 'pulsa-reguler', 'XL', 98950, 102908, 101919, 101919, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41311, 'xl15.000', 'XLP15', 'Xl 15.000', 'pulsa-reguler', 'XL', 15069, 15672, 15521, 15521, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41312, 'xl150.000', 'XLP150', 'Xl 150.000', 'pulsa-reguler', 'XL', 149375, 155350, 153856, 153856, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41313, 'xl200.000', 'XLP200', 'Xl 200.000', 'pulsa-reguler', 'XL', 198876, 206831, 204842, 204842, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41314, 'xl25.000', 'XLP25', 'Xl 25.000', 'pulsa-reguler', 'XL', 24970, 25969, 25719, 25719, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41315, 'xl30.000', 'XLP30', 'XL 30.000', 'pulsa-reguler', 'XL', 29985, 31184, 30885, 30885, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41318, 'xl5.000', 'XLP5', 'Xl 5.000', 'pulsa-reguler', 'XL', 5954, 6192, 6133, 6133, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41319, 'xl50.000', 'XLP50', 'Xl 50.000', 'pulsa-reguler', 'XL', 49815, 51808, 51309, 51309, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41321, 'xlcombolite13gb/30hari', 'XLDL13', 'XL Combo LITE 13 GB / 30 Hari', 'paket-internet', 'XL', 86650, 90116, 89250, 89250, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41322, 'xlcombolite25gb/30hari', 'XLDL25', 'XL Combo LITE 25 GB / 30 Hari', 'paket-internet', 'XL', 115460, 120078, 118924, 118924, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41324, 'xlcombolite37gb/30hari', 'XLDL37', 'XL Combo LITE 37 GB / 30 Hari', 'paket-internet', 'XL', 130150, 135356, 134055, 134055, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41325, 'xlcombolite4.5gb/30hari', 'XLDL45', 'XL Combo LITE 4.5 GB / 30 Hari', 'paket-internet', 'XL', 40050, 41652, 41252, 41252, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41326, 'xlcombolite7gb/30hari', 'XLDL7', 'XL Combo LITE 7 GB / 30 Hari', 'paket-internet', 'XL', 63000, 65520, 64890, 64890, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41327, 'xlhotrod1.5gb/30hari', 'XLDHR1', 'XL HOTROD 1.5 GB / 30 Hari', 'paket-internet', 'XL', 40275, 41886, 41483, 41483, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41328, 'xlhotrod12gb/30hari', 'XLDHR12', 'XL HOTROD 12 GB / 30 Hari', 'paket-internet', 'XL', 150050, 156052, 154552, 154552, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41330, 'xlhotrod3gb/30hari', 'XLDHR3', 'XL HOTROD 3 GB / 30 Hari', 'paket-internet', 'XL', 48175, 50102, 49620, 49620, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41331, 'xlhotrod6gb/30hari', 'XLDHR6', 'XL HOTROD 6 GB / 30 Hari', 'paket-internet', 'XL', 95250, 99060, 98108, 98108, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41332, 'xlhotrod8gb/30hari', 'XLDHR8', 'XL HOTROD 8 GB / 30 Hari', 'paket-internet', 'XL', 123650, 128596, 127360, 127360, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41335, 'xlnelponsemuaoperator140.000', 'XTLP14000', 'XL Nelpon Semua Operator 140.000', 'paket-telepon', 'XL', 132510, 137810, 136485, 136485, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41336, 'xlnelponsemuaoperator40.000', 'XTLP40000', 'XL Nelpon Semua Operator 40.000', 'paket-telepon', 'XL', 37985, 39504, 39125, 39125, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41337, 'xlnelponsemuaoperator60.000', 'XTLP60000', 'XL Nelpon Semua Operator 60.000', 'paket-telepon', 'XL', 35150, 36556, 36205, 36205, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41339, 'xlnelponsesama350menit+operatorlain50menit/7hari', 'XTLP4007', 'XL Nelpon Sesama 350 Menit + Operator Lain 50 Menit / 7 Hari', 'paket-telepon', 'XL', 10160, 10566, 10465, 10465, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41340, 'xlpulsatransfer10.000', 'XLPT10', 'Xl Pulsa Transfer 10.000', 'pulsa-transfer', 'XL', 10065, 10468, 10367, 10367, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41341, 'xlpulsatransfer100.000', 'XLPT100', 'Xl Pulsa Transfer 100.000', 'pulsa-transfer', 'XL', 94811, 98603, 97655, 97655, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41342, 'xlpulsatransfer15.000', 'XLPT15', 'Xl Pulsa Transfer 15.000', 'pulsa-transfer', 'XL', 14559, 15141, 14996, 14996, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41343, 'xlpulsatransfer20.000', 'XLPT20', 'Xl Pulsa Transfer 20.000', 'pulsa-transfer', 'XL', 19725, 20514, 20317, 20317, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41344, 'xlpulsatransfer25.000', 'XLPT25', 'Xl Pulsa Transfer 25.000', 'pulsa-transfer', 'XL', 24349, 25323, 25079, 25079, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41345, 'xlpulsatransfer30.000', 'XLPT30', 'Xl Pulsa Transfer 30.000', 'pulsa-transfer', 'XL', 29500, 30680, 30385, 30385, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41346, 'xlpulsatransfer35.000', 'XLPT35', 'Xl Pulsa Transfer 35.000', 'pulsa-transfer', 'XL', 33454, 34792, 34458, 34458, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41347, 'xlpulsatransfer40.000', 'XLPT40', 'Xl Pulsa Transfer 40.000', 'pulsa-transfer', 'XL', 37317, 38810, 38437, 38437, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41348, 'xlpulsatransfer45.000', 'XLPT45', 'Xl Pulsa Transfer 45.000', 'pulsa-transfer', 'XL', 41979, 43658, 43238, 43238, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41349, 'xlpulsatransfer5.000', 'XLPT5', 'Xl Pulsa Transfer 5.000', 'pulsa-transfer', 'XL', 6168, 6415, 6353, 6353, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41350, 'xlpulsatransfer50.000', 'XLPT50', 'Xl Pulsa Transfer 50.000', 'pulsa-transfer', 'XL', 46715, 48584, 48116, 48116, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41351, 'xlpulsatransfer55.000', 'XLPT55', 'Xl Pulsa Transfer 55.000', 'pulsa-transfer', 'XL', 52595, 54699, 54173, 54173, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41352, 'xlpulsatransfer60.000', 'XLPT60', 'Xl Pulsa Transfer 60.000', 'pulsa-transfer', 'XL', 56284, 58535, 57973, 57973, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41353, 'xlpulsatransfer65.000', 'XLPT65', 'Xl Pulsa Transfer 65.000', 'pulsa-transfer', 'XL', 62315, 64808, 64184, 64184, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41354, 'xlpulsatransfer70.000', 'XLPT70', 'Xl Pulsa Transfer 70.000', 'pulsa-transfer', 'XL', 64903, 67499, 66850, 66850, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41355, 'xlpulsatransfer75.000', 'XLPT75', 'Xl Pulsa Transfer 75.000', 'pulsa-transfer', 'XL', 69398, 72174, 71480, 71480, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41356, 'xlpulsatransfer80.000', 'XLPT80', 'Xl Pulsa Transfer 80.000', 'pulsa-transfer', 'XL', 74813, 77806, 77057, 77057, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41357, 'xlpulsatransfer85.000', 'XLPT85', 'Xl Pulsa Transfer 85.000', 'pulsa-transfer', 'XL', 78606, 81750, 80964, 80964, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41358, 'xlpulsatransfer90.000', 'XLPT90', 'Xl Pulsa Transfer 90.000', 'pulsa-transfer', 'XL', 83159, 86485, 85654, 85654, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41359, 'xlxtrabicara30.000/30hari', 'XTLP3000030', 'XL XTRA Bicara 30.000 / 30 Hari', 'paket-telepon', 'XL', 30175, 31382, 31080, 31080, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41360, 'xlxtrabicara35.000/30hari', 'XTLP3500030', 'XL XTRA Bicara 35.000 / 30 Hari', 'paket-telepon', 'XL', 35175, 36582, 36230, 36230, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41361, 'xlxtracombo10gb+20gb/30hari', 'XLDXC10', 'XL Xtra Combo 10 GB + 20 GB / 30 Hari', 'paket-internet', 'XL', 82420, 85717, 84893, 84893, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41362, 'xlxtracombo15gb+30gb/30hari', 'XLDXC15', 'XL Xtra Combo 15 GB + 30 GB / 30 Hari', 'paket-internet', 'XL', 114945, 119543, 118393, 118393, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41363, 'xlxtracombo20gb+40gb/30hari', 'XLDXC20', 'XL Xtra Combo 20 GB + 40 GB / 30 Hari', 'paket-internet', 'XL', 162450, 168948, 167324, 167324, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41364, 'xlxtracombo35gb+70gb/30hari', 'XLDXC35', 'XL Xtra Combo 35 GB + 70 GB / 30 Hari', 'paket-internet', 'XL', 218325, 227058, 224875, 224875, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41365, 'xlxtracombo5gb+10gb/30hari', 'XLDXC5', 'XL Xtra Combo 5 GB + 10 GB / 30 Hari', 'paket-internet', 'XL', 54920, 57117, 56568, 56568, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41366, 'xlxtracomboflexl', 'XLDCFL', 'XL Xtra Combo Flex L', 'paket-internet', 'XL', 58325, 60658, 60075, 60075, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41367, 'xlxtracomboflexm', 'XLDCFM', 'XL Xtra Combo Flex M', 'paket-internet', 'XL', 39275, 40846, 40453, 40453, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41368, 'xlxtracomboflexs', 'XLDCFS', 'XL Xtra Combo Flex S', 'paket-internet', 'XL', 17010, 17690, 17520, 17520, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41369, 'xlxtracomboflexxl', 'XLDCFXL', 'XL Xtra Combo Flex XL', 'paket-internet', 'XL', 83650, 86996, 86160, 86160, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41370, 'xlxtracomboflexxxl', 'XLDCFXXL', 'XL Xtra Combo Flex XXL', 'paket-internet', 'XL', 113157, 117683, 116552, 116552, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41371, 'xlxtracomboflexxxxl', 'XLDCFXXXL', 'XL Xtra Combo Flex XXXL', 'paket-internet', 'XL', 128300, 133432, 132149, 132149, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41372, 'xlxtracombovip10gb+20gb/30hari', 'XLDXCV10', 'XL Xtra Combo VIP 10 GB + 20 GB / 30 Hari', 'paket-internet', 'XL', 83070, 86393, 85562, 85562, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41373, 'xlxtracombovip15gb+30gb/30hari', 'XLDXCV15', 'XL Xtra Combo VIP 15 GB + 30 GB / 30 Hari', 'paket-internet', 'XL', 123475, 128414, 127179, 127179, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41374, 'xlxtracombovip20gb+40gb/30hari', 'XLDXCV20', 'XL Xtra Combo VIP 20 GB + 40 GB / 30 Hari', 'paket-internet', 'XL', 168525, 175266, 173581, 173581, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41375, 'xlxtracombovip35gb+70gb/30hari', 'XLDXCV35', 'XL Xtra Combo VIP 35 GB + 70 GB / 30 Hari', 'paket-internet', 'XL', 218340, 227074, 224890, 224890, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41376, 'xlxtracombovip5gb+10gb/30hari', 'XLDXCV5', 'XL Xtra Combo VIP 5 GB + 10 GB / 30 Hari', 'paket-internet', 'XL', 64000, 66560, 65920, 65920, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3),
(41377, 'xlxtrakuota30gb-30hari', 'XLDXC30', 'XL XTRA KUOTA 30 GB - 30 HARI', 'paket-internet', 'XL', 12055, 12537, 12417, 12417, 0, 0, 0, 'xl.png', 1, '2023-10-08', 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_produk`
--

CREATE TABLE `tb_produk` (
  `cuid` int(11) NOT NULL,
  `slug` text NOT NULL,
  `code` text NOT NULL,
  `title` text NOT NULL,
  `kategori` text NOT NULL,
  `subkategori` int(255) NOT NULL,
  `harga_modal` int(15) NOT NULL,
  `harga_jual` int(15) NOT NULL,
  `harga_reseller` int(15) NOT NULL,
  `harga_h2h` int(15) NOT NULL,
  `harga_coret` int(15) NOT NULL,
  `komisi` int(11) NOT NULL,
  `poin` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `currency` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `jenis` int(11) NOT NULL,
  `product_type` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_produk`
--

INSERT INTO `tb_produk` (`cuid`, `slug`, `code`, `title`, `kategori`, `subkategori`, `harga_modal`, `harga_jual`, `harga_reseller`, `harga_h2h`, `harga_coret`, `komisi`, `poin`, `image`, `currency`, `status`, `created_date`, `jenis`, `product_type`) VALUES
(40000, 'aceracer', 'ACE65-S17', '60 + 5 Tokens', 'Ace Racer', 0, 11123, 11123, 11123, 11123, 0, 0, 0, 'ace_racer.png', '', 1, '2023-10-08', 4, 1),
(40001, 'aceracer', 'ACE270-S17', '250 + 20 Tokens', 'Ace Racer', 0, 45173, 45173, 45173, 45173, 0, 0, 0, 'ace_racer.png', '', 1, '2023-10-08', 4, 1),
(40002, 'aceracer', 'ACE740-S17', '680 + 60 Tokens', 'Ace Racer', 0, 113273, 113273, 113273, 113273, 0, 0, 0, 'ace_racer.png', '', 1, '2023-10-08', 4, 1),
(40003, 'aceracer', 'ACE1300-S17', '1180 + 120 Tokens', 'Ace Racer', 0, 204073, 204073, 204073, 204073, 0, 0, 0, 'ace_racer.png', '', 1, '2023-10-08', 4, 1),
(40004, 'aceracer', 'ACE3180-S17', '2880 + 300 Tokens', 'Ace Racer', 0, 519830, 519830, 519830, 519830, 0, 0, 0, 'ace_racer.png', '', 1, '2023-10-08', 4, 1),
(40005, 'aceracer', 'ACE6530-S17', '5880 + 650 Tokens', 'Ace Racer', 0, 1019230, 1019230, 1019230, 1019230, 0, 0, 0, 'ace_racer.png', '', 1, '2023-10-08', 4, 1),
(40010, 'arenabreakout', 'AB60_6-S50', '60 + 6 Bonds', 'Arena Breakout', 0, 11921, 11921, 11921, 11921, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-10-08', 4, 1),
(40011, 'arenabreakout', 'ABBS-S50', 'Beginners select', 'Arena Breakout', 0, 11921, 11921, 11921, 11921, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-10-08', 4, 1),
(40012, 'arenabreakout', 'ABBSC30-S50', 'Bulletproof safety container (30 days)', 'Arena Breakout', 0, 35889, 35889, 35889, 35889, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-10-08', 4, 1),
(40013, 'arenabreakout', 'AB310_25-S50', '310 + 25 Bonds', 'Arena Breakout', 0, 60619, 60619, 60619, 60619, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-10-08', 4, 1),
(40014, 'arenabreakout', 'ABABP-S50', 'Advanced Battle Pass', 'Arena Breakout', 0, 60619, 60619, 60619, 60619, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-10-08', 4, 1),
(40015, 'arenabreakout', 'ABET30-S50', 'Elite trial (30 days) and 300 points', 'Arena Breakout', 0, 60619, 60619, 60619, 60619, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-10-08', 4, 1),
(40016, 'arenabreakout', 'ABCSC-S50', 'Composite safety container (30 days)', 'Arena Breakout', 0, 108431, 108431, 108431, 108431, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-10-08', 4, 1),
(40017, 'arenabreakout', 'AB630_45-S50', '630 + 45 Bonds', 'Arena Breakout', 0, 120351, 120351, 120351, 120351, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-10-08', 4, 1),
(40018, 'arenabreakout', 'ABPBP-S50', 'Premium Battle Pass', 'Arena Breakout', 0, 186043, 186043, 186043, 186043, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-10-08', 4, 1),
(40019, 'arenabreakout', 'AB1580_110-S50', '1580 + 110 Bonds', 'Arena Breakout', 0, 301321, 301321, 301321, 301321, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-10-08', 4, 1),
(40020, 'arenabreakout', 'AB3200_200-S50', '3200 + 200 Bonds', 'Arena Breakout', 0, 606068, 606068, 606068, 606068, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-10-08', 4, 1),
(40021, 'arenabreakout', 'AB6500_320-S50', '6500 + 320 Bonds', 'Arena Breakout', 0, 1203637, 1203637, 1203637, 1203637, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-10-08', 4, 1),
(40022, 'arenaofvalor', 'AOV40-S58', '40 Vouchers', 'Arena of Valor', 0, 8967, 9326, 9236, 9236, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-10-08', 4, 1),
(40023, 'arenaofvalor', 'AOV40-S1000', '40 Vouchers', 'Arena of Valor', 0, 9744, 10134, 10036, 10036, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-10-08', 4, 1),
(40024, 'arenaofvalor', 'AOV90-S58', '90 Vouchers', 'Arena of Valor', 0, 17933, 18650, 18471, 18471, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-10-08', 4, 1),
(40025, 'arenaofvalor', 'AOV90-S1000', '90 Vouchers', 'Arena of Valor', 0, 19488, 20268, 20073, 20073, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-10-08', 4, 1),
(40026, 'arenaofvalor', 'AOV230-S58', '230 Vouchers', 'Arena of Valor', 0, 44833, 46626, 46178, 46178, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-10-08', 4, 1),
(40027, 'arenaofvalor', 'AOV230-S1000', '230 Vouchers', 'Arena of Valor', 0, 48720, 50669, 50182, 50182, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-10-08', 4, 1),
(40028, 'arenaofvalor', 'AOV470-S58', '470 Vouchers', 'Arena of Valor', 0, 89664, 93251, 92354, 92354, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-10-08', 4, 1),
(40029, 'arenaofvalor', 'AOV470-S1000', '470 Vouchers', 'Arena of Valor', 0, 97440, 101338, 100363, 100363, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-10-08', 4, 1),
(40030, 'arenaofvalor', 'AOV950-S58', '950 Vouchers', 'Arena of Valor', 0, 179329, 186502, 184709, 184709, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-10-08', 4, 1),
(40031, 'arenaofvalor', 'AOV950-S1000', '950 Vouchers', 'Arena of Valor', 0, 194880, 202675, 200726, 200726, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-10-08', 4, 1),
(40032, 'arenaofvalor', 'AOV1430-S1000', '1430 Vouchers', 'Arena of Valor', 0, 292320, 304013, 301090, 301090, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-10-08', 4, 1),
(40033, 'arenaofvalor', 'AOV2390-S1000', '2390 Vouchers', 'Arena of Valor', 0, 487200, 506688, 501816, 501816, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-10-08', 4, 1),
(40034, 'betheking', 'BTK60-S48', '60 Gold', 'Be The King', 0, 11404, 11860, 11746, 11746, 0, 0, 0, 'be_the_king.png', '', 1, '2023-10-08', 4, 1),
(40035, 'betheking', 'BTK60ULT-S48', '60 Ult Tokens', 'Be The King', 0, 11404, 11860, 11746, 11746, 0, 0, 0, 'be_the_king.png', '', 1, '2023-10-08', 4, 1),
(40036, 'betheking', 'BTK60ULT-S1000', '60 Ult Tokens', 'Be The King', 0, 12523, 13024, 12899, 12899, 0, 0, 0, 'be_the_king.png', '', 1, '2023-10-08', 4, 1),
(40037, 'betheking', 'BTK60-S1000', '60 Gold', 'Be The King', 0, 12523, 13024, 12899, 12899, 0, 0, 0, 'be_the_king.png', '', 1, '2023-10-08', 4, 1),
(40038, 'betheking', 'BTK300-S48', '300 Gold', 'Be The King', 0, 57947, 60265, 59685, 59685, 0, 0, 0, 'be_the_king.png', '', 1, '2023-10-08', 4, 1),
(40039, 'betheking', 'BTK300ULT-S48', '300 Ult Tokens', 'Be The King', 0, 57947, 60265, 59685, 59685, 0, 0, 0, 'be_the_king.png', '', 1, '2023-10-08', 4, 1),
(40040, 'betheking', 'BTK300ULT-S1000', '300 Ult Tokens', 'Be The King', 0, 63525, 66066, 65431, 65431, 0, 0, 0, 'be_the_king.png', '', 1, '2023-10-08', 4, 1),
(40041, 'betheking', 'BTK300-S1000', '300 Gold', 'Be The King', 0, 63525, 66066, 65431, 65431, 0, 0, 0, 'be_the_king.png', '', 1, '2023-10-08', 4, 1),
(40042, 'betheking', 'BTK680-S48', '680 Gold', 'Be The King', 0, 116128, 120773, 119612, 119612, 0, 0, 0, 'be_the_king.png', '', 1, '2023-10-08', 4, 1),
(40043, 'betheking', 'BTK680ULT-S48', '680 Ult Tokens', 'Be The King', 0, 116128, 120773, 119612, 119612, 0, 0, 0, 'be_the_king.png', '', 1, '2023-10-08', 4, 1),
(40044, 'betheking', 'BTK680-S1000', '680 Gold', 'Be The King', 0, 127352, 132446, 131173, 131173, 0, 0, 0, 'be_the_king.png', '', 1, '2023-10-08', 4, 1),
(40045, 'betheking', 'BTK680ULT-S1000', '680 Ult Tokens', 'Be The King', 0, 127352, 132446, 131173, 131173, 0, 0, 0, 'be_the_king.png', '', 1, '2023-10-08', 4, 1),
(40046, 'betheking', 'BTK2040-S48', '2040 Gold', 'Be The King', 0, 346755, 360625, 357158, 357158, 0, 0, 0, 'be_the_king.png', '', 1, '2023-10-08', 4, 1),
(40047, 'betheking', 'BTK2040ULT-S48', '2040 Ult Tokens', 'Be The King', 0, 346755, 360625, 357158, 357158, 0, 0, 0, 'be_the_king.png', '', 1, '2023-10-08', 4, 1),
(40048, 'betheking', 'BTK2040-S1000', '2040 Gold', 'Be The King', 0, 369431, 384208, 380514, 380514, 0, 0, 0, 'be_the_king.png', '', 1, '2023-10-08', 4, 1),
(40049, 'betheking', 'BTK2040ULT-S1000', '2040 Ult Tokens', 'Be The King', 0, 369431, 384208, 380514, 380514, 0, 0, 0, 'be_the_king.png', '', 1, '2023-10-08', 4, 1),
(40050, 'betheking', 'BTK3400-S48', '3400 Gold', 'Be The King', 0, 579477, 602656, 596861, 596861, 0, 0, 0, 'be_the_king.png', '', 1, '2023-10-08', 4, 1),
(40051, 'betheking', 'BTK3400ULT-S48', '3400 Ult Tokens', 'Be The King', 0, 579477, 602656, 596861, 596861, 0, 0, 0, 'be_the_king.png', '', 1, '2023-10-08', 4, 1),
(40052, 'betheking', 'BTK3400ULT-S1000', '3400 Ult Tokens', 'Be The King', 0, 617266, 641957, 635784, 635784, 0, 0, 0, 'be_the_king.png', '', 1, '2023-10-08', 4, 1),
(40053, 'betheking', 'BTK3400-S1000', '3400 Gold', 'Be The King', 0, 617266, 641957, 635784, 635784, 0, 0, 0, 'be_the_king.png', '', 1, '2023-10-08', 4, 1),
(40054, 'betheking', 'BTK6800ULT-S48', '6800 Ult Tokens', 'Be The King', 0, 1161282, 1207733, 1196120, 1196120, 0, 0, 0, 'be_the_king.png', '', 1, '2023-10-08', 4, 1),
(40055, 'betheking', 'BTK6800-S48', '6800 Gold', 'Be The King', 0, 1161282, 1207733, 1196120, 1196120, 0, 0, 0, 'be_the_king.png', '', 1, '2023-10-08', 4, 1),
(40056, 'betheking', 'BTK6800-S1000', '6800 Gold', 'Be The King', 0, 1236956, 1286434, 1274065, 1274065, 0, 0, 0, 'be_the_king.png', '', 1, '2023-10-08', 4, 1),
(40057, 'betheking', 'BTK6800ULT-S1000', '6800 Ult Tokens', 'Be The King', 0, 1236956, 1286434, 1274065, 1274065, 0, 0, 0, 'be_the_king.png', '', 1, '2023-10-08', 4, 1),
(40058, 'betheking', 'BTK20400-S48', '20400 Ult Tokens', 'Be The King', 0, 3467554, 3606256, 3571581, 3571581, 0, 0, 0, 'be_the_king.png', '', 1, '2023-10-08', 4, 1),
(40059, 'betheking', 'BTK20400-S1000', '20400 Ult Tokens', 'Be The King', 0, 3693397, 3841133, 3804199, 3804199, 0, 0, 0, 'be_the_king.png', '', 1, '2023-10-08', 4, 1),
(40060, 'chimeraland', 'CML60A-S50', '60 Amber', 'Chimeraland', 0, 10068, 10471, 10370, 10370, 0, 0, 0, 'chimeraland.png', '', 1, '2023-10-08', 4, 1),
(40061, 'chimeraland', 'CML300A-S50', '300 Amber', 'Chimeraland', 0, 51361, 53415, 52902, 52902, 0, 0, 0, 'chimeraland.png', '', 1, '2023-10-08', 4, 1),
(40062, 'chimeraland', 'CML680A-S50', '680 Amber', 'Chimeraland', 0, 103232, 107361, 106329, 106329, 0, 0, 0, 'chimeraland.png', '', 1, '2023-10-08', 4, 1),
(40063, 'chimeraland', 'CML980A-S50', '980 Amber', 'Chimeraland', 0, 154975, 161174, 159624, 159624, 0, 0, 0, 'chimeraland.png', '', 1, '2023-10-08', 4, 1),
(40064, 'chimeraland', 'CML1980A-S50', '1980 Amber', 'Chimeraland', 0, 310205, 322613, 319511, 319511, 0, 0, 0, 'chimeraland.png', '', 1, '2023-10-08', 4, 1),
(40065, 'chimeraland', 'CML3280A-S50', '3280 Amber', 'Chimeraland', 0, 552226, 574315, 568793, 568793, 0, 0, 0, 'chimeraland.png', '', 1, '2023-10-08', 4, 1),
(40066, 'chimeraland', 'CML5508A-S50', '5180 Amber', 'Chimeraland', 0, 862814, 897327, 888698, 888698, 0, 0, 0, 'chimeraland.png', '', 1, '2023-10-08', 4, 1),
(40067, 'chimeraland', 'CML6888A-S50', '6480 Amber', 'Chimeraland', 0, 1035249, 1076659, 1066306, 1066306, 0, 0, 0, 'chimeraland.png', '', 1, '2023-10-08', 4, 1),
(40068, 'dragonraja', 'DR66-S48', '66 Coupon', 'Dragon Raja', 0, 11636, 12101, 11985, 11985, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-10-08', 4, 1),
(40069, 'dragonraja', 'DR76-S14', '76 Coupon', 'Dragon Raja', 0, 13904, 14460, 14321, 14321, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-10-08', 4, 1),
(40070, 'dragonraja', 'DR264-S48', '264 Coupon', 'Dragon Raja', 0, 46544, 48406, 47940, 47940, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-10-08', 4, 1),
(40071, 'dragonraja', 'DR456-S14', '456 Coupon', 'Dragon Raja', 0, 83425, 86762, 85928, 85928, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-10-08', 4, 1),
(40072, 'dragonraja', 'DR820-S14', '820 Coupon', 'Dragon Raja', 0, 139041, 144603, 143212, 143212, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-10-08', 4, 1),
(40073, 'dragonraja', 'DR1098-S48', '1098 Coupon', 'Dragon Raja', 0, 174541, 181523, 179777, 179777, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-10-08', 4, 1),
(40074, 'dragonraja', 'DRIF1-S48', 'Investment Fund', 'Dragon Raja', 0, 174541, 181523, 179777, 179777, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-10-08', 4, 1),
(40075, 'dragonraja', 'DRIF1-S14', 'Investment Fund', 'Dragon Raja', 0, 180753, 187983, 186176, 186176, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-10-08', 4, 1),
(40076, 'dragonraja', 'DRIF2-S48', 'Investment Fund II', 'Dragon Raja', 0, 232721, 242030, 239703, 239703, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-10-08', 4, 1),
(40077, 'dragonraja', 'DRIF2-S14', 'Investment Fund II', 'Dragon Raja', 0, 250274, 260285, 257782, 257782, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-10-08', 4, 1),
(40078, 'dragonraja', 'DR1699-S14', '1699 Coupon', 'Dragon Raja', 0, 278082, 289205, 286424, 286424, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-10-08', 4, 1),
(40079, 'dragonraja', 'DR2246-S48', '2246 Coupon', 'Dragon Raja', 0, 349083, 363046, 359555, 359555, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-10-08', 4, 1),
(40080, 'dragonraja', 'DR3768-S48', '3768 Coupon', 'Dragon Raja', 0, 581804, 605076, 599258, 599258, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-10-08', 4, 1),
(40081, 'dragonraja', 'DR5161-S14', '5161 Coupon', 'Dragon Raja', 0, 834245, 867615, 859272, 859272, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-10-08', 4, 1),
(40082, 'dragonraja', 'DR6860-S14', '6860 Coupon', 'Dragon Raja', 0, 1112326, 1156819, 1145696, 1145696, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-10-08', 4, 1),
(40083, 'dragonraja', 'DR7546-S48', '7546 Coupons', 'Dragon Raja', 0, 1163608, 1210152, 1198516, 1198516, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-10-08', 4, 1),
(40084, 'dragonraja', 'DR9056-S14', '9056 Coupon', 'Dragon Raja', 0, 1390408, 1446024, 1432120, 1432120, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-10-08', 4, 1),
(40085, 'dragonraja', 'DR15092-S48', '15092 Coupons', 'Dragon Raja', 0, 2327217, 2420306, 2397034, 2397034, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-10-08', 4, 1),
(40086, 'eggyparty', 'EGGYCOINS60-S23', '60 Eggy Coins + 3 Bonus', 'Eggy Party', 0, 10647, 10647, 10647, 10647, 0, 0, 0, 'eggy_party.png', '', 1, '2023-10-08', 4, 1),
(40087, 'eggyparty', 'EGGYCOINS120-S23', '120 Eggy Coins + 6 Bonus', 'Eggy Party', 0, 20475, 20475, 20475, 20475, 0, 0, 0, 'eggy_party.png', '', 1, '2023-10-08', 4, 1),
(40088, 'eggyparty', 'EGGYCOINS300-S23', '300 Eggy Coins + 24 Bonus', 'Eggy Party', 0, 51870, 51870, 51870, 51870, 0, 0, 0, 'eggy_party.png', '', 1, '2023-10-08', 4, 1),
(40089, 'eggyparty', 'EGGYCOINS700-S23', '700 Eggy Coins + 57 Bonus', 'Eggy Party', 0, 122850, 122850, 122850, 122850, 0, 0, 0, 'eggy_party.png', '', 1, '2023-10-08', 4, 1),
(40090, 'eggyparty', 'EGGYCOINS1380-S23', '1380 Eggy Coins + 144 Bonus', 'Eggy Party', 0, 240240, 240240, 240240, 240240, 0, 0, 0, 'eggy_party.png', '', 1, '2023-10-08', 4, 1),
(40091, 'eggyparty', 'EGGYCOINS2080-S23', '2080 Eggy Coins + 216 Bonus', 'Eggy Party', 0, 360360, 360360, 360360, 360360, 0, 0, 0, 'eggy_party.png', '', 1, '2023-10-08', 4, 1),
(40092, 'eggyparty', 'EGGYCOINS3450-S23', '3450 Eggy Coins + 423 Bonus', 'Eggy Party', 0, 597870, 597870, 597870, 597870, 0, 0, 0, 'eggy_party.png', '', 1, '2023-10-08', 4, 1),
(40093, 'eggyparty', 'EGGYCOINS6880-S23', '6880 Eggy Coins + 903 Bonus', 'Eggy Party', 0, 1190280, 1190280, 1190280, 1190280, 0, 0, 0, 'eggy_party.png', '', 1, '2023-10-08', 4, 1),
(40094, 'freefire', 'FF5-S24', '5 Diamonds', 'Free Fire', 0, 776, 807, 799, 799, 1000, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40095, 'freefire', 'FF5-S1000', '5 Diamonds', 'Free Fire', 0, 808, 840, 832, 832, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40096, 'freefire', 'FF10-S24', '10 Diamonds', 'Free Fire', 0, 1551, 1613, 1598, 1598, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40097, 'freefire', 'FF10-S1000', '10 Diamonds', 'Free Fire', 0, 1616, 1681, 1664, 1664, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40098, 'freefire', 'FF50-S24', '50 Diamonds', 'Free Fire', 0, 6206, 6454, 6392, 6392, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40099, 'freefire', 'FF50-S1000', '50 Diamonds', 'Free Fire', 0, 6464, 6723, 6658, 6658, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40100, 'freefire', 'FF55-S24', '55 Diamonds', 'Free Fire', 0, 6983, 7262, 7192, 7192, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40101, 'freefire', 'FF55-S1000', '55 Diamonds', 'Free Fire', 0, 7272, 7563, 7490, 7490, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40102, 'freefire', 'FF70-S24', '70 Diamonds', 'Free Fire', 0, 8535, 8876, 8791, 8791, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40103, 'freefire', 'FF70-S1000', '70 Diamonds', 'Free Fire', 0, 8888, 9244, 9155, 9155, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40104, 'freefire', 'FF80-S24', '80 Diamonds', 'Free Fire', 0, 10086, 10489, 10389, 10389, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40105, 'freefire', 'FF80-S1000', '80 Diamonds', 'Free Fire', 0, 10504, 10924, 10819, 10819, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40106, 'freefire', 'FF100-S24', '100 Diamonds', 'Free Fire', 0, 12414, 12911, 12786, 12786, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40107, 'freefire', 'FF100-S1000', '100 Diamonds', 'Free Fire', 0, 12928, 13445, 13316, 13316, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40108, 'freefire', 'FF120-S24', '120 Diamonds', 'Free Fire', 0, 14741, 15331, 15183, 15183, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40109, 'freefire', 'FF120-S1000', '120 Diamonds', 'Free Fire', 0, 15352, 15966, 15813, 15813, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40110, 'freefire', 'FF130-S24', '130 Diamonds', 'Free Fire', 0, 16293, 16945, 16782, 16782, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40111, 'freefire', 'FF130-S1000', '130 Diamonds', 'Free Fire', 0, 16968, 17647, 17477, 17477, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40112, 'freefire', 'FF140-S24', '140 Diamonds', 'Free Fire', 0, 17069, 17752, 17581, 17581, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40113, 'freefire', 'FF140-S1000', '140 Diamonds', 'Free Fire', 0, 17776, 18487, 18309, 18309, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40114, 'freefire', 'FF145-S24', '145 Diamonds', 'Free Fire', 0, 17845, 18559, 18380, 18380, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40115, 'freefire', 'FF145-S1000', '145 Diamonds', 'Free Fire', 0, 18584, 19327, 19142, 19142, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40116, 'freefire', 'FF150-S24', '150 Diamonds', 'Free Fire', 0, 18620, 19365, 19179, 19179, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40117, 'freefire', 'FF150-S1000', '150 Diamonds', 'Free Fire', 0, 19392, 20168, 19974, 19974, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40118, 'freefire', 'FF190-S24', '190 Diamonds', 'Free Fire', 0, 23275, 24206, 23973, 23973, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40119, 'freefire', 'FF190-S1000', '190 Diamonds', 'Free Fire', 0, 24240, 25210, 24967, 24967, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40120, 'freefire', 'FF200-S24', '200 Diamonds', 'Free Fire', 0, 24828, 25821, 25573, 25573, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40121, 'freefire', 'FF210-S24', '210 Diamonds', 'Free Fire', 0, 25604, 26628, 26372, 26372, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40122, 'freefire', 'FF200-S1000', '200 Diamonds', 'Free Fire', 0, 25856, 26890, 26632, 26632, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40123, 'freefire', 'FFMingguan-S24', 'Member Mingguan', 'Free Fire', 0, 25862, 26896, 26638, 26638, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40124, 'freefire', 'FF210-S1000', '210 Diamonds', 'Free Fire', 0, 26664, 27731, 27464, 27464, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40125, 'freefire', 'FFMINGGUAN-S1000', 'Mingguan Membership', 'Free Fire', 0, 26934, 28011, 27742, 27742, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40126, 'freefire', 'FF280-S24', '280 Diamonds', 'Free Fire', 0, 34138, 35504, 35162, 35162, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40127, 'freefire', 'FF280-S1000', '280 Diamonds', 'Free Fire', 0, 35552, 36974, 36619, 36619, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40128, 'freefire', 'FF355-S24', '355 Diamonds', 'Free Fire', 0, 42673, 44380, 43953, 43953, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40129, 'freefire', 'FF355-S1000', '355 Diamonds', 'Free Fire', 0, 44440, 46218, 45773, 45773, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40130, 'freefire', 'FF420-S24', '420 Diamonds', 'Free Fire', 0, 51207, 53255, 52743, 52743, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40131, 'freefire', 'FF420-S1000', '420 Diamonds', 'Free Fire', 0, 53328, 55461, 54928, 54928, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40132, 'freefire', 'FF500-S24', '500 Diamonds', 'Free Fire', 0, 60517, 62938, 62333, 62333, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40133, 'freefire', 'FF510-S24', '510 Diamonds', 'Free Fire', 0, 62070, 64553, 63932, 63932, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40134, 'freefire', 'FF500-S1000', '500 Diamonds', 'Free Fire', 0, 63024, 65545, 64915, 64915, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40135, 'freefire', 'FF510-S1000', '510 Diamonds', 'Free Fire', 0, 64640, 67226, 66579, 66579, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40136, 'freefire', 'FF565-S24', '565 Diamonds', 'Free Fire', 0, 68276, 71007, 70324, 70324, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40137, 'freefire', 'FF565-S1000', '565 Diamonds', 'Free Fire', 0, 71104, 73948, 73237, 73237, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40138, 'freefire', 'FF635-S24', '635 Diamonds', 'Free Fire', 0, 76811, 79883, 79115, 79115, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40139, 'freefire', 'FFBulanan-S24', 'Member Bulanan', 'Free Fire', 0, 77586, 80689, 79914, 79914, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40140, 'freefire', 'FF635-S1000', '635 Diamonds', 'Free Fire', 0, 79992, 83192, 82392, 82392, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40141, 'freefire', 'FFBULANAN-S1000', 'Bulanan Membership', 'Free Fire', 0, 80800, 84032, 83224, 83224, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40142, 'freefire', 'FF720-S24', '720 Diamonds', 'Free Fire', 0, 85345, 88759, 87905, 87905, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40143, 'freefire', 'FF720-S1000', '720 Diamonds', 'Free Fire', 0, 88880, 92435, 91546, 91546, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40144, 'freefire', 'FF800-S24', '800 Diamonds', 'Free Fire', 0, 95431, 99248, 98294, 98294, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40145, 'freefire', 'FF800-S1000', '800 Diamonds', 'Free Fire', 0, 99384, 103359, 102366, 102366, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40146, 'freefire', 'FF860-S24', '860 Diamonds', 'Free Fire', 0, 102414, 106511, 105486, 105486, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40147, 'freefire', 'FF860-S1000', '860 Diamonds', 'Free Fire', 0, 106656, 110922, 109856, 109856, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40148, 'freefire', 'FF930-S24', '930 Diamonds', 'Free Fire', 0, 110949, 115387, 114277, 114277, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40149, 'freefire', 'FF930-S1000', '930 Diamonds', 'Free Fire', 0, 115544, 120166, 119010, 119010, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40150, 'freefire', 'FF1000-S24', '1000 Diamonds', 'Free Fire', 0, 119483, 124262, 123067, 123067, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40151, 'freefire', 'FF1000-S1000', '1000 Diamonds', 'Free Fire', 0, 124432, 129409, 128165, 128165, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40152, 'freefire', 'FF1050-S24', '1050 Diamonds', 'Free Fire', 0, 125689, 130717, 129460, 129460, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40153, 'freefire', 'FF1075-S24', '1075 Diamonds', 'Free Fire', 0, 128018, 133139, 131859, 131859, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40154, 'freefire', 'FF1080-S24', '1080 Diamonds', 'Free Fire', 0, 128793, 133945, 132657, 132657, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40155, 'freefire', 'FF1050-S1000', '1050 Diamonds', 'Free Fire', 0, 130896, 136132, 134823, 134823, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40156, 'freefire', 'FF1075-S1000', '1075 Diamonds', 'Free Fire', 0, 133320, 138653, 137320, 137320, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40157, 'freefire', 'FF1080-S1000', '1080 Diamonds', 'Free Fire', 0, 134128, 139493, 138152, 138152, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40158, 'freefire', 'FF1450-S24', '1450 Diamonds', 'Free Fire', 0, 172241, 179131, 177408, 177408, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40159, 'freefire', 'FF1450-S1000', '1450 Diamonds', 'Free Fire', 0, 179376, 186551, 184757, 184757, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40160, 'freefire', 'FF7290-S24', '7290 Diamonds', 'Free Fire', 0, 853450, 887588, 879054, 879054, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40161, 'freefire', 'FF7290-S1000', '7290 Diamonds', 'Free Fire', 0, 888800, 924352, 915464, 915464, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40162, 'freefire', 'FF36500-S24', '36500 Diamonds', 'Free Fire', 0, 4267250, 4437940, 4395268, 4395268, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40163, 'freefire', 'FF36500-S1000', '36500 Diamonds', 'Free Fire', 0, 4444001, 4621761, 4577321, 4577321, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40164, 'freefire', 'FF73100-S24', '73100 Diamonds', 'Free Fire', 0, 8534500, 8875880, 8790535, 8790535, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40165, 'freefire', 'FF73100-S1000', '73100 Diamonds', 'Free Fire', 0, 8888001, 9243521, 9154641, 9154641, 0, 0, 0, 'free_fire.png', '', 1, '2023-10-08', 4, 1),
(40166, 'freefiremax', 'FFMAX5-S24', '5 Diamonds', 'Free Fire Max', 0, 776, 807, 799, 799, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40167, 'freefiremax', 'FFMAX5-S1000', '5 Diamonds', 'Free Fire Max', 0, 808, 840, 832, 832, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40168, 'freefiremax', 'FFMAX10-S24', '10 Diamonds', 'Free Fire Max', 0, 1551, 1613, 1598, 1598, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40169, 'freefiremax', 'FFMAX10-S1000', '10 Diamonds', 'Free Fire Max', 0, 1616, 1681, 1664, 1664, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40170, 'freefiremax', 'FFMAX50-S24', '50 Diamonds', 'Free Fire Max', 0, 6206, 6454, 6392, 6392, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40171, 'freefiremax', 'FFMAX50-S1000', '50 Diamonds', 'Free Fire Max', 0, 6464, 6723, 6658, 6658, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40172, 'freefiremax', 'FFMAX55-S24', '55 Diamonds', 'Free Fire Max', 0, 6983, 7262, 7192, 7192, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40173, 'freefiremax', 'FFMAX55-S1000', '55 Diamonds', 'Free Fire Max', 0, 7272, 7563, 7490, 7490, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40174, 'freefiremax', 'FFMAX70-S24', '70 Diamonds', 'Free Fire Max', 0, 8535, 8876, 8791, 8791, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40175, 'freefiremax', 'FFMAX70-S1000', '70 Diamonds', 'Free Fire Max', 0, 8888, 9244, 9155, 9155, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40176, 'freefiremax', 'FFMAX80-S24', '80 Diamonds', 'Free Fire Max', 0, 10086, 10489, 10389, 10389, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40177, 'freefiremax', 'FFMAX80-S1000', '80 Diamonds', 'Free Fire Max', 0, 10504, 10924, 10819, 10819, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40178, 'freefiremax', 'FFMAX100-S24', '100 Diamonds', 'Free Fire Max', 0, 12414, 12911, 12786, 12786, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40179, 'freefiremax', 'FFMAX100-S1000', '100 Diamonds', 'Free Fire Max', 0, 12928, 13445, 13316, 13316, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40180, 'freefiremax', 'FFMAX120-S24', '120 Diamonds', 'Free Fire Max', 0, 14741, 15331, 15183, 15183, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40181, 'freefiremax', 'FFMAX120-S1000', '120 Diamonds', 'Free Fire Max', 0, 15352, 15966, 15813, 15813, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40182, 'freefiremax', 'FFMAX130-S24', '130 Diamonds', 'Free Fire Max', 0, 16293, 16945, 16782, 16782, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40183, 'freefiremax', 'FFMAX130-S1000', '130 Diamonds', 'Free Fire Max', 0, 16968, 17647, 17477, 17477, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40184, 'freefiremax', 'FFMAX140-S24', '140 Diamonds', 'Free Fire Max', 0, 17069, 17752, 17581, 17581, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40185, 'freefiremax', 'FFMAX140-S1000', '140 Diamonds', 'Free Fire Max', 0, 17776, 18487, 18309, 18309, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40186, 'freefiremax', 'FFMAX145-S24', '145 Diamonds', 'Free Fire Max', 0, 17845, 18559, 18380, 18380, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40187, 'freefiremax', 'FFMAX145-S1000', '145 Diamonds', 'Free Fire Max', 0, 18584, 19327, 19142, 19142, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40188, 'freefiremax', 'FFMAX150-S24', '150 Diamonds', 'Free Fire Max', 0, 18620, 19365, 19179, 19179, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40189, 'freefiremax', 'FFMAX150-S1000', '150 Diamonds', 'Free Fire Max', 0, 19392, 20168, 19974, 19974, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40190, 'freefiremax', 'FFMAX190-S24', '190 Diamonds', 'Free Fire Max', 0, 23275, 24206, 23973, 23973, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40191, 'freefiremax', 'FFMAX190-S1000', '190 Diamonds', 'Free Fire Max', 0, 24240, 25210, 24967, 24967, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40192, 'freefiremax', 'FFMAX200-S24', '200 Diamonds', 'Free Fire Max', 0, 24828, 25821, 25573, 25573, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40193, 'freefiremax', 'FFMAX210-S24', '210 Diamonds', 'Free Fire Max', 0, 25604, 26628, 26372, 26372, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40194, 'freefiremax', 'FFMAX200-S1000', '200 Diamonds', 'Free Fire Max', 0, 25856, 26890, 26632, 26632, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40195, 'freefiremax', 'FFMAXMINGGUAN-S24', 'Membership Mingguan', 'Free Fire Max', 0, 25862, 26896, 26638, 26638, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40196, 'freefiremax', 'FFMAX210-S1000', '210 Diamonds', 'Free Fire Max', 0, 26664, 27731, 27464, 27464, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40197, 'freefiremax', 'FFMAXMINGGUAN-S1000', 'Mingguan Membership', 'Free Fire Max', 0, 26934, 28011, 27742, 27742, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40198, 'freefiremax', 'FFMAX280-S24', '280 Diamonds', 'Free Fire Max', 0, 34138, 35504, 35162, 35162, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40199, 'freefiremax', 'FFMAX280-S1000', '280 Diamonds', 'Free Fire Max', 0, 35552, 36974, 36619, 36619, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40200, 'freefiremax', 'FFMAX355-S24', '355 Diamonds', 'Free Fire Max', 0, 42673, 44380, 43953, 43953, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40201, 'freefiremax', 'FFMAX355-S1000', '355 Diamonds', 'Free Fire Max', 0, 44440, 46218, 45773, 45773, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40202, 'freefiremax', 'FFMAX420-S24', '420 Diamonds', 'Free Fire Max', 0, 51207, 53255, 52743, 52743, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40203, 'freefiremax', 'FFMAX420-S1000', '420 Diamonds', 'Free Fire Max', 0, 53328, 55461, 54928, 54928, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40204, 'freefiremax', 'FFMAX500-S24', '500 Diamonds', 'Free Fire Max', 0, 60517, 62938, 62333, 62333, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40205, 'freefiremax', 'FFMAX510-S24', '510 Diamonds', 'Free Fire Max', 0, 62070, 64553, 63932, 63932, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40206, 'freefiremax', 'FFMAX500-S1000', '500 Diamonds', 'Free Fire Max', 0, 63024, 65545, 64915, 64915, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40207, 'freefiremax', 'FFMAX510-S1000', '510 Diamonds', 'Free Fire Max', 0, 64640, 67226, 66579, 66579, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40208, 'freefiremax', 'FFMAX565-S24', '565 Diamonds', 'Free Fire Max', 0, 68276, 71007, 70324, 70324, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40209, 'freefiremax', 'FFMAX565-S1000', '565 Diamonds', 'Free Fire Max', 0, 71104, 73948, 73237, 73237, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40210, 'freefiremax', 'FFMAX635-S24', '635 Diamonds', 'Free Fire Max', 0, 76811, 79883, 79115, 79115, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40211, 'freefiremax', 'FFMAXBULANAN-S24', 'Membership Bulanan', 'Free Fire Max', 0, 77586, 80689, 79914, 79914, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40212, 'freefiremax', 'FFMAX635-S1000', '635 Diamonds', 'Free Fire Max', 0, 79992, 83192, 82392, 82392, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40213, 'freefiremax', 'FFMAXBULANAN-S1000', 'Bulanan Membership', 'Free Fire Max', 0, 80800, 84032, 83224, 83224, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40214, 'freefiremax', 'FFMAX720-S24', '720 Diamonds', 'Free Fire Max', 0, 85345, 88759, 87905, 87905, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40215, 'freefiremax', 'FFMAX720-S1000', '720 Diamonds', 'Free Fire Max', 0, 88880, 92435, 91546, 91546, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40216, 'freefiremax', 'FFMAX800-S24', '800 Diamonds', 'Free Fire Max', 0, 95431, 99248, 98294, 98294, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40217, 'freefiremax', 'FFMAX800-S1000', '800 Diamonds', 'Free Fire Max', 0, 99384, 103359, 102366, 102366, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40218, 'freefiremax', 'FFMAX860-S24', '860 Diamonds', 'Free Fire Max', 0, 102414, 106511, 105486, 105486, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40219, 'freefiremax', 'FFMAX860-S1000', '860 Diamonds', 'Free Fire Max', 0, 106656, 110922, 109856, 109856, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40220, 'freefiremax', 'FFMAX930-S24', '930 Diamonds', 'Free Fire Max', 0, 110949, 115387, 114277, 114277, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40221, 'freefiremax', 'FFMAX930-S1000', '930 Diamonds', 'Free Fire Max', 0, 115544, 120166, 119010, 119010, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40222, 'freefiremax', 'FFMAX1000-S24', '1000 Diamonds', 'Free Fire Max', 0, 119483, 124262, 123067, 123067, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40223, 'freefiremax', 'FFMAX1000-S1000', '1000 Diamonds', 'Free Fire Max', 0, 124432, 129409, 128165, 128165, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40224, 'freefiremax', 'FFMAX1050-S24', '1050 Diamonds', 'Free Fire Max', 0, 125689, 130717, 129460, 129460, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40225, 'freefiremax', 'FFMAX1075-S24', '1075 Diamonds', 'Free Fire Max', 0, 128018, 133139, 131859, 131859, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40226, 'freefiremax', 'FFMAX1080-S24', '1080 Diamonds', 'Free Fire Max', 0, 128793, 133945, 132657, 132657, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40227, 'freefiremax', 'FFMAX1050-S1000', '1050 Diamonds', 'Free Fire Max', 0, 130896, 136132, 134823, 134823, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40228, 'freefiremax', 'FFMAX1075-S1000', '1075 Diamonds', 'Free Fire Max', 0, 133320, 138653, 137320, 137320, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40229, 'freefiremax', 'FFMAX1080-S1000', '1080 Diamonds', 'Free Fire Max', 0, 134128, 139493, 138152, 138152, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40230, 'freefiremax', 'FFMAX1450-S24', '1450 Diamonds', 'Free Fire Max', 0, 172241, 179131, 177408, 177408, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40231, 'freefiremax', 'FFMAX1450-S1000', '1450 Diamonds', 'Free Fire Max', 0, 179376, 186551, 184757, 184757, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40232, 'freefiremax', 'FFMAX7290-S24', '7290 Diamonds', 'Free Fire Max', 0, 853450, 887588, 879054, 879054, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40233, 'freefiremax', 'FFMAX7290-S1000', '7290 Diamonds', 'Free Fire Max', 0, 888800, 924352, 915464, 915464, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40234, 'freefiremax', 'FFMAX36500-S24', '36500 Diamonds', 'Free Fire Max', 0, 4267250, 4437940, 4395268, 4395268, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40235, 'freefiremax', 'FFMAX36500-S1000', '36500 Diamonds', 'Free Fire Max', 0, 4444001, 4621761, 4577321, 4577321, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40236, 'freefiremax', 'FFMAX73100-S24', '73100 Diamonds', 'Free Fire Max', 0, 8534500, 8875880, 8790535, 8790535, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40237, 'freefiremax', 'FFMAX73100-S1000', '73100 Diamonds', 'Free Fire Max', 0, 8888001, 9243521, 9154641, 9154641, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-10-08', 4, 1),
(40238, 'garenaundawn', 'GUKM-S24M', 'Kartu Mingguan', 'Garena Undawn', 0, 24828, 24828, 24828, 24828, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-10-08', 4, 1),
(40239, 'garenaundawn', 'GUKB-S24M', 'Kartu Bulanan', 'Garena Undawn', 0, 41121, 41121, 41121, 41121, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-10-08', 4, 1),
(40240, 'garenaundawn', 'GUGF-S24M', 'Growth Fund', 'Garena Undawn', 0, 82500, 82500, 82500, 82500, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-10-08', 4, 1),
(40241, 'garenaundawn', 'GUEF-S24M', 'Elite Fund (Rebate LV 80)', 'Garena Undawn', 0, 109397, 109397, 109397, 109397, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-10-08', 4, 1),
(40242, 'garenaundawn', 'GUGPPS2-S24M', 'Glory Pass Premium S2', 'Garena Undawn', 0, 124994, 124994, 124994, 124994, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-10-08', 4, 1),
(40243, 'garenaundawn', 'GU920-S24M', 'RC 920', 'Garena Undawn', 0, 128018, 128018, 128018, 128018, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-10-08', 4, 1),
(40244, 'garenaundawn', 'GU1850-S24M', 'RC 1.850', 'Garena Undawn', 0, 256035, 256035, 256035, 256035, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-10-08', 4, 1),
(40245, 'garenaundawn', 'GU2800-S24M', 'RC 2.800', 'Garena Undawn', 0, 384053, 384053, 384053, 384053, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-10-08', 4, 1),
(40246, 'garenaundawn', 'GU4750-S24M', 'RC 4.750', 'Garena Undawn', 0, 640088, 640088, 640088, 640088, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-10-08', 4, 1),
(40247, 'garenaundawn', 'GU9600-S24M', 'RC 9.600', 'Garena Undawn', 0, 1280175, 1280175, 1280175, 1280175, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-10-08', 4, 1),
(40248, 'garenaundawn', 'GU33000-S24M', 'RC 33.000', 'Garena Undawn', 0, 4267250, 4267250, 4267250, 4267250, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-10-08', 4, 1),
(40249, 'garenaundawn', 'GU66500-S24M', 'RC 66.500', 'Garena Undawn', 0, 8534500, 8534500, 8534500, 8534500, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-10-08', 4, 1),
(40250, 'genshinimpact', 'GIX60-S27', '60 Genesis Crystals', 'Genshin Impact', 0, 10487, 10906, 10802, 10802, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40251, 'genshinimpact', 'GI60-S14', '60 Genesis Crystals', 'Genshin Impact', 0, 10961, 11399, 11290, 11290, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40252, 'genshinimpact', 'GI60-S1000', '60 Crystals', 'Genshin Impact', 0, 11366, 11821, 11707, 11707, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40253, 'genshinimpact', 'GIX300-S27', '300 + 30 Genesis Crystals', 'Genshin Impact', 0, 53511, 55651, 55116, 55116, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40254, 'genshinimpact', 'GIXBWM-S27', 'Blessing Welkin Moon', 'Genshin Impact', 0, 53511, 55651, 55116, 55116, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40255, 'genshinimpact', 'GI330-S14', '300 + 30 Genesis Crystals', 'Genshin Impact', 0, 54801, 56993, 56445, 56445, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40256, 'genshinimpact', 'GIWELKIN-S14', 'Blessing Welkin Moon', 'Genshin Impact', 0, 54801, 56993, 56445, 56445, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40257, 'genshinimpact', 'GI330-S1000', '300+30 Crystals', 'Genshin Impact', 0, 58706, 61054, 60467, 60467, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40258, 'genshinimpact', 'GIWELKIN-S1000', 'Blessing Welkin Moon', 'Genshin Impact', 0, 61231, 63680, 63068, 63068, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40259, 'genshinimpact', 'GIWELKIN2-S14', 'Blessing Welkin Moon x 2', 'Genshin Impact', 0, 109600, 113984, 112888, 112888, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40260, 'genshinimpact', 'GIX980-S27', '980 + 110 Genesis Crystals', 'Genshin Impact', 0, 161071, 167514, 165903, 165903, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40261, 'genshinimpact', 'GI1090-S14', '980 + 110 Genesis Crystals', 'Genshin Impact', 0, 164400, 170976, 169332, 169332, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40262, 'genshinimpact', 'GIWELKIN3-S14', 'Blessing Welkin Moon x 3', 'Genshin Impact', 0, 164400, 170976, 169332, 169332, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40263, 'genshinimpact', 'GI1090-S1000', '980+110 Crystals', 'Genshin Impact', 0, 175562, 182584, 180829, 180829, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40264, 'genshinimpact', 'GIWELKIN4-S14', 'Blessing Welkin Moon x 4', 'Genshin Impact', 0, 219199, 227967, 225775, 225775, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40265, 'genshinimpact', 'GIWELKIN5-S14', 'Blessing Welkin Moon x 5', 'Genshin Impact', 0, 273999, 284959, 282219, 282219, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40266, 'genshinimpact', 'GIWELKIN6-S14', 'Blessing Welkin Moon x 6', 'Genshin Impact', 0, 328799, 341951, 338663, 338663, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40267, 'genshinimpact', 'GIX1980-S27', '1980 + 260 Genesis Crystals', 'Genshin Impact', 0, 349301, 363273, 359780, 359780, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40268, 'genshinimpact', 'GI2240-S14', '1980 + 260 Genesis Crystals', 'Genshin Impact', 0, 356199, 370447, 366885, 366885, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40269, 'genshinimpact', 'GI2240-S1000', '1980+260 Crystals', 'Genshin Impact', 0, 380418, 395635, 391831, 391831, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40270, 'genshinimpact', 'GIX3280-S27', '3280 + 600 Genesis Crystals', 'Genshin Impact', 0, 537531, 559032, 553657, 553657, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40271, 'genshinimpact', 'GI3940-S14', '3280 + 600 Genesis Crystals', 'Genshin Impact', 0, 547998, 569918, 564438, 564438, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40272, 'genshinimpact', 'GI3940-S1000', '3280+600 Crystals', 'Genshin Impact', 0, 585175, 608582, 602730, 602730, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40273, 'genshinimpact', 'GIX6480-S27', '6480 + 1600 Genesis Crystals', 'Genshin Impact', 0, 1075331, 1118344, 1107591, 1107591, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40274, 'genshinimpact', 'GI8080-S14', '6480+1600 Crystals', 'Genshin Impact', 0, 1095995, 1139835, 1128875, 1128875, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40275, 'genshinimpact', 'GI8080-S1000', '6480+1600 Crystals', 'Genshin Impact', 0, 1170350, 1217164, 1205461, 1205461, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40276, 'genshinimpact', 'GIALL-S14', 'All Pack Genesis Crystals', 'Genshin Impact', 0, 2230352, 2319566, 2297263, 2297263, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40277, 'genshinimpact', 'GI40400-S14', '6480+1600 Crystals x 5', 'Genshin Impact', 0, 5479977, 5699176, 5644376, 5644376, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40278, 'genshinimpact', 'GI80800-S14', '6480+1600 Crystals x 10', 'Genshin Impact', 0, 10959954, 11398352, 11288753, 11288753, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-10-08', 4, 1),
(40279, 'honkaiimpact3', 'HKI65B-S70', '65 B-Chips', 'Honkai Impact 3', 0, 14011, 14571, 14431, 14431, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-10-08', 4, 1),
(40280, 'honkaiimpact3', 'HKI65-S70', '65 Crystals', 'Honkai Impact 3', 0, 14011, 14571, 14431, 14431, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-10-08', 4, 1),
(40281, 'honkaiimpact3', 'HKI65B-S18', '65 B-Chips', 'Honkai Impact 3', 0, 15709, 16337, 16180, 16180, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-10-08', 4, 1),
(40282, 'honkaiimpact3', 'HKI65-S18', '65 Crystals', 'Honkai Impact 3', 0, 15709, 16337, 16180, 16180, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-10-08', 4, 1),
(40283, 'honkaiimpact3', 'HKI330B-S70', '330 B-Chips', 'Honkai Impact 3', 0, 71327, 74180, 73467, 73467, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-10-08', 4, 1),
(40284, 'honkaiimpact3', 'HKI330-S70', '330 Crystals', 'Honkai Impact 3', 0, 71327, 74180, 73467, 73467, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-10-08', 4, 1),
(40285, 'honkaiimpact3', 'HKIMC-S70', 'Monthly-Card', 'Honkai Impact 3', 0, 71327, 74180, 73467, 73467, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-10-08', 4, 1),
(40286, 'honkaiimpact3', 'HKI330B-S18', '330 B-Chips', 'Honkai Impact 3', 0, 77117, 80202, 79431, 79431, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-10-08', 4, 1),
(40287, 'honkaiimpact3', 'HKI330-S18', '330 Crystals', 'Honkai Impact 3', 0, 77117, 80202, 79431, 79431, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-10-08', 4, 1),
(40288, 'honkaiimpact3', 'HKIMC-S18', 'Monthly-Card', 'Honkai Impact 3', 0, 77117, 80202, 79431, 79431, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-10-08', 4, 1),
(40289, 'honkaiimpact3', 'HKI710-S70', '710 Crystals', 'Honkai Impact 3', 0, 142654, 148360, 146934, 146934, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-10-08', 4, 1),
(40290, 'honkaiimpact3', 'HKI710-S18', '710 Crystals', 'Honkai Impact 3', 0, 154232, 160401, 158859, 158859, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-10-08', 4, 1),
(40291, 'honkaiimpact3', 'HKI990B-S70', '990 B-Chips', 'Honkai Impact 3', 0, 211435, 219892, 217778, 217778, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-10-08', 4, 1),
(40292, 'honkaiimpact3', 'HKI990B-S18', '990 B-Chips', 'Honkai Impact 3', 0, 242774, 252485, 250057, 250057, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-10-08', 4, 1),
(40293, 'honkaiimpact3', 'HKI1320B-S70', '1320 B-Chips', 'Honkai Impact 3', 0, 282762, 294072, 291245, 291245, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-10-08', 4, 1),
(40294, 'honkaiimpact3', 'HKI1430-S70', '1430 Crystals', 'Honkai Impact 3', 0, 282762, 294072, 291245, 291245, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-10-08', 4, 1),
(40295, 'honkaiimpact3', 'HKI1320B-S18', '1320 B-Chips', 'Honkai Impact 3', 0, 318937, 331694, 328505, 328505, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-10-08', 4, 1),
(40296, 'honkaiimpact3', 'HKI1430-S18', '1430 Crystals', 'Honkai Impact 3', 0, 318937, 331694, 328505, 328505, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-10-08', 4, 1),
(40297, 'honkaiimpact3', 'HKI1980B-S70', '1980 B-Chips', 'Honkai Impact 3', 0, 425416, 442433, 438178, 438178, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-10-08', 4, 1),
(40298, 'honkaiimpact3', 'HKI1980B-S18', '1980 B-Chips', 'Honkai Impact 3', 0, 465553, 484175, 479520, 479520, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-10-08', 4, 1),
(40299, 'honkaiimpact3', 'HKI3300B-S70', '3300 B-Chips', 'Honkai Impact 3', 0, 713271, 741802, 734669, 734669, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-10-08', 4, 1),
(40300, 'honkaiimpact3', 'HKI3860-S70', '3860 Crystals', 'Honkai Impact 3', 0, 713271, 741802, 734669, 734669, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-10-08', 4, 1),
(40301, 'honkaiimpact3', 'HKI3300B-S18', '3300 B-Chips', 'Honkai Impact 3', 0, 775923, 806960, 799201, 799201, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-10-08', 4, 1),
(40302, 'honkaiimpact3', 'HKI3860-S18', '3860 Crystals', 'Honkai Impact 3', 0, 775923, 806960, 799201, 799201, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-10-08', 4, 1),
(40303, 'honkaiimpact3', 'HKI8088-S18', '8088 Crystals', 'Honkai Impact 3', 0, 1550893, 1612929, 1597420, 1597420, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-10-08', 4, 1),
(40304, 'honkaiimpact3', 'HKI6600B-S18', '6600 B-Chips', 'Honkai Impact 3', 0, 1550893, 1612929, 1597420, 1597420, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-10-08', 4, 1),
(40305, 'honkaistarrail', 'HSTR60-S98', '60 Oneiric Shard', 'Honkai Star Rail', 0, 12742, 12742, 12742, 12742, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-10-08', 4, 1),
(40306, 'honkaistarrail', 'HKI60-S11', '60 Oneiric Shard', 'Honkai Star Rail', 0, 13328, 13328, 13328, 13328, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-10-08', 4, 1),
(40307, 'honkaistarrail', 'HSTR60-S85', '60 Oneiric Shard', 'Honkai Star Rail', 0, 13850, 13850, 13850, 13850, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-10-08', 4, 1),
(40308, 'honkaistarrail', 'HKI330-S11', '300+30 Oneiric Shard', 'Honkai Star Rail', 0, 54128, 54128, 54128, 54128, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-10-08', 4, 1),
(40309, 'honkaistarrail', 'HKIESP1X-S11', '1x Express Supply Pass', 'Honkai Star Rail', 0, 54128, 54128, 54128, 54128, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-10-08', 4, 1),
(40310, 'honkaistarrail', 'HSTR300-S85', '300+30 Oneiric Shard', 'Honkai Star Rail', 0, 55709, 55709, 55709, 55709, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-10-08', 4, 1),
(40311, 'honkaistarrail', 'HSTRESP-S85', 'Express Supply Pass', 'Honkai Star Rail', 0, 55709, 55709, 55709, 55709, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-10-08', 4, 1),
(40312, 'honkaistarrail', 'HSTR300-S98', '300+30 Oneiric Shard', 'Honkai Star Rail', 0, 58711, 58711, 58711, 58711, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-10-08', 4, 1),
(40313, 'honkaistarrail', 'HSTRESP-S98', 'Express Supply Pass', 'Honkai Star Rail', 0, 58711, 58711, 58711, 58711, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-10-08', 4, 1);
INSERT INTO `tb_produk` (`cuid`, `slug`, `code`, `title`, `kategori`, `subkategori`, `harga_modal`, `harga_jual`, `harga_reseller`, `harga_h2h`, `harga_coret`, `komisi`, `poin`, `image`, `currency`, `status`, `created_date`, `jenis`, `product_type`) VALUES
(40314, 'honkaistarrail', 'HKIESP2X-S11', '2x Express Supply Pass', 'Honkai Star Rail', 0, 108256, 108256, 108256, 108256, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-10-08', 4, 1),
(40315, 'honkaistarrail', 'HKIESP3X-S11', '3x Express Supply Pass', 'Honkai Star Rail', 0, 162384, 162384, 162384, 162384, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-10-08', 4, 1),
(40316, 'honkaistarrail', 'HKI1090-S11', '980+110 Oneiric Shard', 'Honkai Star Rail', 0, 162928, 162928, 162928, 162928, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-10-08', 4, 1),
(40317, 'honkaistarrail', 'HSTR980-S85', '980+110 Oneiric Shard', 'Honkai Star Rail', 0, 166075, 166075, 166075, 166075, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-10-08', 4, 1),
(40318, 'honkaistarrail', 'HSTR980-S98', '980+110 Oneiric Shard', 'Honkai Star Rail', 0, 171249, 171249, 171249, 171249, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-10-08', 4, 1),
(40319, 'honkaistarrail', 'HKIESP4X-S11', '4x Express Supply Pass', 'Honkai Star Rail', 0, 216512, 216512, 216512, 216512, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-10-08', 4, 1),
(40320, 'honkaistarrail', 'HKIESP5X-S11', '5x Express Supply Pass', 'Honkai Star Rail', 0, 270640, 270640, 270640, 270640, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-10-08', 4, 1),
(40321, 'honkaistarrail', 'HKI2240-S11', '2020+220 Oneiric Shard (Mix)', 'Honkai Star Rail', 0, 366318, 366318, 366318, 366318, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-10-08', 4, 1),
(40322, 'honkaistarrail', 'HSTR1980-S98', '1980+260 Oneiric Shard', 'Honkai Star Rail', 0, 382988, 382988, 382988, 382988, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-10-08', 4, 1),
(40323, 'honkaistarrail', 'HKI3880-S12', '3280 + 600 Oneiric Shard', 'Honkai Star Rail', 0, 580710, 580710, 580710, 580710, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-10-08', 4, 1),
(40324, 'honkaistarrail', 'HSTR3280-S98', '3280 + 600 Oneiric Shard', 'Honkai Star Rail', 0, 589248, 589248, 589248, 589248, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-10-08', 4, 1),
(40325, 'honkaistarrail', 'HKI8080-S12', '6480 + 1600 Oneiric Shard', 'Honkai Star Rail', 0, 1161710, 1161710, 1161710, 1161710, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-10-08', 4, 1),
(40326, 'honkaistarrail', 'HSTR6480-S98', '6480 + 1600 Oneiric Shard', 'Honkai Star Rail', 0, 1178853, 1178853, 1178853, 1178853, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-10-08', 4, 1),
(40327, 'leagueoflegends', 'LOL300-S14', '300 Wild Cores', 'League of Legends', 0, 27672, 28779, 28502, 28502, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-10-08', 4, 1),
(40328, 'leagueoflegends', 'LOL300-S1000', '300 Wild Cores', 'League of Legends', 0, 29543, 30725, 30429, 30429, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-10-08', 4, 1),
(40329, 'leagueoflegends', 'LOL420-S18', '420 Wild Cores', 'League of Legends', 0, 44268, 46039, 45596, 45596, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-10-08', 4, 1),
(40330, 'leagueoflegends', 'LOL625-S14', '625 Wild Cores', 'League of Legends', 0, 55344, 57558, 57004, 57004, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-10-08', 4, 1),
(40331, 'leagueoflegends', 'LOL625-S1000', '625 Wild Cores', 'League of Legends', 0, 58985, 61344, 60755, 60755, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-10-08', 4, 1),
(40332, 'leagueoflegends', 'LOL535-S70', '535 Wild Cores', 'League of Legends', 0, 63685, 66232, 65596, 65596, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-10-08', 4, 1),
(40333, 'leagueoflegends', 'LOL700-S18', '700 Wild Cores', 'League of Legends', 0, 70829, 73662, 72954, 72954, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-10-08', 4, 1),
(40334, 'leagueoflegends', 'LOL1125-S14', '1125 Wild Cores', 'League of Legends', 0, 96851, 100725, 99757, 99757, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-10-08', 4, 1),
(40335, 'leagueoflegends', 'LOL1125-S1000', '1125 Wild Cores', 'League of Legends', 0, 103198, 107326, 106294, 106294, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-10-08', 4, 1),
(40336, 'leagueoflegends', 'LOL1100-S70', '1100 Wild Cores', 'League of Legends', 0, 127369, 132464, 131190, 131190, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-10-08', 4, 1),
(40337, 'leagueoflegends', 'LOL1375-S18', '1375 Wild Cores', 'League of Legends', 0, 132804, 138116, 136788, 136788, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-10-08', 4, 1),
(40338, 'leagueoflegends', 'LOL1650-S14', '1650 Wild Cores', 'League of Legends', 0, 138360, 143894, 142511, 142511, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-10-08', 4, 1),
(40339, 'leagueoflegends', 'LOL1650-S1000', '1650 Wild Cores', 'League of Legends', 0, 147411, 153307, 151833, 151833, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-10-08', 4, 1),
(40340, 'leagueoflegends', 'LOL1725-S70', '1725 Wild Cores', 'League of Legends', 0, 191054, 198696, 196786, 196786, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-10-08', 4, 1),
(40341, 'leagueoflegends', 'LOL2400-S18', '2400 Wild Cores', 'League of Legends', 0, 221340, 230194, 227980, 227980, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-10-08', 4, 1),
(40342, 'leagueoflegends', 'LOL3400-S14', '3400 Wild Cores', 'League of Legends', 0, 276718, 287787, 285020, 285020, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-10-08', 4, 1),
(40343, 'leagueoflegends', 'LOL3400-S1000', '3400 Wild Cores', 'League of Legends', 0, 294723, 306512, 303565, 303565, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-10-08', 4, 1),
(40344, 'leagueoflegends', 'LOL3000-S70', '3000 Wild Cores', 'League of Legends', 0, 318425, 331162, 327978, 327978, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-10-08', 4, 1),
(40345, 'leagueoflegends', 'LOL4000-S18', '4000 Wild Cores', 'League of Legends', 0, 354144, 368310, 364768, 364768, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-10-08', 4, 1),
(40346, 'leagueoflegends', 'LOL7000-S14', '7000 Wild Cores', 'League of Legends', 0, 553437, 575574, 570040, 570040, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-10-08', 4, 1),
(40347, 'leagueoflegends', 'LOL7000-S1000', '7000 Wild Cores', 'League of Legends', 0, 583392, 606728, 600894, 600894, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-10-08', 4, 1),
(40348, 'leagueoflegends', 'LOL8150-S18', '8150 Wild Cores', 'League of Legends', 0, 708287, 736618, 729536, 729536, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-10-08', 4, 1),
(40349, 'lifeafter', 'LA65-S14', '65 Credits', 'LifeAfter', 0, 11069, 11512, 11401, 11401, 0, 0, 0, 'lifeafter.png', '', 1, '2023-10-08', 4, 1),
(40350, 'lifeafter', 'LA330-S14', '330 Credits', 'LifeAfter', 0, 55344, 57558, 57004, 57004, 0, 0, 0, 'lifeafter.png', '', 1, '2023-10-08', 4, 1),
(40351, 'lifeafter', 'LA330-S1000', '330 Credits', 'LifeAfter', 0, 64612, 67196, 66550, 66550, 0, 0, 0, 'lifeafter.png', '', 1, '2023-10-08', 4, 1),
(40352, 'lifeafter', 'LA558-S14', '558 Credits', 'LifeAfter', 0, 88550, 92092, 91207, 91207, 0, 0, 0, 'lifeafter.png', '', 1, '2023-10-08', 4, 1),
(40353, 'lifeafter', 'LA558-S1000', '558 Credits', 'LifeAfter', 0, 105519, 109740, 108685, 108685, 0, 0, 0, 'lifeafter.png', '', 1, '2023-10-08', 4, 1),
(40354, 'lifeafter', 'LA1108-S14', '1108 Credits', 'LifeAfter', 0, 166031, 172672, 171012, 171012, 0, 0, 0, 'lifeafter.png', '', 1, '2023-10-08', 4, 1),
(40355, 'lifeafter', 'LA1108-S1000', '1108 Credits', 'LifeAfter', 0, 190821, 198454, 196546, 196546, 0, 0, 0, 'lifeafter.png', '', 1, '2023-10-08', 4, 1),
(40356, 'lifeafter', 'LA2268-S14', '2268 Credits', 'LifeAfter', 0, 332062, 345344, 342024, 342024, 0, 0, 0, 'lifeafter.png', '', 1, '2023-10-08', 4, 1),
(40357, 'lifeafter', 'LA2268-S1000', '2268 Credits', 'LifeAfter', 0, 375211, 390219, 386467, 386467, 0, 0, 0, 'lifeafter.png', '', 1, '2023-10-08', 4, 1),
(40358, 'lifeafter', 'LA3468-S14', '3468 Credits', 'LifeAfter', 0, 520231, 541040, 535838, 535838, 0, 0, 0, 'lifeafter.png', '', 1, '2023-10-08', 4, 1),
(40359, 'lifeafter', 'LA3468-S1000', '3468 Credits', 'LifeAfter', 0, 579313, 602486, 596692, 596692, 0, 0, 0, 'lifeafter.png', '', 1, '2023-10-08', 4, 1),
(40360, 'lifeafter', 'LA5768-S14', '5768 Credits', 'LifeAfter', 0, 830155, 863361, 855060, 855060, 0, 0, 0, 'lifeafter.png', '', 1, '2023-10-08', 4, 1),
(40361, 'lifeafter', 'LA5768-S1000', '5768 Credits', 'LifeAfter', 0, 957019, 995300, 985730, 985730, 0, 0, 0, 'lifeafter.png', '', 1, '2023-10-08', 4, 1),
(40362, 'lifeafter', 'LA7768-S14', '7768 Credits', 'LifeAfter', 0, 1106874, 1151149, 1140080, 1140080, 0, 0, 0, 'lifeafter.png', '', 1, '2023-10-08', 4, 1),
(40363, 'lifeafter', 'LA7768-S1000', '7768 Credits', 'LifeAfter', 0, 1210450, 1258868, 1246764, 1246764, 0, 0, 0, 'lifeafter.png', '', 1, '2023-10-08', 4, 1),
(40364, 'lightofthel', 'LOT90-S1', '90 Crystal', 'Light of Thel', 0, 11510, 11970, 11855, 11855, 0, 0, 0, 'light_of_thel.png', '', 1, '2023-10-08', 4, 1),
(40365, 'lightofthel', 'LOT450-S1', '450 Crystal', 'Light of Thel', 0, 57552, 59854, 59279, 59279, 0, 0, 0, 'light_of_thel.png', '', 1, '2023-10-08', 4, 1),
(40366, 'lightofthel', 'LOT900-S1', '900 Crystal', 'Light of Thel', 0, 115104, 119708, 118557, 118557, 0, 0, 0, 'light_of_thel.png', '', 1, '2023-10-08', 4, 1),
(40367, 'lightofthel', 'LOT1800-S1', '1800 Crystal', 'Light of Thel', 0, 230208, 239416, 237114, 237114, 0, 0, 0, 'light_of_thel.png', '', 1, '2023-10-08', 4, 1),
(40368, 'lightofthel', 'LOT4500-S1', '4500 Crystal', 'Light of Thel', 0, 575519, 598540, 592785, 592785, 0, 0, 0, 'light_of_thel.png', '', 1, '2023-10-08', 4, 1),
(40369, 'lightofthel', 'LOT9000-S1', '9000 Crystal', 'Light of Thel', 0, 1162435, 1208932, 1197308, 1197308, 0, 0, 0, 'light_of_thel.png', '', 1, '2023-10-08', 4, 1),
(40370, 'lita', 'LITAX300-S18', '300 Lita Coins', 'Lita', 0, 33420, 34757, 34423, 34423, 0, 0, 0, 'lita.png', '', 1, '2023-10-08', 4, 1),
(40371, 'lita', 'LITAX600-S18', '600 Lita Coins', 'Lita', 0, 64055, 66617, 65977, 65977, 0, 0, 0, 'lita.png', '', 1, '2023-10-08', 4, 1),
(40372, 'lita', 'LITAX1000-S18', '1000 Lita Coins', 'Lita', 0, 105830, 110063, 109005, 109005, 0, 0, 0, 'lita.png', '', 1, '2023-10-08', 4, 1),
(40373, 'lita', 'LITAX2000-S18', '2000 Lita Coins', 'Lita', 0, 208875, 217230, 215141, 215141, 0, 0, 0, 'lita.png', '', 1, '2023-10-08', 4, 1),
(40374, 'lita', 'LITAX5000-S18', '5000 Lita Coins', 'Lita', 0, 520795, 541627, 536419, 536419, 0, 0, 0, 'lita.png', '', 1, '2023-10-08', 4, 1),
(40375, 'lita', 'LITAX10000-S18', '10000 Lita Coins', 'Lita', 0, 1038805, 1080357, 1069969, 1069969, 0, 0, 0, 'lita.png', '', 1, '2023-10-08', 4, 1),
(40376, 'lordsmobile', 'LM99-S98', '99 Diamonds', 'Lords Mobile', 0, 13377, 13912, 13778, 13778, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-10-08', 4, 1),
(40377, 'lordsmobile', 'LM104-S94', '104 Diamonds', 'Lords Mobile', 0, 14025, 14586, 14446, 14446, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-10-08', 4, 1),
(40378, 'lordsmobile', 'LM199-S98', '199 Diamonds', 'Lords Mobile', 0, 26870, 27945, 27676, 27676, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-10-08', 4, 1),
(40379, 'lordsmobile', 'LMWDP-S98', 'Weekly Diamond Pass', 'Lords Mobile', 0, 27004, 28084, 27814, 27814, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-10-08', 4, 1),
(40380, 'lordsmobile', 'LM209-S94', '209 Diamonds', 'Lords Mobile', 0, 28337, 29470, 29187, 29187, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-10-08', 4, 1),
(40381, 'lordsmobile', 'LM499-S98', '499 Diamonds', 'Lords Mobile', 0, 67351, 70045, 69372, 69372, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-10-08', 4, 1),
(40382, 'lordsmobile', 'LM524-S94', '524 Diamonds', 'Lords Mobile', 0, 71271, 74122, 73409, 73409, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-10-08', 4, 1),
(40383, 'lordsmobile', 'LM999-S98', '999 Diamonds', 'Lords Mobile', 0, 134937, 140334, 138985, 138985, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-10-08', 4, 1),
(40384, 'lordsmobile', 'LM1049-S94', '1049 Diamonds', 'Lords Mobile', 0, 142829, 148542, 147114, 147114, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-10-08', 4, 1),
(40385, 'lordsmobile', 'LM1999-S98', '1999 Diamonds', 'Lords Mobile', 0, 269875, 280670, 277971, 277971, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-10-08', 4, 1),
(40386, 'lordsmobile', 'LMMDP-S98', 'Monthly Diamond Pass', 'Lords Mobile', 0, 271217, 282066, 279354, 279354, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-10-08', 4, 1),
(40387, 'lordsmobile', 'LM2099-S94', '2099 Diamonds', 'Lords Mobile', 0, 285944, 297382, 294522, 294522, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-10-08', 4, 1),
(40388, 'lordsmobile', 'LM4999-S98', '4999 Diamonds', 'Lords Mobile', 0, 675039, 702041, 695290, 695290, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-10-08', 4, 1),
(40389, 'lordsmobile', 'LM5249-S94', '5249 Diamonds', 'Lords Mobile', 0, 712713, 741222, 734094, 734094, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-10-08', 4, 1),
(40390, 'lordsmobile', 'LM6295-S32', '6265 Diamonds', 'Lords Mobile', 0, 896475, 932334, 923369, 923369, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-10-08', 4, 1),
(40391, 'lordsmobile', 'LM9999-S98', '9999 Diamonds', 'Lords Mobile', 0, 1350196, 1404204, 1390702, 1390702, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-10-08', 4, 1),
(40392, 'lordsmobile', 'LM10499-S94', '10499 Diamonds', 'Lords Mobile', 0, 1428288, 1485420, 1471137, 1471137, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-10-08', 4, 1),
(40393, 'marvelsnap', 'MSNPWLB-S50', 'Welcome Bundle', 'Marvel Snap', 0, 33518, 33518, 33518, 33518, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-10-08', 4, 1),
(40394, 'marvelsnap', 'MSNP300-S50', '300 Gold', 'Marvel Snap', 0, 55949, 55949, 55949, 55949, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-10-08', 4, 1),
(40395, 'marvelsnap', 'MSNPPRM-S50', 'Season Pass Premium', 'Marvel Snap', 0, 112153, 112153, 112153, 112153, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-10-08', 4, 1),
(40396, 'marvelsnap', 'MSNP600-S50', '600 Gold + 100 Gold Bonus', 'Marvel Snap', 0, 112153, 112153, 112153, 112153, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-10-08', 4, 1),
(40397, 'marvelsnap', 'MSNPPRMPLS-S50', 'Season Pass Premium Plus', 'Marvel Snap', 0, 168357, 168357, 168357, 168357, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-10-08', 4, 1),
(40398, 'marvelsnap', 'MSNP1200-S50', '1200 Gold + 250 Gold Bonus', 'Marvel Snap', 0, 224561, 224561, 224561, 224561, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-10-08', 4, 1),
(40399, 'marvelsnap', 'MSNP2100-S50', '2100 Gold + 500 Gold Bonus', 'Marvel Snap', 0, 393300, 393300, 393300, 393300, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-10-08', 4, 1),
(40400, 'marvelsnap', 'MSNP3000-S50', '3000 Gold + 850 Gold Bonus', 'Marvel Snap', 0, 559618, 559618, 559618, 559618, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-10-08', 4, 1),
(40401, 'marvelsnap', 'MSNP6000-S50', '6000 Gold + 2000 Gold Bonus', 'Marvel Snap', 0, 1121658, 1121658, 1121658, 1121658, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-10-08', 4, 1),
(40402, 'marvelsnap', 'MSNPPB-S50', 'Pro Bundle', 'Marvel Snap', 0, 1121658, 1121658, 1121658, 1121658, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-10-08', 4, 1),
(40403, 'marvelsuperwar', 'MSW55SC-S1', '55 Star Credits', 'Marvel Super War', 0, 11510, 11970, 11855, 11855, 0, 0, 0, 'marvel_super_war.png', '', 1, '2023-10-08', 4, 1),
(40404, 'marvelsuperwar', 'MSW275SC-S1', '275 Star Credits', 'Marvel Super War', 0, 57552, 59854, 59279, 59279, 0, 0, 0, 'marvel_super_war.png', '', 1, '2023-10-08', 4, 1),
(40405, 'marvelsuperwar', 'MSW565SC-S1', '565 Star Credits', 'Marvel Super War', 0, 115104, 119708, 118557, 118557, 0, 0, 0, 'marvel_super_war.png', '', 1, '2023-10-08', 4, 1),
(40406, 'marvelsuperwar', 'MSW1155SC-S1', '1155 Star Credits', 'Marvel Super War', 0, 230208, 239416, 237114, 237114, 0, 0, 0, 'marvel_super_war.png', '', 1, '2023-10-08', 4, 1),
(40407, 'marvelsuperwar', 'MSW1765SC-S1', '1765 Star Credits', 'Marvel Super War', 0, 374087, 389050, 385310, 385310, 0, 0, 0, 'marvel_super_war.png', '', 1, '2023-10-08', 4, 1),
(40408, 'marvelsuperwar', 'MSW2950SC-S1', '2950 Star Credits', 'Marvel Super War', 0, 575519, 598540, 592785, 592785, 0, 0, 0, 'marvel_super_war.png', '', 1, '2023-10-08', 4, 1),
(40409, 'marvelsuperwar', 'MSW6000SC-S1', '6000 Star Credits', 'Marvel Super War', 0, 1151038, 1197080, 1185569, 1185569, 0, 0, 0, 'marvel_super_war.png', '', 1, '2023-10-08', 4, 1),
(40410, 'metalslugawakening', 'MSAWK60-S81', '60 ruby', 'Metal Slug Awakening', 0, 12726, 12726, 12726, 12726, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-10-08', 4, 1),
(40411, 'metalslugawakening', 'MSAWK310-S81', '310 Ruby', 'Metal Slug Awakening', 0, 59388, 59388, 59388, 59388, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-10-08', 4, 1),
(40412, 'metalslugawakening', 'MSAWKSP-S81M', 'Support Pass', 'Metal Slug Awakening', 0, 59388, 59388, 59388, 59388, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-10-08', 4, 1),
(40413, 'metalslugawakening', 'MSAWKKB-S81', 'Kartu Bulanan', 'Metal Slug Awakening', 0, 59388, 59388, 59388, 59388, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-10-08', 4, 1),
(40414, 'metalslugawakening', 'MSAWK630-S81', '630 Ruby', 'Metal Slug Awakening', 0, 114534, 114534, 114534, 114534, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-10-08', 4, 1),
(40415, 'metalslugawakening', 'MSAWKSPP1-S81M', 'Premium Support Pass', 'Metal Slug Awakening', 0, 114534, 114534, 114534, 114534, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-10-08', 4, 1),
(40416, 'metalslugawakening', 'MSAWKKBP-S81', 'Kartu Bulanan Premium', 'Metal Slug Awakening', 0, 114534, 114534, 114534, 114534, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-10-08', 4, 1),
(40417, 'metalslugawakening', 'MSAWK1300-S81', '1300 Ruby', 'Metal Slug Awakening', 0, 229068, 229068, 229068, 229068, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-10-08', 4, 1),
(40418, 'metalslugawakening', 'MSAWK3200-S81', '3200 Ruby', 'Metal Slug Awakening', 0, 593880, 593880, 593880, 593880, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-10-08', 4, 1),
(40419, 'metalslugawakening', 'MSAWK6500-S81', '6500 Ruby', 'Metal Slug Awakening', 0, 1145340, 1145340, 1145340, 1145340, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-10-08', 4, 1),
(40420, 'metalslugawakening', 'MSAWK6500_5-S81', '6500 Ruby x 5', 'Metal Slug Awakening', 0, 5726700, 5726700, 5726700, 5726700, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-10-08', 4, 1),
(40421, 'metalslugawakening', 'MSAWK6500_10-S81', '6500 Ruby x 10', 'Metal Slug Awakening', 0, 11453400, 11453400, 11453400, 11453400, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-10-08', 4, 1),
(40422, 'metalslugawakening', 'MSAWK6500_20-S81', '6500 Ruby x 20', 'Metal Slug Awakening', 0, 22906800, 22906800, 22906800, 22906800, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-10-08', 4, 1),
(40423, 'metalslugawakening', 'MSAWK6500_50-S81', '6500 Ruby x 50', 'Metal Slug Awakening', 0, 57267000, 57267000, 57267000, 57267000, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-10-08', 4, 1),
(40424, 'metalslugawakening', 'MSAWK6500_100-S81', '6500 Ruby x 100', 'Metal Slug Awakening', 0, 114534000, 114534000, 114534000, 114534000, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-10-08', 4, 1),
(40425, 'mobilelegendsa', 'MLSO86-S8', '86 Diamonds (78 + 8 Bonus)', 'Mobile Legends A', 0, 19264, 38528, 38528, 38528, 50000, 193, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40426, 'mobilelegendsa', 'MLSOWEEKLY-S8', '1x Weekly Diamond Pass (Event Topup 100)', 'Mobile Legends A', 0, 23839, 47678, 47678, 47678, 0, 238, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40427, 'mobilelegendsa', 'MLSO172-S8', '172 Diamonds (156 + 16 Bonus)', 'Mobile Legends A', 0, 38228, 76456, 76456, 76456, 0, 382, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40428, 'mobilelegendsa', 'MLSOWEEKLY2X-S8', '2x Weekly Diamond Pass (Event Topup 100)', 'Mobile Legends A', 0, 47678, 95356, 95356, 95356, 0, 477, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40429, 'mobilelegendsa', 'MLSO257-S8', '257 Diamonds (234 + 23 Bonus)', 'Mobile Legends A', 0, 55686, 111372, 111372, 111372, 0, 557, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40430, 'mobilelegendsa', 'MLSOWEEKLY3X-S8', '3x Weekly Diamond Pass (Event Topup 100)', 'Mobile Legends A', 0, 71518, 143036, 143036, 143036, 0, 715, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40431, 'mobilelegendsa', 'MLSO343-S8', '343 Diamonds (312 + 31 Bonus)', 'Mobile Legends A', 0, 74950, 149900, 149900, 149900, 0, 750, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40432, 'mobilelegendsa', 'MLSO344-S8', '344 Diamonds (312 + 32 Bonus)', 'Mobile Legends A', 0, 76454, 152908, 152908, 152908, 0, 765, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40433, 'mobilelegendsa', 'MLSO429-S8', '429 Diamonds (390 + 39 Bonus)', 'Mobile Legends A', 0, 93912, 187824, 187824, 187824, 0, 939, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40434, 'mobilelegendsa', 'MLSOWEEKLY4X-S8', '4x Weekly Diamond Pass (Event Topup 100)', 'Mobile Legends A', 0, 95357, 190714, 190714, 190714, 0, 954, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40435, 'mobilelegendsa', 'MLSO514-S8', '514 Diamonds (468 + 46 Bonus)', 'Mobile Legends A', 0, 111370, 222740, 222740, 222740, 0, 1, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40436, 'mobilelegendsa', 'MLSOWEEKLY5X-S8', '5x Weekly Diamond Pass (Event Topup 100)', 'Mobile Legends A', 0, 119196, 238392, 238392, 238392, 0, 1, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40437, 'mobilelegendsa', 'MLSO600-S8', '600 Diamonds (546 + 54 Bonus)', 'Mobile Legends A', 0, 130634, 261268, 261268, 261268, 0, 1, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40438, 'mobilelegendsa', 'MLSO706-S8', '706 Diamonds (625 + 81 Bonus)', 'Mobile Legends A', 0, 150500, 301000, 301000, 301000, 0, 2, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40439, 'mobilelegendsa', 'MLSO792-S8', '792 Diamonds (703 + 89 Bonus)', 'Mobile Legends A', 0, 169764, 339528, 339528, 339528, 0, 2, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40440, 'mobilelegendsa', 'MLSO878-S8', '878 Diamonds (781 + 97 Bonus)', 'Mobile Legends A', 0, 188728, 377456, 377456, 377456, 0, 2, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40441, 'mobilelegendsa', 'MLSO963-S8', '963 Diamonds (859 + 104 Bonus)', 'Mobile Legends A', 0, 206186, 412372, 412372, 412372, 0, 2, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40442, 'mobilelegendsa', 'MLSO1050-S8', '1050 Diamonds (937 + 113 Bonus)', 'Mobile Legends A', 0, 226954, 453908, 453908, 453908, 0, 2, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40443, 'mobilelegendsa', 'MLSO1135-S8', '1135 Diamonds (1015 + 120 Bonus)	', 'Mobile Legends A', 0, 244412, 488824, 488824, 488824, 0, 2, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40444, 'mobilelegendsa', 'MLSO1220-S8', '1220 Diamonds (1093 + 127 Bonus)', 'Mobile Legends A', 0, 261870, 523740, 523740, 523740, 0, 3, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40445, 'mobilelegendsa', 'MLSO1412-S8', '1412 Diamonds (1250 + 162 Bonus)', 'Mobile Legends A', 0, 301000, 602000, 602000, 602000, 0, 3, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40446, 'mobilelegendsa', 'MLSO1584-S8', '1584 Diamonds (1406 + 178 Bonus)', 'Mobile Legends A', 0, 339228, 678456, 678456, 678456, 0, 3, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40447, 'mobilelegendsa', 'MLSO1669-S8', '1669 Diamonds (1484 + 185 Bonus)', 'Mobile Legends A', 0, 356686, 713372, 713372, 713372, 0, 4, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40448, 'mobilelegendsa', 'MLSO1756-S8', '1756 Diamonds (1562 + 194 Bonus)', 'Mobile Legends A', 0, 377454, 754908, 754908, 754908, 0, 4, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40449, 'mobilelegendsa', 'MLSO1841-S8', '1841 Diamonds (1640 + 201 Bonus )', 'Mobile Legends A', 0, 394912, 789824, 789824, 789824, 0, 4, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40450, 'mobilelegendsa', 'MLSO2195-S8', '2195 Diamonds (1860 + 335 Bonus)', 'Mobile Legends A', 0, 455414, 910828, 910828, 910828, 0, 5, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40451, 'mobilelegendsa', 'MLSO2539-S8', '2539 Diamonds (2172 + 367 Bonus)', 'Mobile Legends A', 0, 531868, 1063736, 1063736, 1063736, 0, 5, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40452, 'mobilelegendsa', 'MLSO2901-S8', '2901 Diamonds (2485 + 416 Bonus)', 'Mobile Legends A', 0, 605914, 1211828, 1211828, 1211828, 0, 6, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40453, 'mobilelegendsa', 'MLSO3073-S8', '3073 Diamonds (2641 + 432 Bonus)', 'Mobile Legends A', 0, 644140, 1288280, 1288280, 1288280, 0, 6, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40454, 'mobilelegendsa', 'MLSO3688-S8', '3688 Diamonds (3099 + 589 Bonus)', 'Mobile Legends A', 0, 759724, 1519448, 1519448, 1519448, 0, 8, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40455, 'mobilelegendsa', 'MLSO4394-S8', '4394 Diamonds (3724 + 670 Bonus)', 'Mobile Legends A', 0, 910224, 1820448, 1820448, 1820448, 0, 9, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40456, 'mobilelegendsa', 'MLSO5532-S8', '5532 Diamonds (4649 + 883 Bonus)', 'Mobile Legends A', 0, 1146810, 2293620, 2293620, 2293620, 0, 11, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40457, 'mobilelegendsa', 'MLSO6238-S8', '6238 Diamonds (5274 + 964 Bonus)', 'Mobile Legends A', 0, 1297310, 2594620, 2594620, 2594620, 0, 13, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40458, 'mobilelegendsa', 'MLSO7727-S8', '7727 Diamonds (6509 + 1218 Bonus)', 'Mobile Legends A', 0, 1602224, 3204448, 3204448, 3204448, 0, 16, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40459, 'mobilelegendsa', 'MLSO9288-S8', '9288 Diamonds (7740 + 1548 Bonus)', 'Mobile Legends A', 0, 1905030, 3810060, 3810060, 3810060, 0, 19, 0, 'mobile_legends_a.png', '', 1, '2023-10-08', 4, 1),
(40460, 'mobilelegendsb', 'ML5_0-S50A', '5 Diamonds ( 5 + 0 Bonus )', 'Mobile Legends B', 0, 1364, 1419, 1405, 1405, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40461, 'mobilelegendsb', 'ML10_1-S1234', '11 Diamonds ( 10 + 1 Bonus )', 'Mobile Legends B', 0, 2610, 2714, 2688, 2688, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40462, 'mobilelegendsb', 'ML13_1-S95', '14 Diamonds ( 13 + 1 Bonus )', 'Mobile Legends B', 0, 3258, 3388, 3356, 3356, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40463, 'mobilelegendsb', 'ML26_2-S95', '28 Diamonds ( 26 + 2 Bonus )', 'Mobile Legends B', 0, 6516, 6777, 6711, 6711, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40464, 'mobilelegendsb', 'ML38_4-S1234', '42 Diamonds ( 38 + 4 Bonus )', 'Mobile Legends B', 0, 9131, 9496, 9405, 9405, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40465, 'mobilelegendsb', 'ML51_5-S1234', '56 Diamonds ( 51 + 5 Bonus )', 'Mobile Legends B', 0, 12513, 13014, 12888, 12888, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40466, 'mobilelegendsb', 'ML64_6-S1234', '70 Diamonds ( 64 + 6 Bonus )', 'Mobile Legends B', 0, 15218, 15827, 15675, 15675, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40467, 'mobilelegendsb', 'ML78_8-S2', '86 Diamonds ( 78 + 8 Bonus )', 'Mobile Legends B', 0, 19260, 20030, 19838, 19838, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40468, 'mobilelegendsb', 'ML78_8-S42', '86 Diamonds ( 78 + 8 Bonus )', 'Mobile Legends B', 0, 19274, 20045, 19852, 19852, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40469, 'mobilelegendsb', 'MLWEEKLYDIAMONDPASS-S1234', 'Weekly Diamond Pass (Event Topup +100)', 'Mobile Legends B', 0, 23590, 24534, 24298, 24298, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40470, 'mobilelegendsb', 'MLWEEKLYDIAMONDPASS-S1000', 'Weekly Diamond Pass (Event Topup +100)', 'Mobile Legends B', 0, 25042, 26044, 25793, 25793, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40471, 'mobilelegendsb', 'ML104_10-S2', '114 Diamonds ( 104 + 10 Bonus )', 'Mobile Legends B', 0, 25585, 26608, 26353, 26353, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40472, 'mobilelegendsb', 'ML102_10-S1234', '112 Diamonds ( 102 + 10 Bonus )', 'Mobile Legends B', 0, 26089, 27133, 26872, 26872, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40473, 'mobilelegendsb', 'ML104_10-S1000', '114 Diamonds ( 104 + 10 Bonus )', 'Mobile Legends B', 0, 28312, 29444, 29161, 29161, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40474, 'mobilelegendsb', 'ML127_13-S1234', '140 Diamonds ( 127 + 13 Bonus )', 'Mobile Legends B', 0, 30434, 31651, 31347, 31347, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40475, 'mobilelegendsb', 'ML129_13-S2', '142 Diamonds ( 129 + 13 Bonus )', 'Mobile Legends B', 0, 31552, 32814, 32499, 32499, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40476, 'mobilelegendsb', 'ML129_13-S42', '142 Diamonds ( 129 + 13 Bonus )', 'Mobile Legends B', 0, 32075, 33358, 33037, 33037, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40477, 'mobilelegendsb', 'ML129_13-S1000', '142 Diamonds ( 129 + 13 Bonus )', 'Mobile Legends B', 0, 37462, 38960, 38586, 38586, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40478, 'mobilelegendsb', 'ML156_16-S2', '172 Diamonds ( 156 + 16 Bonus )', 'Mobile Legends B', 0, 38218, 39747, 39365, 39365, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40479, 'mobilelegendsb', 'ML156_16-S42', '172 Diamonds ( 156 + 16 Bonus )', 'Mobile Legends B', 0, 38549, 40091, 39705, 39705, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40480, 'mobilelegendsb', 'ML156_16-S1000', '172 Diamonds ( 156 + 16 Bonus )', 'Mobile Legends B', 0, 44096, 45860, 45419, 45419, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40481, 'mobilelegendsb', 'ML203_20-S1234', '223 Diamonds ( 203 + 20 Bonus )', 'Mobile Legends B', 0, 52179, 54266, 53744, 53744, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40482, 'mobilelegendsb', 'ML234_23-S2', '257 Diamonds ( 234 + 23 Bonus )', 'Mobile Legends B', 0, 55672, 57899, 57342, 57342, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40483, 'mobilelegendsb', 'ML234_23-S42', '257 Diamonds ( 234 + 23 Bonus )', 'Mobile Legends B', 0, 57823, 60136, 59558, 59558, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40484, 'mobilelegendsb', 'ML254_30-S1234', '284 Diamonds ( 254 + 30 Bonus )', 'Mobile Legends B', 0, 60870, 63305, 62696, 62696, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40485, 'mobilelegendsb', 'ML234_23-S1000', '257 Diamonds ( 234 + 23 Bonus )', 'Mobile Legends B', 0, 61600, 64064, 63448, 63448, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40486, 'mobilelegendsb', 'ML260_25-S2', '285 Diamonds ( 260 + 25 Bonus )', 'Mobile Legends B', 0, 62311, 64803, 64180, 64180, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40487, 'mobilelegendsb', 'ML260_25-S42', '285 Diamonds ( 260 + 25 Bonus )', 'Mobile Legends B', 0, 64153, 66719, 66078, 66078, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40488, 'mobilelegendsb', 'ML272_28-S2', '300 Diamonds ( 272 + 28 Bonus )', 'Mobile Legends B', 0, 66607, 69271, 68605, 68605, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40489, 'mobilelegendsb', 'ML272_28-S42', '300 Diamonds ( 272 + 28 Bonus )', 'Mobile Legends B', 0, 66954, 69632, 68963, 68963, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40490, 'mobilelegendsb', 'ML260_25-S1000', '285 Diamonds ( 260 + 25 Bonus )', 'Mobile Legends B', 0, 70139, 72945, 72243, 72243, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40491, 'mobilelegendsb', 'ML317_38-S1234', '355 Diamonds ( 317 + 38 Bonus )', 'Mobile Legends B', 0, 76087, 79130, 78370, 78370, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40492, 'mobilelegendsb', 'ML312_32-S2', '344 Diamonds ( 312 + 32 Bonus )', 'Mobile Legends B', 0, 76436, 79493, 78729, 78729, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40493, 'mobilelegendsb', 'ML312_32-S42', '344 Diamonds ( 312 + 32 Bonus )', 'Mobile Legends B', 0, 77096, 80180, 79409, 79409, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40494, 'mobilelegendsb', 'ML272_28-S1000', '300 Diamonds ( 272 + 28 Bonus )', 'Mobile Legends B', 0, 77957, 81075, 80296, 80296, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40495, 'mobilelegendsb', 'ML338_34-S2', '372 Diamonds ( 338 + 34 Bonus )', 'Mobile Legends B', 0, 82761, 86071, 85244, 85244, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40496, 'mobilelegendsb', 'ML338_34-S42', '372 Diamonds ( 338 + 34 Bonus )', 'Mobile Legends B', 0, 83427, 86764, 85930, 85930, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40497, 'mobilelegendsb', 'ML312_32-S1000', '344 Diamonds ( 312 + 32 Bonus )', 'Mobile Legends B', 0, 83737, 87086, 86249, 86249, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40498, 'mobilelegendsb', 'ML390_39-S1234', '429 Diamonds ( 390 + 39 Bonus )', 'Mobile Legends B', 0, 91304, 94956, 94043, 94043, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40499, 'mobilelegendsb', 'ML338_34-S1000', '372 Diamonds ( 338 + 34 Bonus )', 'Mobile Legends B', 0, 96136, 99981, 99020, 99020, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40500, 'mobilelegendsb', 'ML390_39-S1000', '429 Diamonds ( 390 + 39 Bonus )', 'Mobile Legends B', 0, 101469, 105528, 104513, 104513, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40501, 'mobilelegendsb', 'ML468_46-S2', '514 Diamonds ( 468 + 46 Bonus )', 'Mobile Legends B', 0, 111344, 115798, 114684, 114684, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40502, 'mobilelegendsb', 'ML468_46-S42', '514 Diamonds ( 468 + 46 Bonus )', 'Mobile Legends B', 0, 115645, 120271, 119114, 119114, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40503, 'mobilelegendsb', 'ML506_50-S2', '556 Diamonds ( 506 + 50 Bonus )', 'Mobile Legends B', 0, 120474, 125293, 124088, 124088, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40504, 'mobilelegendsb', 'ML519_51-S2', '570 Diamonds ( 519 + 51 Bonus )', 'Mobile Legends B', 0, 123637, 128582, 127346, 127346, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40505, 'mobilelegendsb', 'ML506_50-S42', '556 Diamonds ( 506 + 50 Bonus )', 'Mobile Legends B', 0, 124776, 129767, 128519, 128519, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40506, 'mobilelegendsb', 'MLTL-S2', 'Twilight Pass', 'Mobile Legends B', 0, 126089, 131133, 129872, 129872, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40507, 'mobilelegendsb', 'ML519_51-S42', '570 Diamonds ( 519 + 51 Bonus )', 'Mobile Legends B', 0, 127942, 133060, 131780, 131780, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40508, 'mobilelegendsb', 'ML468_46-S1000', '514 Diamonds ( 468 + 46 Bonus )', 'Mobile Legends B', 0, 130111, 135315, 134014, 134014, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40509, 'mobilelegendsb', 'ML504_66-S1234', '570 Diamonds ( 504 + 66 Bonus )', 'Mobile Legends B', 0, 130446, 135664, 134359, 134359, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40510, 'mobilelegendsb', 'ML546_54-S2', '600 Diamonds ( 546 + 54 Bonus )', 'Mobile Legends B', 0, 130603, 135827, 134521, 134521, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40511, 'mobilelegendsb', 'ML546_54-S42', '600 Diamonds ( 546 + 54 Bonus )', 'Mobile Legends B', 0, 134919, 140316, 138967, 138967, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40512, 'mobilelegendsb', 'ML506_50-S1000', '556 Diamonds ( 506 + 50 Bonus )', 'Mobile Legends B', 0, 140744, 146374, 144966, 144966, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40513, 'mobilelegendsb', 'ML519_51-S1000', '570 Diamonds ( 519 + 51 Bonus )', 'Mobile Legends B', 0, 144288, 150060, 148617, 148617, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40514, 'mobilelegendsb', 'ML625_81-S2', '706 Diamonds ( 625 + 81 Bonus )', 'Mobile Legends B', 0, 150465, 156484, 154979, 154979, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40515, 'mobilelegendsb', 'ML546_54-S1000', '600 Diamonds ( 546 + 54 Bonus )', 'Mobile Legends B', 0, 151881, 157956, 156437, 156437, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40516, 'mobilelegendsb', 'ML633_83-S1234', '716 Diamonds ( 633 + 83 Bonus )', 'Mobile Legends B', 0, 152174, 158261, 156739, 156739, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40517, 'mobilelegendsb', 'ML638_82-S2', '720 Diamonds ( 638 + 82 Bonus )', 'Mobile Legends B', 0, 153627, 159772, 158236, 158236, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40518, 'mobilelegendsb', 'ML625_81-S42', '706 Diamonds ( 625 + 81 Bonus )', 'Mobile Legends B', 0, 154193, 160361, 158819, 158819, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40519, 'mobilelegendsb', 'ML638_82-S42', '720 Diamonds ( 638 + 82 Bonus )', 'Mobile Legends B', 0, 157358, 163652, 162079, 162079, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40520, 'mobilelegendsb', 'ML638_82-S1000', '720 Diamonds ( 638 + 82 Bonus )', 'Mobile Legends B', 0, 167256, 173946, 172274, 172274, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40521, 'mobilelegendsb', 'ML625_81-S1000', '706 Diamonds ( 625 + 81 Bonus )', 'Mobile Legends B', 0, 174601, 181585, 179839, 179839, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40522, 'mobilelegendsb', 'ML781_97-S2', '878 Diamonds ( 781 + 97 Bonus )', 'Mobile Legends B', 0, 188683, 196230, 194343, 194343, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40523, 'mobilelegendsb', 'ML781_97-S42', '878 Diamonds ( 781 + 97 Bonus )', 'Mobile Legends B', 0, 192741, 200451, 198523, 198523, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40524, 'mobilelegendsb', 'ML859_104-S2', '963 Diamonds ( 859 + 104 Bonus )', 'Mobile Legends B', 0, 206137, 214382, 212321, 212321, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40525, 'mobilelegendsb', 'ML872_105-S2', '977 Diamonds ( 872 + 105 Bonus )', 'Mobile Legends B', 0, 209299, 217671, 215578, 215578, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40526, 'mobilelegendsb', 'ML859_104-S42', '963 Diamonds ( 859 + 104 Bonus )', 'Mobile Legends B', 0, 212015, 220496, 218375, 218375, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40527, 'mobilelegendsb', 'ML872_105-S42', '977 Diamonds ( 872 + 105 Bonus )', 'Mobile Legends B', 0, 215181, 223788, 221636, 221636, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40528, 'mobilelegendsb', 'ML781_97-S1000', '878 Diamonds ( 781 + 97 Bonus )', 'Mobile Legends B', 0, 221220, 230069, 227857, 227857, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40529, 'mobilelegendsb', 'ML937_113-S2', '1050 Diamonds ( 937 + 113 Bonus )', 'Mobile Legends B', 0, 226901, 235977, 233708, 233708, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40530, 'mobilelegendsb', 'ML937_113-S42', '1050 Diamonds ( 937 + 113 Bonus )', 'Mobile Legends B', 0, 231289, 240541, 238228, 238228, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40531, 'mobilelegendsb', 'ML859_104-S1000', '963 Diamonds ( 859 + 104 Bonus )', 'Mobile Legends B', 0, 242636, 252341, 249915, 249915, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40532, 'mobilelegendsb', 'ML1015_120-S2', '1135 Diamonds ( 1015 + 120 Bonus )', 'Mobile Legends B', 0, 244354, 254128, 251685, 251685, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40533, 'mobilelegendsb', 'ML872_105-S1000', '977 Diamonds ( 872 + 105 Bonus )', 'Mobile Legends B', 0, 246164, 256011, 253549, 253549, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40534, 'mobilelegendsb', 'ML1015_120-S42', '1135 Diamonds ( 1015 + 120 Bonus )', 'Mobile Legends B', 0, 250563, 260586, 258080, 258080, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40535, 'mobilelegendsb', 'ML1041_122-S2', '1163 Diamonds ( 1041 + 122 Bonus )', 'Mobile Legends B', 0, 250680, 260707, 258200, 258200, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40536, 'mobilelegendsb', 'ML1041_122-S42', '1163 Diamonds ( 1041 + 122 Bonus )', 'Mobile Legends B', 0, 256894, 267170, 264601, 264601, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40537, 'mobilelegendsb', 'ML1007_156-S1234', '1163 Diamonds ( 1007 + 156 Bonus )', 'Mobile Legends B', 0, 260891, 271327, 268718, 268718, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40538, 'mobilelegendsb', 'ML1093_127-S2', '1220 Diamonds ( 1093 + 127 Bonus )', 'Mobile Legends B', 0, 261809, 272281, 269663, 269663, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40539, 'mobilelegendsb', 'ML937_113-S1000', '1050 Diamonds ( 937 + 113 Bonus )', 'Mobile Legends B', 0, 262901, 273417, 270788, 270788, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40540, 'mobilelegendsb', 'ML1093_127-S42', '1220 Diamonds ( 1093 + 127 Bonus )', 'Mobile Legends B', 0, 269838, 280632, 277933, 277933, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40541, 'mobilelegendsb', 'ML1015_120-S1000', '1135 Diamonds ( 1015 + 120 Bonus )', 'Mobile Legends B', 0, 285974, 297413, 294553, 294553, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40542, 'mobilelegendsb', 'ML1041_122-S1000', '1163 Diamonds ( 1041 + 122 Bonus )', 'Mobile Legends B', 0, 293029, 304750, 301820, 301820, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40543, 'mobilelegendsb', 'ML1250_162-S2', '1412 Diamonds ( 1250 + 162 Bonus )', 'Mobile Legends B', 0, 300930, 312967, 309958, 309958, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40544, 'mobilelegendsb', 'ML1093_127-S1000', '1220 Diamonds ( 1093 + 127 Bonus )', 'Mobile Legends B', 0, 303348, 315482, 312448, 312448, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40545, 'mobilelegendsb', 'ML1250_162-S42', '1412 Diamonds ( 1250 + 162 Bonus )', 'Mobile Legends B', 0, 308385, 320720, 317637, 317637, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40546, 'mobilelegendsb', 'ML1288_166-S2', '1454 Diamonds ( 1288 + 166 Bonus )', 'Mobile Legends B', 0, 310060, 322462, 319362, 319362, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40547, 'mobilelegendsb', 'ML1288_166-S42', '1454 Diamonds ( 1288 + 166 Bonus )', 'Mobile Legends B', 0, 317518, 330219, 327044, 327044, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40548, 'mobilelegendsb', 'ML1250_162-S1000', '1412 Diamonds ( 1250 + 162 Bonus )', 'Mobile Legends B', 0, 355766, 369997, 366439, 366439, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40549, 'mobilelegendsb', 'ML1484_185-S2', '1669 Diamonds ( 1484 + 185 Bonus )', 'Mobile Legends B', 0, 356602, 370866, 367300, 367300, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40550, 'mobilelegendsb', 'ML1484_185-S42', '1669 Diamonds ( 1484 + 185 Bonus )', 'Mobile Legends B', 0, 366208, 380856, 377194, 377194, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40551, 'mobilelegendsb', 'ML1288_166-S1000', '1454 Diamonds ( 1288 + 166 Bonus )', 'Mobile Legends B', 0, 366349, 381003, 377339, 377339, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40552, 'mobilelegendsb', 'ML1484_185-S1000', '1669 Diamonds ( 1484 + 185 Bonus )', 'Mobile Legends B', 0, 413181, 429708, 425576, 425576, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40553, 'mobilelegendsb', 'ML1860_335-S2', '2195 Diamonds ( 1860 + 335 Bonus )', 'Mobile Legends B', 0, 455306, 473518, 468965, 468965, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40554, 'mobilelegendsb', 'ML1860_335-S42', '2195 Diamonds ( 1860 + 335 Bonus )', 'Mobile Legends B', 0, 462578, 481081, 476455, 476455, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40555, 'mobilelegendsb', 'ML2015_383-S1234', '2398 Diamonds ( 2015 + 383 Bonus )', 'Mobile Legends B', 0, 521781, 542652, 537434, 537434, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40556, 'mobilelegendsb', 'ML1860_335-S1000', '2195 Diamonds ( 1860 + 335 Bonus )', 'Mobile Legends B', 0, 523382, 544317, 539083, 539083, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40557, 'mobilelegendsb', 'ML2172_367-S2', '2539 Diamonds ( 2172 + 367 Bonus )', 'Mobile Legends B', 0, 531743, 553013, 547695, 547695, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40558, 'mobilelegendsb', 'ML2172_367-S42', '2539 Diamonds ( 2172 + 367 Bonus )', 'Mobile Legends B', 0, 539674, 561261, 555864, 555864, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40559, 'mobilelegendsb', 'ML2485_416-S2', '2901 Diamonds ( 2485 + 416 Bonus )', 'Mobile Legends B', 0, 605771, 630002, 623944, 623944, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40560, 'mobilelegendsb', 'ML2172_367-S1000', '2539 Diamonds ( 2172 + 367 Bonus )', 'Mobile Legends B', 0, 616110, 640754, 634593, 634593, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40561, 'mobilelegendsb', 'ML2485_416-S42', '2901 Diamonds ( 2485 + 416 Bonus )', 'Mobile Legends B', 0, 616771, 641442, 635274, 635274, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40562, 'mobilelegendsb', 'ML2485_416-S1000', '2901 Diamonds ( 2485 + 416 Bonus )', 'Mobile Legends B', 0, 691723, 719392, 712475, 712475, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40563, 'mobilelegendsb', 'ML3099_589-S2', '3688 Diamonds ( 3099 + 589 Bonus )', 'Mobile Legends B', 0, 759546, 789928, 782332, 782332, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40564, 'mobilelegendsb', 'ML3099_589-S42', '3688 Diamonds ( 3099 + 589 Bonus )', 'Mobile Legends B', 0, 770963, 801802, 794092, 794092, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40565, 'mobilelegendsb', 'ML3099_589-S1000', '3688 Diamonds ( 3099 + 589 Bonus )', 'Mobile Legends B', 0, 878285, 913416, 904634, 904634, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40566, 'mobilelegendsb', 'ML3724_670-S2', '4394 Diamonds ( 3724 + 670 Bonus )', 'Mobile Legends B', 0, 910011, 946411, 937311, 937311, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40567, 'mobilelegendsb', 'ML3724_670-S42', '4394 Diamonds ( 3724 + 670 Bonus )', 'Mobile Legends B', 0, 925156, 962162, 952911, 952911, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40568, 'mobilelegendsb', 'ML3724_670-S1000', '4394 Diamonds ( 3724 + 670 Bonus )', 'Mobile Legends B', 0, 1009101, 1049465, 1039374, 1039374, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40569, 'mobilelegendsb', 'ML4649_883-S2', '5532 Diamonds ( 4649 + 883 Bonus )', 'Mobile Legends B', 0, 1146542, 1192404, 1180938, 1180938, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40570, 'mobilelegendsb', 'ML4649_883-S42', '5532 Diamonds ( 4649 + 883 Bonus )', 'Mobile Legends B', 0, 1156445, 1202703, 1191138, 1191138, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40571, 'mobilelegendsb', 'ML4649_883-S1000', '5532 Diamonds ( 4649 + 883 Bonus )', 'Mobile Legends B', 0, 1252097, 1302181, 1289660, 1289660, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40572, 'mobilelegendsb', 'ML5274_964-S2', '6238 Diamonds ( 5274 + 964 Bonus )', 'Mobile Legends B', 0, 1297007, 1348887, 1335917, 1335917, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40573, 'mobilelegendsb', 'ML5035_1007-S1234', '6042 Diamonds ( 5035 + 1007 Bonus )', 'Mobile Legends B', 0, 1304453, 1356631, 1343587, 1343587, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40574, 'mobilelegendsb', 'ML5274_964-S1000', '6238 Diamonds ( 5274 + 964 Bonus )', 'Mobile Legends B', 0, 1415909, 1472545, 1458386, 1458386, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40575, 'mobilelegendsb', 'ML6509_1218-S2', '7727 Diamonds ( 6509 + 1218 Bonus )', 'Mobile Legends B', 0, 1601848, 1665922, 1649903, 1649903, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40576, 'mobilelegendsb', 'ML6509_1218-S1000', '7727 Diamonds ( 6509 + 1218 Bonus )', 'Mobile Legends B', 0, 1750461, 1820479, 1802975, 1802975, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40577, 'mobilelegendsb', 'ML7740_1548-S2', '9288 Diamonds ( 7740 + 1548 Bonus )', 'Mobile Legends B', 0, 1904583, 1980766, 1961720, 1961720, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40578, 'mobilelegendsb', 'ML7740_1548-S42', '9288 Diamonds ( 7740 + 1548 Bonus )', 'Mobile Legends B', 0, 1927408, 2004504, 1985230, 1985230, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40579, 'mobilelegendsb', 'ML7740_1548-S1000', '9288 Diamonds ( 7740 + 1548 Bonus )', 'Mobile Legends B', 0, 2085212, 2168620, 2147768, 2147768, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40580, 'mobilelegendsb', 'ML10839_2137-S2', '12976 Diamonds ( 10839 + 2137 Bonus )', 'Mobile Legends B', 0, 2664129, 2770694, 2744053, 2744053, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40581, 'mobilelegendsb', 'ML11464_2218-S2', '13682 Diamonds ( 11464 + 2218 Bonus )', 'Mobile Legends B', 0, 2814593, 2927177, 2899031, 2899031, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40582, 'mobilelegendsb', 'ML11464_2218-S42', '13682 Diamonds ( 11464 + 2218 Bonus )', 'Mobile Legends B', 0, 2852564, 2966667, 2938141, 2938141, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40583, 'mobilelegendsb', 'ML10839_2137-S1000', '12976 Diamonds ( 10839 + 2137 Bonus )', 'Mobile Legends B', 0, 2922187, 3039074, 3009853, 3009853, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40584, 'mobilelegendsb', 'ML12389_2431-S2', '14820 Diamonds ( 12389 + 2431 Bonus )', 'Mobile Legends B', 0, 3051124, 3173169, 3142658, 3142658, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1);
INSERT INTO `tb_produk` (`cuid`, `slug`, `code`, `title`, `kategori`, `subkategori`, `harga_modal`, `harga_jual`, `harga_reseller`, `harga_h2h`, `harga_coret`, `komisi`, `poin`, `image`, `currency`, `status`, `created_date`, `jenis`, `product_type`) VALUES
(40585, 'mobilelegendsb', 'ML12389_2431-S42', '14820 Diamonds ( 12389 + 2431 Bonus )', 'Mobile Legends B', 0, 3083853, 3207207, 3176369, 3176369, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40586, 'mobilelegendsb', 'ML11464_2218-S1000', '13682 Diamonds ( 11464 + 2218 Bonus )', 'Mobile Legends B', 0, 3085899, 3209335, 3178476, 3178476, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40587, 'mobilelegendsb', 'ML12389_2431-S1000', '14820 Diamonds ( 12389 + 2431 Bonus )', 'Mobile Legends B', 0, 3353241, 3487371, 3453838, 3453838, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40588, 'mobilelegendsb', 'ML15480_3096-S2', '18576 Diamonds ( 15480 + 3096 Bonus )', 'Mobile Legends B', 0, 3809166, 3961533, 3923441, 3923441, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40589, 'mobilelegendsb', 'ML15480_3096-S42', '18576 Diamonds ( 15480 + 3096 Bonus )', 'Mobile Legends B', 0, 3854817, 4009010, 3970462, 3970462, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40590, 'mobilelegendsb', 'ML15480_3096-S1000', '18576 Diamonds ( 15480 + 3096 Bonus )', 'Mobile Legends B', 0, 4170225, 4337034, 4295332, 4295332, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40591, 'mobilelegendsb', 'ML17340_3431-S2', '20771 Diamonds ( 17340 + 3431 Bonus )', 'Mobile Legends B', 0, 4264471, 4435050, 4392405, 4392405, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40592, 'mobilelegendsb', 'ML17340_3431-S42', '20771 Diamonds ( 17340 + 3431 Bonus )', 'Mobile Legends B', 0, 4317394, 4490090, 4446916, 4446916, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40593, 'mobilelegendsb', 'ML17574_3454-S2', '21028 Diamonds ( 17574 + 3454 Bonus )', 'Mobile Legends B', 0, 4320144, 4492950, 4449748, 4449748, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40594, 'mobilelegendsb', 'ML17574_3454-S42', '21028 Diamonds ( 17574 + 3454 Bonus )', 'Mobile Legends B', 0, 4375217, 4550226, 4506474, 4506474, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40595, 'mobilelegendsb', 'ML18813_3708-S2', '22521 Diamonds ( 18813 + 3708 Bonus )', 'Mobile Legends B', 0, 4624384, 4809359, 4763116, 4763116, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40596, 'mobilelegendsb', 'ML17340_3431-S1000', '20771 Diamonds ( 17340 + 3431 Bonus )', 'Mobile Legends B', 0, 4670272, 4857083, 4810380, 4810380, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40597, 'mobilelegendsb', 'ML18813_3708-S42', '22521 Diamonds ( 18813 + 3708 Bonus )', 'Mobile Legends B', 0, 4683602, 4870946, 4824110, 4824110, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40598, 'mobilelegendsb', 'ML17574_3454-S1000', '21028 Diamonds ( 17574 + 3454 Bonus )', 'Mobile Legends B', 0, 4732927, 4922244, 4874915, 4874915, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40599, 'mobilelegendsb', 'ML18813_3708-S1000', '22521 Diamonds ( 18813 + 3708 Bonus )', 'Mobile Legends B', 0, 5066588, 5269252, 5218586, 5218586, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40600, 'mobilelegendsb', 'ML23220_4644-S2', '27864 Diamonds ( 23220 + 4644 Bonus )', 'Mobile Legends B', 0, 5713749, 5942299, 5885161, 5885161, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40601, 'mobilelegendsb', 'ML23220_4644-S42', '27864 Diamonds ( 23220 + 4644 Bonus )', 'Mobile Legends B', 0, 5782225, 6013514, 5955692, 5955692, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40602, 'mobilelegendsb', 'ML23220_4644-S1000', '27864 Diamonds ( 23220 + 4644 Bonus )', 'Mobile Legends B', 0, 6255536, 6505757, 6443202, 6443202, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-10-08', 4, 1),
(40603, 'mobilelegendsgift', 'MLGIFT199-S1', 'ITEM 199 Diamonds [CREATE SQUAD]', 'Mobile Legends Gift', 0, 21890, 21890, 21890, 21890, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-10-08', 4, 1),
(40604, 'mobilelegendsgift', 'MLGIFT188-S1', 'PO SKIN 188 Diamonds [NORMAL] Disc 30%', 'Mobile Legends Gift', 0, 23782, 23782, 23782, 23782, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-10-08', 4, 1),
(40605, 'mobilelegendsgift', 'MLGIFT188PN-S1', 'SKIN 188 Diamonds [SKIN PAINTED]', 'Mobile Legends Gift', 0, 23782, 23782, 23782, 23782, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-10-08', 4, 1),
(40606, 'mobilelegendsgift', 'MLGIFT239-S1', 'ITEM 239 Diamonds [CHANGE NAME]', 'Mobile Legends Gift', 0, 30234, 30234, 30234, 30234, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-10-08', 4, 1),
(40607, 'mobilelegendsgift', 'MLGIFT269-S1', 'SKIN 269 Diamonds [NORMAL]', 'Mobile Legends Gift', 0, 34029, 34029, 34029, 34029, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-10-08', 4, 1),
(40608, 'mobilelegendsgift', 'MLGIFT299-S1', 'SKIN 299 Diamonds [NORMAL]', 'Mobile Legends Gift', 0, 37824, 37824, 37824, 37824, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-10-08', 4, 1),
(40609, 'mobilelegendsgift', 'MLGIFT299CN-S1', 'ITEM 299 Diamonds [CN SQUAD]', 'Mobile Legends Gift', 0, 37824, 37824, 37824, 37824, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-10-08', 4, 1),
(40610, 'mobilelegendsgift', 'MLGIFT399-S1', 'SKIN 399 Diamonds [ELITE]', 'Mobile Legends Gift', 0, 50474, 50474, 50474, 50474, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-10-08', 4, 1),
(40611, 'mobilelegendsgift', 'MLGIFT419-S1', 'PO SKIN 419 Diamonds [ELITE] Disc 30%', 'Mobile Legends Gift', 0, 53004, 53004, 53004, 53004, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-10-08', 4, 1),
(40612, 'mobilelegendsgift', 'MLGIFT499ISL-S1', 'Charisma 499 Diamonds [PARADISE ISLAND]', 'Mobile Legends Gift', 0, 63124, 63124, 63124, 63124, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-10-08', 4, 1),
(40613, 'mobilelegendsgift', 'MLGIFT499ARK-S1', 'Charisma 499 Diamonds [ANGEL ARK]', 'Mobile Legends Gift', 0, 63124, 63124, 63124, 63124, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-10-08', 4, 1),
(40614, 'mobilelegendsgift', 'MLGIFT599-S1', 'SKIN 599 Diamonds [ELITE]', 'Mobile Legends Gift', 0, 75774, 75774, 75774, 75774, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-10-08', 4, 1),
(40615, 'mobilelegendsgift', 'MLGIFT749-S1', 'SKIN 749 Diamonds [SPECIAL]', 'Mobile Legends Gift', 0, 94749, 94749, 94749, 94749, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-10-08', 4, 1),
(40616, 'mobilelegendsgift', 'MLGIFTESTESM3-S1', 'SKIN Estes Blacklist [EPIC]', 'Mobile Legends Gift', 0, 117319, 117319, 117319, 117319, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-10-08', 4, 1),
(40617, 'mobilelegendsgift', 'MLGIFT999-S1', 'Charisma 999 Diamonds [Goldmoon Lantern]', 'Mobile Legends Gift', 0, 126374, 126374, 126374, 126374, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-10-08', 4, 1),
(40618, 'mobilelegendsgift', 'MLGIFT1000-S1', 'ITEM 1000 Diamonds [CHANGE FLAG]', 'Mobile Legends Gift', 0, 126500, 126500, 126500, 126500, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-10-08', 4, 1),
(40619, 'mobilelegendsgift', 'MLGIFT1089-S1', 'SKIN 1089 Diamonds [LIGHTBORN]', 'Mobile Legends Gift', 0, 137759, 137759, 137759, 137759, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-10-08', 4, 1),
(40620, 'mobilelegendspromo', 'MLPRM14-S3', '14 Diamonds (13 + 1 Bonus)', 'Mobile Legends Promo', 0, 3200, 3200, 3200, 3200, 0, 0, 0, 'mobile_legends_promo.png', '', 1, '2023-10-08', 4, 1),
(40621, 'mobilelegendspromo', 'MLPRM42-S3', '42 Diamonds (38 + 4 Bonus)', 'Mobile Legends Promo', 0, 9120, 9120, 9120, 9120, 0, 0, 0, 'mobile_legends_promo.png', '', 1, '2023-10-08', 4, 1),
(40622, 'mobilelegendspromo', 'MLPRM70-S3', '70 Diamonds (64 + 6 Bonus)', 'Mobile Legends Promo', 0, 15200, 15200, 15200, 15200, 0, 0, 0, 'mobile_legends_promo.png', '', 1, '2023-10-08', 4, 1),
(40623, 'mobilelegendspromo', 'MLPRM140-S3', '140 Diamonds (127 + 13 Bonus)', 'Mobile Legends Promo', 0, 30432, 30432, 30432, 30432, 0, 0, 0, 'mobile_legends_promo.png', '', 1, '2023-10-08', 4, 1),
(40624, 'mobilelegendspromo', 'MLPRM284-S3', '284 Diamonds (254 + 30 Bonus)', 'Mobile Legends Promo', 0, 60864, 60864, 60864, 60864, 0, 0, 0, 'mobile_legends_promo.png', '', 1, '2023-10-08', 4, 1),
(40625, 'mobilelegendspromo', 'MLPRM355-S3', '355 Diamonds (317 + 38 Bonus)', 'Mobile Legends Promo', 0, 76064, 76064, 76064, 76064, 0, 0, 0, 'mobile_legends_promo.png', '', 1, '2023-10-08', 4, 1),
(40626, 'mobilelegendspromo', 'MLPRM429-S3', '429 Diamonds (383 + 46 Bonus)', 'Mobile Legends Promo', 0, 91296, 91296, 91296, 91296, 0, 0, 0, 'mobile_legends_promo.png', '', 1, '2023-10-08', 4, 1),
(40627, 'mobilelegendspromo', 'MLPRM716-S3', '716 Diamonds (633 + 83 Bonus)', 'Mobile Legends Promo', 0, 152160, 152160, 152160, 152160, 0, 0, 0, 'mobile_legends_promo.png', '', 1, '2023-10-08', 4, 1),
(40628, 'omegalegends', 'OL129-S1', '129 Gold', 'Omega Legends', 0, 14388, 14964, 14820, 14820, 0, 0, 0, 'omega_legends.png', '', 1, '2023-10-08', 4, 1),
(40629, 'omegalegends', 'OL258-S1', '258 Gold', 'Omega Legends', 0, 28776, 29927, 29639, 29639, 0, 0, 0, 'omega_legends.png', '', 1, '2023-10-08', 4, 1),
(40630, 'omegalegends', 'OL828-S1', '828 Gold', 'Omega Legends', 0, 86328, 89781, 88918, 88918, 0, 0, 0, 'omega_legends.png', '', 1, '2023-10-08', 4, 1),
(40631, 'omegalegends', 'OL1429-S1', '1429 Gold', 'Omega Legends', 0, 143880, 149635, 148196, 148196, 0, 0, 0, 'omega_legends.png', '', 1, '2023-10-08', 4, 1),
(40632, 'omegalegends', 'OL2927-S1', '2927 Gold', 'Omega Legends', 0, 287760, 299270, 296393, 296393, 0, 0, 0, 'omega_legends.png', '', 1, '2023-10-08', 4, 1),
(40633, 'omegalegends', 'OL9000-S1', '9000 Gold', 'Omega Legends', 0, 863279, 897810, 889177, 889177, 0, 0, 0, 'omega_legends.png', '', 1, '2023-10-08', 4, 1),
(40634, 'onepunchman', 'OP5-S48', '5 Coupon', 'One Punch Man', 0, 6981, 7260, 7190, 7190, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40635, 'onepunchman', 'OP6-S14', '6 Coupon', 'One Punch Man', 0, 8302, 8634, 8551, 8551, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40636, 'onepunchman', 'OP6-S1', '6 Coupon', 'One Punch Man', 0, 8633, 8978, 8892, 8892, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40637, 'onepunchman', 'OP6-S27', '6 Coupon', 'One Punch Man', 0, 8968, 9327, 9237, 9237, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40638, 'onepunchman', 'OP13-S48', '13 Coupon', 'One Punch Man', 0, 18618, 19363, 19177, 19177, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40639, 'onepunchman', 'OP14-S37', '14 Coupon', 'One Punch Man', 0, 21885, 22760, 22542, 22542, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40640, 'onepunchman', 'OP23-S48', '23 Coupon', 'One Punch Man', 0, 34908, 36304, 35955, 35955, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40641, 'onepunchman', 'OP23-S37', '23 Coupon', 'One Punch Man', 0, 36805, 38277, 37909, 37909, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40642, 'onepunchman', 'OP31-S37', '31 Coupon', 'One Punch Man', 0, 51164, 53211, 52699, 52699, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40643, 'onepunchman', 'OP37-S14', '37 Coupon', 'One Punch Man', 0, 55344, 57558, 57004, 57004, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40644, 'onepunchman', 'OP37-S1', '37 Funds', 'One Punch Man', 0, 57552, 59854, 59279, 59279, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40645, 'onepunchman', 'OP37-S27', '37 Coupon', 'One Punch Man', 0, 59787, 62178, 61581, 61581, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40646, 'onepunchman', 'OP45-S37', '45 Coupon', 'One Punch Man', 0, 73123, 76048, 75317, 75317, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40647, 'onepunchman', 'OP61-S48', '61 Coupon', 'One Punch Man', 0, 93089, 96813, 95882, 95882, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40648, 'onepunchman', 'OP91C-S48', '91 Coupon', 'One Punch Man', 0, 139633, 145218, 143822, 143822, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40649, 'onepunchman', 'OP89-S37', '89 Coupon', 'One Punch Man', 0, 146318, 152171, 150708, 150708, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40650, 'onepunchman', 'OP109-S14', '109 Coupon', 'One Punch Man', 0, 166031, 172672, 171012, 171012, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40651, 'onepunchman', 'OP109-S1', '109 Coupon', 'One Punch Man', 0, 172656, 179562, 177836, 177836, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40652, 'onepunchman', 'OP109-S27', '109 Coupon', 'One Punch Man', 0, 179360, 186534, 184741, 184741, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40653, 'onepunchman', 'OP133-S37', '133 Coupon', 'One Punch Man', 0, 219514, 228295, 226099, 226099, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40654, 'onepunchman', 'OP177-S37', '177 Coupon', 'One Punch Man', 0, 292710, 304418, 301491, 301491, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40655, 'onepunchman', 'OP227-S48', '227 Coupon', 'One Punch Man', 0, 349083, 363046, 359555, 359555, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40656, 'onepunchman', 'OP221-S37', '221 Coupon', 'One Punch Man', 0, 365905, 380541, 376882, 376882, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40657, 'onepunchman', 'OP362-S14', '362 Coupon', 'One Punch Man', 0, 553437, 575574, 570040, 570040, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40658, 'onepunchman', 'OP362-S1', '362 Coupon', 'One Punch Man', 0, 575519, 598540, 592785, 592785, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40659, 'onepunchman', 'OP362-S27', '362 Coupon', 'One Punch Man', 0, 597865, 621780, 615801, 615801, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40660, 'onepunchman', 'OP904-S14', '904 Coupon', 'One Punch Man', 0, 1383592, 1438936, 1425100, 1425100, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40661, 'onepunchman', 'OP904-S1', '904 Coupon', 'One Punch Man', 0, 1438798, 1496350, 1481962, 1481962, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40662, 'onepunchman', 'OP904-S27', '904 Coupon', 'One Punch Man', 0, 1494663, 1554450, 1539503, 1539503, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-10-08', 4, 1),
(40663, 'picsartpro', 'PICSARTGOLD3BLN-S1', 'PicsArt Gold [ 3 Bulan ]', 'PicsArt Pro', 0, 8750, 8750, 8750, 8750, 0, 0, 0, 'picsart_pro.png', '', 1, '2023-10-08', 4, 1),
(40664, 'pubgmglobal', 'PUBGMGLOBAL60-S11', '60 UC (60 + 0)', 'PUBGM GLOBAL', 0, 12944, 12944, 12944, 12944, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40665, 'pubgmglobal', 'PUBGMGLOBAL120-S11', '120 UC (120 + 0)', 'PUBGM GLOBAL', 0, 25889, 25889, 25889, 25889, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40666, 'pubgmglobal', 'PUBGMGLOBAL180-S11', '180 UC (180 + 0)', 'PUBGM GLOBAL', 0, 38833, 38833, 38833, 38833, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40667, 'pubgmglobal', 'PUBGMGLOBAL240-S11', '240 UC (240 + 0)', 'PUBGM GLOBAL', 0, 51777, 51777, 51777, 51777, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40668, 'pubgmglobal', 'PUBGMGLOBAL325-S11', '325 UC (300 + 25)', 'PUBGM GLOBAL', 0, 65244, 65244, 65244, 65244, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40669, 'pubgmglobal', 'PUBGMGLOBAL385-S11', '385 UC (360 + 25)', 'PUBGM GLOBAL', 0, 78189, 78189, 78189, 78189, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40670, 'pubgmglobal', 'PUBGMGLOBAL445-S11', '445 UC (420 + 25)', 'PUBGM GLOBAL', 0, 91133, 91133, 91133, 91133, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40671, 'pubgmglobal', 'PUBGMGLOBAL505-S11', '505 UC (480 + 25)', 'PUBGM GLOBAL', 0, 104077, 104077, 104077, 104077, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40672, 'pubgmglobal', 'PUBGMGLOBAL650-S11', '650 UC (600 + 50)', 'PUBGM GLOBAL', 0, 130489, 130489, 130489, 130489, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40673, 'pubgmglobal', 'PUBGMGLOBAL660-S11', '660 UC (600 + 60)', 'PUBGM GLOBAL', 0, 130619, 130619, 130619, 130619, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40674, 'pubgmglobal', 'PUBGMGLOBAL-720S11', '720 UC (600  + 120)', 'PUBGM GLOBAL', 0, 143564, 143564, 143564, 143564, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40675, 'pubgmglobal', 'PUBGMGLOBAL975-S11', '975 UC (900 + 75)', 'PUBGM GLOBAL', 0, 195733, 195733, 195733, 195733, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40676, 'pubgmglobal', 'PUBGMGLOBAL985-S11', '985 UC (900 +  85)', 'PUBGM GLOBAL', 0, 195864, 195864, 195864, 195864, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40677, 'pubgmglobal', 'PUBGMGLOBAL1045-S11', '1045 UC (950 +85)', 'PUBGM GLOBAL', 0, 208808, 208808, 208808, 208808, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40678, 'pubgmglobal', 'PUBGMGLOBAL1320-S11', '1320 UC (1200 + 120)', 'PUBGM GLOBAL', 0, 261239, 261239, 261239, 261239, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40679, 'pubgmglobal', 'PUBGMGLOBAL1800-S11', '1800 UC (1500 + 300)', 'PUBGM GLOBAL', 0, 326744, 326744, 326744, 326744, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40680, 'pubgmglobal', 'PUBGMGLOBAL1860-S11', '1860 UC (1560 + 300)', 'PUBGM GLOBAL', 0, 339689, 339689, 339689, 339689, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40681, 'pubgmglobal', 'PUBGMGLOBAL2125-S11', '2125 UC (1800 + 325)', 'PUBGM GLOBAL', 0, 391989, 391989, 391989, 391989, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40682, 'pubgmglobal', 'PUBGMGLOBAL2460-S11', '2460 UC (2100 + 360)', 'PUBGM GLOBAL', 0, 457364, 457364, 457364, 457364, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40683, 'pubgmglobal', 'PUBGMGLOBAL2785-S11', '2785 UC (2400 + 385)', 'PUBGM GLOBAL', 0, 522608, 522608, 522608, 522608, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40684, 'pubgmglobal', 'PUBGMGLOBALPRM3850-S14', '3850 UC PROMO (3000 + 850)', 'PUBGM GLOBAL', 0, 634980, 634980, 634980, 634980, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40685, 'pubgmglobal', 'PUBGMGLOBAL3850-S11', '3850 UC (3000 + 850)', 'PUBGM GLOBAL', 0, 653619, 653619, 653619, 653619, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40686, 'pubgmglobal', 'PUBGMGLOBAL3925-S11', '3925 UC (3300 + 625)', 'PUBGM GLOBAL', 0, 718733, 718733, 718733, 718733, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40687, 'pubgmglobal', 'PUBGMGLOBAL4500-S11', '4500 UC (3600 + 900)', 'PUBGM GLOBAL', 0, 784108, 784108, 784108, 784108, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40688, 'pubgmglobal', 'PUBGMGLOBAL5650-S11', '5650 UC (4500 + 1150)', 'PUBGM GLOBAL', 0, 980364, 980364, 980364, 980364, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40689, 'pubgmglobal', 'PUBGMGLOBAL6310-S11', '6310 UC (5100 + 1210)', 'PUBGM GLOBAL', 0, 1110983, 1110983, 1110983, 1110983, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40690, 'pubgmglobal', 'PUBGMGLOBALPRM8100-S14', '8100 UC PROMO (6000 + 2100)', 'PUBGM GLOBAL', 0, 1277000, 1277000, 1277000, 1277000, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40691, 'pubgmglobal', 'PUBGMGLOBAL8100-S11', '8100 UC (6000 + 2100)', 'PUBGM GLOBAL', 0, 1307369, 1307369, 1307369, 1307369, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40692, 'pubgmglobal', 'PUBGMGLOBALPRM11950-S14', '11950 UC PROMO (9000 + 2950)', 'PUBGM GLOBAL', 0, 1863000, 1863000, 1863000, 1863000, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-10-08', 4, 1),
(40693, 'pubgmindoa', 'UCPUBGM30-S50A', '30 UC', 'PUBGM INDO A', 0, 5735, 5964, 5907, 5907, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40694, 'pubgmindoa', 'UCPUBGM60-S50A', '60 UC', 'PUBGM INDO A', 0, 11471, 11930, 11815, 11815, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40695, 'pubgmindoa', 'UCPUBGM300_25-S50A', '300 + 25 UC', 'PUBGM INDO A', 0, 57096, 59380, 58809, 58809, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40696, 'pubgmindoa', 'UCPUBGM300_25-S1000', '300 + 25 UC', 'PUBGM INDO A', 0, 62666, 65173, 64546, 64546, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40697, 'pubgmindoa', 'UCPUBGM360_25-S50A', '360 + 25 UC', 'PUBGM INDO A', 0, 68566, 71309, 70623, 70623, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40698, 'pubgmindoa', 'UCPUBGM600_60-S50A', '600 + 60 UC', 'PUBGM INDO A', 0, 114193, 118761, 117619, 117619, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40699, 'pubgmindoa', 'UCPUBGM600_60-S1000', '600 + 60 UC', 'PUBGM INDO A', 0, 125332, 130345, 129092, 129092, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40700, 'pubgmindoa', 'UCPUBGM660_60-S50A', '660 + 60 UC', 'PUBGM INDO A', 0, 125535, 130556, 129301, 129301, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40701, 'pubgmindoa', 'RPPUBGM-S50', 'Upgrade RP', 'PUBGM INDO A', 0, 137005, 142485, 141115, 141115, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40702, 'pubgmindoa', 'UCPUBGM900_75-S50A', '900 + 75 UC', 'PUBGM INDO A', 0, 171288, 178140, 176427, 176427, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40703, 'pubgmindoa', 'UCPUBGM1500_300-S50A', '1500 + 300 UC', 'PUBGM INDO A', 0, 285481, 296900, 294045, 294045, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40704, 'pubgmindoa', 'UCPUBGM1500_300-S1000', '1500 + 300 UC', 'PUBGM INDO A', 0, 313331, 325864, 322731, 322731, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40705, 'pubgmindoa', 'UCPUBGM1800_325-S50A', '1800 + 325 UC', 'PUBGM INDO A', 0, 342577, 356280, 352854, 352854, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40706, 'pubgmindoa', 'RPELPUBGM-S50', 'Upgrade Elite RP', 'PUBGM INDO A', 0, 349841, 363835, 360336, 360336, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40707, 'pubgmindoa', 'UCPUBGM2100_360-S50A', '2100 + 360 UC', 'PUBGM INDO A', 0, 399672, 415659, 411662, 411662, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40708, 'pubgmindoa', 'UCPUBGM3000_850-S50A', '3000 + 850 UC', 'PUBGM INDO A', 0, 570834, 593667, 587959, 587959, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40709, 'pubgmindoa', 'UCPUBGM3000_850-S1000', '3000 + 850 UC', 'PUBGM INDO A', 0, 626661, 651727, 645461, 645461, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40710, 'pubgmindoa', 'UCPUBGM6000_2100-S50A', '6000 + 2100 UC', 'PUBGM INDO A', 0, 1141795, 1187467, 1176049, 1176049, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40711, 'pubgmindoa', 'UCPUBGM6000_2100-S1000', '6000 + 2100 UC', 'PUBGM INDO A', 0, 1253322, 1303455, 1290922, 1290922, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40712, 'pubgmindoa', 'UCPUBGM9000_2950-S50A', '9000 + 2950 UC', 'PUBGM INDO A', 0, 1712628, 1781133, 1764007, 1764007, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40713, 'pubgmindoa', 'UCPUBGM12000_4200-S50A', '12000 + 4200 UC', 'PUBGM INDO A', 0, 2283462, 2374800, 2351966, 2351966, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40714, 'pubgmindoa', 'UCPUBGM18000_6300-S50A', '18000 + 6300 UC', 'PUBGM INDO A', 0, 3425257, 3562267, 3528015, 3528015, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40715, 'pubgmindoa', 'UCPUBGM24000_8400-S50A', '24000 + 8400 UC', 'PUBGM INDO A', 0, 4566923, 4749600, 4703931, 4703931, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40716, 'pubgmindoa', 'UCPUBGM30000_10500-S50A', '30000 + 10500 UC', 'PUBGM INDO A', 0, 5708717, 5937066, 5879979, 5879979, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40717, 'pubgmindoa', 'UCPUBGM36000_12600-S50A', '36000 + 12600 UC', 'PUBGM INDO A', 0, 6850512, 7124532, 7056027, 7056027, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40718, 'pubgmindoa', 'UCPUBGM42000_14700-S50A', '42000 + 14700 UC', 'PUBGM INDO A', 0, 7992179, 8311866, 8231944, 8231944, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40719, 'pubgmindoa', 'UCPUBGM48000_16800-S50A', '48000 + 16800 UC', 'PUBGM INDO A', 0, 9133974, 9499333, 9407993, 9407993, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40720, 'pubgmindoa', 'UCPUBGM54000_18900-S50A', '54000 + 18900 UC', 'PUBGM INDO A', 0, 10275641, 10686667, 10583910, 10583910, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40721, 'pubgmindoa', 'UCPUBGM60000_21000-S50A', '60000 + 21000 UC', 'PUBGM INDO A', 0, 11417436, 11874133, 11759959, 11759959, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-10-08', 4, 1),
(40722, 'ragnarokmeternallove', 'ROM6-S50', '6 BCC', 'Ragnarok M Eternal Love', 0, 12363, 12363, 12363, 12363, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-10-08', 4, 1),
(40723, 'ragnarokmeternallove', 'ROM12-S50', '12 BCC', 'Ragnarok M Eternal Love', 0, 24724, 24724, 24724, 24724, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-10-08', 4, 1),
(40724, 'ragnarokmeternallove', 'ROM18-S50', '18 BCC', 'Ragnarok M Eternal Love', 0, 37087, 37087, 37087, 37087, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-10-08', 4, 1),
(40725, 'ragnarokmeternallove', 'ROM24-S50', '24 BCC', 'Ragnarok M Eternal Love', 0, 49450, 49450, 49450, 49450, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-10-08', 4, 1),
(40726, 'ragnarokmeternallove', 'ROM30-S50', '36 BCC (S)', 'Ragnarok M Eternal Love', 0, 62704, 62704, 62704, 62704, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-10-08', 4, 1),
(40727, 'ragnarokmeternallove', 'ROMPREMI-S50', 'Premium', 'Ragnarok M Eternal Love', 0, 98899, 98899, 98899, 98899, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-10-08', 4, 1),
(40728, 'ragnarokmeternallove', 'ROM72-S50', '72 BCC', 'Ragnarok M Eternal Love', 0, 125662, 125662, 125662, 125662, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-10-08', 4, 1),
(40729, 'ragnarokmeternallove', 'ROM90-S50', '90 BCC', 'Ragnarok M Eternal Love', 0, 162494, 162494, 162494, 162494, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-10-08', 4, 1),
(40730, 'ragnarokmeternallove', 'ROM120-S50', '145 BCC (M)', 'Ragnarok M Eternal Love', 0, 249541, 249541, 249541, 249541, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-10-08', 4, 1),
(40731, 'ragnarokmeternallove', 'ROM300-S27', '373 BCC (L)', 'Ragnarok M Eternal Love', 0, 576030, 576030, 576030, 576030, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-10-08', 4, 1),
(40732, 'ragnarokmeternallove', 'ROM298-S50', '373 BCC (L)', 'Ragnarok M Eternal Love', 0, 629331, 629331, 629331, 629331, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-10-08', 4, 1),
(40733, 'ragnarokmeternallove', 'ROM598-S50', '748 BCC (XL)', 'Ragnarok M Eternal Love', 0, 1256497, 1256497, 1256497, 1256497, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-10-08', 4, 1),
(40734, 'ragnarokmeternallove', 'ROM929-S50', '929 BCC (S-M-XL)', 'Ragnarok M Eternal Love', 0, 1568740, 1568740, 1568740, 1568740, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-10-08', 4, 1),
(40735, 'ragnarokmeternallove', 'ROM1496-S50', '1496 BCC', 'Ragnarok M Eternal Love', 0, 2245482, 2245482, 2245482, 2245482, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-10-08', 4, 1),
(40736, 'ragnarokmeternallove', 'ROMALLBCC-S50', 'All Pack BCC', 'Ragnarok M Eternal Love', 0, 2348459, 2348459, 2348459, 2348459, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-10-08', 4, 1),
(40737, 'ragnarokorigin', 'ROOGLOBAL40-S78', '40 Nyan Berry', 'Ragnarok Origin', 0, 11888, 11888, 11888, 11888, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-10-08', 4, 1),
(40738, 'ragnarokorigin', 'ROOGLOBAL125-S78', '125 Nyan Berry', 'Ragnarok Origin', 0, 36456, 36456, 36456, 36456, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-10-08', 4, 1),
(40739, 'ragnarokorigin', 'ROOGLOBAL210-S78', '210 Nyan Berry', 'Ragnarok Origin', 0, 59439, 59439, 59439, 59439, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-10-08', 4, 1),
(40740, 'ragnarokorigin', 'ROOGLOBAL430-S78', '430 Nyan Berry', 'Ragnarok Origin', 0, 119671, 119671, 119671, 119671, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-10-08', 4, 1),
(40741, 'ragnarokorigin', 'ROOGLOBAL900-S78', '900 Nyan Berry', 'Ragnarok Origin', 0, 247267, 247267, 247267, 247267, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-10-08', 4, 1),
(40742, 'ragnarokorigin', 'ROOGLOBAL1025-S78', '1025 Nyan Berry', 'Ragnarok Origin', 0, 283723, 283723, 283723, 283723, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-10-08', 4, 1),
(40743, 'ragnarokorigin', 'ROOGLOBAL2300-S78', '2300 Nyan Berry', 'Ragnarok Origin', 0, 601525, 601525, 601525, 601525, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-10-08', 4, 1),
(40744, 'ragnarokorigin', 'ROOGLOBAL4800-S78', '4800 Nyan Berry', 'Ragnarok Origin', 0, 1187550, 1187550, 1187550, 1187550, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-10-08', 4, 1),
(40745, 'ragnarokorigin', 'ROOGLOBAL4800-S46', '4800 Nyan Berry', 'Ragnarok Origin', 0, 1263675, 1263675, 1263675, 1263675, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-10-08', 4, 1),
(40746, 'ragnarokorigin', 'ROOGLOBAL24000-S78', '4800 Nyan Berry x 5', 'Ragnarok Origin', 0, 5937750, 5937750, 5937750, 5937750, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-10-08', 4, 1),
(40747, 'ragnarokorigin', 'ROOGLOBAL24000-S46', '4800 Nyan Berry x 5', 'Ragnarok Origin', 0, 6318375, 6318375, 6318375, 6318375, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-10-08', 4, 1),
(40748, 'ragnarokorigin', 'ROOGLOBAL48000-S78', '4800 Nyan Berry x 10', 'Ragnarok Origin', 0, 11875500, 11875500, 11875500, 11875500, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-10-08', 4, 1),
(40749, 'ragnarokorigin', 'ROOGLOBAL48000-S46', '4800 Nyan Berry x 10', 'Ragnarok Origin', 0, 12636750, 12636750, 12636750, 12636750, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-10-08', 4, 1),
(40750, 'ragnarokorigin', 'ROOGLOBAL72000-S78', '4800 Nyan Berry x 15', 'Ragnarok Origin', 0, 17813250, 17813250, 17813250, 17813250, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-10-08', 4, 1),
(40751, 'ragnarokorigin', 'ROOGLOBAL76800-S78', '76800 Nyan Berry', 'Ragnarok Origin', 0, 18979688, 18979688, 18979688, 18979688, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-10-08', 4, 1),
(40752, 'ragnarokorigin', 'ROOGLOBAL96000-S78', '4800 Nyan Berry x 20', 'Ragnarok Origin', 0, 23751000, 23751000, 23751000, 23751000, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-10-08', 4, 1),
(40753, 'ragnarokorigin', 'ROOGLOBAL120000-S78', '4800 Nyan Berry x 25', 'Ragnarok Origin', 0, 29688750, 29688750, 29688750, 29688750, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-10-08', 4, 1),
(40754, 'ragnarokorigin', 'ROOGLOBAL144000-S78', '4800 Nyan Berry x 30', 'Ragnarok Origin', 0, 35626500, 35626500, 35626500, 35626500, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-10-08', 4, 1),
(40755, 'ragnarokorigin', 'ROOGLOBAL168000-S78', '4800 Nyan Berry x 35', 'Ragnarok Origin', 0, 41564250, 41564250, 41564250, 41564250, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-10-08', 4, 1),
(40756, 'ragnarokorigin', 'ROOGLOBAL216000-S78', '4800 Nyan Berry x 45', 'Ragnarok Origin', 0, 53439750, 53439750, 53439750, 53439750, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-10-08', 4, 1),
(40757, 'ragnarokorigin', 'ROOGLOBAL240000-S78', '4800 Nyan Berry x 50', 'Ragnarok Origin', 0, 59377500, 59377500, 59377500, 59377500, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-10-08', 4, 1),
(40758, 'ragnarokorigin', 'ROOGLOBAL480000-S78', '4800 Nyan Berry x 100', 'Ragnarok Origin', 0, 118755000, 118755000, 118755000, 118755000, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-10-08', 4, 1),
(40759, 'ragnarokxnextgeneration', 'ROXID2230-S14', '2230 Diamonds', 'RagnaroK X Next Generation', 0, 55616, 57841, 57284, 57284, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-10-08', 4, 1),
(40760, 'ragnarokxnextgeneration', 'ROXIDSPPCK1-S50', 'Razer Rogue Backpack', 'RagnaroK X Next Generation', 0, 121202, 126050, 124838, 124838, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-10-08', 4, 1),
(40761, 'ragnarokxnextgeneration', 'ROXID5630-S20', '5630 Diamonds', 'RagnaroK X Next Generation', 0, 133242, 138572, 137239, 137239, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-10-08', 4, 1),
(40762, 'ragnarokxnextgeneration', 'ROXID5630-S14', '5630 Diamonds', 'RagnaroK X Next Generation', 0, 139041, 144603, 143212, 143212, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-10-08', 4, 1),
(40763, 'ragnarokxnextgeneration', 'ROXIDVIPKAFRA-S50', 'VIP - Kafra', 'RagnaroK X Next Generation', 0, 172563, 179466, 177740, 177740, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-10-08', 4, 1),
(40764, 'ragnarokxnextgeneration', 'ROXIDSPPCK2-S50', 'Razer Kraken Kitty - Black', 'RagnaroK X Next Generation', 0, 180720, 187949, 186142, 186142, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-10-08', 4, 1),
(40765, 'ragnarokxnextgeneration', 'ROXIDSPPCK3-S50', 'Razer Kraken Kitty - Pink', 'RagnaroK X Next Generation', 0, 180720, 187949, 186142, 186142, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-10-08', 4, 1),
(40766, 'ragnarokxnextgeneration', 'ROXID9010-S14', '9010 DIamonds', 'RagnaroK X Next Generation', 0, 222466, 231365, 229140, 229140, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-10-08', 4, 1),
(40767, 'ragnarokxnextgeneration', 'ROXID11260-S20', '11260 Diamonds', 'RagnaroK X Next Generation', 0, 266484, 277143, 274479, 274479, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-10-08', 4, 1),
(40768, 'ragnarokxnextgeneration', 'ROXID11270-S14', '11270 Diamonds', 'RagnaroK X Next Generation', 0, 278082, 289205, 286424, 286424, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-10-08', 4, 1),
(40769, 'ragnarokxnextgeneration', 'ROXIDVIPKAFRA2-S50', 'VIP - Kafra Telling', 'RagnaroK X Next Generation', 0, 293382, 305117, 302183, 302183, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-10-08', 4, 1),
(40770, 'ragnarokxnextgeneration', 'ROXID16890-S20', '16890 Diamonds', 'RagnaroK X Next Generation', 0, 399726, 415715, 411718, 411718, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-10-08', 4, 1),
(40771, 'ragnarokxnextgeneration', 'ROXIDVIPKAFRA3-S50', 'VIP - Kafra Clarice', 'RagnaroK X Next Generation', 0, 476268, 495319, 490556, 490556, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-10-08', 4, 1),
(40772, 'ragnarokxnextgeneration', 'ROXID22520-S20', '22520 Diamonds', 'RagnaroK X Next Generation', 0, 532968, 554287, 548957, 548957, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-10-08', 4, 1),
(40773, 'ragnarokxnextgeneration', 'ROXID28150-S20', '28150 Diamonds', 'RagnaroK X Next Generation', 0, 666210, 692858, 686196, 686196, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-10-08', 4, 1),
(40774, 'ragnarokxnextgeneration', 'ROXID33780-S20', '33780 Diamonds', 'RagnaroK X Next Generation', 0, 799453, 831431, 823437, 823437, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-10-08', 4, 1),
(40775, 'ragnarokxnextgeneration', 'ROXID39410-S20', '39410 Diamonds', 'RagnaroK X Next Generation', 0, 932696, 970004, 960677, 960677, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-10-08', 4, 1),
(40776, 'ragnarokxnextgeneration', 'ROXID45040-S20', '45040 Diamonds', 'RagnaroK X Next Generation', 0, 1065938, 1108576, 1097916, 1097916, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-10-08', 4, 1),
(40777, 'ragnarokxnextgeneration', 'ROXID50670-S80', '50670 Diamonds', 'RagnaroK X Next Generation', 0, 1198837, 1246790, 1234802, 1234802, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-10-08', 4, 1),
(40778, 'ragnarokxnextgeneration', 'ROXID101340-S80', '101340 Diamonds', 'RagnaroK X Next Generation', 0, 2397674, 2493581, 2469604, 2469604, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-10-08', 4, 1),
(40779, 'ragnarokxnextgeneration', 'ROXID152010-S80', '152010 Diamonds', 'RagnaroK X Next Generation', 0, 3596511, 3740371, 3704406, 3704406, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-10-08', 4, 1),
(40780, 'ragnarokxnextgeneration', 'ROXID202680-S80', '202680 Diamonds', 'RagnaroK X Next Generation', 0, 4795348, 4987162, 4939208, 4939208, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-10-08', 4, 1),
(40781, 'ragnarokxnextgeneration', 'ROXID231990-S14', '231990 Diamonds', 'RagnaroK X Next Generation', 0, 5414619, 5631204, 5577058, 5577058, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-10-08', 4, 1),
(40782, 'ragnarokxnextgeneration', 'ROXID253350-S80', '253350 Diamonds', 'RagnaroK X Next Generation', 0, 5994185, 6233952, 6174011, 6174011, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-10-08', 4, 1),
(40783, 'revelationinfinitejourney', 'RVLNM40-S81', '40 + 6 Bonus', 'Revelation Infinite Journey', 0, 8546, 8546, 8546, 8546, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40784, 'revelationinfinitejourney', 'RVLNMKB7-S81', 'Kartu Bulanan 7 Hari', 'Revelation Infinite Journey', 0, 8546, 8546, 8546, 8546, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40785, 'revelationinfinitejourney', 'RVLNMPP-S81', 'Newbie Pack', 'Revelation Infinite Journey', 0, 8546, 8546, 8546, 8546, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40786, 'revelationinfinitejourney', 'RVLNMP1TP-S81', 'Webpay Gift - Newbie', 'Revelation Infinite Journey', 0, 8546, 8546, 8546, 8546, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40787, 'revelationinfinitejourney', 'RVLNMBSC-S81M', 'Paket Cloudsong (Basic)', 'Revelation Infinite Journey', 0, 10256, 10256, 10256, 10256, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40788, 'revelationinfinitejourney', 'RVLNM110-S81', '110 + 17 Bonus', 'Revelation Infinite Journey', 0, 21366, 21366, 21366, 21366, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40789, 'revelationinfinitejourney', 'RVLNMSP30GEP-S26', 'Gear Enhancing Pack', 'Revelation Infinite Journey', 0, 25464, 25464, 25464, 25464, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40790, 'revelationinfinitejourney', 'RVLNM230-S81', '230 + 35 Bonus', 'Revelation Infinite Journey', 0, 42732, 42732, 42732, 42732, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40791, 'revelationinfinitejourney', 'RVLNMSAMA5-S81M', 'Diskon Harga SAMA V', 'Revelation Infinite Journey', 0, 50423, 50423, 50423, 50423, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40792, 'revelationinfinitejourney', 'RVLNMINT-S81M', 'Paket Cloudsong (Intermediate / Mid)', 'Revelation Infinite Journey', 0, 50423, 50423, 50423, 50423, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40793, 'revelationinfinitejourney', 'RVLNMSAMA1-S81M', 'Diskon Harga SAMA I', 'Revelation Infinite Journey', 0, 50423, 50423, 50423, 50423, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40794, 'revelationinfinitejourney', 'RVLNMSAMA2-S81M', 'Diskon Harga SAMA II', 'Revelation Infinite Journey', 0, 50423, 50423, 50423, 50423, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40795, 'revelationinfinitejourney', 'RVLNMSAMA3-S81M', 'Diskon Harga SAMA III', 'Revelation Infinite Journey', 0, 50423, 50423, 50423, 50423, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40796, 'revelationinfinitejourney', 'RVLNMSAMA4-S81M', 'Diskon Harga SAMA IV', 'Revelation Infinite Journey', 0, 50423, 50423, 50423, 50423, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40797, 'revelationinfinitejourney', 'RVLNMKBK-S81', 'Kartu Bulanan Klasik', 'Revelation Infinite Journey', 0, 55551, 55551, 55551, 55551, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40798, 'revelationinfinitejourney', 'RVLNMBPC-S81', 'Battle Pass Classic', 'Revelation Infinite Journey', 0, 55551, 55551, 55551, 55551, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40799, 'revelationinfinitejourney', 'RVLNMPD-S81', 'Paket Diskon', 'Revelation Infinite Journey', 0, 55551, 55551, 55551, 55551, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40800, 'revelationinfinitejourney', 'RVLNMSP30FBP-S26', 'Familiars Bracing Pack', 'Revelation Infinite Journey', 0, 74508, 74508, 74508, 74508, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40801, 'revelationinfinitejourney', 'RVLNM460-S81', '460 + 69 Bonus', 'Revelation Infinite Journey', 0, 85463, 85463, 85463, 85463, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40802, 'revelationinfinitejourney', 'RVLNMKBS-S81', 'Kartu Bulanan Superior', 'Revelation Infinite Journey', 0, 111102, 111102, 111102, 111102, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40803, 'revelationinfinitejourney', 'RVLNMGF-S81', 'Growth Fund', 'Revelation Infinite Journey', 0, 111102, 111102, 111102, 111102, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40804, 'revelationinfinitejourney', 'RVLNMBPS-S81', 'Battle Pass Spesial', 'Revelation Infinite Journey', 0, 111102, 111102, 111102, 111102, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40805, 'revelationinfinitejourney', 'RVLNMPS-S81', 'Paket Spesial', 'Revelation Infinite Journey', 0, 111102, 111102, 111102, 111102, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40806, 'revelationinfinitejourney', 'RVLNMSP30NPP-S26', 'Newbie Promotional Pack', 'Revelation Infinite Journey', 0, 149016, 149016, 149016, 149016, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40807, 'revelationinfinitejourney', 'RVLNM920-S81', '920 + 138 Bonus', 'Revelation Infinite Journey', 0, 170926, 170926, 170926, 170926, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40808, 'revelationinfinitejourney', 'RVLNM1150-S81', '1150 + 173 Bonus', 'Revelation Infinite Journey', 0, 213658, 213658, 213658, 213658, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40809, 'revelationinfinitejourney', 'RVLNMPRMS-S81M', 'Hadiah Dream PREMIERE S', 'Revelation Infinite Journey', 0, 221349, 221349, 221349, 221349, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40810, 'revelationinfinitejourney', 'RVLNM1380-S81', '1380 + 207 Bonus', 'Revelation Infinite Journey', 0, 256389, 256389, 256389, 256389, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40811, 'revelationinfinitejourney', 'RVLNM1610-S81', '1610 + 242 Bonus', 'Revelation Infinite Journey', 0, 299121, 299121, 299121, 299121, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40812, 'revelationinfinitejourney', 'RVLNMDGC-S81M', 'Daily Gift Combo (7 Days)', 'Revelation Infinite Journey', 0, 384584, 384584, 384584, 384584, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40813, 'revelationinfinitejourney', 'RVLNM2300-S81', '2300 + 345 Bonus', 'Revelation Infinite Journey', 0, 427315, 427315, 427315, 427315, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40814, 'revelationinfinitejourney', 'RVLNMDVN-S81M', 'Paket Cloudsong (Divine / Level God)', 'Revelation Infinite Journey', 0, 546963, 546963, 546963, 546963, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40815, 'revelationinfinitejourney', 'RVLNM3220-S81', '3220 + 483 Bonus', 'Revelation Infinite Journey', 0, 598241, 598241, 598241, 598241, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40816, 'revelationinfinitejourney', 'RVLNM4600-S81', '4600 + 690 Bonus', 'Revelation Infinite Journey', 0, 854630, 854630, 854630, 854630, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40817, 'revelationinfinitejourney', 'RVLNMPRML-S81M', 'Hadiah Dream PREMIERE L', 'Revelation Infinite Journey', 0, 1083671, 1083671, 1083671, 1083671, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40818, 'revelationinfinitejourney', 'RVLNMSP30FSP-S26', 'Familiars Strengthen Pack', 'Revelation Infinite Journey', 0, 1216648, 1216648, 1216648, 1216648, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40819, 'revelationinfinitejourney', 'RVLNM9200-S81', '9200 + 1380 Bonus', 'Revelation Infinite Journey', 0, 1709260, 1709260, 1709260, 1709260, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40820, 'revelationinfinitejourney', 'RVLNM23000-S81', '23000 + 3450 Bonus', 'Revelation Infinite Journey', 0, 4273150, 4273150, 4273150, 4273150, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40821, 'revelationinfinitejourney', 'RVLNM115000-S81', '23000 + 3450 Bonus x 5', 'Revelation Infinite Journey', 0, 21365750, 21365750, 21365750, 21365750, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40822, 'revelationinfinitejourney', 'RVLNM230000-S81', '23000 + 3450 Bonus x 10', 'Revelation Infinite Journey', 0, 42731500, 42731500, 42731500, 42731500, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40823, 'revelationinfinitejourney', 'RVLNM575000-S81', '23000 + 3450 Bonus x 25', 'Revelation Infinite Journey', 0, 106828750, 106828750, 106828750, 106828750, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-10-08', 4, 1),
(40824, 'sausageman', 'SM60-S50', '60 Candy', 'Sausage Man', 0, 10906, 11342, 11233, 11233, 0, 0, 0, 'sausage_man.png', '', 1, '2023-10-08', 4, 1),
(40825, 'sausageman', 'SM180-S50', '180 Candy', 'Sausage Man', 0, 33353, 34687, 34354, 34354, 0, 0, 0, 'sausage_man.png', '', 1, '2023-10-08', 4, 1),
(40826, 'sausageman', 'SM316-S50', '316 Candy', 'Sausage Man', 0, 55673, 57900, 57343, 57343, 0, 0, 0, 'sausage_man.png', '', 1, '2023-10-08', 4, 1),
(40827, 'sausageman', 'SM718-S50', '718 Candy', 'Sausage Man', 0, 111601, 116065, 114949, 114949, 0, 0, 0, 'sausage_man.png', '', 1, '2023-10-08', 4, 1),
(40828, 'sausageman', 'SM1368-S50', '1368 Candy', 'Sausage Man', 0, 223454, 232392, 230158, 230158, 0, 0, 0, 'sausage_man.png', '', 1, '2023-10-08', 4, 1),
(40829, 'sausageman', 'SM2118-S50', '2118 Candy', 'Sausage Man', 0, 333280, 346611, 343278, 343278, 0, 0, 0, 'sausage_man.png', '', 1, '2023-10-08', 4, 1),
(40830, 'sausageman', 'SM3548-S50', '3548 Candy', 'Sausage Man', 0, 556861, 579135, 573567, 573567, 0, 0, 0, 'sausage_man.png', '', 1, '2023-10-08', 4, 1),
(40831, 'sausageman', 'SM7048-S50', '7048 Candy', 'Sausage Man', 0, 1116133, 1160778, 1149617, 1149617, 0, 0, 0, 'sausage_man.png', '', 1, '2023-10-08', 4, 1),
(40832, 'steamwalletcode', 'STEAM12-S1000', 'IDR 12.000 STEAM', 'Steam Wallet Code', 0, 12119, 12604, 12483, 12483, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-10-08', 4, 1),
(40833, 'steamwalletcode', 'STEAM45-S22', 'IDR 45.000 SWC', 'Steam Wallet Code', 0, 44762, 46552, 46105, 46105, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-10-08', 4, 1),
(40834, 'steamwalletcode', 'STEAM60-S22', 'IDR 60.000 SWC', 'Steam Wallet Code', 0, 59682, 62069, 61472, 61472, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-10-08', 4, 1),
(40835, 'steamwalletcode', 'STEAM60-S1000', 'IDR 60.000 STEAM', 'Steam Wallet Code', 0, 60596, 63020, 62414, 62414, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-10-08', 4, 1),
(40836, 'steamwalletcode', 'STEAM90-S22', 'IDR 90.000 SWC', 'Steam Wallet Code', 0, 89523, 93104, 92209, 92209, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-10-08', 4, 1),
(40837, 'steamwalletcode', 'STEAM90-S1000', 'IDR 90.000 STEAM', 'Steam Wallet Code', 0, 90893, 94529, 93620, 93620, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-10-08', 4, 1),
(40838, 'steamwalletcode', 'STEAM120-S22', 'IDR 120.000 SWC', 'Steam Wallet Code', 0, 119364, 124139, 122945, 122945, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-10-08', 4, 1),
(40839, 'steamwalletcode', 'STEAM120-S1000', 'IDR 120.000 STEAM', 'Steam Wallet Code', 0, 121191, 126039, 124827, 124827, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-10-08', 4, 1),
(40840, 'steamwalletcode', 'STEAM250-S22', 'IDR 250.000 SWC', 'Steam Wallet Code', 0, 248675, 258622, 256135, 256135, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-10-08', 4, 1),
(40841, 'steamwalletcode', 'STEAM250-S1000', 'IDR 250.000 STEAM', 'Steam Wallet Code', 0, 252481, 262580, 260055, 260055, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-10-08', 4, 1),
(40842, 'steamwalletcode', 'STEAM400-S22', 'IDR 400.000 SWC', 'Steam Wallet Code', 0, 397880, 413795, 409816, 409816, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-10-08', 4, 1),
(40843, 'steamwalletcode', 'STEAM400-S1000', 'IDR 400.000 STEAM', 'Steam Wallet Code', 0, 403909, 420065, 416026, 416026, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-10-08', 4, 1),
(40844, 'steamwalletcode', 'STEAM600-S22', 'IDR 600.000 SWC', 'Steam Wallet Code', 0, 596820, 620693, 614725, 614725, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-10-08', 4, 1),
(40845, 'steamwalletcode', 'STEAM600-S1000', 'IDR 600.000 STEAM', 'Steam Wallet Code', 0, 605955, 630193, 624134, 624134, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-10-08', 4, 1),
(40846, 'supersus', 'SS100-S1', '100 Golden Star', 'Super Sus', 0, 12700, 13208, 13081, 13081, 0, 0, 0, 'super_sus.png', '', 1, '2023-10-08', 4, 1),
(40847, 'supersus', 'SS300-S1', '300 Golden Star', 'Super Sus', 0, 31750, 33020, 32703, 32703, 0, 0, 0, 'super_sus.png', '', 1, '2023-10-08', 4, 1),
(40848, 'supersus', 'SS520-S1', '520 Golden Star', 'Super Sus', 0, 57150, 59436, 58865, 58865, 0, 0, 0, 'super_sus.png', '', 1, '2023-10-08', 4, 1),
(40849, 'supersus', 'SS2180-S1', '2180 Golden Star', 'Super Sus', 0, 222250, 231140, 228918, 228918, 0, 0, 0, 'super_sus.png', '', 1, '2023-10-08', 4, 1),
(40850, 'supersus', 'SS5600-S1', '5600 Golden Star', 'Super Sus', 0, 571500, 594360, 588645, 588645, 0, 0, 0, 'super_sus.png', '', 1, '2023-10-08', 4, 1),
(40851, 'tiktokmusic', 'TIKTOKMUSICADMIN1BLN-S1', 'Admin FamilyPlan [ 1 BULAN ] [ 5 ANGGOTA ]', 'TikTok Music', 0, 13500, 13500, 13500, 13500, 0, 0, 0, 'tiktok_music.png', '', 1, '2023-10-08', 4, 1),
(40852, 'tomandjerrychase', 'TJ60-S1', '60 Diamonds', 'Tom and Jerry Chase', 0, 14359, 14933, 14790, 14790, 0, 0, 0, 'tom_and_jerry_chase.png', '', 1, '2023-10-08', 4, 1),
(40853, 'tomandjerrychase', 'TJ180-S1', '180 Diamonds', 'Tom and Jerry Chase', 0, 40258, 41868, 41466, 41466, 0, 0, 0, 'tom_and_jerry_chase.png', '', 1, '2023-10-08', 4, 1);
INSERT INTO `tb_produk` (`cuid`, `slug`, `code`, `title`, `kategori`, `subkategori`, `harga_modal`, `harga_jual`, `harga_reseller`, `harga_h2h`, `harga_coret`, `komisi`, `poin`, `image`, `currency`, `status`, `created_date`, `jenis`, `product_type`) VALUES
(40854, 'tomandjerrychase', 'TJ300-S1', '300 Diamonds', 'Tom and Jerry Chase', 0, 66156, 68802, 68141, 68141, 0, 0, 0, 'tom_and_jerry_chase.png', '', 1, '2023-10-08', 4, 1),
(40855, 'tomandjerrychase', 'TJ600-S1', '600 Diamonds', 'Tom and Jerry Chase', 0, 135218, 140627, 139275, 139275, 0, 0, 0, 'tom_and_jerry_chase.png', '', 1, '2023-10-08', 4, 1),
(40856, 'tomandjerrychase', 'TJ1200-S1', '1200 Diamonds', 'Tom and Jerry Chase', 0, 273343, 284277, 281543, 281543, 0, 0, 0, 'tom_and_jerry_chase.png', '', 1, '2023-10-08', 4, 1),
(40857, 'tomandjerrychase', 'TJ1800-S1', '1800 Diamonds', 'Tom and Jerry Chase', 0, 417223, 433912, 429740, 429740, 0, 0, 0, 'tom_and_jerry_chase.png', '', 1, '2023-10-08', 4, 1),
(40858, 'tomandjerrychase', 'TJ3000-S1', '3000 Diamonds', 'Tom and Jerry Chase', 0, 690594, 718218, 711312, 711312, 0, 0, 0, 'tom_and_jerry_chase.png', '', 1, '2023-10-08', 4, 1),
(40859, 'tomandjerrychase', 'TJ6000-S1', '6000 Diamonds', 'Tom and Jerry Chase', 0, 1352442, 1406540, 1393015, 1393015, 0, 0, 0, 'tom_and_jerry_chase.png', '', 1, '2023-10-08', 4, 1),
(40860, 'toweroffantasy', '60DM-S50', '60 Tanium', 'Tower of Fantasy', 0, 10068, 10471, 10370, 10370, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-10-08', 4, 1),
(40861, 'toweroffantasy', 'TOFRS-S50', 'Rookie Supplies', 'Tower of Fantasy', 0, 10068, 10471, 10370, 10370, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-10-08', 4, 1),
(40862, 'toweroffantasy', '300DM-S50', '300 Tanium + Dark Crystal 20', 'Tower of Fantasy', 0, 51361, 53415, 52902, 52902, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-10-08', 4, 1),
(40863, 'toweroffantasy', 'TOFAP-S50', 'Adventure Pack', 'Tower of Fantasy', 0, 51361, 53415, 52902, 52902, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-10-08', 4, 1),
(40864, 'toweroffantasy', 'TOFMP-S50', 'Monthly Pass', 'Tower of Fantasy', 0, 51361, 53415, 52902, 52902, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-10-08', 4, 1),
(40865, 'toweroffantasy', 'TOFBP-S50', 'Basic Pass', 'Tower of Fantasy', 0, 103232, 107361, 106329, 106329, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-10-08', 4, 1),
(40866, 'toweroffantasy', 'TOFUP-S50', 'Upgrade Pass', 'Tower of Fantasy', 0, 113555, 118097, 116962, 116962, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-10-08', 4, 1),
(40867, 'toweroffantasy', '980DM-S50', '980 Tanium + Dark Crystal 110', 'Tower of Fantasy', 0, 154975, 161174, 159624, 159624, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-10-08', 4, 1),
(40868, 'toweroffantasy', 'TOFCEP-S50', 'Collectors Edition Pass', 'Tower of Fantasy', 0, 206719, 214988, 212921, 212921, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-10-08', 4, 1),
(40869, 'toweroffantasy', '1980DM-S50', '1980 Tanium + Dark Crystal 270', 'Tower of Fantasy', 0, 310205, 322613, 319511, 319511, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-10-08', 4, 1),
(40870, 'toweroffantasy', '3280DM-S50', '3280 Tanium + Dark Crystal 530', 'Tower of Fantasy', 0, 559618, 582003, 576407, 576407, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-10-08', 4, 1),
(40871, 'toweroffantasy', '6480DM-S50', '6480 Tanium + Dark Crystal 1300', 'Tower of Fantasy', 0, 1035249, 1076659, 1066306, 1066306, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-10-08', 4, 1),
(40872, 'toweroffantasy', '9980DM-S50', '9980 Tanium + Dark Crystal 2520', 'Tower of Fantasy', 0, 1552938, 1615056, 1599526, 1599526, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-10-08', 4, 1),
(40873, 'toweroffantasy', '12980DM-S50', '12980 Tanium + Dark Crystal 3520', 'Tower of Fantasy', 0, 2036088, 2117532, 2097171, 2097171, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-10-08', 4, 1),
(40874, 'toweroffantasy', 'TOFALL-S50', 'All Pack Tanium + Dark Crystal', 'Tower of Fantasy', 0, 2121477, 2206336, 2185121, 2185121, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-10-08', 4, 1),
(40875, 'toweroffantasy', '32400DM-S50', '6480 Tanium x 5', 'Tower of Fantasy', 0, 5176500, 5383560, 5331795, 5331795, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-10-08', 4, 1),
(40876, 'toweroffantasy', '64800DM-S50', '6480 Tanium x 10', 'Tower of Fantasy', 0, 10353001, 10767121, 10663591, 10663591, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-10-08', 4, 1),
(40877, 'toweroffantasy', '129600DM-S50', '6480 Tanium x 20', 'Tower of Fantasy', 0, 20706130, 21534375, 21327314, 21327314, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-10-08', 4, 1),
(40878, 'toweroffantasy', '162000DM-S50', '6480 Tanium x 25', 'Tower of Fantasy', 0, 25882630, 26917935, 26659109, 26659109, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-10-08', 4, 1),
(40879, 'toweroffantasy', '324000DM-S50', '6480 Tanium x 50', 'Tower of Fantasy', 0, 51765260, 53835870, 53318218, 53318218, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-10-08', 4, 1),
(40880, 'valorant', 'VAL125-S3', '125 Points', 'Valorant', 0, 14619, 15204, 15058, 15058, 0, 0, 0, 'valorant.png', '', 1, '2023-10-08', 4, 1),
(40881, 'valorant', 'VAL420-S15', '420 Points', 'Valorant', 0, 47486, 49385, 48911, 48911, 0, 0, 0, 'valorant.png', '', 1, '2023-10-08', 4, 1),
(40882, 'valorant', 'VAL420-S3', '420 Points', 'Valorant', 0, 48730, 50679, 50192, 50192, 0, 0, 0, 'valorant.png', '', 1, '2023-10-08', 4, 1),
(40883, 'valorant', 'VAL700-S15', '700 Points', 'Valorant', 0, 75977, 79016, 78256, 78256, 0, 0, 0, 'valorant.png', '', 1, '2023-10-08', 4, 1),
(40884, 'valorant', 'VAL790-S70', '790 Points', 'Valorant', 0, 76053, 79095, 78335, 78335, 0, 0, 0, 'valorant.png', '', 1, '2023-10-08', 4, 1),
(40885, 'valorant', 'VAL700-S3', '700 Points', 'Valorant', 0, 77968, 81087, 80307, 80307, 0, 0, 0, 'valorant.png', '', 1, '2023-10-08', 4, 1),
(40886, 'valorant', 'VAL1375-S15', '1375 Points', 'Valorant', 0, 142457, 148155, 146731, 146731, 0, 0, 0, 'valorant.png', '', 1, '2023-10-08', 4, 1),
(40887, 'valorant', 'VAL1375-S3', '1375 Points', 'Valorant', 0, 146190, 152038, 150576, 150576, 0, 0, 0, 'valorant.png', '', 1, '2023-10-08', 4, 1),
(40888, 'valorant', 'VAL1650-S70', '1650 Points', 'Valorant', 0, 152106, 158190, 156669, 156669, 0, 0, 0, 'valorant.png', '', 1, '2023-10-08', 4, 1),
(40889, 'valorant', 'VAL2400-S15', '2400 Points', 'Valorant', 0, 237429, 246926, 244552, 244552, 0, 0, 0, 'valorant.png', '', 1, '2023-10-08', 4, 1),
(40890, 'valorant', 'VAL2400-S3', '2400 Points', 'Valorant', 0, 243650, 253396, 250960, 250960, 0, 0, 0, 'valorant.png', '', 1, '2023-10-08', 4, 1),
(40891, 'valorant', 'VAL2850-S70', '2850 Points', 'Valorant', 0, 253510, 263650, 261115, 261115, 0, 0, 0, 'valorant.png', '', 1, '2023-10-08', 4, 1),
(40892, 'valorant', 'VAL4000PRM-S5', '4000 Points [PROMO]', 'Valorant', 0, 383680, 399027, 395190, 395190, 0, 0, 0, 'valorant.png', '', 1, '2023-10-08', 4, 1),
(40893, 'valorant', 'VAL4000-S15', '4000 Points', 'Valorant', 0, 379885, 395080, 391282, 391282, 0, 0, 0, 'valorant.png', '', 1, '2023-10-08', 4, 1),
(40894, 'valorant', 'VAL4000-S3', '4000 Points', 'Valorant', 0, 389840, 405434, 401535, 401535, 0, 0, 0, 'valorant.png', '', 1, '2023-10-08', 4, 1),
(40895, 'valorant', 'VAL5800-S70', '5800 Points', 'Valorant', 0, 507020, 527301, 522231, 522231, 0, 0, 0, 'valorant.png', '', 1, '2023-10-08', 4, 1),
(40896, 'valorant', 'VAL8150-S15', '8150 Points', 'Valorant', 0, 759770, 790161, 782563, 782563, 0, 0, 0, 'valorant.png', '', 1, '2023-10-08', 4, 1),
(40897, 'valorant', 'VAL8150-S3', '8150 Points', 'Valorant', 0, 779680, 810867, 803070, 803070, 0, 0, 0, 'valorant.png', '', 1, '2023-10-08', 4, 1),
(40898, 'viupremium', 'VIU1BLN-S1', 'Private 1 Bulan [ AKUN - 1 DEVICES ]', 'Viu Premium', 0, 8000, 8000, 8000, 8000, 0, 0, 0, 'viu_premium.png', '', 1, '2023-10-08', 4, 1),
(40899, 'viupremium', 'VIU3BLN-S1', 'Private 3 Bulan [ AKUN - 1 DEVICES ]', 'Viu Premium', 0, 13000, 13000, 13000, 13000, 0, 0, 0, 'viu_premium.png', '', 1, '2023-10-08', 4, 1),
(40900, 'viupremium', 'VIU6BLN-S1', 'Private 6 Bulan [ AKUN - 1 DEVICES ]', 'Viu Premium', 0, 19000, 19000, 19000, 19000, 0, 0, 0, 'viu_premium.png', '', 1, '2023-10-08', 4, 1),
(40901, 'voucherpbzepetto', 'VCPB1200-S22', '1200 PB Cash', 'Voucher PB Zepetto', 0, 9034, 9034, 9034, 9034, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-10-08', 4, 1),
(40902, 'voucherpbzepetto', 'VCPB1200-S1000', '1200 PB Cash', 'Voucher PB Zepetto', 0, 9135, 9135, 9135, 9135, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-10-08', 4, 1),
(40903, 'voucherpbzepetto', 'VCPB2400-S22', '2400 PB Cash', 'Voucher PB Zepetto', 0, 18067, 18067, 18067, 18067, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-10-08', 4, 1),
(40904, 'voucherpbzepetto', 'VCPB2400-S1000', '2400 PB Cash', 'Voucher PB Zepetto', 0, 18270, 18270, 18270, 18270, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-10-08', 4, 1),
(40905, 'voucherpbzepetto', 'VCPB6000-S22', '6000 PB Cash', 'Voucher PB Zepetto', 0, 45168, 45168, 45168, 45168, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-10-08', 4, 1),
(40906, 'voucherpbzepetto', 'VCPB6000-S1000', '6000 PB Cash', 'Voucher PB Zepetto', 0, 45675, 45675, 45675, 45675, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-10-08', 4, 1),
(40907, 'voucherpbzepetto', 'VCPB12000-S22', '12000 PB Cash', 'Voucher PB Zepetto', 0, 90335, 90335, 90335, 90335, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-10-08', 4, 1),
(40908, 'voucherpbzepetto', 'VCPB12000-S1000', '12000 PB Cash', 'Voucher PB Zepetto', 0, 91350, 91350, 91350, 91350, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-10-08', 4, 1),
(40909, 'voucherpbzepetto', 'VCPB24000-S22', '24000 PB Cash', 'Voucher PB Zepetto', 0, 180670, 180670, 180670, 180670, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-10-08', 4, 1),
(40910, 'voucherpbzepetto', 'VCPB24000-S1000', '24000 PB Cash', 'Voucher PB Zepetto', 0, 182700, 182700, 182700, 182700, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-10-08', 4, 1),
(40911, 'voucherpbzepetto', 'VCPB36000-S22', '36000 PB Cash', 'Voucher PB Zepetto', 0, 271005, 271005, 271005, 271005, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-10-08', 4, 1),
(40912, 'voucherpbzepetto', 'VCPB36000-S1000', '36000 PB Cash', 'Voucher PB Zepetto', 0, 274050, 274050, 274050, 274050, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-10-08', 4, 1),
(40913, 'voucherpbzepetto', 'VCPB60000-S22', '60000 PB Cash', 'Voucher PB Zepetto', 0, 451675, 451675, 451675, 451675, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-10-08', 4, 1),
(40914, 'voucherpbzepetto', 'VCPB60000-S1000', '60000 PB Cash', 'Voucher PB Zepetto', 0, 456750, 456750, 456750, 456750, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-10-08', 4, 1),
(40915, 'voucherpsn', 'VPSNIDR100000-S15', 'PSN IDR 100.000', 'Voucher PSN', 0, 96846, 96846, 96846, 96846, 0, 0, 0, 'voucher_psn.png', '', 1, '2023-10-08', 4, 1),
(40916, 'voucherpsn', 'VPSNIDR300000-S15', 'PSN IDR 300.000', 'Voucher PSN', 0, 290538, 290538, 290538, 290538, 0, 0, 0, 'voucher_psn.png', '', 1, '2023-10-08', 4, 1),
(40917, 'voucherpsn', 'VPSNIDR600000-S15', 'PSN IDR 600.000', 'Voucher PSN', 0, 581075, 581075, 581075, 581075, 0, 0, 0, 'voucher_psn.png', '', 1, '2023-10-08', 4, 1),
(40918, 'voucherpsn', 'VPSNIDR1000000-S15', 'PSN IDR 1.000.000', 'Voucher PSN', 0, 964666, 964666, 964666, 964666, 0, 0, 0, 'voucher_psn.png', '', 1, '2023-10-08', 4, 1),
(40919, 'voucherpsn', 'VPSN1500000IDR-S15', 'PSN IDR 1.500.000', 'Voucher PSN', 0, 1446999, 1446999, 1446999, 1446999, 0, 0, 0, 'voucher_psn.png', '', 1, '2023-10-08', 4, 1),
(40920, 'voucherrazergold', 'RZRGOLD10-S1000', 'Razer Gold 10.000', 'Voucher Razer Gold', 0, 9643, 9643, 9643, 9643, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-10-08', 4, 1),
(40921, 'voucherrazergold', 'RZRGOLD20-S22', 'Razer Gold IDR 20.000', 'Voucher Razer Gold', 0, 18965, 18965, 18965, 18965, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-10-08', 4, 1),
(40922, 'voucherrazergold', 'RZRGOLD20-S1000', 'Razer Gold 20.000', 'Voucher Razer Gold', 0, 19285, 19285, 19285, 19285, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-10-08', 4, 1),
(40923, 'voucherrazergold', 'RZRGOLD50-S22', 'Razer Gold IDR 50.000', 'Voucher Razer Gold', 0, 47414, 47414, 47414, 47414, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-10-08', 4, 1),
(40924, 'voucherrazergold', 'RZRGOLD50-S1000', 'Razer Gold 50.000', 'Voucher Razer Gold', 0, 48213, 48213, 48213, 48213, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-10-08', 4, 1),
(40925, 'voucherrazergold', 'RZRGOLD100-S22', 'Razer Gold IDR 100.000', 'Voucher Razer Gold', 0, 94826, 94826, 94826, 94826, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-10-08', 4, 1),
(40926, 'voucherrazergold', 'RZRGOLD100-S1000', 'Razer Gold 100.000', 'Voucher Razer Gold', 0, 96425, 96425, 96425, 96425, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-10-08', 4, 1),
(40927, 'voucherrazergold', 'RZRGOLD200-S22', 'Razer Gold IDR 200.000', 'Voucher Razer Gold', 0, 189653, 189653, 189653, 189653, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-10-08', 4, 1),
(40928, 'voucherrazergold', 'RZRGOLD200-S1000', 'Razer Gold 200.000', 'Voucher Razer Gold', 0, 192850, 192850, 192850, 192850, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-10-08', 4, 1),
(40929, 'voucherrazergold', 'RZRGOLD500-S22', 'Razer Gold IDR 500.000', 'Voucher Razer Gold', 0, 474132, 474132, 474132, 474132, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-10-08', 4, 1),
(40930, 'voucherrazergold', 'RZRGOLD500-S1000', 'Razer Gold 500.000', 'Voucher Razer Gold', 0, 482125, 482125, 482125, 482125, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-10-08', 4, 1),
(40931, 'voucherrazergold', 'RZRGOLD1000-S22', 'Razer Gold IDR 1.000.000', 'Voucher Razer Gold', 0, 948264, 948264, 948264, 948264, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-10-08', 4, 1),
(40932, 'voucherrazergold', 'RZRGOLD1000-S1000', 'Razer Gold 1.000.000', 'Voucher Razer Gold', 0, 964250, 964250, 964250, 964250, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-10-08', 4, 1),
(40933, 'voucherroblox', 'ROB800-S22', '800 Robux', 'Voucher Roblox', 0, 147622, 147622, 147622, 147622, 0, 0, 0, 'voucher_roblox.png', '', 1, '2023-10-08', 4, 1),
(40934, 'voucherroblox', 'ROB1200-S22', '1200 Robux', 'Voucher Roblox', 0, 241423, 241423, 241423, 241423, 0, 0, 0, 'voucher_roblox.png', '', 1, '2023-10-08', 4, 1),
(40935, 'voucherroblox', 'ROB1700-S22', '1700 Robux', 'Voucher Roblox', 0, 321897, 321897, 321897, 321897, 0, 0, 0, 'voucher_roblox.png', '', 1, '2023-10-08', 4, 1),
(40936, 'voucherroblox', 'ROB2000-S22', '2000 Robux', 'Voucher Roblox', 0, 369054, 369054, 369054, 369054, 0, 0, 0, 'voucher_roblox.png', '', 1, '2023-10-08', 4, 1),
(40937, 'voucherroblox', 'ROB4500-S22', '4500 Robux', 'Voucher Roblox', 0, 738108, 738108, 738108, 738108, 0, 0, 0, 'voucher_roblox.png', '', 1, '2023-10-08', 4, 1),
(40938, 'voucherroblox', 'ROB10000-S22', '10000 Robux', 'Voucher Roblox', 0, 1476216, 1476216, 1476216, 1476216, 0, 0, 0, 'voucher_roblox.png', '', 1, '2023-10-08', 4, 1),
(40939, 'voucherroblox', 'ROB200-S22', 'Roblox (USD) $200', 'Voucher Roblox', 0, 2849917, 2849917, 2849917, 2849917, 0, 0, 0, 'voucher_roblox.png', '', 1, '2023-10-08', 4, 1),
(40940, 'vouchervalorant', 'VRC45-S22', 'Riot Cash 45000', 'Voucher Valorant', 0, 42672, 42672, 42672, 42672, 0, 0, 0, 'voucher_valorant.png', '', 1, '2023-10-08', 4, 1),
(40941, 'vouchervalorant', 'VRC75-S22', 'Riot Cash 75000', 'Voucher Valorant', 0, 71120, 71120, 71120, 71120, 0, 0, 0, 'voucher_valorant.png', '', 1, '2023-10-08', 4, 1),
(40942, 'vouchervalorant', 'VRC149K-S22', 'Riot Cash 149000', 'Voucher Valorant', 0, 141291, 141291, 141291, 141291, 0, 0, 0, 'voucher_valorant.png', '', 1, '2023-10-08', 4, 1),
(40943, 'vouchervalorant', 'VRC219K-S22', 'Riot Cash 219000', 'Voucher Valorant', 0, 207670, 207670, 207670, 207670, 0, 0, 0, 'voucher_valorant.png', '', 1, '2023-10-08', 4, 1),
(40944, 'vouchervalorant', 'VRC359K-S22', 'Riot Cash 359000', 'Voucher Valorant', 0, 340427, 340427, 340427, 340427, 0, 0, 0, 'voucher_valorant.png', '', 1, '2023-10-08', 4, 1),
(40945, 'vouchervalorant', 'VRC739K-S22', 'Riot Cash 739000', 'Voucher Valorant', 0, 700767, 700767, 700767, 700767, 0, 0, 0, 'voucher_valorant.png', '', 1, '2023-10-08', 4, 1),
(40946, 'warpplus', 'WARP12PB-S1', 'Warp+ Key [ Limit 12,09 Petabyte ]', 'Warp Plus', 0, 4500, 4500, 4500, 4500, 0, 0, 0, 'warp_plus.png', '', 1, '2023-10-08', 4, 1),
(100001, 'higgsdomino', '1M', '1M', 'Higgs Domino', 0, 1000, 1010, 1010, 1010, 0, 10, 0, 'higgs_domino.png', '', 1, '2023-10-14', 10, 1),
(40947, 'aceracer', 'ACE65-S17', '60 + 5 Tokens', 'Ace Racer', 0, 11123, 11123, 11123, 11123, 0, 0, 0, 'ace_racer.png', '', 1, '2023-11-01', 4, 1),
(40948, 'aceracer', 'ACE270-S17', '250 + 20 Tokens', 'Ace Racer', 0, 45173, 45173, 45173, 45173, 0, 0, 0, 'ace_racer.png', '', 1, '2023-11-01', 4, 1),
(40949, 'aceracer', 'ACE740-S17', '680 + 60 Tokens', 'Ace Racer', 0, 113273, 113273, 113273, 113273, 0, 0, 0, 'ace_racer.png', '', 1, '2023-11-01', 4, 1),
(40950, 'aceracer', 'ACE1300-S17', '1180 + 120 Tokens', 'Ace Racer', 0, 204073, 204073, 204073, 204073, 0, 0, 0, 'ace_racer.png', '', 1, '2023-11-01', 4, 1),
(40951, 'aceracer', 'ACE3180-S17', '2880 + 300 Tokens', 'Ace Racer', 0, 519830, 519830, 519830, 519830, 0, 0, 0, 'ace_racer.png', '', 1, '2023-11-01', 4, 1),
(40952, 'aceracer', 'ACE6530-S17', '5880 + 650 Tokens', 'Ace Racer', 0, 1019230, 1019230, 1019230, 1019230, 0, 0, 0, 'ace_racer.png', '', 1, '2023-11-01', 4, 1),
(40953, 'amazonprimevideo', 'AMZPRIME1P1U-S1', 'Shared 1 Bulan [ 1 PROFILE - 1 USER ]', 'Amazon Prime Video', 0, 5000, 5000, 5000, 5000, 0, 0, 0, 'amazon_prime_video.png', '', 1, '2023-11-01', 4, 1),
(40954, 'amazonprimevideo', 'AMZPRIME5P-S1', 'Private 1 Bulan [ 1 AKUN - 5 PROFILE ]', 'Amazon Prime Video', 0, 14500, 14500, 14500, 14500, 0, 0, 0, 'amazon_prime_video.png', '', 1, '2023-11-01', 4, 1),
(40955, 'applegiftcard', 'GCTV-S1', 'TV Gift Card [ 2 Bulan ]', 'Apple Gift Card', 0, 13500, 13500, 13500, 13500, 0, 0, 0, 'apple_gift_card.png', '', 1, '2023-11-01', 4, 1),
(40956, 'arenabreakout', 'AB60_6-S50', '60 + 6 Bonds', 'Arena Breakout', 0, 12599, 12599, 12599, 12599, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-11-01', 4, 1),
(40957, 'arenabreakout', 'ABBS-S50', 'Beginners select', 'Arena Breakout', 0, 12599, 12599, 12599, 12599, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-11-01', 4, 1),
(40958, 'arenabreakout', 'ABBSC30-S50', 'Bulletproof safety container (30 days)', 'Arena Breakout', 0, 37661, 37661, 37661, 37661, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-11-01', 4, 1),
(40959, 'arenabreakout', 'AB310_25-S50', '310 + 25 Bonds', 'Arena Breakout', 0, 63535, 63535, 63535, 63535, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-11-01', 4, 1),
(40960, 'arenabreakout', 'ABABP-S50', 'Advanced Battle Pass', 'Arena Breakout', 0, 63535, 63535, 63535, 63535, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-11-01', 4, 1),
(40961, 'arenabreakout', 'ABET30-S50', 'Elite trial (30 days) and 300 points', 'Arena Breakout', 0, 63535, 63535, 63535, 63535, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-11-01', 4, 1),
(40962, 'arenabreakout', 'ABCSC-S50', 'Composite safety container (30 days)', 'Arena Breakout', 0, 113658, 113658, 113658, 113658, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-11-01', 4, 1),
(40963, 'arenabreakout', 'AB630_45-S50', '630 + 45 Bonds', 'Arena Breakout', 0, 126257, 126257, 126257, 126257, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-11-01', 4, 1),
(40964, 'arenabreakout', 'ABPBP-S50', 'Premium Battle Pass', 'Arena Breakout', 0, 195211, 195211, 195211, 195211, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-11-01', 4, 1),
(40965, 'arenabreakout', 'AB1580_110-S50', '1580 + 110 Bonds', 'Arena Breakout', 0, 316050, 316050, 316050, 316050, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-11-01', 4, 1),
(40966, 'arenabreakout', 'AB3200_200-S50', '3200 + 200 Bonds', 'Arena Breakout', 0, 635758, 635758, 635758, 635758, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-11-01', 4, 1),
(40967, 'arenabreakout', 'AB6500_320-S50', '6500 + 320 Bonds', 'Arena Breakout', 0, 1262574, 1262574, 1262574, 1262574, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-11-01', 4, 1),
(40968, 'arenaofvalor', 'AOV40-S58', '40 Vouchers', 'Arena of Valor', 0, 9356, 9730, 9637, 9637, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-11-01', 4, 1),
(40969, 'arenaofvalor', 'AOV40-S1000', '40 Vouchers', 'Arena of Valor', 0, 9744, 10134, 10036, 10036, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-11-01', 4, 1),
(40970, 'arenaofvalor', 'AOV90-S58', '90 Vouchers', 'Arena of Valor', 0, 18713, 19462, 19274, 19274, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-11-01', 4, 1),
(40971, 'arenaofvalor', 'AOV90-S1000', '90 Vouchers', 'Arena of Valor', 0, 19488, 20268, 20073, 20073, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-11-01', 4, 1),
(40972, 'arenaofvalor', 'AOV230-S58', '230 Vouchers', 'Arena of Valor', 0, 46781, 48652, 48184, 48184, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-11-01', 4, 1),
(40973, 'arenaofvalor', 'AOV230-S1000', '230 Vouchers', 'Arena of Valor', 0, 48720, 50669, 50182, 50182, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-11-01', 4, 1),
(40974, 'arenaofvalor', 'AOV470-S58', '470 Vouchers', 'Arena of Valor', 0, 93563, 97306, 96370, 96370, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-11-01', 4, 1),
(40975, 'arenaofvalor', 'AOV470-S1000', '470 Vouchers', 'Arena of Valor', 0, 97440, 101338, 100363, 100363, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-11-01', 4, 1),
(40976, 'arenaofvalor', 'AOV950-S58', '950 Vouchers', 'Arena of Valor', 0, 187126, 194611, 192740, 192740, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-11-01', 4, 1),
(40977, 'arenaofvalor', 'AOV950-S1000', '950 Vouchers', 'Arena of Valor', 0, 194880, 202675, 200726, 200726, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-11-01', 4, 1),
(40978, 'betheking', 'BTK60-S48', '60 Gold', 'Be The King', 0, 12110, 12594, 12473, 12473, 0, 0, 0, 'be_the_king.png', '', 1, '2023-11-01', 4, 1),
(40979, 'betheking', 'BTK60ULT-S48', '60 Ult Tokens', 'Be The King', 0, 12110, 12594, 12473, 12473, 0, 0, 0, 'be_the_king.png', '', 1, '2023-11-01', 4, 1),
(40980, 'betheking', 'BTK60ULT-S1000', '60 Ult Tokens', 'Be The King', 0, 12523, 13024, 12899, 12899, 0, 0, 0, 'be_the_king.png', '', 1, '2023-11-01', 4, 1),
(40981, 'betheking', 'BTK60-S1000', '60 Gold', 'Be The King', 0, 12523, 13024, 12899, 12899, 0, 0, 0, 'be_the_king.png', '', 1, '2023-11-01', 4, 1),
(40982, 'betheking', 'BTK300-S48', '300 Gold', 'Be The King', 0, 61540, 64002, 63386, 63386, 0, 0, 0, 'be_the_king.png', '', 1, '2023-11-01', 4, 1),
(40983, 'betheking', 'BTK300ULT-S48', '300 Ult Tokens', 'Be The King', 0, 61540, 64002, 63386, 63386, 0, 0, 0, 'be_the_king.png', '', 1, '2023-11-01', 4, 1),
(40984, 'betheking', 'BTK300ULT-S1000', '300 Ult Tokens', 'Be The King', 0, 63525, 66066, 65431, 65431, 0, 0, 0, 'be_the_king.png', '', 1, '2023-11-01', 4, 1),
(40985, 'betheking', 'BTK300-S1000', '300 Gold', 'Be The King', 0, 63525, 66066, 65431, 65431, 0, 0, 0, 'be_the_king.png', '', 1, '2023-11-01', 4, 1),
(40986, 'betheking', 'BTK680-S48', '680 Gold', 'Be The King', 0, 123329, 128262, 127029, 127029, 0, 0, 0, 'be_the_king.png', '', 1, '2023-11-01', 4, 1),
(40987, 'betheking', 'BTK680ULT-S48', '680 Ult Tokens', 'Be The King', 0, 123329, 128262, 127029, 127029, 0, 0, 0, 'be_the_king.png', '', 1, '2023-11-01', 4, 1),
(40988, 'betheking', 'BTK680-S1000', '680 Gold', 'Be The King', 0, 127352, 132446, 131173, 131173, 0, 0, 0, 'be_the_king.png', '', 1, '2023-11-01', 4, 1),
(40989, 'betheking', 'BTK680ULT-S1000', '680 Ult Tokens', 'Be The King', 0, 127352, 132446, 131173, 131173, 0, 0, 0, 'be_the_king.png', '', 1, '2023-11-01', 4, 1),
(40990, 'betheking', 'BTK2040-S48', '2040 Gold', 'Be The King', 0, 368255, 382985, 379303, 379303, 0, 0, 0, 'be_the_king.png', '', 1, '2023-11-01', 4, 1),
(40991, 'betheking', 'BTK2040ULT-S48', '2040 Ult Tokens', 'Be The King', 0, 368255, 382985, 379303, 379303, 0, 0, 0, 'be_the_king.png', '', 1, '2023-11-01', 4, 1),
(40992, 'betheking', 'BTK2040-S1000', '2040 Gold', 'Be The King', 0, 369431, 384208, 380514, 380514, 0, 0, 0, 'be_the_king.png', '', 1, '2023-11-01', 4, 1),
(40993, 'betheking', 'BTK2040ULT-S1000', '2040 Ult Tokens', 'Be The King', 0, 369431, 384208, 380514, 380514, 0, 0, 0, 'be_the_king.png', '', 1, '2023-11-01', 4, 1),
(40994, 'betheking', 'BTK3400-S48', '3400 Gold', 'Be The King', 0, 615406, 640022, 633868, 633868, 0, 0, 0, 'be_the_king.png', '', 1, '2023-11-01', 4, 1),
(40995, 'betheking', 'BTK3400ULT-S48', '3400 Ult Tokens', 'Be The King', 0, 615406, 640022, 633868, 633868, 0, 0, 0, 'be_the_king.png', '', 1, '2023-11-01', 4, 1),
(40996, 'betheking', 'BTK3400ULT-S1000', '3400 Ult Tokens', 'Be The King', 0, 617266, 641957, 635784, 635784, 0, 0, 0, 'be_the_king.png', '', 1, '2023-11-01', 4, 1),
(40997, 'betheking', 'BTK3400-S1000', '3400 Gold', 'Be The King', 0, 617266, 641957, 635784, 635784, 0, 0, 0, 'be_the_king.png', '', 1, '2023-11-01', 4, 1),
(40998, 'betheking', 'BTK6800ULT-S48', '6800 Ult Tokens', 'Be The King', 0, 1233284, 1282615, 1270283, 1270283, 0, 0, 0, 'be_the_king.png', '', 1, '2023-11-01', 4, 1),
(40999, 'betheking', 'BTK6800-S48', '6800 Gold', 'Be The King', 0, 1233284, 1282615, 1270283, 1270283, 0, 0, 0, 'be_the_king.png', '', 1, '2023-11-01', 4, 1),
(41000, 'betheking', 'BTK6800-S1000', '6800 Gold', 'Be The King', 0, 1236956, 1286434, 1274065, 1274065, 0, 0, 0, 'be_the_king.png', '', 1, '2023-11-01', 4, 1),
(41001, 'betheking', 'BTK6800ULT-S1000', '6800 Ult Tokens', 'Be The King', 0, 1236956, 1286434, 1274065, 1274065, 0, 0, 0, 'be_the_king.png', '', 1, '2023-11-01', 4, 1),
(41002, 'betheking', 'BTK20400-S48', '20400 Ult Tokens', 'Be The King', 0, 3682550, 3829852, 3793027, 3793027, 0, 0, 0, 'be_the_king.png', '', 1, '2023-11-01', 4, 1),
(41003, 'betheking', 'BTK20400-S1000', '20400 Ult Tokens', 'Be The King', 0, 3693397, 3841133, 3804199, 3804199, 0, 0, 0, 'be_the_king.png', '', 1, '2023-11-01', 4, 1),
(41004, 'chimeraland', 'CML60A-S50', '60 Amber', 'Chimeraland', 0, 10891, 11327, 11218, 11218, 0, 0, 0, 'chimeraland.png', '', 1, '2023-11-01', 4, 1),
(41005, 'chimeraland', 'CML300A-S50', '300 Amber', 'Chimeraland', 0, 56090, 58334, 57773, 57773, 0, 0, 0, 'chimeraland.png', '', 1, '2023-11-01', 4, 1),
(41006, 'chimeraland', 'CML680A-S50', '680 Amber', 'Chimeraland', 0, 112588, 117092, 115966, 115966, 0, 0, 0, 'chimeraland.png', '', 1, '2023-11-01', 4, 1),
(41007, 'chimeraland', 'CML980A-S50', '980 Amber', 'Chimeraland', 0, 169086, 175849, 174159, 174159, 0, 0, 0, 'chimeraland.png', '', 1, '2023-11-01', 4, 1),
(41008, 'chimeraland', 'CML1980A-S50', '1980 Amber', 'Chimeraland', 0, 338580, 352123, 348737, 348737, 0, 0, 0, 'chimeraland.png', '', 1, '2023-11-01', 4, 1),
(41009, 'chimeraland', 'CML3280A-S50', '3280 Amber', 'Chimeraland', 0, 602692, 626800, 620773, 620773, 0, 0, 0, 'chimeraland.png', '', 1, '2023-11-01', 4, 1),
(41010, 'chimeraland', 'CML5508A-S50', '5180 Amber', 'Chimeraland', 0, 941679, 979346, 969929, 969929, 0, 0, 0, 'chimeraland.png', '', 1, '2023-11-01', 4, 1),
(41011, 'chimeraland', 'CML6888A-S50', '6480 Amber', 'Chimeraland', 0, 1129961, 1175159, 1163860, 1163860, 0, 0, 0, 'chimeraland.png', '', 1, '2023-11-01', 4, 1),
(41012, 'dragonraja', 'DR66-S48', '66 Coupon', 'Dragon Raja', 0, 12358, 12852, 12729, 12729, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-11-01', 4, 1),
(41013, 'dragonraja', 'DR76-S14', '76 Coupon', 'Dragon Raja', 0, 14028, 14589, 14449, 14449, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-11-01', 4, 1),
(41014, 'dragonraja', 'DR264-S48', '264 Coupon', 'Dragon Raja', 0, 49431, 51408, 50914, 50914, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-11-01', 4, 1),
(41015, 'dragonraja', 'DR456-S14', '456 Coupon', 'Dragon Raja', 0, 84170, 87537, 86695, 86695, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-11-01', 4, 1),
(41016, 'dragonraja', 'DR820-S14', '820 Coupon', 'Dragon Raja', 0, 140283, 145894, 144491, 144491, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-11-01', 4, 1),
(41017, 'dragonraja', 'DRIF1-S14', 'Investment Fund', 'Dragon Raja', 0, 182368, 189663, 187839, 187839, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-11-01', 4, 1),
(41018, 'dragonraja', 'DR1098-S48', '1098 Coupon', 'Dragon Raja', 0, 185363, 192778, 190924, 190924, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-11-01', 4, 1),
(41019, 'dragonraja', 'DRIF1-S48', 'Investment Fund', 'Dragon Raja', 0, 185363, 192778, 190924, 190924, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-11-01', 4, 1),
(41020, 'dragonraja', 'DRIF2-S48', 'Investment Fund II', 'Dragon Raja', 0, 247151, 257037, 254566, 254566, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-11-01', 4, 1),
(41021, 'dragonraja', 'DRIF2-S14', 'Investment Fund II', 'Dragon Raja', 0, 252510, 262610, 260085, 260085, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-11-01', 4, 1),
(41022, 'dragonraja', 'DR1699-S14', '1699 Coupon', 'Dragon Raja', 0, 280566, 291789, 288983, 288983, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-11-01', 4, 1),
(41023, 'dragonraja', 'DR2246-S48', '2246 Coupon', 'Dragon Raja', 0, 370727, 385556, 381849, 381849, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-11-01', 4, 1),
(41024, 'dragonraja', 'DR3768-S48', '3768 Coupon', 'Dragon Raja', 0, 617877, 642592, 636413, 636413, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-11-01', 4, 1),
(41025, 'dragonraja', 'DR5161-S14', '5161 Coupon', 'Dragon Raja', 0, 841699, 875367, 866950, 866950, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-11-01', 4, 1),
(41026, 'dragonraja', 'DR6860-S14', '6860 Coupon', 'Dragon Raja', 0, 1122265, 1167156, 1155933, 1155933, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-11-01', 4, 1),
(41027, 'dragonraja', 'DR7546-S48', '7546 Coupons', 'Dragon Raja', 0, 1235755, 1285185, 1272828, 1272828, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-11-01', 4, 1),
(41028, 'dragonraja', 'DR9056-S14', '9056 Coupon', 'Dragon Raja', 0, 1402832, 1458945, 1444917, 1444917, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-11-01', 4, 1),
(41029, 'dragonraja', 'DR15092-S48', '15092 Coupons', 'Dragon Raja', 0, 2471510, 2570370, 2545655, 2545655, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-11-01', 4, 1),
(41030, 'dragonheirsilentgods', 'DSGCRYSTAL70-S14', 'Dragon Crystal x 70', 'Dragonheir Silent Gods', 0, 14472, 14472, 14472, 14472, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-11-01', 4, 1),
(41031, 'dragonheirsilentgods', 'DSGEHSC-S14', 'Epic Heroes Selectable Chest (Limited 2)', 'Dragonheir Silent Gods', 0, 14472, 14472, 14472, 14472, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-11-01', 4, 1),
(41032, 'dragonheirsilentgods', 'DSGCRYSTAL350-S14', 'Dragon Crystal x 350', 'Dragonheir Silent Gods', 0, 66598, 66598, 66598, 66598, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-11-01', 4, 1),
(41033, 'dragonheirsilentgods', 'DSGASC-S14', 'Apprentices Secret Collection', 'Dragonheir Silent Gods', 0, 66598, 66598, 66598, 66598, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-11-01', 4, 1),
(41034, 'dragonheirsilentgods', 'DSGDSTE-S14', 'Daily Supply from Three Ears', 'Dragonheir Silent Gods', 0, 66598, 66598, 66598, 66598, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-11-01', 4, 1),
(41035, 'dragonheirsilentgods', 'DSGWMW-S14', 'Wyrmarrow Mining Warrant', 'Dragonheir Silent Gods', 0, 133196, 133196, 133196, 133196, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-11-01', 4, 1),
(41036, 'dragonheirsilentgods', 'DSGHRC-S14', 'Heliolite Rush Chest (Limited 2)', 'Dragonheir Silent Gods', 0, 159058, 159058, 159058, 159058, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-11-01', 4, 1),
(41037, 'dragonheirsilentgods', 'DSGCRYSTAL1050-S14', 'Dragon Crystal x 1050', 'Dragonheir Silent Gods', 0, 199392, 199392, 199392, 199392, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-11-01', 4, 1),
(41038, 'dragonheirsilentgods', 'DSGSSC-S14', 'Scholars Secret Collection', 'Dragonheir Silent Gods', 0, 199392, 199392, 199392, 199392, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-11-01', 4, 1),
(41039, 'dragonheirsilentgods', 'DSGWS-S14', 'Walkers Selection (Limited 1)', 'Dragonheir Silent Gods', 0, 265990, 265990, 265990, 265990, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-11-01', 4, 1),
(41040, 'dragonheirsilentgods', 'DSGJSTP-S14', 'Jolly Sprites Trickster Pouch (Limited 2)', 'Dragonheir Silent Gods', 0, 287269, 287269, 287269, 287269, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-11-01', 4, 1),
(41041, 'dragonheirsilentgods', 'DSGCRYSTAL2100-S14', 'Dragon Crystal x 2100', 'Dragonheir Silent Gods', 0, 395702, 395702, 395702, 395702, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-11-01', 4, 1),
(41042, 'dragonheirsilentgods', 'DSGNSGP-S14', 'New Season Growth Perks (Limited 2)', 'Dragonheir Silent Gods', 0, 658342, 658342, 658342, 658342, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-11-01', 4, 1),
(41043, 'dragonheirsilentgods', 'DSGCRYSTAL3500-S14', 'Dragon Crystal x 3500', 'Dragonheir Silent Gods', 0, 658342, 658342, 658342, 658342, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-11-01', 4, 1),
(41044, 'dragonheirsilentgods', 'DSGMSC-S14', 'Masters Secret Collection', 'Dragonheir Silent Gods', 0, 658342, 658342, 658342, 658342, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-11-01', 4, 1),
(41045, 'dragonheirsilentgods', 'DSGHMC-S14', 'Heliolite Miracle Chest (Limited 2)', 'Dragonheir Silent Gods', 0, 1313066, 1313066, 1313066, 1313066, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-11-01', 4, 1),
(41046, 'dragonheirsilentgods', 'DSGJSMC-S14', 'Jolly Sprites Mischief Chest (Limited 2)', 'Dragonheir Silent Gods', 0, 1313066, 1313066, 1313066, 1313066, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-11-01', 4, 1),
(41047, 'dragonheirsilentgods', 'DSGCRYSTAL7000-S14', 'Dragon Crystal x 7000', 'Dragonheir Silent Gods', 0, 1313066, 1313066, 1313066, 1313066, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-11-01', 4, 1),
(41048, 'eggyparty', 'EGGYCOINS60-S23', '60 Eggy Coins + 3 Bonus', 'Eggy Party', 0, 10647, 10647, 10647, 10647, 0, 0, 0, 'eggy_party.png', '', 1, '2023-11-01', 4, 1),
(41049, 'eggyparty', 'EGGYCOINS120-S23', '120 Eggy Coins + 6 Bonus', 'Eggy Party', 0, 20475, 20475, 20475, 20475, 0, 0, 0, 'eggy_party.png', '', 1, '2023-11-01', 4, 1),
(41050, 'eggyparty', 'EGGYCOINS300-S23', '300 Eggy Coins + 24 Bonus', 'Eggy Party', 0, 51870, 51870, 51870, 51870, 0, 0, 0, 'eggy_party.png', '', 1, '2023-11-01', 4, 1),
(41051, 'eggyparty', 'EGGYCOINS700-S23', '700 Eggy Coins + 57 Bonus', 'Eggy Party', 0, 122850, 122850, 122850, 122850, 0, 0, 0, 'eggy_party.png', '', 1, '2023-11-01', 4, 1),
(41052, 'eggyparty', 'EGGYCOINS1380-S23', '1380 Eggy Coins + 144 Bonus', 'Eggy Party', 0, 240240, 240240, 240240, 240240, 0, 0, 0, 'eggy_party.png', '', 1, '2023-11-01', 4, 1),
(41053, 'eggyparty', 'EGGYCOINS2080-S23', '2080 Eggy Coins + 216 Bonus', 'Eggy Party', 0, 360360, 360360, 360360, 360360, 0, 0, 0, 'eggy_party.png', '', 1, '2023-11-01', 4, 1),
(41054, 'eggyparty', 'EGGYCOINS3450-S23', '3450 Eggy Coins + 423 Bonus', 'Eggy Party', 0, 597870, 597870, 597870, 597870, 0, 0, 0, 'eggy_party.png', '', 1, '2023-11-01', 4, 1),
(41055, 'eggyparty', 'EGGYCOINS6880-S23', '6880 Eggy Coins + 903 Bonus', 'Eggy Party', 0, 1190280, 1190280, 1190280, 1190280, 0, 0, 0, 'eggy_party.png', '', 1, '2023-11-01', 4, 1),
(41056, 'freefire', 'FF5-S24', '5 Diamonds', 'Free Fire', 0, 781, 812, 804, 804, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41057, 'freefire', 'FF5-S1000', '5 Diamonds', 'Free Fire', 0, 808, 840, 832, 832, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41058, 'freefire', 'FF10-S24', '10 Diamonds', 'Free Fire', 0, 1560, 1622, 1607, 1607, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41059, 'freefire', 'FF10-S1000', '10 Diamonds', 'Free Fire', 0, 1616, 1681, 1664, 1664, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41060, 'freefire', 'FF50-S24', '50 Diamonds', 'Free Fire', 0, 6244, 6494, 6431, 6431, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41061, 'freefire', 'FF50-S1000', '50 Diamonds', 'Free Fire', 0, 6464, 6723, 6658, 6658, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41062, 'freefire', 'FF55-S24', '55 Diamonds', 'Free Fire', 0, 7025, 7306, 7236, 7236, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41063, 'freefire', 'FF55-S1000', '55 Diamonds', 'Free Fire', 0, 7272, 7563, 7490, 7490, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41064, 'freefire', 'FF70-S24', '70 Diamonds', 'Free Fire', 0, 8585, 8928, 8843, 8843, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41065, 'freefire', 'FF70-S1000', '70 Diamonds', 'Free Fire', 0, 8888, 9244, 9155, 9155, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41066, 'freefire', 'FF80-S24', '80 Diamonds', 'Free Fire', 0, 10145, 10551, 10449, 10449, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41067, 'freefire', 'FF80-S1000', '80 Diamonds', 'Free Fire', 0, 10504, 10924, 10819, 10819, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41068, 'freefire', 'FF100-S24', '100 Diamonds', 'Free Fire', 0, 12488, 12988, 12863, 12863, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41069, 'freefire', 'FF100-S1000', '100 Diamonds', 'Free Fire', 0, 12928, 13445, 13316, 13316, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41070, 'freefire', 'FF120-S24', '120 Diamonds', 'Free Fire', 0, 14829, 15422, 15274, 15274, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41071, 'freefire', 'FF120-S1000', '120 Diamonds', 'Free Fire', 0, 15352, 15966, 15813, 15813, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41072, 'freefire', 'FF130-S24', '130 Diamonds', 'Free Fire', 0, 16389, 17045, 16881, 16881, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41073, 'freefire', 'FF130-S1000', '130 Diamonds', 'Free Fire', 0, 16968, 17647, 17477, 17477, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41074, 'freefire', 'FF140-S24', '140 Diamonds', 'Free Fire', 0, 17170, 17857, 17685, 17685, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41075, 'freefire', 'FF140-S1000', '140 Diamonds', 'Free Fire', 0, 17776, 18487, 18309, 18309, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41076, 'freefire', 'FF145-S24', '145 Diamonds', 'Free Fire', 0, 17951, 18669, 18490, 18490, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41077, 'freefire', 'FF145-S1000', '145 Diamonds', 'Free Fire', 0, 18584, 19327, 19142, 19142, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41078, 'freefire', 'FF150-S24', '150 Diamonds', 'Free Fire', 0, 18730, 19479, 19292, 19292, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41079, 'freefire', 'FF150-S1000', '150 Diamonds', 'Free Fire', 0, 19392, 20168, 19974, 19974, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41080, 'freefire', 'FF190-S24', '190 Diamonds', 'Free Fire', 0, 23414, 24351, 24116, 24116, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41081, 'freefire', 'FF190-S1000', '190 Diamonds', 'Free Fire', 0, 24240, 25210, 24967, 24967, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41082, 'freefire', 'FF200-S24', '200 Diamonds', 'Free Fire', 0, 24974, 25973, 25723, 25723, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41083, 'freefire', 'FF210-S24', '210 Diamonds', 'Free Fire', 0, 25755, 26785, 26528, 26528, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41084, 'freefire', 'FF200-S1000', '200 Diamonds', 'Free Fire', 0, 25856, 26890, 26632, 26632, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41085, 'freefire', 'FFMingguan-S24', 'Member Mingguan', 'Free Fire', 0, 26016, 27057, 26796, 26796, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41086, 'freefire', 'FF210-S1000', '210 Diamonds', 'Free Fire', 0, 26664, 27731, 27464, 27464, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41087, 'freefire', 'FFMINGGUAN-S1000', 'Mingguan Membership', 'Free Fire', 0, 26934, 28011, 27742, 27742, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41088, 'freefire', 'FF280-S24', '280 Diamonds', 'Free Fire', 0, 34340, 35714, 35370, 35370, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41089, 'freefire', 'FF280-S1000', '280 Diamonds', 'Free Fire', 0, 35552, 36974, 36619, 36619, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41090, 'freefire', 'FF355-S24', '355 Diamonds', 'Free Fire', 0, 42925, 44642, 44213, 44213, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41091, 'freefire', 'FF355-S1000', '355 Diamonds', 'Free Fire', 0, 44440, 46218, 45773, 45773, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41092, 'freefire', 'FF420-S24', '420 Diamonds', 'Free Fire', 0, 51510, 53570, 53055, 53055, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41093, 'freefire', 'FF420-S1000', '420 Diamonds', 'Free Fire', 0, 53328, 55461, 54928, 54928, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41094, 'freefire', 'FF500-S24', '500 Diamonds', 'Free Fire', 0, 60876, 63311, 62702, 62702, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41095, 'freefire', 'FF510-S24', '510 Diamonds', 'Free Fire', 0, 62436, 64933, 64309, 64309, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41096, 'freefire', 'FF500-S1000', '500 Diamonds', 'Free Fire', 0, 63024, 65545, 64915, 64915, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41097, 'freefire', 'FF510-S1000', '510 Diamonds', 'Free Fire', 0, 64640, 67226, 66579, 66579, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41098, 'freefire', 'FF565-S24', '565 Diamonds', 'Free Fire', 0, 68680, 71427, 70740, 70740, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41099, 'freefire', 'FF565-S1000', '565 Diamonds', 'Free Fire', 0, 71104, 73948, 73237, 73237, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41100, 'freefire', 'FF635-S24', '635 Diamonds', 'Free Fire', 0, 77265, 80356, 79583, 79583, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41101, 'freefire', 'FFBulanan-S24', 'Member Bulanan', 'Free Fire', 0, 78046, 81168, 80387, 80387, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41102, 'freefire', 'FF635-S1000', '635 Diamonds', 'Free Fire', 0, 79992, 83192, 82392, 82392, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41103, 'freefire', 'FFBULANAN-S1000', 'Bulanan Membership', 'Free Fire', 0, 80800, 84032, 83224, 83224, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41104, 'freefire', 'FF720-S24', '720 Diamonds', 'Free Fire', 0, 85850, 89284, 88426, 88426, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41105, 'freefire', 'FF720-S1000', '720 Diamonds', 'Free Fire', 0, 88880, 92435, 91546, 91546, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41106, 'freefire', 'FF800-S24', '800 Diamonds', 'Free Fire', 0, 95995, 99835, 98875, 98875, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41107, 'freefire', 'FF800-S1000', '800 Diamonds', 'Free Fire', 0, 99384, 103359, 102366, 102366, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41108, 'freefire', 'FF860-S24', '860 Diamonds', 'Free Fire', 0, 103020, 107141, 106111, 106111, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41109, 'freefire', 'FF860-S1000', '860 Diamonds', 'Free Fire', 0, 106656, 110922, 109856, 109856, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41110, 'freefire', 'FF930-S24', '930 Diamonds', 'Free Fire', 0, 111605, 116069, 114953, 114953, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41111, 'freefire', 'FF930-S1000', '930 Diamonds', 'Free Fire', 0, 115544, 120166, 119010, 119010, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41112, 'freefire', 'FF1000-S24', '1000 Diamonds', 'Free Fire', 0, 120190, 124998, 123796, 123796, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41113, 'freefire', 'FF1000-S1000', '1000 Diamonds', 'Free Fire', 0, 124432, 129409, 128165, 128165, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41114, 'freefire', 'FF1050-S24', '1050 Diamonds', 'Free Fire', 0, 126434, 131491, 130227, 130227, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41115, 'freefire', 'FF1075-S24', '1075 Diamonds', 'Free Fire', 0, 128775, 133926, 132638, 132638, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41116, 'freefire', 'FF1080-S24', '1080 Diamonds', 'Free Fire', 0, 129556, 134738, 133443, 133443, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41117, 'freefire', 'FF1050-S1000', '1050 Diamonds', 'Free Fire', 0, 130896, 136132, 134823, 134823, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41118, 'freefire', 'FF1075-S1000', '1075 Diamonds', 'Free Fire', 0, 133320, 138653, 137320, 137320, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41119, 'freefire', 'FF1080-S1000', '1080 Diamonds', 'Free Fire', 0, 134128, 139493, 138152, 138152, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41120, 'freefire', 'FF1450-S24', '1450 Diamonds', 'Free Fire', 0, 173260, 180190, 178458, 178458, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41121, 'freefire', 'FF1450-S1000', '1450 Diamonds', 'Free Fire', 0, 179376, 186551, 184757, 184757, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41122, 'freefire', 'FF7290-S24', '7290 Diamonds', 'Free Fire', 0, 858500, 892840, 884255, 884255, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41123, 'freefire', 'FF7290-S1000', '7290 Diamonds', 'Free Fire', 0, 888800, 924352, 915464, 915464, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41124, 'freefire', 'FF36500-S24', '36500 Diamonds', 'Free Fire', 0, 4292500, 4464200, 4421275, 4421275, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41125, 'freefire', 'FF36500-S1000', '36500 Diamonds', 'Free Fire', 0, 4444001, 4621761, 4577321, 4577321, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41126, 'freefire', 'FF73100-S24', '73100 Diamonds', 'Free Fire', 0, 8585000, 8928400, 8842550, 8842550, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41127, 'freefire', 'FF73100-S1000', '73100 Diamonds', 'Free Fire', 0, 8888001, 9243521, 9154641, 9154641, 0, 0, 0, 'free_fire.png', '', 1, '2023-11-01', 4, 1),
(41128, 'freefiremax', 'FFMAX5-S24', '5 Diamonds', 'Free Fire Max', 0, 781, 812, 804, 804, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41129, 'freefiremax', 'FFMAX5-S1000', '5 Diamonds', 'Free Fire Max', 0, 808, 840, 832, 832, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41130, 'freefiremax', 'FFMAX10-S24', '10 Diamonds', 'Free Fire Max', 0, 1560, 1622, 1607, 1607, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41131, 'freefiremax', 'FFMAX10-S1000', '10 Diamonds', 'Free Fire Max', 0, 1616, 1681, 1664, 1664, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41132, 'freefiremax', 'FFMAX50-S24', '50 Diamonds', 'Free Fire Max', 0, 6244, 6494, 6431, 6431, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41133, 'freefiremax', 'FFMAX50-S1000', '50 Diamonds', 'Free Fire Max', 0, 6464, 6723, 6658, 6658, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41134, 'freefiremax', 'FFMAX55-S24', '55 Diamonds', 'Free Fire Max', 0, 7025, 7306, 7236, 7236, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41135, 'freefiremax', 'FFMAX55-S1000', '55 Diamonds', 'Free Fire Max', 0, 7272, 7563, 7490, 7490, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41136, 'freefiremax', 'FFMAX70-S24', '70 Diamonds', 'Free Fire Max', 0, 8585, 8928, 8843, 8843, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41137, 'freefiremax', 'FFMAX70-S1000', '70 Diamonds', 'Free Fire Max', 0, 8888, 9244, 9155, 9155, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41138, 'freefiremax', 'FFMAX80-S24', '80 Diamonds', 'Free Fire Max', 0, 10145, 10551, 10449, 10449, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41139, 'freefiremax', 'FFMAX80-S1000', '80 Diamonds', 'Free Fire Max', 0, 10504, 10924, 10819, 10819, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41140, 'freefiremax', 'FFMAX100-S24', '100 Diamonds', 'Free Fire Max', 0, 12488, 12988, 12863, 12863, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41141, 'freefiremax', 'FFMAX100-S1000', '100 Diamonds', 'Free Fire Max', 0, 12928, 13445, 13316, 13316, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41142, 'freefiremax', 'FFMAX120-S24', '120 Diamonds', 'Free Fire Max', 0, 14829, 15422, 15274, 15274, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41143, 'freefiremax', 'FFMAX120-S1000', '120 Diamonds', 'Free Fire Max', 0, 15352, 15966, 15813, 15813, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41144, 'freefiremax', 'FFMAX130-S24', '130 Diamonds', 'Free Fire Max', 0, 16389, 17045, 16881, 16881, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41145, 'freefiremax', 'FFMAX130-S1000', '130 Diamonds', 'Free Fire Max', 0, 16968, 17647, 17477, 17477, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41146, 'freefiremax', 'FFMAX140-S24', '140 Diamonds', 'Free Fire Max', 0, 17170, 17857, 17685, 17685, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41147, 'freefiremax', 'FFMAX140-S1000', '140 Diamonds', 'Free Fire Max', 0, 17776, 18487, 18309, 18309, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41148, 'freefiremax', 'FFMAX145-S24', '145 Diamonds', 'Free Fire Max', 0, 17951, 18669, 18490, 18490, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41149, 'freefiremax', 'FFMAX145-S1000', '145 Diamonds', 'Free Fire Max', 0, 18584, 19327, 19142, 19142, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41150, 'freefiremax', 'FFMAX150-S24', '150 Diamonds', 'Free Fire Max', 0, 18730, 19479, 19292, 19292, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41151, 'freefiremax', 'FFMAX150-S1000', '150 Diamonds', 'Free Fire Max', 0, 19392, 20168, 19974, 19974, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41152, 'freefiremax', 'FFMAX190-S24', '190 Diamonds', 'Free Fire Max', 0, 23414, 24351, 24116, 24116, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41153, 'freefiremax', 'FFMAX190-S1000', '190 Diamonds', 'Free Fire Max', 0, 24240, 25210, 24967, 24967, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41154, 'freefiremax', 'FFMAX200-S24', '200 Diamonds', 'Free Fire Max', 0, 24974, 25973, 25723, 25723, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41155, 'freefiremax', 'FFMAX210-S24', '210 Diamonds', 'Free Fire Max', 0, 25755, 26785, 26528, 26528, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41156, 'freefiremax', 'FFMAX200-S1000', '200 Diamonds', 'Free Fire Max', 0, 25856, 26890, 26632, 26632, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1);
INSERT INTO `tb_produk` (`cuid`, `slug`, `code`, `title`, `kategori`, `subkategori`, `harga_modal`, `harga_jual`, `harga_reseller`, `harga_h2h`, `harga_coret`, `komisi`, `poin`, `image`, `currency`, `status`, `created_date`, `jenis`, `product_type`) VALUES
(41157, 'freefiremax', 'FFMAXMINGGUAN-S24', 'Membership Mingguan', 'Free Fire Max', 0, 26016, 27057, 26796, 26796, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41158, 'freefiremax', 'FFMAX210-S1000', '210 Diamonds', 'Free Fire Max', 0, 26664, 27731, 27464, 27464, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41159, 'freefiremax', 'FFMAXMINGGUAN-S1000', 'Mingguan Membership', 'Free Fire Max', 0, 26934, 28011, 27742, 27742, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41160, 'freefiremax', 'FFMAX280-S24', '280 Diamonds', 'Free Fire Max', 0, 34340, 35714, 35370, 35370, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41161, 'freefiremax', 'FFMAX280-S1000', '280 Diamonds', 'Free Fire Max', 0, 35552, 36974, 36619, 36619, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41162, 'freefiremax', 'FFMAX355-S24', '355 Diamonds', 'Free Fire Max', 0, 42925, 44642, 44213, 44213, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41163, 'freefiremax', 'FFMAX355-S1000', '355 Diamonds', 'Free Fire Max', 0, 44440, 46218, 45773, 45773, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41164, 'freefiremax', 'FFMAX420-S24', '420 Diamonds', 'Free Fire Max', 0, 51510, 53570, 53055, 53055, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41165, 'freefiremax', 'FFMAX420-S1000', '420 Diamonds', 'Free Fire Max', 0, 53328, 55461, 54928, 54928, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41166, 'freefiremax', 'FFMAX500-S24', '500 Diamonds', 'Free Fire Max', 0, 60876, 63311, 62702, 62702, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41167, 'freefiremax', 'FFMAX510-S24', '510 Diamonds', 'Free Fire Max', 0, 62436, 64933, 64309, 64309, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41168, 'freefiremax', 'FFMAX500-S1000', '500 Diamonds', 'Free Fire Max', 0, 63024, 65545, 64915, 64915, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41169, 'freefiremax', 'FFMAX510-S1000', '510 Diamonds', 'Free Fire Max', 0, 64640, 67226, 66579, 66579, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41170, 'freefiremax', 'FFMAX565-S24', '565 Diamonds', 'Free Fire Max', 0, 68680, 71427, 70740, 70740, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41171, 'freefiremax', 'FFMAX565-S1000', '565 Diamonds', 'Free Fire Max', 0, 71104, 73948, 73237, 73237, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41172, 'freefiremax', 'FFMAX635-S24', '635 Diamonds', 'Free Fire Max', 0, 77265, 80356, 79583, 79583, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41173, 'freefiremax', 'FFMAXBULANAN-S24', 'Membership Bulanan', 'Free Fire Max', 0, 78046, 81168, 80387, 80387, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41174, 'freefiremax', 'FFMAX635-S1000', '635 Diamonds', 'Free Fire Max', 0, 79992, 83192, 82392, 82392, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41175, 'freefiremax', 'FFMAXBULANAN-S1000', 'Bulanan Membership', 'Free Fire Max', 0, 80800, 84032, 83224, 83224, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41176, 'freefiremax', 'FFMAX720-S24', '720 Diamonds', 'Free Fire Max', 0, 85850, 89284, 88426, 88426, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41177, 'freefiremax', 'FFMAX720-S1000', '720 Diamonds', 'Free Fire Max', 0, 88880, 92435, 91546, 91546, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41178, 'freefiremax', 'FFMAX800-S24', '800 Diamonds', 'Free Fire Max', 0, 95995, 99835, 98875, 98875, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41179, 'freefiremax', 'FFMAX800-S1000', '800 Diamonds', 'Free Fire Max', 0, 99384, 103359, 102366, 102366, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41180, 'freefiremax', 'FFMAX860-S24', '860 Diamonds', 'Free Fire Max', 0, 103020, 107141, 106111, 106111, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41181, 'freefiremax', 'FFMAX860-S1000', '860 Diamonds', 'Free Fire Max', 0, 106656, 110922, 109856, 109856, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41182, 'freefiremax', 'FFMAX930-S24', '930 Diamonds', 'Free Fire Max', 0, 111605, 116069, 114953, 114953, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41183, 'freefiremax', 'FFMAX930-S1000', '930 Diamonds', 'Free Fire Max', 0, 115544, 120166, 119010, 119010, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41184, 'freefiremax', 'FFMAX1000-S24', '1000 Diamonds', 'Free Fire Max', 0, 120190, 124998, 123796, 123796, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41185, 'freefiremax', 'FFMAX1000-S1000', '1000 Diamonds', 'Free Fire Max', 0, 124432, 129409, 128165, 128165, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41186, 'freefiremax', 'FFMAX1050-S24', '1050 Diamonds', 'Free Fire Max', 0, 126434, 131491, 130227, 130227, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41187, 'freefiremax', 'FFMAX1075-S24', '1075 Diamonds', 'Free Fire Max', 0, 128775, 133926, 132638, 132638, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41188, 'freefiremax', 'FFMAX1080-S24', '1080 Diamonds', 'Free Fire Max', 0, 129556, 134738, 133443, 133443, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41189, 'freefiremax', 'FFMAX1050-S1000', '1050 Diamonds', 'Free Fire Max', 0, 130896, 136132, 134823, 134823, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41190, 'freefiremax', 'FFMAX1075-S1000', '1075 Diamonds', 'Free Fire Max', 0, 133320, 138653, 137320, 137320, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41191, 'freefiremax', 'FFMAX1080-S1000', '1080 Diamonds', 'Free Fire Max', 0, 134128, 139493, 138152, 138152, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41192, 'freefiremax', 'FFMAX1450-S24', '1450 Diamonds', 'Free Fire Max', 0, 173260, 180190, 178458, 178458, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41193, 'freefiremax', 'FFMAX1450-S1000', '1450 Diamonds', 'Free Fire Max', 0, 179376, 186551, 184757, 184757, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41194, 'freefiremax', 'FFMAX7290-S24', '7290 Diamonds', 'Free Fire Max', 0, 858500, 892840, 884255, 884255, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41195, 'freefiremax', 'FFMAX7290-S1000', '7290 Diamonds', 'Free Fire Max', 0, 888800, 924352, 915464, 915464, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41196, 'freefiremax', 'FFMAX36500-S24', '36500 Diamonds', 'Free Fire Max', 0, 4292500, 4464200, 4421275, 4421275, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41197, 'freefiremax', 'FFMAX36500-S1000', '36500 Diamonds', 'Free Fire Max', 0, 4444001, 4621761, 4577321, 4577321, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41198, 'freefiremax', 'FFMAX73100-S24', '73100 Diamonds', 'Free Fire Max', 0, 8585000, 8928400, 8842550, 8842550, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41199, 'freefiremax', 'FFMAX73100-S1000', '73100 Diamonds', 'Free Fire Max', 0, 8888001, 9243521, 9154641, 9154641, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-11-01', 4, 1),
(41200, 'garenaundawn', 'GU80-S97', 'RC 80', 'Garena Undawn', 0, 13635, 13635, 13635, 13635, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-11-01', 4, 1),
(41201, 'garenaundawn', 'GUKM-S24M', 'Kartu Mingguan', 'Garena Undawn', 0, 24974, 24974, 24974, 24974, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-11-01', 4, 1),
(41202, 'garenaundawn', 'GU250-S97', 'RC 250', 'Garena Undawn', 0, 40905, 40905, 40905, 40905, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-11-01', 4, 1),
(41203, 'garenaundawn', 'GUKB-S24M', 'Kartu Bulanan', 'Garena Undawn', 0, 41365, 41365, 41365, 41365, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-11-01', 4, 1),
(41204, 'garenaundawn', 'GU450-S97', 'RC 450', 'Garena Undawn', 0, 68175, 68175, 68175, 68175, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-11-01', 4, 1),
(41205, 'garenaundawn', 'GUGF-S24M', 'Growth Fund', 'Garena Undawn', 0, 82989, 82989, 82989, 82989, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-11-01', 4, 1),
(41206, 'garenaundawn', 'GUEF-S24M', 'Elite Fund (Rebate LV 80)', 'Garena Undawn', 0, 110045, 110045, 110045, 110045, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-11-01', 4, 1),
(41207, 'garenaundawn', 'GUGPPS3-S24M', 'Glory Pass Premium S3', 'Garena Undawn', 0, 124994, 124994, 124994, 124994, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-11-01', 4, 1),
(41208, 'garenaundawn', 'GU920-S24M', 'RC 920', 'Garena Undawn', 0, 128775, 128775, 128775, 128775, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-11-01', 4, 1),
(41209, 'garenaundawn', 'GU920-S97', 'RC 920', 'Garena Undawn', 0, 135441, 135441, 135441, 135441, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-11-01', 4, 1),
(41210, 'garenaundawn', 'GU1850-S24M', 'RC 1.850', 'Garena Undawn', 0, 257550, 257550, 257550, 257550, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-11-01', 4, 1),
(41211, 'garenaundawn', 'GU1850-S97', 'RC 1.850', 'Garena Undawn', 0, 271791, 271791, 271791, 271791, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-11-01', 4, 1),
(41212, 'garenaundawn', 'GU2800-S24M', 'RC 2.800', 'Garena Undawn', 0, 386325, 386325, 386325, 386325, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-11-01', 4, 1),
(41213, 'garenaundawn', 'GU2800-S97', 'RC 2.800', 'Garena Undawn', 0, 408141, 408141, 408141, 408141, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-11-01', 4, 1),
(41214, 'garenaundawn', 'GU4750-S24M', 'RC 4.750', 'Garena Undawn', 0, 643875, 643875, 643875, 643875, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-11-01', 4, 1),
(41215, 'garenaundawn', 'GU4750-S97', 'RC 4.750', 'Garena Undawn', 0, 680841, 680841, 680841, 680841, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-11-01', 4, 1),
(41216, 'garenaundawn', 'GU9600-S24M', 'RC 9.600', 'Garena Undawn', 0, 1287750, 1287750, 1287750, 1287750, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-11-01', 4, 1),
(41217, 'garenaundawn', 'GU9600-S97', 'RC 9.600', 'Garena Undawn', 0, 1362591, 1362591, 1362591, 1362591, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-11-01', 4, 1),
(41218, 'garenaundawn', 'GU33000-S24M', 'RC 33.000', 'Garena Undawn', 0, 4292500, 4292500, 4292500, 4292500, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-11-01', 4, 1),
(41219, 'garenaundawn', 'GU33000-S97', 'RC 33.000', 'Garena Undawn', 0, 4545000, 4545000, 4545000, 4545000, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-11-01', 4, 1),
(41220, 'garenaundawn', 'GU66500-S24M', 'RC 66.500', 'Garena Undawn', 0, 8585000, 8585000, 8585000, 8585000, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-11-01', 4, 1),
(41221, 'garenaundawn', 'GU66500-S97', 'RC 66.500', 'Garena Undawn', 0, 9090000, 9090000, 9090000, 9090000, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-11-01', 4, 1),
(41222, 'genshinimpact', 'GI60-S14', '60 Genesis Crystals', 'Genshin Impact', 0, 11058, 11500, 11390, 11390, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-11-01', 4, 1),
(41223, 'genshinimpact', 'GI60-S1000', '60 Crystals', 'Genshin Impact', 0, 11366, 11821, 11707, 11707, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-11-01', 4, 1),
(41224, 'genshinimpact', 'GI330-S14', '300 + 30 Genesis Crystals', 'Genshin Impact', 0, 55289, 57501, 56948, 56948, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-11-01', 4, 1),
(41225, 'genshinimpact', 'GIWELKIN-S14', 'Blessing Welkin Moon', 'Genshin Impact', 0, 55289, 57501, 56948, 56948, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-11-01', 4, 1),
(41226, 'genshinimpact', 'GI330-S1000', '300+30 Crystals', 'Genshin Impact', 0, 58706, 61054, 60467, 60467, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-11-01', 4, 1),
(41227, 'genshinimpact', 'GIWELKIN-S1000', 'Blessing Welkin Moon', 'Genshin Impact', 0, 61231, 63680, 63068, 63068, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-11-01', 4, 1),
(41228, 'genshinimpact', 'GIWELKIN2-S14', 'Blessing Welkin Moon x 2', 'Genshin Impact', 0, 110579, 115002, 113896, 113896, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-11-01', 4, 1),
(41229, 'genshinimpact', 'GI1090-S14', '980 + 110 Genesis Crystals', 'Genshin Impact', 0, 165868, 172503, 170844, 170844, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-11-01', 4, 1),
(41230, 'genshinimpact', 'GIWELKIN3-S14', 'Blessing Welkin Moon x 3', 'Genshin Impact', 0, 165868, 172503, 170844, 170844, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-11-01', 4, 1),
(41231, 'genshinimpact', 'GI1090-S1000', '980+110 Crystals', 'Genshin Impact', 0, 175562, 182584, 180829, 180829, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-11-01', 4, 1),
(41232, 'genshinimpact', 'GIWELKIN4-S14', 'Blessing Welkin Moon x 4', 'Genshin Impact', 0, 221158, 230004, 227793, 227793, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-11-01', 4, 1),
(41233, 'genshinimpact', 'GIWELKIN5-S14', 'Blessing Welkin Moon x 5', 'Genshin Impact', 0, 276447, 287505, 284740, 284740, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-11-01', 4, 1),
(41234, 'genshinimpact', 'GIWELKIN6-S14', 'Blessing Welkin Moon x 6', 'Genshin Impact', 0, 331737, 345006, 341689, 341689, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-11-01', 4, 1),
(41235, 'genshinimpact', 'GI2240-S14', '1980 + 260 Genesis Crystals', 'Genshin Impact', 0, 359381, 373756, 370162, 370162, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-11-01', 4, 1),
(41236, 'genshinimpact', 'GI2240-S1000', '1980+260 Crystals', 'Genshin Impact', 0, 380418, 395635, 391831, 391831, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-11-01', 4, 1),
(41237, 'genshinimpact', 'GI3940-S20', '3280 + 600 Genesis Crystals', 'Genshin Impact', 0, 546121, 567966, 562505, 562505, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-11-01', 4, 1),
(41238, 'genshinimpact', 'GI3940-S14', '3280 + 600 Genesis Crystals', 'Genshin Impact', 0, 552894, 575010, 569481, 569481, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-11-01', 4, 1),
(41239, 'genshinimpact', 'GI3940-S1000', '3280+600 Crystals', 'Genshin Impact', 0, 585175, 608582, 602730, 602730, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-11-01', 4, 1),
(41240, 'genshinimpact', 'GI8080-S20', '6480 + 1600 Genesis Crystals', 'Genshin Impact', 0, 1092241, 1135931, 1125008, 1125008, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-11-01', 4, 1),
(41241, 'genshinimpact', 'GI8080-S14', '6480+1600 Crystals', 'Genshin Impact', 0, 1105788, 1150020, 1138962, 1138962, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-11-01', 4, 1),
(41242, 'genshinimpact', 'GI8080-S1000', '6480+1600 Crystals', 'Genshin Impact', 0, 1170350, 1217164, 1205461, 1205461, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-11-01', 4, 1),
(41243, 'genshinimpact', 'GIALL-S14', 'All Pack Genesis Crystals', 'Genshin Impact', 0, 2250280, 2340291, 2317788, 2317788, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-11-01', 4, 1),
(41244, 'genshinimpact', 'GI40400-S20', '6480+1600 Crystals x 5', 'Genshin Impact', 0, 5461207, 5679655, 5625043, 5625043, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-11-01', 4, 1),
(41245, 'genshinimpact', 'GI40400-S14', '6480+1600 Crystals x 5', 'Genshin Impact', 0, 5528942, 5750100, 5694810, 5694810, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-11-01', 4, 1),
(41246, 'genshinimpact', 'GI80800-S20', '6480+1600 Crystals x 10', 'Genshin Impact', 0, 10922415, 11359312, 11250087, 11250087, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-11-01', 4, 1),
(41247, 'genshinimpact', 'GI80800-S14', '6480+1600 Crystals x 10', 'Genshin Impact', 0, 11057884, 11500199, 11389621, 11389621, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-11-01', 4, 1),
(41248, 'honkaiimpact3', 'HKI65B-S70', '65 B-Chips', 'Honkai Impact 3', 0, 14229, 14798, 14656, 14656, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-11-01', 4, 1),
(41249, 'honkaiimpact3', 'HKI65-S70', '65 Crystals', 'Honkai Impact 3', 0, 14229, 14798, 14656, 14656, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-11-01', 4, 1),
(41250, 'honkaiimpact3', 'HKI65B-S18', '65 B-Chips', 'Honkai Impact 3', 0, 15709, 16337, 16180, 16180, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-11-01', 4, 1),
(41251, 'honkaiimpact3', 'HKI65-S18', '65 Crystals', 'Honkai Impact 3', 0, 15709, 16337, 16180, 16180, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-11-01', 4, 1),
(41252, 'honkaiimpact3', 'HKI330B-S70', '330 B-Chips', 'Honkai Impact 3', 0, 72438, 75336, 74611, 74611, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-11-01', 4, 1),
(41253, 'honkaiimpact3', 'HKI330-S70', '330 Crystals', 'Honkai Impact 3', 0, 72438, 75336, 74611, 74611, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-11-01', 4, 1),
(41254, 'honkaiimpact3', 'HKIMC-S70', 'Monthly-Card', 'Honkai Impact 3', 0, 72438, 75336, 74611, 74611, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-11-01', 4, 1),
(41255, 'honkaiimpact3', 'HKI330B-S18', '330 B-Chips', 'Honkai Impact 3', 0, 77117, 80202, 79431, 79431, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-11-01', 4, 1),
(41256, 'honkaiimpact3', 'HKI330-S18', '330 Crystals', 'Honkai Impact 3', 0, 77117, 80202, 79431, 79431, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-11-01', 4, 1),
(41257, 'honkaiimpact3', 'HKIMC-S18', 'Monthly-Card', 'Honkai Impact 3', 0, 77117, 80202, 79431, 79431, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-11-01', 4, 1),
(41258, 'honkaiimpact3', 'HKI710-S70', '710 Crystals', 'Honkai Impact 3', 0, 144875, 150670, 149221, 149221, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-11-01', 4, 1),
(41259, 'honkaiimpact3', 'HKI710-S18', '710 Crystals', 'Honkai Impact 3', 0, 154232, 160401, 158859, 158859, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-11-01', 4, 1),
(41260, 'honkaiimpact3', 'HKI990B-S70', '990 B-Chips', 'Honkai Impact 3', 0, 214725, 223314, 221167, 221167, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-11-01', 4, 1),
(41261, 'honkaiimpact3', 'HKI990B-S18', '990 B-Chips', 'Honkai Impact 3', 0, 242774, 252485, 250057, 250057, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-11-01', 4, 1),
(41262, 'honkaiimpact3', 'HKI1320B-S70', '1320 B-Chips', 'Honkai Impact 3', 0, 287163, 298650, 295778, 295778, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-11-01', 4, 1),
(41263, 'honkaiimpact3', 'HKI1430-S70', '1430 Crystals', 'Honkai Impact 3', 0, 287163, 298650, 295778, 295778, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-11-01', 4, 1),
(41264, 'honkaiimpact3', 'HKI1320B-S18', '1320 B-Chips', 'Honkai Impact 3', 0, 318937, 331694, 328505, 328505, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-11-01', 4, 1),
(41265, 'honkaiimpact3', 'HKI1430-S18', '1430 Crystals', 'Honkai Impact 3', 0, 318937, 331694, 328505, 328505, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-11-01', 4, 1),
(41266, 'honkaiimpact3', 'HKI1980B-S70', '1980 B-Chips', 'Honkai Impact 3', 0, 432038, 449320, 444999, 444999, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-11-01', 4, 1),
(41267, 'honkaiimpact3', 'HKI1980B-S18', '1980 B-Chips', 'Honkai Impact 3', 0, 465553, 484175, 479520, 479520, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-11-01', 4, 1),
(41268, 'honkaiimpact3', 'HKI3300B-S70', '3300 B-Chips', 'Honkai Impact 3', 0, 724374, 753349, 746105, 746105, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-11-01', 4, 1),
(41269, 'honkaiimpact3', 'HKI3860-S70', '3860 Crystals', 'Honkai Impact 3', 0, 724374, 753349, 746105, 746105, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-11-01', 4, 1),
(41270, 'honkaiimpact3', 'HKI3300B-S18', '3300 B-Chips', 'Honkai Impact 3', 0, 775923, 806960, 799201, 799201, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-11-01', 4, 1),
(41271, 'honkaiimpact3', 'HKI3860-S18', '3860 Crystals', 'Honkai Impact 3', 0, 775923, 806960, 799201, 799201, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-11-01', 4, 1),
(41272, 'honkaiimpact3', 'HKI8088-S18', '8088 Crystals', 'Honkai Impact 3', 0, 1550893, 1612929, 1597420, 1597420, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-11-01', 4, 1),
(41273, 'honkaiimpact3', 'HKI6600B-S18', '6600 B-Chips', 'Honkai Impact 3', 0, 1550893, 1612929, 1597420, 1597420, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-11-01', 4, 1),
(41274, 'honkaistarrail', 'HSTR60-S85', '60 Oneiric Shard', 'Honkai Star Rail', 0, 14015, 14015, 14015, 14015, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-11-01', 4, 1),
(41275, 'honkaistarrail', 'HSTR60-S11', '60 Oneiric Shard', 'Honkai Star Rail', 0, 14313, 14313, 14313, 14313, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-11-01', 4, 1),
(41276, 'honkaistarrail', 'HSTR300-S85', '300+30 Oneiric Shard', 'Honkai Star Rail', 0, 56916, 56916, 56916, 56916, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-11-01', 4, 1),
(41277, 'honkaistarrail', 'HSTRESP-S85', 'Express Supply Pass', 'Honkai Star Rail', 0, 56916, 56916, 56916, 56916, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-11-01', 4, 1),
(41278, 'honkaistarrail', 'HSTR300-S11', '300+30 Oneiric Shard', 'Honkai Star Rail', 0, 58004, 58004, 58004, 58004, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-11-01', 4, 1),
(41279, 'honkaistarrail', 'HSTRESP-S11', 'Express Supply Pass', 'Honkai Star Rail', 0, 58004, 58004, 58004, 58004, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-11-01', 4, 1),
(41280, 'honkaistarrail', 'HSTR980-S85', '980+110 Oneiric Shard', 'Honkai Star Rail', 0, 169672, 169672, 169672, 169672, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-11-01', 4, 1),
(41281, 'honkaistarrail', 'HSTR980-S11', '980+110 Oneiric Shard', 'Honkai Star Rail', 0, 174562, 174562, 174562, 174562, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-11-01', 4, 1),
(41282, 'honkaistarrail', 'HSTR1980-S11', '1980+260 Oneiric Shard', 'Honkai Star Rail', 0, 378572, 378572, 378572, 378572, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-11-01', 4, 1),
(41283, 'honkaistarrail', 'HKI3880-S12', '3280 + 600 Oneiric Shard', 'Honkai Star Rail', 0, 581709, 581709, 581709, 581709, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-11-01', 4, 1),
(41284, 'honkaistarrail', 'HSTR3280-S11', '3280 + 600 Oneiric Shard', 'Honkai Star Rail', 0, 582548, 582548, 582548, 582548, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-11-01', 4, 1),
(41285, 'honkaistarrail', 'HKI8080-S12', '6480 + 1600 Oneiric Shard', 'Honkai Star Rail', 0, 1163709, 1163709, 1163709, 1163709, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-11-01', 4, 1),
(41286, 'honkaistarrail', 'HSTR6480-S11', '6480 + 1600 Oneiric Shard', 'Honkai Star Rail', 0, 1165370, 1165370, 1165370, 1165370, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-11-01', 4, 1),
(41287, 'leagueoflegends', 'LOLWC105-S10', '105 Wild Cores', 'League of Legends', 0, 14301, 14873, 14730, 14730, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-11-01', 4, 1),
(41288, 'leagueoflegends', 'LOL420-S18', '420 Wild Cores', 'League of Legends', 0, 44268, 46039, 45596, 45596, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-11-01', 4, 1),
(41289, 'leagueoflegends', 'LOLWC350-S10', '350 Wild Cores', 'League of Legends', 0, 47669, 49576, 49099, 49099, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-11-01', 4, 1),
(41290, 'leagueoflegends', 'LOL535-S70', '535 Wild Cores', 'League of Legends', 0, 64676, 67263, 66616, 66616, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-11-01', 4, 1),
(41291, 'leagueoflegends', 'LOL700-S18', '700 Wild Cores', 'League of Legends', 0, 70829, 73662, 72954, 72954, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-11-01', 4, 1),
(41292, 'leagueoflegends', 'LOLWC585-S10', '585 Wild Cores', 'League of Legends', 0, 76271, 79322, 78559, 78559, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-11-01', 4, 1),
(41293, 'leagueoflegends', 'LOL1100-S70', '1100 Wild Cores', 'League of Legends', 0, 129353, 134527, 133234, 133234, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-11-01', 4, 1),
(41294, 'leagueoflegends', 'LOL1375-S18', '1375 Wild Cores', 'League of Legends', 0, 132804, 138116, 136788, 136788, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-11-01', 4, 1),
(41295, 'leagueoflegends', 'LOLWC1135-S10', '1135 Wild Cores', 'League of Legends', 0, 143008, 148728, 147298, 147298, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-11-01', 4, 1),
(41296, 'leagueoflegends', 'LOL1725-S70', '1725 Wild Cores', 'League of Legends', 0, 194028, 201789, 199849, 199849, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-11-01', 4, 1),
(41297, 'leagueoflegends', 'LOLWC1660-S10', '1660 Wild Cores', 'League of Legends', 0, 200212, 208220, 206218, 206218, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-11-01', 4, 1),
(41298, 'leagueoflegends', 'LOL2400-S18', '2400 Wild Cores', 'League of Legends', 0, 221340, 230194, 227980, 227980, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-11-01', 4, 1),
(41299, 'leagueoflegends', 'LOL3000-S70', '3000 Wild Cores', 'League of Legends', 0, 323381, 336316, 333082, 333082, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-11-01', 4, 1),
(41300, 'leagueoflegends', 'LOLWC3010-S10', '3010 Wild Cores', 'League of Legends', 0, 343220, 356949, 353517, 353517, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-11-01', 4, 1),
(41301, 'leagueoflegends', 'LOL4000-S18', '4000 Wild Cores', 'League of Legends', 0, 354144, 368310, 364768, 364768, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-11-01', 4, 1),
(41302, 'leagueoflegends', 'LOL8150-S18', '8150 Wild Cores', 'League of Legends', 0, 708287, 736618, 729536, 729536, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-11-01', 4, 1),
(41303, 'leagueoflegends', 'LOLWC6210-S10', '6210 Wild Cores', 'League of Legends', 0, 715042, 743644, 736493, 736493, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-11-01', 4, 1),
(41304, 'lifeafter', 'LA65-S14', '65 Credits', 'LifeAfter', 0, 11168, 11615, 11503, 11503, 0, 0, 0, 'lifeafter.png', '', 1, '2023-11-01', 4, 1),
(41305, 'lifeafter', 'LA330-S14', '330 Credits', 'LifeAfter', 0, 55838, 58072, 57513, 57513, 0, 0, 0, 'lifeafter.png', '', 1, '2023-11-01', 4, 1),
(41306, 'lifeafter', 'LA330-S1000', '330 Credits', 'LifeAfter', 0, 64612, 67196, 66550, 66550, 0, 0, 0, 'lifeafter.png', '', 1, '2023-11-01', 4, 1),
(41307, 'lifeafter', 'LA558-S14', '558 Credits', 'LifeAfter', 0, 89341, 92915, 92021, 92021, 0, 0, 0, 'lifeafter.png', '', 1, '2023-11-01', 4, 1),
(41308, 'lifeafter', 'LA558-S1000', '558 Credits', 'LifeAfter', 0, 105519, 109740, 108685, 108685, 0, 0, 0, 'lifeafter.png', '', 1, '2023-11-01', 4, 1),
(41309, 'lifeafter', 'LA1108-S14', '1108 Credits', 'LifeAfter', 0, 167515, 174216, 172540, 172540, 0, 0, 0, 'lifeafter.png', '', 1, '2023-11-01', 4, 1),
(41310, 'lifeafter', 'LA1108-S1000', '1108 Credits', 'LifeAfter', 0, 190821, 198454, 196546, 196546, 0, 0, 0, 'lifeafter.png', '', 1, '2023-11-01', 4, 1),
(41311, 'lifeafter', 'LA2268-S14', '2268 Credits', 'LifeAfter', 0, 335029, 348430, 345080, 345080, 0, 0, 0, 'lifeafter.png', '', 1, '2023-11-01', 4, 1),
(41312, 'lifeafter', 'LA2268-S1000', '2268 Credits', 'LifeAfter', 0, 375211, 390219, 386467, 386467, 0, 0, 0, 'lifeafter.png', '', 1, '2023-11-01', 4, 1),
(41313, 'lifeafter', 'LA3468-S14', '3468 Credits', 'LifeAfter', 0, 524879, 545874, 540625, 540625, 0, 0, 0, 'lifeafter.png', '', 1, '2023-11-01', 4, 1),
(41314, 'lifeafter', 'LA3468-S1000', '3468 Credits', 'LifeAfter', 0, 579313, 602486, 596692, 596692, 0, 0, 0, 'lifeafter.png', '', 1, '2023-11-01', 4, 1),
(41315, 'lifeafter', 'LA5768-S14', '5768 Credits', 'LifeAfter', 0, 837573, 871076, 862700, 862700, 0, 0, 0, 'lifeafter.png', '', 1, '2023-11-01', 4, 1),
(41316, 'lifeafter', 'LA5768-S1000', '5768 Credits', 'LifeAfter', 0, 957019, 995300, 985730, 985730, 0, 0, 0, 'lifeafter.png', '', 1, '2023-11-01', 4, 1),
(41317, 'lifeafter', 'LA7768-S14', '7768 Credits', 'LifeAfter', 0, 1116764, 1161435, 1150267, 1150267, 0, 0, 0, 'lifeafter.png', '', 1, '2023-11-01', 4, 1),
(41318, 'lifeafter', 'LA7768-S1000', '7768 Credits', 'LifeAfter', 0, 1210450, 1258868, 1246764, 1246764, 0, 0, 0, 'lifeafter.png', '', 1, '2023-11-01', 4, 1),
(41319, 'lightofthel', 'LOT90-S1', '90 Crystal', 'Light of Thel', 0, 11510, 11970, 11855, 11855, 0, 0, 0, 'light_of_thel.png', '', 1, '2023-11-01', 4, 1),
(41320, 'lightofthel', 'LOT450-S1', '450 Crystal', 'Light of Thel', 0, 57552, 59854, 59279, 59279, 0, 0, 0, 'light_of_thel.png', '', 1, '2023-11-01', 4, 1),
(41321, 'lightofthel', 'LOT900-S1', '900 Crystal', 'Light of Thel', 0, 115104, 119708, 118557, 118557, 0, 0, 0, 'light_of_thel.png', '', 1, '2023-11-01', 4, 1),
(41322, 'lightofthel', 'LOT1800-S1', '1800 Crystal', 'Light of Thel', 0, 230208, 239416, 237114, 237114, 0, 0, 0, 'light_of_thel.png', '', 1, '2023-11-01', 4, 1),
(41323, 'lightofthel', 'LOT4500-S1', '4500 Crystal', 'Light of Thel', 0, 575519, 598540, 592785, 592785, 0, 0, 0, 'light_of_thel.png', '', 1, '2023-11-01', 4, 1),
(41324, 'lightofthel', 'LOT9000-S1', '9000 Crystal', 'Light of Thel', 0, 1162435, 1208932, 1197308, 1197308, 0, 0, 0, 'light_of_thel.png', '', 1, '2023-11-01', 4, 1),
(41325, 'lita', 'LITAX300-S18', '300 Lita Coins', 'Lita', 0, 33420, 34757, 34423, 34423, 0, 0, 0, 'lita.png', '', 1, '2023-11-01', 4, 1),
(41326, 'lita', 'LITAX600-S18', '600 Lita Coins', 'Lita', 0, 64055, 66617, 65977, 65977, 0, 0, 0, 'lita.png', '', 1, '2023-11-01', 4, 1),
(41327, 'lita', 'LITAX1000-S18', '1000 Lita Coins', 'Lita', 0, 105830, 110063, 109005, 109005, 0, 0, 0, 'lita.png', '', 1, '2023-11-01', 4, 1),
(41328, 'lita', 'LITAX2000-S18', '2000 Lita Coins', 'Lita', 0, 208875, 217230, 215141, 215141, 0, 0, 0, 'lita.png', '', 1, '2023-11-01', 4, 1),
(41329, 'lita', 'LITAX5000-S18', '5000 Lita Coins', 'Lita', 0, 520795, 541627, 536419, 536419, 0, 0, 0, 'lita.png', '', 1, '2023-11-01', 4, 1),
(41330, 'lita', 'LITAX10000-S18', '10000 Lita Coins', 'Lita', 0, 1038805, 1080357, 1069969, 1069969, 0, 0, 0, 'lita.png', '', 1, '2023-11-01', 4, 1),
(41331, 'lordsmobile', 'LM99-S98', '99 Diamonds', 'Lords Mobile', 0, 13587, 14130, 13995, 13995, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-11-01', 4, 1),
(41332, 'lordsmobile', 'LM199-S98', '199 Diamonds', 'Lords Mobile', 0, 27293, 28385, 28112, 28112, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-11-01', 4, 1),
(41333, 'lordsmobile', 'LMWDP-S98', 'Weekly Diamond Pass', 'Lords Mobile', 0, 27428, 28525, 28251, 28251, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-11-01', 4, 1),
(41334, 'lordsmobile', 'LM499-S98', '499 Diamonds', 'Lords Mobile', 0, 68411, 71147, 70463, 70463, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-11-01', 4, 1),
(41335, 'lordsmobile', 'LM999-S98', '999 Diamonds', 'Lords Mobile', 0, 137061, 142543, 141173, 141173, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-11-01', 4, 1),
(41336, 'lordsmobile', 'LM1999-S98', '1999 Diamonds', 'Lords Mobile', 0, 274121, 285086, 282345, 282345, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-11-01', 4, 1),
(41337, 'lordsmobile', 'LMMDP-S98', 'Monthly Diamond Pass', 'Lords Mobile', 0, 275485, 286504, 283750, 283750, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-11-01', 4, 1),
(41338, 'lordsmobile', 'LM4999-S98', '4999 Diamonds', 'Lords Mobile', 0, 685660, 713086, 706230, 706230, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-11-01', 4, 1),
(41339, 'lordsmobile', 'LM6295-S32', '6265 Diamonds', 'Lords Mobile', 0, 896475, 932334, 923369, 923369, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-11-01', 4, 1),
(41340, 'lordsmobile', 'LM9999-S98', '9999 Diamonds', 'Lords Mobile', 0, 1371440, 1426298, 1412583, 1412583, 0, 0, 0, 'lords_mobile.png', '', 1, '2023-11-01', 4, 1),
(41341, 'marvelsnap', 'MSNPWLB-S50', 'Welcome Bundle', 'Marvel Snap', 0, 35669, 35669, 35669, 35669, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-11-01', 4, 1),
(41342, 'marvelsnap', 'MSNP300-S50', '300 Gold', 'Marvel Snap', 0, 59629, 59629, 59629, 59629, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-11-01', 4, 1),
(41343, 'marvelsnap', 'MSNPPRM-S50', 'Season Pass Premium', 'Marvel Snap', 0, 119394, 119394, 119394, 119394, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-11-01', 4, 1),
(41344, 'marvelsnap', 'MSNP600-S50', '600 Gold + 100 Gold Bonus', 'Marvel Snap', 0, 119394, 119394, 119394, 119394, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-11-01', 4, 1),
(41345, 'marvelsnap', 'MSNPMBP-S50', 'Magik Birthday Party', 'Marvel Snap', 0, 179297, 179297, 179297, 179297, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-11-01', 4, 1),
(41346, 'marvelsnap', 'MSNPPMP-S50', 'Premium Mystery Pack', 'Marvel Snap', 0, 179297, 179297, 179297, 179297, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-11-01', 4, 1),
(41347, 'marvelsnap', 'MSNPPRMPLS-S50', 'Season Pass Premium Plus', 'Marvel Snap', 0, 179297, 179297, 179297, 179297, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-11-01', 4, 1),
(41348, 'marvelsnap', 'MSNP1200-S50', '1200 Gold + 250 Gold Bonus', 'Marvel Snap', 0, 239062, 239062, 239062, 239062, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-11-01', 4, 1),
(41349, 'marvelsnap', 'MSNP2100-S50', '2100 Gold + 500 Gold Bonus', 'Marvel Snap', 0, 418903, 418903, 418903, 418903, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-11-01', 4, 1),
(41350, 'marvelsnap', 'MSNP3000-S50', '3000 Gold + 850 Gold Bonus', 'Marvel Snap', 0, 596020, 596020, 596020, 596020, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-11-01', 4, 1),
(41351, 'marvelsnap', 'MSNP6000-S50', '6000 Gold + 2000 Gold Bonus', 'Marvel Snap', 0, 1194492, 1194492, 1194492, 1194492, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-11-01', 4, 1),
(41352, 'marvelsnap', 'MSNPPB-S50', 'Pro Bundle', 'Marvel Snap', 0, 1194492, 1194492, 1194492, 1194492, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-11-01', 4, 1),
(41353, 'marvelsuperwar', 'MSW55SC-S1', '55 Star Credits', 'Marvel Super War', 0, 11510, 11970, 11855, 11855, 0, 0, 0, 'marvel_super_war.png', '', 1, '2023-11-01', 4, 1),
(41354, 'marvelsuperwar', 'MSW275SC-S1', '275 Star Credits', 'Marvel Super War', 0, 57552, 59854, 59279, 59279, 0, 0, 0, 'marvel_super_war.png', '', 1, '2023-11-01', 4, 1),
(41355, 'marvelsuperwar', 'MSW565SC-S1', '565 Star Credits', 'Marvel Super War', 0, 115104, 119708, 118557, 118557, 0, 0, 0, 'marvel_super_war.png', '', 1, '2023-11-01', 4, 1),
(41356, 'marvelsuperwar', 'MSW1155SC-S1', '1155 Star Credits', 'Marvel Super War', 0, 230208, 239416, 237114, 237114, 0, 0, 0, 'marvel_super_war.png', '', 1, '2023-11-01', 4, 1),
(41357, 'marvelsuperwar', 'MSW1765SC-S1', '1765 Star Credits', 'Marvel Super War', 0, 374087, 389050, 385310, 385310, 0, 0, 0, 'marvel_super_war.png', '', 1, '2023-11-01', 4, 1),
(41358, 'marvelsuperwar', 'MSW2950SC-S1', '2950 Star Credits', 'Marvel Super War', 0, 575519, 598540, 592785, 592785, 0, 0, 0, 'marvel_super_war.png', '', 1, '2023-11-01', 4, 1),
(41359, 'marvelsuperwar', 'MSW6000SC-S1', '6000 Star Credits', 'Marvel Super War', 0, 1151038, 1197080, 1185569, 1185569, 0, 0, 0, 'marvel_super_war.png', '', 1, '2023-11-01', 4, 1),
(41360, 'metalslugawakening', 'MSAWK60-S81', '60 ruby', 'Metal Slug Awakening', 0, 12726, 12726, 12726, 12726, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-11-01', 4, 1),
(41361, 'metalslugawakening', 'MSAWK310-S81', '310 Ruby', 'Metal Slug Awakening', 0, 59388, 59388, 59388, 59388, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-11-01', 4, 1),
(41362, 'metalslugawakening', 'MSAWKSP-S81M', 'Support Pass', 'Metal Slug Awakening', 0, 59388, 59388, 59388, 59388, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-11-01', 4, 1),
(41363, 'metalslugawakening', 'MSAWKKB-S81', 'Kartu Bulanan', 'Metal Slug Awakening', 0, 59388, 59388, 59388, 59388, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-11-01', 4, 1),
(41364, 'metalslugawakening', 'MSAWK630-S81', '630 Ruby', 'Metal Slug Awakening', 0, 114534, 114534, 114534, 114534, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-11-01', 4, 1),
(41365, 'metalslugawakening', 'MSAWKSPP1-S81M', 'Premium Support Pass', 'Metal Slug Awakening', 0, 114534, 114534, 114534, 114534, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-11-01', 4, 1),
(41366, 'metalslugawakening', 'MSAWKKBP-S81', 'Kartu Bulanan Premium', 'Metal Slug Awakening', 0, 114534, 114534, 114534, 114534, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-11-01', 4, 1),
(41367, 'metalslugawakening', 'MSAWK1300-S81', '1300 Ruby', 'Metal Slug Awakening', 0, 229068, 229068, 229068, 229068, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-11-01', 4, 1),
(41368, 'metalslugawakening', 'MSAWK3200-S81', '3200 Ruby', 'Metal Slug Awakening', 0, 593880, 593880, 593880, 593880, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-11-01', 4, 1),
(41369, 'metalslugawakening', 'MSAWK6500-S81', '6500 Ruby', 'Metal Slug Awakening', 0, 1145340, 1145340, 1145340, 1145340, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-11-01', 4, 1),
(41370, 'metalslugawakening', 'MSAWK6500_5-S81', '6500 Ruby x 5', 'Metal Slug Awakening', 0, 5726700, 5726700, 5726700, 5726700, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-11-01', 4, 1),
(41371, 'metalslugawakening', 'MSAWK6500_10-S81', '6500 Ruby x 10', 'Metal Slug Awakening', 0, 11453400, 11453400, 11453400, 11453400, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-11-01', 4, 1),
(41372, 'metalslugawakening', 'MSAWK6500_20-S81', '6500 Ruby x 20', 'Metal Slug Awakening', 0, 22906800, 22906800, 22906800, 22906800, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-11-01', 4, 1),
(41373, 'metalslugawakening', 'MSAWK6500_50-S81', '6500 Ruby x 50', 'Metal Slug Awakening', 0, 57267000, 57267000, 57267000, 57267000, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-11-01', 4, 1),
(41374, 'metalslugawakening', 'MSAWK6500_100-S81', '6500 Ruby x 100', 'Metal Slug Awakening', 0, 114534000, 114534000, 114534000, 114534000, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-11-01', 4, 1),
(41375, 'mobilelegendsa', 'MLSO2195-S8', '2195 Diamonds (1860 + 335 Bonus)', 'Mobile Legends A', 0, 490970, 510609, 505699, 505699, 0, 0, 0, 'mobile_legends_a.png', '', 1, '2023-11-01', 4, 1),
(41376, 'mobilelegendsa', 'MLSO3688-S8', '3688 Diamonds (3099 + 589 Bonus)', 'Mobile Legends A', 0, 818960, 851718, 843529, 843529, 0, 0, 0, 'mobile_legends_a.png', '', 1, '2023-11-01', 4, 1),
(41377, 'mobilelegendsa', 'MLSO5532-S8', '5532 Diamonds (4649 + 883 Bonus)', 'Mobile Legends A', 0, 1235400, 1284816, 1272462, 1272462, 0, 0, 0, 'mobile_legends_a.png', '', 1, '2023-11-01', 4, 1),
(41378, 'mobilelegendsa', 'MLSO9288-S8', '9288 Diamonds (7740 + 1548 Bonus)', 'Mobile Legends A', 0, 2052910, 2135026, 2114497, 2114497, 0, 0, 0, 'mobile_legends_a.png', '', 1, '2023-11-01', 4, 1),
(41379, 'mobilelegendsb', 'ML5_0-S50A', '5 Diamonds ( 5 + 0 Bonus )', 'Mobile Legends B', 0, 1369, 1424, 1410, 1410, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41380, 'mobilelegendsb', 'ML5_0-S968', '5 Diamonds ( 5 + 0 Bonus )', 'Mobile Legends B', 0, 1426, 1483, 1469, 1469, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41381, 'mobilelegendsb', 'ML11_1-S968', '12 Diamonds ( 11 + 1 Bonus )', 'Mobile Legends B', 0, 3327, 3460, 3427, 3427, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41382, 'mobilelegendsb', 'ML17_2-S968', '19 Diamonds ( 17 + 2 Bonus )', 'Mobile Legends B', 0, 5228, 5437, 5385, 5385, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41383, 'mobilelegendsb', 'ML25_3-S968', '28 Diamonds ( 25 + 3 Bonus )', 'Mobile Legends B', 0, 7604, 7908, 7832, 7832, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41384, 'mobilelegendsb', 'ML40_4-S968', '44 Diamonds ( 40 + 4 Bonus )', 'Mobile Legends B', 0, 11407, 11863, 11749, 11749, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41385, 'mobilelegendsb', 'ML53_6-S968', '59 Diamonds ( 53 + 6 Bonus )', 'Mobile Legends B', 0, 15210, 15818, 15666, 15666, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41386, 'mobilelegendsb', 'ML77_8-S968', '85 Diamonds ( 77 + 8 Bonus )', 'Mobile Legends B', 0, 21863, 22738, 22519, 22519, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41387, 'mobilelegendsb', 'MLWEEKLYDIAMONDPASS-S968', 'Weekly Diamond Pass (Event Topup +100)', 'Mobile Legends B', 0, 27821, 28934, 28656, 28656, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41388, 'mobilelegendsb', 'MLBB102_11-S968', '113 Diamond (102 + 11 Bonus )', 'Mobile Legends B', 0, 29468, 30647, 30352, 30352, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41389, 'mobilelegendsb', 'ML154_16-S968', '170 Diamonds ( 154 + 16 Bonus )', 'Mobile Legends B', 0, 43726, 45475, 45038, 45038, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41390, 'mobilelegendsb', 'ML217_23-S968', '240 Diamonds ( 217 + 23 Bonus )', 'Mobile Legends B', 0, 61787, 64258, 63641, 63641, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41391, 'mobilelegendsb', 'ML256_40-S968', '296 Diamonds ( 256 + 40 Bonus )', 'Mobile Legends B', 0, 76046, 79088, 78327, 78327, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41392, 'mobilelegendsb', 'MLBB261_40-S968', '301 Diamond (261 + 40 Bonus )', 'Mobile Legends B', 0, 77472, 80571, 79796, 79796, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41393, 'mobilelegendsb', 'MLBB333_48-S968', '381 Diamond (333 + 48 Bonus )', 'Mobile Legends B', 0, 97908, 101824, 100845, 100845, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41394, 'mobilelegendsb', 'ML367_41-S968', '408 Diamonds ( 367 + 41 Bonus )', 'Mobile Legends B', 0, 104563, 108746, 107700, 107700, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41395, 'mobilelegendsb', 'MLBB384_43-S968', '427 Diamond (384 + 43 Bonus )', 'Mobile Legends B', 0, 109791, 114183, 113085, 113085, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41396, 'mobilelegendsb', 'MLTL-S968', 'Twilight Pass', 'Mobile Legends B', 0, 142520, 148221, 146796, 146796, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41397, 'mobilelegendsb', 'ML503_65-S968', '568 Diamonds ( 503 + 65 Bonus )', 'Mobile Legends B', 0, 142586, 148289, 146864, 146864, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41398, 'mobilelegendsb', 'MLBB633_79-S968', '712 Diamond (633 + 79 Bonus )', 'Mobile Legends B', 0, 179658, 186844, 185048, 185048, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41399, 'mobilelegendsb', 'MLBB644_80-S968', '724 Diamond (644 + 80 Bonus )', 'Mobile Legends B', 0, 182985, 190304, 188475, 188475, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41400, 'mobilelegendsb', 'ML668_82-S968', '750 Diamonds ( 668 + 82 Bonus )', 'Mobile Legends B', 0, 189639, 197225, 195328, 195328, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41401, 'mobilelegendsb', 'ML774_101-S968', '875 Diamonds ( 774 + 101 Bonus )', 'Mobile Legends B', 0, 218632, 227377, 225191, 225191, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41402, 'mobilelegendsb', 'MLBB1008_126-S968', '1134 Diamond (1008 + 126 Bonus )', 'Mobile Legends B', 0, 285647, 297073, 294216, 294216, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41403, 'mobilelegendsb', 'ML1277_166-S968', '1443 Diamonds ( 1277 + 166 Bonus )', 'Mobile Legends B', 0, 361217, 375666, 372054, 372054, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41404, 'mobilelegendsb', 'MLBB1295_158-S968', '1453 Diamond (1295 + 158 Bonus )', 'Mobile Legends B', 0, 366921, 381598, 377929, 377929, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41405, 'mobilelegendsb', 'MLBB1484_188-S968', '1672 Diamond (1484 + 188 Bonus )', 'Mobile Legends B', 0, 420153, 436959, 432758, 432758, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41406, 'mobilelegendsb', 'ML1708_302-S968', '2010 Diamonds ( 1708 + 302 Bonus )', 'Mobile Legends B', 0, 475286, 494297, 489545, 489545, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41407, 'mobilelegendsb', 'MLBB2004_346-S968', '2350 Diamond (2004 + 346 Bonus )', 'Mobile Legends B', 0, 562739, 585249, 579621, 579621, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41408, 'mobilelegendsb', 'ML2322_303-S968', '2625 Diamonds ( 2322 + 303 Bonus )', 'Mobile Legends B', 0, 655894, 682130, 675571, 675571, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41409, 'mobilelegendsb', 'MLBB2499_405-S968', '2904 Diamond (2499 + 405 Bonus )', 'Mobile Legends B', 0, 699145, 727111, 720119, 720119, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41410, 'mobilelegendsb', 'ML2985_468-S968', '3453 Diamonds ( 2985 + 468 Bonus )', 'Mobile Legends B', 0, 836503, 869963, 861598, 861598, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41411, 'mobilelegendsb', 'MLBB3202_491-S968', '3693 Diamond (3202 + 491 Bonus )', 'Mobile Legends B', 0, 898290, 934222, 925239, 925239, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41412, 'mobilelegendsb', 'ML3416_604-S968', '4020 Diamonds ( 3416 + 604 Bonus )', 'Mobile Legends B', 0, 950572, 988595, 979089, 979089, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41413, 'mobilelegendsb', 'MLBB3763_641-S968', '4404 Diamond (3763 + 641 Bonus )', 'Mobile Legends B', 0, 1049431, 1091408, 1080914, 1080914, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41414, 'mobilelegendsb', 'ML4003_827-S968', '4830 Diamonds ( 4003 + 827 Bonus )', 'Mobile Legends B', 0, 1140686, 1186313, 1174907, 1174907, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41415, 'mobilelegendsb', 'MLBB4660_908-S968', '5568 Diamond (4660 + 908 Bonus )', 'Mobile Legends B', 0, 1326998, 1380078, 1366808, 1366808, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41416, 'mobilelegendsb', 'MLBB5033_968-S968', '6001 Diamond (5033 + 968 Bonus )', 'Mobile Legends B', 0, 1435364, 1492779, 1478425, 1478425, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41417, 'mobilelegendsb', 'ML5711_1129-S968', '6840 Diamonds ( 5711 + 1129 Bonus )', 'Mobile Legends B', 0, 1615972, 1680611, 1664451, 1664451, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41418, 'mobilelegendsb', 'MLBB6020_1175-S968', '7195 Diamond (6020 + 1175 Bonus )', 'Mobile Legends B', 0, 1707226, 1775515, 1758443, 1758443, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41419, 'mobilelegendsb', 'ML6485_1230-S968', '7715 Diamonds ( 6485 + 1230 Bonus )', 'Mobile Legends B', 0, 1834603, 1907987, 1889641, 1889641, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41420, 'mobilelegendsb', 'ML7419_1431-S968', '8850 Diamonds ( 7419 + 1431 Bonus )', 'Mobile Legends B', 0, 2091258, 2174908, 2153996, 2153996, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41421, 'mobilelegendsb', 'ML8006_1654-S968', '9660 Diamonds ( 8006 + 1654 Bonus )', 'Mobile Legends B', 0, 2281372, 2372627, 2349813, 2349813, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41422, 'mobilelegendsb', 'MLBB10855_2098-S968', '12953 Diamond (10855 + 2098 Bonus )', 'Mobile Legends B', 0, 3079852, 3203046, 3172248, 3172248, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41423, 'mobilelegendsb', 'MLBB11422_2258-S968', '13680 Diamond (11422 + 2258 Bonus )', 'Mobile Legends B', 0, 3231943, 3361221, 3328901, 3328901, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41424, 'mobilelegendsb', 'MLBB15425_3085-S968', '18510 Diamond (15425 + 3085 Bonus )', 'Mobile Legends B', 0, 4372629, 4547534, 4503808, 4503808, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41425, 'mobilelegendsb', 'MLBB17720_3610-S968', '21330 Diamond (17720 + 3610 Bonus )', 'Mobile Legends B', 0, 5038029, 5239550, 5189170, 5189170, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-11-01', 4, 1),
(41426, 'mobilelegendsgift', 'MLGIFT199-S1', 'ITEM 199 Diamonds [CREATE SQUAD]', 'Mobile Legends Gift', 0, 21890, 21890, 21890, 21890, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-11-01', 4, 1),
(41427, 'mobilelegendsgift', 'MLGIFT188-S1', 'PO SKIN 188 Diamonds [NORMAL] Disc 30%', 'Mobile Legends Gift', 0, 23782, 23782, 23782, 23782, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-11-01', 4, 1),
(41428, 'mobilelegendsgift', 'MLGIFT188PN-S1', 'SKIN 188 Diamonds [SKIN PAINTED]', 'Mobile Legends Gift', 0, 23782, 23782, 23782, 23782, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-11-01', 4, 1),
(41429, 'mobilelegendsgift', 'MLGIFT239-S1', 'ITEM 239 Diamonds [CHANGE NAME]', 'Mobile Legends Gift', 0, 30234, 30234, 30234, 30234, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-11-01', 4, 1),
(41430, 'mobilelegendsgift', 'MLGIFT269-S1', 'SKIN 269 Diamonds [NORMAL]', 'Mobile Legends Gift', 0, 34029, 34029, 34029, 34029, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-11-01', 4, 1),
(41431, 'mobilelegendsgift', 'MLGIFT299-S1', 'SKIN 299 Diamonds [NORMAL]', 'Mobile Legends Gift', 0, 37824, 37824, 37824, 37824, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-11-01', 4, 1),
(41432, 'mobilelegendsgift', 'MLGIFT299CN-S1', 'ITEM 299 Diamonds [CN SQUAD]', 'Mobile Legends Gift', 0, 37824, 37824, 37824, 37824, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-11-01', 4, 1),
(41433, 'mobilelegendsgift', 'MLGIFT399-S1', 'SKIN 399 Diamonds [ELITE]', 'Mobile Legends Gift', 0, 50474, 50474, 50474, 50474, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-11-01', 4, 1),
(41434, 'mobilelegendsgift', 'MLGIFT419-S1', 'PO SKIN 419 Diamonds [ELITE] Disc 30%', 'Mobile Legends Gift', 0, 53004, 53004, 53004, 53004, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-11-01', 4, 1),
(41435, 'mobilelegendsgift', 'MLGIFT499ISL-S1', 'Charisma 499 Diamonds [PARADISE ISLAND]', 'Mobile Legends Gift', 0, 63124, 63124, 63124, 63124, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-11-01', 4, 1),
(41436, 'mobilelegendsgift', 'MLGIFT499ARK-S1', 'Charisma 499 Diamonds [ANGEL ARK]', 'Mobile Legends Gift', 0, 63124, 63124, 63124, 63124, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-11-01', 4, 1),
(41437, 'mobilelegendsgift', 'MLGIFT599-S1', 'SKIN 599 Diamonds [ELITE]', 'Mobile Legends Gift', 0, 75774, 75774, 75774, 75774, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-11-01', 4, 1),
(41438, 'mobilelegendsgift', 'MLGIFT749-S1', 'SKIN 749 Diamonds [SPECIAL]', 'Mobile Legends Gift', 0, 94749, 94749, 94749, 94749, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-11-01', 4, 1),
(41439, 'mobilelegendsgift', 'MLGIFTESTESM3-S1', 'SKIN Estes Blacklist [EPIC]', 'Mobile Legends Gift', 0, 117319, 117319, 117319, 117319, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-11-01', 4, 1),
(41440, 'mobilelegendsgift', 'MLGIFT899-S1', 'SKIN 899 Diamonds [EPIC]', 'Mobile Legends Gift', 0, 113724, 113724, 113724, 113724, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-11-01', 4, 1),
(41441, 'mobilelegendsgift', 'MLGIFT999-S1', 'Charisma 999 Diamonds [Goldmoon Lantern]', 'Mobile Legends Gift', 0, 126374, 126374, 126374, 126374, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-11-01', 4, 1),
(41442, 'mobilelegendsgift', 'MLGIFT1000-S1', 'ITEM 1000 Diamonds [CHANGE FLAG]', 'Mobile Legends Gift', 0, 126500, 126500, 126500, 126500, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-11-01', 4, 1);
INSERT INTO `tb_produk` (`cuid`, `slug`, `code`, `title`, `kategori`, `subkategori`, `harga_modal`, `harga_jual`, `harga_reseller`, `harga_h2h`, `harga_coret`, `komisi`, `poin`, `image`, `currency`, `status`, `created_date`, `jenis`, `product_type`) VALUES
(41443, 'mobilelegendsgift', 'MLGIFT1089-S1', 'SKIN 1089 Diamonds [LIGHTBORN]', 'Mobile Legends Gift', 0, 137759, 137759, 137759, 137759, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-11-01', 4, 1),
(41444, 'omegalegends', 'OL129-S1', '129 Gold', 'Omega Legends', 0, 14388, 14964, 14820, 14820, 0, 0, 0, 'omega_legends.png', '', 1, '2023-11-01', 4, 1),
(41445, 'omegalegends', 'OL258-S1', '258 Gold', 'Omega Legends', 0, 28776, 29927, 29639, 29639, 0, 0, 0, 'omega_legends.png', '', 1, '2023-11-01', 4, 1),
(41446, 'omegalegends', 'OL828-S1', '828 Gold', 'Omega Legends', 0, 86328, 89781, 88918, 88918, 0, 0, 0, 'omega_legends.png', '', 1, '2023-11-01', 4, 1),
(41447, 'omegalegends', 'OL1429-S1', '1429 Gold', 'Omega Legends', 0, 143880, 149635, 148196, 148196, 0, 0, 0, 'omega_legends.png', '', 1, '2023-11-01', 4, 1),
(41448, 'omegalegends', 'OL2927-S1', '2927 Gold', 'Omega Legends', 0, 287760, 299270, 296393, 296393, 0, 0, 0, 'omega_legends.png', '', 1, '2023-11-01', 4, 1),
(41449, 'omegalegends', 'OL9000-S1', '9000 Gold', 'Omega Legends', 0, 863279, 897810, 889177, 889177, 0, 0, 0, 'omega_legends.png', '', 1, '2023-11-01', 4, 1),
(41450, 'onepunchman', 'OP5-S48', '5 Coupon', 'One Punch Man', 0, 7415, 7712, 7637, 7637, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-11-01', 4, 1),
(41451, 'onepunchman', 'OP6-S1', '6 Coupon', 'One Punch Man', 0, 8633, 8978, 8892, 8892, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-11-01', 4, 1),
(41452, 'onepunchman', 'OP13-S48', '13 Coupon', 'One Punch Man', 0, 19772, 20563, 20365, 20365, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-11-01', 4, 1),
(41453, 'onepunchman', 'OP14-S37', '14 Coupon', 'One Punch Man', 0, 21885, 22760, 22542, 22542, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-11-01', 4, 1),
(41454, 'onepunchman', 'OP23-S37', '23 Coupon', 'One Punch Man', 0, 36805, 38277, 37909, 37909, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-11-01', 4, 1),
(41455, 'onepunchman', 'OP23-S48', '23 Coupon', 'One Punch Man', 0, 37073, 38556, 38185, 38185, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-11-01', 4, 1),
(41456, 'onepunchman', 'OP31-S37', '31 Coupon', 'One Punch Man', 0, 51164, 53211, 52699, 52699, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-11-01', 4, 1),
(41457, 'onepunchman', 'OP37-S1', '37 Funds', 'One Punch Man', 0, 57552, 59854, 59279, 59279, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-11-01', 4, 1),
(41458, 'onepunchman', 'OP45-S37', '45 Coupon', 'One Punch Man', 0, 73123, 76048, 75317, 75317, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-11-01', 4, 1),
(41459, 'onepunchman', 'OP61-S48', '61 Coupon', 'One Punch Man', 0, 98860, 102814, 101826, 101826, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-11-01', 4, 1),
(41460, 'onepunchman', 'OP89-S37', '89 Coupon', 'One Punch Man', 0, 146318, 152171, 150708, 150708, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-11-01', 4, 1),
(41461, 'onepunchman', 'OP91C-S48', '91 Coupon', 'One Punch Man', 0, 148290, 154222, 152739, 152739, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-11-01', 4, 1),
(41462, 'onepunchman', 'OP109-S1', '109 Coupon', 'One Punch Man', 0, 172656, 179562, 177836, 177836, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-11-01', 4, 1),
(41463, 'onepunchman', 'OP133-S37', '133 Coupon', 'One Punch Man', 0, 219514, 228295, 226099, 226099, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-11-01', 4, 1),
(41464, 'onepunchman', 'OP177-S37', '177 Coupon', 'One Punch Man', 0, 292710, 304418, 301491, 301491, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-11-01', 4, 1),
(41465, 'onepunchman', 'OP221-S37', '221 Coupon', 'One Punch Man', 0, 365905, 380541, 376882, 376882, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-11-01', 4, 1),
(41466, 'onepunchman', 'OP227-S48', '227 Coupon', 'One Punch Man', 0, 370727, 385556, 381849, 381849, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-11-01', 4, 1),
(41467, 'onepunchman', 'OP362-S1', '362 Coupon', 'One Punch Man', 0, 575519, 598540, 592785, 592785, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-11-01', 4, 1),
(41468, 'onepunchman', 'OP904-S1', '904 Coupon', 'One Punch Man', 0, 1438798, 1496350, 1481962, 1481962, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-11-01', 4, 1),
(41469, 'picsartpro', 'PICSARTGOLD3BLN-S1', 'PicsArt Gold [ 3 Bulan ]', 'PicsArt Pro', 0, 8750, 8750, 8750, 8750, 0, 0, 0, 'picsart_pro.png', '', 1, '2023-11-01', 4, 1),
(41470, 'pubgmglobal', 'PUBGMGLOBAL60-S11', '60 UC (60 + 0)', 'PUBGM GLOBAL', 0, 12944, 12944, 12944, 12944, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41471, 'pubgmglobal', 'PUBGMGLOBAL120-S11', '120 UC (120 + 0)', 'PUBGM GLOBAL', 0, 25889, 25889, 25889, 25889, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41472, 'pubgmglobal', 'PUBGMGLOBAL180-S11', '180 UC (180 + 0)', 'PUBGM GLOBAL', 0, 38833, 38833, 38833, 38833, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41473, 'pubgmglobal', 'PUBGMGLOBAL240-S11', '240 UC (240 + 0)', 'PUBGM GLOBAL', 0, 51777, 51777, 51777, 51777, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41474, 'pubgmglobal', 'PUBGMGLOBAL325-S11', '325 UC (300 + 25)', 'PUBGM GLOBAL', 0, 65244, 65244, 65244, 65244, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41475, 'pubgmglobal', 'PUBGMGLOBAL385-S11', '385 UC (360 + 25)', 'PUBGM GLOBAL', 0, 78189, 78189, 78189, 78189, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41476, 'pubgmglobal', 'PUBGMGLOBAL445-S11', '445 UC (420 + 25)', 'PUBGM GLOBAL', 0, 91133, 91133, 91133, 91133, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41477, 'pubgmglobal', 'PUBGMGLOBAL505-S11', '505 UC (480 + 25)', 'PUBGM GLOBAL', 0, 104077, 104077, 104077, 104077, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41478, 'pubgmglobal', 'PUBGMGLOBAL650-S11', '650 UC (600 + 50)', 'PUBGM GLOBAL', 0, 130489, 130489, 130489, 130489, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41479, 'pubgmglobal', 'PUBGMGLOBAL660-S11', '660 UC (600 + 60)', 'PUBGM GLOBAL', 0, 130619, 130619, 130619, 130619, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41480, 'pubgmglobal', 'PUBGMGLOBAL-720S11', '720 UC (600  + 120)', 'PUBGM GLOBAL', 0, 143564, 143564, 143564, 143564, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41481, 'pubgmglobal', 'PUBGMGLOBAL975-S11', '975 UC (900 + 75)', 'PUBGM GLOBAL', 0, 195733, 195733, 195733, 195733, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41482, 'pubgmglobal', 'PUBGMGLOBAL985-S11', '985 UC (900 +  85)', 'PUBGM GLOBAL', 0, 195864, 195864, 195864, 195864, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41483, 'pubgmglobal', 'PUBGMGLOBAL1045-S11', '1045 UC (950 +85)', 'PUBGM GLOBAL', 0, 208808, 208808, 208808, 208808, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41484, 'pubgmglobal', 'PUBGMGLOBAL1320-S11', '1320 UC (1200 + 120)', 'PUBGM GLOBAL', 0, 261239, 261239, 261239, 261239, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41485, 'pubgmglobal', 'PUBGMGLOBAL1800-S11', '1800 UC (1500 + 300)', 'PUBGM GLOBAL', 0, 326744, 326744, 326744, 326744, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41486, 'pubgmglobal', 'PUBGMGLOBAL1860-S11', '1860 UC (1560 + 300)', 'PUBGM GLOBAL', 0, 339689, 339689, 339689, 339689, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41487, 'pubgmglobal', 'PUBGMGLOBAL2125-S11', '2125 UC (1800 + 325)', 'PUBGM GLOBAL', 0, 391989, 391989, 391989, 391989, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41488, 'pubgmglobal', 'PUBGMGLOBAL2460-S11', '2460 UC (2100 + 360)', 'PUBGM GLOBAL', 0, 457364, 457364, 457364, 457364, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41489, 'pubgmglobal', 'PUBGMGLOBAL2785-S11', '2785 UC (2400 + 385)', 'PUBGM GLOBAL', 0, 522608, 522608, 522608, 522608, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41490, 'pubgmglobal', 'PUBGMGLOBALPRM3850-S14', '3850 UC PROMO (3000 + 850)', 'PUBGM GLOBAL', 0, 634980, 634980, 634980, 634980, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41491, 'pubgmglobal', 'PUBGMGLOBAL3850-S11', '3850 UC (3000 + 850)', 'PUBGM GLOBAL', 0, 653619, 653619, 653619, 653619, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41492, 'pubgmglobal', 'PUBGMGLOBAL3925-S11', '3925 UC (3300 + 625)', 'PUBGM GLOBAL', 0, 718733, 718733, 718733, 718733, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41493, 'pubgmglobal', 'PUBGMGLOBAL4500-S11', '4500 UC (3600 + 900)', 'PUBGM GLOBAL', 0, 784108, 784108, 784108, 784108, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41494, 'pubgmglobal', 'PUBGMGLOBAL5650-S11', '5650 UC (4500 + 1150)', 'PUBGM GLOBAL', 0, 980364, 980364, 980364, 980364, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41495, 'pubgmglobal', 'PUBGMGLOBAL6310-S11', '6310 UC (5100 + 1210)', 'PUBGM GLOBAL', 0, 1110983, 1110983, 1110983, 1110983, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41496, 'pubgmglobal', 'PUBGMGLOBALPRM8100-S14', '8100 UC PROMO (6000 + 2100)', 'PUBGM GLOBAL', 0, 1277000, 1277000, 1277000, 1277000, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41497, 'pubgmglobal', 'PUBGMGLOBAL8100-S11', '8100 UC (6000 + 2100)', 'PUBGM GLOBAL', 0, 1307369, 1307369, 1307369, 1307369, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41498, 'pubgmglobal', 'PUBGMGLOBALPRM11950-S14', '11950 UC PROMO (9000 + 2950)', 'PUBGM GLOBAL', 0, 1863000, 1863000, 1863000, 1863000, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-11-01', 4, 1),
(41499, 'pubgmindoa', 'UCPUBGM30-S50A', '30 UC', 'PUBGM INDO A', 0, 5991, 6231, 6171, 6171, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41500, 'pubgmindoa', 'UCPUBGM60-S50A', '60 UC', 'PUBGM INDO A', 0, 11980, 12459, 12339, 12339, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41501, 'pubgmindoa', 'UCPUBGM210_0-S50A', '210 + 0 UC', 'PUBGM INDO A', 0, 41931, 43608, 43189, 43189, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41502, 'pubgmindoa', 'UCPUBGM300_25-S50A', '300 + 25 UC', 'PUBGM INDO A', 0, 60037, 62438, 61838, 61838, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41503, 'pubgmindoa', 'UCPUBGM300_25-S1000', '300 + 25 UC', 'PUBGM INDO A', 0, 62666, 65173, 64546, 64546, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41504, 'pubgmindoa', 'UCPUBGM360_25-S50A', '360 + 25 UC', 'PUBGM INDO A', 0, 72018, 74899, 74179, 74179, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41505, 'pubgmindoa', 'UCPUBGM480_25-S50A', '480 + 25 UC', 'PUBGM INDO A', 0, 95978, 99817, 98857, 98857, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41506, 'pubgmindoa', 'UCPUBGM600_60-S50A', '600 + 60 UC', 'PUBGM INDO A', 0, 119940, 124738, 123538, 123538, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41507, 'pubgmindoa', 'UCPUBGM600_60-S1000', '600 + 60 UC', 'PUBGM INDO A', 0, 125332, 130345, 129092, 129092, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41508, 'pubgmindoa', 'UCPUBGM660_60-S50A', '660 + 60 UC', 'PUBGM INDO A', 0, 131920, 137197, 135878, 135878, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41509, 'pubgmindoa', 'RPPUBGM-S50', 'Upgrade RP', 'PUBGM INDO A', 0, 143900, 149656, 148217, 148217, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41510, 'pubgmindoa', 'UCPUBGM750_60-S50A', '750 + 60 UC', 'PUBGM INDO A', 0, 149890, 155886, 154387, 154387, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41511, 'pubgmindoa', 'UCPUBGM900_75-S50A', '900 + 75 UC', 'PUBGM INDO A', 0, 179977, 187176, 185376, 185376, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41512, 'pubgmindoa', 'UCPUBGM930_85-S50A', '930 + 85 UC', 'PUBGM INDO A', 0, 185967, 193406, 191546, 191546, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41513, 'pubgmindoa', 'UCPUBGM1380_120-S50A', '1380 + 120 UC', 'PUBGM INDO A', 0, 275819, 286852, 284094, 284094, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41514, 'pubgmindoa', 'UCPUBGM1500_300-S50A', '1500 + 300 UC', 'PUBGM INDO A', 0, 299916, 311913, 308913, 308913, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41515, 'pubgmindoa', 'UCPUBGM1500_300-S1000', '1500 + 300 UC', 'PUBGM INDO A', 0, 313331, 325864, 322731, 322731, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41516, 'pubgmindoa', 'UCPUBGM1710_300-S50A', '1710 + 300 UC', 'PUBGM INDO A', 0, 341847, 355521, 352102, 352102, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41517, 'pubgmindoa', 'UCPUBGM1800_325-S50A', '1800 + 325 UC', 'PUBGM INDO A', 0, 359818, 374211, 370613, 370613, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41518, 'pubgmindoa', 'RPELPUBGM-S50', 'Upgrade Elite RP', 'PUBGM INDO A', 0, 367578, 382281, 378605, 378605, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41519, 'pubgmindoa', 'UCPUBGM2100_360-S50A', '2100 + 360 UC', 'PUBGM INDO A', 0, 419856, 436650, 432452, 432452, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41520, 'pubgmindoa', 'UCPUBGM2640_385-S50A', '2640 + 385 UC', 'PUBGM INDO A', 0, 527814, 548927, 543648, 543648, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41521, 'pubgmindoa', 'UCPUBGM3000_850-S50A', '3000 + 850 UC', 'PUBGM INDO A', 0, 599697, 623685, 617688, 617688, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41522, 'pubgmindoa', 'UCPUBGM3000_850-S1000', '3000 + 850 UC', 'PUBGM INDO A', 0, 626661, 651727, 645461, 645461, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41523, 'pubgmindoa', 'UCPUBGM3150_850-S50A', '3150 + 850 UC', 'PUBGM INDO A', 0, 629783, 654974, 648676, 648676, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41524, 'pubgmindoa', 'UCPUBGM4080_935-S50A', '4080 + 935 UC', 'PUBGM INDO A', 0, 815614, 848239, 840082, 840082, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41525, 'pubgmindoa', 'UCPUBGM4830_1175-S50A', '4830 + 1175 UC', 'PUBGM INDO A', 0, 965505, 1004125, 994470, 994470, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41526, 'pubgmindoa', 'UCPUBGM5730_1270-S50A', '5730 + 1270 UC', 'PUBGM INDO A', 0, 1145481, 1191300, 1179845, 1179845, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41527, 'pubgmindoa', 'UCPUBGM6000_2100-S50A', '6000 + 2100 UC', 'PUBGM INDO A', 0, 1199393, 1247369, 1235375, 1235375, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41528, 'pubgmindoa', 'UCPUBGM6000_2100-S1000', '6000 + 2100 UC', 'PUBGM INDO A', 0, 1253322, 1303455, 1290922, 1290922, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41529, 'pubgmindoa', 'UCPUBGM9000_2950-S50A', '9000 + 2950 UC', 'PUBGM INDO A', 0, 1799226, 1871195, 1853203, 1853203, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41530, 'pubgmindoa', 'UCPUBGM12000_4200-S50A', '12000 + 4200 UC', 'PUBGM INDO A', 0, 2398921, 2494878, 2470889, 2470889, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41531, 'pubgmindoa', 'UCPUBGM18000_6300-S50A', '18000 + 6300 UC', 'PUBGM INDO A', 0, 3598314, 3742247, 3706263, 3706263, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41532, 'pubgmindoa', 'UCPUBGM24000_8400-S50A', '24000 + 8400 UC', 'PUBGM INDO A', 0, 4797843, 4989757, 4941778, 4941778, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41533, 'pubgmindoa', 'UCPUBGM30000_10500-S50A', '30000 + 10500 UC', 'PUBGM INDO A', 0, 5997236, 6237125, 6177153, 6177153, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41534, 'pubgmindoa', 'UCPUBGM36000_12600-S50A', '36000 + 12600 UC', 'PUBGM INDO A', 0, 7196764, 7484635, 7412667, 7412667, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41535, 'pubgmindoa', 'UCPUBGM42000_14700-S50A', '42000 + 14700 UC', 'PUBGM INDO A', 0, 8396157, 8732003, 8648042, 8648042, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41536, 'pubgmindoa', 'UCPUBGM48000_16800-S50A', '48000 + 16800 UC', 'PUBGM INDO A', 0, 9595686, 9979513, 9883557, 9883557, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41537, 'pubgmindoa', 'UCPUBGM54000_18900-S50A', '54000 + 18900 UC', 'PUBGM INDO A', 0, 10795079, 11226882, 11118931, 11118931, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41538, 'pubgmindoa', 'UCPUBGM60000_21000-S50A', '60000 + 21000 UC', 'PUBGM INDO A', 0, 11994607, 12474391, 12354445, 12354445, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-11-01', 4, 1),
(41539, 'ragnarokmeternallove', 'ROM6-S50', '6 BCC', 'Ragnarok M Eternal Love', 0, 11708, 11708, 11708, 11708, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-11-01', 4, 1),
(41540, 'ragnarokmeternallove', 'ROM12-S50', '12 BCC', 'Ragnarok M Eternal Love', 0, 26275, 26275, 26275, 26275, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-11-01', 4, 1),
(41541, 'ragnarokmeternallove', 'ROM18-S50', '18 BCC', 'Ragnarok M Eternal Love', 0, 39480, 39480, 39480, 39480, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-11-01', 4, 1),
(41542, 'ragnarokmeternallove', 'ROM24-S50', '24 BCC', 'Ragnarok M Eternal Love', 0, 52687, 52687, 52687, 52687, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-11-01', 4, 1),
(41543, 'ragnarokmeternallove', 'ROM30-S50', '36 BCC (S)', 'Ragnarok M Eternal Love', 0, 60037, 60037, 60037, 60037, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-11-01', 4, 1),
(41544, 'ragnarokmeternallove', 'ROMPREMI-S50', 'Premium', 'Ragnarok M Eternal Love', 0, 94753, 94753, 94753, 94753, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-11-01', 4, 1),
(41545, 'ragnarokmeternallove', 'ROM72-S50', '72 BCC', 'Ragnarok M Eternal Love', 0, 120348, 120348, 120348, 120348, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-11-01', 4, 1),
(41546, 'ragnarokmeternallove', 'ROM90-S50', '90 BCC', 'Ragnarok M Eternal Love', 0, 159556, 159556, 159556, 159556, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-11-01', 4, 1),
(41547, 'ragnarokmeternallove', 'ROM120-S50', '145 BCC (M)', 'Ragnarok M Eternal Love', 0, 239062, 239062, 239062, 239062, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-11-01', 4, 1),
(41548, 'ragnarokmeternallove', 'ROM300-S27', '373 BCC (L)', 'Ragnarok M Eternal Love', 0, 576030, 576030, 576030, 576030, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-11-01', 4, 1),
(41549, 'ragnarokmeternallove', 'ROM298-S50', '373 BCC (L)', 'Ragnarok M Eternal Love', 0, 603236, 603236, 603236, 603236, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-11-01', 4, 1),
(41550, 'ragnarokmeternallove', 'ROM598-S50', '748 BCC (XL)', 'Ragnarok M Eternal Love', 0, 1204293, 1204293, 1204293, 1204293, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-11-01', 4, 1),
(41551, 'ragnarokmeternallove', 'ROM929-S50', '929 BCC (S-M-XL)', 'Ragnarok M Eternal Love', 0, 1503394, 1503394, 1503394, 1503394, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-11-01', 4, 1),
(41552, 'ragnarokmeternallove', 'ROM1496-S50', '1496 BCC', 'Ragnarok M Eternal Love', 0, 2152099, 2152099, 2152099, 2152099, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-11-01', 4, 1),
(41553, 'ragnarokmeternallove', 'ROMALLBCC-S50', 'All Pack BCC', 'Ragnarok M Eternal Love', 0, 2253252, 2253252, 2253252, 2253252, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-11-01', 4, 1),
(41554, 'ragnarokorigin', 'ROOGLOBAL40-S78', '40 Nyan Berry', 'Ragnarok Origin', 0, 12742, 12742, 12742, 12742, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-11-01', 4, 1),
(41555, 'ragnarokorigin', 'ROOGLOBAL125-S78', '125 Nyan Berry', 'Ragnarok Origin', 0, 39075, 39075, 39075, 39075, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-11-01', 4, 1),
(41556, 'ragnarokorigin', 'ROOGLOBAL210-S78', '210 Nyan Berry', 'Ragnarok Origin', 0, 63710, 63710, 63710, 63710, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-11-01', 4, 1),
(41557, 'ragnarokorigin', 'ROOGLOBAL430-S78', '430 Nyan Berry', 'Ragnarok Origin', 0, 128269, 128269, 128269, 128269, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-11-01', 4, 1),
(41558, 'ragnarokorigin', 'ROOGLOBAL900-S78', '900 Nyan Berry', 'Ragnarok Origin', 0, 265033, 265033, 265033, 265033, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-11-01', 4, 1),
(41559, 'ragnarokorigin', 'ROOGLOBAL1025-S78', '1025 Nyan Berry', 'Ragnarok Origin', 0, 304108, 304108, 304108, 304108, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-11-01', 4, 1),
(41560, 'ragnarokorigin', 'ROOGLOBAL2300-S78', '2300 Nyan Berry', 'Ragnarok Origin', 0, 644743, 644743, 644743, 644743, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-11-01', 4, 1),
(41561, 'ragnarokorigin', 'ROOGLOBAL4800-S78', '4800 Nyan Berry', 'Ragnarok Origin', 0, 1243375, 1243375, 1243375, 1243375, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-11-01', 4, 1),
(41562, 'ragnarokorigin', 'ROOGLOBAL4800-S46', '4800 Nyan Berry', 'Ragnarok Origin', 0, 1263675, 1263675, 1263675, 1263675, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-11-01', 4, 1),
(41563, 'ragnarokorigin', 'ROOGLOBAL24000-S78', '4800 Nyan Berry x 5', 'Ragnarok Origin', 0, 6216875, 6216875, 6216875, 6216875, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-11-01', 4, 1),
(41564, 'ragnarokorigin', 'ROOGLOBAL24000-S46', '4800 Nyan Berry x 5', 'Ragnarok Origin', 0, 6318375, 6318375, 6318375, 6318375, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-11-01', 4, 1),
(41565, 'ragnarokorigin', 'ROOGLOBAL48000-S78', '4800 Nyan Berry x 10', 'Ragnarok Origin', 0, 12433750, 12433750, 12433750, 12433750, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-11-01', 4, 1),
(41566, 'ragnarokorigin', 'ROOGLOBAL48000-S46', '4800 Nyan Berry x 10', 'Ragnarok Origin', 0, 12636750, 12636750, 12636750, 12636750, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-11-01', 4, 1),
(41567, 'ragnarokorigin', 'ROOGLOBAL72000-S78', '4800 Nyan Berry x 15', 'Ragnarok Origin', 0, 18650625, 18650625, 18650625, 18650625, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-11-01', 4, 1),
(41568, 'ragnarokorigin', 'ROOGLOBAL76800-S78', '76800 Nyan Berry', 'Ragnarok Origin', 0, 19894000, 19894000, 19894000, 19894000, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-11-01', 4, 1),
(41569, 'ragnarokorigin', 'ROOGLOBAL96000-S78', '4800 Nyan Berry x 20', 'Ragnarok Origin', 0, 24867500, 24867500, 24867500, 24867500, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-11-01', 4, 1),
(41570, 'ragnarokorigin', 'ROOGLOBAL120000-S78', '4800 Nyan Berry x 25', 'Ragnarok Origin', 0, 31084375, 31084375, 31084375, 31084375, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-11-01', 4, 1),
(41571, 'ragnarokorigin', 'ROOGLOBAL144000-S78', '4800 Nyan Berry x 30', 'Ragnarok Origin', 0, 37301250, 37301250, 37301250, 37301250, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-11-01', 4, 1),
(41572, 'ragnarokorigin', 'ROOGLOBAL168000-S78', '4800 Nyan Berry x 35', 'Ragnarok Origin', 0, 43518125, 43518125, 43518125, 43518125, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-11-01', 4, 1),
(41573, 'ragnarokorigin', 'ROOGLOBAL216000-S78', '4800 Nyan Berry x 45', 'Ragnarok Origin', 0, 55951875, 55951875, 55951875, 55951875, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-11-01', 4, 1),
(41574, 'ragnarokorigin', 'ROOGLOBAL240000-S78', '4800 Nyan Berry x 50', 'Ragnarok Origin', 0, 62168750, 62168750, 62168750, 62168750, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-11-01', 4, 1),
(41575, 'ragnarokorigin', 'ROOGLOBAL480000-S78', '4800 Nyan Berry x 100', 'Ragnarok Origin', 0, 124337500, 124337500, 124337500, 124337500, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-11-01', 4, 1),
(41576, 'ragnarokxnextgeneration', 'ROXID2110-S14', '2110 Diamonds', 'RagnaroK X Next Generation', 0, 56113, 58358, 57796, 57796, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-11-01', 4, 1),
(41577, 'ragnarokxnextgeneration', 'ROXIDSPPCK1-S50', 'Razer Rogue Backpack', 'RagnaroK X Next Generation', 0, 127971, 133090, 131810, 131810, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-11-01', 4, 1),
(41578, 'ragnarokxnextgeneration', 'ROXID5220-S14', '5220 Diamonds', 'RagnaroK X Next Generation', 0, 140283, 145894, 144491, 144491, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-11-01', 4, 1),
(41579, 'ragnarokxnextgeneration', 'ROXIDVIPKAFRA-S50', 'VIP - Kafra', 'RagnaroK X Next Generation', 0, 188281, 195812, 193929, 193929, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-11-01', 4, 1),
(41580, 'ragnarokxnextgeneration', 'ROXIDSPPCK2-S50', 'Razer Kraken Kitty - Black', 'RagnaroK X Next Generation', 0, 190732, 198361, 196454, 196454, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-11-01', 4, 1),
(41581, 'ragnarokxnextgeneration', 'ROXIDSPPCK3-S50', 'Razer Kraken Kitty - Pink', 'RagnaroK X Next Generation', 0, 190732, 198361, 196454, 196454, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-11-01', 4, 1),
(41582, 'ragnarokxnextgeneration', 'ROXID8400-S14', '8400 Diamonds', 'RagnaroK X Next Generation', 0, 224453, 233431, 231187, 231187, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-11-01', 4, 1),
(41583, 'ragnarokxnextgeneration', 'ROXID10430-S14', '10430 Diamonds', 'RagnaroK X Next Generation', 0, 280566, 291789, 288983, 288983, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-11-01', 4, 1),
(41584, 'ragnarokxnextgeneration', 'ROXIDVIPKAFRA2-S50', 'VIP - Kafra Telling', 'RagnaroK X Next Generation', 0, 320201, 333009, 329807, 329807, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-11-01', 4, 1),
(41585, 'ragnarokxnextgeneration', 'ROXIDVIPKAFRA3-S50', 'VIP - Kafra Clarice', 'RagnaroK X Next Generation', 0, 519783, 540574, 535376, 535376, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-11-01', 4, 1),
(41586, 'ragnarokxnextgeneration', 'ROXID20830-S14', '20830 Diamonds', 'RagnaroK X Next Generation', 0, 561133, 583578, 577967, 577967, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-11-01', 4, 1),
(41587, 'ragnarokxnextgeneration', 'ROXID31240-S14', '31240 Diamonds', 'RagnaroK X Next Generation', 0, 841699, 875367, 866950, 866950, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-11-01', 4, 1),
(41588, 'ragnarokxnextgeneration', 'ROXID53470-S14', '53470 Diamonds', 'RagnaroK X Next Generation', 0, 1402832, 1458945, 1444917, 1444917, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-11-01', 4, 1),
(41589, 'ragnarokxnextgeneration', 'ROXID231990-S14', '231990 Diamonds', 'RagnaroK X Next Generation', 0, 5414619, 5631204, 5577058, 5577058, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-11-01', 4, 1),
(41590, 'revelationinfinitejourney', 'RVLNMHLWGP1-S26', 'Halloween Giftpack I', 'Revelation Infinite Journey', 0, 2830, 2830, 2830, 2830, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41591, 'revelationinfinitejourney', 'RVLNM40-S81', '40 + 6 Bonus', 'Revelation Infinite Journey', 0, 8501, 8501, 8501, 8501, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41592, 'revelationinfinitejourney', 'RVLNMKB7-S81', 'Kartu Bulanan 7 Hari', 'Revelation Infinite Journey', 0, 8501, 8501, 8501, 8501, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41593, 'revelationinfinitejourney', 'RVLNMPP-S81', 'Newbie Pack', 'Revelation Infinite Journey', 0, 8501, 8501, 8501, 8501, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41594, 'revelationinfinitejourney', 'RVLNMP1TP-S81', 'Webpay Gift - Newbie', 'Revelation Infinite Journey', 0, 8501, 8501, 8501, 8501, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41595, 'revelationinfinitejourney', 'RVLNMBSC-S81M', 'Paket Cloudsong (Basic)', 'Revelation Infinite Journey', 0, 10201, 10201, 10201, 10201, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41596, 'revelationinfinitejourney', 'RVLNM110-S81', '110 + 17 Bonus', 'Revelation Infinite Journey', 0, 21252, 21252, 21252, 21252, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41597, 'revelationinfinitejourney', 'RVLNMSP30GEP-S26', 'Gear Enhancing Pack', 'Revelation Infinite Journey', 0, 25464, 25464, 25464, 25464, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41598, 'revelationinfinitejourney', 'RVLNM230-S81', '230 + 35 Bonus', 'Revelation Infinite Journey', 0, 42503, 42503, 42503, 42503, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41599, 'revelationinfinitejourney', 'RVLNMINT-S81M', 'Paket Cloudsong (Intermediate / Mid)', 'Revelation Infinite Journey', 0, 50154, 50154, 50154, 50154, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41600, 'revelationinfinitejourney', 'RVLNMKBK-S81', 'Kartu Bulanan Klasik', 'Revelation Infinite Journey', 0, 55255, 55255, 55255, 55255, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41601, 'revelationinfinitejourney', 'RVLNMBPC-S81', 'Battle Pass Classic', 'Revelation Infinite Journey', 0, 55255, 55255, 55255, 55255, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41602, 'revelationinfinitejourney', 'RVLNMPD-S81', 'Paket Diskon', 'Revelation Infinite Journey', 0, 55255, 55255, 55255, 55255, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41603, 'revelationinfinitejourney', 'RVLNMHLWGP2-S26', 'Halloween Giftpack II', 'Revelation Infinite Journey', 0, 55645, 55645, 55645, 55645, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41604, 'revelationinfinitejourney', 'RVLNMHLWGP3-S26', 'Halloween Giftpack III', 'Revelation Infinite Journey', 0, 55645, 55645, 55645, 55645, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41605, 'revelationinfinitejourney', 'RVLNMSP30FBP-S26', 'Familiars Bracing Pack', 'Revelation Infinite Journey', 0, 74508, 74508, 74508, 74508, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41606, 'revelationinfinitejourney', 'RVLNM460-S81', '460 + 69 Bonus', 'Revelation Infinite Journey', 0, 85006, 85006, 85006, 85006, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41607, 'revelationinfinitejourney', 'RVLNMKBS-S81', 'Kartu Bulanan Superior', 'Revelation Infinite Journey', 0, 110508, 110508, 110508, 110508, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41608, 'revelationinfinitejourney', 'RVLNMGF-S81', 'Growth Fund', 'Revelation Infinite Journey', 0, 110508, 110508, 110508, 110508, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41609, 'revelationinfinitejourney', 'RVLNMBPS-S81', 'Battle Pass Spesial', 'Revelation Infinite Journey', 0, 110508, 110508, 110508, 110508, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41610, 'revelationinfinitejourney', 'RVLNMPS-S81', 'Paket Spesial', 'Revelation Infinite Journey', 0, 110508, 110508, 110508, 110508, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41611, 'revelationinfinitejourney', 'RVLNMSP30NPP-S26', 'Newbie Promotional Pack', 'Revelation Infinite Journey', 0, 149016, 149016, 149016, 149016, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41612, 'revelationinfinitejourney', 'RVLNM920-S81', '920 + 138 Bonus', 'Revelation Infinite Journey', 0, 170013, 170013, 170013, 170013, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41613, 'revelationinfinitejourney', 'RVLNM1150-S81', '1150 + 173 Bonus', 'Revelation Infinite Journey', 0, 212516, 212516, 212516, 212516, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41614, 'revelationinfinitejourney', 'RVLNMPRMS-S81M', 'Hadiah Dream PREMIERE S', 'Revelation Infinite Journey', 0, 220167, 220167, 220167, 220167, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41615, 'revelationinfinitejourney', 'RVLNM1380-S81', '1380 + 207 Bonus', 'Revelation Infinite Journey', 0, 255019, 255019, 255019, 255019, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41616, 'revelationinfinitejourney', 'RVLNM1610-S81', '1610 + 242 Bonus', 'Revelation Infinite Journey', 0, 297522, 297522, 297522, 297522, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41617, 'revelationinfinitejourney', 'RVLNMDGC-S81M', 'Daily Gift Combo (7 Days)', 'Revelation Infinite Journey', 0, 382528, 382528, 382528, 382528, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41618, 'revelationinfinitejourney', 'RVLNMSP30GUP-S26', 'Gear Upgrading Pack', 'Revelation Infinite Journey', 0, 394232, 394232, 394232, 394232, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41619, 'revelationinfinitejourney', 'RVLNM2300-S81', '2300 + 345 Bonus', 'Revelation Infinite Journey', 0, 425031, 425031, 425031, 425031, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41620, 'revelationinfinitejourney', 'RVLNMDVN-S81M', 'Paket Cloudsong (Divine / Level God)', 'Revelation Infinite Journey', 0, 544040, 544040, 544040, 544040, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41621, 'revelationinfinitejourney', 'RVLNM3220-S81', '3220 + 483 Bonus', 'Revelation Infinite Journey', 0, 595044, 595044, 595044, 595044, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41622, 'revelationinfinitejourney', 'RVLNM4600-S81', '4600 + 690 Bonus', 'Revelation Infinite Journey', 0, 850063, 850063, 850063, 850063, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41623, 'revelationinfinitejourney', 'RVLNMPRML-S81M', 'Hadiah Dream PREMIERE L', 'Revelation Infinite Journey', 0, 1077879, 1077879, 1077879, 1077879, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41624, 'revelationinfinitejourney', 'RVLNMSP30FSP-S26', 'Familiars Strengthen Pack', 'Revelation Infinite Journey', 0, 1216648, 1216648, 1216648, 1216648, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41625, 'revelationinfinitejourney', 'RVLNM9200-S81', '9200 + 1380 Bonus', 'Revelation Infinite Journey', 0, 1700125, 1700125, 1700125, 1700125, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41626, 'revelationinfinitejourney', 'RVLNM23000-S81', '23000 + 3450 Bonus', 'Revelation Infinite Journey', 0, 4250313, 4250313, 4250313, 4250313, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41627, 'revelationinfinitejourney', 'RVLNM115000-S81', '23000 + 3450 Bonus x 5', 'Revelation Infinite Journey', 0, 21251563, 21251563, 21251563, 21251563, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41628, 'revelationinfinitejourney', 'RVLNM230000-S81', '23000 + 3450 Bonus x 10', 'Revelation Infinite Journey', 0, 42503125, 42503125, 42503125, 42503125, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41629, 'revelationinfinitejourney', 'RVLNM575000-S81', '23000 + 3450 Bonus x 25', 'Revelation Infinite Journey', 0, 106257813, 106257813, 106257813, 106257813, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-11-01', 4, 1),
(41630, 'sausageman', 'SM60-S50', '60 Candy', 'Sausage Man', 0, 11650, 12116, 12000, 12000, 15000, 0, 0, 'sausage_man.png', '', 1, '2023-11-01', 4, 1),
(41631, 'sausageman', 'SM180-S50', '180 Candy', 'Sausage Man', 0, 35493, 36913, 36558, 36558, 0, 0, 0, 'sausage_man.png', '', 1, '2023-11-01', 4, 1),
(41632, 'sausageman', 'SM316-S50', '316 Candy', 'Sausage Man', 0, 59335, 61708, 61115, 61115, 0, 0, 0, 'sausage_man.png', '', 1, '2023-11-01', 4, 1),
(41633, 'sausageman', 'SM718-S50', '718 Candy', 'Sausage Man', 0, 118806, 123558, 122370, 122370, 0, 0, 0, 'sausage_man.png', '', 1, '2023-11-01', 4, 1),
(41634, 'sausageman', 'SM1368-S50', '1368 Candy', 'Sausage Man', 0, 237884, 247399, 245021, 245021, 0, 0, 0, 'sausage_man.png', '', 1, '2023-11-01', 4, 1),
(41635, 'sausageman', 'SM2118-S50', '2118 Candy', 'Sausage Man', 0, 354929, 369126, 365577, 365577, 0, 0, 0, 'sausage_man.png', '', 1, '2023-11-01', 4, 1),
(41636, 'sausageman', 'SM3548-S50', '3548 Candy', 'Sausage Man', 0, 593084, 616807, 610877, 610877, 0, 0, 0, 'sausage_man.png', '', 1, '2023-11-01', 4, 1),
(41637, 'sausageman', 'SM7048-S50', '7048 Candy', 'Sausage Man', 0, 1188607, 1236151, 1224265, 1224265, 0, 0, 0, 'sausage_man.png', '', 1, '2023-11-01', 4, 1),
(41638, 'steamwalletcode', 'STEAM45-S22', 'IDR 45.000 SWC', 'Steam Wallet Code', 0, 44961, 46759, 46310, 46310, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-11-01', 4, 1),
(41639, 'steamwalletcode', 'STEAM60-S22', 'IDR 60.000 SWC', 'Steam Wallet Code', 0, 59949, 62347, 61747, 61747, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-11-01', 4, 1),
(41640, 'steamwalletcode', 'STEAM90-S22', 'IDR 90.000 SWC', 'Steam Wallet Code', 0, 89923, 93520, 92621, 92621, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-11-01', 4, 1),
(41641, 'steamwalletcode', 'STEAM120-S22', 'IDR 120.000 SWC', 'Steam Wallet Code', 0, 119897, 124693, 123494, 123494, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-11-01', 4, 1),
(41642, 'steamwalletcode', 'STEAM250-S22', 'IDR 250.000 SWC', 'Steam Wallet Code', 0, 249676, 259663, 257166, 257166, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-11-01', 4, 1),
(41643, 'steamwalletcode', 'STEAM400-S22', 'IDR 400.000 SWC', 'Steam Wallet Code', 0, 399547, 415529, 411533, 411533, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-11-01', 4, 1),
(41644, 'steamwalletcode', 'STEAM600-S22', 'IDR 600.000 SWC', 'Steam Wallet Code', 0, 599321, 623294, 617301, 617301, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-11-01', 4, 1),
(41645, 'supersus', 'SS100-S1', '100 Golden Star', 'Super Sus', 0, 12700, 13208, 13081, 13081, 0, 0, 0, 'super_sus.png', '', 1, '2023-11-01', 4, 1),
(41646, 'supersus', 'SS300-S1', '300 Golden Star', 'Super Sus', 0, 31750, 33020, 32703, 32703, 0, 0, 0, 'super_sus.png', '', 1, '2023-11-01', 4, 1),
(41647, 'supersus', 'SS520-S1', '520 Golden Star', 'Super Sus', 0, 57150, 59436, 58865, 58865, 0, 0, 0, 'super_sus.png', '', 1, '2023-11-01', 4, 1),
(41648, 'supersus', 'SS2180-S1', '2180 Golden Star', 'Super Sus', 0, 222250, 231140, 228918, 228918, 0, 0, 0, 'super_sus.png', '', 1, '2023-11-01', 4, 1),
(41649, 'supersus', 'SS5600-S1', '5600 Golden Star', 'Super Sus', 0, 571500, 594360, 588645, 588645, 0, 0, 0, 'super_sus.png', '', 1, '2023-11-01', 4, 1),
(41650, 'tiktokmusic', 'TIKTOKMUSICADMIN1BLN-S1', 'Admin FamilyPlan [ 1 BULAN ] [ 5 ANGGOTA ]', 'TikTok Music', 0, 13500, 13500, 13500, 13500, 0, 0, 0, 'tiktok_music.png', '', 1, '2023-11-01', 4, 1),
(41651, 'tomandjerrychase', 'TJ60-S1', '60 Diamonds', 'Tom and Jerry Chase', 0, 14359, 14933, 14790, 14790, 0, 0, 0, 'tom_and_jerry_chase.png', '', 1, '2023-11-01', 4, 1),
(41652, 'tomandjerrychase', 'TJ180-S1', '180 Diamonds', 'Tom and Jerry Chase', 0, 40258, 41868, 41466, 41466, 0, 0, 0, 'tom_and_jerry_chase.png', '', 1, '2023-11-01', 4, 1),
(41653, 'tomandjerrychase', 'TJ300-S1', '300 Diamonds', 'Tom and Jerry Chase', 0, 66156, 68802, 68141, 68141, 0, 0, 0, 'tom_and_jerry_chase.png', '', 1, '2023-11-01', 4, 1),
(41654, 'tomandjerrychase', 'TJ600-S1', '600 Diamonds', 'Tom and Jerry Chase', 0, 135218, 140627, 139275, 139275, 0, 0, 0, 'tom_and_jerry_chase.png', '', 1, '2023-11-01', 4, 1),
(41655, 'tomandjerrychase', 'TJ1200-S1', '1200 Diamonds', 'Tom and Jerry Chase', 0, 273343, 284277, 281543, 281543, 0, 0, 0, 'tom_and_jerry_chase.png', '', 1, '2023-11-01', 4, 1),
(41656, 'tomandjerrychase', 'TJ1800-S1', '1800 Diamonds', 'Tom and Jerry Chase', 0, 417223, 433912, 429740, 429740, 0, 0, 0, 'tom_and_jerry_chase.png', '', 1, '2023-11-01', 4, 1),
(41657, 'tomandjerrychase', 'TJ3000-S1', '3000 Diamonds', 'Tom and Jerry Chase', 0, 690594, 718218, 711312, 711312, 0, 0, 0, 'tom_and_jerry_chase.png', '', 1, '2023-11-01', 4, 1),
(41658, 'tomandjerrychase', 'TJ6000-S1', '6000 Diamonds', 'Tom and Jerry Chase', 0, 1352442, 1406540, 1393015, 1393015, 0, 0, 0, 'tom_and_jerry_chase.png', '', 1, '2023-11-01', 4, 1),
(41659, 'toweroffantasy', '60DM-S50', '60 Tanium', 'Tower of Fantasy', 0, 10891, 11327, 11218, 11218, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-11-01', 4, 1),
(41660, 'toweroffantasy', 'TOFRS-S50', 'Rookie Supplies', 'Tower of Fantasy', 0, 10891, 11327, 11218, 11218, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-11-01', 4, 1),
(41661, 'toweroffantasy', '300DM-S50', '300 Tanium + Dark Crystal 20', 'Tower of Fantasy', 0, 56090, 58334, 57773, 57773, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-11-01', 4, 1),
(41662, 'toweroffantasy', 'TOFAP-S50', 'Adventure Pack', 'Tower of Fantasy', 0, 56090, 58334, 57773, 57773, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-11-01', 4, 1),
(41663, 'toweroffantasy', 'TOFMP-S50', 'Monthly Pass', 'Tower of Fantasy', 0, 56090, 58334, 57773, 57773, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-11-01', 4, 1),
(41664, 'toweroffantasy', 'TOFBP-S50', 'Basic Pass', 'Tower of Fantasy', 0, 112588, 117092, 115966, 115966, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-11-01', 4, 1),
(41665, 'toweroffantasy', 'TOFUP-S50', 'Upgrade Pass', 'Tower of Fantasy', 0, 123887, 128842, 127604, 127604, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-11-01', 4, 1),
(41666, 'toweroffantasy', '980DM-S50', '980 Tanium + Dark Crystal 110', 'Tower of Fantasy', 0, 169086, 175849, 174159, 174159, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-11-01', 4, 1),
(41667, 'toweroffantasy', 'TOFCEP-S50', 'Collectors Edition Pass', 'Tower of Fantasy', 0, 225584, 234607, 232352, 232352, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-11-01', 4, 1),
(41668, 'toweroffantasy', '1980DM-S50', '1980 Tanium + Dark Crystal 270', 'Tower of Fantasy', 0, 338580, 352123, 348737, 348737, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-11-01', 4, 1),
(41669, 'toweroffantasy', '3280DM-S50', '3280 Tanium + Dark Crystal 530', 'Tower of Fantasy', 0, 602692, 626800, 620773, 620773, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-11-01', 4, 1),
(41670, 'toweroffantasy', '6480DM-S50', '6480 Tanium + Dark Crystal 1300', 'Tower of Fantasy', 0, 1129961, 1175159, 1163860, 1163860, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-11-01', 4, 1),
(41671, 'toweroffantasy', '9980DM-S50', '9980 Tanium + Dark Crystal 2520', 'Tower of Fantasy', 0, 1694942, 1762740, 1745790, 1745790, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-11-01', 4, 1),
(41672, 'toweroffantasy', '12980DM-S50', '12980 Tanium + Dark Crystal 3520', 'Tower of Fantasy', 0, 2222212, 2311100, 2288878, 2288878, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-11-01', 4, 1),
(41673, 'toweroffantasy', 'TOFALL-S50', 'All Pack Tanium + Dark Crystal', 'Tower of Fantasy', 0, 2307299, 2399591, 2376518, 2376518, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-11-01', 4, 1),
(41674, 'toweroffantasy', '32400DM-S50', '6480 Tanium x 5', 'Tower of Fantasy', 0, 5649807, 5875799, 5819301, 5819301, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-11-01', 4, 1),
(41675, 'toweroffantasy', '64800DM-S50', '6480 Tanium x 10', 'Tower of Fantasy', 0, 11299477, 11751456, 11638461, 11638461, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-11-01', 4, 1),
(41676, 'toweroffantasy', '129600DM-S50', '6480 Tanium x 20', 'Tower of Fantasy', 0, 22598955, 23502913, 23276924, 23276924, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-11-01', 4, 1),
(41677, 'toweroffantasy', '162000DM-S50', '6480 Tanium x 25', 'Tower of Fantasy', 0, 28248761, 29378711, 29096224, 29096224, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-11-01', 4, 1),
(41678, 'toweroffantasy', '324000DM-S50', '6480 Tanium x 50', 'Tower of Fantasy', 0, 56497522, 58757423, 58192448, 58192448, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-11-01', 4, 1),
(41679, 'valorant', 'VAL125-S10', '125 Points', 'Valorant', 0, 13771, 14322, 14184, 14184, 0, 0, 0, 'valorant.png', '', 1, '2023-11-01', 4, 1),
(41680, 'valorant', 'VAL125-S3', '125 Points', 'Valorant', 0, 14619, 15204, 15058, 15058, 0, 0, 0, 'valorant.png', '', 1, '2023-11-01', 4, 1),
(41681, 'valorant', 'VAL420-S10', '420 Points', 'Valorant', 0, 45905, 47741, 47282, 47282, 0, 0, 0, 'valorant.png', '', 1, '2023-11-01', 4, 1),
(41682, 'valorant', 'VAL420-S3', '420 Points', 'Valorant', 0, 48730, 50679, 50192, 50192, 0, 0, 0, 'valorant.png', '', 1, '2023-11-01', 4, 1),
(41683, 'valorant', 'VAL700-S10', '700 Points', 'Valorant', 0, 73447, 76385, 75650, 75650, 80000, 0, 0, 'valorant.png', '', 1, '2023-11-01', 4, 1),
(41684, 'valorant', 'VAL700-S3', '700 Points', 'Valorant', 0, 77968, 81087, 80307, 80307, 0, 0, 0, 'valorant.png', '', 1, '2023-11-01', 4, 1),
(41685, 'valorant', 'VAL1375-S10', '1375 Points', 'Valorant', 0, 137714, 143223, 141845, 141845, 0, 0, 0, 'valorant.png', '', 1, '2023-11-01', 4, 1),
(41686, 'valorant', 'VAL1375-S3', '1375 Points', 'Valorant', 0, 146190, 152038, 150576, 150576, 0, 0, 0, 'valorant.png', '', 1, '2023-11-01', 4, 1),
(41687, 'valorant', 'VAL2400-S10', '2400 Points', 'Valorant', 0, 229523, 238704, 236409, 236409, 0, 0, 0, 'valorant.png', '', 1, '2023-11-01', 4, 1),
(41688, 'valorant', 'VAL2400-S3', '2400 Points', 'Valorant', 0, 243650, 253396, 250960, 250960, 0, 0, 0, 'valorant.png', '', 1, '2023-11-01', 4, 1),
(41689, 'valorant', 'VAL4000-S10', '4000 Points', 'Valorant', 0, 367236, 381925, 378253, 378253, 0, 0, 0, 'valorant.png', '', 1, '2023-11-01', 4, 1),
(41690, 'valorant', 'VAL4000PRM-S5', '4000 Points [PROMO]', 'Valorant', 0, 383680, 399027, 395190, 395190, 0, 0, 0, 'valorant.png', '', 1, '2023-11-01', 4, 1),
(41691, 'valorant', 'VAL4000-S3', '4000 Points', 'Valorant', 0, 389840, 405434, 401535, 401535, 0, 0, 0, 'valorant.png', '', 1, '2023-11-01', 4, 1),
(41692, 'valorant', 'VAL8150-S10', '8150 Points', 'Valorant', 0, 734472, 763851, 756506, 756506, 0, 0, 0, 'valorant.png', '', 1, '2023-11-01', 4, 1),
(41693, 'valorant', 'VAL8150-S3', '8150 Points', 'Valorant', 0, 779680, 810867, 803070, 803070, 0, 0, 0, 'valorant.png', '', 1, '2023-11-01', 4, 1),
(41694, 'viupremium', 'VIU1BLN-S1', 'Private 1 Bulan [ AKUN - 1 DEVICES ]', 'Viu Premium', 0, 8000, 8000, 8000, 8000, 0, 0, 0, 'viu_premium.png', '', 1, '2023-11-01', 4, 1),
(41695, 'viupremium', 'VIU3BLN-S1', 'Private 3 Bulan [ AKUN - 1 DEVICES ]', 'Viu Premium', 0, 13000, 13000, 13000, 13000, 0, 0, 0, 'viu_premium.png', '', 1, '2023-11-01', 4, 1),
(41696, 'viupremium', 'VIU6BLN-S1', 'Private 6 Bulan [ AKUN - 1 DEVICES ]', 'Viu Premium', 0, 19000, 19000, 19000, 19000, 0, 0, 0, 'viu_premium.png', '', 1, '2023-11-01', 4, 1),
(41697, 'voucherpbzepetto', 'VCPB1200-S22', '1200 PB Cash', 'Voucher PB Zepetto', 0, 9034, 9034, 9034, 9034, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-11-01', 4, 1),
(41698, 'voucherpbzepetto', 'VCPB1200-S1000', '1200 PB Cash', 'Voucher PB Zepetto', 0, 9135, 9135, 9135, 9135, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-11-01', 4, 1),
(41699, 'voucherpbzepetto', 'VCPB2400-S22', '2400 PB Cash', 'Voucher PB Zepetto', 0, 18067, 18067, 18067, 18067, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-11-01', 4, 1),
(41700, 'voucherpbzepetto', 'VCPB2400-S1000', '2400 PB Cash', 'Voucher PB Zepetto', 0, 18270, 18270, 18270, 18270, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-11-01', 4, 1),
(41701, 'voucherpbzepetto', 'VCPB12000-S22', '12000 PB Cash', 'Voucher PB Zepetto', 0, 90335, 90335, 90335, 90335, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-11-01', 4, 1),
(41702, 'voucherpbzepetto', 'VCPB12000-S1000', '12000 PB Cash', 'Voucher PB Zepetto', 0, 91350, 91350, 91350, 91350, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-11-01', 4, 1),
(41703, 'voucherpbzepetto', 'VCPB24000-S22', '24000 PB Cash', 'Voucher PB Zepetto', 0, 180670, 180670, 180670, 180670, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-11-01', 4, 1),
(41704, 'voucherpbzepetto', 'VCPB24000-S1000', '24000 PB Cash', 'Voucher PB Zepetto', 0, 182700, 182700, 182700, 182700, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-11-01', 4, 1),
(41705, 'voucherpbzepetto', 'VCPB36000-S22', '36000 PB Cash', 'Voucher PB Zepetto', 0, 271005, 271005, 271005, 271005, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-11-01', 4, 1),
(41706, 'voucherpbzepetto', 'VCPB36000-S1000', '36000 PB Cash', 'Voucher PB Zepetto', 0, 274050, 274050, 274050, 274050, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-11-01', 4, 1),
(41707, 'voucherpbzepetto', 'VCPB60000-S22', '60000 PB Cash', 'Voucher PB Zepetto', 0, 451675, 451675, 451675, 451675, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-11-01', 4, 1),
(41708, 'voucherpbzepetto', 'VCPB60000-S1000', '60000 PB Cash', 'Voucher PB Zepetto', 0, 456750, 456750, 456750, 456750, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-11-01', 4, 1),
(41709, 'voucherpsn', 'VPSNIDR100000-S15', 'PSN IDR 100.000', 'Voucher PSN', 0, 96846, 96846, 96846, 96846, 0, 0, 0, 'voucher_psn.png', '', 1, '2023-11-01', 4, 1),
(41710, 'voucherpsn', 'VPSNIDR300000-S15', 'PSN IDR 300.000', 'Voucher PSN', 0, 290538, 290538, 290538, 290538, 0, 0, 0, 'voucher_psn.png', '', 1, '2023-11-01', 4, 1),
(41711, 'voucherpsn', 'VPSNIDR600000-S15', 'PSN IDR 600.000', 'Voucher PSN', 0, 581075, 581075, 581075, 581075, 0, 0, 0, 'voucher_psn.png', '', 1, '2023-11-01', 4, 1),
(41712, 'voucherpsn', 'VPSNIDR1000000-S15', 'PSN IDR 1.000.000', 'Voucher PSN', 0, 964666, 964666, 964666, 964666, 0, 0, 0, 'voucher_psn.png', '', 1, '2023-11-01', 4, 1),
(41713, 'voucherpsn', 'VPSN1500000IDR-S15', 'PSN IDR 1.500.000', 'Voucher PSN', 0, 1446999, 1446999, 1446999, 1446999, 0, 0, 0, 'voucher_psn.png', '', 1, '2023-11-01', 4, 1),
(41714, 'voucherrazergold', 'RZRGOLD10-S1000', 'Razer Gold 10.000', 'Voucher Razer Gold', 0, 9643, 9643, 9643, 9643, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-11-01', 4, 1),
(41715, 'voucherrazergold', 'RZRGOLD50-S22', 'Razer Gold IDR 50.000', 'Voucher Razer Gold', 0, 47157, 47157, 47157, 47157, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-11-01', 4, 1),
(41716, 'voucherrazergold', 'RZRGOLD50-S1000', 'Razer Gold 50.000', 'Voucher Razer Gold', 0, 48213, 48213, 48213, 48213, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-11-01', 4, 1),
(41717, 'voucherrazergold', 'RZRGOLD100-S22', 'Razer Gold IDR 100.000', 'Voucher Razer Gold', 0, 94314, 94314, 94314, 94314, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-11-01', 4, 1),
(41718, 'voucherrazergold', 'RZRGOLD100-S1000', 'Razer Gold 100.000', 'Voucher Razer Gold', 0, 96425, 96425, 96425, 96425, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-11-01', 4, 1),
(41719, 'voucherrazergold', 'RZRGOLD200-S22', 'Razer Gold IDR 200.000', 'Voucher Razer Gold', 0, 188628, 188628, 188628, 188628, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-11-01', 4, 1),
(41720, 'voucherrazergold', 'RZRGOLD200-S1000', 'Razer Gold 200.000', 'Voucher Razer Gold', 0, 192850, 192850, 192850, 192850, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-11-01', 4, 1);
INSERT INTO `tb_produk` (`cuid`, `slug`, `code`, `title`, `kategori`, `subkategori`, `harga_modal`, `harga_jual`, `harga_reseller`, `harga_h2h`, `harga_coret`, `komisi`, `poin`, `image`, `currency`, `status`, `created_date`, `jenis`, `product_type`) VALUES
(41721, 'voucherrazergold', 'RZRGOLD500-S22', 'Razer Gold IDR 500.000', 'Voucher Razer Gold', 0, 471569, 471569, 471569, 471569, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-11-01', 4, 1),
(41722, 'voucherrazergold', 'RZRGOLD500-S1000', 'Razer Gold 500.000', 'Voucher Razer Gold', 0, 482125, 482125, 482125, 482125, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-11-01', 4, 1),
(41723, 'voucherrazergold', 'RZRGOLD1000-S22', 'Razer Gold IDR 1.000.000', 'Voucher Razer Gold', 0, 943138, 943138, 943138, 943138, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-11-01', 4, 1),
(41724, 'voucherrazergold', 'RZRGOLD1000-S1000', 'Razer Gold 1.000.000', 'Voucher Razer Gold', 0, 964250, 964250, 964250, 964250, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-11-01', 4, 1),
(41725, 'voucherroblox', 'ROB800-S22', '800 Robux', 'Voucher Roblox', 0, 152542, 152542, 152542, 152542, 0, 0, 0, 'voucher_roblox.png', '', 1, '2023-11-01', 4, 1),
(41726, 'voucherroblox', 'ROB1200-S22', '1200 Robux', 'Voucher Roblox', 0, 249111, 249111, 249111, 249111, 0, 0, 0, 'voucher_roblox.png', '', 1, '2023-11-01', 4, 1),
(41727, 'voucherroblox', 'ROB1700-S22', '1700 Robux', 'Voucher Roblox', 0, 334199, 334199, 334199, 334199, 0, 0, 0, 'voucher_roblox.png', '', 1, '2023-11-01', 4, 1),
(41728, 'voucherroblox', 'ROB2000-S22', '2000 Robux', 'Voucher Roblox', 0, 365979, 365979, 365979, 365979, 0, 0, 0, 'voucher_roblox.png', '', 1, '2023-11-01', 4, 1),
(41729, 'voucherroblox', 'ROB4500-S22', '4500 Robux', 'Voucher Roblox', 0, 762712, 762712, 762712, 762712, 0, 0, 0, 'voucher_roblox.png', '', 1, '2023-11-01', 4, 1),
(41730, 'voucherroblox', 'ROB10000-S22', '10000 Robux', 'Voucher Roblox', 0, 1525423, 1525423, 1525423, 1525423, 0, 0, 0, 'voucher_roblox.png', '', 1, '2023-11-01', 4, 1),
(41731, 'vouchervalorant', 'VRC75-S22', 'Riot Cash 75000', 'Voucher Valorant', 0, 71120, 71120, 71120, 71120, 0, 0, 0, 'voucher_valorant.png', '', 1, '2023-11-01', 4, 1),
(41732, 'vouchervalorant', 'VRC359K-S22', 'Riot Cash 359000', 'Voucher Valorant', 0, 340427, 340427, 340427, 340427, 0, 0, 0, 'voucher_valorant.png', '', 1, '2023-11-01', 4, 1),
(41733, 'vouchervalorant', 'VRC739K-S22', 'Riot Cash 739000', 'Voucher Valorant', 0, 700767, 700767, 700767, 700767, 0, 0, 0, 'voucher_valorant.png', '', 1, '2023-11-01', 4, 1),
(41734, 'warpplus', 'WARP12PB-S1', 'Warp+ Key [ Limit 12,09 Petabyte ]', 'Warp Plus', 0, 4500, 4500, 4500, 4500, 0, 0, 0, 'warp_plus.png', '', 1, '2023-11-01', 4, 1),
(41735, 'zepeto', 'ZPT7ZEMS-S22', '7 Zems', 'Zepeto', 0, 6926, 7203, 7134, 7134, 0, 0, 0, 'zepeto.png', '', 1, '2023-11-01', 4, 1),
(41736, 'zepeto', 'ZPT14ZEMS-S22', '14 Zems', 'Zepeto', 0, 14009, 14569, 14429, 14429, 0, 0, 0, 'zepeto.png', '', 1, '2023-11-01', 4, 1),
(41737, 'zepeto', 'ZPT4680COINS-S22', '4680 Coins', 'Zepeto', 0, 14009, 14569, 14429, 14429, 0, 0, 0, 'zepeto.png', '', 1, '2023-11-01', 4, 1),
(41738, 'zepeto', 'ZPT29ZEMS-S22', '29 Zems', 'Zepeto', 0, 28049, 29171, 28890, 28890, 0, 0, 0, 'zepeto.png', '', 1, '2023-11-01', 4, 1),
(41739, 'zepeto', 'ZPT10200COINS-S22', '10200 Coins', 'Zepeto', 0, 28049, 29171, 28890, 28890, 0, 0, 0, 'zepeto.png', '', 1, '2023-11-01', 4, 1),
(41740, 'zepeto', 'ZPT60ZEMS-S22', '60 Zems', 'Zepeto', 0, 56129, 58374, 57813, 57813, 0, 0, 0, 'zepeto.png', '', 1, '2023-11-01', 4, 1),
(41741, 'zepeto', 'ZPT21000COINS-S22', '21000 Coins', 'Zepeto', 0, 56129, 58374, 57813, 57813, 0, 0, 0, 'zepeto.png', '', 1, '2023-11-01', 4, 1),
(41742, 'zepeto', 'ZPT38900COINS-S22', '38900 Coins', 'Zepeto', 0, 99809, 103801, 102803, 102803, 0, 0, 0, 'zepeto.png', '', 1, '2023-11-01', 4, 1),
(41743, 'zepeto', 'ZPT125ZEMS-S22', '125 Zems', 'Zepeto', 0, 112289, 116781, 115658, 115658, 0, 0, 0, 'zepeto.png', '', 1, '2023-11-01', 4, 1),
(41744, 'zepeto', 'ZPT62800COINS-S22', '62800 Coins', 'Zepeto', 0, 159089, 165453, 163862, 163862, 0, 0, 0, 'zepeto.png', '', 1, '2023-11-01', 4, 1),
(41745, 'zepeto', 'ZPT196ZEMS-S22', '196 Zems', 'Zepeto', 0, 168449, 175187, 173502, 173502, 0, 0, 0, 'zepeto.png', '', 1, '2023-11-01', 4, 1),
(41746, 'zepeto', 'ZPT234000COINS-S22', '234000 Coins', 'Zepeto', 0, 561569, 584032, 578416, 578416, 0, 0, 0, 'zepeto.png', '', 1, '2023-11-01', 4, 1),
(41747, 'zepeto', 'ZPT770ZEMS-S22', '770 Zems', 'Zepeto', 0, 623969, 648928, 642688, 642688, 0, 0, 0, 'zepeto.png', '', 1, '2023-11-01', 4, 1),
(100002, 'higgsdomino', 'HDIU005', 'UP VIP 5K (FREE 30M)', 'Higgs Domino', 0, 4325, 4500, 4500, 4500, 5000, 0, 0, 'higgs_domino.png', '', 1, '2023-11-06', 6, 1),
(41748, 'aceracer', 'ACE60-S17', '60 + 5 Tokens', 'Ace Racer', 0, 12348, 12842, 12718, 12718, 0, 0, 0, 'ace_racer.png', '', 1, '2023-12-30', 4, 1),
(41749, 'aceracer', 'ACE60-S48', '60 + 5 Tokens', 'Ace Racer', 0, 12145, 12631, 12509, 12509, 0, 0, 0, 'ace_racer.png', '', 1, '2023-12-30', 4, 1),
(41750, 'aceracer', 'ACE250-S17', '250 + 20 Tokens', 'Ace Racer', 0, 50148, 52154, 51652, 51652, 0, 0, 0, 'ace_racer.png', '', 1, '2023-12-30', 4, 1),
(41751, 'aceracer', 'ACE250-S48', '250 + 20 Tokens', 'Ace Racer', 0, 49325, 51298, 50805, 50805, 0, 0, 0, 'ace_racer.png', '', 1, '2023-12-30', 4, 1),
(41752, 'aceracer', 'ACE680-S17', '680 + 60 Tokens', 'Ace Racer', 0, 125748, 130778, 129520, 129520, 0, 0, 0, 'ace_racer.png', '', 1, '2023-12-30', 4, 1),
(41753, 'aceracer', 'ACE680-S48', '680 + 60 Tokens', 'Ace Racer', 0, 123683, 128630, 127393, 127393, 0, 0, 0, 'ace_racer.png', '', 1, '2023-12-30', 4, 1),
(41754, 'aceracer', 'ACE1180-S17', '1180 + 120 Tokens', 'Ace Racer', 0, 226548, 235610, 233344, 233344, 0, 0, 0, 'ace_racer.png', '', 1, '2023-12-30', 4, 1),
(41755, 'aceracer', 'ACE1180-S48', '1180 + 120 Tokens', 'Ace Racer', 0, 222828, 231741, 229513, 229513, 0, 0, 0, 'ace_racer.png', '', 1, '2023-12-30', 4, 1),
(41756, 'aceracer', 'ACE2880-S17', '2880 + 300 Tokens', 'Ace Racer', 0, 577080, 600163, 594392, 594392, 0, 0, 0, 'ace_racer.png', '', 1, '2023-12-30', 4, 1),
(41757, 'aceracer', 'ACE2880-S48', '2880 + 300 Tokens', 'Ace Racer', 0, 567603, 590307, 584631, 584631, 0, 0, 0, 'ace_racer.png', '', 1, '2023-12-30', 4, 1),
(41758, 'aceracer', 'ACE5880-S17', '5880 + 650 Tokens', 'Ace Racer', 0, 1131480, 1176739, 1165424, 1165424, 0, 0, 0, 'ace_racer.png', '', 1, '2023-12-30', 4, 1),
(41759, 'aceracer', 'ACE5880-S48', '5880 + 650 Tokens', 'Ace Racer', 0, 1112900, 1157416, 1146287, 1146287, 0, 0, 0, 'ace_racer.png', '', 1, '2023-12-30', 4, 1),
(41760, 'amazonprimevideo', 'AMZPRIME1P1U-S1', 'Shared 1 Bulan [ 1 PROFILE - 1 USER ]', 'Amazon Prime Video', 0, 5000, 5000, 5000, 5000, 0, 0, 0, 'amazon_prime_video.png', '', 1, '2023-12-30', 4, 1),
(41761, 'amazonprimevideo', 'AMZPRIME5P-S1', 'Private 1 Bulan [ 1 AKUN - 5 PROFILE ]', 'Amazon Prime Video', 0, 14500, 14500, 14500, 14500, 0, 0, 0, 'amazon_prime_video.png', '', 1, '2023-12-30', 4, 1),
(41762, 'applegiftcard', 'GCTV-S1', 'TV Gift Card [ 2 Bulan ]', 'Apple Gift Card', 0, 13500, 13500, 13500, 13500, 0, 0, 0, 'apple_gift_card.png', '', 1, '2023-12-30', 4, 1),
(41763, 'arenabreakout', 'AB60_6-S50', '60 + 6 Bonds', 'Arena Breakout', 0, 13094, 13094, 13094, 13094, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-12-30', 4, 1),
(41764, 'arenabreakout', 'ABBS-S50', 'Beginners select', 'Arena Breakout', 0, 13094, 13094, 13094, 13094, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-12-30', 4, 1),
(41765, 'arenabreakout', 'ABBSC30-S50', 'Bulletproof safety container (30 days)', 'Arena Breakout', 0, 39280, 39280, 39280, 39280, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-12-30', 4, 1),
(41766, 'arenabreakout', 'AB310_25-S50', '310 + 25 Bonds', 'Arena Breakout', 0, 66392, 66392, 66392, 66392, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-12-30', 4, 1),
(41767, 'arenabreakout', 'ABABP-S50', 'Advanced Battle Pass', 'Arena Breakout', 0, 66392, 66392, 66392, 66392, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-12-30', 4, 1),
(41768, 'arenabreakout', 'ABET30-S50', 'Elite trial (30 days) and 300 points', 'Arena Breakout', 0, 66392, 66392, 66392, 66392, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-12-30', 4, 1),
(41769, 'arenabreakout', 'ABCSC-S50', 'Composite safety container (30 days)', 'Arena Breakout', 0, 118766, 118766, 118766, 118766, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-12-30', 4, 1),
(41770, 'arenabreakout', 'AB630_45-S50', '630 + 45 Bonds', 'Arena Breakout', 0, 131860, 131860, 131860, 131860, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-12-30', 4, 1),
(41771, 'arenabreakout', 'ABPBP-S50', 'Premium Battle Pass', 'Arena Breakout', 0, 203939, 203939, 203939, 203939, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-12-30', 4, 1),
(41772, 'arenabreakout', 'AB1580_110-S50', '1580 + 110 Bonds', 'Arena Breakout', 0, 330243, 330243, 330243, 330243, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-12-30', 4, 1),
(41773, 'arenabreakout', 'AB3200_200-S50', '3200 + 200 Bonds', 'Arena Breakout', 0, 664189, 664189, 664189, 664189, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-12-30', 4, 1),
(41774, 'arenabreakout', 'AB6500_320-S50', '6500 + 320 Bonds', 'Arena Breakout', 0, 1318988, 1318988, 1318988, 1318988, 0, 0, 0, 'arena_breakout.png', '', 1, '2023-12-30', 4, 1),
(41775, 'arenaofvalor', 'AOV40-S58', '40 Vouchers', 'Arena of Valor', 0, 8967, 9326, 9236, 9236, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-12-30', 4, 1),
(41776, 'arenaofvalor', 'AOV90-S58', '90 Vouchers', 'Arena of Valor', 0, 17933, 18650, 18471, 18471, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-12-30', 4, 1),
(41777, 'arenaofvalor', 'AOV230-S58', '230 Vouchers', 'Arena of Valor', 0, 44833, 46626, 46178, 46178, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-12-30', 4, 1),
(41778, 'arenaofvalor', 'AOV470-S58', '470 Vouchers', 'Arena of Valor', 0, 89664, 93251, 92354, 92354, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-12-30', 4, 1),
(41779, 'arenaofvalor', 'AOV600-S58', '600 Vouchers', 'Arena of Valor', 0, 116564, 121227, 120061, 120061, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-12-30', 4, 1),
(41780, 'arenaofvalor', 'AOV700-S58', '700 Vouchers', 'Arena of Valor', 0, 134497, 139877, 138532, 138532, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-12-30', 4, 1),
(41781, 'arenaofvalor', 'AOV950-S58', '950 Vouchers', 'Arena of Valor', 0, 179329, 186502, 184709, 184709, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-12-30', 4, 1),
(41782, 'arenaofvalor', 'AOV1030-S58', '1030 Vouchers', 'Arena of Valor', 0, 197261, 205151, 203179, 203179, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-12-30', 4, 1),
(41783, 'arenaofvalor', 'AOV1420-S58', '1420 Vouchers', 'Arena of Valor', 0, 268994, 279754, 277064, 277064, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-12-30', 4, 1),
(41784, 'arenaofvalor', 'AOV1440-S58', '1440 Vouchers', 'Arena of Valor', 0, 277960, 289078, 286299, 286299, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-12-30', 4, 1),
(41785, 'arenaofvalor', 'AOV2360-S58', '2360 Vouchers', 'Arena of Valor', 0, 448323, 466256, 461773, 461773, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-12-30', 4, 1),
(41786, 'arenaofvalor', 'AOV2400-S58', '2400 Vouchers', 'Arena of Valor', 0, 457290, 475582, 471009, 471009, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-12-30', 4, 1),
(41787, 'arenaofvalor', 'AOV3300-S58', '3300 Vouchers', 'Arena of Valor', 0, 627654, 652760, 646484, 646484, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-12-30', 4, 1),
(41788, 'arenaofvalor', 'AOV4810-S58', '4810 Vouchers', 'Arena of Valor', 0, 914581, 951164, 942018, 942018, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-12-30', 4, 1),
(41789, 'arenaofvalor', 'AOV7050-S58', '7050 Vouchers', 'Arena of Valor', 0, 1336006, 1389446, 1376086, 1376086, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-12-30', 4, 1),
(41790, 'arenaofvalor', 'AOV9420-S58', '9420 Vouchers', 'Arena of Valor', 0, 1784329, 1855702, 1837859, 1837859, 0, 0, 0, 'arena_of_valor.png', '', 1, '2023-12-30', 4, 1),
(41791, 'astralguardianscyberfantasy', 'AGCF90D-S14', '90 Diamonds', 'Astral Guardians: Cyber Fantasy', 0, 13875, 13875, 13875, 13875, 0, 0, 0, 'astral_guardians:_cyber_fantasy.png', '', 1, '2023-12-30', 4, 1),
(41792, 'astralguardianscyberfantasy', 'AGCF450D-S14', '450 Diamonds', 'Astral Guardians: Cyber Fantasy', 0, 69489, 69489, 69489, 69489, 0, 0, 0, 'astral_guardians:_cyber_fantasy.png', '', 1, '2023-12-30', 4, 1),
(41793, 'astralguardianscyberfantasy', 'AGCF900-S14', '900 Diamonds', 'Astral Guardians: Cyber Fantasy', 0, 140456, 140456, 140456, 140456, 0, 0, 0, 'astral_guardians:_cyber_fantasy.png', '', 1, '2023-12-30', 4, 1),
(41794, 'astralguardianscyberfantasy', 'AGCF1350-S14', '1350 Diamonds', 'Astral Guardians: Cyber Fantasy', 0, 209973, 209973, 209973, 209973, 0, 0, 0, 'astral_guardians:_cyber_fantasy.png', '', 1, '2023-12-30', 4, 1),
(41795, 'astralguardianscyberfantasy', 'AGCF1840-S14', '1840 Diamonds', 'Astral Guardians: Cyber Fantasy', 0, 279491, 279491, 279491, 279491, 0, 0, 0, 'astral_guardians:_cyber_fantasy.png', '', 1, '2023-12-30', 4, 1),
(41796, 'astralguardianscyberfantasy', 'AGCF4800-S14', '4800 Diamonds', 'Astral Guardians: Cyber Fantasy', 0, 698047, 698047, 698047, 698047, 0, 0, 0, 'astral_guardians:_cyber_fantasy.png', '', 1, '2023-12-30', 4, 1),
(41797, 'astralguardianscyberfantasy', 'AGCF9800-S14', '9800 Diamonds', 'Astral Guardians: Cyber Fantasy', 0, 1390330, 1390330, 1390330, 1390330, 0, 0, 0, 'astral_guardians:_cyber_fantasy.png', '', 1, '2023-12-30', 4, 1),
(41798, 'betheking', 'BTK60-S48', '60 Gold', 'Be The King', 0, 12145, 12631, 12509, 12509, 0, 0, 0, 'be_the_king.png', '', 1, '2023-12-30', 4, 1),
(41799, 'betheking', 'BTK60ULT-S48', '60 Ult Tokens', 'Be The King', 0, 12145, 12631, 12509, 12509, 0, 0, 0, 'be_the_king.png', '', 1, '2023-12-30', 4, 1),
(41800, 'betheking', 'BTK60ULT-S1000', '60 Ult Tokens', 'Be The King', 0, 12523, 13024, 12899, 12899, 0, 0, 0, 'be_the_king.png', '', 1, '2023-12-30', 4, 1),
(41801, 'betheking', 'BTK60-S1000', '60 Gold', 'Be The King', 0, 12523, 13024, 12899, 12899, 0, 0, 0, 'be_the_king.png', '', 1, '2023-12-30', 4, 1),
(41802, 'betheking', 'BTK300-S48', '300 Gold', 'Be The King', 0, 61718, 64187, 63570, 63570, 0, 0, 0, 'be_the_king.png', '', 1, '2023-12-30', 4, 1),
(41803, 'betheking', 'BTK300ULT-S48', '300 Ult Tokens', 'Be The King', 0, 61718, 64187, 63570, 63570, 0, 0, 0, 'be_the_king.png', '', 1, '2023-12-30', 4, 1),
(41804, 'betheking', 'BTK300ULT-S1000', '300 Ult Tokens', 'Be The King', 0, 63525, 66066, 65431, 65431, 0, 0, 0, 'be_the_king.png', '', 1, '2023-12-30', 4, 1),
(41805, 'betheking', 'BTK300-S1000', '300 Gold', 'Be The King', 0, 63525, 66066, 65431, 65431, 0, 0, 0, 'be_the_king.png', '', 1, '2023-12-30', 4, 1),
(41806, 'betheking', 'BTK680-S48', '680 Gold', 'Be The King', 0, 123683, 128630, 127393, 127393, 0, 0, 0, 'be_the_king.png', '', 1, '2023-12-30', 4, 1),
(41807, 'betheking', 'BTK680ULT-S48', '680 Ult Tokens', 'Be The King', 0, 123683, 128630, 127393, 127393, 0, 0, 0, 'be_the_king.png', '', 1, '2023-12-30', 4, 1),
(41808, 'betheking', 'BTK680-S1000', '680 Gold', 'Be The King', 0, 127352, 132446, 131173, 131173, 0, 0, 0, 'be_the_king.png', '', 1, '2023-12-30', 4, 1),
(41809, 'betheking', 'BTK680ULT-S1000', '680 Ult Tokens', 'Be The King', 0, 127352, 132446, 131173, 131173, 0, 0, 0, 'be_the_king.png', '', 1, '2023-12-30', 4, 1),
(41810, 'betheking', 'BTK2040-S48', '2040 Gold', 'Be The King', 0, 369314, 384087, 380393, 380393, 0, 0, 0, 'be_the_king.png', '', 1, '2023-12-30', 4, 1),
(41811, 'betheking', 'BTK2040ULT-S48', '2040 Ult Tokens', 'Be The King', 0, 369314, 384087, 380393, 380393, 0, 0, 0, 'be_the_king.png', '', 1, '2023-12-30', 4, 1),
(41812, 'betheking', 'BTK2040-S1000', '2040 Gold', 'Be The King', 0, 369431, 384208, 380514, 380514, 0, 0, 0, 'be_the_king.png', '', 1, '2023-12-30', 4, 1),
(41813, 'betheking', 'BTK2040ULT-S1000', '2040 Ult Tokens', 'Be The King', 0, 369431, 384208, 380514, 380514, 0, 0, 0, 'be_the_king.png', '', 1, '2023-12-30', 4, 1),
(41814, 'betheking', 'BTK3400-S48', '3400 Gold', 'Be The King', 0, 617176, 641863, 635691, 635691, 0, 0, 0, 'be_the_king.png', '', 1, '2023-12-30', 4, 1),
(41815, 'betheking', 'BTK3400ULT-S48', '3400 Ult Tokens', 'Be The King', 0, 617176, 641863, 635691, 635691, 0, 0, 0, 'be_the_king.png', '', 1, '2023-12-30', 4, 1),
(41816, 'betheking', 'BTK3400ULT-S1000', '3400 Ult Tokens', 'Be The King', 0, 617266, 641957, 635784, 635784, 0, 0, 0, 'be_the_king.png', '', 1, '2023-12-30', 4, 1),
(41817, 'betheking', 'BTK3400-S1000', '3400 Gold', 'Be The King', 0, 617266, 641957, 635784, 635784, 0, 0, 0, 'be_the_king.png', '', 1, '2023-12-30', 4, 1),
(41818, 'betheking', 'BTK6800ULT-S48', '6800 Ult Tokens', 'Be The King', 0, 1236830, 1286303, 1273935, 1273935, 0, 0, 0, 'be_the_king.png', '', 1, '2023-12-30', 4, 1),
(41819, 'betheking', 'BTK6800-S48', '6800 Gold', 'Be The King', 0, 1236830, 1286303, 1273935, 1273935, 0, 0, 0, 'be_the_king.png', '', 1, '2023-12-30', 4, 1),
(41820, 'betheking', 'BTK6800-S1000', '6800 Gold', 'Be The King', 0, 1236956, 1286434, 1274065, 1274065, 0, 0, 0, 'be_the_king.png', '', 1, '2023-12-30', 4, 1),
(41821, 'betheking', 'BTK6800ULT-S1000', '6800 Ult Tokens', 'Be The King', 0, 1236956, 1286434, 1274065, 1274065, 0, 0, 0, 'be_the_king.png', '', 1, '2023-12-30', 4, 1),
(41822, 'betheking', 'BTK20400-S48', '20400 Ult Tokens', 'Be The King', 0, 3693141, 3840867, 3803935, 3803935, 0, 0, 0, 'be_the_king.png', '', 1, '2023-12-30', 4, 1),
(41823, 'betheking', 'BTK20400-S1000', '20400 Ult Tokens', 'Be The King', 0, 3693397, 3841133, 3804199, 3804199, 0, 0, 0, 'be_the_king.png', '', 1, '2023-12-30', 4, 1),
(41824, 'blackclovermobile', 'BCM43-S24M', '40 Premium Black Crystals + 3 Black Crystals', 'Black Clover Mobile', 0, 13398, 13398, 13398, 13398, 0, 0, 0, 'black_clover_mobile.png', '', 1, '2023-12-30', 4, 1),
(41825, 'blackclovermobile', 'BCMPSH1-S24M', 'Paket Summon Harian 1', 'Black Clover Mobile', 0, 13398, 13398, 13398, 13398, 0, 0, 0, 'black_clover_mobile.png', '', 1, '2023-12-30', 4, 1),
(41826, 'blackclovermobile', 'BCM225-S24M', '210 Premium Black Crystals + 15 Black Crystals', 'Black Clover Mobile', 0, 66889, 66889, 66889, 66889, 0, 0, 0, 'black_clover_mobile.png', '', 1, '2023-12-30', 4, 1),
(41827, 'blackclovermobile', 'BCMPSH2-S24M', 'Paket Summon Harian 2', 'Black Clover Mobile', 0, 66889, 66889, 66889, 66889, 0, 0, 0, 'black_clover_mobile.png', '', 1, '2023-12-30', 4, 1),
(41828, 'blackclovermobile', 'BCMPSM1-S24M', 'Paket Summon Mingguan 1', 'Black Clover Mobile', 0, 66889, 66889, 66889, 66889, 0, 0, 0, 'black_clover_mobile.png', '', 1, '2023-12-30', 4, 1),
(41829, 'blackclovermobile', 'BCM470-S24M', '425 Premium Black Crystals + 45 Black Crystals', 'Black Clover Mobile', 0, 133676, 133676, 133676, 133676, 0, 0, 0, 'black_clover_mobile.png', '', 1, '2023-12-30', 4, 1),
(41830, 'blackclovermobile', 'BCMPSB1-S24M', 'Paket Summon Bulanan 1', 'Black Clover Mobile', 0, 133676, 133676, 133676, 133676, 0, 0, 0, 'black_clover_mobile.png', '', 1, '2023-12-30', 4, 1),
(41831, 'blackclovermobile', 'BCM980-S24M', '860 Premium Black Crystals + 120 Black Crystals', 'Black Clover Mobile', 0, 267250, 267250, 267250, 267250, 0, 0, 0, 'black_clover_mobile.png', '', 1, '2023-12-30', 4, 1),
(41832, 'blackclovermobile', 'BCMPSM2-S24M', 'Paket Summon Mingguan 2', 'Black Clover Mobile', 0, 267250, 267250, 267250, 267250, 0, 0, 0, 'black_clover_mobile.png', '', 1, '2023-12-30', 4, 1),
(41833, 'blackclovermobile', 'BCM1560-S24M', '1300 Premium Black Crystals + 260 Black Crystals', 'Black Clover Mobile', 0, 400824, 400824, 400824, 400824, 0, 0, 0, 'black_clover_mobile.png', '', 1, '2023-12-30', 4, 1),
(41834, 'blackclovermobile', 'BCMPSB2-S24M', 'Paket Summon Bulanan 2', 'Black Clover Mobile', 0, 400824, 400824, 400824, 400824, 0, 0, 0, 'black_clover_mobile.png', '', 1, '2023-12-30', 4, 1),
(41835, 'blackclovermobile', 'BCM2630-S24M', '2180 Premium Black Crystals + 450 Black Crystals', 'Black Clover Mobile', 0, 667972, 667972, 667972, 667972, 0, 0, 0, 'black_clover_mobile.png', '', 1, '2023-12-30', 4, 1),
(41836, 'blackclovermobile', 'BCM3750-S24M', '3100 Premium Black Crystals + 650 Black Crystals', 'Black Clover Mobile', 0, 935120, 935120, 935120, 935120, 0, 0, 0, 'black_clover_mobile.png', '', 1, '2023-12-30', 4, 1),
(41837, 'blackclovermobile', 'BCM5650-S24M', '4550 Premium Black Crystals + 1100 Black Crystals', 'Black Clover Mobile', 0, 1335842, 1335842, 1335842, 1335842, 0, 0, 0, 'black_clover_mobile.png', '', 1, '2023-12-30', 4, 1),
(41838, 'bloodstrike', 'BST100-S48', '100 Golds', 'Blood Strike', 0, 12086, 12086, 12086, 12086, 0, 0, 0, 'blood_strike.png', '', 1, '2023-12-30', 4, 1),
(41839, 'bloodstrike', 'BST300-S48', '300 Golds', 'Blood Strike', 0, 36749, 36749, 36749, 36749, 0, 0, 0, 'blood_strike.png', '', 1, '2023-12-30', 4, 1),
(41840, 'bloodstrike', 'BST500-S48', '500 Golds', 'Blood Strike', 0, 61414, 61414, 61414, 61414, 0, 0, 0, 'blood_strike.png', '', 1, '2023-12-30', 4, 1),
(41841, 'bloodstrike', 'BST1000-S48', '1000 Golds', 'Blood Strike', 0, 123074, 123074, 123074, 123074, 0, 0, 0, 'blood_strike.png', '', 1, '2023-12-30', 4, 1),
(41842, 'bloodstrike', 'BST2000-S48', '2000 Golds', 'Blood Strike', 0, 246394, 246394, 246394, 246394, 0, 0, 0, 'blood_strike.png', '', 1, '2023-12-30', 4, 1),
(41843, 'bloodstrike', 'BST5000-S48', '5000 Golds', 'Blood Strike', 0, 614136, 614136, 614136, 614136, 0, 0, 0, 'blood_strike.png', '', 1, '2023-12-30', 4, 1),
(41844, 'callofdutymobile', 'CODM31-S15', '31 CP', 'Call of Duty Mobile', 0, 4748, 4938, 4890, 4890, 0, 0, 0, 'call_of_duty_mobile.png', '', 1, '2023-12-30', 4, 1),
(41845, 'callofdutymobile', 'CODM31-S1000', '31 CP', 'Call of Duty Mobile', 0, 4821, 5014, 4966, 4966, 0, 0, 0, 'call_of_duty_mobile.png', '', 1, '2023-12-30', 4, 1),
(41846, 'callofdutymobile', 'CODM62-S15', '62 CP', 'Call of Duty Mobile', 0, 9497, 9877, 9782, 9782, 0, 0, 0, 'call_of_duty_mobile.png', '', 1, '2023-12-30', 4, 1),
(41847, 'callofdutymobile', 'CODM62-S1000', '62 CP', 'Call of Duty Mobile', 0, 9643, 10029, 9932, 9932, 0, 0, 0, 'call_of_duty_mobile.png', '', 1, '2023-12-30', 4, 1),
(41848, 'callofdutymobile', 'CODM127-S15', '127 CP', 'Call of Duty Mobile', 0, 18994, 19754, 19564, 19564, 0, 0, 0, 'call_of_duty_mobile.png', '', 1, '2023-12-30', 4, 1),
(41849, 'callofdutymobile', 'CODM127-S1000', '127 CP', 'Call of Duty Mobile', 0, 19285, 20056, 19864, 19864, 0, 0, 0, 'call_of_duty_mobile.png', '', 1, '2023-12-30', 4, 1),
(41850, 'callofdutymobile', 'CODM381-S15', '381 CP', 'Call of Duty Mobile', 0, 56981, 59260, 58690, 58690, 0, 0, 0, 'call_of_duty_mobile.png', '', 1, '2023-12-30', 4, 1),
(41851, 'callofdutymobile', 'CODM635-S15', '635 CP', 'Call of Duty Mobile', 0, 94969, 98768, 97818, 97818, 0, 0, 0, 'call_of_duty_mobile.png', '', 1, '2023-12-30', 4, 1),
(41852, 'callofdutymobile', 'CODM889-S15', '889 CP', 'Call of Duty Mobile', 0, 132957, 138275, 136946, 136946, 0, 0, 0, 'call_of_duty_mobile.png', '', 1, '2023-12-30', 4, 1),
(41853, 'callofdutymobile', 'CODM1373-S15', '1373 CP', 'Call of Duty Mobile', 0, 189938, 197536, 195636, 195636, 0, 0, 0, 'call_of_duty_mobile.png', '', 1, '2023-12-30', 4, 1),
(41854, 'callofdutymobile', 'CODM1373-S1000', '1373 CP', 'Call of Duty Mobile', 0, 192850, 200564, 198636, 198636, 0, 0, 0, 'call_of_duty_mobile.png', '', 1, '2023-12-30', 4, 1),
(41855, 'callofdutymobile', 'CODM2059-S15', '2059 CP', 'Call of Duty Mobile', 0, 284907, 296303, 293454, 293454, 0, 0, 0, 'call_of_duty_mobile.png', '', 1, '2023-12-30', 4, 1),
(41856, 'callofdutymobile', 'CODM2059-S1000', '2059 CP', 'Call of Duty Mobile', 0, 289275, 300846, 297953, 297953, 0, 0, 0, 'call_of_duty_mobile.png', '', 1, '2023-12-30', 4, 1),
(41857, 'callofdutymobile', 'CODM3564-S15', '3564 CP', 'Call of Duty Mobile', 0, 474845, 493839, 489090, 489090, 0, 0, 0, 'call_of_duty_mobile.png', '', 1, '2023-12-30', 4, 1),
(41858, 'callofdutymobile', 'CODM3564-S1000', '3564 CP', 'Call of Duty Mobile', 0, 482125, 501410, 496589, 496589, 0, 0, 0, 'call_of_duty_mobile.png', '', 1, '2023-12-30', 4, 1),
(41859, 'callofdutymobile', 'CODM7656-S15', '7656 CP', 'Call of Duty Mobile', 0, 949690, 987678, 978181, 978181, 0, 0, 0, 'call_of_duty_mobile.png', '', 1, '2023-12-30', 4, 1),
(41860, 'callofdutymobile', 'CODM7656-S1000', '7656 CP', 'Call of Duty Mobile', 0, 964250, 1002820, 993178, 993178, 0, 0, 0, 'call_of_duty_mobile.png', '', 1, '2023-12-30', 4, 1),
(41861, 'callofdutymobile', 'CODM76560-S15', '76560 CP', 'Call of Duty Mobile', 0, 9496898, 9876774, 9781805, 9781805, 0, 0, 0, 'call_of_duty_mobile.png', '', 1, '2023-12-30', 4, 1),
(41862, 'callofdutymobile', 'CODM76560-S1000', '76560 CP', 'Call of Duty Mobile', 0, 9642500, 10028200, 9931775, 9931775, 0, 0, 0, 'call_of_duty_mobile.png', '', 1, '2023-12-30', 4, 1),
(41863, 'chimeraland', 'CML60A-S50', '60 Amber', 'Chimeraland', 0, 11297, 11749, 11636, 11636, 0, 0, 0, 'chimeraland.png', '', 1, '2023-12-30', 4, 1),
(41864, 'chimeraland', 'CML300A-S50', '300 Amber', 'Chimeraland', 0, 57683, 59990, 59413, 59413, 0, 0, 0, 'chimeraland.png', '', 1, '2023-12-30', 4, 1),
(41865, 'chimeraland', 'CML680A-S50', '680 Amber', 'Chimeraland', 0, 115898, 120534, 119375, 119375, 0, 0, 0, 'chimeraland.png', '', 1, '2023-12-30', 4, 1),
(41866, 'chimeraland', 'CML980A-S50', '980 Amber', 'Chimeraland', 0, 173980, 180939, 179199, 179199, 0, 0, 0, 'chimeraland.png', '', 1, '2023-12-30', 4, 1),
(41867, 'chimeraland', 'CML1980A-S50', '1980 Amber', 'Chimeraland', 0, 348359, 362293, 358810, 358810, 0, 0, 0, 'chimeraland.png', '', 1, '2023-12-30', 4, 1),
(41868, 'chimeraland', 'CML3280A-S50', '3280 Amber', 'Chimeraland', 0, 620028, 644829, 638629, 638629, 0, 0, 0, 'chimeraland.png', '', 1, '2023-12-30', 4, 1),
(41869, 'chimeraland', 'CML5508A-S50', '5180 Amber', 'Chimeraland', 0, 968919, 1007676, 997987, 997987, 0, 0, 0, 'chimeraland.png', '', 1, '2023-12-30', 4, 1),
(41870, 'chimeraland', 'CML6888A-S50', '6480 Amber', 'Chimeraland', 0, 1162703, 1209211, 1197584, 1197584, 0, 0, 0, 'chimeraland.png', '', 1, '2023-12-30', 4, 1),
(41871, 'clashofclans', 'COC80_8-S50', '80 Gems + 8 Bonus', 'Clash of Clans', 0, 12160, 12160, 12160, 12160, 0, 0, 0, 'clash_of_clans.png', '', 1, '2023-12-30', 4, 1),
(41872, 'clashofclans', 'COC500_50-S50', '500 Gems + 50 Bonus', 'Clash of Clans', 0, 61902, 61902, 61902, 61902, 0, 0, 0, 'clash_of_clans.png', '', 1, '2023-12-30', 4, 1),
(41873, 'clashofclans', 'COCGOLDPASS-S50', 'Gold Pass', 'Clash of Clans', 0, 86773, 86773, 86773, 86773, 0, 0, 0, 'clash_of_clans.png', '', 1, '2023-12-30', 4, 1),
(41874, 'clashofclans', 'COC1200_120-S50', '1200 Gems + 120 Bonus', 'Clash of Clans', 0, 123943, 123943, 123943, 123943, 0, 0, 0, 'clash_of_clans.png', '', 1, '2023-12-30', 4, 1),
(41875, 'clashofclans', 'COC2500_250-S50', '2500 Gems + 250 Bonus', 'Clash of Clans', 0, 248161, 248161, 248161, 248161, 0, 0, 0, 'clash_of_clans.png', '', 1, '2023-12-30', 4, 1),
(41876, 'clashofclans', 'COC6500_650-S50', '6500 Gems + 650 Bonus', 'Clash of Clans', 0, 618745, 618745, 618745, 618745, 0, 0, 0, 'clash_of_clans.png', '', 1, '2023-12-30', 4, 1),
(41877, 'clashofclans', 'COC14000_1400-S50', '14000 Gems + 1400 Bonus', 'Clash of Clans', 0, 1239840, 1239840, 1239840, 1239840, 0, 0, 0, 'clash_of_clans.png', '', 1, '2023-12-30', 4, 1),
(41878, 'dragonraja', 'DR66-S48', '66 Coupon', 'Dragon Raja', 0, 12393, 12889, 12765, 12765, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-12-30', 4, 1),
(41879, 'dragonraja', 'DR76-S14', '76 Coupon', 'Dragon Raja', 0, 14554, 15136, 14991, 14991, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-12-30', 4, 1),
(41880, 'dragonraja', 'DR264-S48', '264 Coupon', 'Dragon Raja', 0, 49573, 51556, 51060, 51060, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-12-30', 4, 1),
(41881, 'dragonraja', 'DR456-S14', '456 Coupon', 'Dragon Raja', 0, 87326, 90819, 89946, 89946, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-12-30', 4, 1),
(41882, 'dragonraja', 'DR820-S14', '820 Coupon', 'Dragon Raja', 0, 145543, 151365, 149909, 149909, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-12-30', 4, 1),
(41883, 'dragonraja', 'DR1098-S48', '1098 Coupon', 'Dragon Raja', 0, 185896, 193332, 191473, 191473, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-12-30', 4, 1),
(41884, 'dragonraja', 'DRIF1-S48', 'Investment Fund', 'Dragon Raja', 0, 185896, 193332, 191473, 191473, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-12-30', 4, 1),
(41885, 'dragonraja', 'DRIF1-S14', 'Investment Fund', 'Dragon Raja', 0, 189205, 196773, 194881, 194881, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-12-30', 4, 1),
(41886, 'dragonraja', 'DRIF2-S48', 'Investment Fund II', 'Dragon Raja', 0, 247862, 257776, 255298, 255298, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-12-30', 4, 1),
(41887, 'dragonraja', 'DRIF2-S14', 'Investment Fund II', 'Dragon Raja', 0, 261977, 272456, 269836, 269836, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-12-30', 4, 1),
(41888, 'dragonraja', 'DR1699-S14', '1699 Coupon', 'Dragon Raja', 0, 291085, 302728, 299818, 299818, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-12-30', 4, 1),
(41889, 'dragonraja', 'DR2246-S48', '2246 Coupon', 'Dragon Raja', 0, 371792, 386664, 382946, 382946, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-12-30', 4, 1),
(41890, 'dragonraja', 'DR3768-S48', '3768 Coupon', 'Dragon Raja', 0, 619654, 644440, 638244, 638244, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-12-30', 4, 1),
(41891, 'dragonraja', 'DR5161-S14', '5161 Coupon', 'Dragon Raja', 0, 873255, 908185, 899453, 899453, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-12-30', 4, 1),
(41892, 'dragonraja', 'DR6860-S14', '6860 Coupon', 'Dragon Raja', 0, 1164340, 1210914, 1199270, 1199270, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-12-30', 4, 1),
(41893, 'dragonraja', 'DR7546-S48', '7546 Coupons', 'Dragon Raja', 0, 1239309, 1288881, 1276488, 1276488, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-12-30', 4, 1),
(41894, 'dragonraja', 'DR9056-S14', '9056 Coupon', 'Dragon Raja', 0, 1455425, 1513642, 1499088, 1499088, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-12-30', 4, 1),
(41895, 'dragonraja', 'DR15092-S48', '15092 Coupons', 'Dragon Raja', 0, 2478619, 2577764, 2552978, 2552978, 0, 0, 0, 'dragon_raja.png', '', 1, '2023-12-30', 4, 1),
(41896, 'dragonheirsilentgods', 'DSGCRYSTAL70-S14', 'Dragon Crystal x 70', 'Dragonheir Silent Gods', 0, 14162, 14162, 14162, 14162, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-12-30', 4, 1),
(41897, 'dragonheirsilentgods', 'DSGEHSC-S14', 'Epic Heroes Selectable Chest (Limited 2)', 'Dragonheir Silent Gods', 0, 14162, 14162, 14162, 14162, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-12-30', 4, 1),
(41898, 'dragonheirsilentgods', 'DSGCRYSTAL350-S14', 'Dragon Crystal x 350', 'Dragonheir Silent Gods', 0, 69987, 69987, 69987, 69987, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-12-30', 4, 1),
(41899, 'dragonheirsilentgods', 'DSGASC-S14', 'Apprentices Secret Collection', 'Dragonheir Silent Gods', 0, 69987, 69987, 69987, 69987, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-12-30', 4, 1),
(41900, 'dragonheirsilentgods', 'DSGDSTE-S14', 'Daily Supply from Three Ears', 'Dragonheir Silent Gods', 0, 69987, 69987, 69987, 69987, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-12-30', 4, 1),
(41901, 'dragonheirsilentgods', 'DSGWMW-S14', 'Wyrmarrow Mining Warrant', 'Dragonheir Silent Gods', 0, 140938, 140938, 140938, 140938, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-12-30', 4, 1),
(41902, 'dragonheirsilentgods', 'DSGHRC-S14', 'Heliolite Rush Chest (Limited 2)', 'Dragonheir Silent Gods', 0, 167612, 167612, 167612, 167612, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-12-30', 4, 1),
(41903, 'dragonheirsilentgods', 'DSGPSP-S14', 'Platinum Sparkling Pack (Limited 2)', 'Dragonheir Silent Gods', 0, 208588, 208588, 208588, 208588, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-12-30', 4, 1),
(41904, 'dragonheirsilentgods', 'DSGCRYSTAL1050-S14', 'Dragon Crystal x 1050', 'Dragonheir Silent Gods', 0, 208450, 208450, 208450, 208450, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-12-30', 4, 1),
(41905, 'dragonheirsilentgods', 'DSGSSC-S14', 'Scholars Secret Collection', 'Dragonheir Silent Gods', 0, 208450, 208450, 208450, 208450, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-12-30', 4, 1),
(41906, 'dragonheirsilentgods', 'DSGWS-S14', 'Walkers Selection (Limited 1)', 'Dragonheir Silent Gods', 0, 274037, 274037, 274037, 274037, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-12-30', 4, 1),
(41907, 'dragonheirsilentgods', 'DSGCRYSTAL2100-S14', 'Dragon Crystal x 2100', 'Dragonheir Silent Gods', 0, 412362, 412362, 412362, 412362, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-12-30', 4, 1),
(41908, 'dragonheirsilentgods', 'DSGCRYSTAL3500-S14', 'Dragon Crystal x 3500', 'Dragonheir Silent Gods', 0, 681862, 681862, 681862, 681862, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-12-30', 4, 1),
(41909, 'dragonheirsilentgods', 'DSGMSC-S14', 'Masters Secret Collection', 'Dragonheir Silent Gods', 0, 681862, 681862, 681862, 681862, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-12-30', 4, 1),
(41910, 'dragonheirsilentgods', 'DSGNSGP-S14', 'New Season Growth Perks (Limited 2)', 'Dragonheir Silent Gods', 0, 681862, 681862, 681862, 681862, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-12-30', 4, 1),
(41911, 'dragonheirsilentgods', 'DSGCRYSTAL7000-S14', 'Dragon Crystal x 7000', 'Dragonheir Silent Gods', 0, 1364688, 1364688, 1364688, 1364688, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-12-30', 4, 1),
(41912, 'dragonheirsilentgods', 'DSGHMC-S14', 'Heliolite Miracle Chest (Limited 2)', 'Dragonheir Silent Gods', 0, 1364688, 1364688, 1364688, 1364688, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-12-30', 4, 1),
(41913, 'dragonheirsilentgods', 'DSGPSC-S14', 'Platinum Splendid Chest (Limited 2)', 'Dragonheir Silent Gods', 0, 1407045, 1407045, 1407045, 1407045, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-12-30', 4, 1),
(41914, 'dragonheirsilentgods', 'DSGCRYSTAL14000-S14', 'Dragon Crystal x 14000', 'Dragonheir Silent Gods', 0, 2729513, 2729513, 2729513, 2729513, 0, 0, 0, 'dragonheir_silent_gods.png', '', 1, '2023-12-30', 4, 1),
(41915, 'dynastywarriorsoverlords', 'DW2_5-S81', '20 + 5 Gold Seal', 'Dynasty Warriors: Overlords', 0, 11038, 11038, 11038, 11038, 0, 0, 0, 'dynasty_warriors:_overlords.png', '', 1, '2023-12-30', 4, 1),
(41916, 'dynastywarriorsoverlords', 'DW50_13-S81', '50 + 13 Gold Seal', 'Dynasty Warriors: Overlords', 0, 26492, 26492, 26492, 26492, 0, 0, 0, 'dynasty_warriors:_overlords.png', '', 1, '2023-12-30', 4, 1),
(41917, 'dynastywarriorsoverlords', 'DW100_25-S81', '100 + 25 Gold Seal', 'Dynasty Warriors: Overlords', 0, 52983, 52983, 52983, 52983, 0, 0, 0, 'dynasty_warriors:_overlords.png', '', 1, '2023-12-30', 4, 1),
(41918, 'dynastywarriorsoverlords', 'DW200_50-S81', '200 + 50 Gold Seal', 'Dynasty Warriors: Overlords', 0, 110381, 110381, 110381, 110381, 0, 0, 0, 'dynasty_warriors:_overlords.png', '', 1, '2023-12-30', 4, 1),
(41919, 'dynastywarriorsoverlords', 'DW500_125-S81', '500 + 125 Gold Seal', 'Dynasty Warriors: Overlords', 0, 286991, 286991, 286991, 286991, 0, 0, 0, 'dynasty_warriors:_overlords.png', '', 1, '2023-12-30', 4, 1),
(41920, 'dynastywarriorsoverlords', 'DW1000_250-S81', '1000 + 250 Gold Seal', 'Dynasty Warriors: Overlords', 0, 573983, 573983, 573983, 573983, 0, 0, 0, 'dynasty_warriors:_overlords.png', '', 1, '2023-12-30', 4, 1),
(41921, 'dynastywarriorsoverlords', 'DW2000_500-S81', '2000 + 500 Gold Seal', 'Dynasty Warriors: Overlords', 0, 1103813, 1103813, 1103813, 1103813, 0, 0, 0, 'dynasty_warriors:_overlords.png', '', 1, '2023-12-30', 4, 1),
(41922, 'dynastywarriorsoverlords', 'DW5000_1250-S81', '5000 + 1250 Gold Seal', 'Dynasty Warriors: Overlords', 0, 2781608, 2781608, 2781608, 2781608, 0, 0, 0, 'dynasty_warriors:_overlords.png', '', 1, '2023-12-30', 4, 1),
(41923, 'dynastywarriorsoverlords', 'DW10000_2500-S81', '10000 + 2500 Gold Seal', 'Dynasty Warriors: Overlords', 0, 5563215, 5563215, 5563215, 5563215, 0, 0, 0, 'dynasty_warriors:_overlords.png', '', 1, '2023-12-30', 4, 1),
(41924, 'easportsfcmobile', 'FCMBL40-S15', '40 FC POINTS', 'EA SPORTS FC Mobile', 0, 6166, 6166, 6166, 6166, 0, 0, 0, 'ea_sports_fc_mobile.png', '', 1, '2023-12-30', 4, 1),
(41925, 'easportsfcmobile', 'FCMBL100-S15', '100 FC POINTS', 'EA SPORTS FC Mobile', 0, 15178, 15178, 15178, 15178, 0, 0, 0, 'ea_sports_fc_mobile.png', '', 1, '2023-12-30', 4, 1),
(41926, 'easportsfcmobile', 'FCMBL520-S15', '520 FC POINTS', 'EA SPORTS FC Mobile', 0, 74945, 74945, 74945, 74945, 0, 0, 0, 'ea_sports_fc_mobile.png', '', 1, '2023-12-30', 4, 1),
(41927, 'easportsfcmobile', 'FCMBL1070-S15', '1070 FC POINTS', 'EA SPORTS FC Mobile', 0, 150838, 150838, 150838, 150838, 0, 0, 0, 'ea_sports_fc_mobile.png', '', 1, '2023-12-30', 4, 1),
(41928, 'easportsfcmobile', 'FCMBL2200-S15', '2200 FC POINTS', 'EA SPORTS FC Mobile', 0, 312113, 312113, 312113, 312113, 0, 0, 0, 'ea_sports_fc_mobile.png', '', 1, '2023-12-30', 4, 1),
(41929, 'easportsfcmobile', 'FCMBL5750-S15', '5750 FC POINTS', 'EA SPORTS FC Mobile', 0, 757987, 757987, 757987, 757987, 0, 0, 0, 'ea_sports_fc_mobile.png', '', 1, '2023-12-30', 4, 1),
(41930, 'easportsfcmobile', 'FCMBL12000-S15', '12000 FC POINTS', 'EA SPORTS FC Mobile', 0, 1516923, 1516923, 1516923, 1516923, 0, 0, 0, 'ea_sports_fc_mobile.png', '', 1, '2023-12-30', 4, 1),
(41931, 'eggyparty', 'EGGPRT10-S50', '10 eggy coins', 'Eggy Party', 0, 1728, 1728, 1728, 1728, 0, 0, 0, 'eggy_party.png', '', 1, '2023-12-30', 4, 1),
(41932, 'eggyparty', 'EGGPRT60-S50', '60 eggy coins', 'Eggy Party', 0, 10899, 10899, 10899, 10899, 0, 0, 0, 'eggy_party.png', '', 1, '2023-12-30', 4, 1),
(41933, 'eggyparty', 'EGGPRTWECP-S50', 'Weekly Egg Coin Pack', 'Eggy Party', 0, 11297, 11297, 11297, 11297, 0, 0, 0, 'eggy_party.png', '', 1, '2023-12-30', 4, 1),
(41934, 'eggyparty', 'EGGPRT120-S50', '120 eggy coins', 'Eggy Party', 0, 21000, 21000, 21000, 21000, 0, 0, 0, 'eggy_party.png', '', 1, '2023-12-30', 4, 1),
(41935, 'eggyparty', 'EGGPRTYM-S50', 'Yoyo Membership', 'Eggy Party', 0, 21664, 21664, 21664, 21664, 0, 0, 0, 'eggy_party.png', '', 1, '2023-12-30', 4, 1),
(41936, 'eggyparty', 'EGGPRTSCJ-S50', 'Shiny Coin Jar', 'Eggy Party', 0, 33095, 33095, 33095, 33095, 0, 0, 0, 'eggy_party.png', '', 1, '2023-12-30', 4, 1),
(41937, 'eggyparty', 'EGGPRT300-S50', '300 eggy coins + 16 Bonus', 'Eggy Party', 0, 53165, 53165, 53165, 53165, 0, 0, 0, 'eggy_party.png', '', 1, '2023-12-30', 4, 1),
(41938, 'eggyparty', 'EGGPRT700-S50', '700 eggy coins + 38 Bonus', 'Eggy Party', 0, 125866, 125866, 125866, 125866, 0, 0, 0, 'eggy_party.png', '', 1, '2023-12-30', 4, 1),
(41939, 'eggyparty', 'EGGPRT1380-S50', '1380 eggy coins + 96 Bonus', 'Eggy Party', 0, 246018, 246018, 246018, 246018, 0, 0, 0, 'eggy_party.png', '', 1, '2023-12-30', 4, 1),
(41940, 'eggyparty', 'EGGPRT2080-S50', '2080 eggy coins + 144 Bonus', 'Eggy Party', 0, 369093, 369093, 369093, 369093, 0, 0, 0, 'eggy_party.png', '', 1, '2023-12-30', 4, 1),
(41941, 'eggyparty', 'EGGPRT3450-S50', '3450 eggy coins + 282 Bonus', 'Eggy Party', 0, 612320, 612320, 612320, 612320, 0, 0, 0, 'eggy_party.png', '', 1, '2023-12-30', 4, 1),
(41942, 'eggyparty', 'EGGPRT6880-S50', '6880 eggy coins + 602 Bonus', 'Eggy Party', 0, 1218924, 1218924, 1218924, 1218924, 0, 0, 0, 'eggy_party.png', '', 1, '2023-12-30', 4, 1),
(41943, 'footballmaster2', 'FM218-S14', '18 FMP', 'Football Master 2', 0, 2897, 2897, 2897, 2897, 0, 0, 0, 'football_master_2.png', '', 1, '2023-12-30', 4, 1),
(41944, 'footballmaster2', 'FM295-S14', '95 FMP', 'Football Master 2', 0, 14483, 14483, 14483, 14483, 0, 0, 0, 'football_master_2.png', '', 1, '2023-12-30', 4, 1),
(41945, 'footballmaster2', 'FM2191-S14', '191 FMP', 'Football Master 2', 0, 28966, 28966, 28966, 28966, 0, 0, 0, 'football_master_2.png', '', 1, '2023-12-30', 4, 1),
(41946, 'footballmaster2', 'FM2382-S14', '382 FMP', 'Football Master 2', 0, 57931, 57931, 57931, 57931, 0, 0, 0, 'football_master_2.png', '', 1, '2023-12-30', 4, 1),
(41947, 'footballmaster2', 'FM2972-S14', '972 FMP', 'Football Master 2', 0, 144829, 144829, 144829, 144829, 0, 0, 0, 'football_master_2.png', '', 1, '2023-12-30', 4, 1),
(41948, 'footballmaster2', 'FM21944-S14', '1944 FMP', 'Football Master 2', 0, 289658, 289658, 289658, 289658, 0, 0, 0, 'football_master_2.png', '', 1, '2023-12-30', 4, 1),
(41949, 'footballmaster2', 'FM23888-S14', '3888 FMP', 'Football Master 2', 0, 579316, 579316, 579316, 579316, 0, 0, 0, 'football_master_2.png', '', 1, '2023-12-30', 4, 1),
(41950, 'footballmaster2', 'FM219800-S14', '19800 FMP', 'Football Master 2', 0, 2896581, 2896581, 2896581, 2896581, 0, 0, 0, 'football_master_2.png', '', 1, '2023-12-30', 4, 1),
(41951, 'freefire', 'FF5-S24', '5 Diamonds', 'Free Fire', 0, 799, 831, 823, 823, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41952, 'freefire', 'FF10-S24', '10 Diamonds', 'Free Fire', 0, 1598, 1662, 1646, 1646, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41953, 'freefire', 'FF50-S24', '50 Diamonds', 'Free Fire', 0, 6390, 6646, 6582, 6582, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41954, 'freefire', 'FF55-S24', '55 Diamonds', 'Free Fire', 0, 7189, 7477, 7405, 7405, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41955, 'freefire', 'FF70-S24', '70 Diamonds', 'Free Fire', 0, 8787, 9138, 9051, 9051, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41956, 'freefire', 'FF80-S24', '80 Diamonds', 'Free Fire', 0, 10385, 10800, 10697, 10697, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41957, 'freefire', 'FF100-S24', '100 Diamonds', 'Free Fire', 0, 12782, 13293, 13165, 13165, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41958, 'freefire', 'FF120-S24', '120 Diamonds', 'Free Fire', 0, 15177, 15784, 15632, 15632, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41959, 'freefire', 'FF130-S24', '130 Diamonds', 'Free Fire', 0, 16775, 17446, 17278, 17278, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41960, 'freefire', 'FF140-S24', '140 Diamonds', 'Free Fire', 0, 17574, 18277, 18101, 18101, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41961, 'freefire', 'FF145-S24', '145 Diamonds', 'Free Fire', 0, 18373, 19108, 18924, 18924, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41962, 'freefire', 'FF150-S24', '150 Diamonds', 'Free Fire', 0, 19172, 19939, 19747, 19747, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41963, 'freefire', 'FF190-S24', '190 Diamonds', 'Free Fire', 0, 23964, 24923, 24683, 24683, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41964, 'freefire', 'FF200-S24', '200 Diamonds', 'Free Fire', 0, 25562, 26584, 26329, 26329, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41965, 'freefire', 'FF210-S24', '210 Diamonds', 'Free Fire', 0, 26361, 27415, 27152, 27152, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41966, 'freefire', 'FFMingguan-S24', 'Member Mingguan', 'Free Fire', 0, 26628, 27693, 27427, 27427, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41967, 'freefire', 'FF280-S24', '280 Diamonds', 'Free Fire', 0, 35148, 36554, 36202, 36202, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41968, 'freefire', 'FF355-S24', '355 Diamonds', 'Free Fire', 0, 43935, 45692, 45253, 45253, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41969, 'freefire', 'FF420-S24', '420 Diamonds', 'Free Fire', 0, 52722, 54831, 54304, 54304, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41970, 'freefire', 'FF500-S24', '500 Diamonds', 'Free Fire', 0, 62308, 64800, 64177, 64177, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41971, 'freefire', 'FF510-S24', '510 Diamonds', 'Free Fire', 0, 63906, 66462, 65823, 65823, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41972, 'freefire', 'FF565-S24', '565 Diamonds', 'Free Fire', 0, 70296, 73108, 72405, 72405, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41973, 'freefire', 'FF635-S24', '635 Diamonds', 'Free Fire', 0, 79083, 82246, 81455, 81455, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41974, 'freefire', 'FFBulanan-S24', 'Member Bulanan', 'Free Fire', 0, 79882, 83077, 82278, 82278, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41975, 'freefire', 'FF720-S68', '720 Diamonds', 'Free Fire', 0, 84840, 88234, 87385, 87385, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41976, 'freefire', 'FF720-S24', '720 Diamonds', 'Free Fire', 0, 87870, 91385, 90506, 90506, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41977, 'freefire', 'FF800-S24', '800 Diamonds', 'Free Fire', 0, 98255, 102185, 101203, 101203, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41978, 'freefire', 'FF860-S24', '860 Diamonds', 'Free Fire', 0, 105444, 109662, 108607, 108607, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41979, 'freefire', 'FF930-S24', '930 Diamonds', 'Free Fire', 0, 114231, 118800, 117658, 117658, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41980, 'freefire', 'FF1000-S24', '1000 Diamonds', 'Free Fire', 0, 123018, 127939, 126709, 126709, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41981, 'freefire', 'FF1050-S24', '1050 Diamonds', 'Free Fire', 0, 129408, 134584, 133290, 133290, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41982, 'freefire', 'FF1075-S24', '1075 Diamonds', 'Free Fire', 0, 131805, 137077, 135759, 135759, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41983, 'freefire', 'FF1080-S24', '1080 Diamonds', 'Free Fire', 0, 132604, 137908, 136582, 136582, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41984, 'freefire', 'FF1450-S68', '1450 Diamonds', 'Free Fire', 0, 169680, 176467, 174770, 174770, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41985, 'freefire', 'FF1450-S24', '1450 Diamonds', 'Free Fire', 0, 177338, 184432, 182658, 182658, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41986, 'freefire', 'FF2200-S24', '2200 Diamonds', 'Free Fire', 0, 270000, 280800, 278100, 278100, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41987, 'freefire', 'FF3640-S24', '3640 Diamonds', 'Free Fire', 0, 445740, 463570, 459112, 459112, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41988, 'freefire', 'FF7290-S24', '7290 Diamonds', 'Free Fire', 0, 878700, 913848, 905061, 905061, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41989, 'freefire', 'FF36500-S24', '36500 Diamonds', 'Free Fire', 0, 4393500, 4569240, 4525305, 4525305, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41990, 'freefire', 'FF73100-S24', '73100 Diamonds', 'Free Fire', 0, 8787000, 9138480, 9050610, 9050610, 0, 0, 0, 'free_fire.png', '', 1, '2023-12-30', 4, 1),
(41991, 'freefiremax', 'FFMAX5-S24', '5 Diamonds', 'Free Fire Max', 0, 799, 831, 823, 823, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(41992, 'freefiremax', 'FFMAX10-S24', '10 Diamonds', 'Free Fire Max', 0, 1598, 1662, 1646, 1646, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(41993, 'freefiremax', 'FFMAX50-S24', '50 Diamonds', 'Free Fire Max', 0, 6390, 6646, 6582, 6582, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(41994, 'freefiremax', 'FFMAX55-S24', '55 Diamonds', 'Free Fire Max', 0, 7189, 7477, 7405, 7405, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(41995, 'freefiremax', 'FFMAX70-S24', '70 Diamonds', 'Free Fire Max', 0, 8787, 9138, 9051, 9051, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(41996, 'freefiremax', 'FFMAX80-S24', '80 Diamonds', 'Free Fire Max', 0, 10385, 10800, 10697, 10697, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(41997, 'freefiremax', 'FFMAX100-S24', '100 Diamonds', 'Free Fire Max', 0, 12782, 13293, 13165, 13165, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(41998, 'freefiremax', 'FFMAX120-S24', '120 Diamonds', 'Free Fire Max', 0, 15177, 15784, 15632, 15632, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(41999, 'freefiremax', 'FFMAX130-S24', '130 Diamonds', 'Free Fire Max', 0, 16775, 17446, 17278, 17278, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42000, 'freefiremax', 'FFMAX140-S24', '140 Diamonds', 'Free Fire Max', 0, 17574, 18277, 18101, 18101, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42001, 'freefiremax', 'FFMAX145-S24', '145 Diamonds', 'Free Fire Max', 0, 18373, 19108, 18924, 18924, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42002, 'freefiremax', 'FFMAX150-S24', '150 Diamonds', 'Free Fire Max', 0, 19172, 19939, 19747, 19747, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42003, 'freefiremax', 'FFMAX190-S24', '190 Diamonds', 'Free Fire Max', 0, 23964, 24923, 24683, 24683, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42004, 'freefiremax', 'FFMAX200-S24', '200 Diamonds', 'Free Fire Max', 0, 25562, 26584, 26329, 26329, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42005, 'freefiremax', 'FFMAX210-S24', '210 Diamonds', 'Free Fire Max', 0, 26361, 27415, 27152, 27152, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42006, 'freefiremax', 'FFMAXMINGGUAN-S24', 'Membership Mingguan', 'Free Fire Max', 0, 26628, 27693, 27427, 27427, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42007, 'freefiremax', 'FFMAX280-S24', '280 Diamonds', 'Free Fire Max', 0, 35148, 36554, 36202, 36202, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42008, 'freefiremax', 'FFMAX355-S24', '355 Diamonds', 'Free Fire Max', 0, 43935, 45692, 45253, 45253, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42009, 'freefiremax', 'FFMAX420-S24', '420 Diamonds', 'Free Fire Max', 0, 52722, 54831, 54304, 54304, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42010, 'freefiremax', 'FFMAX500-S24', '500 Diamonds', 'Free Fire Max', 0, 62308, 64800, 64177, 64177, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42011, 'freefiremax', 'FFMAX510-S24', '510 Diamonds', 'Free Fire Max', 0, 63906, 66462, 65823, 65823, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42012, 'freefiremax', 'FFMAX565-S24', '565 Diamonds', 'Free Fire Max', 0, 70296, 73108, 72405, 72405, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42013, 'freefiremax', 'FFMAX635-S24', '635 Diamonds', 'Free Fire Max', 0, 79083, 82246, 81455, 81455, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42014, 'freefiremax', 'FFMAXBULANAN-S24', 'Membership Bulanan', 'Free Fire Max', 0, 79882, 83077, 82278, 82278, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42015, 'freefiremax', 'FFMAX720-S68', '720 Diamonds', 'Free Fire Max', 0, 84840, 88234, 87385, 87385, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1);
INSERT INTO `tb_produk` (`cuid`, `slug`, `code`, `title`, `kategori`, `subkategori`, `harga_modal`, `harga_jual`, `harga_reseller`, `harga_h2h`, `harga_coret`, `komisi`, `poin`, `image`, `currency`, `status`, `created_date`, `jenis`, `product_type`) VALUES
(42016, 'freefiremax', 'FFMAX720-S24', '720 Diamonds', 'Free Fire Max', 0, 87870, 91385, 90506, 90506, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42017, 'freefiremax', 'FFMAX800-S24', '800 Diamonds', 'Free Fire Max', 0, 98255, 102185, 101203, 101203, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42018, 'freefiremax', 'FFMAX860-S24', '860 Diamonds', 'Free Fire Max', 0, 105444, 109662, 108607, 108607, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42019, 'freefiremax', 'FFMAX930-S24', '930 Diamonds', 'Free Fire Max', 0, 114231, 118800, 117658, 117658, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42020, 'freefiremax', 'FFMAX1000-S24', '1000 Diamonds', 'Free Fire Max', 0, 123018, 127939, 126709, 126709, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42021, 'freefiremax', 'FFMAX1050-S24', '1050 Diamonds', 'Free Fire Max', 0, 129408, 134584, 133290, 133290, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42022, 'freefiremax', 'FFMAX1075-S24', '1075 Diamonds', 'Free Fire Max', 0, 131805, 137077, 135759, 135759, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42023, 'freefiremax', 'FFMAX1080-S24', '1080 Diamonds', 'Free Fire Max', 0, 132604, 137908, 136582, 136582, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42024, 'freefiremax', 'FFMAX1450-S68', '1450 Diamonds', 'Free Fire Max', 0, 169680, 176467, 174770, 174770, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42025, 'freefiremax', 'FFMAX1450-S24', '1450 Diamonds', 'Free Fire Max', 0, 177338, 184432, 182658, 182658, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42026, 'freefiremax', 'FFMAX7290-S24', '7290 Diamonds', 'Free Fire Max', 0, 878700, 913848, 905061, 905061, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42027, 'freefiremax', 'FFMAX36500-S24', '36500 Diamonds', 'Free Fire Max', 0, 4393500, 4569240, 4525305, 4525305, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42028, 'freefiremax', 'FFMAX73100-S24', '73100 Diamonds', 'Free Fire Max', 0, 8787000, 9138480, 9050610, 9050610, 0, 0, 0, 'free_fire_max.png', '', 1, '2023-12-30', 4, 1),
(42029, 'garenaundawn', 'GU80-S97', 'RC 80', 'Garena Undawn', 0, 13635, 13635, 13635, 13635, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-12-30', 4, 1),
(42030, 'garenaundawn', 'GUKM-S24M', 'Kartu Mingguan', 'Garena Undawn', 0, 25562, 25562, 25562, 25562, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-12-30', 4, 1),
(42031, 'garenaundawn', 'GU250-S97', 'RC 250', 'Garena Undawn', 0, 40905, 40905, 40905, 40905, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-12-30', 4, 1),
(42032, 'garenaundawn', 'GUKB-S24M', 'Kartu Bulanan', 'Garena Undawn', 0, 42337, 42337, 42337, 42337, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-12-30', 4, 1),
(42033, 'garenaundawn', 'GU450-S97', 'RC 450', 'Garena Undawn', 0, 68175, 68175, 68175, 68175, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-12-30', 4, 1),
(42034, 'garenaundawn', 'GUGF-S24M', 'Growth Fund', 'Garena Undawn', 0, 84941, 84941, 84941, 84941, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-12-30', 4, 1),
(42035, 'garenaundawn', 'GUEF-S24M', 'Elite Fund (Rebate LV 80)', 'Garena Undawn', 0, 112633, 112633, 112633, 112633, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-12-30', 4, 1),
(42036, 'garenaundawn', 'GUGPPS4-S24M', 'Glory Pass Premium S4', 'Garena Undawn', 0, 124994, 124994, 124994, 124994, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-12-30', 4, 1),
(42037, 'garenaundawn', 'GU920-S97', 'RC 920', 'Garena Undawn', 0, 135441, 135441, 135441, 135441, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-12-30', 4, 1),
(42038, 'garenaundawn', 'GU1850-S97', 'RC 1.850', 'Garena Undawn', 0, 271791, 271791, 271791, 271791, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-12-30', 4, 1),
(42039, 'garenaundawn', 'GU2800-S97', 'RC 2.800', 'Garena Undawn', 0, 408141, 408141, 408141, 408141, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-12-30', 4, 1),
(42040, 'garenaundawn', 'GU4750-S97', 'RC 4.750', 'Garena Undawn', 0, 680841, 680841, 680841, 680841, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-12-30', 4, 1),
(42041, 'garenaundawn', 'GU9600-S97', 'RC 9.600', 'Garena Undawn', 0, 1362591, 1362591, 1362591, 1362591, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-12-30', 4, 1),
(42042, 'garenaundawn', 'GU33000-S97', 'RC 33.000', 'Garena Undawn', 0, 4545000, 4545000, 4545000, 4545000, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-12-30', 4, 1),
(42043, 'garenaundawn', 'GU66500-S97', 'RC 66.500', 'Garena Undawn', 0, 9090000, 9090000, 9090000, 9090000, 0, 0, 0, 'garena_undawn.png', '', 1, '2023-12-30', 4, 1),
(42044, 'genshinimpact', 'GI60-S11', '60 Crystals', 'Genshin Impact', 0, 11024, 11465, 11355, 11355, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-12-30', 4, 1),
(42045, 'genshinimpact', 'GI330-S11', '300+30 Crystals', 'Genshin Impact', 0, 56116, 58361, 57799, 57799, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-12-30', 4, 1),
(42046, 'genshinimpact', 'GIWELKIN-S11', 'Blessing Welkin Moon', 'Genshin Impact', 0, 56116, 58361, 57799, 57799, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-12-30', 4, 1),
(42047, 'genshinimpact', 'GIWELKIN2-S11', 'Blessing Welkin Moon x 2', 'Genshin Impact', 0, 112231, 116720, 115598, 115598, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-12-30', 4, 1),
(42048, 'genshinimpact', 'GIWELKIN3-S11', 'Blessing Welkin Moon x 3', 'Genshin Impact', 0, 168347, 175081, 173397, 173397, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-12-30', 4, 1),
(42049, 'genshinimpact', 'GI1090-S11', '980+110 Crystals', 'Genshin Impact', 0, 168862, 175616, 173928, 173928, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-12-30', 4, 1),
(42050, 'genshinimpact', 'GIWELKIN4-S11', 'Blessing Welkin Moon x 4', 'Genshin Impact', 0, 224462, 233440, 231196, 231196, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-12-30', 4, 1),
(42051, 'genshinimpact', 'GIWELKIN5-S11', 'Blessing Welkin Moon x 5', 'Genshin Impact', 0, 280578, 291801, 288995, 288995, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-12-30', 4, 1),
(42052, 'genshinimpact', 'GI2240-S11', '1980+260 Crystals', 'Genshin Impact', 0, 366160, 380806, 377145, 377145, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-12-30', 4, 1),
(42053, 'genshinimpact', 'GI3940-S11', '3280+600 Crystals', 'Genshin Impact', 0, 563458, 585996, 580362, 580362, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-12-30', 4, 1),
(42054, 'genshinimpact', 'GI8080-S11', '6480+1600 Crystals', 'Genshin Impact', 0, 1127190, 1172278, 1161006, 1161006, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-12-30', 4, 1),
(42055, 'genshinimpact', 'GIALL-S11', 'All Pack Genesis Crystals', 'Genshin Impact', 0, 2292810, 2384522, 2361594, 2361594, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-12-30', 4, 1),
(42056, 'genshinimpact', 'GI40400-S11', '6480+1600 Crystals x 5', 'Genshin Impact', 0, 5635952, 5861390, 5805031, 5805031, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-12-30', 4, 1),
(42057, 'genshinimpact', 'GI80800-S11', '6480+1600 Crystals x 10', 'Genshin Impact', 0, 11271904, 11722780, 11610061, 11610061, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-12-30', 4, 1),
(42058, 'genshinimpact', 'GI121200-S11', '6480+1600 Crystals x 15', 'Genshin Impact', 0, 16907856, 17584170, 17415092, 17415092, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-12-30', 4, 1),
(42059, 'genshinimpact', 'GI161600-S11', '6480+1600 Crystals x 20', 'Genshin Impact', 0, 22543807, 23445559, 23220121, 23220121, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-12-30', 4, 1),
(42060, 'genshinimpact', 'GI202000-S11', '6480 + 1600 Crystals x 25', 'Genshin Impact', 0, 28179759, 29306949, 29025152, 29025152, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-12-30', 4, 1),
(42061, 'genshinimpact', 'GI404000-S11', '6480 + 1600 Crystals x 50', 'Genshin Impact', 0, 56359518, 58613899, 58050304, 58050304, 0, 0, 0, 'genshin_impact.png', '', 1, '2023-12-30', 4, 1),
(42062, 'hayday', 'HYDAY50_5-S50', '50 Diamonds + 5 Bonus', 'Hay Day', 0, 24595, 24595, 24595, 24595, 0, 0, 0, 'hay_day.png', '', 1, '2023-12-30', 4, 1),
(42063, 'hayday', 'HYDAYFP-S50', 'Farm Pass', 'Hay Day', 0, 61902, 61902, 61902, 61902, 0, 0, 0, 'hay_day.png', '', 1, '2023-12-30', 4, 1),
(42064, 'hayday', 'HYDAY130_13-S50', '130 Diamonds + 13 Bonus', 'Hay Day', 0, 61902, 61902, 61902, 61902, 0, 0, 0, 'hay_day.png', '', 1, '2023-12-30', 4, 1),
(42065, 'hayday', 'HYDAY275_28-S50', '275 Diamonds + 28 Bonus', 'Hay Day', 0, 123943, 123943, 123943, 123943, 0, 0, 0, 'hay_day.png', '', 1, '2023-12-30', 4, 1),
(42066, 'hayday', 'HYDAY570_57-S50', '570 Diamonds + 57 Bonus', 'Hay Day', 0, 248161, 248161, 248161, 248161, 0, 0, 0, 'hay_day.png', '', 1, '2023-12-30', 4, 1),
(42067, 'hayday', 'HYDAY1500_150-S50', '1500 Diamonds + 150 Bonus', 'Hay Day', 0, 494526, 494526, 494526, 494526, 0, 0, 0, 'hay_day.png', '', 1, '2023-12-30', 4, 1),
(42068, 'hayday', 'HYDAY4000_400-S50', '4000 Diamonds + 400 Bonus', 'Hay Day', 0, 1239840, 1239840, 1239840, 1239840, 0, 0, 0, 'hay_day.png', '', 1, '2023-12-30', 4, 1),
(42069, 'honkaiimpact3', 'HKI65B-S70', '65 B-Chips', 'Honkai Impact 3', 0, 14441, 15019, 14874, 14874, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-12-30', 4, 1),
(42070, 'honkaiimpact3', 'HKI65-S70', '65 Crystals', 'Honkai Impact 3', 0, 14441, 15019, 14874, 14874, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-12-30', 4, 1),
(42071, 'honkaiimpact3', 'HKI65B-S18', '65 B-Chips', 'Honkai Impact 3', 0, 15709, 16337, 16180, 16180, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-12-30', 4, 1),
(42072, 'honkaiimpact3', 'HKI65-S18', '65 Crystals', 'Honkai Impact 3', 0, 15709, 16337, 16180, 16180, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-12-30', 4, 1),
(42073, 'honkaiimpact3', 'HKI330B-S70', '330 B-Chips', 'Honkai Impact 3', 0, 73516, 76457, 75721, 75721, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-12-30', 4, 1),
(42074, 'honkaiimpact3', 'HKI330-S70', '330 Crystals', 'Honkai Impact 3', 0, 73516, 76457, 75721, 75721, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-12-30', 4, 1),
(42075, 'honkaiimpact3', 'HKIMC-S70', 'Monthly-Card', 'Honkai Impact 3', 0, 73516, 76457, 75721, 75721, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-12-30', 4, 1),
(42076, 'honkaiimpact3', 'HKI330B-S18', '330 B-Chips', 'Honkai Impact 3', 0, 77117, 80202, 79431, 79431, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-12-30', 4, 1),
(42077, 'honkaiimpact3', 'HKI330-S18', '330 Crystals', 'Honkai Impact 3', 0, 77117, 80202, 79431, 79431, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-12-30', 4, 1),
(42078, 'honkaiimpact3', 'HKIMC-S18', 'Monthly-Card', 'Honkai Impact 3', 0, 77117, 80202, 79431, 79431, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-12-30', 4, 1),
(42079, 'honkaiimpact3', 'HKI710-S70', '710 Crystals', 'Honkai Impact 3', 0, 147033, 152914, 151444, 151444, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-12-30', 4, 1),
(42080, 'honkaiimpact3', 'HKI710-S18', '710 Crystals', 'Honkai Impact 3', 0, 154232, 160401, 158859, 158859, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-12-30', 4, 1),
(42081, 'honkaiimpact3', 'HKI990B-S70', '990 B-Chips', 'Honkai Impact 3', 0, 217924, 226641, 224462, 224462, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-12-30', 4, 1),
(42082, 'honkaiimpact3', 'HKI990B-S18', '990 B-Chips', 'Honkai Impact 3', 0, 242774, 252485, 250057, 250057, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-12-30', 4, 1),
(42083, 'honkaiimpact3', 'HKI1320B-S70', '1320 B-Chips', 'Honkai Impact 3', 0, 291440, 303098, 300183, 300183, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-12-30', 4, 1),
(42084, 'honkaiimpact3', 'HKI1430-S70', '1430 Crystals', 'Honkai Impact 3', 0, 291440, 303098, 300183, 300183, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-12-30', 4, 1),
(42085, 'honkaiimpact3', 'HKI1320B-S18', '1320 B-Chips', 'Honkai Impact 3', 0, 318937, 331694, 328505, 328505, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-12-30', 4, 1),
(42086, 'honkaiimpact3', 'HKI1430-S18', '1430 Crystals', 'Honkai Impact 3', 0, 318937, 331694, 328505, 328505, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-12-30', 4, 1),
(42087, 'honkaiimpact3', 'HKI1980B-S70', '1980 B-Chips', 'Honkai Impact 3', 0, 438472, 456011, 451626, 451626, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-12-30', 4, 1),
(42088, 'honkaiimpact3', 'HKI1980B-S18', '1980 B-Chips', 'Honkai Impact 3', 0, 465553, 484175, 479520, 479520, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-12-30', 4, 1),
(42089, 'honkaiimpact3', 'HKI3300B-S70', '3300 B-Chips', 'Honkai Impact 3', 0, 735161, 764567, 757216, 757216, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-12-30', 4, 1),
(42090, 'honkaiimpact3', 'HKI3860-S70', '3860 Crystals', 'Honkai Impact 3', 0, 735161, 764567, 757216, 757216, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-12-30', 4, 1),
(42091, 'honkaiimpact3', 'HKI3300B-S18', '3300 B-Chips', 'Honkai Impact 3', 0, 775923, 806960, 799201, 799201, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-12-30', 4, 1),
(42092, 'honkaiimpact3', 'HKI3860-S18', '3860 Crystals', 'Honkai Impact 3', 0, 775923, 806960, 799201, 799201, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-12-30', 4, 1),
(42093, 'honkaiimpact3', 'HKI8088-S18', '8088 Crystals', 'Honkai Impact 3', 0, 1550893, 1612929, 1597420, 1597420, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-12-30', 4, 1),
(42094, 'honkaiimpact3', 'HKI6600B-S18', '6600 B-Chips', 'Honkai Impact 3', 0, 1550893, 1612929, 1597420, 1597420, 0, 0, 0, 'honkai_impact_3.png', '', 1, '2023-12-30', 4, 1),
(42095, 'honkaistarrail', 'HSTR60-S11', '60 Oneiric Shard', 'Honkai Star Rail', 0, 14149, 14149, 14149, 14149, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-12-30', 4, 1),
(42096, 'honkaistarrail', 'HSTR300-S11', '300+30 Oneiric Shard', 'Honkai Star Rail', 0, 57386, 57386, 57386, 57386, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-12-30', 4, 1),
(42097, 'honkaistarrail', 'HSTRESP-S11', 'Express Supply Pass', 'Honkai Star Rail', 0, 57386, 57386, 57386, 57386, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-12-30', 4, 1),
(42098, 'honkaistarrail', 'HSTRESPX2-S11', 'Express Supply Pass x 2', 'Honkai Star Rail', 0, 114773, 114773, 114773, 114773, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-12-30', 4, 1),
(42099, 'honkaistarrail', 'HSTRESPX3-S11', 'Express Supply Pass x 3', 'Honkai Star Rail', 0, 172159, 172159, 172159, 172159, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-12-30', 4, 1),
(42100, 'honkaistarrail', 'HSTR980-S11', '980+110 Oneiric Shard', 'Honkai Star Rail', 0, 172743, 172743, 172743, 172743, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-12-30', 4, 1),
(42101, 'honkaistarrail', 'HSTRESPX4-S11', 'Express Supply Pass x 4', 'Honkai Star Rail', 0, 229545, 229545, 229545, 229545, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-12-30', 4, 1),
(42102, 'honkaistarrail', 'HSTRESPX5-S11', 'Express Supply Pass x 5', 'Honkai Star Rail', 0, 286931, 286931, 286931, 286931, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-12-30', 4, 1),
(42103, 'honkaistarrail', 'HSTR1980-S11', '1980+260 Oneiric Shard', 'Honkai Star Rail', 0, 374574, 374574, 374574, 374574, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-12-30', 4, 1),
(42104, 'honkaistarrail', 'HSTR3280-S11', '3280 + 600 Oneiric Shard', 'Honkai Star Rail', 0, 576439, 576439, 576439, 576439, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-12-30', 4, 1),
(42105, 'honkaistarrail', 'HKI3880-S12', '3280 + 600 Oneiric Shard', 'Honkai Star Rail', 0, 581709, 581709, 581709, 581709, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-12-30', 4, 1),
(42106, 'honkaistarrail', 'HSTR6480-S11', '6480 + 1600 Oneiric Shard', 'Honkai Star Rail', 0, 1153119, 1153119, 1153119, 1153119, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-12-30', 4, 1),
(42107, 'honkaistarrail', 'HKI8080-S12', '6480 + 1600 Oneiric Shard', 'Honkai Star Rail', 0, 1163709, 1163709, 1163709, 1163709, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-12-30', 4, 1),
(42108, 'honkaistarrail', 'HSTR32400-S11', '6480 + 1600 Oneiric Shard x 5', 'Honkai Star Rail', 0, 5765595, 5765595, 5765595, 5765595, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-12-30', 4, 1),
(42109, 'honkaistarrail', 'HSTR64800-S11', '6480 + 1600 Oneiric Shard x 10', 'Honkai Star Rail', 0, 11531190, 11531190, 11531190, 11531190, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-12-30', 4, 1),
(42110, 'honkaistarrail', 'HSTR97200-S11', '6480 + 1600 Oneiric Shard x 15', 'Honkai Star Rail', 0, 17296785, 17296785, 17296785, 17296785, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-12-30', 4, 1),
(42111, 'honkaistarrail', 'HSTR129600-S11', '6480 + 1600 Oneiric Shard x 20', 'Honkai Star Rail', 0, 23062379, 23062379, 23062379, 23062379, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-12-30', 4, 1),
(42112, 'honkaistarrail', 'HSTR162000-S11', '6480 + 1600 Oneiric Shard x 25', 'Honkai Star Rail', 0, 28827974, 28827974, 28827974, 28827974, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-12-30', 4, 1),
(42113, 'honkaistarrail', 'HSTR324000-S11', '6480 + 1600 Oneiric Shard x 50', 'Honkai Star Rail', 0, 57655948, 57655948, 57655948, 57655948, 0, 0, 0, 'honkai_star_rail.png', '', 1, '2023-12-30', 4, 1),
(42114, 'honorofkingsglobal', 'HOK16-S50', '16 + 1 Tokens', 'Honor of Kings Global', 0, 2525, 2525, 2525, 2525, 0, 0, 0, 'honor_of_kings_global.png', '', 1, '2023-12-30', 4, 1),
(42115, 'honorofkingsglobal', 'HOK80-S50', '80 + 8 Tokens', 'Honor of Kings Global', 0, 13822, 13822, 13822, 13822, 0, 0, 0, 'honor_of_kings_global.png', '', 1, '2023-12-30', 4, 1),
(42116, 'honorofkingsglobal', 'HOK240-S50', '240 + 17 Tokens', 'Honor of Kings Global', 0, 47449, 47449, 47449, 47449, 0, 0, 0, 'honor_of_kings_global.png', '', 1, '2023-12-30', 4, 1),
(42117, 'honorofkingsglobal', 'HOK400-S50', '400 + 32 Tokens', 'Honor of Kings Global', 0, 78284, 78284, 78284, 78284, 0, 0, 0, 'honor_of_kings_global.png', '', 1, '2023-12-30', 4, 1),
(42118, 'honorofkingsglobal', 'HOK560-S50', '560 + 45 Tokens', 'Honor of Kings Global', 0, 112044, 112044, 112044, 112044, 0, 0, 0, 'honor_of_kings_global.png', '', 1, '2023-12-30', 4, 1),
(42119, 'honorofkingsglobal', 'HOK830-S50', '800 + 95 Tokens', 'Honor of Kings Global', 0, 154176, 154176, 154176, 154176, 0, 0, 0, 'honor_of_kings_global.png', '', 1, '2023-12-30', 4, 1),
(42120, 'honorofkingsglobal', 'HOK1200-S50', '1200 + 153 Tokens', 'Honor of Kings Global', 0, 238309, 238309, 238309, 238309, 0, 0, 0, 'honor_of_kings_global.png', '', 1, '2023-12-30', 4, 1),
(42121, 'honorofkingsglobal', 'HOK2400-S50', '2400 + 324 Tokens', 'Honor of Kings Global', 0, 477017, 477017, 477017, 477017, 0, 0, 0, 'honor_of_kings_global.png', '', 1, '2023-12-30', 4, 1),
(42122, 'honorofkingsglobal', 'HOK4000-S50', '4000 + 580 Tokens', 'Honor of Kings Global', 0, 785901, 785901, 785901, 785901, 0, 0, 0, 'honor_of_kings_global.png', '', 1, '2023-12-30', 4, 1),
(42123, 'honorofkingsglobal', 'HOK8000-S50', '8000 + 1160 Tokens', 'Honor of Kings Global', 0, 1546612, 1546612, 1546612, 1546612, 0, 0, 0, 'honor_of_kings_global.png', '', 1, '2023-12-30', 4, 1),
(42124, 'identityv', 'IDNTV60-S50', '60 Echoes', 'Identity V', 0, 11297, 11297, 11297, 11297, 0, 0, 0, 'identity_v.png', '', 1, '2023-12-30', 4, 1),
(42125, 'identityv', 'IDNTV185-S50', '185 Echoes', 'Identity V', 0, 37215, 37215, 37215, 37215, 0, 0, 0, 'identity_v.png', '', 1, '2023-12-30', 4, 1),
(42126, 'identityv', 'IDNTV305-S50', '305 Echoes', 'Identity V', 0, 57418, 57418, 57418, 57418, 0, 0, 0, 'identity_v.png', '', 1, '2023-12-30', 4, 1),
(42127, 'identityv', 'IDNTV690-S50', '690 Echoes', 'Identity V', 0, 114968, 114968, 114968, 114968, 0, 0, 0, 'identity_v.png', '', 1, '2023-12-30', 4, 1),
(42128, 'identityv', 'IDNTV2025-S50', '2025 Echoes', 'Identity V', 0, 374409, 374409, 374409, 374409, 0, 0, 0, 'identity_v.png', '', 1, '2023-12-30', 4, 1),
(42129, 'identityv', 'IDNTV3330-S50', '3330 Echoes', 'Identity V', 0, 576168, 576168, 576168, 576168, 0, 0, 0, 'identity_v.png', '', 1, '2023-12-30', 4, 1),
(42130, 'identityv', 'IDNTV6590-S50', '6590 Echoes', 'Identity V', 0, 1152602, 1152602, 1152602, 1152602, 0, 0, 0, 'identity_v.png', '', 1, '2023-12-30', 4, 1),
(42131, 'infiniteborders', 'IBR72-S50', '72 Jades', 'Infinite Borders', 0, 13158, 13158, 13158, 13158, 0, 0, 0, 'infinite_borders.png', '', 1, '2023-12-30', 4, 1),
(42132, 'infiniteborders', 'IBR288-S50', '288 Jades', 'Infinite Borders', 0, 53032, 53032, 53032, 53032, 0, 0, 0, 'infinite_borders.png', '', 1, '2023-12-30', 4, 1),
(42133, 'infiniteborders', 'IBR300TP-S50', '300 Jades Tribute Pack', 'Infinite Borders', 0, 66322, 66322, 66322, 66322, 0, 0, 0, 'infinite_borders.png', '', 1, '2023-12-30', 4, 1),
(42134, 'infiniteborders', 'IBR720-S50', '720 Jades', 'Infinite Borders', 0, 132778, 132778, 132778, 132778, 0, 0, 0, 'infinite_borders.png', '', 1, '2023-12-30', 4, 1),
(42135, 'infiniteborders', 'IBR1400-S50', '1400 Jades', 'Infinite Borders', 0, 265688, 265688, 265688, 265688, 0, 0, 0, 'infinite_borders.png', '', 1, '2023-12-30', 4, 1),
(42136, 'infiniteborders', 'IBR3790-S50', '3790 Jades', 'Infinite Borders', 0, 664421, 664421, 664421, 664421, 0, 0, 0, 'infinite_borders.png', '', 1, '2023-12-30', 4, 1),
(42137, 'infiniteborders', 'IBR7150-S50', '7150 Jades', 'Infinite Borders', 0, 1328974, 1328974, 1328974, 1328974, 0, 0, 0, 'infinite_borders.png', '', 1, '2023-12-30', 4, 1),
(42138, 'infiniteborders', 'IBR14350-S50', '14350 Jades', 'Infinite Borders', 0, 2658081, 2658081, 2658081, 2658081, 0, 0, 0, 'infinite_borders.png', '', 1, '2023-12-30', 4, 1),
(42139, 'infiniteborders', 'IBR28310-S50', '28310 Jades', 'Infinite Borders', 0, 5316295, 5316295, 5316295, 5316295, 0, 0, 0, 'infinite_borders.png', '', 1, '2023-12-30', 4, 1),
(42140, 'leagueoflegends', 'LOLWC105-S10', '105 Wild Cores', 'League of Legends', 0, 14301, 14873, 14730, 14730, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-12-30', 4, 1),
(42141, 'leagueoflegends', 'LOLWC350-S10', '350 Wild Cores', 'League of Legends', 0, 47669, 49576, 49099, 49099, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-12-30', 4, 1),
(42142, 'leagueoflegends', 'LOL420-S18', '420 Wild Cores', 'League of Legends', 0, 48430, 50367, 49883, 49883, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-12-30', 4, 1),
(42143, 'leagueoflegends', 'LOL535-S70', '535 Wild Cores', 'League of Legends', 0, 65639, 68265, 67608, 67608, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-12-30', 4, 1),
(42144, 'leagueoflegends', 'LOLWC585-S10', '585 Wild Cores', 'League of Legends', 0, 76271, 79322, 78559, 78559, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-12-30', 4, 1),
(42145, 'leagueoflegends', 'LOL700-S18', '700 Wild Cores', 'League of Legends', 0, 77487, 80586, 79812, 79812, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-12-30', 4, 1),
(42146, 'leagueoflegends', 'LOL1100-S70', '1100 Wild Cores', 'League of Legends', 0, 131279, 136530, 135217, 135217, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-12-30', 4, 1),
(42147, 'leagueoflegends', 'LOLWC1135-S10', '1135 Wild Cores', 'League of Legends', 0, 143008, 148728, 147298, 147298, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-12-30', 4, 1),
(42148, 'leagueoflegends', 'LOL1375-S18', '1375 Wild Cores', 'League of Legends', 0, 145288, 151100, 149647, 149647, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-12-30', 4, 1),
(42149, 'leagueoflegends', 'LOL1725-S70', '1725 Wild Cores', 'League of Legends', 0, 196918, 204795, 202826, 202826, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-12-30', 4, 1),
(42150, 'leagueoflegends', 'LOLWC1660-S10', '1660 Wild Cores', 'League of Legends', 0, 200212, 208220, 206218, 206218, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-12-30', 4, 1),
(42151, 'leagueoflegends', 'LOL2400-S18', '2400 Wild Cores', 'League of Legends', 0, 242148, 251834, 249412, 249412, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-12-30', 4, 1),
(42152, 'leagueoflegends', 'LOL3000-S70', '3000 Wild Cores', 'League of Legends', 0, 328197, 341325, 338043, 338043, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-12-30', 4, 1),
(42153, 'leagueoflegends', 'LOLWC3010-S10', '3010 Wild Cores', 'League of Legends', 0, 343220, 356949, 353517, 353517, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-12-30', 4, 1),
(42154, 'leagueoflegends', 'LOL4000-S18', '4000 Wild Cores', 'League of Legends', 0, 387436, 402933, 399059, 399059, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-12-30', 4, 1),
(42155, 'leagueoflegends', 'LOLWC6210-S10', '6210 Wild Cores', 'League of Legends', 0, 715042, 743644, 736493, 736493, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-12-30', 4, 1),
(42156, 'leagueoflegends', 'LOL8150-S18', '8150 Wild Cores', 'League of Legends', 0, 774871, 805866, 798117, 798117, 0, 0, 0, 'league_of_legends.png', '', 1, '2023-12-30', 4, 1),
(42157, 'lifeafter', 'LA65-S14', '65 Credits', 'LifeAfter', 0, 11586, 12049, 11934, 11934, 0, 0, 0, 'lifeafter.png', '', 1, '2023-12-30', 4, 1),
(42158, 'lifeafter', 'LA330-S14', '330 Credits', 'LifeAfter', 0, 57931, 60248, 59669, 59669, 0, 0, 0, 'lifeafter.png', '', 1, '2023-12-30', 4, 1),
(42159, 'lifeafter', 'LA330-S1000', '330 Credits', 'LifeAfter', 0, 64612, 67196, 66550, 66550, 0, 0, 0, 'lifeafter.png', '', 1, '2023-12-30', 4, 1),
(42160, 'lifeafter', 'LA558-S14', '558 Credits', 'LifeAfter', 0, 92691, 96399, 95472, 95472, 0, 0, 0, 'lifeafter.png', '', 1, '2023-12-30', 4, 1),
(42161, 'lifeafter', 'LA558-S1000', '558 Credits', 'LifeAfter', 0, 105519, 109740, 108685, 108685, 0, 0, 0, 'lifeafter.png', '', 1, '2023-12-30', 4, 1),
(42162, 'lifeafter', 'LA1108-S14', '1108 Credits', 'LifeAfter', 0, 173794, 180746, 179008, 179008, 0, 0, 0, 'lifeafter.png', '', 1, '2023-12-30', 4, 1),
(42163, 'lifeafter', 'LA1108-S1000', '1108 Credits', 'LifeAfter', 0, 190821, 198454, 196546, 196546, 0, 0, 0, 'lifeafter.png', '', 1, '2023-12-30', 4, 1),
(42164, 'lifeafter', 'LA2268-S14', '2268 Credits', 'LifeAfter', 0, 347590, 361494, 358018, 358018, 0, 0, 0, 'lifeafter.png', '', 1, '2023-12-30', 4, 1),
(42165, 'lifeafter', 'LA2268-S1000', '2268 Credits', 'LifeAfter', 0, 375211, 390219, 386467, 386467, 0, 0, 0, 'lifeafter.png', '', 1, '2023-12-30', 4, 1),
(42166, 'lifeafter', 'LA3468-S14', '3468 Credits', 'LifeAfter', 0, 544558, 566340, 560895, 560895, 0, 0, 0, 'lifeafter.png', '', 1, '2023-12-30', 4, 1),
(42167, 'lifeafter', 'LA3468-S1000', '3468 Credits', 'LifeAfter', 0, 579313, 602486, 596692, 596692, 0, 0, 0, 'lifeafter.png', '', 1, '2023-12-30', 4, 1),
(42168, 'lifeafter', 'LA5768-S14', '5768 Credits', 'LifeAfter', 0, 868974, 903733, 895043, 895043, 0, 0, 0, 'lifeafter.png', '', 1, '2023-12-30', 4, 1),
(42169, 'lifeafter', 'LA5768-S1000', '5768 Credits', 'LifeAfter', 0, 957019, 995300, 985730, 985730, 0, 0, 0, 'lifeafter.png', '', 1, '2023-12-30', 4, 1),
(42170, 'lifeafter', 'LA7768-S14', '7768 Credits', 'LifeAfter', 0, 1158633, 1204978, 1193392, 1193392, 0, 0, 0, 'lifeafter.png', '', 1, '2023-12-30', 4, 1),
(42171, 'lifeafter', 'LA7768-S1000', '7768 Credits', 'LifeAfter', 0, 1210450, 1258868, 1246764, 1246764, 0, 0, 0, 'lifeafter.png', '', 1, '2023-12-30', 4, 1),
(42172, 'lightofthel', 'LOT90-S1', '90 Crystal', 'Light of Thel', 0, 11510, 11970, 11855, 11855, 0, 0, 0, 'light_of_thel.png', '', 1, '2023-12-30', 4, 1),
(42173, 'lightofthel', 'LOT450-S1', '450 Crystal', 'Light of Thel', 0, 57552, 59854, 59279, 59279, 0, 0, 0, 'light_of_thel.png', '', 1, '2023-12-30', 4, 1),
(42174, 'lightofthel', 'LOT900-S1', '900 Crystal', 'Light of Thel', 0, 115104, 119708, 118557, 118557, 0, 0, 0, 'light_of_thel.png', '', 1, '2023-12-30', 4, 1),
(42175, 'lightofthel', 'LOT1800-S1', '1800 Crystal', 'Light of Thel', 0, 230208, 239416, 237114, 237114, 0, 0, 0, 'light_of_thel.png', '', 1, '2023-12-30', 4, 1),
(42176, 'lightofthel', 'LOT4500-S1', '4500 Crystal', 'Light of Thel', 0, 575519, 598540, 592785, 592785, 0, 0, 0, 'light_of_thel.png', '', 1, '2023-12-30', 4, 1),
(42177, 'lightofthel', 'LOT9000-S1', '9000 Crystal', 'Light of Thel', 0, 1162435, 1208932, 1197308, 1197308, 0, 0, 0, 'light_of_thel.png', '', 1, '2023-12-30', 4, 1),
(42178, 'lightofthelnewera', 'LOTNRA90-S50', '90 Crystals', 'Light of Thel: New Era', 0, 11696, 11696, 11696, 11696, 0, 0, 0, 'light_of_thel:_new_era.png', '', 1, '2023-12-30', 4, 1),
(42179, 'lightofthelnewera', 'LOTNRA450-S50', '450 Crystals', 'Light of Thel: New Era', 0, 59544, 59544, 59544, 59544, 0, 0, 0, 'light_of_thel:_new_era.png', '', 1, '2023-12-30', 4, 1),
(42180, 'lightofthelnewera', 'LOTNRA630-S50', '630 Crystals', 'Light of Thel: New Era', 0, 83468, 83468, 83468, 83468, 0, 0, 0, 'light_of_thel:_new_era.png', '', 1, '2023-12-30', 4, 1),
(42181, 'lightofthelnewera', 'LOTNRA900-S50', '900 Crystals', 'Light of Thel: New Era', 0, 119221, 119221, 119221, 119221, 0, 0, 0, 'light_of_thel:_new_era.png', '', 1, '2023-12-30', 4, 1),
(42182, 'lightofthelnewera', 'LOTNRA1350-S50', '1350 Crystals', 'Light of Thel: New Era', 0, 179031, 179031, 179031, 179031, 0, 0, 0, 'light_of_thel:_new_era.png', '', 1, '2023-12-30', 4, 1),
(42183, 'lightofthelnewera', 'LOTNRA1800-S50', '1800 Crystals', 'Light of Thel: New Era', 0, 238708, 238708, 238708, 238708, 0, 0, 0, 'light_of_thel:_new_era.png', '', 1, '2023-12-30', 4, 1),
(42184, 'lightofthelnewera', 'LOTNRA2250-S50', '2250 Crystals', 'Light of Thel: New Era', 0, 298784, 298784, 298784, 298784, 0, 0, 0, 'light_of_thel:_new_era.png', '', 1, '2023-12-30', 4, 1),
(42185, 'lightofthelnewera', 'LOTNRA2980-S50', '2980 Crystals', 'Light of Thel: New Era', 0, 394346, 394346, 394346, 394346, 0, 0, 0, 'light_of_thel:_new_era.png', '', 1, '2023-12-30', 4, 1),
(42186, 'lightofthelnewera', 'LOTNRA4500-S50', '4500 Crystals', 'Light of Thel: New Era', 0, 595174, 595174, 595174, 595174, 0, 0, 0, 'light_of_thel:_new_era.png', '', 1, '2023-12-30', 4, 1),
(42187, 'lightofthelnewera', 'LOTNRA6300-S50', '6300 Crystals', 'Light of Thel: New Era', 0, 834147, 834147, 834147, 834147, 0, 0, 0, 'light_of_thel:_new_era.png', '', 1, '2023-12-30', 4, 1),
(42188, 'lightofthelnewera', 'LOTNRA9000-S50', '9000 Crystals', 'Light of Thel: New Era', 0, 1192608, 1192608, 1192608, 1192608, 0, 0, 0, 'light_of_thel:_new_era.png', '', 1, '2023-12-30', 4, 1),
(42189, 'lightofthelnewera', 'LOTNRA15000-S50', '15000 Crystals', 'Light of Thel: New Era', 0, 1790174, 1790174, 1790174, 1790174, 0, 0, 0, 'light_of_thel:_new_era.png', '', 1, '2023-12-30', 4, 1),
(42190, 'lightofthelnewera', 'LOTNRA32000-S50', '32000 Crystals', 'Light of Thel: New Era', 0, 3582741, 3582741, 3582741, 3582741, 0, 0, 0, 'light_of_thel:_new_era.png', '', 1, '2023-12-30', 4, 1),
(42191, 'marvelsnap', 'MSNPWLB-S50', 'Welcome Bundle', 'Marvel Snap', 0, 35620, 35620, 35620, 35620, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-12-30', 4, 1),
(42192, 'marvelsnap', 'MSNP300-S50', '300 Gold', 'Marvel Snap', 0, 59544, 59544, 59544, 59544, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-12-30', 4, 1),
(42193, 'marvelsnap', 'MSNPPRM-S50', 'Season Pass Premium', 'Marvel Snap', 0, 119221, 119221, 119221, 119221, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-12-30', 4, 1),
(42194, 'marvelsnap', 'MSNP600-S50', '600 Gold + 100 Gold Bonus', 'Marvel Snap', 0, 119221, 119221, 119221, 119221, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-12-30', 4, 1),
(42195, 'marvelsnap', 'MSNPPRMPLS-S50', 'Season Pass Premium Plus', 'Marvel Snap', 0, 179031, 179031, 179031, 179031, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-12-30', 4, 1),
(42196, 'marvelsnap', 'MSNP1200-S50', '1200 Gold + 250 Gold Bonus', 'Marvel Snap', 0, 238708, 238708, 238708, 238708, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-12-30', 4, 1),
(42197, 'marvelsnap', 'MSNP2100-S50', '2100 Gold + 500 Gold Bonus', 'Marvel Snap', 0, 418270, 418270, 418270, 418270, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-12-30', 4, 1),
(42198, 'marvelsnap', 'MSNP3000-S50', '3000 Gold + 850 Gold Bonus', 'Marvel Snap', 0, 595174, 595174, 595174, 595174, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-12-30', 4, 1),
(42199, 'marvelsnap', 'MSNPPB-S50', 'Pro Bundle', 'Marvel Snap', 0, 1192608, 1192608, 1192608, 1192608, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-12-30', 4, 1),
(42200, 'marvelsnap', 'MSNP6000-S50', '6000 Gold + 2000 Gold Bonus', 'Marvel Snap', 0, 1192608, 1192608, 1192608, 1192608, 0, 0, 0, 'marvel_snap.png', '', 1, '2023-12-30', 4, 1),
(42201, 'marvelsuperwar', 'MSW55SC-S14', '55 Star Credits', 'Marvel Super War', 0, 11297, 11749, 11636, 11636, 0, 0, 0, 'marvel_super_war.png', '', 1, '2023-12-30', 4, 1),
(42202, 'marvelsuperwar', 'MSW275SC-S14', '275 Star Credits', 'Marvel Super War', 0, 57642, 59948, 59371, 59371, 0, 0, 0, 'marvel_super_war.png', '', 1, '2023-12-30', 4, 1),
(42203, 'marvelsuperwar', 'MSW565SC-S14', '565 Star Credits', 'Marvel Super War', 0, 115574, 120197, 119041, 119041, 0, 0, 0, 'marvel_super_war.png', '', 1, '2023-12-30', 4, 1),
(42204, 'marvelsuperwar', 'MSW1155SC-S14', '1155 Star Credits', 'Marvel Super War', 0, 231437, 240694, 238380, 238380, 0, 0, 0, 'marvel_super_war.png', '', 1, '2023-12-30', 4, 1),
(42205, 'marvelsuperwar', 'MSW1765SC-S14', '1765 Star Credits', 'Marvel Super War', 0, 376266, 391317, 387554, 387554, 0, 0, 0, 'marvel_super_war.png', '', 1, '2023-12-30', 4, 1),
(42206, 'marvelsuperwar', 'MSW2950SC-S14', '2950 Star Credits', 'Marvel Super War', 0, 579026, 602187, 596397, 596397, 0, 0, 0, 'marvel_super_war.png', '', 1, '2023-12-30', 4, 1),
(42207, 'marvelsuperwar', 'MSW6000SC-S14', '6000 Star Credits', 'Marvel Super War', 0, 1158342, 1204676, 1193092, 1193092, 0, 0, 0, 'marvel_super_war.png', '', 1, '2023-12-30', 4, 1),
(42208, 'metalslugawakening', 'MSAWK60-S81', '60 ruby', 'Metal Slug Awakening', 0, 13181, 13181, 13181, 13181, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42209, 'metalslugawakening', 'MSAWKAP1-S81M', 'Alloy Pickaxe x1', 'Metal Slug Awakening', 0, 22839, 22839, 22839, 22839, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42210, 'metalslugawakening', 'MSAWKAP1_1-S81M', 'Alloy Pickaxe x1', 'Metal Slug Awakening', 0, 23725, 23725, 23725, 23725, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42211, 'metalslugawakening', 'MSAWKRP1-S81M', 'Ruby Pickaxe x1', 'Metal Slug Awakening', 0, 28118, 28118, 28118, 28118, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42212, 'metalslugawakening', 'MSAWKSP1-S81M', 'Sapphire Pickaxe x1', 'Metal Slug Awakening', 0, 28118, 28118, 28118, 28118, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42213, 'metalslugawakening', 'MSAWK310-S81', '310 Ruby', 'Metal Slug Awakening', 0, 61509, 61509, 61509, 61509, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42214, 'metalslugawakening', 'MSAWKSP-S81M', 'Support Pass', 'Metal Slug Awakening', 0, 61509, 61509, 61509, 61509, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42215, 'metalslugawakening', 'MSAWKKB-S81', 'Kartu Bulanan', 'Metal Slug Awakening', 0, 61509, 61509, 61509, 61509, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42216, 'metalslugawakening', 'MSAWK630-S81', '630 Ruby', 'Metal Slug Awakening', 0, 118625, 118625, 118625, 118625, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42217, 'metalslugawakening', 'MSAWKSPP1-S81M', 'Premium Support Pass', 'Metal Slug Awakening', 0, 118625, 118625, 118625, 118625, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42218, 'metalslugawakening', 'MSAWKKBP-S81', 'Kartu Bulanan Premium', 'Metal Slug Awakening', 0, 118625, 118625, 118625, 118625, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42219, 'metalslugawakening', 'MSAWK1300-S81', '1300 Ruby', 'Metal Slug Awakening', 0, 237249, 237249, 237249, 237249, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42220, 'metalslugawakening', 'MSAWKAP10-S81M', 'Alloy Pickaxe x10', 'Metal Slug Awakening', 0, 237249, 237249, 237249, 237249, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42221, 'metalslugawakening', 'MSAWKRP10-S81M', 'Ruby Pickaxe x10', 'Metal Slug Awakening', 0, 281184, 281184, 281184, 281184, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42222, 'metalslugawakening', 'MSAWKSP10-S81M', 'Sapphire Pickaxe x10', 'Metal Slug Awakening', 0, 281184, 281184, 281184, 281184, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42223, 'metalslugawakening', 'MSAWKAP20-S81M', 'Alloy Pickaxe x20', 'Metal Slug Awakening', 0, 474498, 474498, 474498, 474498, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42224, 'metalslugawakening', 'MSAWKRP20-S81M', 'Ruby Pickaxe x20', 'Metal Slug Awakening', 0, 562368, 562368, 562368, 562368, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42225, 'metalslugawakening', 'MSAWKSP20-S81M', 'Sapphire Pickaxe x20', 'Metal Slug Awakening', 0, 562368, 562368, 562368, 562368, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42226, 'metalslugawakening', 'MSAWK3200-S81', '3200 Ruby', 'Metal Slug Awakening', 0, 615090, 615090, 615090, 615090, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42227, 'metalslugawakening', 'MSAWK6500-S81', '6500 Ruby', 'Metal Slug Awakening', 0, 1186245, 1186245, 1186245, 1186245, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42228, 'metalslugawakening', 'MSAWK13100-S81M', '13100 Ruby', 'Metal Slug Awakening', 0, 2372490, 2372490, 2372490, 2372490, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42229, 'metalslugawakening', 'MSAWK19650-S81M', '19650 Ruby', 'Metal Slug Awakening', 0, 3514800, 3514800, 3514800, 3514800, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42230, 'metalslugawakening', 'MSAWK6500_5-S81', '6500 Ruby x 5', 'Metal Slug Awakening', 0, 5931225, 5931225, 5931225, 5931225, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42231, 'metalslugawakening', 'MSAWK6500_10-S81', '6500 Ruby x 10', 'Metal Slug Awakening', 0, 11862450, 11862450, 11862450, 11862450, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42232, 'metalslugawakening', 'MSAWK6500_20-S81', '6500 Ruby x 20', 'Metal Slug Awakening', 0, 23724900, 23724900, 23724900, 23724900, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42233, 'metalslugawakening', 'MSAWK6500_50-S81', '6500 Ruby x 50', 'Metal Slug Awakening', 0, 59312250, 59312250, 59312250, 59312250, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42234, 'metalslugawakening', 'MSAWK6500_100-S81', '6500 Ruby x 100', 'Metal Slug Awakening', 0, 118624500, 118624500, 118624500, 118624500, 0, 0, 0, 'metal_slug_awakening.png', '', 1, '2023-12-30', 4, 1),
(42235, 'mikoeratwelvemyths', 'MIKO60-S48', '60 Jade', 'Miko Era: Twelve Myths', 0, 14624, 14624, 14624, 14624, 0, 0, 0, 'miko_era:_twelve_myths.png', '', 1, '2023-12-30', 4, 1),
(42236, 'mikoeratwelvemyths', 'MIKO300-S48', '300 Jade', 'Miko Era: Twelve Myths', 0, 74110, 74110, 74110, 74110, 0, 0, 0, 'miko_era:_twelve_myths.png', '', 1, '2023-12-30', 4, 1),
(42237, 'mikoeratwelvemyths', 'MIKO680-S48', '680 Jade', 'Miko Era: Twelve Myths', 0, 160862, 160862, 160862, 160862, 0, 0, 0, 'miko_era:_twelve_myths.png', '', 1, '2023-12-30', 4, 1),
(42238, 'mikoeratwelvemyths', 'MIKO980-S48', '980 Jade', 'Miko Era: Twelve Myths', 0, 219358, 219358, 219358, 219358, 0, 0, 0, 'miko_era:_twelve_myths.png', '', 1, '2023-12-30', 4, 1),
(42239, 'mikoeratwelvemyths', 'MIKO1280-S48', '1280 Jade', 'Miko Era: Twelve Myths', 0, 292477, 292477, 292477, 292477, 0, 0, 0, 'miko_era:_twelve_myths.png', '', 1, '2023-12-30', 4, 1),
(42240, 'mikoeratwelvemyths', 'MIKO1980-S48', '1980 Jade', 'Miko Era: Twelve Myths', 0, 438715, 438715, 438715, 438715, 0, 0, 0, 'miko_era:_twelve_myths.png', '', 1, '2023-12-30', 4, 1),
(42241, 'mikoeratwelvemyths', 'MIKO3280-S48', '3280 Jade', 'Miko Era: Twelve Myths', 0, 731193, 731193, 731193, 731193, 0, 0, 0, 'miko_era:_twelve_myths.png', '', 1, '2023-12-30', 4, 1),
(42242, 'mikoeratwelvemyths', 'MIKO6480-S48', '6480 Jade', 'Miko Era: Twelve Myths', 0, 1462385, 1462385, 1462385, 1462385, 0, 0, 0, 'miko_era:_twelve_myths.png', '', 1, '2023-12-30', 4, 1),
(42243, 'mobilelegendsb', 'ML5_0-S10', '5 Diamonds ( 5 + 0 Bonus )', 'Mobile Legends B', 0, 1408, 1464, 1450, 1450, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42244, 'mobilelegendsb', 'MLBB9_1-S10', '10 Diamonds ( 9 + 1 Bonus )', 'Mobile Legends B', 0, 2816, 2929, 2900, 2900, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42245, 'mobilelegendsb', 'ML11_1-S10', '12 Diamonds ( 11 + 1 Bonus )', 'Mobile Legends B', 0, 3285, 3416, 3384, 3384, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42246, 'mobilelegendsb', 'ML13_1-S10', '14 Diamonds ( 13 + 1 Bonus )', 'Mobile Legends B', 0, 3754, 3904, 3867, 3867, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42247, 'mobilelegendsb', 'MLBB17_1-S10', '18 Diamonds ( 17 + 1 Bonus )', 'Mobile Legends B', 0, 4692, 4880, 4833, 4833, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42248, 'mobilelegendsb', 'ML26_2-S10', '28 Diamonds ( 26 + 2 Bonus )', 'Mobile Legends B', 0, 7508, 7808, 7733, 7733, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42249, 'mobilelegendsb', 'MLBB33_3-S10', '36 Diamonds ( 33 + 3 Bonus )', 'Mobile Legends B', 0, 9385, 9760, 9667, 9667, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42250, 'mobilelegendsb', 'ML40_4-S10', '44 Diamonds ( 40 + 4 Bonus )', 'Mobile Legends B', 0, 11262, 11712, 11600, 11600, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42251, 'mobilelegendsb', 'ML42_4-S10', '46 Diamonds ( 42 + 4 Bonus )', 'Mobile Legends B', 0, 12201, 12689, 12567, 12567, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42252, 'mobilelegendsb', 'ML53_6-S10', '59 Diamonds ( 53 + 6 Bonus )', 'Mobile Legends B', 0, 15016, 15617, 15466, 15466, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42253, 'mobilelegendsb', 'MLBB67_7-S10', '74 Diamonds ( 67 + 7 Bonus )', 'Mobile Legends B', 0, 18770, 19521, 19333, 19333, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42254, 'mobilelegendsb', 'ML77_8-S10', '85 Diamonds ( 77 + 8 Bonus )', 'Mobile Legends B', 0, 21586, 22449, 22234, 22234, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42255, 'mobilelegendsb', 'ML80_8-S10', '88 Diamonds ( 80 + 8 Bonus )', 'Mobile Legends B', 0, 22524, 23425, 23200, 23200, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42256, 'mobilelegendsb', 'MLWEEKLYDIAMONDPASS-S10', 'Weekly Diamond Pass (Event Topup +100)', 'Mobile Legends B', 0, 27081, 28164, 27893, 27893, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42257, 'mobilelegendsb', 'MLWEEKLYDIAMONDPASS-S50A', 'Weekly Diamond Pass (Event Topup +100)', 'Mobile Legends B', 0, 27377, 28472, 28198, 28198, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42258, 'mobilelegendsb', 'ML100_10-S10', '110 Diamonds ( 100 + 10 Bonus )', 'Mobile Legends B', 0, 28155, 29281, 29000, 29000, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42259, 'mobilelegendsb', 'ML134_14-S10', '148 Diamonds ( 134 + 14 Bonus )', 'Mobile Legends B', 0, 37540, 39042, 38666, 38666, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42260, 'mobilelegendsb', 'ML154_16-S10', '170 Diamonds ( 154 + 16 Bonus )', 'Mobile Legends B', 0, 43170, 44897, 44465, 44465, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42261, 'mobilelegendsb', 'ML160_16-S10', '176 Diamonds ( 160 + 16 Bonus )', 'Mobile Legends B', 0, 45048, 46850, 46399, 46399, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42262, 'mobilelegendsb', 'ML167_17-S10', '184 Diamonds ( 167 + 17 Bonus )', 'Mobile Legends B', 0, 46925, 48802, 48333, 48333, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42263, 'mobilelegendsb', 'ML200_22-S10', '222 Diamonds ( 200 + 22 Bonus )', 'Mobile Legends B', 0, 56310, 58562, 57999, 57999, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42264, 'mobilelegendsb', 'ML217_23-S10', '240 Diamonds ( 217 + 23 Bonus )', 'Mobile Legends B', 0, 61002, 63442, 62832, 62832, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42265, 'mobilelegendsb', 'ML218_23-S10', '241 Diamonds ( 218 + 23 Bonus )', 'Mobile Legends B', 0, 61472, 63931, 63316, 63316, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42266, 'mobilelegendsb', 'ML234_24-S10', '258 Diamonds ( 234 + 24 Bonus )', 'Mobile Legends B', 0, 65694, 68322, 67665, 67665, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42267, 'mobilelegendsb', 'MLBB250_27-S10', '277 Diamonds ( 250 + 27 Bonus )', 'Mobile Legends B', 0, 70387, 73202, 72499, 72499, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42268, 'mobilelegendsb', 'ML259_27-S10', '286 Diamonds ( 259 + 27 Bonus )', 'Mobile Legends B', 0, 73203, 76131, 75399, 75399, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42269, 'mobilelegendsb', 'ML256_40-S10', '296 Diamonds ( 256 + 40 Bonus )', 'Mobile Legends B', 0, 75079, 78082, 77331, 77331, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42270, 'mobilelegendsb', 'ML276_29-S10', '305 Diamonds ( 276 + 29 Bonus )', 'Mobile Legends B', 0, 77895, 81011, 80232, 80232, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42271, 'mobilelegendsb', 'ML302_31-S10', '333 Diamonds ( 302 + 31 Bonus )', 'Mobile Legends B', 0, 85403, 88819, 87965, 87965, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42272, 'mobilelegendsb', 'ML314_32-S10', '346 Diamonds ( 314 + 32 Bonus )', 'Mobile Legends B', 0, 88687, 92234, 91348, 91348, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42273, 'mobilelegendsb', 'ML332_34-S10', '356 Diamonds ( 322 + 34 Bonus )', 'Mobile Legends B', 0, 90565, 94188, 93282, 93282, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42274, 'mobilelegendsb', 'MLBB333_37-S10', '370 Diamonds ( 333 + 37 Bonus )', 'Mobile Legends B', 0, 93849, 97603, 96664, 96664, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42275, 'mobilelegendsb', 'ML346_38-S10', '384 Diamonds ( 346 + 38 Bonus )', 'Mobile Legends B', 0, 97603, 101507, 100531, 100531, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42276, 'mobilelegendsb', 'ML367_41-S10', '408 Diamonds ( 367 + 41 Bonus )', 'Mobile Legends B', 0, 103234, 107363, 106331, 106331, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42277, 'mobilelegendsb', 'ML366_40-S10', '406 Diamonds ( 366 + 40 Bonus )', 'Mobile Legends B', 0, 103234, 107363, 106331, 106331, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42278, 'mobilelegendsb', 'ML384_41-S10', '425 Diamonds ( 384 + 41 Bonus )', 'Mobile Legends B', 0, 107927, 112244, 111165, 111165, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42279, 'mobilelegendsb', 'ML385_41-S10', '431 Diamonds ( 385 + 41 Bonus )', 'Mobile Legends B', 0, 110273, 114684, 113581, 113581, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42280, 'mobilelegendsb', 'ML467_51-S10', '518 Diamonds ( 467 + 51 Bonus )', 'Mobile Legends B', 0, 131389, 136645, 135331, 135331, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42281, 'mobilelegendsb', 'ML503_65-S10', '568 Diamonds ( 503 + 65 Bonus )', 'Mobile Legends B', 0, 140774, 146405, 144997, 144997, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42282, 'mobilelegendsb', 'MLTL-S10', 'Twilight Pass', 'Mobile Legends B', 0, 140774, 146405, 144997, 144997, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42283, 'mobilelegendsb', 'MLBB533_68-S10', '601 Diamond (533 + 68 Bonus )', 'Mobile Legends B', 0, 149689, 155677, 154180, 154180, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42284, 'mobilelegendsb', 'ML637_79-S10', '716 Diamonds ( 637 + 79 Bonus )', 'Mobile Legends B', 0, 178313, 185446, 183662, 183662, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42285, 'mobilelegendsb', 'ML671_87-S10', '758 Diamonds ( 671 + 87 Bonus )', 'Mobile Legends B', 0, 189575, 197158, 195262, 195262, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42286, 'mobilelegendsb', 'ML675_75-S10', '750 Diamonds ( 675 + 75 Bonus )', 'Mobile Legends B', 0, 190514, 198135, 196229, 196229, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42287, 'mobilelegendsb', 'ML774_101-S10', '875 Diamonds ( 774 + 101 Bonus )', 'Mobile Legends B', 0, 215853, 224487, 222329, 222329, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42288, 'mobilelegendsb', 'ML779_95-S10', '874 Diamonds ( 779 + 95 Bonus )', 'Mobile Legends B', 0, 218669, 227416, 225229, 225229, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42289, 'mobilelegendsb', 'ML781_97-S10', '878 Diamonds ( 781 + 97 Bonus )', 'Mobile Legends B', 0, 219607, 228391, 226195, 226195, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42290, 'mobilelegendsb', 'ML855_103-S10', '963 Diamonds ( 855 + 103 Bonus )', 'Mobile Legends B', 0, 241662, 251328, 248912, 248912, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42291, 'mobilelegendsb', 'ML936_112-S10', '1048 Diamonds ( 936 + 112 Bonus )', 'Mobile Legends B', 0, 262778, 273289, 270661, 270661, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42292, 'mobilelegendsb', 'ML1006_130-S10', '1136 Diamonds ( 1006 + 130 Bonus )', 'Mobile Legends B', 0, 281548, 292810, 289994, 289994, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42293, 'mobilelegendsb', 'ML1028_131-S10', '1159 Diamonds ( 1028 + 131 Bonus )', 'Mobile Legends B', 0, 287648, 299154, 296277, 296277, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42294, 'mobilelegendsb', 'MLBB1075_145-S10', '1220 Diamond (1075 + 145 Bonus )', 'Mobile Legends B', 0, 303133, 315258, 312227, 312227, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42295, 'mobilelegendsb', 'ML1206_152-S10', '1358 Diamonds ( 1206 + 152 Bonus )', 'Mobile Legends B', 0, 337857, 351371, 347993, 347993, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42296, 'mobilelegendsb', 'ML1256_157-S10', '1413 Diamonds ( 1256 + 157 Bonus )', 'Mobile Legends B', 0, 351935, 366012, 362493, 362493, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42297, 'mobilelegendsb', 'ML1286_159-S10', '1445 Diamonds ( 1286 + 159 Bonus )', 'Mobile Legends B', 0, 360381, 374796, 371192, 371192, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1);
INSERT INTO `tb_produk` (`cuid`, `slug`, `code`, `title`, `kategori`, `subkategori`, `harga_modal`, `harga_jual`, `harga_reseller`, `harga_h2h`, `harga_coret`, `komisi`, `poin`, `image`, `currency`, `status`, `created_date`, `jenis`, `product_type`) VALUES
(42298, 'mobilelegendsb', 'ML1339_167-S10', '1506 Diamonds ( 1339 + 167 Bonus )', 'Mobile Legends B', 0, 375397, 390413, 386659, 386659, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42299, 'mobilelegendsb', 'ML1509_195-S10', '1704 Diamonds ( 1509 + 195 Bonus )', 'Mobile Legends B', 0, 422321, 439214, 434991, 434991, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42300, 'mobilelegendsb', 'ML1708_302-S10', '2010 Diamonds ( 1708 + 302 Bonus )', 'Mobile Legends B', 0, 469246, 488016, 483323, 483323, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42301, 'mobilelegendsb', 'ML1842_316-S10', '2158 Diamonds ( 1842 + 316 Bonus )', 'Mobile Legends B', 0, 506786, 527057, 521990, 521990, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42302, 'mobilelegendsb', 'ML1877_319-S10', '2196 Diamonds ( 1877 + 319 Bonus )', 'Mobile Legends B', 0, 517109, 537793, 532622, 532622, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42303, 'mobilelegendsb', 'ML2041_339-S10', '2380 Diamonds ( 2041 + 339 Bonus )', 'Mobile Legends B', 0, 563095, 585619, 579988, 579988, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42304, 'mobilelegendsb', 'ML2211_367-S10', '2578 Diamonds ( 2211 + 367 Bonus )', 'Mobile Legends B', 0, 610020, 634421, 628321, 628321, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42305, 'mobilelegendsb', 'ML2461_394-S10', '2855 Diamonds ( 2461 + 394 Bonus )', 'Mobile Legends B', 0, 680407, 707623, 700819, 700819, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42306, 'mobilelegendsb', 'ML2964_459-S10', '3423 Diamonds ( 2964 + 459 Bonus )', 'Mobile Legends B', 0, 821181, 854028, 845816, 845816, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42307, 'mobilelegendsb', 'ML3247_491-S10', '3738 Diamonds ( 3247 + 491 Bonus )', 'Mobile Legends B', 0, 900952, 936990, 927981, 927981, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42308, 'mobilelegendsb', 'ML3416_604-S10', '4020 Diamonds ( 3416 + 604 Bonus )', 'Mobile Legends B', 0, 938492, 976032, 966647, 966647, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42309, 'mobilelegendsb', 'ML4323_481-S10', '4804 Diamonds ( 4323 + 481 Bonus )', 'Mobile Legends B', 0, 1126190, 1171238, 1159976, 1159976, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42310, 'mobilelegendsb', 'ML4003_827-S10', '4830 Diamonds ( 4003 + 827 Bonus )', 'Mobile Legends B', 0, 1126190, 1171238, 1159976, 1159976, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42311, 'mobilelegendsb', 'ML4252_706-S10', '4958 Diamonds ( 4252 + 706 Bonus )', 'Mobile Legends B', 0, 1173115, 1220040, 1208308, 1208308, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42312, 'mobilelegendsb', 'ML4826_546-S10', '5372 Diamonds ( 4826 + 546 Bonus )', 'Mobile Legends B', 0, 1266964, 1317643, 1304973, 1304973, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42313, 'mobilelegendsb', 'ML5329_611-S10', '5940 Diamonds ( 5329 + 611 Bonus )', 'Mobile Legends B', 0, 1407738, 1464048, 1449970, 1449970, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42314, 'mobilelegendsb', 'ML5124_906-S10', '6030 Diamonds ( 5124 + 906 Bonus )', 'Mobile Legends B', 0, 1407738, 1464048, 1449970, 1449970, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42315, 'mobilelegendsb', 'ML6031_783-S10', '6814 Diamonds ( 6031 + 783 Bonus )', 'Mobile Legends B', 0, 1595436, 1659253, 1643299, 1643299, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42316, 'mobilelegendsb', 'ML6364_820-S10', '7184 Diamonds ( 6364 + 820 Bonus )', 'Mobile Legends B', 0, 1689286, 1756857, 1739965, 1739965, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42317, 'mobilelegendsb', 'ML6784_875-S10', '7659 Diamonds ( 6784 + 875 Bonus )', 'Mobile Legends B', 0, 1806597, 1878861, 1860795, 1860795, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42318, 'mobilelegendsb', 'ML6832_1208-S10', '8040 Diamonds ( 6832 + 1208 Bonus )', 'Mobile Legends B', 0, 1876984, 1952063, 1933294, 1933294, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42319, 'mobilelegendsb', 'ML7739_1085-S10', '8824 Diamonds ( 7739 + 1085 Bonus )', 'Mobile Legends B', 0, 2064682, 2147269, 2126622, 2126622, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42320, 'mobilelegendsb', 'ML8540_1510-S10', '10050 Diamonds ( 8540 + 1510 Bonus )', 'Mobile Legends B', 0, 2346230, 2440079, 2416617, 2416617, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42321, 'mobilelegendsb', 'ML10671_1298-S10', '12005 Diamonds ( 10671 + 1298 Bonus )', 'Mobile Legends B', 0, 2820168, 2932975, 2904773, 2904773, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42322, 'mobilelegendsb', 'ML13664_2416-S10', '16080 Diamonds ( 13664 + 2416 Bonus )', 'Mobile Legends B', 0, 3753968, 3904127, 3866587, 3866587, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42323, 'mobilelegendsb', 'ML17080_3020-S10', '20100 Diamonds ( 17080 + 3020 Bonus )', 'Mobile Legends B', 0, 4692460, 4880158, 4833234, 4833234, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42324, 'mobilelegendsb', 'ML24329_2837-S10', '27166  Diamonds ( 24329 +2837 Bonus )', 'Mobile Legends B', 0, 6381746, 6637016, 6573198, 6573198, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42325, 'mobilelegendsb', 'ML25938_2886-S10', '28824 Diamonds ( 25938 + 2886 Bonus )', 'Mobile Legends B', 0, 6757142, 7027428, 6959856, 6959856, 0, 0, 0, 'mobile_legends_b.png', '', 1, '2023-12-30', 4, 1),
(42326, 'mobilelegendsgift', 'MLGIFT199-S1', 'ITEM 199 Diamonds [CREATE SQUAD]', 'Mobile Legends Gift', 0, 25174, 25174, 25174, 25174, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-12-30', 4, 1),
(42327, 'mobilelegendsgift', 'MLGIFT499ISL-S1', 'Charisma 499 Diamonds [PARADISE ISLAND]', 'Mobile Legends Gift', 0, 63124, 63124, 63124, 63124, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-12-30', 4, 1),
(42328, 'mobilelegendsgift', 'MLGIFT499ARK-S1', 'Charisma 499 Diamonds [ANGEL ARK]', 'Mobile Legends Gift', 0, 63124, 63124, 63124, 63124, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-12-30', 4, 1),
(42329, 'mobilelegendsgift', 'MLGIFT999-S1', 'Charisma 999 Diamonds [Goldmoon Lantern]', 'Mobile Legends Gift', 0, 126374, 126374, 126374, 126374, 0, 0, 0, 'mobile_legends_gift.png', '', 1, '2023-12-30', 4, 1),
(42330, 'monstersaga', 'MSTRSG90-S968', '90 Diamond', 'Monster Saga', 0, 17961, 17961, 17961, 17961, 0, 0, 0, 'monster_saga.png', '', 1, '2023-12-30', 4, 1),
(42331, 'monstersaga', 'MSTRSG460-S968', '460 Diamond', 'Monster Saga', 0, 84136, 84136, 84136, 84136, 0, 0, 0, 'monster_saga.png', '', 1, '2023-12-30', 4, 1),
(42332, 'monstersaga', 'MSTRSG960-S968', '960 Diamond', 'Monster Saga', 0, 159765, 159765, 159765, 159765, 0, 0, 0, 'monster_saga.png', '', 1, '2023-12-30', 4, 1),
(42333, 'monstersaga', 'MSTRSG1500-S968', '1500 Diamond', 'Monster Saga', 0, 235393, 235393, 235393, 235393, 0, 0, 0, 'monster_saga.png', '', 1, '2023-12-30', 4, 1),
(42334, 'monstersaga', 'MSTRSG2000-S968', '2000 Diamond', 'Monster Saga', 0, 329928, 329928, 329928, 329928, 0, 0, 0, 'monster_saga.png', '', 1, '2023-12-30', 4, 1),
(42335, 'monstersaga', 'MSTRSG3000-S968', '3000 Diamond', 'Monster Saga', 0, 471730, 471730, 471730, 471730, 0, 0, 0, 'monster_saga.png', '', 1, '2023-12-30', 4, 1),
(42336, 'monstersaga', 'MSTRSG5000-S968', '5000 Diamond', 'Monster Saga', 0, 802603, 802603, 802603, 802603, 0, 0, 0, 'monster_saga.png', '', 1, '2023-12-30', 4, 1),
(42337, 'monstersaga', 'MSTRSG11000-S968', '11000 Diamond', 'Monster Saga', 0, 1606152, 1606152, 1606152, 1606152, 0, 0, 0, 'monster_saga.png', '', 1, '2023-12-30', 4, 1),
(42338, 'omegalegends', 'OL129-S1', '129 Gold', 'Omega Legends', 0, 14388, 14964, 14820, 14820, 0, 0, 0, 'omega_legends.png', '', 1, '2023-12-30', 4, 1),
(42339, 'omegalegends', 'OL258-S1', '258 Gold', 'Omega Legends', 0, 28776, 29927, 29639, 29639, 0, 0, 0, 'omega_legends.png', '', 1, '2023-12-30', 4, 1),
(42340, 'omegalegends', 'OL828-S1', '828 Gold', 'Omega Legends', 0, 86328, 89781, 88918, 88918, 0, 0, 0, 'omega_legends.png', '', 1, '2023-12-30', 4, 1),
(42341, 'omegalegends', 'OL1429-S1', '1429 Gold', 'Omega Legends', 0, 143880, 149635, 148196, 148196, 0, 0, 0, 'omega_legends.png', '', 1, '2023-12-30', 4, 1),
(42342, 'omegalegends', 'OL2927-S1', '2927 Gold', 'Omega Legends', 0, 287760, 299270, 296393, 296393, 0, 0, 0, 'omega_legends.png', '', 1, '2023-12-30', 4, 1),
(42343, 'omegalegends', 'OL9000-S1', '9000 Gold', 'Omega Legends', 0, 863279, 897810, 889177, 889177, 0, 0, 0, 'omega_legends.png', '', 1, '2023-12-30', 4, 1),
(42344, 'onepunchman', 'OP5-S48', '5 Coupon', 'One Punch Man', 0, 7436, 7733, 7659, 7659, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-12-30', 4, 1),
(42345, 'onepunchman', 'OP13-S48', '13 Coupon', 'One Punch Man', 0, 19829, 20622, 20424, 20424, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-12-30', 4, 1),
(42346, 'onepunchman', 'OP14-S37', '14 Coupon', 'One Punch Man', 0, 21885, 22760, 22542, 22542, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-12-30', 4, 1),
(42347, 'onepunchman', 'OP23-S37', '23 Coupon', 'One Punch Man', 0, 36805, 38277, 37909, 37909, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-12-30', 4, 1),
(42348, 'onepunchman', 'OP23-S48', '23 Coupon', 'One Punch Man', 0, 37179, 38666, 38294, 38294, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-12-30', 4, 1),
(42349, 'onepunchman', 'OP31-S37', '31 Coupon', 'One Punch Man', 0, 51164, 53211, 52699, 52699, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-12-30', 4, 1),
(42350, 'onepunchman', 'OP45-S37', '45 Coupon', 'One Punch Man', 0, 73123, 76048, 75317, 75317, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-12-30', 4, 1),
(42351, 'onepunchman', 'OP61-S48', '61 Coupon', 'One Punch Man', 0, 99145, 103111, 102119, 102119, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-12-30', 4, 1),
(42352, 'onepunchman', 'OP89-S37', '89 Coupon', 'One Punch Man', 0, 146318, 152171, 150708, 150708, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-12-30', 4, 1),
(42353, 'onepunchman', 'OP91C-S48', '91 Coupon', 'One Punch Man', 0, 148717, 154666, 153179, 153179, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-12-30', 4, 1),
(42354, 'onepunchman', 'OP133-S37', '133 Coupon', 'One Punch Man', 0, 219514, 228295, 226099, 226099, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-12-30', 4, 1),
(42355, 'onepunchman', 'OP177-S37', '177 Coupon', 'One Punch Man', 0, 292710, 304418, 301491, 301491, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-12-30', 4, 1),
(42356, 'onepunchman', 'OP221-S37', '221 Coupon', 'One Punch Man', 0, 365905, 380541, 376882, 376882, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-12-30', 4, 1),
(42357, 'onepunchman', 'OP227-S48', '227 Coupon', 'One Punch Man', 0, 371792, 386664, 382946, 382946, 0, 0, 0, 'one_punch_man.png', '', 1, '2023-12-30', 4, 1),
(42358, 'pubgmglobal', 'PUBGMGLOBAL60-S11', '60 UC (60 + 0)', 'PUBGM GLOBAL', 0, 13316, 13316, 13316, 13316, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42359, 'pubgmglobal', 'PUBGMGLOBAL120-S11', '120 UC (120 + 0)', 'PUBGM GLOBAL', 0, 26631, 26631, 26631, 26631, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42360, 'pubgmglobal', 'PUBGMGLOBAL180-S11', '180 UC (180 + 0)', 'PUBGM GLOBAL', 0, 39947, 39947, 39947, 39947, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42361, 'pubgmglobal', 'PUBGMGLOBAL240-S11', '240 UC (240 + 0)', 'PUBGM GLOBAL', 0, 53262, 53262, 53262, 53262, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42362, 'pubgmglobal', 'PUBGMGLOBAL325-S11', '325 UC (300 + 25)', 'PUBGM GLOBAL', 0, 67116, 67116, 67116, 67116, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42363, 'pubgmglobal', 'PUBGMGLOBAL385-S11', '385 UC (360 + 25)', 'PUBGM GLOBAL', 0, 80431, 80431, 80431, 80431, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42364, 'pubgmglobal', 'PUBGMGLOBAL445-S11', '445 UC (420 + 25)', 'PUBGM GLOBAL', 0, 93747, 93747, 93747, 93747, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42365, 'pubgmglobal', 'PUBGMGLOBAL505-S11', '505 UC (480 + 25)', 'PUBGM GLOBAL', 0, 107062, 107062, 107062, 107062, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42366, 'pubgmglobal', 'PUBGMGLOBAL650-S11', '650 UC (600 + 50)', 'PUBGM GLOBAL', 0, 134231, 134231, 134231, 134231, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42367, 'pubgmglobal', 'PUBGMGLOBAL660-S11', '660 UC (600 + 60)', 'PUBGM GLOBAL', 0, 134366, 134366, 134366, 134366, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42368, 'pubgmglobal', 'PUBGMGLOBAL-720S11', '720 UC (600  + 120)', 'PUBGM GLOBAL', 0, 147681, 147681, 147681, 147681, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42369, 'pubgmglobal', 'PUBGMGLOBAL975-S11', '975 UC (900 + 75)', 'PUBGM GLOBAL', 0, 201347, 201347, 201347, 201347, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42370, 'pubgmglobal', 'PUBGMGLOBAL985-S11', '985 UC (900 +  85)', 'PUBGM GLOBAL', 0, 201481, 201481, 201481, 201481, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42371, 'pubgmglobal', 'PUBGMGLOBAL1045-S11', '1045 UC (950 +85)', 'PUBGM GLOBAL', 0, 214797, 214797, 214797, 214797, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42372, 'pubgmglobal', 'PUBGMGLOBAL1320-S11', '1320 UC (1200 + 120)', 'PUBGM GLOBAL', 0, 268731, 268731, 268731, 268731, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42373, 'pubgmglobal', 'PUBGMGLOBAL1800-S11', '1800 UC (1500 + 300)', 'PUBGM GLOBAL', 0, 336116, 336116, 336116, 336116, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42374, 'pubgmglobal', 'PUBGMGLOBAL1860-S11', '1860 UC (1560 + 300)', 'PUBGM GLOBAL', 0, 349431, 349431, 349431, 349431, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42375, 'pubgmglobal', 'PUBGMGLOBAL2125-S11', '2125 UC (1800 + 325)', 'PUBGM GLOBAL', 0, 403231, 403231, 403231, 403231, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42376, 'pubgmglobal', 'PUBGMGLOBAL2460-S11', '2460 UC (2100 + 360)', 'PUBGM GLOBAL', 0, 470481, 470481, 470481, 470481, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42377, 'pubgmglobal', 'PUBGMGLOBAL2785-S11', '2785 UC (2400 + 385)', 'PUBGM GLOBAL', 0, 537597, 537597, 537597, 537597, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42378, 'pubgmglobal', 'PUBGMGLOBAL3850-S11', '3850 UC (3000 + 850)', 'PUBGM GLOBAL', 0, 672366, 672366, 672366, 672366, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42379, 'pubgmglobal', 'PUBGMGLOBAL3925-S11', '3925 UC (3300 + 625)', 'PUBGM GLOBAL', 0, 739347, 739347, 739347, 739347, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42380, 'pubgmglobal', 'PUBGMGLOBAL4500-S11', '4500 UC (3600 + 900)', 'PUBGM GLOBAL', 0, 806597, 806597, 806597, 806597, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42381, 'pubgmglobal', 'PUBGMGLOBAL5650-S11', '5650 UC (4500 + 1150)', 'PUBGM GLOBAL', 0, 1008481, 1008481, 1008481, 1008481, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42382, 'pubgmglobal', 'PUBGMGLOBAL6310-S11', '6310 UC (5100 + 1210)', 'PUBGM GLOBAL', 0, 1142847, 1142847, 1142847, 1142847, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42383, 'pubgmglobal', 'PUBGMGLOBALPRM8100-S14', '8100 UC PROMO (6000 + 2100)', 'PUBGM GLOBAL', 0, 1277000, 1277000, 1277000, 1277000, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42384, 'pubgmglobal', 'UCG8100-S5', 'TESTED SERVICES', 'PUBGM GLOBAL', 0, 1276800, 1276800, 1276800, 1276800, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42385, 'pubgmglobal', 'PUBGMGLOBAL8100-S11', '8100 UC (6000 + 2100)', 'PUBGM GLOBAL', 0, 1344866, 1344866, 1344866, 1344866, 0, 0, 0, 'pubgm_global.png', '', 1, '2023-12-30', 4, 1),
(42386, 'pubgmindoa', 'UCPUBGM300_25-S50', '300 + 25 UC', 'PUBGM INDO A', 0, 60475, 62894, 62289, 62289, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-12-30', 4, 1),
(42387, 'pubgmindoa', 'UCPUBGM300_25-S104', '300 + 25 UC', 'PUBGM INDO A', 0, 60475, 62894, 62289, 62289, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-12-30', 4, 1),
(42388, 'pubgmindoa', 'UCPUBGM300_25-S1000', '300 + 25 UC', 'PUBGM INDO A', 0, 62666, 65173, 64546, 64546, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-12-30', 4, 1),
(42389, 'pubgmindoa', 'UCPUBGM600_60-S50', '600 + 60 UC', 'PUBGM INDO A', 0, 120815, 125648, 124439, 124439, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-12-30', 4, 1),
(42390, 'pubgmindoa', 'UCPUBGM600_60-S104', '600 + 60 UC', 'PUBGM INDO A', 0, 120815, 125648, 124439, 124439, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-12-30', 4, 1),
(42391, 'pubgmindoa', 'UCPUBGM600_60-S1000', '600 + 60 UC', 'PUBGM INDO A', 0, 125332, 130345, 129092, 129092, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-12-30', 4, 1),
(42392, 'pubgmindoa', 'RPPUBGM-S50', 'Upgrade RP', 'PUBGM INDO A', 0, 145006, 150806, 149356, 149356, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-12-30', 4, 1),
(42393, 'pubgmindoa', 'UCPUBGM1500_300-S50', '1500 + 300 UC', 'PUBGM INDO A', 0, 302106, 314190, 311169, 311169, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-12-30', 4, 1),
(42394, 'pubgmindoa', 'UCPUBGM1500_300-S104', '1500 + 300 UC', 'PUBGM INDO A', 0, 302106, 314190, 311169, 311169, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-12-30', 4, 1),
(42395, 'pubgmindoa', 'UCPUBGM1500_300-S1000', '1500 + 300 UC', 'PUBGM INDO A', 0, 313331, 325864, 322731, 322731, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-12-30', 4, 1),
(42396, 'pubgmindoa', 'UCPUBGM1800_325-S104', '1800 + 325 UC', 'PUBGM INDO A', 0, 362580, 377083, 373457, 373457, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-12-30', 4, 1),
(42397, 'pubgmindoa', 'UCPUBGM1800_325-S50', '1800 + 325 UC', 'PUBGM INDO A', 0, 362580, 377083, 373457, 373457, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-12-30', 4, 1),
(42398, 'pubgmindoa', 'RPELPUBGM-S50', 'Upgrade Elite RP', 'PUBGM INDO A', 0, 370289, 385101, 381398, 381398, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-12-30', 4, 1),
(42399, 'pubgmindoa', 'UCPUBGM3000_850-S50', '3000 + 850 UC', 'PUBGM INDO A', 0, 604212, 628380, 622338, 622338, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-12-30', 4, 1),
(42400, 'pubgmindoa', 'UCPUBGM3000_850-S104', '3000 + 850 UC', 'PUBGM INDO A', 0, 604212, 628380, 622338, 622338, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-12-30', 4, 1),
(42401, 'pubgmindoa', 'UCPUBGM3000_850-S1000', '3000 + 850 UC', 'PUBGM INDO A', 0, 626661, 651727, 645461, 645461, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-12-30', 4, 1),
(42402, 'pubgmindoa', 'UCPUBGM6000_2100-S50', '6000 + 2100 UC', 'PUBGM INDO A', 0, 1208424, 1256761, 1244677, 1244677, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-12-30', 4, 1),
(42403, 'pubgmindoa', 'UCPUBGM6000_2100-S104', '6000 + 2100 UC', 'PUBGM INDO A', 0, 1208424, 1256761, 1244677, 1244677, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-12-30', 4, 1),
(42404, 'pubgmindoa', 'UCPUBGM6000_2100-S1000', '6000 + 2100 UC', 'PUBGM INDO A', 0, 1253322, 1303455, 1290922, 1290922, 0, 0, 0, 'pubgm_indo_a.png', '', 1, '2023-12-30', 4, 1),
(42405, 'ragnarokmeternallove', 'ROM6-S50', '6 BCC', 'Ragnarok M Eternal Love', 0, 13158, 13158, 13158, 13158, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42406, 'ragnarokmeternallove', 'ROM6-S104', '6 BCC', 'Ragnarok M Eternal Love', 0, 13158, 13158, 13158, 13158, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42407, 'ragnarokmeternallove', 'ROM12-S50', '12 BCC', 'Ragnarok M Eternal Love', 0, 25120, 25120, 25120, 25120, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42408, 'ragnarokmeternallove', 'ROM12-S104', '12 BCC', 'Ragnarok M Eternal Love', 0, 25120, 25120, 25120, 25120, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42409, 'ragnarokmeternallove', 'ROM18-S50', '18 BCC', 'Ragnarok M Eternal Love', 0, 38279, 38279, 38279, 38279, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42410, 'ragnarokmeternallove', 'ROM18-S104', '18 BCC', 'Ragnarok M Eternal Love', 0, 38279, 38279, 38279, 38279, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42411, 'ragnarokmeternallove', 'ROM24-S50', '24 BCC', 'Ragnarok M Eternal Love', 0, 51436, 51436, 51436, 51436, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42412, 'ragnarokmeternallove', 'ROM24-S104', '24 BCC', 'Ragnarok M Eternal Love', 0, 51436, 51436, 51436, 51436, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42413, 'ragnarokmeternallove', 'ROM30-S50', '36 BCC (S)', 'Ragnarok M Eternal Love', 0, 59544, 59544, 59544, 59544, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42414, 'ragnarokmeternallove', 'ROM30-S104', '36 BCC (S)', 'Ragnarok M Eternal Love', 0, 59544, 59544, 59544, 59544, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42415, 'ragnarokmeternallove', 'ROMPREMI-S104', 'Premium', 'Ragnarok M Eternal Love', 0, 93038, 93038, 93038, 93038, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42416, 'ragnarokmeternallove', 'ROMPREMI-S50', 'Premium', 'Ragnarok M Eternal Love', 0, 93038, 93038, 93038, 93038, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42417, 'ragnarokmeternallove', 'ROM72-S104', '72 BCC', 'Ragnarok M Eternal Love', 0, 114702, 114702, 114702, 114702, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42418, 'ragnarokmeternallove', 'ROM72-S50', '72 BCC', 'Ragnarok M Eternal Love', 0, 114702, 114702, 114702, 114702, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42419, 'ragnarokmeternallove', 'ROM90-S50', '90 BCC', 'Ragnarok M Eternal Love', 0, 157367, 157367, 157367, 157367, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42420, 'ragnarokmeternallove', 'ROM90-S104', '90 BCC', 'Ragnarok M Eternal Love', 0, 157367, 157367, 157367, 157367, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42421, 'ragnarokmeternallove', 'ROM120-S104', '145 BCC (M)', 'Ragnarok M Eternal Love', 0, 228208, 228208, 228208, 228208, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42422, 'ragnarokmeternallove', 'ROM120-S50', '145 BCC (M)', 'Ragnarok M Eternal Love', 0, 228208, 228208, 228208, 228208, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42423, 'ragnarokmeternallove', 'ROM300-S27', '373 BCC (L)', 'Ragnarok M Eternal Love', 0, 576030, 576030, 576030, 576030, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42424, 'ragnarokmeternallove', 'ROM298-S50', '373 BCC (L)', 'Ragnarok M Eternal Love', 0, 573377, 573377, 573377, 573377, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42425, 'ragnarokmeternallove', 'ROM298-S104', '373 BCC (L)', 'Ragnarok M Eternal Love', 0, 573377, 573377, 573377, 573377, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42426, 'ragnarokmeternallove', 'ROM598-S104', '748 BCC (XL)', 'Ragnarok M Eternal Love', 0, 1142500, 1142500, 1142500, 1142500, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42427, 'ragnarokmeternallove', 'ROM598-S50', '748 BCC (XL)', 'Ragnarok M Eternal Love', 0, 1142500, 1142500, 1142500, 1142500, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42428, 'ragnarokmeternallove', 'ROM929-S50', '929 BCC (S-M-XL)', 'Ragnarok M Eternal Love', 0, 1430252, 1430252, 1430252, 1430252, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42429, 'ragnarokmeternallove', 'ROM929-S104', '929 BCC (S-M-XL)', 'Ragnarok M Eternal Love', 0, 1430252, 1430252, 1430252, 1430252, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42430, 'ragnarokmeternallove', 'ROM1496-S50', '1496 BCC', 'Ragnarok M Eternal Love', 0, 2041109, 2041109, 2041109, 2041109, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42431, 'ragnarokmeternallove', 'ROMALLBCC-S104', 'All Pack BCC', 'Ragnarok M Eternal Love', 0, 2143451, 2143451, 2143451, 2143451, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42432, 'ragnarokmeternallove', 'ROMALLBCC-S50', 'All Pack BCC', 'Ragnarok M Eternal Love', 0, 2143451, 2143451, 2143451, 2143451, 0, 0, 0, 'ragnarok_m_eternal_love.png', '', 1, '2023-12-30', 4, 1),
(42433, 'ragnarokorigin', 'ROOGLOBAL40-S5', '40 Nyan Berry', 'Ragnarok Origin', 0, 12386, 12386, 12386, 12386, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42434, 'ragnarokorigin', 'ROOGLOBAL40-S111', '40 Nyan Berry', 'Ragnarok Origin', 0, 12413, 12413, 12413, 12413, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42435, 'ragnarokorigin', 'ROOGLOBAL125-S5', '125 Nyan Berry', 'Ragnarok Origin', 0, 36658, 36658, 36658, 36658, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42436, 'ragnarokorigin', 'ROOGLOBAL125-S111', '125 Nyan Berry', 'Ragnarok Origin', 0, 36743, 36743, 36743, 36743, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42437, 'ragnarokorigin', 'ROOGLOBAL210-S5', '210 Nyan Berry', 'Ragnarok Origin', 0, 61009, 61009, 61009, 61009, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42438, 'ragnarokorigin', 'ROOGLOBAL210-S111', '210 Nyan Berry', 'Ragnarok Origin', 0, 61073, 61073, 61073, 61073, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42439, 'ragnarokorigin', 'ROOGLOBAL430-S5', '430 Nyan Berry', 'Ragnarok Origin', 0, 117580, 117580, 117580, 117580, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42440, 'ragnarokorigin', 'ROOGLOBAL430-S111', '430 Nyan Berry', 'Ragnarok Origin', 0, 117807, 117807, 117807, 117807, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42441, 'ragnarokorigin', 'ROOGLOBAL900-S5', '900 Nyan Berry', 'Ragnarok Origin', 0, 244350, 244350, 244350, 244350, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42442, 'ragnarokorigin', 'ROOGLOBAL900-S111', '900 Nyan Berry', 'Ragnarok Origin', 0, 244787, 244787, 244787, 244787, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42443, 'ragnarokorigin', 'ROOGLOBAL1025-S5', '1025 Nyan Berry', 'Ragnarok Origin', 0, 281008, 281008, 281008, 281008, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42444, 'ragnarokorigin', 'ROOGLOBAL1025-S111', '1025 Nyan Berry', 'Ragnarok Origin', 0, 281530, 281530, 281530, 281530, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42445, 'ragnarokorigin', 'ROOGLOBAL2300-S5', '2300 Nyan Berry', 'Ragnarok Origin', 0, 621968, 621968, 621968, 621968, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42446, 'ragnarokorigin', 'ROOGLOBAL2300-S111', '2300 Nyan Berry', 'Ragnarok Origin', 0, 622992, 622992, 622992, 622992, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42447, 'ragnarokorigin', 'ROOGLOBAL4800-S5', '4800 Nyan Berry', 'Ragnarok Origin', 0, 1248450, 1248450, 1248450, 1248450, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42448, 'ragnarokorigin', 'ROOGLOBAL4800-S46', '4800 Nyan Berry', 'Ragnarok Origin', 0, 1263675, 1263675, 1263675, 1263675, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42449, 'ragnarokorigin', 'ROOGLOBAL9600-S5', '9600 Nyan Berry', 'Ragnarok Origin', 0, 2496900, 2496900, 2496900, 2496900, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42450, 'ragnarokorigin', 'ROOGLOBAL24000-S5', '4800 Nyan Berry x 5', 'Ragnarok Origin', 0, 6242250, 6242250, 6242250, 6242250, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42451, 'ragnarokorigin', 'ROOGLOBAL24000-S46', '4800 Nyan Berry x 5', 'Ragnarok Origin', 0, 6318375, 6318375, 6318375, 6318375, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42452, 'ragnarokorigin', 'ROOGLOBAL48000-S5', '4800 Nyan Berry x 10', 'Ragnarok Origin', 0, 12484500, 12484500, 12484500, 12484500, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42453, 'ragnarokorigin', 'ROOGLOBAL48000-S46', '4800 Nyan Berry x 10', 'Ragnarok Origin', 0, 12636750, 12636750, 12636750, 12636750, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42454, 'ragnarokorigin', 'ROOGLOBAL480002-S111', '48000 Nyan Berry', 'Ragnarok Origin', 0, 12860050, 12860050, 12860050, 12860050, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42455, 'ragnarokorigin', 'ROOGLOBAL72000-S5', '4800 Nyan Berry x 15', 'Ragnarok Origin', 0, 18726750, 18726750, 18726750, 18726750, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42456, 'ragnarokorigin', 'ROOGLOBAL96000-S5', '4800 Nyan Berry x 20', 'Ragnarok Origin', 0, 24969000, 24969000, 24969000, 24969000, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42457, 'ragnarokorigin', 'ROOGLOBAL120000-S5', '4800 Nyan Berry x 25', 'Ragnarok Origin', 0, 31211250, 31211250, 31211250, 31211250, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42458, 'ragnarokorigin', 'ROOGLOBAL144000-S5', '4800 Nyan Berry x 30', 'Ragnarok Origin', 0, 37453500, 37453500, 37453500, 37453500, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42459, 'ragnarokorigin', 'ROOGLOBAL168000-S5', '4800 Nyan Berry x 35', 'Ragnarok Origin', 0, 43695750, 43695750, 43695750, 43695750, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42460, 'ragnarokorigin', 'ROOGLOBAL216000-S5', '4800 Nyan Berry x 45', 'Ragnarok Origin', 0, 56180250, 56180250, 56180250, 56180250, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42461, 'ragnarokorigin', 'ROOGLOBAL240000-S5', '4800 Nyan Berry x 50', 'Ragnarok Origin', 0, 62422500, 62422500, 62422500, 62422500, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42462, 'ragnarokorigin', 'ROOGLOBAL480000-S5', '4800 Nyan Berry x 100', 'Ragnarok Origin', 0, 124845000, 124845000, 124845000, 124845000, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42463, 'ragnarokorigin', 'ROOGLOBALCUSTOM-S5', 'Custom Package', 'Ragnarok Origin', 0, 142100000, 142100000, 142100000, 142100000, 0, 0, 0, 'ragnarok_origin.png', '', 1, '2023-12-30', 4, 1),
(42464, 'ragnarokxnextgeneration', 'ROXID2110-S14', '2110 Diamonds', 'RagnaroK X Next Generation', 0, 58217, 60546, 59964, 59964, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-12-30', 4, 1),
(42465, 'ragnarokxnextgeneration', 'ROXID2360-S104', '2360 Diamonds', 'RagnaroK X Next Generation', 0, 59810, 62202, 61604, 61604, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-12-30', 4, 1),
(42466, 'ragnarokxnextgeneration', 'ROXID4720-S104', '4720 Diamonds', 'RagnaroK X Next Generation', 0, 119487, 124266, 123072, 123072, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-12-30', 4, 1),
(42467, 'ragnarokxnextgeneration', 'ROXIDSPPCK1-S104', 'Razer Rogue Backpack', 'RagnaroK X Next Generation', 0, 129455, 134633, 133339, 133339, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-12-30', 4, 1),
(42468, 'ragnarokxnextgeneration', 'ROXID5220-S14', '5220 Diamonds', 'RagnaroK X Next Generation', 0, 145543, 151365, 149909, 149909, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-12-30', 4, 1),
(42469, 'ragnarokxnextgeneration', 'ROXIDSPPCK2-S104', 'Razer Kraken Kitty - Black', 'RagnaroK X Next Generation', 0, 192853, 200567, 198639, 198639, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-12-30', 4, 1),
(42470, 'ragnarokxnextgeneration', 'ROXIDSPPCK3-S104', 'Razer Kraken Kitty - Pink', 'RagnaroK X Next Generation', 0, 192853, 200567, 198639, 198639, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-12-30', 4, 1),
(42471, 'ragnarokxnextgeneration', 'ROXIDVIPKAFRA-S104', 'VIP - Kafra W', 'RagnaroK X Next Generation', 0, 193784, 201535, 199598, 199598, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-12-30', 4, 1),
(42472, 'ragnarokxnextgeneration', 'ROXID8400-S14', '8400 Diamonds', 'RagnaroK X Next Generation', 0, 232868, 242183, 239854, 239854, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-12-30', 4, 1),
(42473, 'ragnarokxnextgeneration', 'ROXID9490-S104', '9490 Diamonds', 'RagnaroK X Next Generation', 0, 238974, 248533, 246143, 246143, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-12-30', 4, 1),
(42474, 'ragnarokxnextgeneration', 'ROXID10430-S14', '10430 Diamonds', 'RagnaroK X Next Generation', 0, 291085, 302728, 299818, 299818, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-12-30', 4, 1),
(42475, 'ragnarokxnextgeneration', 'ROXIDVIPKAFRA2-S104', 'VIP - Kafra Telling', 'RagnaroK X Next Generation', 0, 329485, 342664, 339370, 339370, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-12-30', 4, 1),
(42476, 'ragnarokxnextgeneration', 'ROXID19380-S104', '19380 Diamonds', 'RagnaroK X Next Generation', 0, 478080, 497203, 492422, 492422, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-12-30', 4, 1),
(42477, 'ragnarokxnextgeneration', 'ROXIDVIPKAFRA3-S104', 'VIP - Kafra Clarice', 'RagnaroK X Next Generation', 0, 518750, 539500, 534313, 534313, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-12-30', 4, 1),
(42478, 'ragnarokxnextgeneration', 'ROXID20830-S14', '20830 Diamonds', 'RagnaroK X Next Generation', 0, 582169, 605456, 599634, 599634, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-12-30', 4, 1),
(42479, 'ragnarokxnextgeneration', 'ROXID31240-S14', '31240 Diamonds', 'RagnaroK X Next Generation', 0, 873255, 908185, 899453, 899453, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-12-30', 4, 1),
(42480, 'ragnarokxnextgeneration', 'ROXID48700-S104', '48700 Diamonds', 'RagnaroK X Next Generation', 0, 1195000, 1242800, 1230850, 1230850, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-12-30', 4, 1),
(42481, 'ragnarokxnextgeneration', 'ROXID53470-S14', '53470 Diamonds', 'RagnaroK X Next Generation', 0, 1455425, 1513642, 1499088, 1499088, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-12-30', 4, 1),
(42482, 'ragnarokxnextgeneration', 'ROXID98100-S104', '98100 Diamonds', 'RagnaroK X Next Generation', 0, 2390133, 2485738, 2461837, 2461837, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-12-30', 4, 1),
(42483, 'ragnarokxnextgeneration', 'ROXID137550-S104', '137550 Diamonds', 'RagnaroK X Next Generation', 0, 3346160, 3480006, 3446545, 3446545, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-12-30', 4, 1),
(42484, 'ragnarokxnextgeneration', 'ROXID231990-S14', '231990 Diamonds', 'RagnaroK X Next Generation', 0, 5414619, 5631204, 5577058, 5577058, 0, 0, 0, 'ragnarok_x_next_generation.png', '', 1, '2023-12-30', 4, 1),
(42485, 'revelationinfinitejourney', 'RVLNM40-S81', '40 + 6 Bonus', 'Revelation Infinite Journey', 0, 8831, 8831, 8831, 8831, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42486, 'revelationinfinitejourney', 'RVLNMKB7-S81', 'Kartu Bulanan 7 Hari', 'Revelation Infinite Journey', 0, 8831, 8831, 8831, 8831, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42487, 'revelationinfinitejourney', 'RVLNMPP-S81', 'Newbie Pack', 'Revelation Infinite Journey', 0, 8831, 8831, 8831, 8831, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42488, 'revelationinfinitejourney', 'RVLNMP1TP-S81', 'Webpay Gift - Newbie', 'Revelation Infinite Journey', 0, 8831, 8831, 8831, 8831, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42489, 'revelationinfinitejourney', 'RVLNM110-S81', '110 + 17 Bonus', 'Revelation Infinite Journey', 0, 22076, 22076, 22076, 22076, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42490, 'revelationinfinitejourney', 'RVLNMSP30GEP-S26', 'Gear Enhancing Pack', 'Revelation Infinite Journey', 0, 25464, 25464, 25464, 25464, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42491, 'revelationinfinitejourney', 'RVLNM230-S81', '230 + 35 Bonus', 'Revelation Infinite Journey', 0, 44153, 44153, 44153, 44153, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42492, 'revelationinfinitejourney', 'RVLNMPWG-S26', 'Primary Weaver Giftpack', 'Revelation Infinite Journey', 0, 55645, 55645, 55645, 55645, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42493, 'revelationinfinitejourney', 'RVLNMKBK-S81', 'Kartu Bulanan Klasik', 'Revelation Infinite Journey', 0, 57398, 57398, 57398, 57398, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42494, 'revelationinfinitejourney', 'RVLNMBPC-S81', 'Battle Pass Classic', 'Revelation Infinite Journey', 0, 57398, 57398, 57398, 57398, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42495, 'revelationinfinitejourney', 'RVLNMPD-S81', 'Paket Diskon', 'Revelation Infinite Journey', 0, 57398, 57398, 57398, 57398, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42496, 'revelationinfinitejourney', 'RVLNMSP30FBP-S26', 'Familiars Bracing Pack', 'Revelation Infinite Journey', 0, 74508, 74508, 74508, 74508, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42497, 'revelationinfinitejourney', 'RVLNM460-S81', '460 + 69 Bonus', 'Revelation Infinite Journey', 0, 88305, 88305, 88305, 88305, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42498, 'revelationinfinitejourney', 'RVLNMKBS-S81', 'Kartu Bulanan Superior', 'Revelation Infinite Journey', 0, 114797, 114797, 114797, 114797, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42499, 'revelationinfinitejourney', 'RVLNMGF-S81', 'Growth Fund', 'Revelation Infinite Journey', 0, 114797, 114797, 114797, 114797, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42500, 'revelationinfinitejourney', 'RVLNMBPS-S81', 'Battle Pass Spesial', 'Revelation Infinite Journey', 0, 114797, 114797, 114797, 114797, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42501, 'revelationinfinitejourney', 'RVLNMPS-S81', 'Paket Spesial', 'Revelation Infinite Journey', 0, 114797, 114797, 114797, 114797, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42502, 'revelationinfinitejourney', 'RVLNMIWG-S26', 'Intermediate Weaver Giftpack', 'Revelation Infinite Journey', 0, 125438, 125438, 125438, 125438, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42503, 'revelationinfinitejourney', 'RVLNMSP30NPP-S26', 'Newbie Promotional Pack', 'Revelation Infinite Journey', 0, 149016, 149016, 149016, 149016, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42504, 'revelationinfinitejourney', 'RVLNM920-S81', '920 + 138 Bonus', 'Revelation Infinite Journey', 0, 176610, 176610, 176610, 176610, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42505, 'revelationinfinitejourney', 'RVLNM1150-S81', '1150 + 173 Bonus', 'Revelation Infinite Journey', 0, 220763, 220763, 220763, 220763, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42506, 'revelationinfinitejourney', 'RVLNMAWG-S26', 'Advanced Weaver Giftpack', 'Revelation Infinite Journey', 0, 244273, 244273, 244273, 244273, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42507, 'revelationinfinitejourney', 'RVLNM1380-S81', '1380 + 207 Bonus', 'Revelation Infinite Journey', 0, 264915, 264915, 264915, 264915, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42508, 'revelationinfinitejourney', 'RVLNM1610-S81', '1610 + 242 Bonus', 'Revelation Infinite Journey', 0, 309068, 309068, 309068, 309068, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42509, 'revelationinfinitejourney', 'RVLNMSP30GUP-S26', 'Gear Upgrading Pack', 'Revelation Infinite Journey', 0, 394232, 394232, 394232, 394232, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42510, 'revelationinfinitejourney', 'RVLNMDGC-S81M', 'Daily Gift Combo (7 Days)', 'Revelation Infinite Journey', 0, 397373, 397373, 397373, 397373, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42511, 'revelationinfinitejourney', 'RVLNM2300-S81', '2300 + 345 Bonus', 'Revelation Infinite Journey', 0, 441525, 441525, 441525, 441525, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42512, 'revelationinfinitejourney', 'RVLNM3220-S81', '3220 + 483 Bonus', 'Revelation Infinite Journey', 0, 618135, 618135, 618135, 618135, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42513, 'revelationinfinitejourney', 'RVLNM4600-S81', '4600 + 690 Bonus', 'Revelation Infinite Journey', 0, 883050, 883050, 883050, 883050, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42514, 'revelationinfinitejourney', 'RVLNMSWG-S26', 'Special Weaver Giftpack', 'Revelation Infinite Journey', 0, 1195899, 1195899, 1195899, 1195899, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42515, 'revelationinfinitejourney', 'RVLNMSP30FSP-S26', 'Familiars Strengthen Pack', 'Revelation Infinite Journey', 0, 1216648, 1216648, 1216648, 1216648, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42516, 'revelationinfinitejourney', 'RVLNM9200-S81', '9200 + 1380 Bonus', 'Revelation Infinite Journey', 0, 1766100, 1766100, 1766100, 1766100, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42517, 'revelationinfinitejourney', 'RVLNM23000-S81', '23000 + 3450 Bonus', 'Revelation Infinite Journey', 0, 4415250, 4415250, 4415250, 4415250, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42518, 'revelationinfinitejourney', 'RVLNM115000-S81', '23000 + 3450 Bonus x 5', 'Revelation Infinite Journey', 0, 22076250, 22076250, 22076250, 22076250, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42519, 'revelationinfinitejourney', 'RVLNM230000-S81', '23000 + 3450 Bonus x 10', 'Revelation Infinite Journey', 0, 44152500, 44152500, 44152500, 44152500, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42520, 'revelationinfinitejourney', 'RVLNM575000-S81', '23000 + 3450 Bonus x 25', 'Revelation Infinite Journey', 0, 110381250, 110381250, 110381250, 110381250, 0, 0, 0, 'revelation_infinite_journey.png', '', 1, '2023-12-30', 4, 1),
(42521, 'sausageman', 'SM60-S50', '60 Candy', 'Sausage Man', 0, 11638, 12104, 11987, 11987, 0, 0, 0, 'sausage_man.png', '', 1, '2023-12-30', 4, 1),
(42522, 'sausageman', 'SM180-S50', '180 Candy', 'Sausage Man', 0, 35445, 36863, 36508, 36508, 0, 0, 0, 'sausage_man.png', '', 1, '2023-12-30', 4, 1),
(42523, 'sausageman', 'SM316-S50', '316 Candy', 'Sausage Man', 0, 59251, 61621, 61029, 61029, 0, 0, 0, 'sausage_man.png', '', 1, '2023-12-30', 4, 1),
(42524, 'sausageman', 'SM718-S50', '718 Candy', 'Sausage Man', 0, 118634, 123379, 122193, 122193, 0, 0, 0, 'sausage_man.png', '', 1, '2023-12-30', 4, 1),
(42525, 'sausageman', 'SM1368-S50', '1368 Candy', 'Sausage Man', 0, 237532, 247033, 244658, 244658, 0, 0, 0, 'sausage_man.png', '', 1, '2023-12-30', 4, 1),
(42526, 'sausageman', 'SM2118-S50', '2118 Candy', 'Sausage Man', 0, 354314, 368487, 364943, 364943, 0, 0, 0, 'sausage_man.png', '', 1, '2023-12-30', 4, 1),
(42527, 'sausageman', 'SM3548-S50', '3548 Candy', 'Sausage Man', 0, 592242, 615932, 610009, 610009, 0, 0, 0, 'sausage_man.png', '', 1, '2023-12-30', 4, 1),
(42528, 'sausageman', 'SM7048-S50', '7048 Candy', 'Sausage Man', 0, 1186733, 1234202, 1222335, 1222335, 0, 0, 0, 'sausage_man.png', '', 1, '2023-12-30', 4, 1),
(42529, 'steamwalletcode', 'STEAM12-S22', 'IDR 12.000 SWC', 'Steam Wallet Code', 0, 12023, 12504, 12384, 12384, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-12-30', 4, 1),
(42530, 'steamwalletcode', 'STEAM45-S22', 'IDR 45.000 SWC', 'Steam Wallet Code', 0, 44961, 46759, 46310, 46310, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-12-30', 4, 1),
(42531, 'steamwalletcode', 'STEAM60-S22', 'IDR 60.000 SWC', 'Steam Wallet Code', 0, 59949, 62347, 61747, 61747, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-12-30', 4, 1),
(42532, 'steamwalletcode', 'STEAM90-S22', 'IDR 90.000 SWC', 'Steam Wallet Code', 0, 89923, 93520, 92621, 92621, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-12-30', 4, 1),
(42533, 'steamwalletcode', 'STEAM120-S22', 'IDR 120.000 SWC', 'Steam Wallet Code', 0, 119897, 124693, 123494, 123494, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-12-30', 4, 1),
(42534, 'steamwalletcode', 'STEAM250-S22', 'IDR 250.000 SWC', 'Steam Wallet Code', 0, 249676, 259663, 257166, 257166, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-12-30', 4, 1),
(42535, 'steamwalletcode', 'STEAM400-S22', 'IDR 400.000 SWC', 'Steam Wallet Code', 0, 399547, 415529, 411533, 411533, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-12-30', 4, 1),
(42536, 'steamwalletcode', 'STEAM600-S22', 'IDR 600.000 SWC', 'Steam Wallet Code', 0, 599321, 623294, 617301, 617301, 0, 0, 0, 'steam_wallet_code.png', '', 1, '2023-12-30', 4, 1),
(42537, 'supersus', 'SS100-S1', '100 Golden Star', 'Super Sus', 0, 12700, 13208, 13081, 13081, 0, 0, 0, 'super_sus.png', '', 1, '2023-12-30', 4, 1),
(42538, 'supersus', 'SS300-S1', '300 Golden Star', 'Super Sus', 0, 31750, 33020, 32703, 32703, 0, 0, 0, 'super_sus.png', '', 1, '2023-12-30', 4, 1),
(42539, 'supersus', 'SS520-S1', '520 Golden Star', 'Super Sus', 0, 57150, 59436, 58865, 58865, 0, 0, 0, 'super_sus.png', '', 1, '2023-12-30', 4, 1),
(42540, 'supersus', 'SS2180-S1', '2180 Golden Star', 'Super Sus', 0, 222250, 231140, 228918, 228918, 0, 0, 0, 'super_sus.png', '', 1, '2023-12-30', 4, 1),
(42541, 'supersus', 'SS5600-S1', '5600 Golden Star', 'Super Sus', 0, 571500, 594360, 588645, 588645, 0, 0, 0, 'super_sus.png', '', 1, '2023-12-30', 4, 1),
(42542, 'tiktokmusic', 'TIKTOKMUSICADMIN1BLN-S1', 'Admin FamilyPlan [ 1 BULAN ] [ 5 ANGGOTA ]', 'TikTok Music', 0, 13500, 13500, 13500, 13500, 0, 0, 0, 'tiktok_music.png', '', 1, '2023-12-30', 4, 1),
(42543, 'tomandjerrychase', 'TJ60-S14', '60 Diamonds', 'Tom and Jerry Chase', 0, 14383, 14958, 14814, 14814, 0, 0, 0, 'tom_and_jerry_chase.png', '', 1, '2023-12-30', 4, 1),
(42544, 'tomandjerrychase', 'TJ180-S14', '180 Diamonds', 'Tom and Jerry Chase', 0, 40324, 41937, 41534, 41534, 0, 0, 0, 'tom_and_jerry_chase.png', '', 1, '2023-12-30', 4, 1),
(42545, 'tomandjerrychase', 'TJ300-S14', '300 Diamonds', 'Tom and Jerry Chase', 0, 66264, 68915, 68252, 68252, 0, 0, 0, 'tom_and_jerry_chase.png', '', 1, '2023-12-30', 4, 1),
(42546, 'tomandjerrychase', 'TJ600-S14', '600 Diamonds', 'Tom and Jerry Chase', 0, 135440, 140858, 139503, 139503, 0, 0, 0, 'tom_and_jerry_chase.png', '', 1, '2023-12-30', 4, 1),
(42547, 'tomandjerrychase', 'TJ1200-S14', '1200 Diamonds', 'Tom and Jerry Chase', 0, 273791, 284743, 282005, 282005, 0, 0, 0, 'tom_and_jerry_chase.png', '', 1, '2023-12-30', 4, 1),
(42548, 'tomandjerrychase', 'TJ1800-S14', '1800 Diamonds', 'Tom and Jerry Chase', 0, 417906, 434622, 430443, 430443, 0, 0, 0, 'tom_and_jerry_chase.png', '', 1, '2023-12-30', 4, 1),
(42549, 'tomandjerrychase', 'TJ3000-S14', '3000 Diamonds', 'Tom and Jerry Chase', 0, 691726, 719395, 712478, 712478, 0, 0, 0, 'tom_and_jerry_chase.png', '', 1, '2023-12-30', 4, 1),
(42550, 'tomandjerrychase', 'TJ6000-S14', '6000 Diamonds', 'Tom and Jerry Chase', 0, 1354658, 1408844, 1395298, 1395298, 0, 0, 0, 'tom_and_jerry_chase.png', '', 1, '2023-12-30', 4, 1),
(42551, 'toweroffantasy', '60DM-S104', '60 Tanium', 'Tower of Fantasy', 0, 11297, 11749, 11636, 11636, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-12-30', 4, 1),
(42552, 'toweroffantasy', 'TOFRS-S104', 'Rookie Supplies', 'Tower of Fantasy', 0, 11297, 11749, 11636, 11636, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-12-30', 4, 1),
(42553, 'toweroffantasy', '180DM-S104', '180 Tanium + Dark crystal 12', 'Tower of Fantasy', 0, 34557, 35939, 35594, 35594, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-12-30', 4, 1),
(42554, 'toweroffantasy', '300DM-S104', '300 Tanium + Dark Crystal 20', 'Tower of Fantasy', 0, 57683, 59990, 59413, 59413, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-12-30', 4, 1),
(42555, 'toweroffantasy', 'TOFMP-S104', 'Monthly Pass', 'Tower of Fantasy', 0, 57683, 59990, 59413, 59413, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-12-30', 4, 1),
(42556, 'toweroffantasy', 'TOFAP-S104', 'Adventure Pack', 'Tower of Fantasy', 0, 57683, 59990, 59413, 59413, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-12-30', 4, 1),
(42557, 'toweroffantasy', 'TOFBP-S104', 'Basic Pass', 'Tower of Fantasy', 0, 115898, 120534, 119375, 119375, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-12-30', 4, 1),
(42558, 'toweroffantasy', 'TOFUP-S104', 'Upgrade Pass', 'Tower of Fantasy', 0, 127462, 132560, 131286, 131286, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-12-30', 4, 1),
(42559, 'toweroffantasy', '980DM-S104', '980 Tanium + Dark Crystal 110', 'Tower of Fantasy', 0, 173980, 180939, 179199, 179199, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-12-30', 4, 1),
(42560, 'toweroffantasy', 'TOFCEP-S104', 'Collectors Edition Pass', 'Tower of Fantasy', 0, 232195, 241483, 239161, 239161, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-12-30', 4, 1),
(42561, 'toweroffantasy', '1980DM-S104', '1980 Tanium + Dark Crystal 270', 'Tower of Fantasy', 0, 348359, 362293, 358810, 358810, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-12-30', 4, 1),
(42562, 'toweroffantasy', '3280DM-S104', '3280 Tanium + Dark Crystal 530', 'Tower of Fantasy', 0, 620028, 644829, 638629, 638629, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-12-30', 4, 1),
(42563, 'toweroffantasy', '6480DM-S104', '6480 Tanium + Dark Crystal 1300', 'Tower of Fantasy', 0, 1162703, 1209211, 1197584, 1197584, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-12-30', 4, 1),
(42564, 'toweroffantasy', '9980DM-S104', '9980 Tanium + Dark Crystal 1977', 'Tower of Fantasy', 0, 1743921, 1813678, 1796239, 1796239, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-12-30', 4, 1),
(42565, 'toweroffantasy', '12980DM-S104', '12980 Tanium + Dark Crystal 3520', 'Tower of Fantasy', 0, 2286596, 2378060, 2355194, 2355194, 0, 0, 0, 'tower_of_fantasy.png', '', 1, '2023-12-30', 4, 1),
(42566, 'valorant', 'VAL125-S70', '125 Points', 'Valorant', 0, 13130, 13655, 13524, 13524, 0, 0, 0, 'valorant.png', '', 1, '2023-12-30', 4, 1),
(42567, 'valorant', 'VAL125-S10', '125 Points', 'Valorant', 0, 13771, 14322, 14184, 14184, 0, 0, 0, 'valorant.png', '', 1, '2023-12-30', 4, 1);
INSERT INTO `tb_produk` (`cuid`, `slug`, `code`, `title`, `kategori`, `subkategori`, `harga_modal`, `harga_jual`, `harga_reseller`, `harga_h2h`, `harga_coret`, `komisi`, `poin`, `image`, `currency`, `status`, `created_date`, `jenis`, `product_type`) VALUES
(42568, 'valorant', 'VAL125-S3', '125 Points', 'Valorant', 0, 14619, 15204, 15058, 15058, 0, 0, 0, 'valorant.png', '', 1, '2023-12-30', 4, 1),
(42569, 'valorant', 'VAL380-S70', '380 Points', 'Valorant', 0, 39289, 40861, 40468, 40468, 0, 0, 0, 'valorant.png', '', 1, '2023-12-30', 4, 1),
(42570, 'valorant', 'VAL375-S10', '375 Points', 'Valorant', 0, 41314, 42967, 42553, 42553, 0, 0, 0, 'valorant.png', '', 1, '2023-12-30', 4, 1),
(42571, 'valorant', 'VAL420-S10', '420 Points', 'Valorant', 0, 45905, 47741, 47282, 47282, 0, 0, 0, 'valorant.png', '', 1, '2023-12-30', 4, 1),
(42572, 'valorant', 'VAL420-S3', '420 Points', 'Valorant', 0, 48730, 50679, 50192, 50192, 0, 0, 0, 'valorant.png', '', 1, '2023-12-30', 4, 1),
(42573, 'valorant', 'VAL700-S10', '700 Points', 'Valorant', 0, 73447, 76385, 75650, 75650, 0, 0, 0, 'valorant.png', '', 1, '2023-12-30', 4, 1),
(42574, 'valorant', 'VAL700-S3', '700 Points', 'Valorant', 0, 77968, 81087, 80307, 80307, 0, 0, 0, 'valorant.png', '', 1, '2023-12-30', 4, 1),
(42575, 'valorant', 'VAL790-S70', '790 Points', 'Valorant', 0, 78477, 81616, 80831, 80831, 0, 0, 0, 'valorant.png', '', 1, '2023-12-30', 4, 1),
(42576, 'valorant', 'VAL795-S10', '795 Points', 'Valorant', 0, 87219, 90708, 89836, 89836, 0, 0, 0, 'valorant.png', '', 1, '2023-12-30', 4, 1),
(42577, 'valorant', 'VAL1375-S10', '1375 Points', 'Valorant', 0, 137714, 143223, 141845, 141845, 0, 0, 0, 'valorant.png', '', 1, '2023-12-30', 4, 1),
(42578, 'valorant', 'VAL1375-S3', '1375 Points', 'Valorant', 0, 146190, 152038, 150576, 150576, 0, 0, 0, 'valorant.png', '', 1, '2023-12-30', 4, 1),
(42579, 'valorant', 'VAL1650-S70', '1650 Points', 'Valorant', 0, 156853, 163127, 161559, 161559, 0, 0, 0, 'valorant.png', '', 1, '2023-12-30', 4, 1),
(42580, 'valorant', 'VAL1625-S10', '1625 Points', 'Valorant', 0, 165256, 171866, 170214, 170214, 0, 0, 0, 'valorant.png', '', 1, '2023-12-30', 4, 1),
(42581, 'valorant', 'VAL2400-S10', '2400 Points', 'Valorant', 0, 229523, 238704, 236409, 236409, 0, 0, 0, 'valorant.png', '', 1, '2023-12-30', 4, 1),
(42582, 'valorant', 'VAL2400-S3', '2400 Points', 'Valorant', 0, 243650, 253396, 250960, 250960, 0, 0, 0, 'valorant.png', '', 1, '2023-12-30', 4, 1),
(42583, 'valorant', 'VAL2850-S70', '2850 Points', 'Valorant', 0, 261287, 271738, 269126, 269126, 0, 0, 0, 'valorant.png', '', 1, '2023-12-30', 4, 1),
(42584, 'valorant', 'VAL2820-S10', '2820 Points', 'Valorant', 0, 275427, 286444, 283690, 283690, 0, 0, 0, 'valorant.png', '', 1, '2023-12-30', 4, 1),
(42585, 'valorant', 'VAL4000-S10', '4000 Points', 'Valorant', 0, 367236, 381925, 378253, 378253, 0, 0, 0, 'valorant.png', '', 1, '2023-12-30', 4, 1),
(42586, 'valorant', 'VAL4000PRM-S5', '4000 Points [PROMO]', 'Valorant', 0, 383680, 399027, 395190, 395190, 0, 0, 0, 'valorant.png', '', 1, '2023-12-30', 4, 1),
(42587, 'valorant', 'VAL4000-S3', '4000 Points', 'Valorant', 0, 389840, 405434, 401535, 401535, 0, 0, 0, 'valorant.png', '', 1, '2023-12-30', 4, 1),
(42588, 'valorant', 'VAL5800-S70', '5800 Points', 'Valorant', 0, 522574, 543477, 538251, 538251, 0, 0, 0, 'valorant.png', '', 1, '2023-12-30', 4, 1),
(42589, 'valorant', 'VAL5795-S10', '5795 Points', 'Valorant', 0, 550854, 572888, 567380, 567380, 0, 0, 0, 'valorant.png', '', 1, '2023-12-30', 4, 1),
(42590, 'valorant', 'VAL8150-S10', '8150 Points', 'Valorant', 0, 734472, 763851, 756506, 756506, 0, 0, 0, 'valorant.png', '', 1, '2023-12-30', 4, 1),
(42591, 'valorant', 'VAL8150-S3', '8150 Points', 'Valorant', 0, 779680, 810867, 803070, 803070, 0, 0, 0, 'valorant.png', '', 1, '2023-12-30', 4, 1),
(42592, 'viupremium', 'VIU1BLN-S1', 'Private 1 Bulan [ AKUN - 1 DEVICES ]', 'Viu Premium', 0, 8000, 8000, 8000, 8000, 0, 0, 0, 'viu_premium.png', '', 1, '2023-12-30', 4, 1),
(42593, 'viupremium', 'VIU3BLN-S1', 'Private 3 Bulan [ AKUN - 1 DEVICES ]', 'Viu Premium', 0, 13000, 13000, 13000, 13000, 0, 0, 0, 'viu_premium.png', '', 1, '2023-12-30', 4, 1),
(42594, 'viupremium', 'VIU6BLN-S1', 'Private 6 Bulan [ AKUN - 1 DEVICES ]', 'Viu Premium', 0, 19000, 19000, 19000, 19000, 0, 0, 0, 'viu_premium.png', '', 1, '2023-12-30', 4, 1),
(42595, 'vouchergarenashell', 'VCGS33-S22', '33 Shells', 'Voucher Garena Shell', 0, 9226, 9226, 9226, 9226, 0, 0, 0, 'voucher_garena_shell.png', '', 1, '2023-12-30', 4, 1),
(42596, 'vouchergarenashell', 'VCGS33-S1000', '33 Shells', 'Voucher Garena Shell', 0, 9338, 9338, 9338, 9338, 0, 0, 0, 'voucher_garena_shell.png', '', 1, '2023-12-30', 4, 1),
(42597, 'vouchergarenashell', 'VCGS66-S22', '66 Shells', 'Voucher Garena Shell', 0, 18453, 18453, 18453, 18453, 0, 0, 0, 'voucher_garena_shell.png', '', 1, '2023-12-30', 4, 1),
(42598, 'vouchergarenashell', 'VCGS66-S1000', '66 Shells', 'Voucher Garena Shell', 0, 18676, 18676, 18676, 18676, 0, 0, 0, 'voucher_garena_shell.png', '', 1, '2023-12-30', 4, 1),
(42599, 'voucherpbzepetto', 'VCPB1200-S22', '1200 PB Cash', 'Voucher PB Zepetto', 0, 9034, 9034, 9034, 9034, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-12-30', 4, 1),
(42600, 'voucherpbzepetto', 'VCPB1200-S1000', '1200 PB Cash', 'Voucher PB Zepetto', 0, 9135, 9135, 9135, 9135, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-12-30', 4, 1),
(42601, 'voucherpbzepetto', 'VCPB2400-S22', '2400 PB Cash', 'Voucher PB Zepetto', 0, 18067, 18067, 18067, 18067, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-12-30', 4, 1),
(42602, 'voucherpbzepetto', 'VCPB2400-S1000', '2400 PB Cash', 'Voucher PB Zepetto', 0, 18270, 18270, 18270, 18270, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-12-30', 4, 1),
(42603, 'voucherpbzepetto', 'VCPB6000-S22', '6000 PB Cash', 'Voucher PB Zepetto', 0, 45168, 45168, 45168, 45168, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-12-30', 4, 1),
(42604, 'voucherpbzepetto', 'VCPB6000-S1000', '6000 PB Cash', 'Voucher PB Zepetto', 0, 45675, 45675, 45675, 45675, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-12-30', 4, 1),
(42605, 'voucherpbzepetto', 'VCPB12000-S22', '12000 PB Cash', 'Voucher PB Zepetto', 0, 90335, 90335, 90335, 90335, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-12-30', 4, 1),
(42606, 'voucherpbzepetto', 'VCPB12000-S1000', '12000 PB Cash', 'Voucher PB Zepetto', 0, 91350, 91350, 91350, 91350, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-12-30', 4, 1),
(42607, 'voucherpbzepetto', 'VCPB24000-S22', '24000 PB Cash', 'Voucher PB Zepetto', 0, 180670, 180670, 180670, 180670, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-12-30', 4, 1),
(42608, 'voucherpbzepetto', 'VCPB24000-S1000', '24000 PB Cash', 'Voucher PB Zepetto', 0, 182700, 182700, 182700, 182700, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-12-30', 4, 1),
(42609, 'voucherpbzepetto', 'VCPB36000-S22', '36000 PB Cash', 'Voucher PB Zepetto', 0, 271005, 271005, 271005, 271005, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-12-30', 4, 1),
(42610, 'voucherpbzepetto', 'VCPB36000-S1000', '36000 PB Cash', 'Voucher PB Zepetto', 0, 274050, 274050, 274050, 274050, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-12-30', 4, 1),
(42611, 'voucherpbzepetto', 'VCPB60000-S22', '60000 PB Cash', 'Voucher PB Zepetto', 0, 451675, 451675, 451675, 451675, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-12-30', 4, 1),
(42612, 'voucherpbzepetto', 'VCPB60000-S1000', '60000 PB Cash', 'Voucher PB Zepetto', 0, 456750, 456750, 456750, 456750, 0, 0, 0, 'voucher_pb_zepetto.png', '', 1, '2023-12-30', 4, 1),
(42613, 'voucherpsn', 'VPSNIDR100000-S15', 'PSN IDR 100.000', 'Voucher PSN', 0, 96846, 96846, 96846, 96846, 0, 0, 0, 'voucher_psn.png', '', 1, '2023-12-30', 4, 1),
(42614, 'voucherpsn', 'VPSNIDR300000-S15', 'PSN IDR 300.000', 'Voucher PSN', 0, 290538, 290538, 290538, 290538, 0, 0, 0, 'voucher_psn.png', '', 1, '2023-12-30', 4, 1),
(42615, 'voucherpsn', 'VPSNIDR600000-S15', 'PSN IDR 600.000', 'Voucher PSN', 0, 581075, 581075, 581075, 581075, 0, 0, 0, 'voucher_psn.png', '', 1, '2023-12-30', 4, 1),
(42616, 'voucherpsn', 'VPSNIDR1000000-S15', 'PSN IDR 1.000.000', 'Voucher PSN', 0, 964666, 964666, 964666, 964666, 0, 0, 0, 'voucher_psn.png', '', 1, '2023-12-30', 4, 1),
(42617, 'voucherpsn', 'VPSN1500000IDR-S15', 'PSN IDR 1.500.000', 'Voucher PSN', 0, 1446999, 1446999, 1446999, 1446999, 0, 0, 0, 'voucher_psn.png', '', 1, '2023-12-30', 4, 1),
(42618, 'voucherrazergold', 'RZRGOLD10-S22', 'Razer Gold IDR 10.000', 'Voucher Razer Gold', 0, 9431, 9431, 9431, 9431, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-12-30', 4, 1),
(42619, 'voucherrazergold', 'RZRGOLD50-S22', 'Razer Gold IDR 50.000', 'Voucher Razer Gold', 0, 47157, 47157, 47157, 47157, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-12-30', 4, 1),
(42620, 'voucherrazergold', 'RZRGOLD50-S1000', 'Razer Gold 50.000', 'Voucher Razer Gold', 0, 48213, 48213, 48213, 48213, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-12-30', 4, 1),
(42621, 'voucherrazergold', 'RZRGOLD100-S22', 'Razer Gold IDR 100.000', 'Voucher Razer Gold', 0, 94314, 94314, 94314, 94314, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-12-30', 4, 1),
(42622, 'voucherrazergold', 'RZRGOLD100-S1000', 'Razer Gold 100.000', 'Voucher Razer Gold', 0, 96425, 96425, 96425, 96425, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-12-30', 4, 1),
(42623, 'voucherrazergold', 'RZRGOLD200-S22', 'Razer Gold IDR 200.000', 'Voucher Razer Gold', 0, 188628, 188628, 188628, 188628, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-12-30', 4, 1),
(42624, 'voucherrazergold', 'RZRGOLD200-S1000', 'Razer Gold 200.000', 'Voucher Razer Gold', 0, 192850, 192850, 192850, 192850, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-12-30', 4, 1),
(42625, 'voucherrazergold', 'RZRGOLD500-S22', 'Razer Gold IDR 500.000', 'Voucher Razer Gold', 0, 471569, 471569, 471569, 471569, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-12-30', 4, 1),
(42626, 'voucherrazergold', 'RZRGOLD500-S1000', 'Razer Gold 500.000', 'Voucher Razer Gold', 0, 482125, 482125, 482125, 482125, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-12-30', 4, 1),
(42627, 'voucherrazergold', 'RZRGOLD1000-S22', 'Razer Gold IDR 1.000.000', 'Voucher Razer Gold', 0, 943138, 943138, 943138, 943138, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-12-30', 4, 1),
(42628, 'voucherrazergold', 'RZRGOLD1000-S1000', 'Razer Gold 1.000.000', 'Voucher Razer Gold', 0, 964250, 964250, 964250, 964250, 0, 0, 0, 'voucher_razer_gold.png', '', 1, '2023-12-30', 4, 1),
(42629, 'vouchervalorant', 'VRC45-S22', 'Riot Cash 45000', 'Voucher Valorant', 0, 42672, 42672, 42672, 42672, 0, 0, 0, 'voucher_valorant.png', '', 1, '2023-12-30', 4, 1),
(42630, 'vouchervalorant', 'VRC75-S22', 'Riot Cash 75000', 'Voucher Valorant', 0, 71120, 71120, 71120, 71120, 0, 0, 0, 'voucher_valorant.png', '', 1, '2023-12-30', 4, 1),
(42631, 'vouchervalorant', 'VRC149K-S22', 'Riot Cash 149000', 'Voucher Valorant', 0, 141291, 141291, 141291, 141291, 0, 0, 0, 'voucher_valorant.png', '', 1, '2023-12-30', 4, 1),
(42632, 'vouchervalorant', 'VRC219K-S22', 'Riot Cash 219000', 'Voucher Valorant', 0, 207670, 207670, 207670, 207670, 0, 0, 0, 'voucher_valorant.png', '', 1, '2023-12-30', 4, 1),
(42633, 'vouchervalorant', 'VRC359K-S22', 'Riot Cash 359000', 'Voucher Valorant', 0, 340427, 340427, 340427, 340427, 0, 0, 0, 'voucher_valorant.png', '', 1, '2023-12-30', 4, 1),
(42634, 'vouchervalorant', 'VRC739K-S22', 'Riot Cash 739000', 'Voucher Valorant', 0, 700767, 700767, 700767, 700767, 0, 0, 0, 'voucher_valorant.png', '', 1, '2023-12-30', 4, 1),
(42635, 'warpplus', 'WARP12PB-S1', 'Warp+ Key [ Limit 12,09 Petabyte ]', 'Warp Plus', 0, 4500, 4500, 4500, 4500, 0, 0, 0, 'warp_plus.png', '', 1, '2023-12-30', 4, 1),
(42636, 'zepeto', 'ZPT7ZEMS-S22', '7 Zems', 'Zepeto', 0, 6926, 7203, 7134, 7134, 0, 0, 0, 'zepeto.png', '', 1, '2023-12-30', 4, 1),
(42637, 'zepeto', 'ZPT14ZEMS-S22', '14 Zems', 'Zepeto', 0, 14009, 14569, 14429, 14429, 0, 0, 0, 'zepeto.png', '', 1, '2023-12-30', 4, 1),
(42638, 'zepeto', 'ZPT4680COINS-S22', '4680 Coins', 'Zepeto', 0, 14009, 14569, 14429, 14429, 0, 0, 0, 'zepeto.png', '', 1, '2023-12-30', 4, 1),
(42639, 'zepeto', 'ZPT29ZEMS-S22', '29 Zems', 'Zepeto', 0, 28049, 29171, 28890, 28890, 0, 0, 0, 'zepeto.png', '', 1, '2023-12-30', 4, 1),
(42640, 'zepeto', 'ZPT10200COINS-S22', '10200 Coins', 'Zepeto', 0, 28049, 29171, 28890, 28890, 0, 0, 0, 'zepeto.png', '', 1, '2023-12-30', 4, 1),
(42641, 'zepeto', 'ZPT60ZEMS-S22', '60 Zems', 'Zepeto', 0, 56129, 58374, 57813, 57813, 0, 0, 0, 'zepeto.png', '', 1, '2023-12-30', 4, 1),
(42642, 'zepeto', 'ZPT21000COINS-S22', '21000 Coins', 'Zepeto', 0, 56129, 58374, 57813, 57813, 0, 0, 0, 'zepeto.png', '', 1, '2023-12-30', 4, 1),
(42643, 'zepeto', 'ZPT38900COINS-S22', '38900 Coins', 'Zepeto', 0, 99809, 103801, 102803, 102803, 0, 0, 0, 'zepeto.png', '', 1, '2023-12-30', 4, 1),
(42644, 'zepeto', 'ZPT125ZEMS-S22', '125 Zems', 'Zepeto', 0, 112289, 116781, 115658, 115658, 0, 0, 0, 'zepeto.png', '', 1, '2023-12-30', 4, 1),
(42645, 'zepeto', 'ZPT62800COINS-S22', '62800 Coins', 'Zepeto', 0, 159089, 165453, 163862, 163862, 0, 0, 0, 'zepeto.png', '', 1, '2023-12-30', 4, 1),
(42646, 'zepeto', 'ZPT196ZEMS-S22', '196 Zems', 'Zepeto', 0, 168449, 175187, 173502, 173502, 0, 0, 0, 'zepeto.png', '', 1, '2023-12-30', 4, 1),
(42647, 'zepeto', 'ZPT234000COINS-S22', '234000 Coins', 'Zepeto', 0, 561569, 584032, 578416, 578416, 0, 0, 0, 'zepeto.png', '', 1, '2023-12-30', 4, 1),
(42648, 'zepeto', 'ZPT770ZEMS-S22', '770 Zems', 'Zepeto', 0, 623969, 648928, 642688, 642688, 0, 0, 0, 'zepeto.png', '', 1, '2023-12-30', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_request_poin`
--

CREATE TABLE `tb_request_poin` (
  `cuid` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `rewardID` int(11) NOT NULL,
  `nominal` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `approve_date` datetime NOT NULL,
  `created_date` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_reward`
--

CREATE TABLE `tb_reward` (
  `cuid` int(11) NOT NULL,
  `title` text NOT NULL,
  `nominal` text NOT NULL,
  `min_order` int(11) NOT NULL,
  `kuota` int(5) NOT NULL,
  `satuan` int(2) NOT NULL,
  `jenis` int(2) NOT NULL,
  `status` int(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_reward_produk`
--

CREATE TABLE `tb_reward_produk` (
  `cuid` int(255) NOT NULL,
  `title` text NOT NULL,
  `kategori` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_seo`
--

CREATE TABLE `tb_seo` (
  `cuid` int(11) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'logo.png',
  `instansi` text NOT NULL,
  `keyword` text NOT NULL,
  `deskripsi` text NOT NULL,
  `foot_text` text NOT NULL,
  `upgrade` int(3) NOT NULL,
  `background` text NOT NULL,
  `text_color` text NOT NULL,
  `primary_color` text NOT NULL,
  `secondary_color` text NOT NULL,
  `button_color` text NOT NULL,
  `button_hover` text NOT NULL,
  `urlweb` text NOT NULL,
  `user` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_seo`
--

INSERT INTO `tb_seo` (`cuid`, `image`, `instansi`, `keyword`, `deskripsi`, `foot_text`, `upgrade`, `background`, `text_color`, `primary_color`, `secondary_color`, `button_color`, `button_hover`, `urlweb`, `user`, `date`) VALUES
(1, 'logo.png', 'RoyalTopUp | Top Up Game Tanpa Ribet', 'Top Up Game Murah, Joki Mobile Legend dan Layanan Booster Social Media, Instant 24 Jam, Mobile Legends, Diamond Mobile Legends, Free Fire, DM FF,  Mobile, PUBGM, Genshin Impact, CODM, Valorant, Wild Rift', 'Game Top Up Adalah Tempat Top Up Game Murah, Joki Mobile Legends dan Booster Media Yang Aman, Murah dan Terpercaya. Kami Menyediakan Layanan Top Up Games, Joki Mobile Legends, Booster Social Media. Untuk Mempermudah Pembayaran Anda Disini Kami Juga Menyediakan Berbagai Macam Metode Pembayaran', 'Menyediakan Top-Up Game Favorit Kamu Agar Main Game Semakin Seru. Pengiriman Cepat dan berbagai macam metode Pembayaran. Layanan 24Jam, Proses hitungan detik.', 100, '#1e2124', '#ffffff', '#000000', '#2c2f31', '#2ecc71', '#27ae60', 'https://namadomain.com', 'demoakun', '2020-01-10 20:55:37');

-- --------------------------------------------------------

--
-- Table structure for table `tb_slide`
--

CREATE TABLE `tb_slide` (
  `cuid` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `tujuan` int(2) NOT NULL,
  `deskripsi` text NOT NULL,
  `sort` int(11) NOT NULL,
  `user` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_slide`
--

INSERT INTO `tb_slide` (`cuid`, `image`, `tujuan`, `deskripsi`, `sort`, `user`, `status`) VALUES
(1, 'slide_1.jpg', 0, '', 1, 'demoakun', 1),
(2, 'slide_1.jpg', 0, '', 2, 'demoakun', 1),
(20, 'slide_1.jpg', 0, '', 3, 'demoakun', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_social`
--

CREATE TABLE `tb_social` (
  `cuid` int(11) NOT NULL,
  `title` text NOT NULL,
  `alamat` text NOT NULL,
  `icon_image` text NOT NULL,
  `bg_color` text NOT NULL,
  `status` int(2) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_social`
--

INSERT INTO `tb_social` (`cuid`, `title`, `alamat`, `icon_image`, `bg_color`, `status`) VALUES
(2, 'Facebook', '#', 'fab fa-facebook', '#3498db', 1),
(3, 'Twitter', '#', 'fab fa-twitter', '#1abc9c', 1),
(4, 'Instagram', '#', 'fab fa-instagram', '#f39c12', 1),
(5, 'TikTok', '#', 'fab fa-tiktok', '#34495e', 1),
(6, 'Youtube', '#', 'fab fa-youtube', '#e74c3c', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_stat`
--

CREATE TABLE `tb_stat` (
  `cuid` int(11) NOT NULL,
  `ip` text NOT NULL,
  `date` date NOT NULL,
  `hits` int(11) NOT NULL,
  `page` text NOT NULL,
  `user` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_subkategori`
--

CREATE TABLE `tb_subkategori` (
  `cuid` int(255) NOT NULL,
  `catID` int(255) NOT NULL,
  `title` text NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_testi`
--

CREATE TABLE `tb_testi` (
  `cuid` int(11) NOT NULL,
  `kd_transaksi` text NOT NULL,
  `produkID` int(11) NOT NULL,
  `full_name` text NOT NULL,
  `content` mediumtext NOT NULL,
  `date` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_token`
--

CREATE TABLE `tb_token` (
  `cuid` int(11) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `cuid` int(11) NOT NULL,
  `kd_transaksi` varchar(16) NOT NULL,
  `date` datetime NOT NULL,
  `transaksi` text NOT NULL,
  `total` int(11) NOT NULL,
  `saldo` int(11) NOT NULL,
  `note` text NOT NULL,
  `providerID` int(2) NOT NULL,
  `jenis` text NOT NULL,
  `metode` text NOT NULL,
  `userID` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_tripay`
--

CREATE TABLE `tb_tripay` (
  `cuid` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `reference` text NOT NULL,
  `merchant_ref` text NOT NULL,
  `payment_method` text NOT NULL,
  `payment_name` text NOT NULL,
  `customer_email` text NOT NULL,
  `customer_phone` text NOT NULL,
  `amount` int(11) NOT NULL,
  `fee` int(11) NOT NULL,
  `amount_total` int(11) NOT NULL,
  `pay_code` text NOT NULL,
  `checkout_url` text NOT NULL,
  `status` text NOT NULL,
  `paid_time` datetime NOT NULL,
  `expired_time` datetime NOT NULL,
  `providerID` int(11) NOT NULL,
  `jenis_transaksi` int(11) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_tripayapi`
--

CREATE TABLE `tb_tripayapi` (
  `cuid` int(11) NOT NULL,
  `provider` text NOT NULL,
  `api_key` text NOT NULL,
  `private_key` text NOT NULL,
  `merchant_code` text NOT NULL,
  `payment_type` int(2) NOT NULL,
  `urlRequest` text NOT NULL,
  `jenis` int(2) NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_tripayapi`
--

INSERT INTO `tb_tripayapi` (`cuid`, `provider`, `api_key`, `private_key`, `merchant_code`, `payment_type`, `urlRequest`, `jenis`, `status`) VALUES
(1, 'Tripay', '', '', '', 1, 'https://tripay.co.id/api', 0, 0),
(3, 'duitku', '', '', '', 1, 'https://passport.duitku.com/webapi/api/merchant', 0, 0),
(4, 'Vip Reseller', '', '', 'eXXyLgwQ', 1, 'https://vip-reseller.co.id/api', 1, 1),
(5, 'Digiflazz', '', '', '', 1, 'https://api.digiflazz.com/v1', 1, 1),
(6, 'VSGaming', '', '', '', 1, 'https://api-xl98i.vsgamingstore.com/v1', 1, 1),
(7, 'Cekmutasi', '', '', '', 0, '', 2, 1),
(8, 'Fonnte', '', '', '', 0, '', 2, 0),
(9, 'Apigames', '', '', '', 1, 'https://v1.apigames.id', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `cuid` int(11) NOT NULL,
  `user` text NOT NULL,
  `pass` varchar(100) NOT NULL,
  `token_id` int(11) DEFAULT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'avatar5.png',
  `full_name` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `no_hp` text NOT NULL,
  `level` text NOT NULL,
  `pinTrx` varchar(255) NOT NULL,
  `reff` int(11) NOT NULL,
  `uplineID` int(255) NOT NULL,
  `poin` int(11) NOT NULL,
  `apikey` text NOT NULL,
  `merchantid` text NOT NULL,
  `whitelist` text NOT NULL,
  `join_date` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`cuid`, `user`, `pass`, `token_id`, `image`, `full_name`, `email`, `no_hp`, `level`, `pinTrx`, `reff`, `uplineID`, `poin`, `apikey`, `merchantid`, `whitelist`, `join_date`, `last_login`, `status`) VALUES
(1, 'demoakun', '$2y$10$pVzKgNa3E2xzG7rAy7R1s.YHsBrWpJJF47SRch6Y7h0T17fEHgX1G', 43, 'avatar5.png', 'Topup Game', '', '62', 'superadmin', '', 0, 1, 0, '', '', '', '2020-07-10 00:00:00', '2025-02-12 20:41:36', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_affiliate`
--
ALTER TABLE `tb_affiliate`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_backup`
--
ALTER TABLE `tb_backup`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_balance`
--
ALTER TABLE `tb_balance`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_bank`
--
ALTER TABLE `tb_bank`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_banner`
--
ALTER TABLE `tb_banner`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_banners`
--
ALTER TABLE `tb_banners`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_diskon`
--
ALTER TABLE `tb_diskon`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_jenis`
--
ALTER TABLE `tb_jenis`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_konfirmasi`
--
ALTER TABLE `tb_konfirmasi`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_livechat`
--
ALTER TABLE `tb_livechat`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_menu_admin`
--
ALTER TABLE `tb_menu_admin`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_menu_admin_list`
--
ALTER TABLE `tb_menu_admin_list`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_notif`
--
ALTER TABLE `tb_notif`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_page`
--
ALTER TABLE `tb_page`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_pascabayar`
--
ALTER TABLE `tb_pascabayar`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_pemesan`
--
ALTER TABLE `tb_pemesan`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_poin`
--
ALTER TABLE `tb_poin`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_popup`
--
ALTER TABLE `tb_popup`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_post`
--
ALTER TABLE `tb_post`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_prepaid`
--
ALTER TABLE `tb_prepaid`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_produk`
--
ALTER TABLE `tb_produk`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_request_poin`
--
ALTER TABLE `tb_request_poin`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_reward`
--
ALTER TABLE `tb_reward`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_reward_produk`
--
ALTER TABLE `tb_reward_produk`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_seo`
--
ALTER TABLE `tb_seo`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_slide`
--
ALTER TABLE `tb_slide`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_social`
--
ALTER TABLE `tb_social`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_stat`
--
ALTER TABLE `tb_stat`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_subkategori`
--
ALTER TABLE `tb_subkategori`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_testi`
--
ALTER TABLE `tb_testi`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_token`
--
ALTER TABLE `tb_token`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_tripay`
--
ALTER TABLE `tb_tripay`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_tripayapi`
--
ALTER TABLE `tb_tripayapi`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`cuid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_affiliate`
--
ALTER TABLE `tb_affiliate`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_backup`
--
ALTER TABLE `tb_backup`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_balance`
--
ALTER TABLE `tb_balance`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tb_bank`
--
ALTER TABLE `tb_bank`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tb_banner`
--
ALTER TABLE `tb_banner`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_diskon`
--
ALTER TABLE `tb_diskon`
  MODIFY `cuid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_jenis`
--
ALTER TABLE `tb_jenis`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `tb_konfirmasi`
--
ALTER TABLE `tb_konfirmasi`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_livechat`
--
ALTER TABLE `tb_livechat`
  MODIFY `cuid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_menu_admin`
--
ALTER TABLE `tb_menu_admin`
  MODIFY `cuid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tb_menu_admin_list`
--
ALTER TABLE `tb_menu_admin_list`
  MODIFY `cuid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `tb_notif`
--
ALTER TABLE `tb_notif`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_order`
--
ALTER TABLE `tb_order`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_page`
--
ALTER TABLE `tb_page`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_pascabayar`
--
ALTER TABLE `tb_pascabayar`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110004;

--
-- AUTO_INCREMENT for table `tb_pemesan`
--
ALTER TABLE `tb_pemesan`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_poin`
--
ALTER TABLE `tb_poin`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_popup`
--
ALTER TABLE `tb_popup`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1132;

--
-- AUTO_INCREMENT for table `tb_post`
--
ALTER TABLE `tb_post`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_prepaid`
--
ALTER TABLE `tb_prepaid`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41378;

--
-- AUTO_INCREMENT for table `tb_produk`
--
ALTER TABLE `tb_produk`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100003;

--
-- AUTO_INCREMENT for table `tb_request_poin`
--
ALTER TABLE `tb_request_poin`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_reward`
--
ALTER TABLE `tb_reward`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_reward_produk`
--
ALTER TABLE `tb_reward_produk`
  MODIFY `cuid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_seo`
--
ALTER TABLE `tb_seo`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_slide`
--
ALTER TABLE `tb_slide`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tb_social`
--
ALTER TABLE `tb_social`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_stat`
--
ALTER TABLE `tb_stat`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_subkategori`
--
ALTER TABLE `tb_subkategori`
  MODIFY `cuid` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_testi`
--
ALTER TABLE `tb_testi`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_token`
--
ALTER TABLE `tb_token`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_tripay`
--
ALTER TABLE `tb_tripay`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_tripayapi`
--
ALTER TABLE `tb_tripayapi`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `cuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
