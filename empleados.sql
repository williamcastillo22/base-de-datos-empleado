-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 31-03-2025 a las 03:58:45
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empleados`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `categorialacteos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `categorialacteos` ()   BEGIN
SELECT * FROM miscelanea WHERE categoria = 'lacteos';
END$$

DROP PROCEDURE IF EXISTS `domicilio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `domicilio` ()   BEGIN
SELECT * FROM empleado_general WHERE domicilio_empleado LIKE '%lazaro cardenas%';
END$$

DROP PROCEDURE IF EXISTS `domicilio_colonia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `domicilio_colonia` ()   BEGIN
SELECT * FROM empleado_general WHERE domicilio_empleado LIKE '%col%';
END$$

DROP PROCEDURE IF EXISTS `empleados`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `empleados` ()   BEGIN
SELECT * FROM empleado_general;
END$$

DROP PROCEDURE IF EXISTS `fechas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `fechas` ()   BEGIN
SELECT MAX(fecha_actualizacion) AS ultima_actualizacion FROM miscelanea;
END$$

DROP PROCEDURE IF EXISTS `mayores_a_30`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mayores_a_30` ()   BEGIN
SELECT * FROM empleado_general WHERE edad_empleado > 30;
END$$

DROP PROCEDURE IF EXISTS `menor_edad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `menor_edad` ()   BEGIN
SELECT * FROM empleado_general ORDER BY edad_empleado ASC LIMIT 1;
END$$

DROP PROCEDURE IF EXISTS `precios`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `precios` ()   SELECT valor
FROM miscelanea 
ORDER BY CAST(REPLACE(REPLACE(valor, '$', ''), ' pesos', '') AS UNSIGNED) DESC 
LIMIT 1$$

DROP PROCEDURE IF EXISTS `preservativos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `preservativos` ()   BEGIN
SELECT * FROM miscelanea WHERE categoria = 'preservativos';
END$$

DROP PROCEDURE IF EXISTS `producto_dulces`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `producto_dulces` ()   BEGIN
SELECT * FROM miscelanea WHERE categoria = 'dulces';
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_general`
--

DROP TABLE IF EXISTS `empleado_general`;
CREATE TABLE IF NOT EXISTS `empleado_general` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre_empleado` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `edad_empleado` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `correo_empleado` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `domicilio_empleado` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`id_empleado`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `empleado_general`
--

INSERT INTO `empleado_general` (`id_empleado`, `nombre_empleado`, `edad_empleado`, `correo_empleado`, `domicilio_empleado`) VALUES
(1, 'david alejandro', '22 años', 'alex@gmail.com', 'col. bellavista'),
(2, 'deniss ochoa', '20 años', 'ochoa@gmail.com', 'col. buenos aires'),
(3, 'andres martinez', '32 años', 'andy@gmail.com', 'col. san jose'),
(4, 'kevin barcenas', '30 años', 'kvin@gmail.com', 'col. san jose'),
(5, 'daniela santiago', '25 años', 'daniela@gmail.com', 'los arcos'),
(6, 'carlos soto', '26 años', 'charly@gmail.com', 'doraceli'),
(7, 'erick landaverde', '40 años', 'erin@gmail.com', 'lazaro cardenas'),
(8, 'horacio chavez', '55 años', 'chavez@gmail.com', 'lazaro cardenas'),
(9, 'rosario hernandez', '17 años', 'chayo@gmail.com', 'col. san rafael'),
(10, 'rolando conriquez', '44 años', 'rolando@gmail.com', 'santa rosa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miscelanea`
--

DROP TABLE IF EXISTS `miscelanea`;
CREATE TABLE IF NOT EXISTS `miscelanea` (
  `id_miscelanea` int NOT NULL AUTO_INCREMENT,
  `codigo_producto` int NOT NULL,
  `categoria` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `descripcion` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `valor` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `fecha_actualizacion` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`id_miscelanea`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `miscelanea`
--

INSERT INTO `miscelanea` (`id_miscelanea`, `codigo_producto`, `categoria`, `descripcion`, `valor`, `fecha_actualizacion`) VALUES
(1, 101010, 'lacteos', 'leche entera', '$25 pesos 1lt', '10 de agosto 2020'),
(2, 2222, 'dulces', 'paletas chile bomba', '$5 pesos c/u', '13 de julio 2020'),
(3, 11111, 'aceites', 'aceite patrona', '$30 pesos 1lt', '30 de agosto 2020'),
(4, 3443, 'plasticos', 'vasos de plastico', '$30 pesos paq', '14 de agosto 2020'),
(5, 2661, 'sabritas', 'takis fuego', '$20 pesos c/u', '28 de agosto 2020'),
(6, 101010, 'lacteos', 'leche deslactosada', '$30 pesos 1lt', '7 de septiembre 2020'),
(7, 101010, 'lacteos', 'leche de soya', '$35 pesos', '10 de septiembre 2020'),
(8, 2661, 'sabritas', 'doritos dinamita', '$18 pesos c/u', '12 de septiembre 2020'),
(9, 2222, 'dulces', 'rockaleta', '$10 pesos c/u', '20 de septiembre 2020'),
(10, 2222, 'dulces', 'chicles', '$2 pesos c/u', '22 de septiembre 2020'),
(11, 3443, 'plasticos', 'cucharas de plastico', '$28 pesos paq', '1 de octubre 2020'),
(12, 3443, 'plasticos', 'tenedores de plastico', '$30 pesos paq', '3 de octubre 2020'),
(13, 11111, 'aceites', 'aceite nutrioli', '$45 pesos 1lt', '1 de noviembre 2020'),
(14, 666, 'preservativos', 'preservativo trojan', '$100 pesos paq', '1 de enero 2021'),
(15, 666, 'preservativos', 'preservativo sico', '$80 pesos paq', '26 de diciembre 2020'),
(16, 101010, 'lacteos', 'leche entera 1lt, nueva descripción', '28.00', '2025-03-30 20:24:30'),
(17, 2222, 'dulces', 'paletas chile bomba c/u', '5.00', '2020-07-13'),
(18, 11111, 'aceites', 'aceite patrona 1lt', '30.00', '2020-08-30'),
(19, 3443, 'plasticos', 'vasos de plastico por paquete', '30.00', '2020-08-14'),
(20, 2661, 'sabritas', 'takis fuego c/u', '20.00', '2020-08-28'),
(21, 101010, 'lacteos', 'leche deslactosada 1lt', '30.00', '2020-09-07'),
(22, 101010, 'lacteos', 'leche de soya 1lt', '35.00', '2020-09-10'),
(23, 2661, 'sabritas', 'doritos dinamita c/u', '18.00', '2020-09-12'),
(24, 2222, 'dulces', 'rockaleta c/u', '10.00', '2020-09-20'),
(25, 2222, 'dulces', 'chicles c/u', '2.00', '2020-09-22'),
(26, 3443, 'plasticos', 'cucharas de plastico por paquete', '28.00', '2020-10-01'),
(27, 3443, 'plasticos', 'tenedores de plastico por paquete', '30.00', '2020-10-03'),
(28, 11111, 'aceites', 'aceite nutrioli 1lt', '45.00', '2020-11-01'),
(29, 666, 'preservativos', 'preservativo trojan por paquete', '100.00', '2021-01-01'),
(30, 666, 'preservativos', 'preservativo sico por paquete', '80.00', '2020-12-26');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
