
-- Se asume una comuna de id 1
INSERT INTO cliente (id_cliente, nombre, rut, apellido, sexo, id_comuna) VALUES
 (1,  'Diego',    '21432743-7', 'Ramos',     'M', 8),
 (2,  'Camila',   '19234567-3', 'Soto',      'F', 6),
 (3,  'Javier',   '20345678-5', 'Muñoz',     'M', 10),
 (4,  'Valentina','21345987-2', 'González',  'F', 19),
 (5,  'Matías',   '22456789-6', 'Fernández', 'M', 4),
 (6,  'Francisca','19432123-1', 'López',     'F', 3),
 (7,  'Sebastián','21498765-9', 'Castro',    'M', 8),
 (8,  'Antonia',  '22347890-4', 'Torres',    'F', 1),
 (9,  'Felipe',   '21456789-1', 'Martínez',  'M', 2),
 (10, 'Catalina', '20456789-0', 'Pérez',     'F', 2),
 (11, 'Cristóbal','22432123-7', 'Reyes',     'M', 7),
 (12, 'Fernanda', '19345678-2', 'Hernández', 'F', 7),
 (13, 'Ignacio',  '20234567-8', 'Vargas',    'M', 7),
 (14, 'Daniela',  '21234567-4', 'Silva',     'F', 10),
 (15, 'Tomás',    '22498765-6', 'Rojas',     'M', 10),
 (16, 'Josefa',   '21412345-0', 'Morales',   'F', 6),
 (17, 'Benjamín', '20398765-1', 'Gutiérrez', 'M', 6),
 (18, 'Constanza','21345678-3', 'Ramírez',   'F', 20),
 (19, 'Andrés',   '22312345-7', 'Pizarro',   'M', 9),
 (20, 'Isidora',  '19498765-9', 'Navarro',   'F', 1);


INSERT INTO peluqueria (id_peluqueria, nombre, id_comuna, direccion) VALUES
(1, 'DePelos', 1, 'Av. Departamental 123'),
(2, 'Rapunzel', 2, 'Calle Larga 456'),
(3, 'El Tijeretazo', 3, 'Av. Central 789'),
(4, 'Pelos al Viento', 4, 'Pasaje Corto 101'),
(5, 'La Pelu de la Esquina', 5, 'Callejón Estrecho 202'),
(6, 'Peinados con Estilo', 6, 'Av. Principal 303'),
(7, 'Corte y Confianza', 7, 'Boulevard Alegre 404');


INSERT INTO cliente_pelu (id_cliente, id_peluqueria, id_cliente_pelu) VALUES
(1,4,1),
(2, 1, 2),
(3, 6, 3),
(4, 2, 4),
(5, 7, 5),
(6, 3, 6),
(7, 5, 7),
(8, 1, 8),
(9, 4, 9),
(10, 6, 10),
(11, 2, 11),
(12, 7, 12),
(13, 3, 13),
(14, 5, 14),
(15, 1, 15),
(16, 4, 16),
(17, 6, 17),
(18, 2, 18),
(19, 7, 19),
(20, 3, 20),
(1, 5, 21),
(2, 7, 22),
(3, 2, 23),
(4, 6, 24),
(5, 1, 25);

-- PRODUCTOS
INSERT INTO "producto" ("id_producto", "nombre_producto", "precio") VALUES
(1, 'Shampoo', 5000),
(2, 'Acondicionador', 4500),
(3, 'Mascarilla', 7000),
(4, 'Gel', 3500),
(5, 'Spray', 4000),
(6, 'Tinte Rojo', 12000),
(7, 'Tinte Rubio', 15000),
(8, 'Tinte Castaño', 11000),
(9, 'Laca', 3000),
(10, 'Cera', 2500),
(11, 'Champú Seco', 5500),
(12, 'Crema Hidratante', 6000),
(13, 'Serum', 7500),
(14, 'Protector Térmico', 5000),
(15, 'Acrílicos', 9000),
(16, 'Removedor Acrílicos', 4000),
(17, 'Esmalte Rojo', 3000),
(18, 'Esmalte Nude', 3200),
(19, 'Esmalte Negro', 3500),
(20, 'Toalla', 2000);

-- SERVICIOS
INSERT INTO "servicio" ("id_servicio", "nombre_servicio", "valor") VALUES
(1, 'Corte de cabello', 15000),
(2, 'Peinado', 12000),
(3, 'Lavado', 8000),
(4, 'Tinte', 20000),
(5, 'Manicure', 10000),
(6, 'Pedicure', 12000),
(7, 'Tratamiento capilar', 18000),
(8, 'Alisado', 25000),
(9, 'Ondulado', 22000),
(10, 'Masaje capilar', 9000),
(11, 'Depilación cejas', 5000),
(12, 'Depilación facial', 7000),
(13, 'Peinado recogido', 15000),
(14, 'Maquillaje', 20000),
(15, 'Extensiones', 30000),
(16, 'Tinte raíces', 18000),
(17, 'Color completo', 25000),
(18, 'Tratamiento keratina', 28000),
(19, 'Laminado de pestañas', 15000),
(20, 'Cejas y pestañas', 10000);

