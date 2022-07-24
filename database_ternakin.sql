-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2022 at 12:19 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

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
-- Table structure for table `catatan_harian`
--

CREATE TABLE `catatan_harian` (
  `ID_PERIODE` int(11) NOT NULL,
  `ID_KANDANG` varchar(20) NOT NULL,
  `ID_CATATAN` int(11) NOT NULL,
  `ID_PEGAWAI` varchar(20) NOT NULL,
  `KODE_PAKAN` varchar(20) NOT NULL,
  `JUMLAH_KALING` int(11) DEFAULT NULL,
  `JUMLAH_MATI` int(11) DEFAULT NULL,
  `BERAT_BADAN` float DEFAULT NULL,
  `STATUS_VAKSIN` int(11) DEFAULT NULL,
  `PAKAN_HARIAN` int(11) DEFAULT NULL,
  `ID_PANEN` int(11) NOT NULL,
  `SISA_AYAM` varchar(20) NOT NULL,
  `UMUR_AYAM` varchar(20) NOT NULL,
  `JUMLAH_PAKAN` varchar(20) NOT NULL,
  `TANGGAL_CATATAN_HARIAN` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catatan_harian`
--

INSERT INTO `catatan_harian` (`ID_PERIODE`, `ID_KANDANG`, `ID_CATATAN`, `ID_PEGAWAI`, `KODE_PAKAN`, `JUMLAH_KALING`, `JUMLAH_MATI`, `BERAT_BADAN`, `STATUS_VAKSIN`, `PAKAN_HARIAN`, `ID_PANEN`, `SISA_AYAM`, `UMUR_AYAM`, `JUMLAH_PAKAN`, `TANGGAL_CATATAN_HARIAN`) VALUES
(1, '', 1, '', 'BR-08', 1, 2, 123, 1, 1, 1, '20', '1', '300', ''),
(1, '', 2, '', 'BR-08', 2, 1, 2, 1, 2, 3, '4', '1', '1', '1'),
(1, '', 3, '', 'BR-08', 2, 1, 2, 1, 2, 3, '4', '1', '1', '1'),
(1, '', 4, '', 'BR-08', 2, 1, 2, 1, 2, 3, '4', '1', '1', '1'),
(1, '', 5, '', 'BRoo', 1, 1, 7, 0, 0, 1, '3', '6', '7', 'Sunday, 24 July 2022'),
(1, '11', 6, 'INFlMGQfuYhF6Fz4mMC6', 'BrI', 6, 3, 3, 0, 0, 1, '200', '1', '60', 'Sunday, 24 July 2022'),
(1, '11', 7, 'INFlMGQfuYhF6Fz4mMC6', 'hh', 9, 9, 500, 0, 0, 1, '6', '33', '6', 'Sunday, 24 July 2022'),
(1, '11', 8, 'INFlMGQfuYhF6Fz4mMC6', 'h', 6, 6, 3, 0, 0, 1, '6', '6', '6', 'Sunday, 24 July 2022');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catatan_harian`
--
ALTER TABLE `catatan_harian`
  ADD PRIMARY KEY (`ID_CATATAN`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catatan_harian`
--
ALTER TABLE `catatan_harian`
  MODIFY `ID_CATATAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
