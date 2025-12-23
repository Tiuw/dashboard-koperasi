-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 14, 2025 at 11:06 AM
-- Server version: 10.3.39-MariaDB-cll-lve
-- PHP Version: 8.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `temprin2_erp_tsm`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `angsuran_bulanan`
-- (See below for the actual view)
--
CREATE TABLE `angsuran_bulanan` (
`id` char(0)
,`tgl_bayar` varchar(10)
,`pinjam_id` bigint(20)
,`angsuran_ke` bigint(21)
,`jumlah_bayar` double(17,0)
,`denda_rp` int(1)
,`terlambat` int(1)
,`ket_bayar` char(0)
,`dk` varchar(1)
,`kas_id` int(1)
,`jns_trans` int(2)
,`update_data` date
,`user_name` varchar(5)
,`keterangan` varchar(23)
);

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jns_akun`
--

CREATE TABLE `jns_akun` (
  `id` bigint(20) NOT NULL,
  `kd_aktiva` varchar(10) DEFAULT NULL,
  `jns_trans` varchar(50) NOT NULL,
  `akun` enum('Aktiva','Pasiva') DEFAULT NULL,
  `laba_rugi` enum('','PENDAPATAN','BIAYA') NOT NULL DEFAULT '',
  `pemasukan` enum('Y','N') DEFAULT NULL,
  `pengeluaran` enum('Y','N') DEFAULT NULL,
  `non_kas` enum('Y','N') DEFAULT NULL,
  `simpanan` enum('Y','N') DEFAULT NULL,
  `pinjaman` enum('Y','N') DEFAULT NULL,
  `pinjam_dari` enum('Y','N') DEFAULT NULL,
  `angsuran` enum('Y','N') NOT NULL,
  `aktif` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jns_akun1`
--

