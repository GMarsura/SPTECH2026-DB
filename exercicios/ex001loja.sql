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


