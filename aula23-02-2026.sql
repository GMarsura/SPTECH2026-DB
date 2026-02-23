-- Aula 3

/*

DATA ___ lANGUAGE
DDL - DEFINITION
DATA DEFINITION LANGUAGE: CREATE TABLE, ALTER TABLE, DROP, TRUNCATE
DML - MANIPULATION:
DATA MANIPULATION LANGUAGE: INSERT, UPDATE, DELETE, SELECT
DQL:QUERY(CONSULTA): SELECT
CONTROL: GRANT, REVOKE

--SGB: MySQL Server.

*/

/*
    CONSTRAINT: RESTIÇÃO/REGRA/CONFIGURAÇÃO
    PRIMARY KEY (PK)
    NOT NULL
    DEFAULT
    UNIQUE
    CHECK


*/



CREATE DATABASE aula3;

USE aula3;

CREATE TABLE tb_funcionario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    dataNasc DATE,
    salario DECIMAL(6,2) DEFAULT 0,
    email VARCHAR(60) UNIQUE,
    dataCadastro DATETIME DEFAULT CURRENT_TIMESTAMP

) AUTO_INCREMENT = 1000;

CREATE TABLE tb_cargo (
    idCargo INT PRIMARY KEY AUTO_INCREMENT,
    cargo VARCHAR(50),
    constraint chkCargo
        check(cargo IN ('gerente', 'estagiario'))

) AUTO_INCREMENT = 1000;



SELECT current_timestamp();
SELECT now();
SELECT curdate();
SELECT curtime();




-- inserir dados
INSERT INTO tb_funcionario VALUES
(DEFAULT, 'Harvey', '1983-10-28', 100.99, 'harvey@gmail.com', DEFAULT);


INSERT INTO tb_funcionario(nome, salario) VALUES
('Mike', null),
('Peter', default);


INSERT INTO tb_funcionario(nome, salario, dataCadastro) VALUES
('Chico', DEFAULT, DEFAULT),
('Chica', null, null);


SELECT nome AS Nome, salario AS Salário FROM tb_funcionario

-- if null
SELECT nome, IFNULL(salario, 0) AS Salário FROM tb_funcionario;


--alias


-- CHECK

UPDATE tb_funcionario SET salario = -3.99 WHERE id = 1001;

ALTER TABLE tb_funcionario ADD CONSTRAINT chkSalario CHECK(salario >= 0);


--FRASES

SELECT 'Eu te amo' AS declaração
-- CONCAT

SELECT
    CONCAT('O funcionario ', nome, ' recebe ', salario, ' reais') AS fraseTop FROM tb_funcionario;

    SELECT
    CONCAT('O funcionario ', nome, ' recebe ', IFNULL(salario, '0'), ' reais') AS fraseTop FROM tb_funcionario;


    --CASE
    SELECT nome AS Nome,
        CASE
        WHEN salario >= 10.00 then 'Gerente'
        WHEN salario <= 10.00 THEN 'Esatgiario'
        END AS Cargo  FROM tb_funcionario

    SELECT nome AS Nome,
        CASE
        WHEN salario >= 10.00 then 'Gerente'
        WHEN salario <= 10.00 THEN 'Esatgiario'
        ELSE 'DEMITIDA'
        END AS Cargo  FROM tb_funcionario

    SELECT nome, DATE(dataCadastro) AS 'Data do Cadastro' FROM tb_funcionario;

    SELECT date_format (dataCadastro, '%d/%m/%y') AS 'Data do cadastro' FROM tb_funcionario

    SELECT nome, TIMESTAMPDIFF(YEAR, dATANasc, CURDATE()) AS idade FROM tb_funcionario 