CREATE TABLE `jns_akun1` (
  `id` bigint(20) NOT NULL,
  `kd_aktiva` varchar(10) DEFAULT NULL,
  `jns_trans` varchar(50) NOT NULL,
  `akun` enum('Aktiva','Pasiva') DEFAULT NULL,
  `laba_rugi` enum('','PENDAPATAN','BIAYA') NOT NULL DEFAULT '',
  `pemasukan` enum('Y','N') DEFAULT NULL,
  `pengeluaran` enum('Y','N') DEFAULT NULL,
  `non_kas` enum('Y','N') DEFAULT NULL,
  `simpanan` enum('Y','N') NOT NULL,
  `pinjaman` enum('Y','N') DEFAULT NULL,
  `pinjam_dari` enum('Y','N') NOT NULL,
  `aktif` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jns_angsuran`
--

CREATE TABLE `jns_angsuran` (
  `id` bigint(20) NOT NULL,
  `ket` int(11) NOT NULL,
  `aktif` enum('Y','T','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jns_simpan`
--

CREATE TABLE `jns_simpan` (
  `id` int(5) NOT NULL,
  `jns_simpan` varchar(30) NOT NULL,
  `jumlah` double NOT NULL,
  `tampil` enum('Y','T') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_agama`
--

CREATE TABLE `mu_agama` (
  `id_agama` int(11) NOT NULL,
  `nama_agama` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_agen_ekspedisi`
--

CREATE TABLE `mu_agen_ekspedisi` (
  `id_agen_ekspedisi` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `city_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fax` varchar(50) NOT NULL,
  `chat` varchar(50) NOT NULL,
  `id_users` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_bahasa`
--

CREATE TABLE `mu_bahasa` (
  `id_bahasa` int(11) NOT NULL,
  `nama_bahasa` varchar(255) NOT NULL,
  `id_users` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_barang`
--

CREATE TABLE `mu_barang` (
  `id_barang` int(11) NOT NULL,
  `kode_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `merek_brand` varchar(100) NOT NULL,
  `model_type` varchar(100) NOT NULL,
  `berat_bruto` float NOT NULL,
  `ukuran_volume` varchar(100) NOT NULL,
  `warna` varchar(50) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_subkategori` int(11) NOT NULL,
  `id_rak` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `jml_minimal` int(11) NOT NULL,
  `jml_maksimal` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `ppn` int(11) NOT NULL DEFAULT 10,
  `kode_satuan` varchar(10) NOT NULL,
  `keterangan_barang` text NOT NULL,
  `foto_barang` varchar(255) NOT NULL,
  `status_jual` enum('ya','tidak') NOT NULL,
  `id_users` int(11) NOT NULL,
  `waktu_input` datetime NOT NULL,
  `akun` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_barang_harga`
--

CREATE TABLE `mu_barang_harga` (
  `id_barang_harga` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_kategori_pelanggan` int(11) NOT NULL,
  `id_jenis_jual` int(11) NOT NULL,
  `harga` int(111) NOT NULL DEFAULT 0,
  `persen_beli` int(111) NOT NULL DEFAULT 0,
  `diskon` int(111) NOT NULL DEFAULT 0,
  `jumlah` int(111) NOT NULL,
  `satuan` varchar(111) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_barang_jenis_jual`
--

CREATE TABLE `mu_barang_jenis_jual` (
  `id_barang_jenis_jual` int(11) NOT NULL,
  `nama_jenis_jual` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_bebanbiaya_list`
--

CREATE TABLE `mu_bebanbiaya_list` (
  `id_bebanbiaya_list` int(11) NOT NULL,
  `id_bebanbiaya_sub` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah_uang` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `waktu_proses` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_bebanbiaya_main`
--

CREATE TABLE `mu_bebanbiaya_main` (
  `id_bebanbiaya_main` int(11) NOT NULL,
  `nama_bebanbiaya_main` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_bebanbiaya_sub`
--

CREATE TABLE `mu_bebanbiaya_sub` (
  `id_bebanbiaya_sub` int(11) NOT NULL,
  `id_bebanbiaya_main` int(11) NOT NULL,
  `nama_bebanbiaya_sub` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_city`
--

CREATE TABLE `mu_city` (
  `city_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id_users` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mu_conf_barang`
--

CREATE TABLE `mu_conf_barang` (
  `id_conf_barang` int(11) NOT NULL,
  `kode_barang` enum('default','angka') NOT NULL,
  `harga_grosir` enum('visible','hidden') NOT NULL,
  `grosir_berdasarkan` enum('multi_satuan','jumlah_minimal') NOT NULL,
  `harga_kategori_pelanggan` enum('visible','hidden') NOT NULL,
  `kode_satuan` varchar(11) NOT NULL,
  `konversi_satuan_beli` enum('visible','hidden') NOT NULL,
  `sertakan_gambar` enum('visible','hidden') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_conf_penjualan`
--

CREATE TABLE `mu_conf_penjualan` (
  `id_conf_penjualan` int(11) NOT NULL,
  `terapkan_pajak` enum('visible','hidden') NOT NULL,
  `font_totalbayar_besar` enum('visible','hidden') NOT NULL,
  `posisi_totalbayar_besar` enum('atas','bawah') NOT NULL,
  `font_jumlahbayar_besar` enum('visible','hidden') NOT NULL,
  `tipe_diskon` enum('persen','uang') NOT NULL,
  `terapkan_perubahan_diskon` enum('visible','hidden') NOT NULL,
  `terapkan_perubahan_harga` enum('visible','hidden') NOT NULL,
  `terapkan_batas_piutang` enum('visible','hidden') NOT NULL,
  `id_jatuh_tempo` int(11) NOT NULL,
  `menunjang_penjualan_tunggu` enum('visible','hidden') NOT NULL,
  `sertakan_nama_penjual` enum('visible','hidden') NOT NULL,
  `sertakan_biaya_kirim` enum('visible','hidden') NOT NULL,
  `diskon_agen_expadisi` enum('visible','hidden') NOT NULL,
  `tipe_diskon_ekspedisi` enum('persen','uang') NOT NULL,
  `diskon_untuk_pelanggan` enum('visible','hidden') NOT NULL,
  `tipe_diskon_pelanggan` enum('persen','uang') NOT NULL,
  `kode_satuan` varchar(11) NOT NULL,
  `keterangan_perbarang` enum('visible','hidden') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_conf_perusahaan`
--

CREATE TABLE `mu_conf_perusahaan` (
  `id_perusahaan` int(11) NOT NULL,
  `nama_perusahaan` varchar(255) NOT NULL,
  `npwp_perusahaan` varchar(100) NOT NULL,
  `alamat_perusahaan` text NOT NULL,
  `city_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `email` varchar(150) NOT NULL,
  `fax` varchar(150) NOT NULL,
  `website` varchar(255) NOT NULL,
  `kode_pos` int(11) NOT NULL,
  `logo` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_country`
--

CREATE TABLE `mu_country` (
  `country_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id_users` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_departemen`
--

CREATE TABLE `mu_departemen` (
  `id_departemen` int(11) NOT NULL,
  `nama_departemen` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `id_users` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_jabatan`
--

CREATE TABLE `mu_jabatan` (
  `id_jabatan` int(11) NOT NULL,
  `nama_jabatan` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `id_users` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_jatuh_tempo`
--

CREATE TABLE `mu_jatuh_tempo` (
  `id_jatuh_tempo` int(11) NOT NULL,
  `hari_jatuh_tempo` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_jenis_kelamin`
--

CREATE TABLE `mu_jenis_kelamin` (
  `id_jenis_kelamin` int(11) NOT NULL,
  `nama_jenis_kelamin` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_karyawan`
--

CREATE TABLE `mu_karyawan` (
  `id_karyawan` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nik` varchar(50) NOT NULL,
  `nama_karyawan` varchar(100) NOT NULL,
  `id_jenis_kelamin` int(11) NOT NULL,
  `tempat_lahir` varchar(255) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `id_agama` int(11) NOT NULL,
  `id_status_pernikahan` int(11) NOT NULL,
  `alamat_karyawan_1` varchar(255) NOT NULL,
  `alamat_karyawan_2` varchar(255) NOT NULL,
  `city_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `telepon_karyawan` varchar(15) NOT NULL,
  `hp_karyawan` varchar(15) NOT NULL,
  `email_karyawan` varchar(150) NOT NULL,
  `website_karyawan` varchar(255) NOT NULL,
  `kode_pos_karyawan` int(10) NOT NULL,
  `fax_karyawan` varchar(15) NOT NULL,
  `chat_karyawan` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `foto_karyawan` varchar(255) NOT NULL,
  `id_jabatan` int(11) NOT NULL,
  `id_departemen` int(11) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `id_status_karyawan` int(11) NOT NULL,
  `aktif` enum('ya','tidak') NOT NULL,
  `id_users` int(11) NOT NULL,
  `waktu_daftar` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_kategori`
--

CREATE TABLE `mu_kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `id_users` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_kategori_pelanggan`
--

CREATE TABLE `mu_kategori_pelanggan` (
  `id_kategori_pelanggan` int(11) NOT NULL,
  `nama_kategori_pelanggan` varchar(255) NOT NULL,
  `permanen` enum('y','n') NOT NULL DEFAULT 'n',
  `id_users` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_pelanggan`
--

CREATE TABLE `mu_pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `id_kategori_pelanggan` int(11) NOT NULL,
  `id_type_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `kontak_pelanggan` varchar(150) NOT NULL,
  `alamat_pelanggan_1` varchar(255) NOT NULL,
  `alamat_pelanggan_2` varchar(255) NOT NULL,
  `city_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `telpon_pelanggan` varchar(15) NOT NULL,
  `hp_pelanggan` varchar(15) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `website_pelanggan` varchar(100) NOT NULL,
  `kode_pos_pelanggan` int(10) NOT NULL,
  `fax_pelanggan` varchar(15) NOT NULL,
  `chat_pelanggan` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `id_users` int(11) NOT NULL,
  `waktu_daftar` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_pelanggan_piutang`
--

CREATE TABLE `mu_pelanggan_piutang` (
  `id_pelanggan_piutang` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `batas_piutang` int(11) NOT NULL,
  `batas_frekuensi` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_pembelian`
--

CREATE TABLE `mu_pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `kode_pembelian` varchar(50) NOT NULL,
  `tgl_kirim` date NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `id_type_bayar` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `tgl_pembelian` date NOT NULL,
  `tgl_terima` date NOT NULL,
  `referensi` varchar(255) NOT NULL,
  `kepada_attention` varchar(255) NOT NULL,
  `id_users` int(11) NOT NULL,
  `waktu_pembelian` datetime NOT NULL,
  `akun` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_pembelian_detail`
--

CREATE TABLE `mu_pembelian_detail` (
  `id_pembelian_detail` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jml_pesan` int(11) NOT NULL,
  `harga_pesan` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_pembelian_return`
--

CREATE TABLE `mu_pembelian_return` (
  `id_pembelian_return` int(11) NOT NULL,
  `id_pembelian_terima` int(11) NOT NULL,
  `no_return` varchar(50) NOT NULL,
  `tgl_kirim_return` date NOT NULL,
  `id_type_bayar` int(11) NOT NULL,
  `keterangan_return` text NOT NULL,
  `tanggal_return` date NOT NULL,
  `id_users` int(11) NOT NULL,
  `waktu_return` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_pembelian_return_detail`
--

CREATE TABLE `mu_pembelian_return_detail` (
  `id_pembelian_return_detail` int(11) NOT NULL,
  `id_pembelian_return` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `harga_return` int(11) NOT NULL,
  `jml_return` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_pembelian_terima`
--

CREATE TABLE `mu_pembelian_terima` (
  `id_pembelian_terima` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `no_pembelian_terima` varchar(50) NOT NULL,
  `no_surat_jalan` varchar(50) NOT NULL,
  `pengirim_barang` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `tanggal_terima` date NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `waktu_proses` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_pembelian_terima_detail`
--

CREATE TABLE `mu_pembelian_terima_detail` (
  `id_pembelian_terima_detail` int(11) NOT NULL,
  `id_pembelian_terima` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `harga_pembelian` int(11) NOT NULL,
  `jml_terima` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_pendapatan_list`
--

CREATE TABLE `mu_pendapatan_list` (
  `id_pendapatan_list` int(11) NOT NULL,
  `id_pendapatan_sub` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah_uang` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `waktu_proses` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_pendapatan_main`
--

CREATE TABLE `mu_pendapatan_main` (
  `id_pendapatan_main` int(11) NOT NULL,
  `nama_pendapatan_main` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_pendapatan_sub`
--

CREATE TABLE `mu_pendapatan_sub` (
  `id_pendapatan_sub` int(11) NOT NULL,
  `id_pendapatan_main` int(11) NOT NULL,
  `nama_pendapatan_sub` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_pendidikan`
--

CREATE TABLE `mu_pendidikan` (
  `id_pendidikan` int(11) NOT NULL,
  `nama_pendidikan` varchar(255) NOT NULL,
  `id_users` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_penyesuaian`
--

CREATE TABLE `mu_penyesuaian` (
  `id_penyesuaian` int(11) NOT NULL,
  `id_sebab_alasan` int(11) NOT NULL,
  `tanggal_penyesuaian` date NOT NULL,
  `keterangan` text NOT NULL,
  `id_users` int(11) NOT NULL,
  `tanggal_proses` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_penyesuaian_detail`
--

CREATE TABLE `mu_penyesuaian_detail` (
  `id_penyesuaian_detail` int(11) NOT NULL,
  `id_penyesuaian` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `stok_history` int(11) NOT NULL,
  `tambah` int(11) NOT NULL,
  `kurang` int(11) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_promosi`
--

CREATE TABLE `mu_promosi` (
  `id_promosi` int(11) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `kode_terapkan` varchar(50) NOT NULL,
  `id_kategori` int(11) DEFAULT 0,
  `id_subkategori` int(11) DEFAULT 0,
  `beli_barang` int(11) NOT NULL,
  `jml_beli` int(11) NOT NULL,
  `bonus_barang` int(11) NOT NULL,
  `jml_bonus` int(11) NOT NULL,
  `jenis_diskon` enum('persen','uang') NOT NULL,
  `keterangan` text NOT NULL,
  `id_users` int(11) NOT NULL,
  `waktu_promosi` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_promosi_detail`
--

CREATE TABLE `mu_promosi_detail` (
  `id_promosi_detail` int(11) NOT NULL,
  `id_promosi` int(11) NOT NULL,
  `id_kategori_pelanggan` int(11) NOT NULL,
  `ecer` int(11) DEFAULT NULL,
  `grosir1` int(11) DEFAULT NULL,
  `grosir2` int(11) DEFAULT NULL,
  `grosir3` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_promosi_terapkan`
--

CREATE TABLE `mu_promosi_terapkan` (
  `kode_terapkan` varchar(50) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_rak`
--

CREATE TABLE `mu_rak` (
  `id_rak` int(11) NOT NULL,
  `nama_rak` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `id_users` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_satuan`
--

CREATE TABLE `mu_satuan` (
  `kode_satuan` varchar(10) NOT NULL,
  `keterangan` text NOT NULL,
  `id_users` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_sebab_alasan`
--

CREATE TABLE `mu_sebab_alasan` (
  `id_sebab_alasan` int(11) NOT NULL,
  `nama_sebab_alasan` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `id_users` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_state`
--

CREATE TABLE `mu_state` (
  `state_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id_users` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mu_status_karyawan`
--

CREATE TABLE `mu_status_karyawan` (
  `id_status_karyawan` int(11) NOT NULL,
  `nama_status_karyawan` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_status_pernikahan`
--

CREATE TABLE `mu_status_pernikahan` (
  `id_status_pernikahan` int(11) NOT NULL,
  `nama_status_pernikahan` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_subkategori`
--

CREATE TABLE `mu_subkategori` (
  `id_subkategori` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama_subkategori` varchar(255) NOT NULL,
  `id_users` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_supplier`
--

CREATE TABLE `mu_supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(150) NOT NULL,
  `kontak_person` varchar(150) NOT NULL,
  `alamat_1` varchar(255) NOT NULL,
  `alamat_2` varchar(255) NOT NULL,
  `city_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `hp` varchar(15) NOT NULL,
  `email` varchar(150) NOT NULL,
  `website` varchar(150) NOT NULL,
  `kode_pos` int(10) NOT NULL,
  `fax` varchar(50) NOT NULL,
  `chat` varchar(100) NOT NULL,
  `id_users` int(11) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_tagihan`
--

CREATE TABLE `mu_tagihan` (
  `id_tagihan` int(11) NOT NULL,
  `kode_tagihan` varchar(50) NOT NULL,
  `tgl_kirim` date NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_type_bayar` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `tgl_tagihan` date NOT NULL,
  `tgl_terima` date NOT NULL,
  `referensi` varchar(255) NOT NULL,
  `kepada_attention` varchar(255) NOT NULL,
  `id_users` int(11) NOT NULL,
  `waktu_tagihan` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_tagihan_detail`
--

CREATE TABLE `mu_tagihan_detail` (
  `id_tagihan_detail` int(11) NOT NULL,
  `id_tagihan` int(11) NOT NULL,
  `id_transaksi` int(11) DEFAULT NULL,
  `id_transaksi_detail` int(11) DEFAULT NULL,
  `id_barang` int(11) NOT NULL,
  `jml_pesan` int(11) NOT NULL,
  `harga_pesan` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_tagihan_terima`
--

CREATE TABLE `mu_tagihan_terima` (
  `id_tagihan_terima` int(11) NOT NULL,
  `id_tagihan` int(11) NOT NULL,
  `no_tagihan_terima` varchar(50) NOT NULL,
  `no_surat_jalan` varchar(50) NOT NULL,
  `pengirim_barang` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `tanggal_terima` date NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `waktu_proses` datetime NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_tagihan_terima_detail`
--

CREATE TABLE `mu_tagihan_terima_detail` (
  `id_tagihan_terima_detail` int(11) NOT NULL,
  `id_tagihan_terima` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `harga_tagihan` int(11) NOT NULL,
  `jml_terima` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_tipe_diskon`
--

CREATE TABLE `mu_tipe_diskon` (
  `tipe_diskon` varchar(20) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_transaksi`
--

CREATE TABLE `mu_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `kode_transaksi` varchar(15) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `id_type_bayar` int(11) NOT NULL,
  `id_agen_ekspedisi` int(11) NOT NULL,
  `no_resi` varchar(100) NOT NULL,
  `biaya_kirim` int(11) NOT NULL,
  `diskon_persen` int(11) NOT NULL,
  `diskon_rupiah` int(11) NOT NULL,
  `diskon_belanja` int(11) NOT NULL,
  `gratis_kirim` int(11) DEFAULT NULL,
  `jumlah_bayar` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `status` enum('tunggu','proses','selesai') NOT NULL DEFAULT 'proses',
  `id_karyawan` int(11) NOT NULL,
  `waktu_proses` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_transaksi_detail`
--

CREATE TABLE `mu_transaksi_detail` (
  `id_transaksi_detail` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jumlah_jual` varchar(255) NOT NULL,
  `kode_satuan` varchar(10) NOT NULL,
  `jumlah_satuan` int(11) NOT NULL,
  `diskon_jual` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_transaksi_return`
--

CREATE TABLE `mu_transaksi_return` (
  `id_transaksi_return` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_type_bayar` int(11) NOT NULL,
  `bayar_return` int(11) NOT NULL,
  `ket_return` text NOT NULL,
  `status` enum('proses','selesai') NOT NULL DEFAULT 'proses',
  `id_karyawan` int(11) NOT NULL,
  `waktu_return` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_transaksi_return_detail`
--

CREATE TABLE `mu_transaksi_return_detail` (
  `id_transaksi_return_detail` int(11) NOT NULL,
  `id_transaksi_return` int(11) NOT NULL,
  `id_transaksi_detail` int(11) NOT NULL,
  `jumlah_return` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_type_bayar`
--

CREATE TABLE `mu_type_bayar` (
  `id_type_bayar` int(11) NOT NULL,
  `nama_type_bayar` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mu_type_pelanggan`
--

CREATE TABLE `mu_type_pelanggan` (
  `id_type_pelanggan` int(11) NOT NULL,
  `type_pelanggan` varchar(255) NOT NULL,
  `id_users` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nama_kas_tbl`
--

CREATE TABLE `nama_kas_tbl` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `aktif` enum('Y','N') NOT NULL,
  `tmpl_simpan` enum('Y','N') NOT NULL,
  `tmpl_penarikan` enum('Y','N') NOT NULL,
  `tmpl_pinjaman` enum('Y','N') NOT NULL,
  `tmpl_bayar` enum('Y','N') NOT NULL,
  `tmpl_pemasukan` enum('Y','N') NOT NULL,
  `tmpl_pengeluaran` enum('Y','N') NOT NULL,
  `tmpl_transfer` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nama_kas_tbl1`
--

CREATE TABLE `nama_kas_tbl1` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `aktif` enum('Y','T') NOT NULL,
  `tmpl_simpan` varchar(30) DEFAULT NULL,
  `tmpl_penarikan` enum('Y','T') NOT NULL,
  `tmpl_pinjaman` enum('Y','T') NOT NULL,
  `tmpl_bayar` enum('Y','T') NOT NULL,
  `tmpl_pemasukan` enum('Y','T') NOT NULL,
  `tmpl_pengeluaran` enum('Y','T') NOT NULL,
  `tmpl_transfer` enum('Y','T') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nama_kas_tbl2`
--

CREATE TABLE `nama_kas_tbl2` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `aktif` enum('Y','T') NOT NULL,
  `tmpl_simpan` enum('Y','T') NOT NULL,
  `tmpl_penarikan` enum('Y','T') NOT NULL,
  `tmpl_pinjaman` enum('Y','T') NOT NULL,
  `tmpl_bayar` enum('Y','T') NOT NULL,
  `tmpl_pemasukan` enum('Y','T') NOT NULL,
  `tmpl_pengeluaran` enum('Y','T') NOT NULL,
  `tmpl_transfer` enum('Y','T') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pekerjaan`
--

CREATE TABLE `pekerjaan` (
  `id_kerja` varchar(5) NOT NULL,
  `jenis_kerja` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `shu`
-- (See below for the actual view)
--
CREATE TABLE `shu` (
`id` bigint(20)
,`nama` varchar(255)
,`SUM(shu.simpanan)` double
,`SUM(shu.pendapatan)` decimal(54,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `shu_anggota_jasamodal`
-- (See below for the actual view)
--
CREATE TABLE `shu_anggota_jasamodal` (
`id` binary(0)
,`tgl_transaksi` varchar(10)
,`anggota_id` bigint(20)
,`jenis_id` int(2)
,`jumlah` double(17,0)
,`Keterangan` varchar(25)
,`akun` varchar(7)
,`dk` varchar(1)
,`kas_id` int(2)
,`update_data` char(0)
,`user_name` varchar(5)
,`nama_penyetor` varchar(5)
,`alamat` varchar(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `shu_anggota_jasausaha`
-- (See below for the actual view)
--
CREATE TABLE `shu_anggota_jasausaha` (
`id` binary(0)
,`tgl_transaksi` varchar(10)
,`anggota_id` bigint(20)
,`jenis_id` int(2)
,`jumlah` decimal(41,0)
,`Keterangan` varchar(25)
,`akun` varchar(7)
,`dk` varchar(1)
,`kas_id` int(2)
,`update_data` char(0)
,`user_name` varchar(5)
,`nama_penyetor` varchar(5)
,`alamat` varchar(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `shu_anggota_per_tahun`
-- (See below for the actual view)
--
CREATE TABLE `shu_anggota_per_tahun` (
`id` bigint(20)
,`nama` varchar(255)
,`total_simp` double
,`total_pinj` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `shu_jasamodal_2022`
-- (See below for the actual view)
--
CREATE TABLE `shu_jasamodal_2022` (
`id` binary(0)
,`tgl_transaksi` varchar(10)
,`anggota_id` bigint(20)
,`jenis_id` int(2)
,`jumlah` double(17,0)
,`Keterangan` varchar(39)
,`akun` varchar(7)
,`dk` varchar(1)
,`kas_id` int(2)
,`update_data` datetime
,`user_name` varchar(5)
,`nama_penyetor` varchar(5)
,`no_identitas` varchar(1)
,`alamat` varchar(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `shu_jasamodal_2023`
-- (See below for the actual view)
--
CREATE TABLE `shu_jasamodal_2023` (
`id` binary(0)
,`tgl_transaksi` varchar(10)
,`anggota_id` bigint(20)
,`jenis_id` int(2)
,`jumlah` double(17,0)
,`Keterangan` varchar(39)
,`akun` varchar(7)
,`dk` varchar(1)
,`kas_id` int(1)
,`update_data` datetime
,`user_name` varchar(5)
,`nama_penyetor` varchar(5)
,`no_identitas` varchar(1)
,`alamat` varchar(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `shu_jasausaha_2022`
-- (See below for the actual view)
--
CREATE TABLE `shu_jasausaha_2022` (
`id` binary(0)
,`tgl_transaksi` varchar(10)
,`anggota_id` bigint(20)
,`jenis_id` int(2)
,`jumlah` decimal(40,0)
,`Keterangan` varchar(39)
,`akun` varchar(7)
,`dk` varchar(1)
,`kas_id` int(2)
,`update_data` datetime
,`user_name` varchar(5)
,`nama_penyetor` varchar(5)
,`no_identitas` varchar(1)
,`alamat` varchar(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `shu_jasausaha_2023`
-- (See below for the actual view)
--
CREATE TABLE `shu_jasausaha_2023` (
`id` binary(0)
,`tgl_transaksi` varchar(10)
,`anggota_id` bigint(20)
,`jenis_id` int(2)
,`jumlah` decimal(40,0)
,`Keterangan` varchar(39)
,`akun` varchar(7)
,`dk` varchar(1)
,`kas_id` int(2)
,`update_data` datetime
,`user_name` varchar(5)
,`nama_penyetor` varchar(5)
,`no_identitas` varchar(1)
,`alamat` varchar(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `shu_jasa_modal_2024`
-- (See below for the actual view)
--
CREATE TABLE `shu_jasa_modal_2024` (
`id` binary(0)
,`tgl_transaksi` varchar(10)
,`anggota_id` bigint(20)
,`jenis_id` int(2)
,`jumlah` double(17,0)
,`Keterangan` varchar(39)
,`akun` varchar(7)
,`dk` varchar(1)
,`kas_id` int(2)
,`update_data` datetime
,`user_name` varchar(5)
,`nama_penyetor` varchar(5)
,`no_identitas` varchar(1)
,`alamat` varchar(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `shu_jasa_usaha_2024`
-- (See below for the actual view)
--
CREATE TABLE `shu_jasa_usaha_2024` (
`id` binary(0)
,`tgl_transaksi` varchar(10)
,`anggota_id` bigint(20)
,`jenis_id` int(2)
,`jumlah` decimal(40,0)
,`Keterangan` varchar(39)
,`akun` varchar(7)
,`dk` varchar(1)
,`kas_id` int(2)
,`update_data` datetime
,`user_name` varchar(5)
,`nama_penyetor` varchar(5)
,`no_identitas` varchar(1)
,`alamat` varchar(1)
);

-- --------------------------------------------------------

--
-- Table structure for table `suku_bunga`
--

CREATE TABLE `suku_bunga` (
  `id` int(10) NOT NULL,
  `opsi_key` varchar(20) NOT NULL,
  `opsi_val` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_anggota`
--

CREATE TABLE `tbl_anggota` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `identitas` varchar(255) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `tmp_lahir` varchar(225) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `status` varchar(30) NOT NULL,
  `agama` varchar(30) NOT NULL,
  `departement` varchar(255) NOT NULL,
  `pekerjaan` varchar(30) NOT NULL,
  `alamat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kota` varchar(255) NOT NULL,
  `notelp` varchar(12) NOT NULL,
  `tgl_daftar` date NOT NULL,
  `jabatan_id` int(10) NOT NULL,
  `aktif` enum('Y','N') NOT NULL,
  `tanggal_keluar` date DEFAULT NULL,
  `pass_word` varchar(225) NOT NULL,
  `file_pic` varchar(225) NOT NULL,
  `password2` varchar(225) DEFAULT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `id` bigint(20) NOT NULL,
  `nm_barang` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `merk` varchar(50) NOT NULL,
  `harga` double NOT NULL,
  `jml_brg` int(11) NOT NULL,
  `ket` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pengajuan`
--

CREATE TABLE `tbl_pengajuan` (
  `id` bigint(20) NOT NULL,
  `no_ajuan` int(11) NOT NULL,
  `ajuan_id` varchar(255) NOT NULL,
  `anggota_id` bigint(20) NOT NULL,
  `tgl_input` datetime NOT NULL,
  `jenis` varchar(255) NOT NULL,
  `nominal` bigint(20) NOT NULL,
  `lama_ags` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `alasan` varchar(255) NOT NULL,
  `tgl_cair` date NOT NULL,
  `tgl_update` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pengajuan1`
--

CREATE TABLE `tbl_pengajuan1` (
  `id` bigint(20) NOT NULL,
  `no_ajuan` int(11) NOT NULL,
  `ajuan_id` varchar(255) NOT NULL,
  `anggota_id` bigint(20) NOT NULL,
  `tgl_input` datetime NOT NULL,
  `jenis` varchar(255) NOT NULL,
  `nominal` bigint(20) NOT NULL,
  `lama_ags` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `alasan` varchar(255) NOT NULL,
  `tgl_cair` date NOT NULL,
  `tgl_update` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pinjaman_d`
--

CREATE TABLE `tbl_pinjaman_d` (
  `id` bigint(20) NOT NULL,
  `tgl_bayar` datetime NOT NULL,
  `pinjam_id` bigint(20) NOT NULL,
  `angsuran_ke` bigint(20) NOT NULL,
  `jumlah_bayar` int(11) NOT NULL,
  `denda_rp` int(11) DEFAULT NULL,
  `terlambat` int(11) DEFAULT NULL,
  `ket_bayar` enum('Angsuran','Pelunasan','Bayar Denda') NOT NULL,
  `dk` enum('D','K') NOT NULL,
  `kas_id` bigint(20) NOT NULL,
  `jns_trans` bigint(20) NOT NULL,
  `update_data` datetime DEFAULT current_timestamp(),
  `user_name` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `angsuran_pokok` int(11) NOT NULL,
  `pendapatan` int(11) NOT NULL,
  `akun_pendapatan` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pinjaman_d_copy`
--

CREATE TABLE `tbl_pinjaman_d_copy` (
  `id` bigint(20) NOT NULL,
  `tgl_bayar` datetime NOT NULL,
  `pinjam_id` bigint(20) NOT NULL,
  `angsuran_ke` bigint(20) NOT NULL,
  `jumlah_bayar` int(11) NOT NULL,
  `denda_rp` int(11) DEFAULT NULL,
  `terlambat` int(11) DEFAULT NULL,
  `ket_bayar` enum('Angsuran','Pelunasan','Bayar Denda') NOT NULL,
  `dk` enum('D','K') NOT NULL,
  `kas_id` bigint(20) NOT NULL,
  `jns_trans` bigint(20) NOT NULL,
  `update_data` datetime DEFAULT current_timestamp(),
  `user_name` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `angsuran_pokok` int(11) NOT NULL,
  `pendapatan` int(11) NOT NULL,
  `akun_pendapatan` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pinjaman_d_tmp`
--

CREATE TABLE `tbl_pinjaman_d_tmp` (
  `id` bigint(20) NOT NULL,
  `tgl_bayar` datetime NOT NULL,
  `pinjam_id` bigint(20) NOT NULL,
  `angsuran_ke` bigint(20) NOT NULL,
  `jumlah_bayar` int(11) NOT NULL,
  `denda_rp` int(11) NOT NULL,
  `terlambat` int(11) NOT NULL,
  `ket_bayar` enum('Angsuran','Pelunasan','Bayar Denda') NOT NULL,
  `dk` enum('D','K') NOT NULL,
  `kas_id` bigint(20) NOT NULL,
  `jns_trans` bigint(20) NOT NULL,
  `update_data` datetime NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pinjaman_h`
--

CREATE TABLE `tbl_pinjaman_h` (
  `id` bigint(20) NOT NULL,
  `tgl_pinjam` datetime NOT NULL,
  `anggota_id` bigint(20) NOT NULL,
  `barang_id` bigint(20) NOT NULL,
  `lama_angsuran` bigint(20) NOT NULL,
  `jml_barang` int(11) NOT NULL DEFAULT 1,
  `harga_satuan` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `bunga` float(10,2) NOT NULL,
  `biaya_adm` int(11) NOT NULL,
  `lunas` enum('Belum','Lunas') NOT NULL,
  `dk` enum('D','K') NOT NULL,
  `kas_id` bigint(20) NOT NULL,
  `jns_trans` bigint(20) NOT NULL,
  `update_data` datetime DEFAULT current_timestamp(),
  `user_name` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `contoh` int(23) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pinjaman_h_tmp`
--

CREATE TABLE `tbl_pinjaman_h_tmp` (
  `id` bigint(20) NOT NULL,
  `tgl_pinjam` datetime NOT NULL,
  `anggota_id` bigint(20) NOT NULL,
  `barang_id` bigint(20) NOT NULL,
  `lama_angsuran` bigint(20) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `bunga` float(10,2) NOT NULL,
  `biaya_adm` int(11) NOT NULL,
  `lunas` enum('Belum','Lunas') NOT NULL,
  `dk` enum('D','K') NOT NULL,
  `kas_id` bigint(20) NOT NULL,
  `jns_trans` bigint(20) NOT NULL,
  `update_data` datetime NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `contoh` int(23) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_saldoawal_kas`
--

CREATE TABLE `tbl_saldoawal_kas` (
  `noid` bigint(20) NOT NULL,
  `tanggal` datetime NOT NULL,
  `akun` varchar(20) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `saldo_awal` double NOT NULL,
  `debet` double DEFAULT NULL,
  `kredit` double DEFAULT NULL,
  `saldo_akhir` double DEFAULT NULL,
  `update_data` datetime DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_saldoawal_nonkas`
--

CREATE TABLE `tbl_saldoawal_nonkas` (
  `noid` bigint(20) NOT NULL,
  `tanggal` datetime NOT NULL,
  `akun` varchar(20) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `saldo_awal` double NOT NULL,
  `debet` double DEFAULT NULL,
  `kredit` double DEFAULT NULL,
  `saldo_akhir` double DEFAULT NULL,
  `update_data` datetime DEFAULT current_timestamp(),
  `user_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_setting`
--

CREATE TABLE `tbl_setting` (
  `id` bigint(20) NOT NULL,
  `opsi_key` varchar(255) NOT NULL,
  `opsi_val` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_trans_kas`
--

CREATE TABLE `tbl_trans_kas` (
  `id` bigint(20) NOT NULL,
  `tgl_catat` datetime NOT NULL,
  `jumlah` double NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `akun` enum('Pemasukan','Pengeluaran','Transfer','Nonkas') NOT NULL,
  `dari_kas_id` bigint(20) DEFAULT NULL,
  `untuk_kas_id` bigint(20) DEFAULT NULL,
  `jns_trans` bigint(20) DEFAULT NULL,
  `dk` enum('D','K') DEFAULT NULL,
  `update_data` datetime DEFAULT current_timestamp(),
  `user_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_trans_nonkas`
--

CREATE TABLE `tbl_trans_nonkas` (
  `id` bigint(20) NOT NULL,
  `tgl_catat` datetime NOT NULL,
  `jumlah` double NOT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `akun` enum('Pemasukan','Pengeluaran','Transfer','Nonkas') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `akun_debit` bigint(20) DEFAULT NULL,
  `akun_kredit` bigint(20) DEFAULT NULL,
  `dk` enum('D','K') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_data` datetime NOT NULL DEFAULT current_timestamp(),
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_trans_sp`
--

CREATE TABLE `tbl_trans_sp` (
  `id` bigint(20) NOT NULL,
  `tgl_transaksi` datetime NOT NULL,
  `anggota_id` bigint(20) NOT NULL,
  `jenis_id` int(5) NOT NULL,
  `jumlah` double NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `akun` enum('Setoran','Penarikan') NOT NULL,
  `dk` enum('D','K') NOT NULL,
  `kas_id` bigint(20) NOT NULL,
  `update_data` datetime DEFAULT current_timestamp(),
  `user_name` varchar(255) NOT NULL,
  `nama_penyetor` varchar(255) NOT NULL,
  `no_identitas` varchar(20) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_trans_sp_tmp`
--

CREATE TABLE `tbl_trans_sp_tmp` (
  `id` bigint(20) NOT NULL,
  `tgl_transaksi` datetime NOT NULL,
  `anggota_id` bigint(20) NOT NULL,
  `jenis_id` int(5) NOT NULL,
  `jumlah` double NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `akun` enum('Setoran','Penarikan') NOT NULL,
  `dk` enum('D','K') NOT NULL,
  `kas_id` bigint(20) NOT NULL,
  `update_data` datetime NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `nama_penyetor` varchar(255) NOT NULL,
  `no_identitas` varchar(20) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` bigint(20) NOT NULL,
  `u_name` varchar(255) NOT NULL,
  `pass_word` varchar(255) NOT NULL,
  `aktif` enum('Y','N') NOT NULL,
  `level` enum('admin','operator','pinjaman') NOT NULL,
  `password2` varchar(100) DEFAULT NULL,
  `level_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userlevelpermissions`
--

CREATE TABLE `userlevelpermissions` (
  `userlevelid` int(11) NOT NULL,
  `tablename` varchar(191) NOT NULL,
  `permission` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userlevels`
--

CREATE TABLE `userlevels` (
  `userlevelid` int(11) NOT NULL,
  `userlevelname` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_akun`
-- (See below for the actual view)
--
CREATE TABLE `v_akun` (
`id` bigint(20)
,`kd_aktiva` varchar(20)
,`kasbank` varchar(1)
,`nama` varchar(225)
,`jns_trans` varchar(225)
,`akun` varchar(6)
,`tmpl_simpan` varchar(1)
,`tmpl_penarikan` enum('Y','N')
,`tmpl_pinjaman` varchar(1)
,`tmpl_bayar` enum('Y','N')
,`tmpl_pemasukan` varchar(1)
,`tmpl_pengeluaran` varchar(1)
,`tmpl_transfer` enum('Y','N')
,`laba_rugi` binary(0)
,`pemasukan` varchar(1)
,`pengeluaran` varchar(1)
,`non_kas` enum('Y','N')
,`simpanan` varchar(1)
,`pinjaman` varchar(1)
,`pinjam_dari` varchar(1)
,`aktif` varchar(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_hitung_pinjaman`
-- (See below for the actual view)
--
CREATE TABLE `v_hitung_pinjaman` (
`id` bigint(20)
,`tgl_pinjam` datetime
,`anggota_id` bigint(20)
,`nama` varchar(255)
,`lama_angsuran` bigint(20)
,`jml_barang` int(11)
,`harga_satuan` int(11)
,`jumlah` int(11)
,`bunga` float(10,2)
,`biaya_adm` int(11)
,`lunas` enum('Belum','Lunas')
,`dk` enum('D','K')
,`kas_id` bigint(20)
,`user_name` varchar(255)
,`pokok_angsuran` decimal(14,4)
,`jns_trans` bigint(20)
,`bunga_pinjaman` double(17,0)
,`ags_per_bulan` double(17,0)
,`tempo` datetime
,`tagihan` double(17,0)
,`keterangan` varchar(255)
,`barang_id` bigint(20)
,`bln_sudah_angsur` bigint(20)
,`total_angsuran` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_iuran_wajib`
-- (See below for the actual view)
--
CREATE TABLE `v_iuran_wajib` (
`id` binary(0)
,`tgl_transaksi` varchar(10)
,`anggota_id` bigint(20)
,`jenis_id` int(2)
,`jumlah` varchar(255)
,`keterangan` varchar(287)
,`akun` varchar(7)
,`dk` varchar(1)
,`kas_id` int(1)
,`update_data` datetime
,`username` varchar(5)
,`nama_penyetor` varchar(5)
,`no_identitas` varchar(5)
,`alamat` varchar(5)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_pinjaman_d`
-- (See below for the actual view)
--
CREATE TABLE `v_pinjaman_d` (
`pinjam_id` bigint(20)
,`tgl_bayar` datetime
,`angsuran_ke` bigint(20)
,`jumlah_bayar` int(11)
,`anggota_id` bigint(20)
,`denda_rp` int(11)
,`lunas` enum('Belum','Lunas')
,`pendapatan` int(11)
,`akun_pendapatan` bigint(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_pinjaman_h`
-- (See below for the actual view)
--
CREATE TABLE `v_pinjaman_h` (
`id` bigint(20)
,`tgl_pinjam` datetime
,`anggota_id` bigint(20)
,`nama` varchar(255)
,`lama_angsuran` bigint(20)
,`jumlah` int(11)
,`bunga` float(10,2)
,`biaya_adm` int(11)
,`lunas` enum('Belum','Lunas')
,`dk` enum('D','K')
,`kas_id` bigint(20)
,`user_name` varchar(255)
,`pokok_angsuran` decimal(14,4)
,`bunga_pinjaman` double(17,0)
,`ags_per_bulan` double(17,0)
,`tempo` datetime
,`tagihan` double(17,0)
,`keterangan` varchar(255)
,`barang_id` bigint(20)
,`bln_sudah_angsur` bigint(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_simpanan`
-- (See below for the actual view)
--
CREATE TABLE `v_simpanan` (
`Tahun` int(4)
,`Bulan` int(2)
,`Jumlah` double
,`akun` enum('Setoran','Penarikan')
,`kas_id` bigint(20)
,`Akun_Kas` varchar(225)
,`jns_trans` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_transaksi`
-- (See below for the actual view)
--
CREATE TABLE `v_transaksi` (
`tbl` varchar(2)
,`nama_tabel` varchar(20)
,`id` bigint(20)
,`tgl` datetime
,`kredit` double
,`debet` double
,`dari_kas` bigint(20)
,`untuk_kas` varchar(20)
,`transaksi` varchar(20)
,`ket` mediumtext
,`USER` varchar(255)
,`transaksi2` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_transaksi_all`
-- (See below for the actual view)
--
CREATE TABLE `v_transaksi_all` (
`tbl` varchar(1)
,`id` bigint(20)
,`tgl` datetime
,`kredit` double
,`debet` double
,`dari_kas` bigint(20)
,`untuk_kas` bigint(20)
,`transaksi` bigint(20)
,`ket` varchar(255)
,`user` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_transaksi_lama`
-- (See below for the actual view)
--
CREATE TABLE `v_transaksi_lama` (
`tbl` varchar(1)
,`id` bigint(20)
,`tgl` datetime
,`kredit` double
,`debet` double
,`dari_kas` bigint(20)
,`untuk_kas` bigint(20)
,`transaksi` bigint(20)
,`ket` varchar(255)
,`user` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_transaksi_v2`
-- (See below for the actual view)
--
CREATE TABLE `v_transaksi_v2` (
`tbl` varchar(2)
,`id` bigint(20)
,`tgl` datetime
,`kredit` double
,`debet` double
,`dari_kas` bigint(20)
,`untuk_kas` bigint(20)
,`transaksi` bigint(20)
,`ket` varchar(255)
,`user` varchar(255)
,`transaksi2` bigint(20)
);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `jns_akun`
--
ALTER TABLE `jns_akun`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kd_aktiva` (`kd_aktiva`);

--
-- Indexes for table `jns_akun1`
--
ALTER TABLE `jns_akun1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kd_aktiva` (`kd_aktiva`);

--
-- Indexes for table `jns_angsuran`
--
ALTER TABLE `jns_angsuran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jns_simpan`
--
ALTER TABLE `jns_simpan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mu_agama`
--
ALTER TABLE `mu_agama`
  ADD PRIMARY KEY (`id_agama`);

--
-- Indexes for table `mu_agen_ekspedisi`
--
ALTER TABLE `mu_agen_ekspedisi`
  ADD PRIMARY KEY (`id_agen_ekspedisi`);

--
-- Indexes for table `mu_bahasa`
--
ALTER TABLE `mu_bahasa`
  ADD PRIMARY KEY (`id_bahasa`);

--
-- Indexes for table `mu_barang`
--
ALTER TABLE `mu_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `mu_barang_harga`
--
ALTER TABLE `mu_barang_harga`
  ADD PRIMARY KEY (`id_barang_harga`);

--
-- Indexes for table `mu_barang_jenis_jual`
--
ALTER TABLE `mu_barang_jenis_jual`
  ADD PRIMARY KEY (`id_barang_jenis_jual`);

--
-- Indexes for table `mu_bebanbiaya_list`
--
ALTER TABLE `mu_bebanbiaya_list`
  ADD PRIMARY KEY (`id_bebanbiaya_list`);

--
-- Indexes for table `mu_bebanbiaya_main`
--
ALTER TABLE `mu_bebanbiaya_main`
  ADD PRIMARY KEY (`id_bebanbiaya_main`);

--
-- Indexes for table `mu_bebanbiaya_sub`
--
ALTER TABLE `mu_bebanbiaya_sub`
  ADD PRIMARY KEY (`id_bebanbiaya_sub`);

--
-- Indexes for table `mu_city`
--
ALTER TABLE `mu_city`
  ADD PRIMARY KEY (`city_id`),
  ADD KEY `fk_city_state` (`state_id`);

--
-- Indexes for table `mu_conf_barang`
--
ALTER TABLE `mu_conf_barang`
  ADD PRIMARY KEY (`id_conf_barang`);

--
-- Indexes for table `mu_conf_penjualan`
--
ALTER TABLE `mu_conf_penjualan`
  ADD PRIMARY KEY (`id_conf_penjualan`);

--
-- Indexes for table `mu_conf_perusahaan`
--
ALTER TABLE `mu_conf_perusahaan`
  ADD PRIMARY KEY (`id_perusahaan`);

--
-- Indexes for table `mu_country`
--
ALTER TABLE `mu_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `mu_departemen`
--
ALTER TABLE `mu_departemen`
  ADD PRIMARY KEY (`id_departemen`);

--
-- Indexes for table `mu_jabatan`
--
ALTER TABLE `mu_jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `mu_jatuh_tempo`
--
ALTER TABLE `mu_jatuh_tempo`
  ADD PRIMARY KEY (`id_jatuh_tempo`);

--
-- Indexes for table `mu_jenis_kelamin`
--
ALTER TABLE `mu_jenis_kelamin`
  ADD PRIMARY KEY (`id_jenis_kelamin`);

--
-- Indexes for table `mu_karyawan`
--
ALTER TABLE `mu_karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indexes for table `mu_kategori`
--
ALTER TABLE `mu_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `mu_kategori_pelanggan`
--
ALTER TABLE `mu_kategori_pelanggan`
  ADD PRIMARY KEY (`id_kategori_pelanggan`);

--
-- Indexes for table `mu_pelanggan`
--
ALTER TABLE `mu_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `mu_pelanggan_piutang`
--
ALTER TABLE `mu_pelanggan_piutang`
  ADD PRIMARY KEY (`id_pelanggan_piutang`);

--
-- Indexes for table `mu_pembelian`
--
ALTER TABLE `mu_pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `mu_pembelian_detail`
--
ALTER TABLE `mu_pembelian_detail`
  ADD PRIMARY KEY (`id_pembelian_detail`);

--
-- Indexes for table `mu_pembelian_return`
--
ALTER TABLE `mu_pembelian_return`
  ADD PRIMARY KEY (`id_pembelian_return`);

--
-- Indexes for table `mu_pembelian_return_detail`
--
ALTER TABLE `mu_pembelian_return_detail`
  ADD PRIMARY KEY (`id_pembelian_return_detail`);

--
-- Indexes for table `mu_pembelian_terima`
--
ALTER TABLE `mu_pembelian_terima`
  ADD PRIMARY KEY (`id_pembelian_terima`);

--
-- Indexes for table `mu_pembelian_terima_detail`
--
ALTER TABLE `mu_pembelian_terima_detail`
  ADD PRIMARY KEY (`id_pembelian_terima_detail`);

--
-- Indexes for table `mu_pendapatan_list`
--
ALTER TABLE `mu_pendapatan_list`
  ADD PRIMARY KEY (`id_pendapatan_list`);

--
-- Indexes for table `mu_pendapatan_main`
--
ALTER TABLE `mu_pendapatan_main`
  ADD PRIMARY KEY (`id_pendapatan_main`);

--
-- Indexes for table `mu_pendapatan_sub`
--
ALTER TABLE `mu_pendapatan_sub`
  ADD PRIMARY KEY (`id_pendapatan_sub`);

--
-- Indexes for table `mu_pendidikan`
--
ALTER TABLE `mu_pendidikan`
  ADD PRIMARY KEY (`id_pendidikan`);

--
-- Indexes for table `mu_penyesuaian`
--
ALTER TABLE `mu_penyesuaian`
  ADD PRIMARY KEY (`id_penyesuaian`);

--
-- Indexes for table `mu_penyesuaian_detail`
--
ALTER TABLE `mu_penyesuaian_detail`
  ADD PRIMARY KEY (`id_penyesuaian_detail`);

--
-- Indexes for table `mu_promosi`
--
ALTER TABLE `mu_promosi`
  ADD PRIMARY KEY (`id_promosi`);

--
-- Indexes for table `mu_promosi_detail`
--
ALTER TABLE `mu_promosi_detail`
  ADD PRIMARY KEY (`id_promosi_detail`);

--
-- Indexes for table `mu_promosi_terapkan`
--
ALTER TABLE `mu_promosi_terapkan`
  ADD PRIMARY KEY (`kode_terapkan`);

--
-- Indexes for table `mu_rak`
--
ALTER TABLE `mu_rak`
  ADD PRIMARY KEY (`id_rak`);

--
-- Indexes for table `mu_satuan`
--
ALTER TABLE `mu_satuan`
  ADD PRIMARY KEY (`kode_satuan`);

--
-- Indexes for table `mu_sebab_alasan`
--
ALTER TABLE `mu_sebab_alasan`
  ADD PRIMARY KEY (`id_sebab_alasan`);

--
-- Indexes for table `mu_state`
--
ALTER TABLE `mu_state`
  ADD PRIMARY KEY (`state_id`),
  ADD KEY `fk_state_country` (`country_id`);

--
-- Indexes for table `mu_status_karyawan`
--
ALTER TABLE `mu_status_karyawan`
  ADD PRIMARY KEY (`id_status_karyawan`);

--
-- Indexes for table `mu_status_pernikahan`
--
ALTER TABLE `mu_status_pernikahan`
  ADD PRIMARY KEY (`id_status_pernikahan`);

--
-- Indexes for table `mu_subkategori`
--
ALTER TABLE `mu_subkategori`
  ADD PRIMARY KEY (`id_subkategori`);

--
-- Indexes for table `mu_supplier`
--
ALTER TABLE `mu_supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `mu_tagihan`
--
ALTER TABLE `mu_tagihan`
  ADD PRIMARY KEY (`id_tagihan`);

--
-- Indexes for table `mu_tagihan_detail`
--
ALTER TABLE `mu_tagihan_detail`
  ADD PRIMARY KEY (`id_tagihan_detail`);

--
-- Indexes for table `mu_tagihan_terima`
--
ALTER TABLE `mu_tagihan_terima`
  ADD PRIMARY KEY (`id_tagihan_terima`);

--
-- Indexes for table `mu_tagihan_terima_detail`
--
ALTER TABLE `mu_tagihan_terima_detail`
  ADD PRIMARY KEY (`id_tagihan_terima_detail`);

--
-- Indexes for table `mu_tipe_diskon`
--
ALTER TABLE `mu_tipe_diskon`
  ADD PRIMARY KEY (`tipe_diskon`);

--
-- Indexes for table `mu_transaksi`
--
ALTER TABLE `mu_transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `mu_transaksi_detail`
--
ALTER TABLE `mu_transaksi_detail`
  ADD PRIMARY KEY (`id_transaksi_detail`);

--
-- Indexes for table `mu_transaksi_return`
--
ALTER TABLE `mu_transaksi_return`
  ADD PRIMARY KEY (`id_transaksi_return`);

--
-- Indexes for table `mu_transaksi_return_detail`
--
ALTER TABLE `mu_transaksi_return_detail`
  ADD PRIMARY KEY (`id_transaksi_return_detail`);

--
-- Indexes for table `mu_type_bayar`
--
ALTER TABLE `mu_type_bayar`
  ADD PRIMARY KEY (`id_type_bayar`);

--
-- Indexes for table `mu_type_pelanggan`
--
ALTER TABLE `mu_type_pelanggan`
  ADD PRIMARY KEY (`id_type_pelanggan`);

--
-- Indexes for table `nama_kas_tbl`
--
ALTER TABLE `nama_kas_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nama_kas_tbl1`
--
ALTER TABLE `nama_kas_tbl1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nama_kas_tbl2`
--
ALTER TABLE `nama_kas_tbl2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suku_bunga`
--
ALTER TABLE `suku_bunga`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_anggota`
--
ALTER TABLE `tbl_anggota`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identitas` (`identitas`);

--
-- Indexes for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pengajuan`
--
ALTER TABLE `tbl_pengajuan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`anggota_id`);

--
-- Indexes for table `tbl_pengajuan1`
--
ALTER TABLE `tbl_pengajuan1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`anggota_id`);

--
-- Indexes for table `tbl_pinjaman_d`
--
ALTER TABLE `tbl_pinjaman_d`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kas_id` (`kas_id`),
  ADD KEY `user_name` (`user_name`),
  ADD KEY `pinjam_id` (`pinjam_id`),
  ADD KEY `jns_trans` (`jns_trans`);

--
-- Indexes for table `tbl_pinjaman_d_copy`
--
ALTER TABLE `tbl_pinjaman_d_copy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kas_id` (`kas_id`),
  ADD KEY `user_name` (`user_name`),
  ADD KEY `pinjam_id` (`pinjam_id`),
  ADD KEY `jns_trans` (`jns_trans`);

--
-- Indexes for table `tbl_pinjaman_d_tmp`
--
ALTER TABLE `tbl_pinjaman_d_tmp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kas_id` (`kas_id`),
  ADD KEY `user_name` (`user_name`),
  ADD KEY `pinjam_id` (`pinjam_id`),
  ADD KEY `jns_trans` (`jns_trans`);

--
-- Indexes for table `tbl_pinjaman_h`
--
ALTER TABLE `tbl_pinjaman_h`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anggota_id` (`anggota_id`),
  ADD KEY `kas_id` (`kas_id`),
  ADD KEY `user_name` (`user_name`),
  ADD KEY `jns_trans` (`jns_trans`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indexes for table `tbl_pinjaman_h_tmp`
--
ALTER TABLE `tbl_pinjaman_h_tmp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anggota_id` (`anggota_id`),
  ADD KEY `kas_id` (`kas_id`),
  ADD KEY `user_name` (`user_name`),
  ADD KEY `jns_trans` (`jns_trans`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indexes for table `tbl_saldoawal_kas`
--
ALTER TABLE `tbl_saldoawal_kas`
  ADD PRIMARY KEY (`noid`);

--
-- Indexes for table `tbl_saldoawal_nonkas`
--
ALTER TABLE `tbl_saldoawal_nonkas`
  ADD PRIMARY KEY (`noid`);

--
-- Indexes for table `tbl_setting`
--
ALTER TABLE `tbl_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_trans_kas`
--
ALTER TABLE `tbl_trans_kas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_name` (`user_name`),
  ADD KEY `dari_kas_id` (`dari_kas_id`,`untuk_kas_id`),
  ADD KEY `untuk_kas_id` (`untuk_kas_id`),
  ADD KEY `jns_trans` (`jns_trans`);

--
-- Indexes for table `tbl_trans_nonkas`
--
ALTER TABLE `tbl_trans_nonkas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_trans_sp`
--
ALTER TABLE `tbl_trans_sp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anggota_id` (`anggota_id`),
  ADD KEY `jenis_id` (`jenis_id`),
  ADD KEY `kas_id` (`kas_id`),
  ADD KEY `user_name` (`user_name`);

--
-- Indexes for table `tbl_trans_sp_tmp`
--
ALTER TABLE `tbl_trans_sp_tmp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anggota_id` (`anggota_id`),
  ADD KEY `jenis_id` (`jenis_id`),
  ADD KEY `kas_id` (`kas_id`),
  ADD KEY `user_name` (`user_name`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_name` (`u_name`);

--
-- Indexes for table `userlevelpermissions`
--
ALTER TABLE `userlevelpermissions`
  ADD PRIMARY KEY (`userlevelid`,`tablename`);

--
-- Indexes for table `userlevels`
--
ALTER TABLE `userlevels`
  ADD PRIMARY KEY (`userlevelid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data`
--
ALTER TABLE `data`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jns_akun`
--
ALTER TABLE `jns_akun`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jns_akun1`
--
ALTER TABLE `jns_akun1`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jns_angsuran`
--
ALTER TABLE `jns_angsuran`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jns_simpan`
--
ALTER TABLE `jns_simpan`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_agama`
--
ALTER TABLE `mu_agama`
  MODIFY `id_agama` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_agen_ekspedisi`
--
ALTER TABLE `mu_agen_ekspedisi`
  MODIFY `id_agen_ekspedisi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_bahasa`
--
ALTER TABLE `mu_bahasa`
  MODIFY `id_bahasa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_barang`
--
ALTER TABLE `mu_barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_barang_harga`
--
ALTER TABLE `mu_barang_harga`
  MODIFY `id_barang_harga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_barang_jenis_jual`
--
ALTER TABLE `mu_barang_jenis_jual`
  MODIFY `id_barang_jenis_jual` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_bebanbiaya_list`
--
ALTER TABLE `mu_bebanbiaya_list`
  MODIFY `id_bebanbiaya_list` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_bebanbiaya_main`
--
ALTER TABLE `mu_bebanbiaya_main`
  MODIFY `id_bebanbiaya_main` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_bebanbiaya_sub`
--
ALTER TABLE `mu_bebanbiaya_sub`
  MODIFY `id_bebanbiaya_sub` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_city`
--
ALTER TABLE `mu_city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_conf_barang`
--
ALTER TABLE `mu_conf_barang`
  MODIFY `id_conf_barang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_conf_penjualan`
--
ALTER TABLE `mu_conf_penjualan`
  MODIFY `id_conf_penjualan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_conf_perusahaan`
--
ALTER TABLE `mu_conf_perusahaan`
  MODIFY `id_perusahaan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_country`
--
ALTER TABLE `mu_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_departemen`
--
ALTER TABLE `mu_departemen`
  MODIFY `id_departemen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_jabatan`
--
ALTER TABLE `mu_jabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_jatuh_tempo`
--
ALTER TABLE `mu_jatuh_tempo`
  MODIFY `id_jatuh_tempo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_jenis_kelamin`
--
ALTER TABLE `mu_jenis_kelamin`
  MODIFY `id_jenis_kelamin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_karyawan`
--
ALTER TABLE `mu_karyawan`
  MODIFY `id_karyawan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_kategori`
--
ALTER TABLE `mu_kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_kategori_pelanggan`
--
ALTER TABLE `mu_kategori_pelanggan`
  MODIFY `id_kategori_pelanggan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_pelanggan`
--
ALTER TABLE `mu_pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_pelanggan_piutang`
--
ALTER TABLE `mu_pelanggan_piutang`
  MODIFY `id_pelanggan_piutang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_pembelian`
--
ALTER TABLE `mu_pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_pembelian_detail`
--
ALTER TABLE `mu_pembelian_detail`
  MODIFY `id_pembelian_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_pembelian_return`
--
ALTER TABLE `mu_pembelian_return`
  MODIFY `id_pembelian_return` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_pembelian_return_detail`
--
ALTER TABLE `mu_pembelian_return_detail`
  MODIFY `id_pembelian_return_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_pembelian_terima`
--
ALTER TABLE `mu_pembelian_terima`
  MODIFY `id_pembelian_terima` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_pembelian_terima_detail`
--
ALTER TABLE `mu_pembelian_terima_detail`
  MODIFY `id_pembelian_terima_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_pendapatan_list`
--
ALTER TABLE `mu_pendapatan_list`
  MODIFY `id_pendapatan_list` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_pendapatan_main`
--
ALTER TABLE `mu_pendapatan_main`
  MODIFY `id_pendapatan_main` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_pendapatan_sub`
--
ALTER TABLE `mu_pendapatan_sub`
  MODIFY `id_pendapatan_sub` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_pendidikan`
--
ALTER TABLE `mu_pendidikan`
  MODIFY `id_pendidikan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_penyesuaian`
--
ALTER TABLE `mu_penyesuaian`
  MODIFY `id_penyesuaian` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_penyesuaian_detail`
--
ALTER TABLE `mu_penyesuaian_detail`
  MODIFY `id_penyesuaian_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_promosi`
--
ALTER TABLE `mu_promosi`
  MODIFY `id_promosi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_promosi_detail`
--
ALTER TABLE `mu_promosi_detail`
  MODIFY `id_promosi_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_rak`
--
ALTER TABLE `mu_rak`
  MODIFY `id_rak` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_sebab_alasan`
--
ALTER TABLE `mu_sebab_alasan`
  MODIFY `id_sebab_alasan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_state`
--
ALTER TABLE `mu_state`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_status_karyawan`
--
ALTER TABLE `mu_status_karyawan`
  MODIFY `id_status_karyawan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_status_pernikahan`
--
ALTER TABLE `mu_status_pernikahan`
  MODIFY `id_status_pernikahan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_subkategori`
--
ALTER TABLE `mu_subkategori`
  MODIFY `id_subkategori` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_supplier`
--
ALTER TABLE `mu_supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_tagihan`
--
ALTER TABLE `mu_tagihan`
  MODIFY `id_tagihan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_tagihan_detail`
--
ALTER TABLE `mu_tagihan_detail`
  MODIFY `id_tagihan_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_tagihan_terima`
--
ALTER TABLE `mu_tagihan_terima`
  MODIFY `id_tagihan_terima` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_tagihan_terima_detail`
--
ALTER TABLE `mu_tagihan_terima_detail`
  MODIFY `id_tagihan_terima_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_transaksi`
--
ALTER TABLE `mu_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_transaksi_detail`
--
ALTER TABLE `mu_transaksi_detail`
  MODIFY `id_transaksi_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_transaksi_return`
--
ALTER TABLE `mu_transaksi_return`
  MODIFY `id_transaksi_return` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_transaksi_return_detail`
--
ALTER TABLE `mu_transaksi_return_detail`
  MODIFY `id_transaksi_return_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_type_bayar`
--
ALTER TABLE `mu_type_bayar`
  MODIFY `id_type_bayar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mu_type_pelanggan`
--
ALTER TABLE `mu_type_pelanggan`
  MODIFY `id_type_pelanggan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nama_kas_tbl`
--
ALTER TABLE `nama_kas_tbl`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nama_kas_tbl1`
--
ALTER TABLE `nama_kas_tbl1`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nama_kas_tbl2`
--
ALTER TABLE `nama_kas_tbl2`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suku_bunga`
--
ALTER TABLE `suku_bunga`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_anggota`
--
ALTER TABLE `tbl_anggota`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_pengajuan`
--
ALTER TABLE `tbl_pengajuan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_pengajuan1`
--
ALTER TABLE `tbl_pengajuan1`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_pinjaman_d`
--
ALTER TABLE `tbl_pinjaman_d`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_pinjaman_d_copy`
--
ALTER TABLE `tbl_pinjaman_d_copy`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_pinjaman_d_tmp`
--
ALTER TABLE `tbl_pinjaman_d_tmp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_pinjaman_h`
--
ALTER TABLE `tbl_pinjaman_h`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_pinjaman_h_tmp`
--
ALTER TABLE `tbl_pinjaman_h_tmp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_saldoawal_kas`
--
ALTER TABLE `tbl_saldoawal_kas`
  MODIFY `noid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_saldoawal_nonkas`
--
ALTER TABLE `tbl_saldoawal_nonkas`
  MODIFY `noid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_setting`
--
ALTER TABLE `tbl_setting`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_trans_kas`
--
ALTER TABLE `tbl_trans_kas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_trans_nonkas`
--
ALTER TABLE `tbl_trans_nonkas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_trans_sp`
--
ALTER TABLE `tbl_trans_sp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_trans_sp_tmp`
--
ALTER TABLE `tbl_trans_sp_tmp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------

--
-- Structure for view `angsuran_bulanan`
--
DROP TABLE IF EXISTS `angsuran_bulanan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`temprin2_user_tsm`@`%` SQL SECURITY DEFINER VIEW `angsuran_bulanan`  AS   (select '' AS `id`,'2020-01-30' AS `tgl_bayar`,`v`.`id` AS `pinjam_id`,`v`.`bln_sudah_angsur` + 1 AS `angsuran_ke`,`v`.`ags_per_bulan` AS `jumlah_bayar`,0 AS `denda_rp`,0 AS `terlambat`,'' AS `ket_bayar`,'D' AS `dk`,2 AS `kas_id`,48 AS `jns_trans`,curdate() AS `update_data`,'admin' AS `user_name`,'Input angsuran otomatis' AS `keterangan` from `v_hitung_pinjaman` `v` where `v`.`lunas` = 'BELUM')  ;

-- --------------------------------------------------------

--
-- Structure for view `shu`
--
DROP TABLE IF EXISTS `shu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`temprin2_user_tsm`@`%` SQL SECURITY DEFINER VIEW `shu`  AS SELECT `shu`.`id` AS `id`, `shu`.`nama` AS `nama`, sum(`shu`.`simpanan`) AS `SUM(shu.simpanan)`, sum(`shu`.`pendapatan`) AS `SUM(shu.pendapatan)` FROM (select `a`.`id` AS `id`,`a`.`nama` AS `nama`,sum(`p`.`pendapatan`) AS `pendapatan`,0 AS `simpanan` from (`tbl_anggota` `a` join `v_pinjaman_d` `p` on(`p`.`anggota_id` = `a`.`id`)) where `p`.`tgl_bayar` >= '2021-01-01' and `p`.`tgl_bayar` <= '2021-12-31' and `a`.`tgl_daftar` <= '2021-12-31' and (`a`.`tanggal_keluar` >= '2021-12-31' or `a`.`tanggal_keluar` is null or `a`.`tanggal_keluar` = '0000-00-00') and `a`.`jabatan_id` < 8 group by `a`.`id` union select `a`.`id` AS `id`,`a`.`nama` AS `nama`,0 AS `pendapatan`,sum(if(`s`.`dk` = 'D',`s`.`jumlah`,-`s`.`jumlah`)) AS `saldo_simpanan` from (`tbl_anggota` `a` join `tbl_trans_sp` `s` on(`s`.`anggota_id` = `a`.`id`)) where `a`.`tgl_daftar` <= '2021-12-31' and (`a`.`tanggal_keluar` >= '2021-12-31' or `a`.`tanggal_keluar` is null or `a`.`tanggal_keluar` = '0000-00-00') and `a`.`jabatan_id` < 8 and `s`.`jenis_id` in (40,41) and `s`.`tgl_transaksi` <= '2021-12-31' group by `a`.`id`) AS `shu` GROUP BY `shu`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `shu_anggota_jasamodal`
--
DROP TABLE IF EXISTS `shu_anggota_jasamodal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`temprin2_user_tsm`@`%` SQL SECURITY DEFINER VIEW `shu_anggota_jasamodal`  AS   (select NULL AS `id`,'2021-12-09' AS `tgl_transaksi`,`b`.`id` AS `anggota_id`,32 AS `jenis_id`,round(sum(if(`a`.`dk` = 'D',`a`.`jumlah`,-`a`.`jumlah`)) * 4365430 / 875153000,0) AS `jumlah`,'Simpanan dari SHU Anggota' AS `Keterangan`,'Setoran' AS `akun`,'D' AS `dk`,50 AS `kas_id`,'' AS `update_data`,'admin' AS `user_name`,'admin' AS `nama_penyetor`,'-' AS `alamat` from (`tbl_trans_sp` `a` join `tbl_anggota` `b` on(`a`.`anggota_id` = `b`.`id`)) where `a`.`jenis_id` in (40,41) and `a`.`tgl_transaksi` <= '2020-12-31' and `b`.`tgl_daftar` <= '2020-12-31' and (`b`.`tanggal_keluar` >= '2020-12-31' or `b`.`tanggal_keluar` is null or `b`.`tanggal_keluar` = '0000-00-00') and `b`.`jabatan_id` < 8 group by `b`.`id`)  ;

-- --------------------------------------------------------

--
-- Structure for view `shu_anggota_jasausaha`
--
DROP TABLE IF EXISTS `shu_anggota_jasausaha`;

CREATE ALGORITHM=UNDEFINED DEFINER=`temprin2_user_tsm`@`%` SQL SECURITY DEFINER VIEW `shu_anggota_jasausaha`  AS   (select NULL AS `id`,'2021-12-09' AS `tgl_transaksi`,`b`.`id` AS `anggota_id`,32 AS `jenis_id`,round(sum(`a`.`pendapatan`) * 10186003 / 135390729,0) AS `jumlah`,'Simpanan dari SHU Anggota' AS `Keterangan`,'Setoran' AS `akun`,'D' AS `dk`,50 AS `kas_id`,'' AS `update_data`,'admin' AS `user_name`,'admin' AS `nama_penyetor`,'-' AS `alamat` from ((`tbl_pinjaman_d` `a` join `tbl_pinjaman_h` `c` on(`a`.`pinjam_id` = `c`.`id`)) join `tbl_anggota` `b` on(`c`.`anggota_id` = `b`.`id`)) where `a`.`tgl_bayar` >= '2020-01-01' and `a`.`tgl_bayar` <= '2020-12-31' and `b`.`tgl_daftar` <= '2020-12-31' and (`b`.`tanggal_keluar` >= '2020-12-31' or `b`.`tanggal_keluar` is null or `b`.`tanggal_keluar` = '0000-00-00') and `b`.`jabatan_id` < 8 group by `b`.`id`)  ;

-- --------------------------------------------------------

--
-- Structure for view `shu_anggota_per_tahun`
--
DROP TABLE IF EXISTS `shu_anggota_per_tahun`;

CREATE ALGORITHM=UNDEFINED DEFINER=`temprin2_user_tsm`@`%` SQL SECURITY DEFINER VIEW `shu_anggota_per_tahun`  AS   (select `a`.`id` AS `id`,`a`.`nama` AS `nama`,`ss`.`total_simp` AS `total_simp`,`pp`.`total_pinj` AS `total_pinj` from ((`tbl_anggota` `a` left join (select `s`.`anggota_id` AS `anggota_id`,sum(`s`.`jumlah`) AS `total_simp` from `tbl_trans_sp` `s` where year(`s`.`tgl_transaksi`) < 2020 group by `s`.`anggota_id`) `ss` on(`a`.`id` = `ss`.`anggota_id`)) left join (select `p`.`anggota_id` AS `anggota_id`,sum(`p`.`jumlah`) AS `total_pinj` from `tbl_pinjaman_h` `p` where year(`p`.`tgl_pinjam`) = 2019 group by `p`.`anggota_id`) `pp` on(`a`.`id` = `pp`.`anggota_id`)) where `a`.`aktif` = 'Y' and `a`.`jabatan_id` <> 9 group by `a`.`id`)  ;

-- --------------------------------------------------------

--
-- Structure for view `shu_jasamodal_2022`
--
DROP TABLE IF EXISTS `shu_jasamodal_2022`;

CREATE ALGORITHM=UNDEFINED DEFINER=`temprin2_user_tsm`@`%` SQL SECURITY DEFINER VIEW `shu_jasamodal_2022`  AS   (select NULL AS `id`,'2023-09-06' AS `tgl_transaksi`,`b`.`id` AS `anggota_id`,32 AS `jenis_id`,round(sum(if(`a`.`dk` = 'D',`a`.`jumlah`,-`a`.`jumlah`)) * 1073338 / 691510000,0) AS `jumlah`,'Simpanan dari SHU Jasa modal Tahun 2022' AS `Keterangan`,'Setoran' AS `akun`,'D' AS `dk`,50 AS `kas_id`,current_timestamp() AS `update_data`,'admin' AS `user_name`,'admin' AS `nama_penyetor`,'-' AS `no_identitas`,'-' AS `alamat` from (`tbl_trans_sp` `a` join `tbl_anggota` `b` on(`a`.`anggota_id` = `b`.`id`)) where `a`.`jenis_id` in (40,41) and `a`.`tgl_transaksi` <= '2022-12-31' and `b`.`tgl_daftar` <= '2022-12-31' and (`b`.`tanggal_keluar` > '2022-12-31' or `b`.`tanggal_keluar` is null or `b`.`tanggal_keluar` = '0000-00-00') and `b`.`jabatan_id` < 8 group by `b`.`id`)  ;

-- --------------------------------------------------------

--
-- Structure for view `shu_jasamodal_2023`
--
DROP TABLE IF EXISTS `shu_jasamodal_2023`;

CREATE ALGORITHM=UNDEFINED DEFINER=`temprin2_user_tsm`@`%` SQL SECURITY DEFINER VIEW `shu_jasamodal_2023`  AS   (select NULL AS `id`,'2024-06-14' AS `tgl_transaksi`,`b`.`id` AS `anggota_id`,32 AS `jenis_id`,round(sum(if(`a`.`dk` = 'D',`a`.`jumlah`,-`a`.`jumlah`)) * 914723 / 788797260,0) AS `jumlah`,'Simpanan dari SHU Jasa modal Tahun 2023' AS `Keterangan`,'Setoran' AS `akun`,'D' AS `dk`,4 AS `kas_id`,current_timestamp() AS `update_data`,'admin' AS `user_name`,'admin' AS `nama_penyetor`,'-' AS `no_identitas`,'-' AS `alamat` from (`tbl_trans_sp` `a` join `tbl_anggota` `b` on(`a`.`anggota_id` = `b`.`id`)) where `a`.`jenis_id` in (40,41) and `a`.`tgl_transaksi` <= '2023-12-31' and `b`.`tgl_daftar` <= '2023-12-31' and (`b`.`tanggal_keluar` > '2023-12-31' or `b`.`tanggal_keluar` is null or `b`.`tanggal_keluar` = '0000-00-00') and `b`.`jabatan_id` < 8 group by `b`.`id`)  ;

-- --------------------------------------------------------

--
-- Structure for view `shu_jasausaha_2022`
--
DROP TABLE IF EXISTS `shu_jasausaha_2022`;

CREATE ALGORITHM=UNDEFINED DEFINER=`temprin2_user_tsm`@`%` SQL SECURITY DEFINER VIEW `shu_jasausaha_2022`  AS   (select NULL AS `id`,'2023-09-06' AS `tgl_transaksi`,`b`.`id` AS `anggota_id`,32 AS `jenis_id`,round(sum(`a`.`pendapatan`) * 2504455 / 112476055,0) AS `jumlah`,'Simpanan dari SHU jasa usaha tahun 2022' AS `Keterangan`,'Setoran' AS `akun`,'D' AS `dk`,50 AS `kas_id`,current_timestamp() AS `update_data`,'admin' AS `user_name`,'admin' AS `nama_penyetor`,'-' AS `no_identitas`,'-' AS `alamat` from ((`tbl_pinjaman_d` `a` join `tbl_pinjaman_h` `c` on(`a`.`pinjam_id` = `c`.`id`)) join `tbl_anggota` `b` on(`c`.`anggota_id` = `b`.`id`)) where `a`.`tgl_bayar` >= '2022-01-01' and `a`.`tgl_bayar` <= '2022-12-31' and `b`.`tgl_daftar` <= '2022-12-31' and (`b`.`tanggal_keluar` > '2022-12-31' or `b`.`tanggal_keluar` is null or `b`.`tanggal_keluar` = '0000-00-00') and `b`.`jabatan_id` < 8 group by `b`.`id`)  ;

-- --------------------------------------------------------

--
-- Structure for view `shu_jasausaha_2023`
--
DROP TABLE IF EXISTS `shu_jasausaha_2023`;

CREATE ALGORITHM=UNDEFINED DEFINER=`temprin2_user_tsm`@`%` SQL SECURITY DEFINER VIEW `shu_jasausaha_2023`  AS   (select NULL AS `id`,'2024-06-14' AS `tgl_transaksi`,`b`.`id` AS `anggota_id`,32 AS `jenis_id`,round(sum(`a`.`pendapatan`) * 2134354 / 92655303,0) AS `jumlah`,'Simpanan dari SHU jasa usaha tahun 2023' AS `Keterangan`,'Setoran' AS `akun`,'D' AS `dk`,50 AS `kas_id`,current_timestamp() AS `update_data`,'admin' AS `user_name`,'admin' AS `nama_penyetor`,'-' AS `no_identitas`,'-' AS `alamat` from ((`tbl_pinjaman_d` `a` join `tbl_pinjaman_h` `c` on(`a`.`pinjam_id` = `c`.`id`)) join `tbl_anggota` `b` on(`c`.`anggota_id` = `b`.`id`)) where `a`.`tgl_bayar` >= '2023-01-01' and `a`.`tgl_bayar` <= '2023-12-31' and `b`.`tgl_daftar` <= '2023-12-31' and (`b`.`tanggal_keluar` > '2023-12-31' or `b`.`tanggal_keluar` is null or `b`.`tanggal_keluar` = '0000-00-00') and `b`.`jabatan_id` < 8 group by `b`.`id`)  ;

-- --------------------------------------------------------

--
-- Structure for view `shu_jasa_modal_2024`
--
DROP TABLE IF EXISTS `shu_jasa_modal_2024`;

CREATE ALGORITHM=UNDEFINED DEFINER=`temprin2_user_tsm`@`%` SQL SECURITY DEFINER VIEW `shu_jasa_modal_2024`  AS   (select NULL AS `id`,'2025-03-27' AS `tgl_transaksi`,`b`.`id` AS `anggota_id`,32 AS `jenis_id`,round(sum(if(`a`.`dk` = 'D',`a`.`jumlah`,-`a`.`jumlah`)) * 944903 / 930084260,0) AS `jumlah`,'Simpanan dari SHU Jasa modal Tahun 2024' AS `Keterangan`,'Setoran' AS `akun`,'D' AS `dk`,50 AS `kas_id`,current_timestamp() AS `update_data`,'admin' AS `user_name`,'admin' AS `nama_penyetor`,'-' AS `no_identitas`,'-' AS `alamat` from (`tbl_trans_sp` `a` join `tbl_anggota` `b` on(`a`.`anggota_id` = `b`.`id`)) where `a`.`jenis_id` in (40,41) and `a`.`tgl_transaksi` <= '2024-12-31' and `b`.`tgl_daftar` <= '2024-12-31' and (`b`.`tanggal_keluar` > '2025-03-27' or `b`.`tanggal_keluar` is null or `b`.`tanggal_keluar` = '0000-00-00') and `b`.`jabatan_id` < 8 group by `b`.`id`)  ;

-- --------------------------------------------------------

--
-- Structure for view `shu_jasa_usaha_2024`
--
DROP TABLE IF EXISTS `shu_jasa_usaha_2024`;

CREATE ALGORITHM=UNDEFINED DEFINER=`temprin2_user_tsm`@`%` SQL SECURITY DEFINER VIEW `shu_jasa_usaha_2024`  AS   (select NULL AS `id`,'2025-03-27' AS `tgl_transaksi`,`b`.`id` AS `anggota_id`,32 AS `jenis_id`,round(sum(`a`.`pendapatan`) * 2204773 / 96033147,0) AS `jumlah`,'Simpanan dari SHU jasa usaha tahun 2024' AS `Keterangan`,'Setoran' AS `akun`,'D' AS `dk`,50 AS `kas_id`,current_timestamp() AS `update_data`,'admin' AS `user_name`,'admin' AS `nama_penyetor`,'-' AS `no_identitas`,'-' AS `alamat` from ((`tbl_pinjaman_d` `a` join `tbl_pinjaman_h` `c` on(`a`.`pinjam_id` = `c`.`id`)) join `tbl_anggota` `b` on(`c`.`anggota_id` = `b`.`id`)) where `a`.`tgl_bayar` >= '2024-01-01' and `a`.`tgl_bayar` <= '2024-12-31' and `b`.`tgl_daftar` <= '2024-12-31' and (`b`.`tanggal_keluar` > '2025-03-27' or `b`.`tanggal_keluar` is null or `b`.`tanggal_keluar` = '0000-00-00') and `b`.`jabatan_id` < 8 group by `b`.`id`)  ;

-- --------------------------------------------------------

--
-- Structure for view `v_akun`
--
DROP TABLE IF EXISTS `v_akun`;

CREATE ALGORITHM=UNDEFINED DEFINER=`temprin2_user_tsm`@`%` SQL SECURITY DEFINER VIEW `v_akun`  AS SELECT `nama_kas_tbl`.`id` AS `id`, `nama_kas_tbl`.`id` AS `kd_aktiva`, 'Y' AS `kasbank`, `nama_kas_tbl`.`nama` AS `nama`, `nama_kas_tbl`.`nama` AS `jns_trans`, 'aktiva' AS `akun`, `nama_kas_tbl`.`tmpl_simpan` AS `tmpl_simpan`, `nama_kas_tbl`.`tmpl_penarikan` AS `tmpl_penarikan`, `nama_kas_tbl`.`tmpl_pinjaman` AS `tmpl_pinjaman`, `nama_kas_tbl`.`tmpl_bayar` AS `tmpl_bayar`, `nama_kas_tbl`.`tmpl_pemasukan` AS `tmpl_pemasukan`, `nama_kas_tbl`.`tmpl_pengeluaran` AS `tmpl_pengeluaran`, `nama_kas_tbl`.`tmpl_transfer` AS `tmpl_transfer`, NULL AS `laba_rugi`, `nama_kas_tbl`.`tmpl_pemasukan` AS `pemasukan`, `nama_kas_tbl`.`tmpl_pengeluaran` AS `pengeluaran`, NULL AS `non_kas`, `nama_kas_tbl`.`tmpl_simpan` AS `simpanan`, `nama_kas_tbl`.`tmpl_pinjaman` AS `pinjaman`, 'Y' AS `pinjam_dari`, `nama_kas_tbl`.`aktif` AS `aktif` FROM `nama_kas_tbl`union select `jns_akun`.`id` AS `id`,`jns_akun`.`kd_aktiva` AS `kd_aktiva`,'N' AS `kasbank`,`jns_akun`.`jns_trans` AS `nama`,`jns_akun`.`jns_trans` AS `jns_trans`,`jns_akun`.`akun` AS `akun`,`jns_akun`.`simpanan` AS `tmpl_simpan`,NULL AS `tmpl_penarikan`,`jns_akun`.`pinjaman` AS `tmpl_pinjaman`,NULL AS `tmpl_bayar`,`jns_akun`.`pemasukan` AS `tmpl_pemasukan`,`jns_akun`.`pengeluaran` AS `tmpl_pengeluaran`,NULL AS `tmpl_transfer`,NULL AS `laba_rugi`,`jns_akun`.`pemasukan` AS `pemasukan`,`jns_akun`.`pengeluaran` AS `pengeluaran`,`jns_akun`.`non_kas` AS `non_kas`,`jns_akun`.`simpanan` AS `simpanan`,`jns_akun`.`pinjaman` AS `pinjaman`,`jns_akun`.`pinjam_dari` AS `pinjam_dari`,`jns_akun`.`aktif` AS `aktif` from `jns_akun`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_hitung_pinjaman`
--
DROP TABLE IF EXISTS `v_hitung_pinjaman`;

CREATE ALGORITHM=UNDEFINED DEFINER=`temprin2_user_tsm`@`%` SQL SECURITY DEFINER VIEW `v_hitung_pinjaman`  AS SELECT `tbl_pinjaman_h`.`id` AS `id`, `tbl_pinjaman_h`.`tgl_pinjam` AS `tgl_pinjam`, `tbl_pinjaman_h`.`anggota_id` AS `anggota_id`, `tbl_anggota`.`nama` AS `nama`, `tbl_pinjaman_h`.`lama_angsuran` AS `lama_angsuran`, `tbl_pinjaman_h`.`jml_barang` AS `jml_barang`, `tbl_pinjaman_h`.`harga_satuan` AS `harga_satuan`, `tbl_pinjaman_h`.`jumlah` AS `jumlah`, `tbl_pinjaman_h`.`bunga` AS `bunga`, `tbl_pinjaman_h`.`biaya_adm` AS `biaya_adm`, `tbl_pinjaman_h`.`lunas` AS `lunas`, `tbl_pinjaman_h`.`dk` AS `dk`, `tbl_pinjaman_h`.`kas_id` AS `kas_id`, `tbl_pinjaman_h`.`user_name` AS `user_name`, `tbl_pinjaman_h`.`jumlah`/ `tbl_pinjaman_h`.`lama_angsuran` AS `pokok_angsuran`, `tbl_pinjaman_h`.`jns_trans` AS `jns_trans`, round(ceiling(`tbl_pinjaman_h`.`jumlah` / `tbl_pinjaman_h`.`lama_angsuran` * `tbl_pinjaman_h`.`bunga` / 100),-2) AS `bunga_pinjaman`, round(ceiling((`tbl_pinjaman_h`.`jumlah` / `tbl_pinjaman_h`.`lama_angsuran` * `tbl_pinjaman_h`.`bunga` / 100 + `tbl_pinjaman_h`.`jumlah` / `tbl_pinjaman_h`.`lama_angsuran` + `tbl_pinjaman_h`.`biaya_adm`) * 100 / 100),-2) AS `ags_per_bulan`, `tbl_pinjaman_h`.`tgl_pinjam`+ interval `tbl_pinjaman_h`.`lama_angsuran` month AS `tempo`, round(ceiling((`tbl_pinjaman_h`.`jumlah` / `tbl_pinjaman_h`.`lama_angsuran` * `tbl_pinjaman_h`.`bunga` / 100 + `tbl_pinjaman_h`.`jumlah` / `tbl_pinjaman_h`.`lama_angsuran` + `tbl_pinjaman_h`.`biaya_adm`) * 100 / 100),-2) * `tbl_pinjaman_h`.`lama_angsuran` AS `tagihan`, `tbl_pinjaman_h`.`keterangan` AS `keterangan`, `tbl_pinjaman_h`.`barang_id` AS `barang_id`, ifnull(max(`tbl_pinjaman_d`.`angsuran_ke`),0) AS `bln_sudah_angsur`, sum(`tbl_pinjaman_d`.`jumlah_bayar`) AS `total_angsuran` FROM ((`tbl_pinjaman_h` left join `tbl_pinjaman_d` on(`tbl_pinjaman_h`.`id` = `tbl_pinjaman_d`.`pinjam_id`)) join `tbl_anggota` on(`tbl_pinjaman_h`.`anggota_id` = `tbl_anggota`.`id`)) GROUP BY `tbl_pinjaman_h`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `v_iuran_wajib`
--
DROP TABLE IF EXISTS `v_iuran_wajib`;

CREATE ALGORITHM=UNDEFINED DEFINER=`temprin2_user_tsm`@`%` SQL SECURITY DEFINER VIEW `v_iuran_wajib`  AS   (select NULL AS `id`,'2025-08-30' AS `tgl_transaksi`,`t`.`id` AS `anggota_id`,41 AS `jenis_id`,`s`.`opsi_val` AS `jumlah`,concat('Potongan gaji untuk iuran Wajib ',`t`.`nama`) AS `keterangan`,'Setoran' AS `akun`,'D' AS `dk`,2 AS `kas_id`,current_timestamp() AS `update_data`,'admin' AS `username`,'admin' AS `nama_penyetor`,'admin' AS `no_identitas`,'admin' AS `alamat` from (`tbl_anggota` `t` join `suku_bunga` `s`) where `t`.`aktif` = 'Y' and `s`.`opsi_key` = 'iuran_wajib' and `t`.`jabatan_id` < 8 order by `t`.`id`)  ;

-- --------------------------------------------------------

--
-- Structure for view `v_pinjaman_d`
--
DROP TABLE IF EXISTS `v_pinjaman_d`;

CREATE ALGORITHM=UNDEFINED DEFINER=`temprin2_user_tsm`@`%` SQL SECURITY DEFINER VIEW `v_pinjaman_d`  AS   (select `tbl_pinjaman_d`.`pinjam_id` AS `pinjam_id`,`tbl_pinjaman_d`.`tgl_bayar` AS `tgl_bayar`,`tbl_pinjaman_d`.`angsuran_ke` AS `angsuran_ke`,`tbl_pinjaman_d`.`jumlah_bayar` AS `jumlah_bayar`,`tbl_pinjaman_h`.`anggota_id` AS `anggota_id`,`tbl_pinjaman_d`.`denda_rp` AS `denda_rp`,`tbl_pinjaman_h`.`lunas` AS `lunas`,`tbl_pinjaman_d`.`pendapatan` AS `pendapatan`,`tbl_pinjaman_d`.`akun_pendapatan` AS `akun_pendapatan` from (`tbl_pinjaman_h` join `tbl_pinjaman_d` on(`tbl_pinjaman_h`.`id` = `tbl_pinjaman_d`.`pinjam_id`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_pinjaman_h`
--
DROP TABLE IF EXISTS `v_pinjaman_h`;

CREATE ALGORITHM=UNDEFINED DEFINER=`temprin2_user_tsm`@`%` SQL SECURITY DEFINER VIEW `v_pinjaman_h`  AS SELECT `tbl_pinjaman_h`.`id` AS `id`, `tbl_pinjaman_h`.`tgl_pinjam` AS `tgl_pinjam`, `tbl_pinjaman_h`.`anggota_id` AS `anggota_id`, `tbl_anggota`.`nama` AS `nama`, `tbl_pinjaman_h`.`lama_angsuran` AS `lama_angsuran`, `tbl_pinjaman_h`.`jumlah` AS `jumlah`, `tbl_pinjaman_h`.`bunga` AS `bunga`, `tbl_pinjaman_h`.`biaya_adm` AS `biaya_adm`, `tbl_pinjaman_h`.`lunas` AS `lunas`, `tbl_pinjaman_h`.`dk` AS `dk`, `tbl_pinjaman_h`.`kas_id` AS `kas_id`, `tbl_pinjaman_h`.`user_name` AS `user_name`, `tbl_pinjaman_h`.`jumlah`/ `tbl_pinjaman_h`.`lama_angsuran` AS `pokok_angsuran`, round(ceiling(`tbl_pinjaman_h`.`jumlah` / `tbl_pinjaman_h`.`lama_angsuran` * `tbl_pinjaman_h`.`bunga` / 100),-2) AS `bunga_pinjaman`, round(ceiling((`tbl_pinjaman_h`.`jumlah` / `tbl_pinjaman_h`.`lama_angsuran` * `tbl_pinjaman_h`.`bunga` / 100 + `tbl_pinjaman_h`.`jumlah` / `tbl_pinjaman_h`.`lama_angsuran` + `tbl_pinjaman_h`.`biaya_adm`) * 100 / 100),-2) AS `ags_per_bulan`, `tbl_pinjaman_h`.`tgl_pinjam`+ interval `tbl_pinjaman_h`.`lama_angsuran` month AS `tempo`, round(ceiling((`tbl_pinjaman_h`.`jumlah` / `tbl_pinjaman_h`.`lama_angsuran` * `tbl_pinjaman_h`.`bunga` / 100 + `tbl_pinjaman_h`.`jumlah` / `tbl_pinjaman_h`.`lama_angsuran` + `tbl_pinjaman_h`.`biaya_adm`) * 100 / 100),-2) * `tbl_pinjaman_h`.`lama_angsuran` AS `tagihan`, `tbl_pinjaman_h`.`keterangan` AS `keterangan`, `tbl_pinjaman_h`.`barang_id` AS `barang_id`, ifnull(max(`tbl_pinjaman_d`.`angsuran_ke`),0) AS `bln_sudah_angsur` FROM ((`tbl_pinjaman_h` left join `tbl_pinjaman_d` on(`tbl_pinjaman_h`.`id` = `tbl_pinjaman_d`.`pinjam_id`)) left join `tbl_anggota` on(`tbl_pinjaman_h`.`anggota_id` = `tbl_anggota`.`id`)) GROUP BY `tbl_pinjaman_h`.`id` ORDER BY `tbl_anggota`.`id` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `v_simpanan`
--
DROP TABLE IF EXISTS `v_simpanan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`temprin2_user_tsm`@`%` SQL SECURITY DEFINER VIEW `v_simpanan`  AS SELECT year(`tbl_trans_sp`.`tgl_transaksi`) AS `Tahun`, month(`tbl_trans_sp`.`tgl_transaksi`) AS `Bulan`, sum(`tbl_trans_sp`.`jumlah`) AS `Jumlah`, `tbl_trans_sp`.`akun` AS `akun`, `tbl_trans_sp`.`kas_id` AS `kas_id`, `nama_kas_tbl`.`nama` AS `Akun_Kas`, `jns_akun`.`jns_trans` AS `jns_trans` FROM ((`tbl_trans_sp` join `jns_akun` on(`tbl_trans_sp`.`jenis_id` = `jns_akun`.`id`)) join `nama_kas_tbl` on(`tbl_trans_sp`.`kas_id` = `nama_kas_tbl`.`id`)) GROUP BY month(`tbl_trans_sp`.`tgl_transaksi`), `tbl_trans_sp`.`jenis_id`, `tbl_trans_sp`.`akun`, `tbl_trans_sp`.`kas_id`, `nama_kas_tbl`.`nama`, `jns_akun`.`jns_trans`, year(`tbl_trans_sp`.`tgl_transaksi`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_transaksi`
--
DROP TABLE IF EXISTS `v_transaksi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`temprin2_user_tsm`@`%` SQL SECURITY DEFINER VIEW `v_transaksi`  AS SELECT 'A1' AS `tbl`, 'tbl_saldoawal_kas' AS `nama_tabel`, `tbl_saldoawal_kas`.`noid` AS `id`, `tbl_saldoawal_kas`.`tanggal` AS `tgl`, 0 AS `kredit`, `tbl_saldoawal_kas`.`saldo_awal` AS `debet`, NULL AS `dari_kas`, `tbl_saldoawal_kas`.`akun` AS `untuk_kas`, NULL AS `transaksi`, 'Saldo awal' AS `ket`, `tbl_saldoawal_kas`.`user_name` AS `USER`, NULL AS `transaksi2` FROM `tbl_saldoawal_kas`union select 'A2' AS `tbl`,'tbl_saldoawal_nonkas' AS `nama_tabel`,`tbl_saldoawal_nonkas`.`noid` AS `id`,`tbl_saldoawal_nonkas`.`tanggal` AS `tgl`,if(`jns_akun`.`akun` = 'Aktiva',`tbl_saldoawal_nonkas`.`saldo_awal`,0) AS `kredit`,if(`jns_akun`.`akun` = 'Pasiva',`tbl_saldoawal_nonkas`.`saldo_awal`,0) AS `debet`,NULL AS `dari_kas`,NULL AS `untuk_kas`,`tbl_saldoawal_nonkas`.`akun` AS `transaksi`,'Saldo awal' AS `ket`,`tbl_saldoawal_nonkas`.`user_name` AS `USER`,`tbl_saldoawal_nonkas`.`akun` AS `transaksi2` from (`tbl_saldoawal_nonkas` join `jns_akun` on(`tbl_saldoawal_nonkas`.`akun` = `jns_akun`.`id`)) union select 'A' AS `tbl`,'pinjaman_h' AS `nama_tabel`,`tbl_pinjaman_h`.`id` AS `id`,`tbl_pinjaman_h`.`tgl_pinjam` AS `tgl`,`tbl_pinjaman_h`.`jumlah` AS `kredit`,0 AS `debet`,`nama_kas_tbl`.`id` AS `dari_kas`,NULL AS `untuk_kas`,`tbl_pinjaman_h`.`jns_trans` AS `transaksi`,`tbl_pinjaman_h`.`keterangan` AS `ket`,`tbl_pinjaman_h`.`user_name` AS `user`,`tbl_pinjaman_h`.`kas_id` AS `transaksi2` from (`tbl_pinjaman_h` left join `nama_kas_tbl` on(`tbl_pinjaman_h`.`kas_id` = `nama_kas_tbl`.`id`)) union select 'AA' AS `tbl`,'pinjaman_h' AS `nama_tabel`,`tbl_pinjaman_h`.`id` AS `id`,`tbl_pinjaman_h`.`tgl_pinjam` AS `tgl`,0 AS `kredit`,`tbl_pinjaman_h`.`jumlah` AS `debet`,NULL AS `dari_kas`,NULL AS `untuk_kas`,`tbl_pinjaman_h`.`kas_id` AS `transaksi`,`tbl_pinjaman_h`.`keterangan` AS `ket`,`tbl_pinjaman_h`.`user_name` AS `user`,`tbl_pinjaman_h`.`jns_trans` AS `transaksi2` from (`tbl_pinjaman_h` left join `nama_kas_tbl` on(`tbl_pinjaman_h`.`kas_id` = `nama_kas_tbl`.`id`)) where `nama_kas_tbl`.`id` is null union select 'B' AS `tbl`,'pinjaman_d' AS `nama_tabel`,`tbl_pinjaman_d`.`id` AS `id`,`tbl_pinjaman_d`.`tgl_bayar` AS `tgl`,0 AS `kredit`,`tbl_pinjaman_d`.`angsuran_pokok` AS `debet`,NULL AS `dari_kas`,`tbl_pinjaman_d`.`kas_id` AS `untuk_kas`,`tbl_pinjaman_d`.`jns_trans` AS `transaksi`,`tbl_pinjaman_d`.`keterangan` AS `ket`,`tbl_pinjaman_d`.`user_name` AS `user`,`tbl_pinjaman_d`.`kas_id` AS `transaksi2` from `tbl_pinjaman_d` union select 'B1' AS `tbl`,'pinjaman_d' AS `nama_tabel`,`tbl_pinjaman_d`.`id` AS `id`,`tbl_pinjaman_d`.`tgl_bayar` AS `tgl`,0 AS `kredit`,`tbl_pinjaman_d`.`pendapatan` AS `debet`,NULL AS `dari_kas`,`tbl_pinjaman_d`.`kas_id` AS `untuk_kas`,`tbl_pinjaman_d`.`akun_pendapatan` AS `transaksi`,`tbl_pinjaman_d`.`keterangan` AS `ket`,`tbl_pinjaman_d`.`user_name` AS `user`,`tbl_pinjaman_d`.`kas_id` AS `transaksi2` from `tbl_pinjaman_d` union select 'C' AS `tbl`,'tbl_trans_sp' AS `nama_tabel`,`tbl_trans_sp`.`id` AS `id`,`tbl_trans_sp`.`tgl_transaksi` AS `tgl`,if(`tbl_trans_sp`.`dk` = 'K',`tbl_trans_sp`.`jumlah`,0) AS `kredit`,if(`tbl_trans_sp`.`dk` = 'D',`tbl_trans_sp`.`jumlah`,0) AS `debet`,if(`tbl_trans_sp`.`dk` = 'K',`tbl_trans_sp`.`kas_id`,NULL) AS `dari_kas`,if(`tbl_trans_sp`.`dk` = 'D',`tbl_trans_sp`.`kas_id`,NULL) AS `untuk_kas`,`tbl_trans_sp`.`jenis_id` AS `transaksi`,`tbl_trans_sp`.`keterangan` AS `ket`,`tbl_trans_sp`.`user_name` AS `user`,`tbl_trans_sp`.`kas_id` AS `transaksi2` from `tbl_trans_sp` union select 'D' AS `tbl`,'tbl_trans_kas' AS `nama_tabel`,`tbl_trans_kas`.`id` AS `id`,`tbl_trans_kas`.`tgl_catat` AS `tgl`,if(`tbl_trans_kas`.`dk` = 'K',`tbl_trans_kas`.`jumlah`,if(`tbl_trans_kas`.`dk` is null,`tbl_trans_kas`.`jumlah`,0)) AS `kredit`,if(`tbl_trans_kas`.`dk` = 'D',`tbl_trans_kas`.`jumlah`,if(`tbl_trans_kas`.`dk` is null,`tbl_trans_kas`.`jumlah`,0)) AS `debet`,`tbl_trans_kas`.`dari_kas_id` AS `dari_kas`,`tbl_trans_kas`.`untuk_kas_id` AS `untuk_kas`,`tbl_trans_kas`.`jns_trans` AS `transaksi`,`tbl_trans_kas`.`keterangan` AS `ket`,`tbl_trans_kas`.`user_name` AS `user`,if(`tbl_trans_kas`.`dari_kas_id` is null,`tbl_trans_kas`.`untuk_kas_id`,`tbl_trans_kas`.`dari_kas_id`) AS `transaksi2` from `tbl_trans_kas` union select 'E' AS `tbl`,'non_kas' AS `nama_tabel`,`tbl_trans_nonkas`.`id` AS `id`,`tbl_trans_nonkas`.`tgl_catat` AS `tgl`,`tbl_trans_nonkas`.`jumlah` AS `kredit`,0 AS `debet`,NULL AS `dari_kas`,NULL AS `untuk_kas`,`tbl_trans_nonkas`.`akun_debit` AS `transaksi`,`tbl_trans_nonkas`.`keterangan` AS `ket`,`tbl_trans_nonkas`.`user_name` AS `user`,`tbl_trans_nonkas`.`akun_kredit` AS `transaksi2` from `tbl_trans_nonkas` union select 'F' AS `tbl`,'non_kas' AS `nama_tabel`,`tbl_trans_nonkas`.`id` AS `id`,`tbl_trans_nonkas`.`tgl_catat` AS `tgl`,0 AS `kredit`,`tbl_trans_nonkas`.`jumlah` AS `debet`,NULL AS `dari_kas`,NULL AS `untuk_kas`,`tbl_trans_nonkas`.`akun_kredit` AS `transaksi`,`tbl_trans_nonkas`.`keterangan` AS `ket`,`tbl_trans_nonkas`.`user_name` AS `user`,`tbl_trans_nonkas`.`akun_debit` AS `transaksi2` from `tbl_trans_nonkas` union select 'G' AS `tbl`,'mu_transaksi' AS `nama_tabel`,`mu_transaksi`.`id_transaksi` AS `id`,`mu_transaksi`.`tgl_transaksi` AS `tgl`,0 AS `kredit`,`mu_transaksi_detail`.`jumlah_jual` * `mu_transaksi_detail`.`harga_jual` AS `debet`,NULL AS `dari_kas`,1 AS `untuk_kas`,'159' AS `transaksi`,concat('Penjualan no po ',`mu_transaksi`.`kode_transaksi`,', ',`mu_transaksi`.`keterangan`) AS `ket`,`mu_transaksi`.`id_karyawan` AS `user`,1 AS `transaksi2` from (`mu_transaksi` join `mu_transaksi_detail` on(`mu_transaksi`.`id_transaksi` = `mu_transaksi_detail`.`id_transaksi`)) where `mu_transaksi`.`id_type_bayar` = 1 and `mu_transaksi`.`status` = 'selesai' union select 'H' AS `tbl`,'mu_transaksi' AS `nama_tabel`,`mu_transaksi`.`id_transaksi` AS `id`,`mu_transaksi`.`tgl_transaksi` AS `tgl`,`mu_transaksi_detail`.`jumlah_jual` * `mu_barang`.`harga_beli` AS `kredit`,0 AS `debet`,NULL AS `dari_kas`,NULL AS `untuk_kas`,'179' AS `transaksi`,concat('Penjualan no po ',`mu_transaksi`.`kode_transaksi`,', ',`mu_transaksi`.`keterangan`) AS `ket`,`mu_transaksi`.`id_karyawan` AS `user`,5 AS `transaksi2` from ((`mu_transaksi` join `mu_transaksi_detail` on(`mu_transaksi`.`id_transaksi` = `mu_transaksi_detail`.`id_transaksi`)) join `mu_barang` on(`mu_barang`.`id_barang` = `mu_transaksi_detail`.`id_barang`)) where `mu_transaksi`.`id_type_bayar` = 1 and `mu_transaksi`.`status` = 'selesai' union select 'I' AS `tbl`,'mu_transaksi' AS `nama_tabel`,`mu_transaksi`.`id_transaksi` AS `id`,`mu_transaksi`.`tgl_transaksi` AS `tgl`,0 AS `kredit`,`mu_transaksi_detail`.`jumlah_jual` * `mu_barang`.`harga_beli` AS `debet`,NULL AS `dari_kas`,NULL AS `untuk_kas`,'5' AS `transaksi`,concat('Penjualan no po ',`mu_transaksi`.`kode_transaksi`,', ',`mu_transaksi`.`keterangan`) AS `ket`,`mu_transaksi`.`id_karyawan` AS `user`,179 AS `transaksi2` from ((`mu_transaksi` join `mu_transaksi_detail` on(`mu_transaksi`.`id_transaksi` = `mu_transaksi_detail`.`id_transaksi`)) join `mu_barang` on(`mu_barang`.`id_barang` = `mu_transaksi_detail`.`id_barang`)) where `mu_transaksi`.`id_type_bayar` = 1 and `mu_transaksi`.`status` = 'selesai' union select 'J' AS `tbl`,'mu_transaksi' AS `nama_tabel`,`mu_transaksi`.`id_transaksi` AS `id`,`mu_transaksi`.`tgl_transaksi` AS `tgl`,0 AS `kredit`,`mu_transaksi_detail`.`jumlah_jual` * `mu_barang`.`harga_beli` AS `debet`,NULL AS `dari_kas`,NULL AS `untuk_kas`,`mu_barang`.`akun` AS `transaksi`,concat('Penjualan no po ',`mu_transaksi`.`kode_transaksi`,', ',`mu_transaksi`.`keterangan`) AS `ket`,`mu_transaksi`.`id_karyawan` AS `user`,179 AS `transaksi2` from ((`mu_transaksi` join `mu_transaksi_detail` on(`mu_transaksi`.`id_transaksi` = `mu_transaksi_detail`.`id_transaksi`)) join `mu_barang` on(`mu_barang`.`id_barang` = `mu_transaksi_detail`.`id_barang`)) where `mu_transaksi`.`id_type_bayar` > 1 and `mu_transaksi`.`status` = 'selesai' union select 'K' AS `tbl`,'mu_transaksi' AS `nama_tabel`,`mu_transaksi`.`id_transaksi` AS `id`,`mu_transaksi`.`tgl_transaksi` AS `tgl`,`mu_transaksi_detail`.`jumlah_jual` * `mu_barang`.`harga_beli` AS `kredit`,0 AS `debet`,NULL AS `dari_kas`,NULL AS `untuk_kas`,'179' AS `transaksi`,concat('Penjualan no po ',`mu_transaksi`.`kode_transaksi`,', ',`mu_transaksi`.`keterangan`) AS `ket`,`mu_transaksi`.`id_karyawan` AS `user`,`mu_barang`.`akun` AS `transaksi2` from ((`mu_transaksi` join `mu_transaksi_detail` on(`mu_transaksi`.`id_transaksi` = `mu_transaksi_detail`.`id_transaksi`)) join `mu_barang` on(`mu_barang`.`id_barang` = `mu_transaksi_detail`.`id_barang`)) where `mu_transaksi`.`id_type_bayar` > 1 and `mu_transaksi`.`status` = 'selesai' union select 'L' AS `tbl`,'mu_tagihan' AS `nama_tabel`,`mu_tagihan`.`id_tagihan` AS `id`,`mu_tagihan`.`tgl_tagihan` AS `tgl`,`mu_tagihan_detail`.`jml_pesan` * `mu_tagihan_detail`.`harga_pesan` AS `kredit`,0 AS `debet`,NULL AS `dari_kas`,NULL AS `untuk_kas`,118 AS `transaksi`,concat('Tagihan no ',`mu_tagihan`.`kode_tagihan`,', ',`mu_tagihan`.`keterangan`) AS `ket`,`mu_tagihan`.`id_karyawan` AS `user`,'159' AS `transaksi2` from (`mu_tagihan` join `mu_tagihan_detail` on(`mu_tagihan`.`id_tagihan` = `mu_tagihan_detail`.`id_tagihan`)) where `mu_tagihan`.`id_type_bayar` > 1 union select 'M' AS `tbl`,'mu_tagihan' AS `nama_tabel`,`mu_tagihan`.`id_tagihan` AS `id`,`mu_tagihan`.`tgl_tagihan` AS `tgl`,0 AS `kredit`,`mu_tagihan_detail`.`jml_pesan` * `mu_tagihan_detail`.`harga_pesan` AS `debet`,NULL AS `dari_kas`,NULL AS `untuk_kas`,'159' AS `transaksi`,concat('Tagihan no ',`mu_tagihan`.`kode_tagihan`,', ',`mu_tagihan`.`keterangan`) AS `ket`,`mu_tagihan`.`id_karyawan` AS `user`,'118' AS `transaksi2` from (`mu_tagihan` join `mu_tagihan_detail` on(`mu_tagihan`.`id_tagihan` = `mu_tagihan_detail`.`id_tagihan`)) where `mu_tagihan`.`id_type_bayar` > 1 union select 'N' AS `tbl`,'mu_tagihan_terima' AS `nama_tabel`,`mu_tagihan_terima`.`id_tagihan_terima` AS `id`,`mu_tagihan_terima`.`tanggal_terima` AS `tgl`,NULL AS `kredit`,`mu_tagihan_terima`.`amount` AS `debet`,NULL AS `dari_kas`,1 AS `untuk_kas`,'118' AS `transaksi`,concat('tagihan_terima no ',`mu_tagihan_terima`.`id_tagihan`,', ',`mu_tagihan_terima`.`keterangan`) AS `ket`,`mu_tagihan_terima`.`id_karyawan` AS `user`,'1' AS `transaksi2` from `mu_tagihan_terima` union select '0' AS `tbl`,'mu_pembelian' AS `nama_tabel`,`mu_pembelian`.`id_pembelian` AS `id`,`mu_pembelian`.`tgl_pembelian` AS `tgl`,`mu_pembelian_detail`.`jml_pesan` * `mu_pembelian_detail`.`harga_pesan` AS `kredit`,0 AS `debet`,`mu_pembelian`.`akun` AS `dari_kas`,NULL AS `untuk_kas`,`mu_barang`.`akun` AS `transaksi`,concat('pembelian no ',`mu_pembelian`.`kode_pembelian`,', ',`mu_pembelian`.`keterangan`) AS `ket`,`mu_pembelian`.`id_karyawan` AS `user`,`mu_pembelian`.`akun` AS `transaksi2` from ((`mu_pembelian` join `mu_pembelian_detail` on(`mu_pembelian`.`id_pembelian` = `mu_pembelian_detail`.`id_pembelian`)) join `mu_barang` on(`mu_barang`.`id_barang` = `mu_pembelian_detail`.`id_barang`)) order by `tgl`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_transaksi_all`
--
DROP TABLE IF EXISTS `v_transaksi_all`;

CREATE ALGORITHM=UNDEFINED DEFINER=`temprin2_user_tsm`@`%` SQL SECURITY DEFINER VIEW `v_transaksi_all`  AS SELECT 'A' AS `tbl`, `tbl_pinjaman_h`.`id` AS `id`, `tbl_pinjaman_h`.`tgl_pinjam` AS `tgl`, `tbl_pinjaman_h`.`jumlah` AS `kredit`, 0 AS `debet`, `tbl_pinjaman_h`.`kas_id` AS `dari_kas`, NULL AS `untuk_kas`, `tbl_pinjaman_h`.`jns_trans` AS `transaksi`, `tbl_pinjaman_h`.`keterangan` AS `ket`, `tbl_pinjaman_h`.`user_name` AS `user` FROM `tbl_pinjaman_h`union select 'B' AS `tbl`,`tbl_pinjaman_d`.`id` AS `id`,`tbl_pinjaman_d`.`tgl_bayar` AS `tgl`,0 AS `kredit`,`tbl_pinjaman_d`.`jumlah_bayar` AS `debet`,NULL AS `dari_kas`,`tbl_pinjaman_d`.`kas_id` AS `untuk_kas`,`tbl_pinjaman_d`.`jns_trans` AS `transaksi`,`tbl_pinjaman_d`.`keterangan` AS `ket`,`tbl_pinjaman_d`.`user_name` AS `user` from `tbl_pinjaman_d` union select 'C' AS `tbl`,`tbl_trans_sp`.`id` AS `id`,`tbl_trans_sp`.`tgl_transaksi` AS `tgl`,if(`tbl_trans_sp`.`dk` = 'K',`tbl_trans_sp`.`jumlah`,0) AS `kredit`,if(`tbl_trans_sp`.`dk` = 'D',`tbl_trans_sp`.`jumlah`,0) AS `debet`,if(`tbl_trans_sp`.`dk` = 'K',`tbl_trans_sp`.`kas_id`,NULL) AS `dari_kas`,if(`tbl_trans_sp`.`dk` = 'D',`tbl_trans_sp`.`kas_id`,NULL) AS `untuk_kas`,`tbl_trans_sp`.`jenis_id` AS `transaksi`,`tbl_trans_sp`.`keterangan` AS `ket`,`tbl_trans_sp`.`user_name` AS `user` from `tbl_trans_sp` union select 'D' AS `tbl`,`tbl_trans_kas`.`id` AS `id`,`tbl_trans_kas`.`tgl_catat` AS `tgl`,if(`tbl_trans_kas`.`dk` = 'K',`tbl_trans_kas`.`jumlah`,if(`tbl_trans_kas`.`dk` is null,`tbl_trans_kas`.`jumlah`,0)) AS `kredit`,if(`tbl_trans_kas`.`dk` = 'D',`tbl_trans_kas`.`jumlah`,if(`tbl_trans_kas`.`dk` is null,`tbl_trans_kas`.`jumlah`,0)) AS `debet`,`tbl_trans_kas`.`dari_kas_id` AS `dari_kas`,`tbl_trans_kas`.`untuk_kas_id` AS `untuk_kas`,`tbl_trans_kas`.`jns_trans` AS `transaksi`,`tbl_trans_kas`.`keterangan` AS `ket`,`tbl_trans_kas`.`user_name` AS `user` from `tbl_trans_kas` union select 'E' AS `tbl`,`tbl_trans_nonkas`.`id` AS `id`,`tbl_trans_nonkas`.`tgl_catat` AS `tgl`,0 AS `kredit`,`tbl_trans_nonkas`.`jumlah` AS `debet`,NULL AS `dari_kas`,NULL AS `untuk_kas`,`tbl_trans_nonkas`.`akun_debit` AS `transaksi`,`tbl_trans_nonkas`.`keterangan` AS `ket`,`tbl_trans_nonkas`.`user_name` AS `user` from `tbl_trans_nonkas` union select 'F' AS `tbl`,`tbl_trans_nonkas`.`id` AS `id`,`tbl_trans_nonkas`.`tgl_catat` AS `tgl`,`tbl_trans_nonkas`.`jumlah` AS `kredit`,0 AS `debet`,NULL AS `dari_kas`,NULL AS `untuk_kas`,`tbl_trans_nonkas`.`akun_kredit` AS `transaksi`,`tbl_trans_nonkas`.`keterangan` AS `ket`,`tbl_trans_nonkas`.`user_name` AS `user` from `tbl_trans_nonkas` order by `tgl`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_transaksi_lama`
--
DROP TABLE IF EXISTS `v_transaksi_lama`;

CREATE ALGORITHM=UNDEFINED DEFINER=`temprin2_user_tsm`@`%` SQL SECURITY DEFINER VIEW `v_transaksi_lama`  AS SELECT 'A' AS `tbl`, `tbl_pinjaman_h`.`id` AS `id`, `tbl_pinjaman_h`.`tgl_pinjam` AS `tgl`, `tbl_pinjaman_h`.`jumlah` AS `kredit`, 0 AS `debet`, `tbl_pinjaman_h`.`kas_id` AS `dari_kas`, NULL AS `untuk_kas`, `tbl_pinjaman_h`.`jns_trans` AS `transaksi`, `tbl_pinjaman_h`.`keterangan` AS `ket`, `tbl_pinjaman_h`.`user_name` AS `user` FROM `tbl_pinjaman_h`union select 'B' AS `tbl`,`tbl_pinjaman_d`.`id` AS `id`,`tbl_pinjaman_d`.`tgl_bayar` AS `tgl`,0 AS `kredit`,`tbl_pinjaman_d`.`jumlah_bayar` AS `debet`,NULL AS `dari_kas`,`tbl_pinjaman_d`.`kas_id` AS `untuk_kas`,`tbl_pinjaman_d`.`jns_trans` AS `transaksi`,`tbl_pinjaman_d`.`keterangan` AS `ket`,`tbl_pinjaman_d`.`user_name` AS `user` from `tbl_pinjaman_d` union select 'C' AS `tbl`,`tbl_trans_sp`.`id` AS `id`,`tbl_trans_sp`.`tgl_transaksi` AS `tgl`,if(`tbl_trans_sp`.`dk` = 'K',`tbl_trans_sp`.`jumlah`,0) AS `kredit`,if(`tbl_trans_sp`.`dk` = 'D',`tbl_trans_sp`.`jumlah`,0) AS `debet`,if(`tbl_trans_sp`.`dk` = 'K',`tbl_trans_sp`.`kas_id`,NULL) AS `dari_kas`,if(`tbl_trans_sp`.`dk` = 'D',`tbl_trans_sp`.`kas_id`,NULL) AS `untuk_kas`,`tbl_trans_sp`.`jenis_id` AS `transaksi`,`tbl_trans_sp`.`keterangan` AS `ket`,`tbl_trans_sp`.`user_name` AS `user` from `tbl_trans_sp` union select 'D' AS `tbl`,`tbl_trans_kas`.`id` AS `id`,`tbl_trans_kas`.`tgl_catat` AS `tgl`,if(`tbl_trans_kas`.`dk` = 'K',`tbl_trans_kas`.`jumlah`,if(`tbl_trans_kas`.`dk` is null,`tbl_trans_kas`.`jumlah`,0)) AS `kredit`,if(`tbl_trans_kas`.`dk` = 'D',`tbl_trans_kas`.`jumlah`,if(`tbl_trans_kas`.`dk` is null,`tbl_trans_kas`.`jumlah`,0)) AS `debet`,`tbl_trans_kas`.`dari_kas_id` AS `dari_kas`,`tbl_trans_kas`.`untuk_kas_id` AS `untuk_kas`,`tbl_trans_kas`.`jns_trans` AS `transaksi`,`tbl_trans_kas`.`keterangan` AS `ket`,`tbl_trans_kas`.`user_name` AS `user` from `tbl_trans_kas` order by `tgl`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_transaksi_v2`
--
DROP TABLE IF EXISTS `v_transaksi_v2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`temprin2_user_tsm`@`%` SQL SECURITY DEFINER VIEW `v_transaksi_v2`  AS SELECT 'A' AS `tbl`, `tbl_pinjaman_h`.`id` AS `id`, `tbl_pinjaman_h`.`tgl_pinjam` AS `tgl`, `tbl_pinjaman_h`.`jumlah` AS `kredit`, 0 AS `debet`, `tbl_pinjaman_h`.`kas_id` AS `dari_kas`, NULL AS `untuk_kas`, `tbl_pinjaman_h`.`jns_trans` AS `transaksi`, `tbl_pinjaman_h`.`keterangan` AS `ket`, `tbl_pinjaman_h`.`user_name` AS `user`, NULL AS `transaksi2` FROM `tbl_pinjaman_h`union select 'B' AS `tbl`,`tbl_pinjaman_d`.`id` AS `id`,`tbl_pinjaman_d`.`tgl_bayar` AS `tgl`,0 AS `kredit`,`tbl_pinjaman_d`.`angsuran_pokok` AS `debet`,NULL AS `dari_kas`,`tbl_pinjaman_d`.`kas_id` AS `untuk_kas`,`tbl_pinjaman_d`.`jns_trans` AS `transaksi`,`tbl_pinjaman_d`.`keterangan` AS `ket`,`tbl_pinjaman_d`.`user_name` AS `user`,NULL AS `transaksi2` from `tbl_pinjaman_d` union select 'B1' AS `tbl`,`tbl_pinjaman_d`.`id` AS `id`,`tbl_pinjaman_d`.`tgl_bayar` AS `tgl`,0 AS `kredit`,`tbl_pinjaman_d`.`pendapatan` AS `debet`,NULL AS `dari_kas`,`tbl_pinjaman_d`.`kas_id` AS `untuk_kas`,`tbl_pinjaman_d`.`akun_pendapatan` AS `transaksi`,`tbl_pinjaman_d`.`keterangan` AS `ket`,`tbl_pinjaman_d`.`user_name` AS `user`,NULL AS `transaksi2` from `tbl_pinjaman_d` union select 'C' AS `tbl`,`tbl_trans_sp`.`id` AS `id`,`tbl_trans_sp`.`tgl_transaksi` AS `tgl`,if(`tbl_trans_sp`.`dk` = 'K',`tbl_trans_sp`.`jumlah`,0) AS `kredit`,if(`tbl_trans_sp`.`dk` = 'D',`tbl_trans_sp`.`jumlah`,0) AS `debet`,if(`tbl_trans_sp`.`dk` = 'K',`tbl_trans_sp`.`kas_id`,NULL) AS `dari_kas`,if(`tbl_trans_sp`.`dk` = 'D',`tbl_trans_sp`.`kas_id`,NULL) AS `untuk_kas`,`tbl_trans_sp`.`jenis_id` AS `transaksi`,`tbl_trans_sp`.`keterangan` AS `ket`,`tbl_trans_sp`.`user_name` AS `user`,NULL AS `transaksi2` from `tbl_trans_sp` union select 'D' AS `tbl`,`tbl_trans_kas`.`id` AS `id`,`tbl_trans_kas`.`tgl_catat` AS `tgl`,if(`tbl_trans_kas`.`dk` = 'K',`tbl_trans_kas`.`jumlah`,if(`tbl_trans_kas`.`dk` is null,`tbl_trans_kas`.`jumlah`,0)) AS `kredit`,if(`tbl_trans_kas`.`dk` = 'D',`tbl_trans_kas`.`jumlah`,if(`tbl_trans_kas`.`dk` is null,`tbl_trans_kas`.`jumlah`,0)) AS `debet`,`tbl_trans_kas`.`dari_kas_id` AS `dari_kas`,`tbl_trans_kas`.`untuk_kas_id` AS `untuk_kas`,`tbl_trans_kas`.`jns_trans` AS `transaksi`,`tbl_trans_kas`.`keterangan` AS `ket`,`tbl_trans_kas`.`user_name` AS `user`,NULL AS `transaksi2` from `tbl_trans_kas` union select 'E' AS `tbl`,`tbl_trans_nonkas`.`id` AS `id`,`tbl_trans_nonkas`.`tgl_catat` AS `tgl`,`tbl_trans_nonkas`.`jumlah` AS `debet`,0 AS `kredit`,NULL AS `dari_kas`,NULL AS `untuk_kas`,`tbl_trans_nonkas`.`akun_debit` AS `transaksi`,`tbl_trans_nonkas`.`keterangan` AS `ket`,`tbl_trans_nonkas`.`user_name` AS `user`,`tbl_trans_nonkas`.`akun_kredit` AS `transaksi2` from `tbl_trans_nonkas` union select 'F' AS `tbl`,`tbl_trans_nonkas`.`id` AS `id`,`tbl_trans_nonkas`.`tgl_catat` AS `tgl`,0 AS `debet`,`tbl_trans_nonkas`.`jumlah` AS `kredit`,NULL AS `dari_kas`,NULL AS `untuk_kas`,`tbl_trans_nonkas`.`akun_kredit` AS `transaksi`,`tbl_trans_nonkas`.`keterangan` AS `ket`,`tbl_trans_nonkas`.`user_name` AS `user`,`tbl_trans_nonkas`.`akun_debit` AS `transaksi2` from `tbl_trans_nonkas` order by `tgl`  ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
