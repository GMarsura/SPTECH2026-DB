-- EX 01
    

    CREATE DATABASE db_loja_de_jogos;

    USE db_loja_de_jogos;


    CREATE TABLE jogos(
        id INT PRIMARY KEY AUTO_INCREMENT,
        gameName VARCHAR(30) NOT NULL,
        gameDirector VARCHAR(30) NOT NULL,
        kindGame VARCHAR(60) NOT NULL,
        releaseDate DATE,
        rating INT DEFAULT 0,
            constraint ChkRating
                CHECK(rating >=0 AND rating <=10),
        quantityAvailable INT DEFAULT 0
    );

    DELETE FROM jogos

    drop table jogos

    --1
    INSERT INTO jogos (`gameName`, `gameDirector`, `kindGame`, `releaseDate`, `rating`, `quantityAvailable`) VALUES
        ('Red Dead Redenption2', 'Rockstar', 'mundo aberto', '2018-01-01', 10, 10),
        ('Tlou', 'Naughty Dog', 'linear', '2013-01-01', 10, 10),
        ('Gow', 'Santa Monica Studio', 'Linear', '2005-01-01', 10, 10),
        ('Gow2', 'Santa Monica Studio', 'Linear', '2007-01-01', 10, 10),
        ('Gow3', 'Santa Monica Studio', 'Linear', '2010-01-01', 10, 10)


    -- 2
    ALTER TABLE jogos ADD midiaKind VARCHAR(10) constraint  chkMidiaKind CHECK (midiaKind IN ('fisica', 'digital'))

    ALTER TABLE jogos ADD CONSTRAINT chkMidiaKind CHECK(midiaKind IN ('fisica', 'digital'))

    --3
    update jogos set midiaKind = 'fisica'

    --4
    SELECT * FROM jogos WHERE YEAR(releaseDate) >= 2015

    --5

    SELECT * FROM jogos WHERE gameName NOT LIKE '%a%' OR gameName NOT LIKE '%A%';


    --6
    SELECT * FROM jogos WHERE gameDirector NOT LIKE '%e%' OR  gameDirector NOT LIKE '%E%';

    --7
    ALTER TABLE jogos DROP CONSTRAINT ChkRating;

    ALTER TABLE jogos ADD CONSTRAINT ChkRating CHECK(rating >= 0 and rating <= 10)

    --8

    SELECT gameName, quantityAvailable FROM jogos WHERE quantityAvailable >= 0

    --9

    DELETE FROM jogos WHERE quantityAvailable <= 0

    --10

        select gameDirector AS gameCreator FROM jogos

        --ou

        select gameCreator AS gameDirector FROM jogos

        --ou

        ALTER TABLE jogos RENAME COLUMN gameDirector to gameCreator

-- EX 02
    -- Active: 1771594730768@@127.0.0.1@3306@db_olimpiadas

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

-- EX 03
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

-- EX 04
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

-- EX 05
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




