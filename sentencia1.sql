SELECT co.nombre, p.nombre, h.hora, COUNT(c.id_cita)
FROM cita AS c
JOIN horarios h ON h.id_horarios = c.id_horarios
JOIN cliente_pelu cp ON cp.id_cliente_pelu = c.id_cliente_pelu
JOIN peluqueria p ON p.id_peluqueria = cp.id_peluqueria
JOIN comuna co ON co.id_comuna = p.id_comuna
GROUP BY co.nombre, p.nombre, h.hora
HAVING count(c.id_cita) = (
	SELECT MIN(contar)
	FROM (
		SELECT count(c2.id_cita) AS contar
		FROM cita AS c2
		JOIN horarios h2 ON h2.id_horarios = c2.id_horarios
		JOIN cliente_pelu cp2 ON cp2.id_cliente_pelu = c2.id_cliente_pelu
		JOIN peluqueria p2 ON p2.id_peluqueria = cp2.id_peluqueria
		JOIN comuna co2 ON co2.id_comuna = p2.id_comuna
		GROUP BY co2.nombre, p2.nombre, h2.hora
	)
)
