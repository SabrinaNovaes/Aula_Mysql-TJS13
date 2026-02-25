CREATE DATABASE db_pizzaria_legal; 

USE db_pizzaria_legal;

CREATE TABLE tb_categorias (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(255) NOT NULL,
    descricao VARCHAR(500) NOT NULL
);

CREATE TABLE tb_pizzas (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_pizza VARCHAR(255) NOT NULL,
    tamanho VARCHAR(50) NOT NULL,
    preco DECIMAL(6,2) NOT NULL,
    borda_recheada BOOLEAN,
    categoria_id BIGINT,
    
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome_categoria, descricao) 
VALUES	("Tradicional", "Pizzas com sabores clássicos e populares."),
		("Especial", "Sabores diferenciados com combinações especiais."),
		("Premium", "Pizzas gourmet com ingredientes selecionados."),
		("Vegetariana", "Pizzas sem carne."),
		("Doce", "Pizzas doces para sobremesa."),
        ("Fit", "Pizzas com massa integral, ingredientes leves e opções com baixo teor calórico.");

INSERT INTO tb_pizzas (nome_pizza, tamanho, preco, borda_recheada, categoria_id) 
VALUES	("Calabresa", "Grande", 45.00, TRUE, 1),
		("Mussarela", "Média", 39.90, FALSE, 1),
		("Frango com Catupiry", "Grande", 55.00, TRUE, 2),
		("Quatro Queijos", "Grande", 59.90, FALSE, 2),
		("Camarão Especial", "Grande", 79.90, TRUE, 3),
		("Parma com Rúcula", "Média", 72.50, FALSE, 3),
		("Marguerita", "Média", 42.00, FALSE, 4),
		("Brócolis com Alho", "Grande", 48.00, TRUE, 4),
		("Chocolate com Morango", "Média", 50.00, TRUE, 5),
		("Frango com Ricota Integral", "Grande", 46.90, FALSE, 6);

-- Consulta com Inner JOIN unindo as tabelas -- 
SELECT  nome_pizza,
		tamanho,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco,
		IF(borda_recheada = 1, "Sim", "Não") AS borda_recheada,
        nome_categoria,
        descricao
FROM tb_pizzas INNER JOIN tb_categorias ON tb_pizzas.categoria_id = tb_categorias.id;

-- Todas as pizzas com preco maior que 45.00 --
SELECT  nome_pizza,
		tamanho,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco,
		IF(borda_recheada = 1, "Sim", "Não") AS borda_recheada,
        nome_categoria,
        descricao
FROM tb_pizzas INNER JOIN tb_categorias ON tb_pizzas.categoria_id = tb_categorias.id WHERE preco > 45.00;

-- Todas as pizzas com preco entre 50.00 e 100.00 --
SELECT  nome_pizza,
		tamanho,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco,
		IF(borda_recheada = 1, "Sim", "Não") AS borda_recheada,
        nome_categoria,
        descricao
FROM tb_pizzas INNER JOIN tb_categorias ON tb_pizzas.categoria_id = tb_categorias.id WHERE preco BETWEEN 50.00 AND 100.00;

-- Todas as pizzas que possuem M no nome -- 
SELECT  nome_pizza,
		tamanho,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco,
		IF(borda_recheada = 1, "Sim", "Não") AS borda_recheada,
        nome_categoria,
        descricao
FROM tb_pizzas INNER JOIN tb_categorias ON tb_pizzas.categoria_id = tb_categorias.id WHERE nome_pizza LIKE "%M%";

-- Todas as pizzas doces -- 
SELECT  nome_pizza,
		tamanho,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco,
		IF(borda_recheada = 1, "Sim", "Não") AS borda_recheada,
        nome_categoria,
        descricao
FROM tb_pizzas INNER JOIN tb_categorias ON tb_pizzas.categoria_id = tb_categorias.id WHERE nome_categoria = "doce";