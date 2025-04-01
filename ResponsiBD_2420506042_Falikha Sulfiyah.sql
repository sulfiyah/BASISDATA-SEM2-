-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Apr 2025 pada 17.44
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` varchar(10) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Jurusan` varchar(20) DEFAULT 'umum',
  `Tgl_daftar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `Nama`, `Jurusan`, `Tgl_daftar`) VALUES
('A111', 'Falikha', 'Teknologi Informasi', '2024-07-01'),
('A222', 'Jungkook', 'Seni Musik', '2023-06-13'),
('A333', 'Naravit', 'Teknik Biomedis', '2025-03-05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` varchar(10) NOT NULL,
  `Judul` varchar(100) NOT NULL,
  `Penerbit` varchar(50) DEFAULT NULL,
  `Tahun_terbit` int(11) DEFAULT NULL CHECK (`Tahun_terbit` between 1900 and 2025),
  `id_penerbit` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `Judul`, `Penerbit`, `Tahun_terbit`, `id_penerbit`) VALUES
('B101', 'Mikrokosmos', 'BigHit', 2019, 'P001'),
('B102', 'Butter', 'lachimolala', 2022, 'P002'),
('B103', 'DNA', 'Gramedia', 2017, 'P004'),
('B104', 'Telepathy', 'HopeEnt', 2020, 'P003'),
('B105', 'Spring Day', 'YNWA', 2017, 'P005');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `id_anggota` varchar(10) DEFAULT NULL,
  `id_buku` varchar(10) DEFAULT NULL,
  `Tgl_pinjam` date NOT NULL,
  `Tgl_kembali` date DEFAULT NULL,
  `Denda` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `id_anggota`, `id_buku`, `Tgl_pinjam`, `Tgl_kembali`, `Denda`) VALUES
(1, 'A111', 'B105', '2025-01-07', '2025-02-06', 0),
(2, 'A222', 'B101', '2024-12-30', '2025-01-02', 0),
(3, 'A333', 'B101', '2025-04-01', NULL, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerbit`
--

CREATE TABLE `penerbit` (
  `id_penerbit` varchar(10) NOT NULL,
  `Nama_penerbit` varchar(50) NOT NULL,
  `Alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penerbit`
--

INSERT INTO `penerbit` (`id_penerbit`, `Nama_penerbit`, `Alamat`) VALUES
('P001', 'BigHit', 'Garut'),
('P002', 'lachimolala', 'Bandung'),
('P003', 'HopeEnt', 'Cirebon'),
('P004', 'Gramedia', 'Jakarta'),
('P005', 'YNWA', 'Jakarta');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksipeminjaman`
--

CREATE TABLE `transaksipeminjaman` (
  `id_transaksi` varchar(10) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Jurusan` varchar(20) NOT NULL,
  `Judul` varchar(100) NOT NULL,
  `Penerbit` varchar(50) DEFAULT NULL,
  `Tgl_pinjam` date NOT NULL,
  `Tgl_kembali` date DEFAULT NULL,
  `Denda` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksipeminjaman`
--

INSERT INTO `transaksipeminjaman` (`id_transaksi`, `Nama`, `Jurusan`, `Judul`, `Penerbit`, `Tgl_pinjam`, `Tgl_kembali`, `Denda`) VALUES
('1', 'Falikha', 'Teknologi Informasi', 'Spring day', 'YNWA', '2025-01-07', '2025-01-14', 0),
('2', 'Jungkook', 'Seni Musik', 'Mikrokosmos', 'BigHit', '2024-12-30', '2025-01-02', 0),
('3', 'Naravit', 'Teknik Biomedis', 'Mikrokosmos', 'BigHit', '2025-04-01', '2025-04-05', 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `fk_id_penerbit` (`id_penerbit`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indeks untuk tabel `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id_penerbit`);

--
-- Indeks untuk tabel `transaksipeminjaman`
--
ALTER TABLE `transaksipeminjaman`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `fk_id_penerbit` FOREIGN KEY (`id_penerbit`) REFERENCES `penerbit` (`id_penerbit`);

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
