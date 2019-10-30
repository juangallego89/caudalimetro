DROP DATABASE IF EXISTS CAUDALIMETRO;
CREATE DATABASE CAUDALIMETRO 
GO
USE CAUDALIMETRO 
GO
CREATE TABLE PERSONAS
(
	PERSONA_ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	USUARIO_ID INT NOT NULL,
	PRIMER_NOMBRE VARCHAR(50) NOT NULL,
	SEGUNDO_NOMBRE VARCHAR(50),
	PRIMER_APELLIDO VARCHAR(50) NOT NULL,
	SEGUNDO_APELLIDO VARCHAR(50),
	TIPO_DOCUMENTO VARCHAR(3) NOT NULL,
	NUMERO_DOCUMENTO INT NOT NULL,
	SEXO VARCHAR(10) NOT NULL,
	FECHA_NACIMIENTO DATE NOT NULL,
	TELEFONO VARCHAR (10),
	ESTADO_REGISTRO INT DEFAULT 1 NOT NULL,
)
CREATE TABLE USUARIOS 
(
	USUARIO_ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	USUARIO VARCHAR(50) NOT NULL,
	CONTRASENA VARCHAR(10) NOT NULL,
	PERSONA_ID INT NOT NULL,
	CORREO VARCHAR(50) NOT NULL,
	CODIGO_USUARIO_VIVIENDA INT NOT NULL,
	ESTADO VARCHAR(10) DEFAULT 'Activo' NOT NULL,
	ESTADO_REGISTRO INT DEFAULT 1 NOT NULL
	CONSTRAINT FK_USUARIOS_PERSONAS FOREIGN KEY (PERSONA_ID) REFERENCES PERSONAS (USUARIO_ID)
)
GO
GO
CREATE TABLE VIVIENDAS
(
	VIVIENDA_ID INT IDENTITY PRIMARY KEY NOT NULL,
	USUARIO_ID INT NOT NULL,
	DIRECCION VARCHAR(100) NOT NULL,
	ESTADO VARCHAR(10) DEFAULT 'Activo',
	ESTADO_REGISTRO INT DEFAULT 1,
	CONSTRAINT FK_VIVIENDAS_USUARIOS FOREIGN KEY (USUARIO_ID) REFERENCES USUARIOS (USUARIO_ID)
)
GO
CREATE TABLE SENSORES
(
	SENSOR_ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	VIVIENDA_ID INT NOT NULL,
	NOMBRE VARCHAR(50) NOT NULL,
	NIVEL_BATERIA INT NOT NULL,
	ESTADO VARCHAR(10) DEFAULT 'Activo',
	ULTIMA_LECTURA DATE NOT NULL,
	SERIAL VARCHAR(10) NOT NULL,
	ESTADO_REGISTRO INT DEFAULT 1,
	CONSTRAINT FK_SENSORES_VIVIENDAS FOREIGN KEY (SENSOR_ID) REFERENCES VIVIENDAS (VIVIENDA_ID)
)
GO
CREATE TABLE LECTURAS
(
	LECTURA_ID INT IDENTITY PRIMARY KEY NOT NULL,
	SENSOR_ID INT NOT NULL,
	ESTADO_REGISTRO INT DEFAULT 1,
	CONSTRAINT FK_LECTURAS_SENSORES FOREIGN KEY (SENSOR_ID) REFERENCES SENSORES (SENSOR_ID)
)
GO
INSERT INTO USUARIOS ("USUARIO", "CONTRASENA", "")
VALUES()
INSERT INTO PERSONAS ("USUARIO_ID","PRIMER_NOMBRE", "SEGUNDO_NOMBRE", "PRIMER_APELLIDO", "SEGUNDO_APELLIDO", "TIPO_DOCUMENTO", "NUMERO_DOCUMENTO", "SEXO", "FECHA_NACIMIENTO", "TELEFONO") 
VALUES (1,'JUAN', 'DAVID', 'GALLEGO', 'GIRALDO', 'CC', 1145632124, 'M', '1989-09-30', '3103102030' )
