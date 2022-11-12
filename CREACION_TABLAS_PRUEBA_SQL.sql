CREATE SCHEMA IF NOT EXISTS minimarket_schema;

#DROP TABLE PROVEEDORES;
#DROP TABLE PRODUCTO;
#DROP TABLE MINIMARKET;
#DROP TABLE CIUDAD;
#DROP TABLE DUENIO;
#DROP TABLE TIPO;

CREATE TABLE `minimarket_schema`.`PROVEEDORES`(
`ID_proveedor` Int NOT NULL AUTO_INCREMENT,
`nombre_proveedor` VARCHAR(80) NOT NULL,
`empresa_proveedor` VARCHAR(50) NOT NULL,
`rut_proovedor` VARCHAR(10) NOT NULL,
`telefono_proveedor` INT NULL,
`tipo_proveedor` VARCHAR(30) NOT NULL,
PRIMARY KEY (`ID_proveedor`)); 

CREATE TABLE `minimarket_schema`.`PRODUCTO`(
`ID_producto` Int NOT NULL AUTO_INCREMENT,
`nombre_producto` VARCHAR(40) NOT NULL,
`precio_producto` INT NOT NULL,
`fechaV_producto` DATE NULL,
`perecible_producto` BOOLEAN NULL,
PRIMARY KEY (`ID_producto`)); 

CREATE TABLE `minimarket_schema`.`MINIMARKET`(
`ID_minimarket` Int NOT NULL AUTO_INCREMENT,
`nombre_minimarket` VARCHAR(25) NOT NULL,
`direccion_minimarket` VARCHAR(20) NOT NULL,
`patente_minimarket` VARCHAR(20) NOT NULL,
`fechaFundacion_minimarket` DATE NULL,
PRIMARY KEY (`ID_minimarket`)); 


CREATE TABLE `minimarket_schema`.`CIUDAD`(
`ID_ciudad` Int NOT NULL AUTO_INCREMENT,
`nombre_ciudad` VARCHAR(25) NOT NULL,
`region_ciudad` VARCHAR(20) NOT NULL,
`codigoPostal_ciudad` INT NOT NULL,
PRIMARY KEY (`ID_ciudad`)); 

CREATE TABLE `minimarket_schema`.`DUENIO`(
`ID_duenio` Int NOT NULL AUTO_INCREMENT,
`nombre_duenio` VARCHAR(45) NOT NULL,
`rut_duenio` VARCHAR(10) NOT NULL,
`telefono_duenio` INT NULL,
`fechaN_duenio` DATE NOT NULL,
`correo_duenio` VARCHAR (25) NULL,
`nacionalidad_duenio` VARCHAR (45) NOT NULL,
PRIMARY KEY (`ID_DUENIO`)); 

CREATE TABLE `minimarket_schema`.`TIPO`(
`ID_tipo` INT NOT NULL AUTO_INCREMENT,
`nombre_tipo` VARCHAR(20) NOT NULL,
PRIMARY KEY(`ID_TIPO`));

ALTER TABLE minimarket_schema.proveedores ADD ID_producto INT NOT NULL;
ALTER TABLE minimarket_schema.proveedores ADD CONSTRAINT FKproveedorProducto FOREIGN KEY (ID_producto) REFERENCES minimarket_schema.producto(ID_producto);

ALTER TABLE minimarket_schema.producto ADD ID_tipo INT NOT NULL;
ALTER TABLE minimarket_schema.producto ADD CONSTRAINT FKproductoTipo FOREIGN KEY (ID_tipo) REFERENCES minimarket_schema.tipo(ID_tipo);

ALTER TABLE minimarket_schema.minimarket ADD ID_producto INT NOT NULL;
ALTER TABLE minimarket_schema.minimarket ADD CONSTRAINT FKminimarketProducto FOREIGN KEY (ID_producto) REFERENCES minimarket_schema.producto(ID_producto);

ALTER TABLE minimarket_schema.ciudad ADD ID_minimarket INT NOT NULL;
ALTER TABLE minimarket_schema.ciudad ADD CONSTRAINT FKciudadMinimarket FOREIGN KEY (ID_minimarket) REFERENCES minimarket_schema.minimarket(ID_minimarket);

ALTER TABLE minimarket_schema.duenio ADD ID_minimarket INT NOT NULL;
ALTER TABLE minimarket_schema.duenio ADD CONSTRAINT FKduenioMinimarket FOREIGN KEY (ID_minimarket) REFERENCES minimarket_schema.minimarket(ID_minimarket);

#DATOS DE TIPOS

INSERT INTO tipo (nombre_tipo) VALUES ('Carnes');
INSERT INTO tipo (nombre_tipo) VALUES ('Verduras');
INSERT INTO tipo (nombre_tipo) VALUES ('Dulces');
INSERT INTO tipo (nombre_tipo) VALUES ('Pan');
INSERT INTO tipo (nombre_tipo) VALUES ('Bebidas');


