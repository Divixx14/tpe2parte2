-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2022 at 06:27 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `peliculas`
--

-- --------------------------------------------------------

--
-- Table structure for table `genero`
--

CREATE TABLE `genero` (
  `Id` int(50) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `genre` varchar(200) NOT NULL,
  `id_genero` int(45) NOT NULL,
  `fecha` int(50) NOT NULL,
  `duracion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `genero`
--

INSERT INTO `genero` (`Id`, `nombre`, `genre`, `id_genero`, `fecha`, `duracion`) VALUES
(1, 'Sicario', 'Suspenso/Crimen', 1, 2015, '1.41 hs'),
(2, 'Herbie a Toda Marcha', 'Infantil/Comedia', 2, 2005, '1.55 hs'),
(3, 'Los Indestructibles', 'Accion', 3, 2009, '1.43 hs'),
(4, 'Spiderman', 'Accion', 4, 2002, '2 hs'),
(5, 'Space Jam: Una Nueva Era', 'Infantil/Comedia', 5, 2021, '2.1 hs'),
(6, 'Joker', 'Suspenso/Crimen', 6, 2019, '1.55 hs'),
(7, 'Cars', 'Infantil/Comedia', 7, 2009, '1.45 hs');

-- --------------------------------------------------------

--
-- Table structure for table `pelicula`
--

CREATE TABLE `pelicula` (
  `Id` int(50) NOT NULL,
  `genero` varchar(45) NOT NULL,
  `titulo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelicula`
--

INSERT INTO `pelicula` (`Id`, `genero`, `titulo`) VALUES
(1, 'Suspenso/Crimen', 'Sicario'),
(2, 'Infantil/Comedia', 'Herbie a Toda Marcha'),
(3, 'Accion', 'Los Indestructibles'),
(4, 'Accion', 'Spiderman'),
(5, 'Infantil/Comedia', 'Space Jam: Una Nueva Era'),
(6, 'Suspenso/Crimen', 'Joker'),
(7, 'Infantil/Comedia', 'Cars'),
(12, 'Suspenso/Crimen', 'asd');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
(1, 'admin@admin.com', '$2a$12$BBODeXKsb6/Ml2s5.V..0.OaCRPe5MMH6kPkHSa/GKONgbvzSvHcS');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_id_genero` (`id_genero`);

--
-- Indexes for table `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `genero`
--
ALTER TABLE `genero`
  MODIFY `Id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pelicula`
--
ALTER TABLE `pelicula`
  MODIFY `Id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `genero`
--
ALTER TABLE `genero`
  ADD CONSTRAINT `fk_id_genero` FOREIGN KEY (`id_genero`) REFERENCES `pelicula` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
