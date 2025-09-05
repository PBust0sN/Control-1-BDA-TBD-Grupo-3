WITH tabla_conteo AS (
    SELECT 
        p.id_peluquero AS identificador,
        p.nombre,
        EXTRACT(MONTH FROM h.fecha) AS mes,
        COUNT(*) AS total_citas
    FROM peluquero p
    JOIN cita c ON p.id_peluquero = c.id_peluquero
    JOIN horarios h ON c.id_horarios = h.id_horarios
    WHERE h.fecha BETWEEN '2021-01-01' AND '2021-12-31'
    GROUP BY p.id_peluquero, p.nombre, mes
),
tabla_maximos AS (
    SELECT 
        mes, 
        MAX(total_citas) AS mayor
    FROM tabla_conteo
    GROUP BY mes
),
tabla_mejores AS (
    SELECT 
        tc.mes, 
        tc.identificador, 
        tc.nombre, 
        tc.total_citas
    FROM tabla_conteo tc
    JOIN tabla_maximos m 
      ON tc.mes = m.mes AND tc.total_citas = m.mayor
)
SELECT 
    tm.identificador,
    tm.nombre,
    COUNT(*) AS total_apariciones
FROM tabla_mejores tm
GROUP BY tm.identificador, tm.nombre
ORDER BY total_apariciones DESC
LIMIT 1;