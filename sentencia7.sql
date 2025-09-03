-- 7. Identificar al cliente por peluquería que ha tenido las citas más largas por mes.

-- obtenemos nombre de cliente, nombre de peluquería y el mes/año de la cita mas larga por peluquería
SELECT c.nombre , p.nombre , TO_CHAR(h.fecha, 'MM-YYYY') AS fecha
FROM cliente c
JOIN cliente_pelu cp ON c.id_cliente = cp.id_cliente
JOIN peluqueria p ON cp.id_peluqueria = p.id_peluqueria
JOIN cita ci ON cp.id_cliente_pelu = ci.id_cliente_pelu
JOIN horarios h ON ci.id_horarios = h.id_horarios
WHERE ci.duracion = (
    -- subconsulta para obtener la duración máxima de las citas por peluquería y mes
    SELECT MAX(ci2.duracion)
    FROM cliente c2
    JOIN cliente_pelu cp2 ON c2.id_cliente = cp2.id_cliente
    JOIN peluqueria p2 ON cp2.id_peluqueria = p2.id_peluqueria
    JOIN cita ci2 ON cp2.id_cliente_pelu = ci2.id_cliente_pelu
    JOIN horarios h2 ON ci2.id_horarios = h2.id_horarios
    WHERE p2.id_peluqueria = p.id_peluqueria
    AND TO_CHAR(h2.fecha, 'MM-YYYY') = TO_CHAR(h.fecha, 'MM-YYYY')
)
-- ordenamos por mes y año de la las citas mas largas por peluquería en orden ascendente
ORDER BY DATE_TRUNC('month', fecha) ASC;