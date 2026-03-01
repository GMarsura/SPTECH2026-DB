SELECT * FROM despesa WHERE descricao LIKE 'T%';

SELECT descricao FROM despesa WHERE descricao LIKE '%i_'

create database testeProva

create table despesa(
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(20)
)AUTO_INCREMENT = 0;

insert into despesa (descricao) VALUES
('oi'),
('oit'),
('toi')