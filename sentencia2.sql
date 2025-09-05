WITH TABLA_INTERMEDIA AS (
	SELECT c.nombre AS cliente_nombre,
		   EXTRACT(MONTH FROM h.fecha) AS mes,
		   EXTRACT(YEAR FROM h.fecha) AS anio,
		   SUM(p.valor) AS gasto_total,
           com_pelu.nombre AS comuna_peluqueria,
           com_cli.nombre AS comuna_cliente

	FROM cliente c
	JOIN cliente_pelu cp ON c.id_cliente = cp.id_cliente
	JOIN peluqueria pe ON pe.id_peluqueria = cp.id_peluqueria
	JOIN cita ci ON cp.id_cliente_pelu = ci.id_cliente_pelu
	JOIN horarios h ON ci.id_horarios = h.id_horarios
	JOIN detalle d ON ci.id_cita = d.id_cita
	JOIN pago p ON p.id_detalle = d.id_detalle
    JOIN comuna com_pelu ON com_pelu.id_comuna = pe.id_comuna
    JOIN comuna com_cli ON com_cli.id_comuna = c.id_comuna
	GROUP BY c.nombre, mes, anio, comuna_peluqueria, comuna_cliente
)
SELECT ti.mes, ti.anio, ti.cliente_nombre, ti.gasto_total, ti.comuna_peluqueria ,
       ti.comuna_cliente
FROM TABLA_INTERMEDIA ti
JOIN (
	SELECT mes, anio, MAX(gasto_total) AS mayor
	FROM TABLA_INTERMEDIA
	GROUP BY mes, anio
) m
ON ti.mes = m.mes AND ti.anio = m.anio AND ti.gasto_total = m.mayor
ORDER BY ti.anio, ti.mes;