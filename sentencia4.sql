-- Lista de clientes hombres que se cortan el pelo y la barba.

SELECT cl.nombre, cl.apellido, cl.sexo, s.nombre_servicio
FROM cliente AS cl
JOIN cliente_pelu cp ON cl.id_cliente = cp.id_cliente
JOIN cita c ON c.id_cliente_pelu = c.id_cliente_pelu
JOIN detalle d ON c.id_cita = d.id_cita
JOIN servicio s ON d.id_servicio = s.id_servicio
WHERE cl.sexo = 'M' AND (s.nombre_servicio = 'Corte de cabello' OR s.nombre_servicio = 'Corte de barba')