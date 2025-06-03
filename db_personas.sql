drop database db_personas;
create database db_personas; 
use db_personas;


CREATE TABLE persona 
( 
id int NOT NULL AUTO_INCREMENT,
identificacion varchar(50) NOT NULL,
nombre varchar(50) NOT NULL, 
apellido varchar(50) NOT NULL, 
email varchar(100) NOT NULL,
telefono varchar(20) DEFAULT NULL, 
direccion varchar(255) DEFAULT NULL, 
PRIMARY KEY (id)
)
engine = InnoDB auto_increment = 39

; 
use db_personas;
insert into persona(identificacion, nombre, apellido, email, telefono, direccion)
values 
	('1007574791', 'Andres', 'Algarin', 
	'andresalgarin@gmail.com', '3134642200', 'Calle falsa 123');
