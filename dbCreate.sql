CREATE TABLE "peluquero" (
  "id_peluquero" int,
  "nombre" varchar(50),
  "rut" varchar(10),
  "apellido" varchar(50),
  "nacionalidad" varchar(50),
  PRIMARY KEY ("id_peluquero")
);

CREATE TABLE "comuna" (
  "id_comuna" int,
  "nombre" varchar(50),
  PRIMARY KEY ("id_comuna")
);

CREATE TABLE "peluqueria" (
  "id_peluqueria" int,
  "nombre" varchar(50),
  "id_comuna" int,
  "direccion" varchar(100),
  PRIMARY KEY ("id_peluqueria"),
  CONSTRAINT "FK_peluqueria_id_comuna"
    FOREIGN KEY ("id_comuna")
      REFERENCES "comuna"("id_comuna")
);

CREATE TABLE "empleado" (
  "id_empleado" int,
  "id_peluqueria" int,
  "id_peluquero" int,
  "id_comuna" int,
  PRIMARY KEY ("id_empleado"),
  CONSTRAINT "FK_empleado_id_peluquero"
    FOREIGN KEY ("id_peluquero")
      REFERENCES "peluquero"("id_peluquero"),
  CONSTRAINT "FK_empleado_id_comuna"
    FOREIGN KEY ("id_comuna")
      REFERENCES "comuna"("id_comuna"),
  CONSTRAINT "FK_empleado_id_peluqueria"
    FOREIGN KEY ("id_peluqueria")
      REFERENCES "peluqueria"("id_peluqueria")
);

CREATE TABLE "sueldo" (
  "id_sueldo" int,
  "id_empleado" int,
  "monto" int,
  "bonos" int,
  "descuentos" int,
  "fecha" date,
  PRIMARY KEY ("id_sueldo"),
  CONSTRAINT "FK_sueldo_id_empleado"
    FOREIGN KEY ("id_empleado")
      REFERENCES "empleado"("id_empleado")
);

CREATE TABLE "horarios" (
  "id_horarios" int,
  "fecha" date,
  "hora" time,
  "estado" bool,
  "id_peluqueria" int,
  PRIMARY KEY ("id_horarios")
  CONSTRAINT "FK_horarios_id_peluqueria"
    FOREIGN KEY ("id_peluqueria")
      REFERENCES "comuna"("id_peluqueria")
);

CREATE TABLE "cliente" (
  "id_cliente" int,
  "nombre" varchar(50),
  "rut" varchar(10),
  "apellido" varchar(50),
  "sexo" varchar(50),
  "id_comuna" int,
  PRIMARY KEY ("id_cliente"),
  CONSTRAINT "FK_cliente_id_comuna"
    FOREIGN KEY ("id_comuna")
      REFERENCES "comuna"("id_comuna")
);

CREATE TABLE "cliente_pelu" (
  "id_cliente" int,
  "id_peluqueria" int,
  "id_cliente_pelu" int,
  PRIMARY KEY ("id_cliente_pelu"),
  CONSTRAINT "FK_cliente_pelu_id_peluqueria"
    FOREIGN KEY ("id_peluqueria")
      REFERENCES "peluqueria"("id_peluqueria"),
  CONSTRAINT "FK_cliente_pelu_id_cliente"
    FOREIGN KEY ("id_cliente")
      REFERENCES "cliente"("id_cliente")
);

CREATE TABLE "cita" (
  "id_cita" int,
  "duracion" int,
  "id_horarios" int,
  "id_peluquero" int,
  "id_cliente_pelu" int,
  PRIMARY KEY ("id_cita"),
  CONSTRAINT "FK_cita_id_horarios"
    FOREIGN KEY ("id_horarios")
      REFERENCES "horarios"("id_horarios"),
  CONSTRAINT "FK_cita_id_peluquero"
    FOREIGN KEY ("id_peluquero")
      REFERENCES "peluquero"("id_peluquero"),
  CONSTRAINT "FK_cita_id_cliente_pelu"
    FOREIGN KEY ("id_cliente_pelu")
      REFERENCES "cliente_pelu"("id_cliente_pelu")
);

CREATE TABLE "detalle" (
  "id_detalle" int,
  "id_cita" int,
  PRIMARY KEY ("id_detalle"),
  CONSTRAINT "FK_detalle_id_cita"
    FOREIGN KEY ("id_cita")
      REFERENCES "cita"("id_cita")
);

CREATE TABLE "producto" (
  "id_producto" int,
  "nombre_producto" varchar(50),
  "precio" int,
  "id_detalle" int,
  PRIMARY KEY ("id_producto"),
  CONSTRAINT "FK_producto_id_detalle"
    FOREIGN KEY ("id_detalle")
      REFERENCES "detalle"("id_detalle")
);

CREATE TABLE "pago" (
  "id_pago" int,
  "valor" int,
  "id_detalle" int,
  PRIMARY KEY ("id_pago"),
  CONSTRAINT "FK_pago_id_detalle"
    FOREIGN KEY ("id_detalle")
      REFERENCES "detalle"("id_detalle")
);

CREATE TABLE "servicio" (
  "id_servicio" int,
  "nombre_servicio" varchar(50),
  "valor" int,
  "id_detalle" int,
  PRIMARY KEY ("id_servicio"),
  CONSTRAINT "FK_servicio_id_detalle"
    FOREIGN KEY ("id_detalle")
      REFERENCES "detalle"("id_detalle")
);


