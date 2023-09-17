/*Creamos la base de datos */
DROP DATABASE IF exists dbGamarraMarket;
CREATE DATABASE dbGamarraMarket
DEFAULT CHARACTER SET utf8;

/*Poner en uso la base de datos */
USE dbGamarraMarket;

/*Eliminar la base de datos */
DROP DATABASE dbgamarramarket;

/*creamos la tabla CLIENTE*/
CREATE TABLE CLIENTE
(
	id int auto_increment ,
    tipo_documento char(3),
    numero_documento char(9),
	nombres varchar (60),
    apellidos varchar (90),
	email varchar (80),
    celular char(9),
	fecha_nacimiento date,
    activo bool default(1),
    CONSTRAINT cliente_pk PRIMARY KEY (id)
);

/*CREAMOS LA TABLA VENTA*/
CREATE TABLE VENTA
(
	id int auto_increment,
    fecha_hora timestamp,
    cliente_id int,
    vendedor_id int,
    activo bool default(1),
    CONSTRAINT venta_pk PRIMARY KEY (id)
);
/*CREAMOS LA TABLA VENDEDOR*/
CREATE TABLE VENDEDOR 
(	
	id int auto_increment,
	tipo_documento char(3),
    numero_documento char(15),
    nombres varchar(60),
    apellidos varchar(90),
    salario decimal (8,2),
    celular char(9),
    email varchar (80),
    activo bool default(1),
    CONSTRAINT Vendedor_pk PRIMARY KEY (id)
);
/*CREAMOS LA TABLA  VENTA_DETALLE*/
CREATE TABLE VENTA_DETALLE
(
	id int auto_increment,
    venta_id int ,
    prenda_id int ,
    cantidad int ,
    CONSTRAINT venta_detalle_pk PRIMARY KEY (id)
);
/*CREAMOS LA TABLA PRENDA */
CREATE TABLE PRENDA 
(
	id int auto_increment,
    descripcion varchar (90),
    marca varchar (60),
    cantidad int ,
    talla varchar (10) ,
    precio decimal(8,2),
    activo bool default(1),
    CONSTRAINT prenda_pk PRIMARY KEY (id)
);
/*CREAMOS LA RELACION VENTA_CLIENTE*/
ALTER TABLE VENTA 
	ADD CONSTRAINT VENTA_CLIENTE FOREIGN  KEY (cliente_id)
    REFERENCES CLIENTE (id)
	ON UPDATE CASCADE
    ON DELETE CASCADE 	
;
/*RELACIONAMOS LA TABLA VENDEDOR_VENTA*/
ALTER TABLE VENTA 
	ADD CONSTRAINT VENDEDOR_VENTA FOREIGN  KEY (vendedor_id)
    REFERENCES VENDEDOR (id)
	ON UPDATE CASCADE
    ON DELETE CASCADE 	
;
/*Relacionamos la tabla venta_venta_detalle*/
ALTER TABLE VENTA_DETALLE 
	ADD CONSTRAINT VENTA_VENTA_DETALLE FOREIGN  KEY (venta_id)
    REFERENCES VENTA (id)
	ON UPDATE CASCADE
    ON DELETE CASCADE 	
;
/*relacionamos la tabla PRENDA_VENTA_DETALLE*/
ALTER TABLE VENTA_DETALLE 
	ADD CONSTRAINT PRENDA_VENTA_DETALLE FOREIGN  KEY (prenda_id)
    REFERENCES PRENDA (id)
	ON UPDATE CASCADE
    ON DELETE CASCADE 	
;
/*LISTAMOS LA RELACION */
SELECT 
    i.constraint_name, k.table_name, k.column_name, 
    k.referenced_table_name, k.referenced_column_name
FROM 
    information_schema.TABLE_CONSTRAINTS i 
LEFT JOIN information_schema.KEY_COLUMN_USAGE k 
ON i.CONSTRAINT_NAME = k.CONSTRAINT_NAME 
WHERE i.CONSTRAINT_TYPE = 'FOREIGN KEY' 
AND i.TABLE_SCHEMA = DATABASE();

