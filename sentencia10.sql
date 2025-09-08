-- Identificar lista de total de peluquerías por comuna, cantidad de peluquerías,
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