-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-09-2023 a las 23:35:21
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ecommerce`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(2) NOT NULL,
  `nombre_categoria` varchar(50) NOT NULL,
  `activo` char(1) NOT NULL DEFAULT 'S'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre_categoria`, `activo`) VALUES
(1, 'Celulares', 'S'),
(2, 'SmartWatch', 'S'),
(3, 'Tablets', 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id_comentario` int(2) NOT NULL,
  `id_producto` int(2) NOT NULL,
  `id_usuario` int(2) NOT NULL,
  `comentario` varchar(160) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id_marca` int(2) NOT NULL,
  `nombre_marca` varchar(50) NOT NULL,
  `activo` char(1) NOT NULL DEFAULT 'S'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_marca`, `nombre_marca`, `activo`) VALUES
(1, 'Samsung', 'S'),
(3, 'Xiaomi', 'S'),
(4, 'Motorola', 'S'),
(5, 'Huawei', 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(2) NOT NULL,
  `nombre_producto` varchar(70) NOT NULL,
  `id_categoria` int(2) NOT NULL,
  `id_marca` int(2) NOT NULL,
  `modelo` int(4) NOT NULL,
  `referencia` varchar(80) NOT NULL,
  `precio` varchar(30) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `especificaciones` varchar(120) NOT NULL,
  `imagen` varchar(70) DEFAULT NULL,
  `cantidad` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre_producto`, `id_categoria`, `id_marca`, `modelo`, `referencia`, `precio`, `descripcion`, `especificaciones`, `imagen`, `cantidad`) VALUES
(2, 'SAMSUNG A54', 1, 1, 2023, 'A54', '1500000', 'Samsung Galaxy A54 color Negro', 'CELULAR SAMSUNG A54 CON 2GB RAM, PROCESADOR DE 20 NUCLEOS CAMARA DE 100MPX.', 'samsung_A54.webp', 0),
(3, 'Samsung A34', 1, 1, 2023, 'Samsung Galaxy A34', '900000', 'Colores Negro y Verde', 'CELULAR SAMSUNG A54 CON 2GB RAM, PROCESADOR DE 10 NUCLEOS CAMARA DE 50MPX.', 'samsung_A34.jpg', 2),
(4, 'Redmi note 12', 1, 3, 2023, 'Xoami Redmi note 12', '850000', 'Colores Azul y Verde', 'Celular Redmi Note 12 CON 2GB RAM, PROCESADOR DE 15 NUCLEOS CAMARA DE 40MPX.', 'redminote_12.jpg', 2),
(5, 'Redmi note 11', 1, 3, 2023, 'Xoami Redmi note 11', '750000', 'Colores Azul y Negro', 'Celular Redmi Note 11 CON 2GB RAM, PROCESADOR DE 10 NUCLEOS CAMARA DE 20MPX.', 'redminote_11.webp', 1),
(6, 'Moto G30', 1, 4, 2023, 'Motororal Moto G30', '950000', 'Colores Negro y Azul', 'Celular Moto G30 CON 2GB RAM, PROCESADOR DE 16 NUCLEOS CAMARA DE 30MPX.', 'motog30.jpg', 2),
(7, 'Moto G40', 1, 4, 2023, 'Motororal Moto G40', '1050000', 'Colores Verde y Azul', 'Celular Moto G40 CON 2GB RAM, PROCESADOR DE 20 NUCLEOS CAMARA DE 50MPX.', 'motog40.jpg', 2),
(8, 'Huawei P60', 1, 5, 2023, 'HUAWEI P60', '950000', 'Colores Negro y Azul', 'HUAWEI P60 CON 2GB RAM, PROCESADOR DE 25 NUCLEOS CAMARA DE 40MPX.', 'huaweip60.png', 2),
(9, 'Huawei P50', 1, 5, 2023, 'HUAWEI P50', '850000', 'Colores Negro y Rojo', 'HUAWEI P50 CON 2GB RAM, PROCESADOR DE 30 NUCLEOS CAMARA DE 30MPX.', 'huaweip50.jpg', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(2) NOT NULL,
  `nombre_usuario` varchar(70) NOT NULL,
  `correo` varchar(70) NOT NULL,
  `activo` char(1) NOT NULL DEFAULT 'S'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id_comentario`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`),
  ADD KEY `id_marca` (`id_marca`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
