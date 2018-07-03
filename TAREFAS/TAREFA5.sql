#
#
# Centro Universitário Metodista Izabela Hendrix - Tecnologia em Ciência de Dados
#
# Grupo: Numiá Gomes, Layla Comparin, Larissa Fernandes
#
# Matéria: Banco de Dados Relacionais
# Professor: Pedro Kásso Ribeiro Matos Loureiro de Carvalho
#
# Projeto: Banco de Dados para Gestão de um Meetup
#
# Nome do Banco de Dados: meetup_rladies
#
#

## -------------------------- Criação do banco de dados e tabelas --------------------------- ##

/* Apenas para teste: apaga todo o banco de dados para criarmos novamente o mesmo */
DROP DATABASE MEETUP;

/* Cria o banco de dados */
CREATE DATABASE MEETUP;

/* Seleciona o banco de dados padrão como MEETUP */
USE MEETUP;

/* Cria a tabela de CATEGORIAS */
CREATE TABLE CATEGORIAS(
	ID_CATEG SMALLINT NOT NULL AUTO_INCREMENT,
    TIPO_DE_MEMBRO VARCHAR(50) NOT NULL,
	PRIMARY KEY (ID_CATEG)
);

/* Cria a tabela MEMBROS */
CREATE TABLE MEMBROS(
    ID_MEMBRO SMALLINT NOT NULL AUTO_INCREMENT,
    NOME VARCHAR(255) NOT NULL,
    EMAIL VARCHAR(255) NOT NULL,
    TELEFONE BIGINT NOT NULL,
    CIDADE VARCHAR(255) NOT NULL,
    FORMACAO VARCHAR(255) NOT NULL,
    INSTITUICAO VARCHAR(255) NOT NULL,
    DATA_ENTRADA DATE NOT NULL,
    ID_CATEG SMALLINT,
    PRIMARY KEY (ID_MEMBRO),
    CONSTRAINT FK_MEMBRO_CATEGORIA FOREIGN KEY (ID_CATEG) REFERENCES CATEGORIAS(ID_CATEG)
);

/* Cria a tabela de ENCONTROS */
CREATE TABLE ENCONTROS(
    ID_ENCONTROS SMALLINT NOT NULL AUTO_INCREMENT,
    NOME_MEETUP VARCHAR(255) NOT NULL,
    DATA_MEETUP DATETIME NOT NULL,
    LOCAL_MEETUP VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID_ENCONTROS)
);

/* Cria a tabela de CONFIRMACOES */
CREATE TABLE CONFIRMACOES(
    ID_ENCONTROS SMALLINT NOT NULL,
    ID_MEMBRO SMALLINT NOT NULL,
    CONFIRMADA VARCHAR (1), 
    COMPARECEU VARCHAR (1),
    CONSTRAINT FK_CONFIRM_ENCONTROS FOREIGN KEY (ID_ENCONTROS) REFERENCES ENCONTROS(ID_ENCONTROS),
    CONSTRAINT FK_CONFIRM_MEMBRO FOREIGN KEY (ID_MEMBRO) REFERENCES MEMBROS(ID_MEMBRO)
);

/* Cria a tabela de COTA_PATROCINIO */
CREATE TABLE COTA_PATROCINIO(
    ID_COTA SMALLINT AUTO_INCREMENT,
    TIPO_COTA VARCHAR (200),
    VALOR_COTA DECIMAL,
	PRIMARY KEY (ID_COTA)
);

/* Cria a tabela de PATROCINIOS */
CREATE TABLE PATROCINIOS(
    ID_ENCONTROS SMALLINT NOT NULL,
    ID_PATROCINIO SMALLINT AUTO_INCREMENT PRIMARY KEY,
    ID_COTA SMALLINT, 
    NOME_PATROCINADOR VARCHAR (200),
    CONSTRAINT FK_PATR_COTA FOREIGN KEY (ID_COTA) REFERENCES COTA_PATROCINIO(ID_COTA),
    CONSTRAINT FK_PATR_ENCONTR FOREIGN KEY (ID_ENCONTROS) REFERENCES ENCONTROS(ID_ENCONTROS)
);


## ----------------------- Fim da criação do banco de dados e tabelas ----------------------- ##

## ------------------------------ Inserindo dados nas tabelas ------------------------------- ##

INSERT INTO CATEGORIAS (TIPO_DE_MEMBRO)
VALUES ('ORGANIZADOR'), ('NORMAL'), ('FUNDADOR');

INSERT INTO MEMBROS (NOME, EMAIL, TELEFONE, CIDADE, FORMACAO, INSTITUICAO, DATA_ENTRADA, ID_CATEG)
VALUES ('NUMIA', 'etc@etc.com.br', '31988123336', 'BELO HORIZONTE', 'ESTATISTICA', 'UFOP', '2018-04-30', '1'), 
('VANESSA', 'etc@etc.com.br', '31988123336', 'BELO HORIZONTE', 'ESTATISTICA', 'UFMG', '2018-05-30', '2'),
('LIIVIA', 'etc@etc.com.br', '31988123336', 'BELO HORIZONTE', 'ESTATISTICA', 'UFMG', '2018-05-21', '2'),
('ANA CLARA', 'etc@etc.com.br', '31988123336', 'BELO HORIZONTE', 'ESTATISTICA', 'UFMG', '2018-05-22', '2'),
('LUANA', 'etc@etc.com.br', '31988123336', 'BELO HORIZONTE', 'ESTATISTICA', 'UFMG', '2018-05-22', '2'),
('LARISSA', 'etc@etc.com.br', '31988123336', 'BELO HORIZONTE', 'ESTATISTICA', 'UFMG', '2018-04-30', '1'),
('LAYLA', 'etc@etc.com.br', '31988123336', 'BELO HORIZONTE', 'ESTATISTICA', 'UFMG', '2018-04-30', '3'),
('CAROLINA', 'etc@etc.com.br', '31988123336', 'BELO HORIZONTE', 'ESTATISTICA', 'UFMG', '2018-05-30', '2'),
('GIOVANNA', 'etc@etc.com.br', '31988123336', 'BELO HORIZONTE', 'ESTATISTICA', 'PUC-BH', '2018-05-28', '2'),
('GABRIELA', 'etc@etc.com.br', '31988123336', 'BELO HORIZONTE', 'ESTATISTICA', 'UNA', '2018-06-16', '2'),
('SARAH', 'etc@etc.com.br', '31988123336', 'BELO HORIZONTE', 'ESTATISTICA', 'PUC-BH', '2018-07-01', '2'),
('NATALIA', 'etc@etc.com.br', '31988123336', 'BELO HORIZONTE', 'ESTATISTICA', 'UFOP', '2018-07-02', '2');