/*INGRESAMOS LOS REGISTROS A LA TABLA CLIENTE */
INSERT INTO cliente
(nombres , apellidos , numero_documento ,  tipo_documento , email ,celular , 
fecha_nacimiento )
VALUES 
('Alberto' , 'Solano Pariona ' , '77889955' , 'DNI' , 'alberto.pariona@empresa.com', '998456103',
str_to_date('10/02/1970','%d/%m/%Y')),
('Alicia' , 'Garcia Campos' , '45781233' , 'DNI', '' , ''
,str_to_date('20/03/1980', '%d/%m/%Y')),
('Juana' , 'Ávila Chumpitaz' , '315487922' , 'CNE' ,'juana.avila@gmail.com','923568741',
str_to_date('06/06/1986','%d/%m/%Y')),
('Ana' , 'Enriquez Flores', '122116633', 'CNE' , 'ana.enriquez@empresa.com','',
str_to_date('10/02/1970','%d/%m/%Y')),
('Claudia ' , 'Perales Ortíz' , '088741589', 'CNE' , 'claudia.perales@yahoo.com','997845263',
str_to_date('25/07/1981','%d/%m/%Y')),
('Mario' , 'Barrios Martínez ', '45122587','DNI' , 'mario.barrios@outlook.com','986525871',
str_to_date('10/10/1987','%d/%m/%Y')),
('Brunela', 'Tarazona Guerrera','175258564' , 'CNE' , 'brunela.tarazona@gmail.com','995236741',
str_to_date('06/06/1990','%d/%m/%Y')),
('Alejandro ' , 'Jimenez Huapaya', '47142536' , 'DNI', '', '941525365',
str_to_date('01/06/1989','%d/%m/%Y')),
('Claudia' , 'Marquez Litano' , '15352585', 'DNI', 'claudia.marquez@gmail.com' , '985814723',
str_to_date('01/10/1991','%d/%m/%Y')),
('Mario', 'Rodríguez Mayo','465772587', 'CNE', 'mario.rodriguez@outlook.com', '912662587',
str_to_date('10/11/1987','%d/%m/%Y')),
('Luisa','Guerra Ibarra', '837952514' , 'CNE' , 'luisa.guerra@yahoo.com','974422136',
str_to_date('21/12/1988','%d/%m/%Y')) ,
('Pedro Al', 'Candela Valenzuela', '74142585' , 'DNI' , 'pedro,candela@gmail.com','91448525',
str_to_date('30/06/1995','%d/%m/%Y')),
('Angel M', 'Rojas Avila' , '53298147', 'DNI', 'angel,rojas@outlook.com','',
str_to_date('02/03/1975','%d/%m/%Y')),
('Hilario F','Avila Huapaya', '11453265', 'DNI' , '' , '985514326' ,
str_to_date('02/05/2000','%d/%m/%Y')),
('Octavio' , 'Marquez Osorio' , '757472186' , 'CNE' , 'octavio.marquez@yahoo.es' ,'966223141',
str_to_date('22/09/2000','%d/%m/%Y')),
('Manolo E', 'Vasquez Saravia' , '558693219' , 'CNE' ,'manolo.vasques@outlook.es','966223141',
str_to_date('22/09/2000','%d/%m/%Y')),
('Genoveva', 'Ortiz Quispe' , '41552567' , 'DNI' , 'genoveva.ortiz@outlook.es' , '92564137',
str_to_date('12/04/2003','%d/%m/%Y')),
('Oscar C' ,'Quiroz Savala ' , '49985471','DNI', '','988223145',
str_to_date('12/10/2004','%d/%m/%Y')),
('Verónica', ' Romero Vargas', '44992217' , 'DNI', 'veronica.romero@yahoo.com' , '',
str_to_date('25/08/2002','%d/%m/%Y')),
('Eliseo', 'Prada Ortiz ' , '00253641' , 'DNI', 'eliseo.prada@yahoo.com','',
str_to_date('15/09/2004','%d/%m/%Y'));

/* LISTAMOS LOS REGISTROS DE LA TABLAS */
SELECT * FROM VENTA_DETALLE; 

/*INSERTAMOS LOS REGISTROS A LA TABLA VENDEDOR*/
INSERT INTO VENDEDOR 
(nombres , apellidos , numero_documento , tipo_documento , salario , email , celular)
VALUES 
('Enrique ' , 'Pérez Manco' , '85471236' , 'DNI' , '1500.00' , 'enrique.perez@outlook.com' ,'96521873'),
('Sofia' , 'Ávila Solis', '47259136' , 'DNI', '1350.00','',''),
('Marcela' , 'Napaico Cama' , '61542280', 'DNI', '1600.00', 'marcela.napaico@gmail.com','965874357'),
('Carmelo' , 'Rodríguez Chauca' , '742536140' , 'CNE' , '1550.00', 'carmelo.rodriguez@yahoo.com', '');

/*INSERTAMOS LOS REGISTROS EN LA TABLA PRENDA */
INSERT INTO PRENDA
(descripcion , marca , cantidad , talla , precio )
VALUES 
('Pantalon Jeans ' , 'Levis' , '60' , '28' , '65.80'),
('Camisa manga corta' , 'Adams' , '75', '16' , '55.00'),
('Polo sport' , 'Australia' , '100' , '16', '40.00'),
('Camisa manga larga ','Newport ' , '150' , '16' , '42.50'),
('Pijama para caballero ', 'Adams' , '180', '28' , '79.50'),
('corbata' , 'Maxwell' , '85' , '16' , '14.50'),
('Pijama para dama', 'Adams ' , '170' , '24', '55.50'),
('Pantalon Jeans','Australia' , '200' , '28' , '68.50'),
('Camisa Sport ' , 'Jhon Holden' , '85' , '16' , '88.50'),
('Shorts Jeans' , 'Pepe Jeans' , '185' , '28' , '77.20');  

