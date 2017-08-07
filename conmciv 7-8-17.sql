-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.25-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para logistica_conmiciv
CREATE DATABASE IF NOT EXISTS `logistica_conmiciv` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `logistica_conmiciv`;


-- Volcando estructura para tabla logistica_conmiciv.almacen
CREATE TABLE IF NOT EXISTS `almacen` (
  `alm_cd` int(11) NOT NULL AUTO_INCREMENT,
  `alm_ds` varchar(30) DEFAULT NULL,
  `ubicacion` varchar(60) DEFAULT NULL,
  `est` char(2) DEFAULT 'si',
  PRIMARY KEY (`alm_cd`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla logistica_conmiciv.almacen: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
INSERT INTO `almacen` (`alm_cd`, `alm_ds`, `ubicacion`, `est`) VALUES
	(1, 'Almacen01', 'Taller Chorrillos', 'si');
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;


-- Volcando estructura para tabla logistica_conmiciv.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `cat_cd` int(11) NOT NULL AUTO_INCREMENT,
  `cat_ds` varchar(30) DEFAULT NULL,
  `est` char(2) DEFAULT 'si',
  PRIMARY KEY (`cat_cd`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla logistica_conmiciv.categoria: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`cat_cd`, `cat_ds`, `est`) VALUES
	(1, 'Filtros', 'si'),
	(2, 'Insumo', 'si'),
	(3, 'Neumaticos', 'si');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;


-- Volcando estructura para tabla logistica_conmiciv.componente
CREATE TABLE IF NOT EXISTS `componente` (
  `compo_cd` int(11) NOT NULL AUTO_INCREMENT,
  `compo_ds` varchar(50) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `nparte` varchar(30) DEFAULT NULL,
  `nparte_2` varchar(30) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `stock_min` int(11) DEFAULT NULL,
  `marca` varchar(30) DEFAULT NULL,
  `modelo` varchar(20) DEFAULT NULL,
  `n_serie` varchar(30) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `ubicacion` varchar(10) DEFAULT NULL,
  `cat_cd` int(11) DEFAULT NULL,
  `alm_cd` int(11) DEFAULT NULL,
  `est` char(2) DEFAULT 'si',
  PRIMARY KEY (`compo_cd`),
  KEY `cat_cd` (`cat_cd`),
  KEY `alm_cd` (`alm_cd`),
  CONSTRAINT `componente_ibfk_1` FOREIGN KEY (`cat_cd`) REFERENCES `categoria` (`cat_cd`),
  CONSTRAINT `componente_ibfk_2` FOREIGN KEY (`alm_cd`) REFERENCES `almacen` (`alm_cd`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla logistica_conmiciv.componente: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `componente` DISABLE KEYS */;
INSERT INTO `componente` (`compo_cd`, `compo_ds`, `descripcion`, `nparte`, `nparte_2`, `stock`, `stock_min`, `marca`, `modelo`, `n_serie`, `estado`, `ubicacion`, `cat_cd`, `alm_cd`, `est`) VALUES
	(1, 'Filtro de aire primario', NULL, 'p545454', '10510658', 10, 0, 'donalsond', NULL, NULL, 'nuevo', '9-A', 1, 1, 'si'),
	(2, 'Filtro de aceite', NULL, 'P8545', '7050545', 15, 0, 'donalsond', NULL, NULL, 'nuevo', '9-A', 1, 1, 'si'),
	(3, 'Seal kit de levante', 'Seal kit de levante para el r1300', '1445645', NULL, 2, 0, 'cat', NULL, NULL, 'nuevo', '5-C', 2, 1, 'si'),
	(4, 'Seal kit de volteo', 'Seal kit de volteo - R1300', '2442210', NULL, 5, NULL, 'cat', NULL, NULL, 'nuevo', '5-C', 2, 1, 'si'),
	(5, 'Cable de avance - Quasar', 'cable de avance punta a punta 5.10', '201547454', NULL, 2, 0, 'sandvik', NULL, NULL, NULL, NULL, 2, 1, 'si');
/*!40000 ALTER TABLE `componente` ENABLE KEYS */;


-- Volcando estructura para tabla logistica_conmiciv.destino
CREATE TABLE IF NOT EXISTS `destino` (
  `dest_cd` int(11) NOT NULL AUTO_INCREMENT,
  `dest_ds` varchar(30) DEFAULT NULL,
  `d_direccion` varchar(50) DEFAULT NULL,
  `empdes_cd` int(11) DEFAULT NULL,
  `est` char(2) DEFAULT 'si',
  PRIMARY KEY (`dest_cd`),
  KEY `empdes_cd` (`empdes_cd`),
  CONSTRAINT `destino_ibfk_1` FOREIGN KEY (`empdes_cd`) REFERENCES `emp_destino` (`empdes_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla logistica_conmiciv.destino: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `destino` DISABLE KEYS */;
/*!40000 ALTER TABLE `destino` ENABLE KEYS */;


-- Volcando estructura para tabla logistica_conmiciv.detalle_salida
CREATE TABLE IF NOT EXISTS `detalle_salida` (
  `sal_cd` int(11) DEFAULT NULL,
  `equipo_cd` int(11) DEFAULT NULL,
  `grupo_cd` int(11) DEFAULT NULL,
  `compo_cd` int(11) DEFAULT NULL,
  `est` char(2) DEFAULT 'si'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla logistica_conmiciv.detalle_salida: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_salida` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_salida` ENABLE KEYS */;


-- Volcando estructura para tabla logistica_conmiciv.empleado
CREATE TABLE IF NOT EXISTS `empleado` (
  `empl_cd` int(11) NOT NULL AUTO_INCREMENT,
  `empl_nom` varchar(50) DEFAULT NULL,
  `empl_ape` varchar(50) DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `lincencia` varchar(10) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `clave` varchar(15) DEFAULT NULL,
  `tipou_cd` int(11) DEFAULT NULL,
  `est` char(2) DEFAULT 'si',
  PRIMARY KEY (`empl_cd`),
  KEY `tipou_cd` (`tipou_cd`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`tipou_cd`) REFERENCES `tipo_usu` (`tipou_cd`),
  CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`tipou_cd`) REFERENCES `tipo_usu` (`tipou_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla logistica_conmiciv.empleado: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;


-- Volcando estructura para tabla logistica_conmiciv.empresa
CREATE TABLE IF NOT EXISTS `empresa` (
  `emp_cd` int(11) NOT NULL AUTO_INCREMENT,
  `emp_rz` varchar(50) DEFAULT NULL,
  `emp_ruc` int(11) DEFAULT NULL,
  `emp_direccion` varchar(40) DEFAULT NULL,
  `est` char(2) DEFAULT 'si',
  PRIMARY KEY (`emp_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla logistica_conmiciv.empresa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;


-- Volcando estructura para tabla logistica_conmiciv.emp_destino
CREATE TABLE IF NOT EXISTS `emp_destino` (
  `empdes_cd` int(11) NOT NULL AUTO_INCREMENT,
  `empdes_ds` varchar(50) DEFAULT NULL,
  `empdes_ruc` int(11) DEFAULT NULL,
  `est` char(2) DEFAULT 'si',
  PRIMARY KEY (`empdes_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla logistica_conmiciv.emp_destino: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `emp_destino` DISABLE KEYS */;
/*!40000 ALTER TABLE `emp_destino` ENABLE KEYS */;


-- Volcando estructura para tabla logistica_conmiciv.equipo
CREATE TABLE IF NOT EXISTS `equipo` (
  `equipo_cd` int(11) NOT NULL AUTO_INCREMENT,
  `equipo_ds` varchar(30) DEFAULT NULL,
  `modelo` varchar(30) DEFAULT NULL,
  `marca` varchar(30) DEFAULT NULL,
  `n_serie` varchar(30) DEFAULT NULL,
  `a_fabri` year(4) DEFAULT NULL,
  `estado_equipo` varchar(30) DEFAULT NULL,
  `est` char(2) DEFAULT 'si',
  PRIMARY KEY (`equipo_cd`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla logistica_conmiciv.equipo: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` (`equipo_cd`, `equipo_ds`, `modelo`, `marca`, `n_serie`, `a_fabri`, `estado_equipo`, `est`) VALUES
	(1, 'sca110/R1300', 'R1300', 'catterpillar', NULL, '2013', 'Operativo', 'si'),
	(2, 'SCA135/R1300', 'R1300', 'catterpillar', NULL, '2010', 'Operativo', 'si'),
	(3, 'NO EQUIPO', NULL, NULL, NULL, NULL, NULL, 'no');
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;


-- Volcando estructura para tabla logistica_conmiciv.grupo
CREATE TABLE IF NOT EXISTS `grupo` (
  `grupo_cd` int(11) NOT NULL AUTO_INCREMENT,
  `grupo_ds` varchar(50) DEFAULT NULL,
  `est` char(2) DEFAULT 'si',
  PRIMARY KEY (`grupo_cd`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla logistica_conmiciv.grupo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` (`grupo_cd`, `grupo_ds`, `est`) VALUES
	(1, 'Repuestos Criticos DD311/P4', 'si'),
	(2, 'Jumbos CMH', 'si'),
	(3, 'Jumbos DD311', 'si'),
	(4, 'Jumbos DS311', 'si'),
	(5, 'Equipos Cat', 'si'),
	(6, 'Sin grupo', 'no');
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;


-- Volcando estructura para tabla logistica_conmiciv.proveedor
CREATE TABLE IF NOT EXISTS `proveedor` (
  `prov_cd` int(11) NOT NULL AUTO_INCREMENT,
  `prov_rz` varchar(40) DEFAULT NULL,
  `direccion_p` varchar(50) DEFAULT NULL,
  `ruc_p` int(11) DEFAULT NULL,
  `est` char(2) DEFAULT 'si',
  PRIMARY KEY (`prov_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla logistica_conmiciv.proveedor: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;


-- Volcando estructura para tabla logistica_conmiciv.tipo_usu
CREATE TABLE IF NOT EXISTS `tipo_usu` (
  `tipou_cd` int(11) NOT NULL AUTO_INCREMENT,
  `tipou_ds` varchar(30) DEFAULT NULL,
  `est` char(2) DEFAULT 'si',
  PRIMARY KEY (`tipou_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla logistica_conmiciv.tipo_usu: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_usu` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_usu` ENABLE KEYS */;


-- Volcando estructura para tabla logistica_conmiciv.transp
CREATE TABLE IF NOT EXISTS `transp` (
  `trans_cd` int(11) NOT NULL AUTO_INCREMENT,
  `trans_rz` varchar(50) DEFAULT NULL,
  `trans_ruc` int(11) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `est` char(2) DEFAULT 'si',
  PRIMARY KEY (`trans_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla logistica_conmiciv.transp: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `transp` DISABLE KEYS */;
/*!40000 ALTER TABLE `transp` ENABLE KEYS */;


-- Volcando estructura para tabla logistica_conmiciv.unidad
CREATE TABLE IF NOT EXISTS `unidad` (
  `uni_cd` int(11) NOT NULL AUTO_INCREMENT,
  `uni_ds` varchar(50) DEFAULT NULL,
  `est` char(2) DEFAULT 'si',
  PRIMARY KEY (`uni_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla logistica_conmiciv.unidad: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `unidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidad` ENABLE KEYS */;


-- Volcando estructura para procedimiento logistica_conmiciv.V_COMPO
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `V_COMPO`()
begin
	select c.compo_cd,c.compo_ds,c.descripcion,c.nparte,c.nparte_2,c.stock,c.stock_min,c.marca,c.modelo,c.n_serie,c.estado,c.ubicacion,c.cat_cd,ca.cat_ds,c.alm_cd,a.alm_ds,c.est
from componente c 
inner join almacen a on a.alm_cd = c.alm_cd
inner join categoria ca on ca.cat_cd = c.cat_cd where c.est = 'si';
end//
DELIMITER ;


-- Volcando estructura para procedimiento logistica_conmiciv.V_EQUIPO
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `V_EQUIPO`()
begin 
	select * from equipo where est = 'si';
end//
DELIMITER ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
