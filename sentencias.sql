-- CONSULTA 1:  Horario con menos citas durante el día por peluquería, identificando la comuna.
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
);

-- CONSULTA 2: Lista de clientes que gastan más dinero mensual por peluquería, indicando la 
-- comuna del cliente y de la peluquería, además de cuanto gasto el cliente. 

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

-- CONSULTA 3: Lista de peluqueros por peluquería que han ganado más por mes los últimos 3 años.

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

-- CONSULTA 4: Lista de clientes hombres que se cortan el pelo y la barba. 

SELECT cl.nombre, cl.apellido, cl.sexo, s.nombre_servicio
FROM cliente AS cl
JOIN cliente_pelu cp ON cl.id_cliente = cp.id_cliente
JOIN cita c ON c.id_cliente_pelu = c.id_cliente_pelu
JOIN detalle d ON c.id_cita = d.id_cita
JOIN servicio s ON d.id_servicio = s.id_servicio
WHERE cl.sexo = 'M' AND (s.nombre_servicio = 'Corte de cabello' OR s.nombre_servicio = 'Corte de barba');

-- CONSULTA 5: Lista de clientes que se tiñen el pelo, indicando la comuna del cliente, la peluquería 
-- donde se atendió y el valor que pagó. 

SELECT cli.nombre, comu.nombre, pelu.nombre,  servi.valor
FROM cliente cli
    INNER JOIN comuna comu
    ON cli.id_comuna = comu.id_comuna
        INNER JOIN  cliente_pelu cli_pelu
        ON cli.id_cliente = cli_pelu.id_cliente
            INNER JOIN peluqueria pelu
            ON cli_pelu.id_peluqueria = pelu.id_peluqueria
                INNER JOIN cita
                ON cli_pelu.id_cliente = cita.id_cliente_pelu
                    INNER JOIN detalle deta
                    ON cita.id_cita = deta.id_cita
                        INNER JOIN servicio servi
                        ON deta.id_servicio = servi.id_servicio
WHERE servi.nombre_servicio = 'Tinte' OR servi.nombre_servicio = 'Tinte raíces';

-- CONSULTA 6: Identificar el horario más concurrido por peluquería durante el 2018 y 2029, 
-- desagregados por mes. 

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

-- CONSULTA 7: Identificar al cliente por peluquería que ha tenido las citas más largas por mes.

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

-- CONSULTA 8: Identificar servicio más caro por peluquería. 

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
);

-- CONSULTA 9: Identificar al peluquero que ha trabajado más por mes durante el 2021. 

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

-- CONSULTA 10: Identificar lista de total de peluquerías por comuna, cantidad de peluquerías, 
-- cantidad de clientes residentes en la comuna. 

SELECT comu.nombre,
--cantidad de peluquerias en la comuna
COALESCE(p.cantidad_peluquerias, 0) AS cantidad_peluquerias,
--cantidad de clientes de una comuna
COALESCE(c.cantidad_clientes, 0)    AS cantidad_clientes,
--crea una lista de los nombres de las peluquerias de cada comuna
p.lista_peluquerias
FROM comuna comu
-- sub consulta para contar la cantidad de peluquerias en una comuna
-- además de guardar su nombre en una lista
LEFT JOIN (
    SELECT id_comuna,
    COUNT(*) AS cantidad_peluquerias,
    STRING_AGG(nombre, ', ') AS lista_peluquerias
    FROM peluqueria
    GROUP BY id_comuna
) p ON comu.id_comuna = p.id_comuna
-- segunda subconsulta para contar los clientes de cada comuna
LEFT JOIN (
    SELECT id_comuna,
            COUNT(*) AS cantidad_clientes
    FROM cliente
    GROUP BY id_comuna
) c ON comu.id_comuna = c.id_comuna;