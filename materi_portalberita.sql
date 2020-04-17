-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Apr 2020 pada 12.14
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `materi_portalberita`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'yogi123', '4d2df81ee3e8ede2b92ed780806f8dfc', 'Yogi Prayogi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` int(11) NOT NULL,
  `nama_lengkap` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `aktif` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama_lengkap`, `password`, `email`, `aktif`) VALUES
(1, 'Ahmad Firdaus', '202cb962ac59075b964b07152d234b70', 'firdaus@gmail.com', b'1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `berita`
--

CREATE TABLE `berita` (
  `id_berita` int(11) NOT NULL,
  `judul` varchar(70) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `gambar` varchar(70) NOT NULL,
  `teks_berita` text NOT NULL,
  `tgl_posting` datetime NOT NULL,
  `id_admin` int(11) NOT NULL,
  `dilihat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `berita`
--

INSERT INTO `berita` (`id_berita`, `judul`, `id_kategori`, `gambar`, `teks_berita`, `tgl_posting`, `id_admin`, `dilihat`) VALUES
(1, 'Manchester United menjuarai liga inggris', 1, 'juara.jpg', 'Manchaster United berhasil mempertahankan juara liga inggris di musim ini', '2015-08-10 08:35:27', 1, 1),
(2, 'Jokowi menjadi Presiden RI', 2, 'jokowi.jpg', 'Jokowi kembali menjadi Presiden RI untuk ke dua kalinya ', '2019-08-16 10:28:31', 1, 4),
(3, 'Iphone meluncurkan produk terbarunya', 3, 'iphone.jpg', 'Iphone 11 Pro Max menjadi produk terbaru Iphone tahun ini', '2019-08-03 17:25:43', 1, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `iklan`
--

CREATE TABLE `iklan` (
  `id_iklan` int(11) NOT NULL,
  `nm_perusahaan` varchar(50) NOT NULL,
  `isi_iklan` varchar(200) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_akhir` date NOT NULL,
  `id_admin` int(11) NOT NULL,
  `hargasewa` double NOT NULL,
  `lamasewa` int(11) NOT NULL,
  `totalharga` double NOT NULL,
  `aktif` bit(1) NOT NULL,
  `email` varchar(50) NOT NULL,
  `link` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `iklan`
--

INSERT INTO `iklan` (`id_iklan`, `nm_perusahaan`, `isi_iklan`, `gambar`, `tgl_mulai`, `tgl_akhir`, `id_admin`, `hargasewa`, `lamasewa`, `totalharga`, `aktif`, `email`, `link`) VALUES
(1, 'Telkomsel', 'Jaringan Tercepat', 'telkom.jpg', '2019-09-01', '2020-09-01', 1, 10000000, 12, 120000000, b'1', 'telkom@gmail.com', 'telkom.co.id'),
(2, 'STMIK Nusa Mandiri', 'Sarjana Nusa Mandiri aja', 'nusa.jpg', '2019-12-01', '2020-12-01', 1, 10000000, 12, 120000000, b'1', 'nusamandiri@gmail.com', 'nusamandiri.ac.id');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `kategori` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `kategori`) VALUES
(1, 'nasional'),
(2, 'olah raga'),
(3, 'teknologi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentar`
--

CREATE TABLE `komentar` (
  `id_komentar` int(11) NOT NULL,
  `id_berita` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `tgl_komentar` datetime NOT NULL,
  `isi_komentar` text NOT NULL,
  `ip_address` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indeks untuk tabel `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indeks untuk tabel `iklan`
--
ALTER TABLE `iklan`
  ADD PRIMARY KEY (`id_iklan`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id_komentar`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `iklan`
--
ALTER TABLE `iklan`
  MODIFY `id_iklan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id_komentar` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
