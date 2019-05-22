CREATE TABLE alumnos
(
  cod    VARCHAR(10) PRIMARY KEY NOT NULL,
  apenom VARCHAR(30),
  direc  VARCHAR(30),
  pobla  VARCHAR(15),
  telef  VARCHAR(10)  
) ;

CREATE TABLE asignaturas
(
  cod    VARCHAR(3) PRIMARY KEY NOT NULL,
  nombre VARCHAR(5)
) ;


CREATE TABLE notas
(
  alum VARCHAR(10) NOT NULL,
  asig VARCHAR(3) NOT NULL,
  calificacion FLOAT(3,1),
  PRIMARY KEY( alum, asig) 
);

ALTER TABLE notas ADD FOREIGN KEY (alum) REFERENCES alumnos(cod);
ALTER TABLE notas ADD FOREIGN KEY (asig) REFERENCES asignatura(cod);


INSERT INTO alumnos VALUES ('n12344345', 'Alcalde García, Luis', 'Las Manos, 24', 'Lamadrid', '942756645');
INSERT INTO alumnos VALUES ('n43483437', 'González Pérez, Olga', 'Miraflor 28 - 3A', 'Torres', '942564355');;
INSERT INTO alumnos VALUES ('n88234942', 'Fernández Díaz, María', 'Luisa Fernanda 53', 'Miera', '942346945');;

INSERT INTO asignaturas VALUES ('a1', 'FH');
INSERT INTO asignaturas VALUES ('a2', 'FOL');
INSERT INTO asignaturas VALUES ('a3', 'ISO');
INSERT INTO asignaturas VALUES ('a4', 'LMSGI');
INSERT INTO asignaturas VALUES ('a5', 'PAR');
INSERT INTO asignaturas VALUES ('a6', 'GBD');

INSERT INTO notas VALUES ('n12344345', 'a1', '4');
INSERT INTO notas VALUES ('n43483437', 'a1', '5');
INSERT INTO notas VALUES ('n88234942', 'a1', '8');
INSERT INTO notas VALUES ('n12344345', 'a2', '10');
INSERT INTO notas VALUES ('n43483437', 'a2', '7');
INSERT INTO notas VALUES ('n88234942', 'a2', '6');
INSERT INTO notas VALUES ('n12344345', 'a3', '3');
INSERT INTO notas VALUES ('n88234942', 'a3', '6');
INSERT INTO notas VALUES ('n12344345', 'a4', '8');
INSERT INTO notas VALUES ('n43483437', 'a4', '4');
INSERT INTO notas VALUES ('n12344345', 'a5', '6');
INSERT INTO notas VALUES ('n12344345', 'a6', '9');
