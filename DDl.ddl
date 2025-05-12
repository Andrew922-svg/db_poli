drop database if exists prueba_manana;
CREATE DATABASE prueba_manana;
USE prueba_manana;

CREATE TABLE IF NOT EXISTS usuario(
	id_usuario SMALLINT PRIMARY KEY AUTO_INCREMENT,
	primer_nombre VARCHAR(15) NOT NULL,
	segundo_nombre VARCHAR(15) NULL,
	primer_apellido VARCHAR(15) NOT NULL,
	segundo_apellido VARCHAR(15) NULL,
	numero_doc INT,
	fecha_nacimiento DATE,
	telefono INT,
	correo VARCHAR(25),
	sexo BOOL,
	direccion VARCHAR(30)
);

ALTER TABLE usuario
ADD id_tipo_doc int;


CREATE TABLE IF  NOT EXISTS tipo_doc(
	id_tipo_doc INT PRIMARY KEY AUTO_INCREMENT,
	tipo_documento VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS productos(
	id_producto SMALLINT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR(10),
    descripcion TEXT,
    precio DECIMAL(10,2),
    stock SMALLINT,
    activo BOOL
);



CREATE TABLE IF NOT EXISTS facturas(
	id_factura INT PRIMARY KEY AUTO_INCREMENT,
	fecha DATE,
	cantidad TINYINT,
	total DECIMAL(10,2)
);
USE prueba_manana;
ALTER TABLE facturas
ADD id_usuario SMALLINT,
ADD id_producto SMALLINT,
ADD id_detalle_fac SMALLINT,
DROP COLUMN cantidad;

CREATE TABLE IF NOT EXISTS detalle_fac(
id_detalle_fac SMALLINT PRIMARY KEY
);

ALTER TABLE detalle_fac
ADD cantidad SMALLINT,
ADD id_factura INT,
ADD id_produc SMALLINT;

ALTER TABLE usuario
ADD FOREIGN KEY (id_tipo_doc) REFERENCES tipo_doc(id_tipo_doc);

ALTER TABLE facturas
ADD FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);

ALTER TABLE facturas
ADD FOREIGN KEY (id_producto) REFERENCES productos(id_producto);

ALTER TABLE detalle_fac
ADD FOREIGN KEY (id_factura) REFERENCES facturas(id_factura);

ALTER TABLE detalle_fac
ADD FOREIGN KEY (id_produc) REFERENCES productos(id_producto);

