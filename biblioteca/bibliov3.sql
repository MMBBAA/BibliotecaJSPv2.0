-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-04-2019 a las 00:08:07
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bibliov3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obra`
--

CREATE TABLE `obra` (
  `ISBN` varchar(13) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `autor` varchar(30) NOT NULL,
  `editorial` varchar(30) NOT NULL,
  `operativo` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `obra`
--

INSERT INTO `obra` (`ISBN`, `titulo`, `autor`, `editorial`, `operativo`) VALUES
('9780762428212', 'la odisea', 'homero', 'salvat', 'si'),
('9782919800995', 'el nombre de la rosa', 'umberto eco', 'agostini', 'si'),
('9783195119016', 'el quijote', 'cervantes', 'planeta', 'no'),
('9788403501904', 'discurso del metodo', 'descartes', 'anaya', 'si'),
('9788409058549', 'lazarillo de tormes', 'anonimo', 'planeta', 'si'),
('9788466664417', 'la odisea', 'homero', 'salvat', 'si'),
('9788467530698', 'la hiliada', 'homero', 'salvat', 'si'),
('9788494402111', 'la hiliada', 'homero', 'salvat', 'no');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `id` int(11) NOT NULL,
  `DNIusuario` varchar(9) NOT NULL,
  `ISBNobra` varchar(13) NOT NULL,
  `Fechasolicitud` date DEFAULT NULL,
  `Fechadevolucion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`id`, `DNIusuario`, `ISBNobra`, `Fechasolicitud`, `Fechadevolucion`) VALUES
(1, '49534218S', '9780762428212', '2019-02-14', '2019-02-20'),
(2, '18279179K', '9788409058549', '2019-03-17', '2019-03-20'),
(3, '77922959V', '9782919800995', '2019-03-17', '2019-03-21'),
(4, '77922959V', '9783195119016', '2019-03-18', '2019-03-26'),
(5, '49534218S', '9780762428212', '2019-03-18', NULL),
(6, '89281635M', '9788467530698', '2019-03-19', NULL),
(7, '89281635M', '9788403501904', '2019-03-19', NULL),
(8, '26724418M', '9788409058549', '2019-03-21', NULL),
(9, '26724418M', '9782919800995', '2019-03-22', '2019-04-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `DNI` varchar(9) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `deAlta` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`DNI`, `nombre`, `apellidos`, `deAlta`) VALUES
('18279179K', 'juan', 'segura', 'no'),
('26724418M', 'fernando', 'moncada', 'si'),
('49534218S', 'pedro', 'nadie', 'si'),
('77922959V', 'luis', 'falcon', 'si'),
('89281635M', 'antonio', 'garcia', 'si');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `obra`
--
ALTER TABLE `obra`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `DNIusuario` (`DNIusuario`),
  ADD KEY `ISBNobra` (`ISBNobra`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`DNI`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`DNIusuario`) REFERENCES `usuario` (`DNI`),
  ADD CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`ISBNobra`) REFERENCES `obra` (`ISBN`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
