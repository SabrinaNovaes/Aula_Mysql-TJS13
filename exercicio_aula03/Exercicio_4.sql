CREATE DATABASE db_cidade_das_carnes;

USE db_cidade_das_carnes;

CREATE TABLE tb_categorias (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(255) NOT NULL,
    descricao VARCHAR(500) NOT NULL
);

CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    peso_kg DECIMAL(6,2) NOT NULL,
    data_validade DATE NOT NULL,
    disponivel BOOLEAN,
    categoria_id BIGINT,
    
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome_categoria, descricao) 
VALUES	('Carnes Bovinas', 'Cortes de carne de boi'),
		('Carnes Suínas', 'Cortes de carne de porco'),
		('Aves', 'Frango e outras aves'),
		('Embutidos', 'Linguiças e carnes processadas'),
		('Carnes Especiais', 'Cordeiro e carnes nobres');
        
INSERT INTO tb_produtos (nome_produto, preco, peso_kg, data_validade, disponivel, categoria_id) 
VALUES	('Picanha', 89.90, 1.20, '2026-03-05', TRUE, 1),
		('Alcatra', 49.90, 1.00, '2026-03-03', TRUE, 1),
		('Costela Bovina', 39.90, 2.50, '2026-03-06', TRUE, 1),
		('Lombo Suíno', 29.90, 1.30, '2026-03-04', TRUE, 2),
		('Costelinha Suína', 34.90, 1.80, '2026-03-05', TRUE, 2),
		('Peito de Frango', 19.90, 1.00, '2026-03-02', TRUE, 3),
		('Coxa e Sobrecoxa', 17.90, 1.50, '2026-03-02', TRUE, 3),
		('Linguiça Toscana', 22.90, 1.00, '2026-03-07', TRUE, 4),
		('Linguiça Calabresa', 24.90, 0.80, '2026-03-08', TRUE, 4),
		('Carré de Cordeiro', 99.90, 1.10, '2026-03-10', TRUE, 5);

-- Todos os produtos com INNER JOIN unindo as tabelas -- 
SELECT  nome_produto,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco,
		CONCAT(peso_kg, ' kg') AS peso, 
        DATE_FORMAT(data_validade, '%d/%m/%Y') AS validade,
        IF(disponivel = 1, "Sim", "Não") AS Disponivel,
        nome_categoria,
        descricao
FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id;

-- Todos os produtos com preco maior que 50.00 -- 
SELECT  nome_produto,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco,
		CONCAT(peso_kg, ' kg') AS peso, 
        DATE_FORMAT(data_validade, '%d/%m/%Y') AS validade,
        IF(disponivel = 1, "Sim", "Não") AS Disponivel,
        nome_categoria,
        descricao
FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id WHERE tb_produtos.preco > 50.00;

-- Todos os produtos com preco entre 50.00 e 100.00 -- 
SELECT  nome_produto,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco,
		CONCAT(peso_kg, ' kg') AS peso, 
        DATE_FORMAT(data_validade, '%d/%m/%Y') AS validade,
        IF(disponivel = 1, "Sim", "Não") AS Disponivel,
        nome_categoria,
        descricao
FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id WHERE Preco BETWEEN 50.00 AND 100.00;

-- Todos os registros que possuem letra c no nome -- 
SELECT  nome_produto,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco,
		CONCAT(peso_kg, ' kg') AS peso, 
        DATE_FORMAT(data_validade, '%d/%m/%Y') AS validade,
        IF(disponivel = 1, "Sim", "Não") AS Disponivel,
        nome_categoria,
        descricao
FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id WHERE nome_produto LIKE "%c%";

-- Todos os produtos da categoria aves -- 
SELECT  nome_produto,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco,
		CONCAT(peso_kg, ' kg') AS peso, 
        DATE_FORMAT(data_validade, '%d/%m/%Y') AS validade,
        IF(disponivel = 1, "Sim", "Não") AS Disponivel,
        nome_categoria,
        descricao
FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id WHERE nome_categoria = "aves";
