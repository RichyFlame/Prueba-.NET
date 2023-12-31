
use PruebaDB


CREATE TABLE TIPO_INFORMACION (
COD_TIPO_INFORMACION INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
NOMBRE VARCHAR(50)
);

CREATE TABLE TIPO (
COD_TIPO INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
NOMBRE VARCHAR (50)
);

CREATE TABLE FORMATO_MENSAJE (
COD_FORMATO INT IDENTITY(1,1) PRIMARY KEY NOT NULL, 
COD_TIPO INT, 
COD_TIPO_INFORMACION INT,
NOMBRE VARCHAR (100),
REMITENTE VARCHAR (100),
ASUNTO VARCHAR (100),
CONSTRAINT FK_TIPO_FOMRATO FOREIGN KEY (COD_TIPO) REFERENCES TIPO (COD_TIPO),
CONSTRAINT FK_TIPO_INFO_FOMRATO FOREIGN KEY (COD_TIPO_INFORMACION) REFERENCES TIPO_INFORMACION (COD_TIPO_INFORMACION)
);

CREATE TABLE PROYECTO (
PROYECTO INT PRIMARY KEY NOT NULL,
NOMBRE VARCHAR (50)
);

CREATE TABLE PRODUCTO (
PRODUCTO INT PRIMARY KEY NOT NULL,
DESCRIPCION VARCHAR (100)
)

CREATE TABLE PRODUCTO_PROYECTO(
PROYECTO INT NOT NULL,
PRODUCTO INT NOT NULL,
CONSTRAINT PK_PRODUCTO_PROYECTO PRIMARY KEY (PROYECTO, PRODUCTO),
CONSTRAINT FK_PROYECTO FOREIGN KEY (PROYECTO) REFERENCES PROYECTO (PROYECTO),
CONSTRAINT FK_PRODUCTO FOREIGN KEY (PRODUCTO) REFERENCES PRODUCTO (PRODUCTO)
)

CREATE TABLE MENSAJE (
COD_MENSAJE INT IDENTITY(1,1) PRIMARY KEY NOT NULL, 
COD_FORMATO INT,
PROYECTO INT,
PRODUCTO INT,
CONSTRAINT FK_FORMATO_MENSAJE FOREIGN KEY (COD_FORMATO) REFERENCES FORMATO_MENSAJE (COD_FORMATO),
CONSTRAINT FK_PRODUCTO_PROYECTO_MENSAJE FOREIGN KEY (PROYECTO, PRODUCTO) REFERENCES PRODUCTO_PROYECTO (PROYECTO, PRODUCTO)
);


INSERT INTO PROYECTO(PROYECTO, NOMBRE) VALUES (1, 'PREMIA')
INSERT INTO PROYECTO(PROYECTO, NOMBRE) VALUES (2, 'KONMI')
INSERT INTO PROYECTO(PROYECTO, NOMBRE) VALUES (3, 'YUJULE')

INSERT INTO PRODUCTO(PRODUCTO, DESCRIPCION) VALUES (1, 'CLASICA')
INSERT INTO PRODUCTO(PRODUCTO, DESCRIPCION) VALUES (2, 'ORO')
INSERT INTO PRODUCTO(PRODUCTO, DESCRIPCION) VALUES (3, 'PLATINUM')

INSERT INTO PRODUCTO_PROYECTO(PRODUCTO, PROYECTO) VALUES (1,1)
INSERT INTO PRODUCTO_PROYECTO(PRODUCTO, PROYECTO) VALUES (1,2)
INSERT INTO PRODUCTO_PROYECTO(PRODUCTO, PROYECTO) VALUES (1,3)
INSERT INTO PRODUCTO_PROYECTO(PRODUCTO, PROYECTO) VALUES (2,1)
INSERT INTO PRODUCTO_PROYECTO(PRODUCTO, PROYECTO) VALUES (2,2)
INSERT INTO PRODUCTO_PROYECTO(PRODUCTO, PROYECTO) VALUES (2,3)
INSERT INTO PRODUCTO_PROYECTO(PRODUCTO, PROYECTO) VALUES (3,1)
INSERT INTO PRODUCTO_PROYECTO(PRODUCTO, PROYECTO) VALUES (3,2)
INSERT INTO PRODUCTO_PROYECTO(PRODUCTO, PROYECTO) VALUES (3,3)

INSERT INTO TIPO(NOMBRE) VALUES('MENSAJE DE TEXTO')
INSERT INTO TIPO(NOMBRE) VALUES('EMAIL')
INSERT INTO TIPO(NOMBRE) VALUES('MENSAJE EN ESTADO DE CUENTA')

