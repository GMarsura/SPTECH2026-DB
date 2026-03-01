CREATE DATABASE vingadores;

USE vingadores;

CREATE TABLE heroi(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    versao VARCHAR(45),
    habilidade VARCHAR(45),
    altura INT
);

INSERT INTO heroi(nome,versao,habilidade,altura) VALUES 
('Homem de Ferro
','Vingadores Ultimato','Inteligencia',185),
('Capitao America','Vingadores Guerra Infinita','Forca',188),
('Thor','Thor Ragnarok','Raio',198),('Hulk','Vingadores','Super Forca',250),
('Homem Aranha','Sem Volta Para Casa','Agilidade',178);

--1
SELECT * FROM heroi;

--2
ALTER TABLE heroi ADD COLUMN regeneracao BOOLEAN;

--3
ALTER TABLE heroi MODIFY versao VARCHAR(100);

--4
DELETE FROM heroi WHERE id=3;

--5
INSERT INTO heroi(nome,versao,habilidade,altura,regeneracao) VALUES('Ciclope','X-Men Apocalipse','Raio Optico',191,TRUE);

--6
SELECT * FROM heroi WHERE nome LIKE 'C%' OR nome LIKE 'H%';

--7
SELECT * FROM heroi WHERE nome NOT LIKE '%A%' AND nome NOT LIKE '%a%';

--8
SELECT nome FROM heroi WHERE altura>190;

--9
SELECT * FROM heroi WHERE altura>180 ORDER BY nome DESC;

--10
DELETE FROM heroi;