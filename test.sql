-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-08-2021 a las 20:42:29
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `test`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `farmacia`
--

CREATE TABLE `farmacia` (
  `nro_cliente` int(11) NOT NULL,
  `nombre_fcia` varchar(100) DEFAULT NULL,
  `fk_localidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `id_localidad` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `fk_provincia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pc`
--

CREATE TABLE `pc` (
  `id_ip_publica` varchar(25) NOT NULL,
  `fk_nro_cliente` int(11) DEFAULT NULL,
  `anydesk` varchar(50) DEFAULT NULL,
  `fecha_releveamiento` date DEFAULT NULL,
  `nombre_pc` varchar(100) DEFAULT NULL,
  `ip_privada` varchar(25) DEFAULT NULL,
  `arquitectura_so` varchar(10) DEFAULT NULL,
  `tipo_maquina` varchar(100) DEFAULT NULL,
  `version_so` varchar(50) DEFAULT NULL,
  `procesador` varchar(100) DEFAULT NULL,
  `cores_fisicos` int(11) DEFAULT NULL,
  `cores_totales` int(11) DEFAULT NULL,
  `ram_total` varchar(50) DEFAULT NULL,
  `ram_usada` varchar(50) DEFAULT NULL,
  `ram_disponible` varchar(50) DEFAULT NULL,
  `espacio_tot_C` varchar(50) DEFAULT NULL,
  `espacio_usado_C` varchar(50) DEFAULT NULL,
  `espacio_disp_C` varchar(50) DEFAULT NULL,
  `porcen_espacio_C` varchar(50) DEFAULT NULL,
  `espacio_tot_D` varchar(50) DEFAULT NULL,
  `espacio_usado_D` varchar(50) DEFAULT NULL,
  `espacio_disp_D` varchar(50) DEFAULT NULL,
  `porcen_espacio_D` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `id_perfil` varchar(50) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas_aceptados`
--

CREATE TABLE `programas_aceptados` (
  `id_programa` int(11) NOT NULL,
  `fecha_install` date DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `version` varchar(100) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas_instalados`
--

CREATE TABLE `programas_instalados` (
  `id_programa` int(11) NOT NULL,
  `fk_ip_publica` varchar(100) DEFAULT NULL,
  `fecha_install` date DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `version` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `id_provincia` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` varchar(100) NOT NULL,
  `fk_perfil` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `farmacia`
--
ALTER TABLE `farmacia`
  ADD PRIMARY KEY (`nro_cliente`),
  ADD KEY `fk_localidad` (`fk_localidad`);

--
-- Indices de la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`id_localidad`),
  ADD UNIQUE KEY `descripcion` (`descripcion`),
  ADD KEY `fk_provincia` (`fk_provincia`);

--
-- Indices de la tabla `pc`
--
ALTER TABLE `pc`
  ADD PRIMARY KEY (`id_ip_publica`),
  ADD UNIQUE KEY `fk_nro_cliente` (`fk_nro_cliente`),
  ADD UNIQUE KEY `anydesk` (`anydesk`),
  ADD UNIQUE KEY `nombre_pc` (`nombre_pc`),
  ADD UNIQUE KEY `ip_privada` (`ip_privada`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id_perfil`),
  ADD UNIQUE KEY `descripcion` (`descripcion`);

--
-- Indices de la tabla `programas_aceptados`
--
ALTER TABLE `programas_aceptados`
  ADD PRIMARY KEY (`id_programa`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `programas_instalados`
--
ALTER TABLE `programas_instalados`
  ADD PRIMARY KEY (`id_programa`),
  ADD KEY `fk_ip_publica` (`fk_ip_publica`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id_provincia`),
  ADD UNIQUE KEY `descripcion` (`descripcion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD KEY `fk_perfil` (`fk_perfil`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `programas_aceptados`
--
ALTER TABLE `programas_aceptados`
  MODIFY `id_programa` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `farmacia`
--
ALTER TABLE `farmacia`
  ADD CONSTRAINT `farmacia_ibfk_1` FOREIGN KEY (`fk_localidad`) REFERENCES `localidad` (`id_localidad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD CONSTRAINT `localidad_ibfk_1` FOREIGN KEY (`fk_provincia`) REFERENCES `provincia` (`id_provincia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pc`
--
ALTER TABLE `pc`
  ADD CONSTRAINT `pc_ibfk_1` FOREIGN KEY (`fk_nro_cliente`) REFERENCES `farmacia` (`nro_cliente`);

--
-- Filtros para la tabla `programas_instalados`
--
ALTER TABLE `programas_instalados`
  ADD CONSTRAINT `programas_instalados_ibfk_1` FOREIGN KEY (`fk_ip_publica`) REFERENCES `pc` (`id_ip_publica`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`fk_perfil`) REFERENCES `perfil` (`id_perfil`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
