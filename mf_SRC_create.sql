-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-10-02 02:52:59.502

-- tables
-- Table: RECEPCION
CREATE TABLE RECEPCION (
    id int  NOT NULL COMMENT 'Identificador de  la recepción',
    REGISTRO_id Int  NOT NULL,
    CONSTRAINT RECEPCION_pk PRIMARY KEY (id)
) COMMENT 'Recepcionara todos los datos registrados ';

-- Table: REGISTRO
CREATE TABLE REGISTRO (
    id Int  NOT NULL,
    nombres varchar(60)  NOT NULL COMMENT 'Contendra los nombres registrados',
    apellidos varchar(60)  NOT NULL COMMENT 'Contendra los apellidos registrado',
    dni char(8)  NOT NULL COMMENT 'Contendra el dni registrado',
    telefono char(9)  NOT NULL COMMENT 'Contendra el telefono registrado',
    email Varchar(50)  NOT NULL COMMENT 'Contendra el email registrado',
    mensaje text(500)  NOT NULL COMMENT 'Contendra el mensaje registrado',
    CONSTRAINT REGISTRO_pk PRIMARY KEY (id)
) COMMENT 'Contrenda los  datos que se registraran ';

-- foreign keys
-- Reference: RECEPCION_REGISTRO (table: RECEPCION)
ALTER TABLE RECEPCION ADD CONSTRAINT RECEPCION_REGISTRO FOREIGN KEY RECEPCION_REGISTRO (REGISTRO_id)
    REFERENCES REGISTRO (id);

-- End of file.

