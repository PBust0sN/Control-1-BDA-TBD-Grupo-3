-- Detalle (para cita 1)
INSERT INTO detalle (id_detalle, id_cita) VALUES
(1, 1),(2, 1),(3, 1),(4, 1),(5, 1),
(6, 1),(7, 1),(8, 1),(9, 1),(10, 1),
(11, 1),(12, 1),(13, 1),(14, 1),(15, 1),
(16, 1),(17, 1),(18, 1),(19, 1),(20, 1);

-- Producto
INSERT INTO producto (id_producto, nombre_producto, precio, id_detalle) VALUES
(1, 'Shampoo', 5000, 1),
(2, 'Acondicionador', 4500, 2),
(3, 'Mascarilla', 7000, 3),
(4, 'Gel', 3500, 4),
(5, 'Cera', 4000, 5),
(6, 'Laca', 3000, 6),
(7, 'Spray', 2500, 7),
(8, 'Aceite', 6000, 8),
(9, 'Tónico', 5500, 9),
(10, 'Crema', 4800, 10),
(11, 'Shampoo', 5000, 11),
(12, 'Acondicionador', 4500, 12),
(13, 'Mascarilla', 7000, 13),
(14, 'Gel', 3500, 14),
(15, 'Cera', 4000, 15),
(16, 'Laca', 3000, 16),
(17, 'Spray', 2500, 17),
(18, 'Aceite', 6000, 18),
(19, 'Tónico', 5500, 19),
(20, 'Crema', 4800, 20);

-- Servicio
INSERT INTO servicio (id_servicio, nombre_servicio, valor, id_detalle) VALUES
(1, 'Corte', 15000, 1),
(2, 'Peinado', 12000, 2),
(3, 'Tinte', 20000, 3),
(4, 'Alisado', 25000, 4),
(5, 'Tratamiento', 18000, 5),
(6, 'Masaje capilar', 10000, 6),
(7, 'Lavado', 5000, 7),
(8, 'Secado', 8000, 8),
(9, 'Recogido', 15000, 9),
(10, 'Balayage', 22000, 10),
(11, 'Corte', 15000, 11),
(12, 'Peinado', 12000, 12),
(13, 'Tinte', 20000, 13),
(14, 'Alisado', 25000, 14),
(15, 'Tratamiento', 18000, 15),
(16, 'Masaje capilar', 10000, 16),
(17, 'Lavado', 5000, 17),
(18, 'Secado', 8000, 18),
(19, 'Recogido', 15000, 19),
(20, 'Balayage', 22000, 20);

-- Pago (cada uno ligado a un detalle distinto)
INSERT INTO pago (id_pago, valor, id_detalle) VALUES
(1, 20000, 1),
(2, 16500, 2),
(3, 27000, 3),
(4, 33000, 4),
(5, 23000, 5),
(6, 15000, 6),
(7, 10000, 7),
(8, 16000, 8),
(9, 30000, 9),
(10, 30000, 10),
(11, 20000, 11),
(12, 16500, 12),
(13, 27000, 13),
(14, 33000, 14),
(15, 23000, 15),
(16, 15000, 16),
(17, 10000, 17),
(18, 16000, 18),
(19, 30000, 19),
(20, 30000, 20);
