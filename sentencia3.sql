-- 3. Lista de peluqueros por peluquería que han ganado más por mes los últimos 3 años.
WITH PAGOS_POR_MES AS (
    SELECT
        peluqueria.nombre AS nombre_peluqueria,
        empleado.id_empleado,
        date_trunc('month', fecha) AS mes_año,
        SUM(monto) AS total
    FROM SUELDO
             INNER JOIN empleado ON empleado.id_empleado = SUELDO.id_empleado
             INNER JOIN peluqueria ON peluqueria.id_peluqueria = empleado.id_peluqueria
    WHERE fecha > current_date - interval '3 years'
    GROUP BY peluqueria.nombre, empleado.id_empleado, mes_año
)
SELECT DISTINCT ON (nombre_peluqueria, mes_año)
    nombre_peluqueria,
    id_empleado,
    mes_año,
    total
FROM PAGOS_POR_MES
ORDER BY nombre_peluqueria, mes_año, total DESC;