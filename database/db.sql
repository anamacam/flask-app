-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` varchar(24) NOT NULL,
  `clave` varchar(32) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `fecha_nacimento` text NOT NULL,
  `dni` int(24) NOT NULL,
  `id_cuenta` tinyint(4) NOT NULL,
  `email` int(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE `cuenta` (
  `id` tinyint(3) NOT NULL,
  `nombre` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`id`, `nombre`) VALUES
(1, 'cuenta_comun'),
(2, 'cuenta_joven');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operaciones`
--

CREATE TABLE `operaciones` (
  `tipo` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transacciones`
--

CREATE TABLE `transacciones` (
  `consecutivo` int(10) UNSIGNED NOT NULL,
  `id_cliente` varchar(24) NOT NULL,
  `valor` int(11) NOT NULL,
  `tipo_transaccion` tinyint(3) UNSIGNED NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cuenta` (`id_cuenta`);

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `operaciones`
--
ALTER TABLE `operaciones`
  ADD PRIMARY KEY (`tipo`);

--
-- Indices de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD PRIMARY KEY (`consecutivo`),
  ADD KEY `transacciones_clientes` (`id_cliente`),
  ADD KEY `transaccion_operacion` (`tipo_transaccion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  MODIFY `id` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  MODIFY `consecutivo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1`
  FOREIGN KEY (`id_cuenta`)
  REFERENCES `cuenta` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD CONSTRAINT `transaccion_operacion`
  FOREIGN KEY (`tipo_transacion`)
  REFERENCES `operaciones` (`tipo`)
  ON UPDATE CASCADE,
  ADD CONSTRAINT `transacciones_clientes`
  FOREIGN KEY (`id_cliente`)
  REFERENCES `clientes` (`id`)
  ON UPDATE CASCADE;
COMMIT;
;
