CREATE DATABASE db_escola; 

USE db_escola;

CREATE TABLE tb_estudantes (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE, 
    turma VARCHAR(255),
    notas DECIMAL(4, 2) NOT NULL
);

INSERT INTO tb_estudantes (nome, data_nascimento, turma, notas) 
VALUES  ("Coco Channel", "2009-03-15", "1º Ano A", 8.5),
		("Damon Salvatore", "2009-07-22", "1º Ano B", 6.2),
		("Elena Gilbert", "2008-11-05", "2º Ano A", 9.7),
		("Caroline Forbes", "2009-01-18", "1º Ano A", 5.4),
		("Tayler Lockwood", "2008-09-30", "2º Ano B", 7.8),
		("Vick Donavan", "2007-04-12", "3º Ano A", 4.9),
		("Niklaus Mikaelson", "2009-06-25", "1º Ano C", 10.0),
		("Elijah Mickaelson", "2008-02-14", "2º Ano A", 6.8);

SELECT 
    nome,
    DATE_FORMAT(data_nascimento, '%d/%m/%Y') AS Data_Nascimento,
    TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade,
    turma,
    notas
FROM tb_estudantes;

SELECT  nome,
		TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade,
        turma,
        notas
FROM tb_estudantes WHERE notas > 7;

SELECT  nome,
		TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade,
        turma,
        notas 
FROM tb_estudantes WHERE notas < 7;

UPDATE tb_estudantes SET notas = 9.4 WHERE id = 4;

