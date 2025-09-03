-- 8. Identificar servicio más caro por peluquería.

-- obtenemos el nombre del servicio más caro, el nombre de la peluquería y el valor del servicio
SELECT s.nombre_servicio as servicio_mas_caro, p.nombre as peluqueria, s.valor
FROM servicio s
JOIN detalle d ON s.id_detalle = d.id_detalle
JOIN cita c ON d.id_cita = c.id_cita
JOIN cliente_pelu cp ON c.id_cliente_pelu = cp.id_cliente_pelu
Join peluqueria p ON cp.id_peluqueria = p.id_peluqueria
WHERE s.valor = (
    -- subconsulta para obtener el valor máximo del servicio por peluquería
    SELECT MAX(s2.valor)
    FROM servicio s2
    JOIN detalle d2 ON s2.id_detalle = d2.id_detalle
    JOIN cita c2 ON d2.id_cita = c2.id_cita
    JOIN cliente_pelu cp2 ON c2.id_cliente_pelu = cp2.id_cliente_pelu
    WHERE cp2.id_peluqueria = p.id_peluqueria
)
