-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-10-2019 a las 17:46:57
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `facturacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fact_cabeceras`
--

CREATE TABLE `fact_cabeceras` (
  `cab_numFact` varchar(12) NOT NULL,
  `cab_fecha` datetime NOT NULL,
  `cab_empleado` int(11) NOT NULL,
  `cab_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fact_cabeceras`
--

INSERT INTO `fact_cabeceras` (`cab_numFact`, `cab_fecha`, `cab_empleado`, `cab_cliente`) VALUES
('00000010', '2019-10-22 00:00:00', 2, 4),
('00000011', '2019-10-22 00:00:00', 2, 4),
('00000012', '2019-10-22 00:00:00', 2, 4),
('00000013', '2019-10-22 00:00:00', 2, 5),
('00000014', '2019-10-22 00:00:00', 2, 5),
('00000015', '2019-10-22 00:00:00', 2, 5),
('00000016', '2019-10-22 00:00:00', 2, 5),
('00000017', '2019-10-22 00:00:00', 2, 5),
('00000018', '2019-10-22 00:00:00', 2, 5),
('00000019', '2019-10-22 00:00:00', 2, 5),
('00000020', '2019-10-22 00:00:00', 2, 5),
('00000022', '2019-10-22 00:00:00', 2, 5),
('00000023', '2019-10-22 00:00:00', 2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fact_categorias`
--

CREATE TABLE `fact_categorias` (
  `cat_id` int(11) NOT NULL,
  `cat_descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fact_categorias`
--

INSERT INTO `fact_categorias` (`cat_id`, `cat_descripcion`) VALUES
(1, 'Lacteos'),
(2, 'Cerveza'),
(3, 'Galletas'),
(4, 'Dulces'),
(5, 'Snacks');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fact_clientes`
--

CREATE TABLE `fact_clientes` (
  `cli_id` int(11) NOT NULL,
  `cli_sexo` varchar(15) NOT NULL,
  `cli_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fact_clientes`
--

INSERT INTO `fact_clientes` (`cli_id`, `cli_sexo`, `cli_persona`) VALUES
(1, 'Masculino', 2),
(2, 'Masculino', 3),
(3, 'Femenino', 4),
(4, 's/g', 6),
(5, 'Masculino', 1),
(6, 'Femenino', 7),
(7, 'Masculino', 8),
(8, 'Femenino', 9),
(9, 'Masculino', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fact_departamentos`
--

CREATE TABLE `fact_departamentos` (
  `sd_id` int(11) NOT NULL,
  `sd_nombre` varchar(45) NOT NULL,
  `sd_sucursal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fact_departamentos`
--

INSERT INTO `fact_departamentos` (`sd_id`, `sd_nombre`, `sd_sucursal`) VALUES
(1, 'Cajero', 1),
(2, 'Gerente', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fact_detalles`
--

CREATE TABLE `fact_detalles` (
  `det_id` int(11) NOT NULL,
  `det_subtotal` decimal(8,2) NOT NULL,
  `det_subtotal12` double(8,2) NOT NULL,
  `det_iva` decimal(8,2) NOT NULL,
  `det_descuento` decimal(8,2) DEFAULT NULL,
  `det_total` decimal(8,2) NOT NULL,
  `det_cabecera` varchar(12) NOT NULL,
  `det_producto` varchar(12) NOT NULL,
  `det_cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fact_detalles`
--

INSERT INTO `fact_detalles` (`det_id`, `det_subtotal`, `det_subtotal12`, `det_iva`, `det_descuento`, `det_total`, `det_cabecera`, `det_producto`, `det_cantidad`) VALUES
(1, '0.00', 1.36, '0.60', '0.00', '1.42', '00000010', 'PRO-00000003', 2),
(2, '0.00', 2.00, '0.24', '0.00', '2.24', '00000020', 'PRO-00000001', 2),
(3, '0.00', 0.85, '0.10', '0.00', '0.95', '00000022', 'PRO-00000006', 1),
(4, '0.00', 3.00, '0.36', '0.00', '3.36', '00000023', 'PRO-00000008', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fact_det_pago`
--

CREATE TABLE `fact_det_pago` (
  `dp_id` int(11) NOT NULL,
  `dp_cantPago` decimal(8,2) NOT NULL,
  `dp_factura` varchar(12) NOT NULL,
  `dp_formaPago` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fact_det_pago`
--

INSERT INTO `fact_det_pago` (`dp_id`, `dp_cantPago`, `dp_factura`, `dp_formaPago`) VALUES
(1, '0.95', '00000022', 1),
(2, '3.36', '00000023', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fact_empleados`
--

CREATE TABLE `fact_empleados` (
  `emp_id` int(11) NOT NULL,
  `emp_clave` varchar(30) NOT NULL,
  `emp_fecIngreso` datetime NOT NULL,
  `emp_cargo` varchar(45) NOT NULL,
  `emp_salario` decimal(8,2) NOT NULL,
  `emp_fecNac` datetime NOT NULL,
  `emp_persona` int(11) NOT NULL,
  `emp_departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fact_empleados`
--

INSERT INTO `fact_empleados` (`emp_id`, `emp_clave`, `emp_fecIngreso`, `emp_cargo`, `emp_salario`, `emp_fecNac`, `emp_persona`, `emp_departamento`) VALUES
(1, 'pillaga', '2019-10-05 00:00:00', 'Cajero', '450.00', '1994-07-23 00:00:00', 1, 1),
(2, 'salas', '2019-10-01 00:00:00', 'Cajero', '750.00', '1992-05-18 00:00:00', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fact_empresas`
--

CREATE TABLE `fact_empresas` (
  `empr_id` int(11) NOT NULL,
  `empr_ruc` varchar(13) NOT NULL,
  `empr_razonSoc` varchar(100) NOT NULL,
  `empr_telefono` varchar(10) NOT NULL,
  `empr_direccion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fact_empresas`
--

INSERT INTO `fact_empresas` (`empr_id`, `empr_ruc`, `empr_razonSoc`, `empr_telefono`, `empr_direccion`) VALUES
(1, '0300830742001', 'deTodito', '4087264', 'Vega MuÃ±oz y Benigno Malo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fact_factnum`
--

CREATE TABLE `fact_factnum` (
  `num_id` int(11) NOT NULL,
  `num_nombre` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fact_factnum`
--

INSERT INTO `fact_factnum` (`num_id`, `num_nombre`) VALUES
(1, '1'),
(2, '2'),
(3, '3'),
(4, '4'),
(5, '5'),
(6, '6'),
(7, '7'),
(8, '8'),
(9, '9'),
(10, '10'),
(11, '11'),
(12, '12'),
(13, '13'),
(14, '14'),
(15, '15'),
(16, '16'),
(17, '17'),
(18, '18'),
(19, '19'),
(20, '20'),
(21, '21'),
(22, '22'),
(23, '23'),
(24, '24'),
(25, '25'),
(26, '26'),
(27, '27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fact_formapago`
--

CREATE TABLE `fact_formapago` (
  `forma_id` int(11) NOT NULL,
  `forma_descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fact_inventarios`
--

CREATE TABLE `fact_inventarios` (
  `inv_id` int(11) NOT NULL,
  `inv_cantidad` int(11) NOT NULL,
  `inv_fecha` datetime NOT NULL,
  `inv_fecExpiracion` datetime DEFAULT NULL,
  `inv_Compra` varchar(30) DEFAULT NULL,
  `inv_Venta` varchar(30) DEFAULT NULL,
  `inv_Estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fact_inventarios`
--

INSERT INTO `fact_inventarios` (`inv_id`, `inv_cantidad`, `inv_fecha`, `inv_fecExpiracion`, `inv_Compra`, `inv_Venta`, `inv_Estado`) VALUES
(1, 50, '2019-10-12 00:00:00', '2020-10-29 00:00:00', 'PRO-00000001', '', 'Compra'),
(2, 20, '2019-10-12 00:00:00', '2020-10-20 00:00:00', 'PRO-00000002', '', 'Compra'),
(3, 100, '2019-10-12 00:00:00', '2020-10-29 00:00:00', 'PRO-00000003', '', 'Compra'),
(4, 20, '2019-10-12 00:00:00', '2020-10-28 00:00:00', 'PRO-00000004', '', 'Compra'),
(5, 20, '2019-10-12 00:00:00', '2020-10-28 00:00:00', 'PRO-00000005', '', 'Compra'),
(6, 75, '2019-10-12 00:00:00', '2020-10-21 00:00:00', 'PRO-00000006', '', 'Compra'),
(7, 75, '2019-10-12 00:00:00', '2019-10-21 00:00:00', 'PRO-00000007', '', 'Compra'),
(8, 50, '2019-10-12 00:00:00', '2019-10-21 00:00:00', 'PRO-00000008', '', 'Compra'),
(9, 50, '2019-10-12 00:00:00', '2020-10-12 00:00:00', 'PRO-00000009', '', 'Compra'),
(10, 50, '2019-10-12 00:00:00', '2020-10-22 00:00:00', 'PRO-00000010', '', 'Compra'),
(11, 50, '2019-10-12 00:00:00', '2020-10-22 00:00:00', 'PRO-00000011', '', 'Compra'),
(12, 50, '2019-10-12 00:00:00', '2020-10-10 00:00:00', 'PRO-00000012', '', 'Compra'),
(13, 50, '2019-10-22 00:00:00', '2020-10-08 00:00:00', 'PRO-00000013', '', 'Compra'),
(14, 75, '2019-10-12 00:00:00', '2020-10-23 00:00:00', 'PRO-00000014', '', 'Compra'),
(15, 2, '2019-10-22 00:00:00', '2020-10-29 00:00:00', '', 'PRO-00000001', 'Venta'),
(16, 1, '2019-10-22 00:00:00', '2020-10-21 00:00:00', '', 'PRO-00000006', 'Venta'),
(17, 2, '2019-10-22 00:00:00', '2019-10-21 00:00:00', '', 'PRO-00000008', 'Venta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fact_personas`
--

CREATE TABLE `fact_personas` (
  `pers_id` int(11) NOT NULL,
  `pers_dni` varchar(13) DEFAULT NULL,
  `pers_nombre` varchar(50) NOT NULL,
  `pers_telefono` varchar(10) DEFAULT NULL,
  `pers_correo` varchar(100) DEFAULT NULL,
  `pers_direccion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fact_personas`
--

INSERT INTO `fact_personas` (`pers_id`, `pers_dni`, `pers_nombre`, `pers_telefono`, `pers_correo`, `pers_direccion`) VALUES
(1, '0105948012', 'Christian Pillaga', '0985793246', 'christian_pillaga_s@hotmail.es', 'Parque Miraflores'),
(2, '0300830742', 'Jorge Pillaga', '0995151717', 'pillaga@hotmail.com', 'Av. Miraflores'),
(3, '0105495576', 'Daniel Salas', '0984712012', 'dsalas@hotmail.com', 'El Vergel'),
(4, '0913360848', 'Miriam Arias', '072340175', 'marias@hotmail.com', 'Y del Cebollar'),
(6, '999999999', 'Consumidor Final', 's/t', 's/c', 's/d'),
(7, '0101635175', 'Elsa Bravo', '072475530', 'ebravo@hotmail.com', 'Ricaurte'),
(8, '0103962726', 'Roberto Cajamarca', '0984712010', 'rcajamarca@hotmail.com', 'Sinincay'),
(9, '0104071758', 'Ruth Carpio', '072809605', 'rcarpio@hotmail.com', 'Quingeo'),
(10, '0100053263', 'Jorge Durazno', '072888433', 'jdurazno@gmail.com', 'Crea'),
(11, '0992600950001', 'Nutri', '0988741201', 'nutri@hotmail.com', 'Cuenca'),
(12, '0990023549001', 'Pilsener', '042598888', 'pilsener@gmail.com', 'Guayaquil');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fact_productos`
--

CREATE TABLE `fact_productos` (
  `prod_id` varchar(12) NOT NULL,
  `prod_nombre` varchar(100) NOT NULL,
  `prod_descripcion` varchar(100) NOT NULL,
  `prod_PrecioU` decimal(8,2) NOT NULL,
  `prod_PrecioCosto` decimal(8,2) NOT NULL,
  `prod_iva` varchar(2) NOT NULL,
  `prod_proveedor` int(11) NOT NULL,
  `prod_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fact_productos`
--

INSERT INTO `fact_productos` (`prod_id`, `prod_nombre`, `prod_descripcion`, `prod_PrecioU`, `prod_PrecioCosto`, `prod_iva`, `prod_proveedor`, `prod_categoria`) VALUES
('PRO-00000001', 'Cerveza pilsener', 'Six Pack 125ml', '3.50', '2.75', 'Si', 2, 2),
('PRO-00000002', 'Cerveza Pilsener', 'Jaba 1 Litro', '20.00', '17.50', 'Si', 2, 2),
('PRO-00000003', 'Cerveza Pilsener', 'Botella Personal', '1.00', '0.70', 'Si', 2, 2),
('PRO-00000004', 'Cerveza Club', 'Six Pack 125ml', '3.75', '2.80', 'Si', 2, 2),
('PRO-00000005', 'Cerveza Club', 'Jabax12', '15.00', '13.50', 'Si', 2, 2),
('PRO-00000006', 'Leche Nutri', 'Semidescremada', '0.90', '0.70', 'Si', 1, 1),
('PRO-00000007', 'Leche Nutri', 'Entera', '0.85', '0.50', 'Si', 1, 1),
('PRO-00000008', 'Queso Nutri', 'Pequeño', '1.00', '0.85', 'Si', 1, 1),
('PRO-00000009', 'Queso Nutri', 'Mediano', '1.50', '1.10', 'Si', 1, 1),
('PRO-00000010', 'Crema de Leche Nutri', '200ml', '0.80', '0.50', 'Si', 1, 1),
('PRO-00000011', 'Yougurt Light', '1 Litro', '1.25', '1.00', 'Si', 1, 1),
('PRO-00000012', 'Yougurt Sabor Durazno', '1 Litro', '1.50', '1.25', 'Si', 1, 1),
('PRO-00000013', 'Yougurt Sabor Mora', '1 Litro', '1.50', '1.25', 'Si', 1, 1),
('PRO-00000014', 'Yougurt Conflex Durazno', 'Mix  200 G', '0.75', '0.50', 'Si', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fact_proveedores`
--

CREATE TABLE `fact_proveedores` (
  `prov_id` int(11) NOT NULL,
  `prov_razonSoc` varchar(100) NOT NULL,
  `prov_representante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fact_proveedores`
--

INSERT INTO `fact_proveedores` (`prov_id`, `prov_razonSoc`, `prov_representante`) VALUES
(1, 'Nutri S.A', 11),
(2, 'Cerveceria Nacional', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fact_sucursales`
--

CREATE TABLE `fact_sucursales` (
  `suc_id` int(11) NOT NULL,
  `suc_nombre` varchar(50) NOT NULL,
  `suc_extension` varchar(10) NOT NULL,
  `suc_empresa` int(11) NOT NULL,
  `suc_Direccion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fact_sucursales`
--

INSERT INTO `fact_sucursales` (`suc_id`, `suc_nombre`, `suc_extension`, `suc_empresa`, `suc_Direccion`) VALUES
(1, 'Sucursal A', '405', 1, 'Sebastian de Benalcazar y Del Chorro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fact_suc_prods`
--

CREATE TABLE `fact_suc_prods` (
  `sp_id` int(11) NOT NULL,
  `sp_stock` int(11) NOT NULL,
  `sp_sucursal` int(11) NOT NULL,
  `sp_producto` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fact_suc_prods`
--

INSERT INTO `fact_suc_prods` (`sp_id`, `sp_stock`, `sp_sucursal`, `sp_producto`) VALUES
(1, 46, 1, 'PRO-00000001'),
(2, 20, 1, 'PRO-00000002'),
(3, 100, 1, 'PRO-00000003'),
(4, 20, 1, 'PRO-00000004'),
(5, 20, 1, 'PRO-00000005'),
(6, 67, 1, 'PRO-00000006'),
(7, 75, 1, 'PRO-00000007'),
(8, 48, 1, 'PRO-00000008'),
(9, 50, 1, 'PRO-00000009'),
(10, 48, 1, 'PRO-00000010'),
(11, 47, 1, 'PRO-00000011'),
(12, 40, 1, 'PRO-00000012'),
(13, 40, 1, 'PRO-00000013'),
(14, 74, 1, 'PRO-00000014');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `fact_cabeceras`
--
ALTER TABLE `fact_cabeceras`
  ADD PRIMARY KEY (`cab_numFact`),
  ADD KEY `fk_FACT_CABECERAS_FACT_EMPLEADOS1_idx` (`cab_empleado`),
  ADD KEY `fk_FACT_CABECERAS_FACT_CLIENTES1_idx` (`cab_cliente`);

--
-- Indices de la tabla `fact_categorias`
--
ALTER TABLE `fact_categorias`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indices de la tabla `fact_clientes`
--
ALTER TABLE `fact_clientes`
  ADD PRIMARY KEY (`cli_id`),
  ADD UNIQUE KEY `fk_FACT_CLIENTES_FACT_PRESONAS1_idx` (`cli_persona`) USING BTREE;

--
-- Indices de la tabla `fact_departamentos`
--
ALTER TABLE `fact_departamentos`
  ADD PRIMARY KEY (`sd_id`),
  ADD KEY `fk_FACT_DEPARTAMENTOS_FACT_SUCURSALES1_idx` (`sd_sucursal`);

--
-- Indices de la tabla `fact_detalles`
--
ALTER TABLE `fact_detalles`
  ADD PRIMARY KEY (`det_id`),
  ADD KEY `fk_FACT_DETALLES_FACT_CABECERAS1_idx` (`det_cabecera`),
  ADD KEY `fk_FACT_DETALLES_FACT_SUC_PRODS1_idx` (`det_producto`);

--
-- Indices de la tabla `fact_det_pago`
--
ALTER TABLE `fact_det_pago`
  ADD PRIMARY KEY (`dp_id`),
  ADD KEY `fk_FACT_FORMAPAGOS_FACT_DETALLES1_idx` (`dp_factura`),
  ADD KEY `fk_FACT_DET_PAGO_FACT_FORMAPAGO1_idx` (`dp_formaPago`);

--
-- Indices de la tabla `fact_empleados`
--
ALTER TABLE `fact_empleados`
  ADD PRIMARY KEY (`emp_id`),
  ADD UNIQUE KEY `fk_FACT_EMPLEADOS_FACT_PRESONAS1_idx` (`emp_persona`) USING BTREE,
  ADD KEY `fk_FACT_EMPLEADOS_FACT_SUC_DPTS1_idx` (`emp_departamento`);

--
-- Indices de la tabla `fact_empresas`
--
ALTER TABLE `fact_empresas`
  ADD PRIMARY KEY (`empr_id`);

--
-- Indices de la tabla `fact_factnum`
--
ALTER TABLE `fact_factnum`
  ADD PRIMARY KEY (`num_id`);

--
-- Indices de la tabla `fact_formapago`
--
ALTER TABLE `fact_formapago`
  ADD PRIMARY KEY (`forma_id`);

--
-- Indices de la tabla `fact_inventarios`
--
ALTER TABLE `fact_inventarios`
  ADD PRIMARY KEY (`inv_id`);

--
-- Indices de la tabla `fact_personas`
--
ALTER TABLE `fact_personas`
  ADD PRIMARY KEY (`pers_id`),
  ADD UNIQUE KEY `pers_dni_UNIQUE` (`pers_dni`);

--
-- Indices de la tabla `fact_productos`
--
ALTER TABLE `fact_productos`
  ADD PRIMARY KEY (`prod_id`),
  ADD KEY `fk_FACT_PRODUCTOS_FACT_PROVEEDORES1_idx` (`prod_proveedor`),
  ADD KEY `fk_FACT_PRODUCTOS_FACT_CATEGORIAS1_idx` (`prod_categoria`);

--
-- Indices de la tabla `fact_proveedores`
--
ALTER TABLE `fact_proveedores`
  ADD PRIMARY KEY (`prov_id`),
  ADD KEY `fk_FACT_PROVEEDORES_FACT_PRESONAS1_idx` (`prov_representante`);

--
-- Indices de la tabla `fact_sucursales`
--
ALTER TABLE `fact_sucursales`
  ADD PRIMARY KEY (`suc_id`),
  ADD KEY `fk_FACT_SUCURSALES_FACT_EMPRESAS_idx` (`suc_empresa`);

--
-- Indices de la tabla `fact_suc_prods`
--
ALTER TABLE `fact_suc_prods`
  ADD PRIMARY KEY (`sp_id`),
  ADD KEY `fk_FACT_SUC_PRODS_FACT_SUCURSALES1_idx` (`sp_sucursal`),
  ADD KEY `fk_FACT_SUC_PRODS_FACT_PRODUCTOS1_idx` (`sp_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `fact_categorias`
--
ALTER TABLE `fact_categorias`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `fact_clientes`
--
ALTER TABLE `fact_clientes`
  MODIFY `cli_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `fact_departamentos`
--
ALTER TABLE `fact_departamentos`
  MODIFY `sd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `fact_detalles`
--
ALTER TABLE `fact_detalles`
  MODIFY `det_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `fact_det_pago`
--
ALTER TABLE `fact_det_pago`
  MODIFY `dp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `fact_empleados`
--
ALTER TABLE `fact_empleados`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `fact_empresas`
--
ALTER TABLE `fact_empresas`
  MODIFY `empr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `fact_factnum`
--
ALTER TABLE `fact_factnum`
  MODIFY `num_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `fact_formapago`
--
ALTER TABLE `fact_formapago`
  MODIFY `forma_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fact_inventarios`
--
ALTER TABLE `fact_inventarios`
  MODIFY `inv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `fact_personas`
--
ALTER TABLE `fact_personas`
  MODIFY `pers_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `fact_proveedores`
--
ALTER TABLE `fact_proveedores`
  MODIFY `prov_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `fact_sucursales`
--
ALTER TABLE `fact_sucursales`
  MODIFY `suc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `fact_suc_prods`
--
ALTER TABLE `fact_suc_prods`
  MODIFY `sp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
