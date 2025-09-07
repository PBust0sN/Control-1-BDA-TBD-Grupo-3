-- Identificar lista de total de peluquerías por comuna, cantidad de peluquerías,
-- cantidad de clientes residentes en la comuna.

SELECT comu.nombre,
       --agrupa la cantidad de peluquerias
       COUNT(*) AS cantidad_peluquerias,
       --agrupa los clientes de comuna
       COUNT(*) AS cantidad_clientes,
       --crea una lista de los nombres de las peluquerias de cada comuna
       STRING_AGG(pelu.nombre, ', ') AS lista_peluquerias
FROM peluqueria pelu
         INNER JOIN comuna comu
                    ON pelu.id_comuna = comu.id_comuna
         INNER JOIN cliente cli
                    ON cli.id_comuna = comu.id_comuna
--agrupamos por la comuna
GROUP BY comu.nombre