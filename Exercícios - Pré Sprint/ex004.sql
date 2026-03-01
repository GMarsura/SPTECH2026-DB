CREATE DATABASE estoque;

USE estoque;

CREATE TABLE MisteriosSA(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
        CONSTRAINT chkNome
            CHECK(nome IN ('Biscoitos Scooby','Cachorro-quente')),
    dataCompra DATE,
    preco DECIMAL(10,2),
    peso INT,
    dataRetirada DATE
);

SELECT * FROM MisteriosSA;

-- 1
INSERT INTO MisteriosSA(nome, dataCompra, preco, peso) VALUES
('Biscoitos Scooby','2024-07-01',25.50,500),
('Cachorro-quente','2024-07-10',35.00,300),
('Biscoitos Scooby','2024-07-20',28.00,450),
('Cachorro-quente','2024-08-01',40.00,350),
('Biscoitos Scooby','2024-08-15',30.50,500);

-- 2
SELECT * FROM MisteriosSA;

-- 3
SELECT id, nome, dataCompra, dataRetirada FROM MisteriosSA ORDER BY dataCompra ASC;

-- 4
UPDATE MisteriosSA SET dataRetirada = '2024-09-01' WHERE nome = 'Biscoitos Scooby' ORDER BY dataCompra ASC LIMIT 1;

-- 5
ALTER TABLE MisteriosSA RENAME COLUMN id TO idComida;

-- 6
ALTER TABLE MisteriosSA DROP CONSTRAINT chkNome;

ALTER TABLE MisteriosSA ADD CONSTRAINT chkNome CHECK(nome IN ('Biscoitos Scooby','Cachorro-quente'));

-- 7
SELECT nome,
       dataCompra AS "data da compra",
       dataRetirada AS "data da retirada"
FROM MisteriosSA
WHERE nome = 'Biscoitos Scooby';

-- 8
SELECT * FROM MisteriosSA WHERE dataCompra < '2024-07-25';

-- 9
SELECT * FROM MisteriosSA WHERE preco >= 30.50;

-- 10
DELETE FROM MisteriosSA;