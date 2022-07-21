-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Jul 2022 pada 16.27
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_ternakin`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `catatan_harian`
--

CREATE TABLE `catatan_harian` (
  `ID_PERIODE` int(11) NOT NULL,
  `ID_KANDANG` int(11) NOT NULL,
  `ID_CATATAN` int(11) NOT NULL,
  `ID_PEGAWAI` int(11) NOT NULL,
  `KODE_PAKAN` varchar(20) NOT NULL,
  `JUMLAH_KALING` int(11) DEFAULT NULL,
  `JUMLAH_MATI` int(11) DEFAULT NULL,
  `TANGGAL_CATATAN_HARIAN` date DEFAULT NULL,
  `BERAT_BADAN` float DEFAULT NULL,
  `STATUS_VAKSIN` int(11) DEFAULT NULL,
  `PAKAN_HARIAN` int(11) DEFAULT NULL,
  `ID_PANEN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan`
--

CREATE TABLE `jabatan` (
  `ID_JABATAN` int(11) NOT NULL,
  `NAMA_JABATAN` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jabatan`
--

INSERT INTO `jabatan` (`ID_JABATAN`, `NAMA_JABATAN`) VALUES
(1, 'Pemilik'),
(2, 'Pegawai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kandang`
--

CREATE TABLE `kandang` (
  `ID_KANDANG` int(11) NOT NULL,
  `NAMA_KANDANG` varchar(50) DEFAULT NULL,
  `KAPASITAS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kandang`
--

INSERT INTO `kandang` (`ID_KANDANG`, `NAMA_KANDANG`, `KAPASITAS`) VALUES
(11, 'Kandang Barat A1', 1000),
(14, 'Kandang Barat B1', 100);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pakan`
--

CREATE TABLE `pakan` (
  `KODE_PAKAN` varchar(20) NOT NULL,
  `NAMA_PAKAN` varchar(50) DEFAULT NULL,
  `STOK_PAKAN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pakan`
--

INSERT INTO `pakan` (`KODE_PAKAN`, `NAMA_PAKAN`, `STOK_PAKAN`) VALUES
('BR-08', 'BR-08', 10),
('FB-101', 'FB-101', 10),
('NH-810', 'NH-810', 10),
('NH-811', 'NH-811', 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `panen`
--

CREATE TABLE `panen` (
  `TANGGAL_PANEN` date DEFAULT NULL,
  `BERAT_HASIL` float DEFAULT NULL,
  `JUMLAH_HASIL` int(11) DEFAULT NULL,
  `ID_PANEN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `ID_PEGAWAI` int(11) NOT NULL,
  `ID_JABATAN` int(11) NOT NULL,
  `NAMA` varchar(50) DEFAULT NULL,
  `NO_TELP` varchar(12) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(8) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`ID_PEGAWAI`, `ID_JABATAN`, `NAMA`, `NO_TELP`, `EMAIL`, `PASSWORD`, `STATUS`) VALUES
(1, 1, 'Dhevani Dafa', '081936632163', 'dhevanidafa07@gmail.com', '12345678', 1),
(2, 2, 'Ryan Ardito', '081936632163', 'ryanardito14@gmail.com', '12345678', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pencatatan_pakan_masuk`
--

CREATE TABLE `pencatatan_pakan_masuk` (
  `ID_PPM` int(11) NOT NULL,
  `KODE_PAKAN` varchar(20) NOT NULL,
  `TANGGAL_MASUK` date DEFAULT NULL,
  `PAKAN_MASUK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pencatatan_pakan_masuk`
--

INSERT INTO `pencatatan_pakan_masuk` (`ID_PPM`, `KODE_PAKAN`, `TANGGAL_MASUK`, `PAKAN_MASUK`) VALUES
(5, 'BR-08', '2022-07-17', 10),
(6, 'FB-101', '2022-07-17', 10),
(7, 'NH-810', '2022-07-17', 10),
(8, 'NH-811', '2022-07-17', 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `periode_ternak`
--

CREATE TABLE `periode_ternak` (
  `ID_PERIODE` int(11) NOT NULL,
  `JUMLAH_BIBIT` int(11) DEFAULT NULL,
  `TANGGAL_DATANG` date DEFAULT NULL,
  `STATUS_PERIODE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `periode_ternak`
--

INSERT INTO `periode_ternak` (`ID_PERIODE`, `JUMLAH_BIBIT`, `TANGGAL_DATANG`, `STATUS_PERIODE`) VALUES
(1, 100, '2022-07-17', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `catatan_harian`
--
ALTER TABLE `catatan_harian`
  ADD PRIMARY KEY (`ID_PERIODE`,`ID_KANDANG`,`ID_CATATAN`,`ID_PANEN`),
  ADD KEY `FK_CATATAN__MENGHASIL_PANEN` (`ID_PANEN`),
  ADD KEY `FK_CATATAN__DILAKUKAN_KANDANG` (`ID_KANDANG`),
  ADD KEY `FK_CATATAN__MENGELOLA_PEGAWAI` (`ID_PEGAWAI`),
  ADD KEY `FK_CATATAN__PAKAN_HAR_PAKAN` (`KODE_PAKAN`);

--
-- Indeks untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`ID_JABATAN`);

--
-- Indeks untuk tabel `kandang`
--
ALTER TABLE `kandang`
  ADD PRIMARY KEY (`ID_KANDANG`);

--
-- Indeks untuk tabel `pakan`
--
ALTER TABLE `pakan`
  ADD PRIMARY KEY (`KODE_PAKAN`);

--
-- Indeks untuk tabel `panen`
--
ALTER TABLE `panen`
  ADD PRIMARY KEY (`ID_PANEN`),
  ADD UNIQUE KEY `PANEN_PK` (`TANGGAL_PANEN`,`ID_PANEN`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`ID_PEGAWAI`),
  ADD KEY `FK_PEGAWAI_MEMILIKI__JABATAN` (`ID_JABATAN`);

--
-- Indeks untuk tabel `pencatatan_pakan_masuk`
--
ALTER TABLE `pencatatan_pakan_masuk`
  ADD PRIMARY KEY (`ID_PPM`),
  ADD KEY `FK_PENCATAT_DETIL_PPM_PAKAN` (`KODE_PAKAN`);

--
-- Indeks untuk tabel `periode_ternak`
--
ALTER TABLE `periode_ternak`
  ADD PRIMARY KEY (`ID_PERIODE`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `ID_JABATAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `kandang`
--
ALTER TABLE `kandang`
  MODIFY `ID_KANDANG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `ID_PEGAWAI` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pencatatan_pakan_masuk`
--
ALTER TABLE `pencatatan_pakan_masuk`
  MODIFY `ID_PPM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `periode_ternak`
--
ALTER TABLE `periode_ternak`
  MODIFY `ID_PERIODE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `catatan_harian`
--
ALTER TABLE `catatan_harian`
  ADD CONSTRAINT `FK_CATATAN__DILAKUKAN_KANDANG` FOREIGN KEY (`ID_KANDANG`) REFERENCES `kandang` (`ID_KANDANG`),
  ADD CONSTRAINT `FK_CATATAN__MEMILIKI_PERIODE_` FOREIGN KEY (`ID_PERIODE`) REFERENCES `periode_ternak` (`ID_PERIODE`),
  ADD CONSTRAINT `FK_CATATAN__MENGELOLA_PEGAWAI` FOREIGN KEY (`ID_PEGAWAI`) REFERENCES `pegawai` (`ID_PEGAWAI`),
  ADD CONSTRAINT `FK_CATATAN__MENGHASIL_PANEN` FOREIGN KEY (`ID_PANEN`) REFERENCES `panen` (`ID_PANEN`),
  ADD CONSTRAINT `FK_CATATAN__PAKAN_HAR_PAKAN` FOREIGN KEY (`KODE_PAKAN`) REFERENCES `pakan` (`KODE_PAKAN`);

--
-- Ketidakleluasaan untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `FK_PEGAWAI_MEMILIKI__JABATAN` FOREIGN KEY (`ID_JABATAN`) REFERENCES `jabatan` (`ID_JABATAN`);

--
-- Ketidakleluasaan untuk tabel `pencatatan_pakan_masuk`
--
ALTER TABLE `pencatatan_pakan_masuk`
  ADD CONSTRAINT `FK_PENCATAT_DETIL_PPM_PAKAN` FOREIGN KEY (`KODE_PAKAN`) REFERENCES `pakan` (`KODE_PAKAN`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
