-- CREATE DATABASE biblioteca;

USE biblioteca;

CREATE TABLE autor(
	id_autor smallint primary key auto_increment,
    nome_autor varchar(50) NOT NULL
);

CREATE TABLE editora(
	id_editora smallint primary key auto_increment,
    nome_editora varchar(50) NOT NULL
);


CREATE TABLE livros(
	id_livro smallint primary key auto_increment,
    id_autor smallint,
    id_editora smallint,
    nome_livro varchar(50) NOT NULL,
    ISBN varchar(30) NOT NULL,
    Preco_livro decimal NOT NULL
);

ALTER TABLE livros ADD CONSTRAINT fk_autor FOREIGN KEY ( id_autor) REFERENCES autor ( id_autor );
ALTER TABLE livros ADD CONSTRAINT fk_editora FOREIGN KEY ( id_editora) REFERENCES editora ( id_editora );
 
select * from livros;
select * from autor;
select * from editora;

INSERT INTO editora
(nome_editora)
VALUES
('Pearson'),
('Reed Elsevier'),
('ThomsonReuters'),
('Wolters Kluwer'),
('Teste')
;

INSERT INTO autor
(nome_autor)
VALUES
('João'),
('Felipe'),
('Nelson'),
('José'),
('Pedro')
;

drop table livros;

INSERT INTO livros
(nome_livro, id_autor, id_editora, ISBN, Preco_Livro)
VALUES
-- ('Java Como Programar', '1', '1', '978-1-4028-9462-6', '22.31')
('Bancos de Dados', '2', '3', '778-1-4028-9462-6', '70.31'),
('HTML 5', '2', '4', '678-1-4028-9462-6', '92.31'),
('Angular', '3', '5', '578-1-4028-9462-6', '31.31')
;

desc livros;

select * from livros as l
left join editora as e on l.id_editora = e.id_editora;

select * from livros as l
right join editora as e on l.id_editora = e.id_editora;

select * from livros as l
inner join editora as e on l.id_editora = e.id_editora;

select * from livros as l
left join editora as e on l.id_editora = e.id_editora
where e.id_editora IS NULL;

INSERT INTO livros
(nome_livro, ISBN, Preco_Livro)
VALUES
-- ('Java Como Programar', '1', '1', '978-1-4028-9462-6', '22.31')
('Big Data', '778-1-4328-9462-6', '28.75'),
('Ciência de Dados', '678-1-2828-9462-6', '46.31'),
('Aprendizado de Máquina', '578-1-6628-9462-6', '77.31')
;