INSERT INTO ENCONTROS (NOME_MEETUP, DATA_MEETUP, LOCAL_MEETUP)
VALUES ('1º MEETUP', '2018-06-09', 'IZABELA HENDRIX');

INSERT INTO CONFIRMACOES (ID_ENCONTROS, ID_MEMBRO, CONFIRMADA, COMPARECEU)
VALUES (1, 1, 'S', 'S'), (1, 2, 'S', 'S'), (1, 3, 'S', 'S'), (1, 4, 'S', 'S'), (1, 5, 'S', 'S'), (1, 6, 'S', 'N'), (1, 7, 'S', 'N'),
 (1, 8, 'S', 'N'), (1, 9, 'S', 'N'), (1, 10, 'N', 'N'), (1, 11, 'N', 'N'), (1, 12, 'N', 'N');

INSERT INTO COTA_PATROCINIO (TIPO_COTA, VALOR_COTA)
VALUES ('SILVER', '300.00'), ('GOLD', '450.00'), ('DIAMOND', '600.00'), ('APOIO', '0');

INSERT INTO PATROCINIOS (ID_ENCONTROS, ID_COTA, NOME_PATROCINADOR)
VALUES (1, 3, 'HEKIMA'), (1, 1, 'FUMSOFT'), (1, 1, 'ABG CONSULTORIA'), (1, 1, 'DTI DIGITAL'), (1, 4, 'FRIENDSLAB');

## ------------------------- Fim do inclusão de dados nas tabelas --------------------------- ##

## ------------------------------- Respondendo as perguntas --------------------------------- ##

# 1.Quem são os membros ?

SELECT * FROM MEMBROS;

# 2.Quantos membros estão inscritos?

SELECT count(*) AS NUMMEMBRO FROM MEMBROS;

# 3.Quem são os membros organizadores ?

SELECT NOME, TIPO_DE_MEMBRO FROM MEMBROS M 
INNER JOIN CATEGORIAS C ON C.ID_CATEG = M.ID_CATEG
WHERE C.TIPO_DE_MEMBRO = 'ORGANIZADOR';

# 4.Quem são os membros fundadores?

SELECT NOME, TIPO_DE_MEMBRO FROM MEMBROS M 
INNER JOIN CATEGORIAS C ON C.ID_CATEG = M.ID_CATEG
WHERE C.TIPO_DE_MEMBRO = 'FUNDADOR';

# 5.Qual a instituição de formacao que mais aparece entre os membros?

SELECT INSTITUICAO, count(*) AS NVEZES FROM MEMBROS GROUP BY INSTITUICAO ORDER BY NVEZES DESC LIMIT 1;

# 6.Quantos encontros já aconteceram e em qual local ocorreram os eventos? 

SELECT COUNT(*) AS NUMENCONTROS, LOCAL_MEETUP FROM ENCONTROS;

# 7.Quantos membros confirmaram presença nos encontros?

SELECT COUNT(*) AS NUMEROCONFIRM FROM CONFIRMACOES
WHERE CONFIRMADA = 'S';

# 8.Quais membros confirmaram presença no evento e compareceram no evento?

SELECT NOME, CONFIRMADA, COMPARECEU FROM CONFIRMACOES C
INNER JOIN MEMBROS M ON M.ID_MEMBRO = C.ID_MEMBRO
WHERE CONFIRMADA = 'S' AND COMPARECEU = 'S';

# 9.Quais membros ficam vetados do próximo evento, por terem confirmado e não comparecido?

SELECT NOME, CONFIRMADA, COMPARECEU FROM CONFIRMACOES C
INNER JOIN MEMBROS M ON M.ID_MEMBRO = C.ID_MEMBRO
WHERE CONFIRMADA = 'S' AND COMPARECEU = 'N';

# 10.Quem são os apoiadores da comunidade e qual cota de patrocínio cada apoiador escolheu?

SELECT NOME_PATROCINADOR, TIPO_COTA FROM PATROCINIOS P
INNER JOIN COTA_PATROCINIO C ON P.ID_COTA = C.ID_COTA
ORDER BY 2 ASC;

# 9.Quem são os apoiadores da comunidade e qual cota de patrocínio cada apoiador escolheu?

SELECT NOME_PATROCINADOR, TIPO_COTA FROM PATROCINIOS P
INNER JOIN COTA_PATROCINIO C ON P.ID_COTA = C.ID_COTA
ORDER BY 2 ASC;

## --------------------------- Fim do respondendo as perguntas ------------------------------ ##


