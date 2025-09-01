
INSERT INTO comuna (id_comuna, nombre) VALUES (1, 'La Florida');

-- Se asume una comuna de id 1
INSERT INTO cliente (id_cliente, nombre, rut, apellido, sexo, id_comuna) VALUES
 (1,  'Diego',    '21432743-7', 'Ramos',     'M', 1),
 (2,  'Camila',   '19234567-3', 'Soto',      'F', 1),
 (3,  'Javier',   '20345678-5', 'Muñoz',     'M', 1),
 (4,  'Valentina','21345987-2', 'González',  'F', 1),
 (5,  'Matías',   '22456789-6', 'Fernández', 'M', 1),
 (6,  'Francisca','19432123-1', 'López',     'F', 1),
 (7,  'Sebastián','21498765-9', 'Castro',    'M', 1),
 (8,  'Antonia',  '22347890-4', 'Torres',    'F', 1),
 (9,  'Felipe',   '21456789-1', 'Martínez',  'M', 1),
 (10, 'Catalina', '20456789-0', 'Pérez',     'F', 1),
 (11, 'Cristóbal','22432123-7', 'Reyes',     'M', 1),
 (12, 'Fernanda', '19345678-2', 'Hernández', 'F', 1),
 (13, 'Ignacio',  '20234567-8', 'Vargas',    'M', 1),
 (14, 'Daniela',  '21234567-4', 'Silva',     'F', 1),
 (15, 'Tomás',    '22498765-6', 'Rojas',     'M', 1),
 (16, 'Josefa',   '21412345-0', 'Morales',   'F', 1),
 (17, 'Benjamín', '20398765-1', 'Gutiérrez', 'M', 1),
 (18, 'Constanza','21345678-3', 'Ramírez',   'F', 1),
 (19, 'Andrés',   '22312345-7', 'Pizarro',   'M', 1),
 (20, 'Isidora',  '19498765-9', 'Navarro',   'F', 1);


INSERT INTO peluqueria (id_peluqueria, nombre, id_comuna, direccion) VALUES
(1, 'DePelos', 1, 'Av. Departamental 123'),
(2, 'Rapunzel', 1, 'Calle Larga 456'),
(3, 'El Tijeretazo', 1, 'Av. Central 789'),
(4, 'Pelos al Viento', 1, 'Pasaje Corto 101'),
(5, 'La Pelu de la Esquina', 1, 'Callejón Estrecho 202'),
(6, 'Peinados con Estilo', 1, 'Av. Principal 303'),
(7, 'Corte y Confianza', 1, 'Boulevard Alegre 404');


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