/*INSERTAMOS LOS REGISTROS A LA TABLA VENTA */
INSERT INTO VENTA 
(fecha_hora , cliente_id , vendedor_id )
VALUES 
('2023-05-01 19:04:08 ' , '4' , '1'),
('2023-05-01 19:04:08 ' , '6' , '3'),
('2023-05-01 19:04:08 ' , '10' , '1'),
('2023-05-01 18:04:08 ' , '18', '4');

/*INSERTAMOS LOS REGISTROS DE LA TABLA VENTA_DETALLE*/
INSERT INTO VENTA_DETALLE 
(venta_id , prenda_id , cantidad )
VALUES 
('1' , '6' , '3'),
('1' , '3' , '5 '),
('1' , '2' , '7'),
('2' , '2' ,'3' ),
('3' , '7', '4'),
('3', '10', '6'),
('3' ,'2' ,  '6'),
('3' ,'5' ,'7'),
('4' , '2' , '4'),
('4' , '5' , '3');

/*ACTUALIZAMOS EL NUMERO CELULAR DE MARIO MAYO  POR EL NUMERO 922881101*/
UPDATE CLIENTE
	SET celular = '922881101'
WHERE nombres = 'Mario' AND apellidos = 'Rodríguez Mayo' AND id= '10';

SELECT * FROM CLIENTE;

/*pondremos un numero celular es:977226604 a Andgel M con DNI: 53298147*/
UPDATE CLIENTE
	SET celular = '977226604'
WHERE nombres = 'Angel M' AND apellidos = 'Rojas Avila' AND id= '13';

/*Eliminar logicamente a los clientes con dni : 11453265 , 74142585, 49985471*/
UPDATE CLIENTE
	SET activo = 0
    WHERE numero_documento = '49985471' AND id = '18'; /*12,14,18*/
    
/*Los clientes cuyos dni son : 87952514, 55869321 , 74142585 perdieron su celulares */
UPDATE CLIENTE 
	SET celular = ''
    WHERE numero_documento = '41552567' and id='17';/*9,13,17	*/
    
/*Reactivaremos al cliente 18 oscar quiroz savala y actualizaremos su nuevo correo */
UPDATE CLIENTE
	SET activo = 1,
    email = 'oscar.quiroz@yahoo.es'
    WHERE id='18';
    
/*Agregamos registros a la tabla cliente */
INSERT INTO CLIENTE 
(nombres , apellidos , numero_documento ,  tipo_documento , email ,celular , 
fecha_nacimiento )
VALUES 
('Gustavo Tadeo' , 'Quispe Solorzano' , '88225463' , 'DNI', 'gustavo.quispe@gmail.com','',
str_to_date('13/10/2001','%d/%m/%Y')),
('Daniela', 'Solis Vargas' , '15753595', 'DNI', 'daniela.soliz@outlook.com','',
str_to_date('09/11/1993','%d/%m/%Y')),
('Miltón Gregorio', 'Vásquez Iturrizaga','76314895' , 'DNI' ,'miltron.gregorio@yahoo.es', '974815233',
str_to_date('22/06/2004','%d/%m/%Y')),
('Verónica', 'Ancajima Araujo', '84725001','DNI' , 'veronica.ancajima@yahoo.es','',
str_to_date('04/11/1980','%d/%m/%Y')),
('Felicita', 'Marroquin Candela' , '11228514' , 'DNI' , 'felicita.marroquin@outlook.com', '966001472',
str_to_date('06/06/2006','%d/%m/%Y')),
('Luhana ' , 'Ortiz Rodriguez' , '51436952' , 'DNI', 'luhana.ortiz@outlook.como', '960405017',
str_to_date('25/11/1980','%d/%m/%Y'));

/*actualizamos el precio de polo sports de marca Australia a 45.00 */
UPDATE PRENDA
set precio = 45.00
where descripcion = "Polo sport" AND marca = "Australia" AND id='3';
SELECT *FROM CLIENTE;

/*CAMBIAMOS EL NOMBRE DE LA PRENDA CORBATA POR CORBATA MICHI ELEGANTE*/
UPDATE PRENDA
	SET descripcion = 'Corbata Michi Elegante'
    where marca ='Maxwell' AND id='6';

/*Eliminar físicamente las prendas: Camisa manga corta y Camisa Sport*/
DELETE FROM Prenda
WHERE descripcion IN ('Camisa manga corta', 'Camisa Sport') and id='9';

/*Eliminar físicamente a la vendedora Marcela Napaico Cama*/
DELETE FROM Vendedor
WHERE nombres = "Marcela" AND apellidos = "Napaico Cama" AND ID='3' ;

/*Elimina físicamente los clientes cuyos documentos son: 47142536 y 77889955*/
DELETE FROM Cliente
WHERE numero_documento IN ('47142536', '77889955') AND ID = '8';/*and id= '1'*/

/*Elimina todos los clientes nacidos en el año 1980*/
DELETE FROM CLIENTE
WHERE EXTRACT(YEAR FROM fecha_nacimiento)=1980 and id='26';/*24 ,2,26*/