#DATOS DE PRODUCTOS

INSERT INTO producto (nombre_producto,ID_tipo,precio_producto,fechaV_producto,perecible_producto)
VALUES ('pollo',1,2500,20220525,true);

INSERT INTO producto (nombre_producto,ID_tipo,precio_producto,fechaV_producto,perecible_producto)
VALUES ('lechuga',2,1500,20220307,false);

INSERT INTO producto (nombre_producto,ID_tipo,precio_producto,fechaV_producto,perecible_producto)
VALUES ('picoDulce',3,1000,20221120,false);

INSERT INTO producto (nombre_producto,ID_tipo,precio_producto,fechaV_producto,perecible_producto)
VALUES ('Pan amasado',4,900,20221115,false);

INSERT INTO producto (nombre_producto,ID_tipo,precio_producto,fechaV_producto,perecible_producto)
VALUES ('Coca Cola',5,2000,20221130,false);

#DATOS DE PROVEEDORES

INSERT INTO proveedores (nombre_proveedor,ID_producto,empresa_proveedor,rut_proovedor,telefono_proveedor,tipo_proveedor)
VALUES ('Pollos hermanos',1,'Super Pollo','14567321-9',935798642,false);

INSERT INTO proveedores (nombre_proveedor,ID_producto,empresa_proveedor,rut_proovedor,telefono_proveedor,tipo_proveedor)
VALUES ('Guayarauco',2,'AndinaValle','12873623-3',983548265,true);

INSERT INTO proveedores (nombre_proveedor,ID_producto,empresa_proveedor,rut_proovedor,telefono_proveedor,tipo_proveedor)
VALUES ('CookieRun',3,'Nestle','12765483-6',965739982,false);

INSERT INTO proveedores (nombre_proveedor,ID_producto,empresa_proveedor,rut_proovedor,telefono_proveedor,tipo_proveedor)
VALUES ('ManjarMM',4,'Oxxo','78456932-9',943726577,true);

INSERT INTO proveedores (nombre_proveedor,ID_producto,empresa_proveedor,rut_proovedor,telefono_proveedor,tipo_proveedor)
VALUES ('GigaPapas',5,'Curimomatsu','42069666-k',965746643,false);

INSERT INTO minimarket (nombre_minimarket,ID_producto,direccion_minimarket,patente_minimarket,fechaFundacion_minimarket)
VALUES ('Minimarket Don Jose',1,'Jose Domingo 2306','Bazar',"1999-03-12");

INSERT INTO ciudad (nombre_ciudad,ID_minimarket,region_ciudad,codigoPostal_ciudad)
VALUES ('Santiago',1,'Metropolitana',196000000);

INSERT INTO duenio (nombre_duenio,ID_minimarket,rut_duenio,telefono_duenio,fechaN_duenio,correo_duenio,nacionalidad_duenio)
VALUES ('José San Martin',1,'20108680-9',996481410,"1989-03-31",'ReyJosePadre@gmail.com','Chileno');

INSERT INTO duenio (nombre_duenio,ID_minimarket,rut_duenio,telefono_duenio,fechaN_duenio,correo_duenio,nacionalidad_duenio)
VALUES ('Manuel Esposito',1,'11801068-6',981515335,"1979-12-13",'NicoNicoNii@gmail.com','Estado Unidense');




SELECT
mi.ID_minimarket as ID_MINIMARKET,
mi.nombre_minimarket as "Nombre Minimarket",
mi.direccion_minimarket as "Direccion",
mi.patente_minimarket as "Patente",
mi.fechaFundacion_minimarket as "Fundacion Minimarket",
du.nombre_duenio as "Duenio",
du.telefono_duenio as "Telefono Contacto",
du.correo_duenio as "Correo Contacto"
from minimarket mi 
join duenio du on mi.ID_minimarket = du.ID_minimarket 

order by 1;

select 
count(duc.ID_producto) as  "Cantidad de Productos", 
SUM(duc.precio_producto) "Valor total",
duc.fechaV_producto "Caducidad",
duc.perecible_producto "¿Perecible?",
pro.nombre_proveedor as "Proveedor",
pro.empresa_proveedor as "Empresa",
pro.telefono_proveedor as "Telefono Proveedor"




 from producto duc join proveedores pro on duc.ID_producto = pro.ID_producto
 where 
    ID_proveedor = 1 
 # ID_proveedor = 2
 # ID_proveedor = 3
 # ID_proveedor = 4
 # ID_proveedor = 5
 # dependiendo de  que where se le atribuya , mostrara diferentes resulados 
 order by 1
 ;