INSERT INTO TIPO_INFORMACION(NOMBRE) VALUES('BINVENIDA')
INSERT INTO TIPO_INFORMACION(NOMBRE) VALUES('MORA')
INSERT INTO TIPO_INFORMACION(NOMBRE) VALUES('PROMOCION')

INSERT INTO FORMATO_MENSAJE(COD_TIPO, COD_TIPO_INFORMACION, NOMBRE, REMITENTE, ASUNTO) VALUES (1, 1, 'BIENVENIDA', 'PROMERICA', 'BIENVENIDO A PROMERICA')
INSERT INTO FORMATO_MENSAJE(COD_TIPO, COD_TIPO_INFORMACION, NOMBRE, REMITENTE, ASUNTO) VALUES (1, 3, 'PROMOCION', 'PROMERICA', 'PROMOCION')
INSERT INTO FORMATO_MENSAJE(COD_TIPO, COD_TIPO_INFORMACION, NOMBRE, REMITENTE, ASUNTO) VALUES (2, 1, 'BIENVENIDA', 'PROMERICA', 'BIENVENIDO A PROMERICA')
INSERT INTO FORMATO_MENSAJE(COD_TIPO, COD_TIPO_INFORMACION, NOMBRE, REMITENTE, ASUNTO) VALUES (2, 2, 'MORA', 'PROMERICA', 'CLEINTE EN MORA')
INSERT INTO FORMATO_MENSAJE(COD_TIPO, COD_TIPO_INFORMACION, NOMBRE, REMITENTE, ASUNTO) VALUES (2, 3, 'PROMOCION', 'PROMERICA', 'PROMOCIONES PROMERICA')
INSERT INTO FORMATO_MENSAJE(COD_TIPO, COD_TIPO_INFORMACION, NOMBRE, REMITENTE, ASUNTO) VALUES (3, 3, 'PROMOCION', 'PROMERICA', 'PROMOCIONES PROMERICA')


INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 1, 1, 1)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 1, 1, 2)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 1, 1, 3)

INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 2, 1, 1)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 2, 1, 2)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 2, 1, 3)

INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 3, 1, 1)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 3, 1, 2)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 3, 1, 3)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 3, 2, 1)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 3, 2, 2)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 3, 2, 3)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 3, 3, 1)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 3, 3, 2)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 3, 3, 3)

INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 4, 1, 1)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 4, 1, 2)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 4, 1, 3)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 4, 2, 1)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 4, 2, 2)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 4, 2, 3)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 4, 3, 1)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 4, 3, 2)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 4, 3, 3)

INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 5, 1, 1)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 5, 1, 2)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 5, 1, 3)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 5, 2, 1)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 5, 2, 2)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 5, 2, 3)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 5, 3, 1)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 5, 3, 2)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 5, 3, 3)

INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 6, 2, 1)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 6, 2, 2)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 6, 2, 3)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 6, 3, 1)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 6, 3, 2)
INSERT INTO MENSAJE (COD_FORMATO, PRODUCTO, PROYECTO) VALUES ( 6, 3, 3)


-- CONSULTA 1
SELECT PR.NOMBRE, P.DESCRIPCION FROM PRODUCTO_PROYECTO AS PP
INNER JOIN PRODUCTO AS P ON P.PRODUCTO = PP.PRODUCTO
INNER JOIN PROYECTO AS PR ON PR.PROYECTO = PP.PROYECTO

--CONSULTA 2
SELECT PY.NOMBRE, PD.DESCRIPCION, T.NOMBRE, TI.NOMBRE, FM.ASUNTO FROM MENSAJE AS M
INNER JOIN FORMATO_MENSAJE AS FM ON FM.COD_FORMATO = M.COD_FORMATO
INNER JOIN TIPO AS T ON T.COD_TIPO = FM.COD_TIPO
INNER JOIN TIPO_INFORMACION AS TI ON TI.COD_TIPO_INFORMACION = FM.COD_TIPO_INFORMACION
INNER JOIN PRODUCTO_PROYECTO AS PPRR ON PPRR.PRODUCTO = M.PRODUCTO AND PPRR.PROYECTO = M.PROYECTO
INNER JOIN PRODUCTO AS PD ON PD.PRODUCTO = PPRR.PRODUCTO
INNER JOIN PROYECTO AS PY ON PY.PROYECTO = PPRR.PROYECTO