-- DETALLES (para la cita con id 1)
INSERT INTO "detalle" ("id_detalle", "id_cita", "id_producto", "id_servicio") VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 1, 3, 3),
(4, 1, 4, 4),
(5, 1, 5, 5),
(6, 1, 6, 6),
(7, 1, 7, 7),
(8, 1, 8, 8),
(9, 1, 9, 9),
(10, 1, 10, 10),
(11, 1, 11, 11),
(12, 1, 12, 12),
(13, 1, 13, 13),
(14, 1, 14, 14),
(15, 1, 15, 15),
(16, 1, 16, 16),
(17, 1, 17, 17),
(18, 1, 18, 18),
(19, 1, 19, 19),
(20, 1, 20, 20);

-- PAGOS (uno por cada detalle)
INSERT INTO "pago" ("id_pago", "valor", "id_detalle") VALUES
(1, 20000, 1),
(2, 25000, 2),
(3, 15000, 3),
(4, 30000, 4),
(5, 12000, 5),
(6, 14000, 6),
(7, 18000, 7),
(8, 22000, 8),
(9, 10000, 9),
(10, 9000, 10),
(11, 11000, 11),
(12, 12000, 12),
(13, 13000, 13),
(14, 14000, 14),
(15, 15000, 15),
(16, 16000, 16),
(17, 17000, 17),
(18, 18000, 18),
(19, 19000, 19),
(20, 20000, 20);

-- Comunas
INSERT INTO "comuna" (id_comuna, nombre) VALUES (1, 'Santiago');
INSERT INTO "comuna" (id_comuna, nombre) VALUES (2, 'Providencia');
INSERT INTO "comuna" (id_comuna, nombre) VALUES (3, 'Las Condes');
INSERT INTO "comuna" (id_comuna, nombre) VALUES (4, 'Ñuñoa');
INSERT INTO "comuna" (id_comuna, nombre) VALUES (5, 'Puente Alto');
INSERT INTO "comuna" (id_comuna, nombre) VALUES (6, 'Maipú');
INSERT INTO "comuna" (id_comuna, nombre) VALUES (7, 'La Florida');
INSERT INTO "comuna" (id_comuna, nombre) VALUES (8, 'Recoleta');
INSERT INTO "comuna" (id_comuna, nombre) VALUES (9, 'Vitacura');
INSERT INTO "comuna" (id_comuna, nombre) VALUES (10, 'Quilicura');
INSERT INTO "comuna" (id_comuna, nombre) VALUES (11, 'Lo Barnechea');
INSERT INTO "comuna" (id_comuna, nombre) VALUES (12, 'San Miguel');
INSERT INTO "comuna" (id_comuna, nombre) VALUES (13, 'La Cisterna');
INSERT INTO "comuna" (id_comuna, nombre) VALUES (14, 'Huechuraba');
INSERT INTO "comuna" (id_comuna, nombre) VALUES (15, 'Peñalolén');
INSERT INTO "comuna" (id_comuna, nombre) VALUES (16, 'Macul');
INSERT INTO "comuna" (id_comuna, nombre) VALUES (17, 'San Joaquín');
INSERT INTO "comuna" (id_comuna, nombre) VALUES (18, 'Lo Espejo');
INSERT INTO "comuna" (id_comuna, nombre) VALUES (19, 'Pedro Aguirre Cerda');
INSERT INTO "comuna" (id_comuna, nombre) VALUES (20, 'Independencia');

-- Empleados
INSERT INTO "empleado" (id_empleado, id_peluqueria, id_peluquero, id_comuna) 
VALUES
    (1, 1, 1, 1),   
    (2, 1, 1, 2),  
    (3, 1, 1, 3),  
    (4, 1, 1, 4),   
    (5, 1, 1, 5),  
    (6, 1, 1, 6),   
    (7, 1, 1, 7),  
    (8, 1, 1, 8),   
    (9, 1, 1, 9),  
    (10, 1, 1, 10),
	(11, 1, 1, 1),   
    (12, 1, 1, 2),  
    (13, 1, 1, 3),  
    (14, 1, 1, 4),   
    (15, 1, 1, 5),  
    (16, 1, 1, 6),   
    (17, 1, 1, 7),  
    (18, 1, 1, 8),   
    (19, 1, 1, 9),  
    (20, 1, 1, 10);

-- Sueldos
INSERT INTO "sueldo" (id_sueldo, id_empleado, monto, bonos, descuentos, fecha) 
VALUES 
    (1,  2, 100000, 3, 2, '2025-08-04'),
    (2,  2, 105000, 2, 1, '2025-09-04'),
    (3,  2, 110000, 4, 3, '2025-10-04'),
    (4,  2, 108500, 1, 2, '2025-11-04'),
    (5,  2, 112000, 3, 1, '2025-12-04'),
    (6,  2, 115000, 2, 2, '2026-01-04'),
    (7,  2, 117500, 5, 1, '2026-02-04'),
    (8,  2, 120000, 2, 3, '2026-03-04'),
    (9,  2, 123000, 4, 2, '2026-04-04'),
    (10, 2, 125500, 3, 1, '2026-05-04'),
	(11, 2, 128000, 2, 2, '2026-06-04'),
    (12, 2, 130500, 3, 1, '2026-07-04'),
    (13, 2, 133000, 4, 2, '2026-08-04'),
    (14, 2, 135000, 2, 3, '2026-09-04'),
    (15, 2, 137500, 5, 2, '2026-10-04'),
    (16, 2, 140000, 3, 1, '2026-11-04'),
    (17, 2, 142500, 2, 2, '2026-12-04'),
    (18, 2, 145000, 4, 3, '2027-01-04'),
    (19, 2, 147500, 3, 1, '2027-02-04'),
    (20, 2, 150000, 2, 2, '2027-03-04');