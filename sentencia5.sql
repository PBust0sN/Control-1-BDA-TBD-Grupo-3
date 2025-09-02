-- Lista de clientes que se tiñen el pelo, indicando la comuna del cliente, la peluquería
-- donde se atendió y el valor que pagó.

--haremos inner join en todas las tablas necesarias
--solo cuando las personas cumplen con llevar el servicio
-- Tinte y Tinte raices
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
                        ON deta.id_detalle = servi.id_detalle
WHERE servi.nombre_servicio = 'Tinte' OR servi.nombre_servicio = 'Tinte raíces'