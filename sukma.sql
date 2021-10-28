-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 28, 2021 at 08:44 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sukma`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_nomor`
--

CREATE TABLE `data_nomor` (
  `id` int(11) NOT NULL,
  `id_surat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_nomor`
--

INSERT INTO `data_nomor` (`id`, `id_surat`) VALUES
(4, 1),
(5, 2),
(6, 5),
(7, 6),
(8, 7),
(9, 9);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kabag`
--

CREATE TABLE `kabag` (
  `id` int(11) NOT NULL,
  `nama_kabag` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kabag`
--

INSERT INTO `kabag` (`id`, `nama_kabag`) VALUES
(1, 'keuangan'),
(2, 'puskom');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_surat` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `sifat` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'penting'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama_kategori`, `kode_surat`, `sifat`) VALUES
(1, 'peminjaman', '1', 'penting');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `nama_level` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `nama_level`) VALUES
(1, 'admin'),
(2, 'ketua'),
(3, 'operator'),
(4, 'karyawan'),
(5, 'mahasiswa');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_03_31_071329_create_level_table', 1),
(5, '2021_03_31_071422_create_surat_keluar_table', 1),
(6, '2021_03_31_071432_create_surat_masuk_table', 1),
(7, '2021_03_31_071513_create_kategori_table', 1),
(8, '2021_04_02_063214_create_data_nomor_table', 1),
(9, '2021_04_02_063928_create_kabag_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `surat_keluar`
--

CREATE TABLE `surat_keluar` (
  `id` int(11) NOT NULL,
  `id_pengirim` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_tujuan` int(11) NOT NULL,
  `judul` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'diproses',
  `stat_tu` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'menunggu',
  `stat_prof` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'menunggu',
  `ttd` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'tidak',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `surat_keluar`
--

INSERT INTO `surat_keluar` (`id`, `id_pengirim`, `id_kategori`, `id_tujuan`, `judul`, `content`, `status`, `stat_tu`, `stat_prof`, `ttd`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 5, 'Surat peminjaman', '<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Kepada Yth.</span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Ketua Panitia PPBUS 2007</span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">STiPsi. Yogyakarta</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">di-</span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;&nbsp;&nbsp;&nbsp; Tempat</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;</span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Dengan Hormat,</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Setelah mendapatkan informasi beasiswa dari sekolah berupa Program Penjaringan Bibit Unggul Sekolah (PPBUS) 2007 dari Sekolah Tinggi Psikologi Yogyakarta (STiPsi. Yogyakarta) bersama ini saya mengajukan permohonan agar dapat mengikuti program beasiswa tersebut.</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Sebagai bahan pertimbangan, berikut ini saya sampaikan 1 (satu) berkas persyaratan beserta rekomendasi dari sekolah.</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Demikian permohonan saya,&nbsp; atas perhatiannya saya ucapkan terima kasih.</span></span></p>', 'diproses', 'diterima', 'diterima', 'tidak', NULL, '2021-05-22 22:02:02'),
(2, 2, 1, 2, 'Pengajuan Kerjasama', '<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Kepada Yth.</span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Ketua Panitia PPBUS 2007</span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">STiPsi. Yogyakarta</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">di-</span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;&nbsp;&nbsp;&nbsp; Tempat</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;</span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Dengan Hormat,</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Setelah mendapatkan informasi beasiswa dari sekolah berupa Program Penjaringan Bibit Unggul Sekolah (PPBUS) 2007 dari Sekolah Tinggi Psikologi Yogyakarta (STiPsi. Yogyakarta) bersama ini saya mengajukan permohonan agar dapat mengikuti program beasiswa tersebut.</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Sebagai bahan pertimbangan, berikut ini saya sampaikan 1 (satu) berkas persyaratan beserta rekomendasi dari sekolah.</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Demikian permohonan saya,&nbsp; atas perhatiannya saya ucapkan terima kasih.</span></span></p>', 'diproses', 'diterima', 'diterima', 'tidak', '2021-05-23 04:45:24', '2021-05-26 16:41:59'),
(3, 2, 1, 5, 'Tes1', '<p>Kepada Yth.</p>\r\n\r\n<p>Ketua Panitia PPBUS 2007</p>\r\n\r\n<p>STiPsi. Yogyakarta</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>di-</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp; Tempat</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Dengan Hormat,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Setelah mendapatkan informasi beasiswa dari sekolah berupa Program Penjaringan Bibit Unggul Sekolah (PPBUS) 2007 dari Sekolah Tinggi Psikologi Yogyakarta (STiPsi. Yogyakarta) bersama ini saya mengajukan permohonan agar dapat mengikuti program beasiswa tersebut.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Sebagai bahan pertimbangan, berikut ini saya sampaikan 1 (satu) berkas persyaratan beserta rekomendasi dari sekolah.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Demikian permohonan saya,&nbsp; atas perhatiannya saya ucapkan terima kasih.</p>', 'diproses', 'ditolak', 'menunggu', 'tidak', '2021-05-26 14:21:53', '2021-05-26 18:25:22'),
(4, 2, 1, 4, 'Halal Bihalal', '<p style=\"text-align:justify\"><span style=\"font-size:12pt\"><span style=\"font-size:13.0pt\">Kepada Yth.</span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:12pt\"><strong><span style=\"font-size:13.0pt\">Seluruh Pejabat Struktural, Dosen, dan Tenaga Kependidikan </span></strong></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:12pt\"><strong><span style=\"font-size:13.0pt\">STAI</span></strong><strong><span style=\"font-size:13.0pt\"> Ma&rsquo;had Aly Al-Hikam Malang</span></strong></span></p>\r\n\r\n<p style=\"margin-left:20px; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"font-size:13.0pt\">di</span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:12pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style=\"font-size:13.0pt\">M a l a n g</span></span></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:12pt\"><strong><span dir=\"RTL\" lang=\"AR-SA\" style=\"font-size:14.0pt\">السلام عليكم ورحمة الله وبركاته</span></strong></span></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:12pt\"><span style=\"font-size:13.0pt\">Diharap dengan hormat atas kehadiran Bpk/Ibu/Sdr pada</span><span style=\"font-size:13.0pt\">:</span></span></p>\r\n\r\n<p style=\"margin-left:60px; text-align:justify\">&nbsp;</p>\r\n\r\n<table cellspacing=\"0\" class=\"Table\" style=\"border-collapse:collapse; margin-left:74px; width:510px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:104px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-size:13.0pt\">Hari/tanggal</span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:28px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-size:13.0pt\">:</span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:378px\">\r\n			<p style=\"text-align:left\"><span style=\"font-size:14pt\"><span style=\"font-size:13.0pt\">Rabu/19 Mei 2021</span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:104px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-size:13.0pt\">Pukul</span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:28px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-size:13.0pt\">:</span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:378px\">\r\n			<p style=\"text-align:left\"><span style=\"font-size:14pt\"><span style=\"font-size:13.0pt\">09.00 WIB s/d Selesai</span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:104px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-size:13.0pt\">Tempat</span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:28px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-size:13.0pt\">:</span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:378px\">\r\n			<p style=\"text-align:left\"><span style=\"font-size:14pt\"><span style=\"font-size:13.0pt\">Ruang rapat lt. 2</span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:104px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-size:13.0pt\">Acara </span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:28px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-size:13.0pt\">:</span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:378px\">\r\n			<p style=\"text-align:left\"><span style=\"font-size:14pt\"><span style=\"font-size:13.0pt\">Halal bi Halal</span></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p style=\"margin-left:60px; text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:12pt\"><span style=\"font-size:13.0pt\">Demikian atas </span><span style=\"font-size:13.0pt\">kesediaannya</span> <span style=\"font-size:13.0pt\">disampaikan</span><span style=\"font-size:13.0pt\"> terimakasih.</span></span></p>\r\n\r\n<p style=\"text-align:right\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:12pt\"><strong><span dir=\"RTL\" lang=\"AR-SA\" style=\"font-size:14.0pt\">والسلام عليكم ورحمة الله وبركاته</span></strong></span></p>', 'diproses', 'diterima', 'ditolak', 'tidak', '2021-05-26 15:43:13', '2021-05-26 18:25:44'),
(5, 2, 1, 3, 'Surat Kerjasama', '<p style=\"text-align:justify\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">Kepada Yth.</span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><strong><span style=\"font-size:13.0pt\">Seluruh Pejabat Struktural, Dosen, dan Tenaga Kependidikan </span></strong></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><strong><span style=\"font-size:13.0pt\">STAI</span></strong><strong><span style=\"font-size:13.0pt\"> Ma&rsquo;had Aly Al-Hikam Malang</span></strong></span></span></p>\r\n\r\n<p style=\"margin-left:20px; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">di</span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style=\"font-size:13.0pt\">M a l a n g</span></span></span></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><strong><span dir=\"RTL\" lang=\"AR-SA\" style=\"font-size:14.0pt\">السلام عليكم ورحمة الله وبركاته</span></strong></span></span></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">Diharap dengan hormat atas kehadiran Bpk/Ibu/Sdr pada</span><span style=\"font-size:13.0pt\">:</span></span></span></p>\r\n\r\n<p style=\"margin-left:60px; text-align:justify\">&nbsp;</p>\r\n\r\n<table cellspacing=\"0\" class=\"Table\" style=\"border-collapse:collapse; margin-left:74px; width:510px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:104px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">Hari/tanggal</span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:28px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">:</span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:378px\">\r\n			<p style=\"text-align:left\"><span style=\"font-size:14pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">Rabu/19 Mei 2021</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:104px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">Pukul</span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:28px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">:</span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:378px\">\r\n			<p style=\"text-align:left\"><span style=\"font-size:14pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">09.00 WIB s/d Selesai</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:104px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">Tempat</span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:28px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">:</span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:378px\">\r\n			<p style=\"text-align:left\"><span style=\"font-size:14pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">Ruang rapat lt. 2</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:104px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">Acara </span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:28px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">:</span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:378px\">\r\n			<p style=\"text-align:left\"><span style=\"font-size:14pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">Halal bi Halal</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p style=\"margin-left:60px; text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">Demikian atas </span><span style=\"font-size:13.0pt\">kesediaannya</span> <span style=\"font-size:13.0pt\">disampaikan</span><span style=\"font-size:13.0pt\"> terimakasih.</span></span></span></p>', 'diproses', 'diterima', 'diterima', 'tidak', '2021-05-26 18:24:06', '2021-05-26 18:26:50'),
(6, 2, 1, 11, 'Pemasangan Alat', '<p style=\"text-align:justify\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">Kepada Yth.</span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><strong><span style=\"font-size:13.0pt\">Seluruh Pejabat Struktural, Dosen, dan Tenaga Kependidikan </span></strong></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><strong><span style=\"font-size:13.0pt\">STAI</span></strong><strong><span style=\"font-size:13.0pt\"> Ma&rsquo;had Aly Al-Hikam Malang</span></strong></span></span></p>\r\n\r\n<p style=\"margin-left:20px; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">di</span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style=\"font-size:13.0pt\">M a l a n g</span></span></span></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><strong><span dir=\"RTL\" lang=\"AR-SA\" style=\"font-size:14.0pt\">السلام عليكم ورحمة الله وبركاته</span></strong></span></span></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">Diharap dengan hormat atas kehadiran Bpk/Ibu/Sdr pada</span><span style=\"font-size:13.0pt\">:</span></span></span></p>\r\n\r\n<p style=\"margin-left:60px; text-align:justify\">&nbsp;</p>\r\n\r\n<table cellspacing=\"0\" class=\"Table\" style=\"border-collapse:collapse; margin-left:74px; width:510px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:104px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">Hari/tanggal</span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:28px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">:</span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:378px\">\r\n			<p style=\"text-align:left\"><span style=\"font-size:14pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">Rabu/19 Mei 2021</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:104px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">Pukul</span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:28px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">:</span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:378px\">\r\n			<p style=\"text-align:left\"><span style=\"font-size:14pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">09.00 WIB s/d Selesai</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:104px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">Tempat</span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:28px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">:</span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:378px\">\r\n			<p style=\"text-align:left\"><span style=\"font-size:14pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">Ruang rapat lt. 2</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:104px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">Acara </span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:28px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">:</span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:378px\">\r\n			<p style=\"text-align:left\"><span style=\"font-size:14pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">Halal bi Halal</span></span></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p style=\"margin-left:60px; text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-size:13.0pt\">Demikian atas </span><span style=\"font-size:13.0pt\">kesediaannya</span> <span style=\"font-size:13.0pt\">disampaikan</span><span style=\"font-size:13.0pt\"> terimakasih.</span></span></span></p>\r\n\r\n<p style=\"text-align:right\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><strong><span dir=\"RTL\" lang=\"AR-SA\" style=\"font-size:14.0pt\">والسلام عليكم ورحمة الله وبركاته</span></strong></span></span></p>', 'diproses', 'diterima', 'diterima', 'tidak', '2021-05-30 23:55:59', '2021-05-30 23:57:38'),
(7, 2, 1, 5, 'Peminjaman Asset', '<p><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Kepada Yth.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Kepala Laboratorium Jaringan Komputer</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Universitas Sejahtera</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Kulon Progo</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Dengan hormat,</span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Dalam rangka kegiatan tahuan HIMA Informatika Universitas Sejahtera akan &nbsp;seminar umum tentang &ldquo;Tumbuh Bersama Komputer&rdquo; yang akan diselenggarakan pada :</span></span></span></span></p>\r\n\r\n<table cellspacing=\"0\" class=\"MsoTableGrid\" style=\"border-collapse:collapse; border:none; margin-left:9px; width:586px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:85px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Tanggal</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:501px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">: 14 Fbruari 2017</span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:85px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Waktu</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:501px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">: 08.00-15.00 WIB</span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:85px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Acara </span></span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:501px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">: Seminar &ldquo;Tumbuh Bersama Komputer&rdquo;</span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:85px\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Tempat </span></span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:501px\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">: Ruang Pertemuan Laboratorium Jaringan Komputer Universitas Sejahtera</span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Sehubungan dengan kegitan tersebut, kami selaku panita ingin meminjam alat lan taster (1 buah), dan LCD proyektor (1 buah).</span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Besar harapan kami akan dukungan dari semua pihak agar kegiatan tersebut berjalan lancar dan tidak ada halangan sama sekali.</span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Demikian surat permohonan ini kami sampaikan. Atas segala perhatian dan kerjasama Bapak/Ibu kami sampaikan terima kasih.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;Hormat kami,</span></span></span></span></p>\r\n\r\n<table cellspacing=\"0\" class=\"MsoTableGrid\" style=\"border-collapse:collapse; border:none\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Ketua</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\">&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Sekretaris</span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\">&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\">&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\">&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Nasabah Khorirudin</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\">&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Annisa Habibah</span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">NIM. 13121311</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\">&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">NIM. 12897897</span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 'diproses', 'diterima', 'diterima', 'tidak', '2021-06-09 03:54:16', '2021-06-09 03:55:38'),
(8, 2, 1, 6, 'tesssssssssssssss', '<p><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Kepada Yth.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Kepala Laboratorium Jaringan Komputer</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Universitas Sejahtera</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Kulon Progo</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Dengan hormat,</span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Dalam rangka kegiatan tahuan HIMA Informatika Universitas Sejahtera akan &nbsp;seminar umum tentang &ldquo;Tumbuh Bersama Komputer&rdquo; yang akan diselenggarakan pada :</span></span></span></span></p>\r\n\r\n<table cellspacing=\"0\" class=\"MsoTableGrid\" style=\"border-collapse:collapse; border:none; margin-left:9px; width:586px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:85px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Tanggal</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:501px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">: 14 Fbruari 2017</span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:85px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Waktu</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:501px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">: 08.00-15.00 WIB</span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:85px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Acara </span></span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:501px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">: Seminar &ldquo;Tumbuh Bersama Komputer&rdquo;</span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:85px\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Tempat </span></span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:501px\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">: Ruang Pertemuan Laboratorium Jaringan Komputer Universitas Sejahtera</span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Sehubungan dengan kegitan tersebut, kami selaku panita ingin meminjam alat lan taster (1 buah), dan LCD proyektor (1 buah).</span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Besar harapan kami akan dukungan dari semua pihak agar kegiatan tersebut berjalan lancar dan tidak ada halangan sama sekali.</span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Demikian surat permohonan ini kami sampaikan. Atas segala perhatian dan kerjasama Bapak/Ibu kami sampaikan terima kasih.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;Hormat kami,</span></span></span></span></p>\r\n\r\n<table cellspacing=\"0\" class=\"MsoTableGrid\" style=\"border-collapse:collapse; border:none\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Ketua</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\">&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Sekretaris</span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\">&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\">&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\">&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Nasabah Khorirudin</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\">&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Annisa Habibah</span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">NIM. 13121311</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\">&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Calibri&quot;,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">NIM. 12897897</span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 'diproses', 'menunggu', 'menunggu', 'tidak', '2021-06-10 10:15:47', '2021-06-10 10:15:47'),
(9, 2, 1, 6, 'Surat Proyek', '<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Kepada Yth.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Kepala Laboratorium Jaringan Komputer</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Universitas Sejahtera</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Kulon Progo</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Dengan hormat,</span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Dalam rangka kegiatan tahuan HIMA Informatika Universitas Sejahtera akan &nbsp;seminar umum tentang &ldquo;Tumbuh Bersama Komputer&rdquo; yang akan diselenggarakan pada :</span></span></span></span></p>\r\n\r\n<table cellspacing=\"0\" class=\"MsoTableGrid\" style=\"border-collapse:collapse; border:none; margin-left:9px; width:586px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:85px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Tanggal</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:501px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">: 14 Fbruari 2017</span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:85px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Waktu</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:501px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">: 08.00-15.00 WIB</span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:85px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Acara </span></span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:501px\">\r\n			<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">: Seminar &ldquo;Tumbuh Bersama Komputer&rdquo;</span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:85px\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Tempat </span></span></span></span></p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:501px\">\r\n			<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">: Ruang Pertemuan Laboratorium Jaringan Komputer Universitas Sejahtera</span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Sehubungan dengan kegitan tersebut, kami selaku panita ingin meminjam alat lan taster (1 buah), dan LCD proyektor (1 buah).</span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Besar harapan kami akan dukungan dari semua pihak agar kegiatan tersebut berjalan lancar dan tidak ada halangan sama sekali.</span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Demikian surat permohonan ini kami sampaikan. Atas segala perhatian dan kerjasama Bapak/Ibu kami sampaikan terima kasih.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;Hormat kami,</span></span></span></span></p>\r\n\r\n<table cellspacing=\"0\" class=\"MsoTableGrid\" style=\"border-collapse:collapse; border:none\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Ketua</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\">&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Sekretaris</span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\">&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\">&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\">&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Nasabah Khorirudin</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\">&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Annisa Habibah</span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">NIM. 13121311</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\">&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:200px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">NIM. 12897897</span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 'diproses', 'diterima', 'diterima', 'tidak', '2021-06-16 21:26:25', '2021-06-16 21:27:44');

-- --------------------------------------------------------

--
-- Table structure for table `surat_masuk`
--

CREATE TABLE `surat_masuk` (
  `id` int(11) NOT NULL,
  `id_penerima` int(11) NOT NULL,
  `id_pengirim` int(11) DEFAULT NULL,
  `id_kategori` int(11) NOT NULL,
  `perihal` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_surat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `surat_masuk`
--

INSERT INTO `surat_masuk` (`id`, `id_penerima`, `id_pengirim`, `id_kategori`, `perihal`, `id_surat`) VALUES
(1, 5, 2, 1, 'Surat peminjaman', 1),
(2, 2, 2, 1, 'Pengajuan Kerjasama', 2),
(3, 3, 2, 1, 'Surat Kerjasama', 5),
(4, 11, 2, 1, 'Pemasangan Alat', 6),
(5, 5, 2, 1, 'Peminjaman Asset', 7),
(6, 6, 2, 1, 'Surat Proyek', 9);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_level` int(11) NOT NULL DEFAULT 4,
  `id_kabag` int(11) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `email`, `email_verified_at`, `password`, `id_level`, `id_kabag`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin1', 'administrator', 'admin@admin.com', NULL, '21232f297a57a5a743894a0e4a801fc3', 1, NULL, NULL, '2021-04-04 23:30:23', '2021-04-05 01:00:11'),
(2, 'admin', 'administrator', 'admin2@admin.com', NULL, '$2y$10$CXZKX/wGYzO987kZ4XOYp.pBCFIsINsGonbK2kHMrDxH0deYG1TJG', 1, NULL, NULL, '2021-04-20 09:46:59', '2021-04-20 09:46:59'),
(3, 'ketua', 'ketua', 'ketua@ketua.com', NULL, '$2y$10$2rkKu3nVbiZI/DsXeq.yI.ZAd0hlU8N4pInHwyg.qlPCqZMC.RmCG', 2, NULL, NULL, '2021-04-20 17:55:51', '2021-04-20 17:55:51'),
(4, 'operator', 'operator', 'operator@operator.com', NULL, '$2y$10$iLW.jFw5RWz25IV0T4dNkOOkBfkVmA6wLoqaZpDMgdOPhqP9acqBu', 3, NULL, NULL, '2021-04-20 18:08:52', '2021-04-20 18:08:52'),
(5, 'karyawan', 'karyawan', 'karyawan@karyawan.com', NULL, '$2y$10$egkxgqUDBHFQgQg9pjZzrugYA.2FHyPgyEBicGrz1xfgd1o5RY4t.', 4, NULL, NULL, '2021-04-20 18:10:08', '2021-04-20 18:10:08'),
(6, 'mahasiswa', 'mahasiswa', 'mahasiswa@mahasiswa.com', NULL, '$2y$10$0BVY9.VgZtwcWqe9qEPxzOTSbFa37RjYSTuKvTBg8Il2cY16gUao2', 5, NULL, NULL, '2021-04-20 23:22:36', '2021-04-20 23:22:36'),
(9, 'karyawan3', NULL, NULL, NULL, '$2y$10$StmBjejB7Np4LL8QbkNefOBoxwI40aHHhd.oSV.4RLBZWs52VERAK', 4, 1, NULL, '2021-05-28 05:11:24', '2021-05-28 22:02:10'),
(10, 'tes1', NULL, NULL, NULL, '$2y$10$8wumTkY6NrdipSyNzTTsK.jYpi5LNeFqbTdesDzokXWjMgWa.NHgG', 4, NULL, NULL, '2021-05-28 05:22:47', '2021-05-28 22:00:59'),
(11, 'puskom1', 'puskom1', NULL, NULL, '$2y$10$992.3GbEMR/5r2TtcOxC2e5MKi2MmqaKXjzm2byZr9NHGWKUxykWe', 4, 2, NULL, '2021-05-30 23:54:56', '2021-05-30 23:54:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_nomor`
--
ALTER TABLE `data_nomor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_surat` (`id_surat`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `kabag`
--
ALTER TABLE `kabag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `surat_keluar`
--
ALTER TABLE `surat_keluar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pengirim` (`id_pengirim`),
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_tujuan` (`id_tujuan`);

--
-- Indexes for table `surat_masuk`
--
ALTER TABLE `surat_masuk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_penerima` (`id_penerima`),
  ADD KEY `id_pengirim` (`id_pengirim`),
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_surat` (`id_surat`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `id_level` (`id_level`),
  ADD KEY `id_kabag` (`id_kabag`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_nomor`
--
ALTER TABLE `data_nomor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kabag`
--
ALTER TABLE `kabag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `surat_keluar`
--
ALTER TABLE `surat_keluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `surat_masuk`
--
ALTER TABLE `surat_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_nomor`
--
ALTER TABLE `data_nomor`
  ADD CONSTRAINT `data_nomor_ibfk_1` FOREIGN KEY (`id_surat`) REFERENCES `surat_keluar` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `surat_keluar`
--
ALTER TABLE `surat_keluar`
  ADD CONSTRAINT `surat_keluar_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `surat_keluar_ibfk_2` FOREIGN KEY (`id_pengirim`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `surat_keluar_ibfk_3` FOREIGN KEY (`id_tujuan`) REFERENCES `users` (`id`);

--
-- Constraints for table `surat_masuk`
--
ALTER TABLE `surat_masuk`
  ADD CONSTRAINT `surat_masuk_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`id_kabag`) REFERENCES `kabag` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
