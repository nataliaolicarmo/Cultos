
CREATE SCHEMA `vacina` ;

USE VACINA;



CREATE TABLE Horario (
  idHorario INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  horario VARCHAR(20) NULL, 
  Quantidade INTEGER UNSIGNED NULL,
  PRIMARY KEY(idHorario)
) AUTO_INCREMENT = 1;

CREATE TABLE Usuario (
  IdUsuario INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  NomeCompleto VARCHAR(500) NOT NULL,
  Sexo VARCHAR(1) NOT NULL,
  RG VARCHAR(20) NOT NULL,
  Idade INTEGER NOT NULL,
  Peso INTEGER NOT NULL,
  CPF VARCHAR(20) NOT NULL,
  PRIMARY KEY(IdUsuario)
) AUTO_INCREMENT = 1;


CREATE TABLE USUARIO_HORARIO (
IdUsuario INT UNSIGNED NOT NULL,
idHorario INT UNSIGNED NOT NULL,
FOREIGN KEY (IdUsuario) REFERENCES Usuario (IdUsuario),
FOREIGN KEY (idHorario) REFERENCES Horario (idHorario)
);


INSERT INTO Horario (horario, Quantidade)  VALUES('8:30 às 8:50', 9);
INSERT INTO Horario (horario, Quantidade) VALUES('8:50 às 9:10', 9);
INSERT INTO Horario (horario, Quantidade) VALUES('9:10 às 9:30', 9);
INSERT INTO Horario (horario, Quantidade) VALUES('9:30 às 9:50', 9);
INSERT INTO Horario (horario, Quantidade) VALUES('9:50 às 10:10', 9);
INSERT INTO Horario (horario, Quantidade) VALUES('10:10 às 10:30', 9);
INSERT INTO Horario (horario, Quantidade) VALUES('10:30 às 10:50', 9);
INSERT INTO Horario (horario, Quantidade) VALUES('10:50 às 11:10', 9);
INSERT INTO Horario (horario, Quantidade) VALUES('11:10 às 11:30', 8);


UPDATE Horario SET QUANTIDADE = 0 WHERE idHorario = 9

select idHorario, horario, Quantidade from Horario



select * from Usuario




