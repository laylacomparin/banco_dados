CREATE database EXERCI1 
DEFAULT CHARACTER SET UTF8
DEFAULT COLLATE UTF8_GENERAL_CI 

CREATE database EXERCI11 
DEFAULT CHARACTER SET UTF8
DEFAULT COLLATE UTF8_GENERAL_CI 

USE exerci11

CREATE TABLE PESSOAS ( 
ID INT NOT NULL AUTO_INCREMENT,
NOME VARCHAR(30) NOT NULL,
NASCIMENTO DATE,
SEXO ENUM('M', 'F'),
PESO DECIMAL(5,2),
ALTURA DECIMAL(3,2),
NACIONALIDADE VARCHAR (20) DEFAULT 'BRASIL',
PRIMARY KEY (ID))
DEFAULT CHARSET = UTF8;

INSERT INTO pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES
('Godofredo', '1995-10-10', 'M', '82.4', '1.81', 'Brasil');
INSERT INTO pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES
('Maria', '1995-12-10', 'F', '65.4', '1.68', 'Portugal');
INSERT INTO pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES
('John', '1980-10-10', 'M', '79.4', '1.75', 'Estados Unidos');
INSERT INTO pessoas VALUES
(DEFAULT, 'Daenerys', '1982-03-08', 'F', '65.4', '1.75', 'Dragonstone');


SELECT * FROM pessoas;


