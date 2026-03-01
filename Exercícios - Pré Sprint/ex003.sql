CREATE DATABASE desenho;

USE desenho;

CREATE TABLE tb_desenho(
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50) NOT NULL,
    dataLancamento DATE,
    emissoraOriginal VARCHAR(50),
    classificacao INT,
    status VARCHAR(15),
    nota INT,
        CONSTRAINT chkNota
            CHECK(nota >= 1 AND nota <= 5)
) AUTO_INCREMENT = 10;

SELECT * FROM tb_desenho;

-- 1
SELECT * FROM tb_desenho;

-- 2
SELECT * FROM tb_desenho WHERE classificacao <= 14;

-- 3
SELECT emissoraOriginal FROM tb_desenhoGROUP BY emissoraOriginal;

-- 4
ALTER TABLE tb_desenho 
ADD CONSTRAINT chkStatus 
CHECK(status IN ('exibindo','finalizado','cancelado'));

INSERT INTO tb_desenho(titulo, dataLancamento, emissoraOriginal, classificacao, status, nota)
VALUES ('Teste', '2020-01-01', 'Disney', 10, 'pausado', 4);

-- 5
UPDATE tb_desenho SET status = 'finalizado' WHERE id = 10 OR id = 11;

-- 6
DELETE FROM tb_desenho WHERE id = 12;

-- 7
SELECT * FROM tb_desenho WHERE titulo LIKE 'a%';

-- 8
ALTER TABLE tb_desenho RENAME COLUMN classificacao TO classificacaoIndicativa;

-- 9
UPDATE tb_desenho 
SET nota = 5, dataLancamento = '2015-05-05' 
WHERE id = 11;

-- 10
DELETE FROM tb_desenho;

-- 11
ALTER TABLE tb_desenho DROP CONSTRAINT chkStatus;