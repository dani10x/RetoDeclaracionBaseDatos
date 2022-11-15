-- Generado por Oracle SQL Developer Data Modeler 21.2.0.183.1957
--   en:        2022-11-07 19:53:57 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE cajas CASCADE;

DROP TABLE carroceria CASCADE ;

DROP TABLE clase CASCADE;

DROP TABLE compañias_soat CASCADE;

DROP TABLE declaracion_de_impuestos CASCADE;

DROP TABLE departamento CASCADE;

DROP TABLE linea CASCADE;

DROP TABLE marca CASCADE;

DROP TABLE municipios CASCADE;

DROP TABLE tabla_avaluos CASCADE;

DROP TABLE traccion CASCADE;

DROP TABLE vehiculo CASCADE;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE cajas (
    id_caja VARCHAR(3) NOT NULL,
    nombre  VARCHAR(15) NOT NULL
);

ALTER TABLE cajas ADD CONSTRAINT cajas_pk PRIMARY KEY ( id_caja );

CREATE TABLE carroceria (
    nombre        VARCHAR(10) NOT NULL,
    id_carroceria VARCHAR(3) NOT NULL
);

ALTER TABLE carroceria ADD CONSTRAINT carroceria_pk PRIMARY KEY ( id_carroceria );

CREATE TABLE clase (
    id_clase VARCHAR(3) NOT NULL,
    nombre   VARCHAR(12) NOT NULL
);

ALTER TABLE clase ADD CONSTRAINT clase_pk PRIMARY KEY ( id_clase );

CREATE TABLE compañias_soat (
    nit    VARCHAR(15) NOT NULL,
    nombre VARCHAR(15) NOT NULL
);

ALTER TABLE compañias_soat ADD CONSTRAINT compañia_pk PRIMARY KEY ( nit );

CREATE TABLE declaracion_de_impuestos (
    nro_declaracion serial NOT NULL,
    vehiculo_placa  VARCHAR(6) NOT NULL,
    valor           NUMERIC(15) NOT NULL,
    fecha           DATE NOT NULL
);

ALTER TABLE declaracion_de_impuestos ADD CONSTRAINT declaracion_de_impuestos_pk PRIMARY KEY ( nro_declaracion );

CREATE TABLE departamento (
    id_departamento VARCHAR(5) NOT NULL,
    nombre          VARCHAR(20) NOT NULL
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( id_departamento );

CREATE TABLE linea (
    id_linea       VARCHAR(5) NOT NULL,
    nombre         VARCHAR(30) NOT NULL,
    marca_id_marca VARCHAR(5) NOT NULL
);

ALTER TABLE linea ADD CONSTRAINT linea_pk PRIMARY KEY ( id_linea );

CREATE TABLE marca (
    id_marca VARCHAR(5) NOT NULL,
    nombre   VARCHAR(15) NOT NULL
);

ALTER TABLE marca ADD CONSTRAINT marca_pk PRIMARY KEY ( id_marca );

CREATE TABLE municipios (
    id_municipio                 VARCHAR(5) NOT NULL,
    nombre                       VARCHAR(12) NOT NULL,
    departamento_id_departamento VARCHAR(5) NOT NULL
);

ALTER TABLE municipios ADD CONSTRAINT municipios_pk PRIMARY KEY ( id_municipio );

CREATE TABLE tabla_avaluos (
    id_avaluo      VARCHAR(5) NOT NULL,
    clase_id_clase VARCHAR(3) NOT NULL,
    modelo         NUMERIC(4) NOT NULL,
    cilindraje     NUMERIC(4) NOT NULL,
    valor          NUMERIC(10) NOT NULL,
    linea_id_linea VARCHAR(5) NOT NULL
);

ALTER TABLE tabla_avaluos ADD CONSTRAINT tabla_avaluos_pk PRIMARY KEY ( id_avaluo );

CREATE TABLE traccion (
    id_traccion VARCHAR(3) NOT NULL,
    nombre      VARCHAR(11) NOT NULL
);

ALTER TABLE traccion ADD CONSTRAINT traccion_pk PRIMARY KEY ( id_traccion );

CREATE TABLE vehiculo (
    placa                    VARCHAR(6) NOT NULL,
    clase_id_clase           VARCHAR(3) NOT NULL,
    carroceria_id_carroceria VARCHAR(3) NOT NULL,
    grupo                    VARCHAR(8) NOT NULL,
    nro_puertas              NUMERIC(1) NOT NULL,
    capacidad_carga          NUMERIC(5) NOT NULL,
    blindado                 CHAR(1) NOT NULL,
    importado                CHAR(1) NOT NULL,
    compañias_soat_nit       VARCHAR(15) NOT NULL,
    dv                       VARCHAR(1) NOT NULL,
    nro_poliza               VARCHAR(10) NOT NULL,
    vencimiento_poliza       DATE NOT NULL,
    cajas_id_caja            VARCHAR(3) NOT NULL,
    traccion_id_traccion     VARCHAR(3) NOT NULL,
    modelo                   NUMERIC(4) NOT NULL,
    cilindraje               NUMERIC(4) NOT NULL,
    municipios_id_municipio  VARCHAR(5) NOT NULL,
    linea_id_linea           VARCHAR(5) NOT NULL
);

ALTER TABLE vehiculo ADD CONSTRAINT vehiculo_pk PRIMARY KEY ( placa );

ALTER TABLE declaracion_de_impuestos
    ADD CONSTRAINT declaracion_vehiculo_fk FOREIGN KEY ( vehiculo_placa )
        REFERENCES vehiculo ( placa );

ALTER TABLE linea
    ADD CONSTRAINT linea_marca_fk FOREIGN KEY ( marca_id_marca )
        REFERENCES marca ( id_marca );

ALTER TABLE municipios
    ADD CONSTRAINT municipios_departamento_fk FOREIGN KEY ( departamento_id_departamento )
        REFERENCES departamento ( id_departamento );

ALTER TABLE tabla_avaluos
    ADD CONSTRAINT tabla_avaluos_clase_fk FOREIGN KEY ( clase_id_clase )
        REFERENCES clase ( id_clase );

ALTER TABLE tabla_avaluos
    ADD CONSTRAINT tabla_avaluos_linea_fk FOREIGN KEY ( linea_id_linea )
        REFERENCES linea ( id_linea );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_cajas_fk FOREIGN KEY ( cajas_id_caja )
        REFERENCES cajas ( id_caja );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_carroceria_fk FOREIGN KEY ( carroceria_id_carroceria )
        REFERENCES carroceria ( id_carroceria );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_clase_fk FOREIGN KEY ( clase_id_clase )
        REFERENCES clase ( id_clase );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_compañias_soat_fk FOREIGN KEY ( compañias_soat_nit )
        REFERENCES compañias_soat ( nit );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_linea_fk FOREIGN KEY ( linea_id_linea )
        REFERENCES linea ( id_linea );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_municipios_fk FOREIGN KEY ( municipios_id_municipio )
        REFERENCES municipios ( id_municipio );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_traccion_fk FOREIGN KEY ( traccion_id_traccion )
        REFERENCES traccion ( id_traccion );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             0
-- ALTER TABLE                             24
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
