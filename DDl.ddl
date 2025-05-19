drop database if exists prueba_manana_dos;
CREATE DATABASE prueba_manana_dos;
USE prueba_manana_dos;

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
	direccion VARCHAR(30),
    id_tipo_doc int
);

CREATE TABLE IF  NOT EXISTS tipo_doc(
	id_tipo_doc INT PRIMARY KEY AUTO_INCREMENT,
	tipo_documento VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS productos(
	id_producto SMALLINT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR(10),
    precio DECIMAL(10,2),
    stock SMALLINT,
    activo BOOL
);

CREATE TABLE IF NOT EXISTS categoria(
	id_categoria SMALLINT PRIMARY KEY AUTO_INCREMENT,
    nombre_cat varchar(15),
    descripcion TEXT
);

CREATE TABLE IF NOT EXISTS facturas(
	id_factura INT PRIMARY KEY AUTO_INCREMENT,
	fecha DATE,
	total DECIMAL(10,2),
    id_usuario SMALLINT,
	id_detalle_fac SMALLINT
);


CREATE TABLE IF NOT EXISTS detalle_fac(
	id_detalle_fac SMALLINT PRIMARY KEY,
    cantidad SMALLINT,
    precio DECIMAL (10,2),
	id_factura INT,
    id_produc SMALLINT
);


ALTER TABLE usuario
ADD CONSTRAINT fk_tipo_doc
FOREIGN KEY (id_tipo_doc) REFERENCES tipo_doc(id_tipo_doc);

ALTER TABLE facturas
ADD FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);

ALTER TABLE facturas
ADD FOREIGN KEY (id_producto) REFERENCES productos(id_producto);

ALTER TABLE detalle_fac
ADD FOREIGN KEY (id_factura) REFERENCES facturas(id_factura);

ALTER TABLE detalle_fac
ADD FOREIGN KEY (id_produc) REFERENCES productos(id_producto);

