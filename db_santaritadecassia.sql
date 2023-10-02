
/* Crear base de datos dbGamarraMarket */
CREATE DATABASE dbSRC
DEFAULT CHARACTER SET utf8;

/* Poner en uso la base de datos dbGamarraMarket */
USE dbSRC;

/* Crear la tabla REGISTRO */
CREATE TABLE REGISTRO 
(
    id int auto_increment,
    nombres varchar(60),
    apellidos varchar(60),
    dni char(8),
    telefono char(9),
    email Varchar(50),
    mensaje text(500),
    CONSTRAINT REGISTRO_pk PRIMARY KEY (id)
);

/* Crear la tabla RECEPCION */
CREATE TABLE RECEPCION 
(
    id int auto_increment,
    REGISTRO_id Int,
    CONSTRAINT RECEPCION_pk PRIMARY KEY (id)
);
/* Listar estructuraS*/
SHOW COLUMNS IN REGISTRO;
SHOW COLUMNS IN RECEPCION;
/* Listar tablas existentes en la base de datos en uso */
SHOW TABLES;
/* Crear relación RECEPCION_REGISTRO */
ALTER TABLE RECEPCION 
ADD CONSTRAINT RECEPCION_REGISTRO FOREIGN KEY(REGISTRO_id)
    REFERENCES REGISTRO (id)
	ON UPDATE CASCADE
    ON DELETE CASCADE;

/* Listar relaciones de tablas de la base de datos activa */
SELECT 
    i.constraint_name, k.table_name, k.column_name, 
    k.referenced_table_name, k.referenced_column_name
FROM 
    information_schema.TABLE_CONSTRAINTS i 
LEFT JOIN information_schema.KEY_COLUMN_USAGE k 
ON i.CONSTRAINT_NAME = k.CONSTRAINT_NAME 
WHERE i.CONSTRAINT_TYPE = 'FOREIGN KEY' 
AND i.TABLE_SCHEMA = DATABASE();

/* Listar estructura de la tabla */
SHOW COLUMNS IN REGISTRO;
SHOW COLUMNS IN RECEPCION;

/* Listar tablas existentes en la base de datos en uso */
SHOW TABLES;