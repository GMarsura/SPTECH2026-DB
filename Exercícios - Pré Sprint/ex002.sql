-- Active: 1771594730768@@127.0.0.1@3306@db_olimpiadas
-- EX02

CREATE DATABASE db_olimpiadas;

USE db_olimpiadas

CREATE TABLE tb_esporte(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40) not null,
    categoria VARCHAR(20),
        constraint chkCategoria
            CHECK(categoria IN ("Individual" , "Coletivo")),
    numJogadores INT DEFAULT 0,
    estreia DATE,
    paisOrigem VARCHAR(30)
)

drop table tb_esporte

select * from tb_esporte;

--1
INSERT INTO tb_esporte(nome, categoria, numJogadores, estreia, paisOrigem) VALUES
('futebol', 'Coletivo', 11, '2026-01-01', 'Brasil'),
('basquete', 'Coletivo', 11, '2026-01-01', 'Brasil'),
('ginastica', 'Coletivo', 11, '2026-01-01', 'Brasil'),
('natação', 'Coletivo', 11, '2026-01-01', 'Brasil'),
('boxe', 'Coletivo', 11, '2026-01-01', 'Brasil')


--2
ALTER TABLE tb_esporte ADD COLUMN popularidade DECIMAL(10,2) DEFAULT 0.00 CONSTRAINT chkPopularidade CHECK (popularidade >= 0.00 AND popularidade <= 10.00)


--3
UPDATE tb_esporte SET popularidade = 9.5;

--4
SELECT * FROM tb_esporte ORDER BY popularidade ASC;

--5
SELECT * FROM tb_esporte WHERE estreia < '2000-01-01';

--6
ALTER TABLE tb_esporte ADD CONSTRAINT chkEstreia CHECK (estreia >= '1896-06-04');

--7
ALTER TABLE DROP CONSTRAINT chkCategoria;

--8
SELECT * FROM tb_esporte WHERE paisOrigem LIKE "_a%" OR paisOrigem LIKE "_A%";

--9
SELECT * FROM tb_esporte WHERE numJogadores >= 4 AND numJogadores <= 11;

--10
DELETE FROM tb_esporte WHERE id = 1 OR id = 3 OR id = 5;

