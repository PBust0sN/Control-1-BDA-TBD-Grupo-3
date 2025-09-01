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

