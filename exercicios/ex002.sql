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

INSERT INTO tb_esporte(nome, categoria, numJogadores, estreia, paisOrigem) VALUES
('time1', 'Coletivo', 11, '2026-01-01', 'Brasil'),
('time2', 'Coletivo', 11, '2026-01-01', 'Brasil'),
('time3', 'Coletivo', 11, '2026-01-01', 'Brasil'),
('time4', 'Coletivo', 11, '2026-01-01', 'Brasil'),
('time5', 'Coletivo', 11, '2026-01-01', 'Brasil')

