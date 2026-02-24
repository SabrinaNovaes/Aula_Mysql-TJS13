CREATE DATABASE db_quitanda;

USE db_quitanda; 

CREATE TABLE tb_produtos (
	id bigint primary key auto_increment,
    nome varchar(255) not null,
    quantidade int,
    data_validade date,
    preco decimal not null
);

-- Comandos de Manipulação de dados -- 

-- Inserir 1 registro pro vez -- 
INSERT INTO tb_produtos (nome, quantidade, data_validade, preco)
VALUES ("tomate", 1000, "2026-03-24", 8.99);

INSERT INTO tb_produtos (nome, quantidade, data_validade, preco)
VALUES ("Agrião", 1000, "2026-03-24", 2.98);

-- Inserir vários registros ao mesmo tempo -- 
INSERT INTO tb_produtos (nome, quantidade, data_validade, preco)
VALUES ("cebola", 1000, "2026-03-24", 5.90);

INSERT INTO tb_produtos (nome, quantidade, data_validade, preco)
VALUES  ("banana", 15000, "2026-03-24", 12.90),
		("morango", 5000, "2026-03-14", 5.96),
		("alface", 1000, "2026-02-02", 2.98),
        ("beterraba",12000, "2026-03-23", 5.98);

SELECT * FROM tb_produtos;

UPDATE tb_produtos SET preco = 8.99 WHERE id = 1;

DELETE FROM tb_produtos WHERE id = 8;

-- Para desligar a trava de updates sem where -- 
-- SET SQL_SAFE_UPDATES = 0; -- SET SQL_SAFE_UPDATES = 1; -- HABILITA A TRAVA

-- Comandos Estruturais -- 

ALTER TABLE tb_produtos MODIFY preco decimal(6, 2);

-- Adiciona atributo --
ALTER TABLE tb_produtos ADD descricao varchar(5000);

-- Troca o nome -- 
ALTER TABLE tb_produtos CHANGE descricao descricao_produto varchar(5000);

-- deleta o atributo -- 
ALTER TABLE tb_produtos DROP descricao_produto; 

-- Retorna produto com id 2 --
SELECT * FROM tb_produtos WHERE id = 2;
-- Retorna produtos com preco maiores que 5,00 -- 
SELECT * FROM tb_produtos WHERE preco > 5.00;
-- Retorna produto nome banana ou preco maior que 10,00 --
SELECT * FROM tb_produtos WHERE nome = "banana" OR preco > 10.00;
-- Retorna se o produto for banana e o preco for maior que 20,00 --
SELECT * FROM tb_produtos WHERE nome = "banana" AND preco > 20.00;
-- Retorna todos os produtos que tenham nome diferente de banana -- 
SELECT * FROM tb_produtos WHERE nome != "banana";

SELECT  nome,
		DATE_FORMAT(data_validade, '%d/%m/%Y') AS Data_validade, 
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco 
FROM tb_produtos;