-- Identificar el horario más concurrido por peluquería durante el 2018 y 2029, desagregados por mes.
WITH horario_transitado AS (
    SELECT p.nombre AS peluqueria,
           EXTRACT(MONTH FROM h.fecha) AS mes,
           EXTRACT(YEAR FROM h.fecha) AS año,
           EXTRACT(HOUR FROM h.hora) AS hora,
           COUNT(*) AS cantidad_citas
    FROM Cita c
    JOIN horarios h ON c.id_horarios = h.id_horarios
    JOIN peluquero pe ON c.id_peluquero = pe.id_peluquero
    JOIN empleado e ON pe.id_peluquero = e.id_peluquero
    JOIN peluqueria p ON e.id_peluqueria = p.id_peluqueria
    WHERE EXTRACT(YEAR FROM h.fecha) IN (2018, 2029)
    GROUP BY p.nombre, mes, hora, año

)
SELECT DISTINCT ON (peluqueria, mes, año)
       peluqueria,
       año,
       mes,
       hora,
       cantidad_citas
FROM horario_transitado
ORDER BY peluqueria, año, mes, cantidad_citas DESC, hora;