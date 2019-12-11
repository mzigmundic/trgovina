-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2019 at 10:08 AM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trgovina`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategorije`
--

CREATE TABLE `kategorije` (
  `id` int(11) NOT NULL,
  `ime` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kategorije`
--

INSERT INTO `kategorije` (`id`, `ime`) VALUES
(1, 'Električne gitare'),
(2, 'Akustične gitare'),
(3, 'Bas gitare'),
(4, 'Pojačala'),
(5, 'Pedale i efekti'),
(6, 'Žice');

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

CREATE TABLE `korisnici` (
  `id` int(11) NOT NULL,
  `ime` varchar(50) NOT NULL,
  `prezime` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `lozinka` varchar(50) NOT NULL,
  `uloga` int(11) NOT NULL,
  `adresa` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`id`, `ime`, `prezime`, `email`, `lozinka`, `uloga`, `adresa`) VALUES
(1, 'Ivo', 'Sanader', 'san@gmail.com', '123', 2, NULL),
(2, 'Milan', 'Bandic', 'ban@gmail.com', '123', 1, NULL),
(3, 'Josip Broz', 'Tito', 'tito@gmail.com', '123', 1, NULL),
(4, 'Ivica', 'Racan', 'rac@gmail.com', '123', 1, NULL),
(6, 'Moj', 'Test', 'ss@gmail.com', '123', 1, NULL),
(9, '', '', 'rr@gmail.com', '123', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `povijest`
--

CREATE TABLE `povijest` (
  `id` int(11) NOT NULL,
  `idkupca` int(11) NOT NULL,
  `idproizvod` int(11) NOT NULL,
  `kol` float NOT NULL,
  `vrijeme` datetime NOT NULL,
  `nacinpl` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `povijest`
--

INSERT INTO `povijest` (`id`, `idkupca`, `idproizvod`, `kol`, `vrijeme`, `nacinpl`) VALUES
(1, 2, 41, 1, '2019-07-10 16:23:46', 2),
(2, 2, 42, 1, '2019-07-10 16:23:46', 2),
(3, 2, 43, 1, '2019-07-10 16:23:46', 2),
(4, 2, 44, 1, '2019-07-10 16:23:46', 2),
(5, 3, 1, 1, '2019-07-10 16:24:50', 2),
(6, 3, 3, 1, '2019-07-10 16:24:50', 2),
(7, 3, 35, 1, '2019-07-10 16:24:50', 2),
(8, 3, 38, 1, '2019-07-10 16:24:50', 2),
(9, 4, 15, 1, '2019-07-10 16:35:49', 2),
(10, 4, 26, 1, '2019-07-10 16:35:49', 2),
(11, 4, 11, 1, '2019-07-10 16:35:49', 2),
(12, 4, 3, 1, '2019-07-10 16:35:49', 2),
(13, 4, 5, 1, '2019-07-10 16:35:49', 2),
(14, 2, 1, 1, '2019-07-10 18:56:26', 2),
(15, 2, 3, 1, '2019-07-10 18:56:26', 2),
(16, 2, 4, 1, '2019-07-10 18:56:26', 2),
(17, 2, 5, 1, '2019-07-10 18:56:26', 2),
(18, 2, 3, 1, '2019-07-10 18:56:26', 2),
(19, 2, 4, 1, '2019-07-10 18:56:26', 2);

-- --------------------------------------------------------

--
-- Table structure for table `prijave`
--

CREATE TABLE `prijave` (
  `id` int(11) NOT NULL,
  `idkorisnik` int(11) NOT NULL,
  `vrijeme` datetime NOT NULL,
  `nacinprijave` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prijave`
--

INSERT INTO `prijave` (`id`, `idkorisnik`, `vrijeme`, `nacinprijave`) VALUES
(1, 2, '2019-07-10 16:23:25', 0),
(2, 2, '2019-07-10 16:23:47', 3),
(3, 1, '2019-07-10 16:23:55', 0),
(4, 1, '2019-07-10 16:24:08', 3),
(5, 3, '2019-07-10 16:24:31', 0),
(6, 3, '2019-07-10 16:24:54', 3),
(7, 1, '2019-07-10 16:25:00', 0),
(8, 1, '2019-07-10 16:35:04', 3),
(9, 4, '2019-07-10 16:35:23', 0),
(10, 4, '2019-07-10 16:35:50', 3),
(11, 1, '2019-07-10 16:35:57', 0),
(12, 1, '2019-07-10 16:36:54', 3),
(13, 1, '2019-07-10 16:37:18', 0),
(14, 1, '2019-07-10 16:37:19', 3),
(15, 1, '2019-07-10 16:37:25', 0),
(16, 1, '2019-07-10 16:37:45', 3),
(17, 6, '2019-07-10 18:00:39', 0),
(18, 6, '2019-07-10 18:01:21', 3),
(19, 1, '2019-07-10 18:02:33', 0),
(20, 1, '2019-07-10 18:02:46', 3),
(21, 1, '2019-07-10 18:03:01', 0),
(22, 1, '2019-07-10 18:03:21', 3),
(23, 2, '2019-07-10 18:03:25', 0),
(24, 2, '2019-07-10 18:03:28', 3),
(25, 1, '2019-07-10 18:03:39', 0),
(26, 1, '2019-07-10 18:04:23', 3),
(27, 1, '2019-07-10 18:26:02', 0),
(28, 1, '2019-07-10 18:26:05', 3),
(29, 2, '2019-07-10 18:26:13', 0),
(30, 2, '2019-07-10 18:27:18', 3),
(31, 2, '2019-07-10 18:30:46', 0),
(32, 2, '2019-07-10 18:31:18', 3),
(33, 2, '2019-07-10 18:32:49', 0),
(34, 2, '2019-07-10 18:33:52', 3),
(35, 1, '2019-07-10 18:33:58', 0),
(36, 1, '2019-07-10 18:35:12', 3),
(37, 1, '2019-07-10 18:35:15', 0),
(38, 1, '2019-07-10 18:35:43', 0),
(39, 1, '2019-07-10 18:38:26', 3),
(40, 1, '2019-07-10 18:38:29', 0),
(41, 1, '2019-07-10 18:40:18', 3),
(42, 1, '2019-07-10 18:40:20', 0),
(43, 1, '2019-07-10 18:42:03', 3),
(44, 1, '2019-07-10 18:42:11', 0),
(45, 1, '2019-07-10 18:42:21', 3),
(46, 1, '2019-07-10 18:43:41', 0),
(47, 1, '2019-07-10 18:44:20', 3),
(48, 1, '2019-07-10 18:44:22', 0),
(49, 1, '2019-07-10 18:44:42', 3),
(50, 1, '2019-07-10 18:44:45', 0),
(51, 1, '2019-07-10 18:45:22', 3),
(52, 1, '2019-07-10 18:46:01', 0),
(53, 1, '2019-07-10 18:46:34', 3),
(54, 1, '2019-07-10 18:46:57', 0),
(55, 1, '2019-07-10 18:46:58', 3),
(56, 1, '2019-07-10 18:47:20', 0),
(57, 1, '2019-07-10 18:47:57', 3),
(58, 1, '2019-07-10 18:48:00', 0),
(59, 1, '2019-07-10 18:48:01', 3),
(60, 1, '2019-07-10 18:48:07', 0),
(61, 1, '2019-07-10 18:48:10', 3),
(62, 2, '2019-07-10 18:48:21', 0),
(63, 2, '2019-07-10 18:48:24', 3),
(64, 2, '2019-07-10 18:48:30', 0),
(65, 2, '2019-07-10 18:50:28', 3),
(66, 2, '2019-07-10 18:50:32', 0),
(67, 2, '2019-07-10 18:51:07', 3),
(68, 2, '2019-07-10 18:53:33', 0),
(69, 2, '2019-07-10 18:53:37', 3),
(70, 2, '2019-07-10 18:56:14', 0),
(71, 2, '2019-07-10 18:56:28', 3),
(72, 1, '2019-07-10 18:56:36', 0),
(73, 1, '2019-07-10 19:01:49', 0),
(74, 1, '2019-07-10 19:04:26', 0),
(75, 1, '2019-07-10 19:04:38', 3),
(76, 1, '2019-07-10 19:04:42', 0),
(77, 1, '2019-07-10 19:04:50', 3),
(78, 9, '2019-07-10 19:05:22', 0),
(79, 9, '2019-07-10 19:05:48', 3),
(80, 1, '2019-07-10 19:06:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `proizvodi`
--

CREATE TABLE `proizvodi` (
  `id` int(11) NOT NULL,
  `ime` varchar(50) NOT NULL,
  `kolicina` int(11) NOT NULL,
  `cijena` float NOT NULL,
  `idkat` int(11) NOT NULL,
  `opis` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `proizvodi`
--

INSERT INTO `proizvodi` (`id`, `ime`, `kolicina`, `cijena`, `idkat`, `opis`) VALUES
(1, 'Fender Stratocaster A1', 31, 8699.9, 1, NULL),
(2, 'Ibanez Blazer R6', 20, 5299.9, 1, NULL),
(3, 'Jackson JS2', 4, 4199.9, 1, NULL),
(4, 'LTD MH', 7, 2399.9, 1, NULL),
(5, 'Godin 5TH', 9, 5599.9, 1, NULL),
(6, 'Pavey JF-1', 18, 3299.9, 1, NULL),
(7, 'Squier Left-Handed', 11, 2599.9, 1, NULL),
(8, 'Washburn RX10', 15, 1599.9, 1, NULL),
(9, 'Fender AC2', 16, 2399.9, 2, NULL),
(10, 'Squier A4', 20, 1599.9, 2, NULL),
(11, 'Ibanez RX6', 13, 1999.9, 2, NULL),
(12, 'Pavey Composer', 21, 1299.9, 2, NULL),
(13, 'Washburn WD10', 25, 1699.9, 2, NULL),
(14, 'Norman Encore B20', 13, 1999.3, 2, NULL),
(15, 'Takamine GD93', 8, 3999.9, 2, NULL),
(16, 'Flight F-230', 33, 899.9, 2, NULL),
(17, 'Stagg P200', 12, 1599.99, 3, NULL),
(18, 'Squier PJ', 15, 2599.99, 3, NULL),
(19, 'Sigma BMC', 12, 4099.99, 3, NULL),
(20, 'Carvin LB70P', 13, 11940.9, 3, NULL),
(21, 'Flight EJB10', 11, 999.99, 3, NULL),
(22, 'Lakland TTS', 14, 8300, 3, NULL),
(23, 'Spector OP4DLX', 9, 7900, 3, NULL),
(24, 'Jay Turser JBT-400', 8, 1436.5, 3, NULL),
(25, 'Line6 R850', 10, 3290.9, 4, NULL),
(26, 'Peavey 68000', 13, 8330.99, 4, NULL),
(27, 'Roland Micro GX', 18, 1040.9, 4, NULL),
(28, 'Fender Bass LT2', 24, 2590.99, 4, NULL),
(29, 'Orange MT20', 16, 1000, 4, NULL),
(30, 'Bugera T5', 14, 1200.9, 4, NULL),
(31, 'Randall RD1H', 13, 2690.9, 4, NULL),
(32, 'Blackstar HT100', 11, 8240, 4, NULL),
(33, 'Behringer Distortion Modeler 100', 20, 399.99, 5, NULL),
(34, 'Roland Footshwitch', 18, 199.99, 5, NULL),
(35, 'Behringer Distortion Modeler 100', 19, 99.99, 5, NULL),
(36, 'Laney IT-88', 20, 349.99, 5, NULL),
(37, 'DigiTech DHH', 14, 599.99, 5, NULL),
(38, 'Blackstar GD21', 16, 699.99, 5, NULL),
(39, 'Hotone JPS', 22, 1099.99, 5, NULL),
(40, 'Aphex Q44', 11, 409.9, 5, NULL),
(41, 'Daddario Acoustic Bronze 11-56', 99, 49.99, 6, NULL),
(42, 'Daddario Acoustic Bronze 10-50', 99, 45.99, 6, NULL),
(43, 'Daddario Acoustic Bronze 9-42', 99, 42.99, 6, NULL),
(44, 'Ernie Ball Electric 11-56', 99, 65.99, 6, NULL),
(45, 'Ernie Ball Electric 10-50', 100, 60.99, 6, NULL),
(46, 'Ernie Ball Electric 9-46', 100, 60.99, 6, NULL),
(47, 'DR Sunbeams Bass 45-100', 60, 290, 6, NULL),
(48, 'DR Bootzillas 45-100', 60, 333, 6, NULL),
(49, 'DR Nickel 45-100', 60, 285, 6, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategorije`
--
ALTER TABLE `kategorije`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `povijest`
--
ALTER TABLE `povijest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prijave`
--
ALTER TABLE `prijave`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proizvodi`
--
ALTER TABLE `proizvodi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idkat` (`idkat`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategorije`
--
ALTER TABLE `kategorije`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `korisnici`
--
ALTER TABLE `korisnici`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `povijest`
--
ALTER TABLE `povijest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `prijave`
--
ALTER TABLE `prijave`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `proizvodi`
--
ALTER TABLE `proizvodi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `proizvodi`
--
ALTER TABLE `proizvodi`
  ADD CONSTRAINT `proizvodi_ibfk_1` FOREIGN KEY (`idkat`) REFERENCES `kategorije` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
