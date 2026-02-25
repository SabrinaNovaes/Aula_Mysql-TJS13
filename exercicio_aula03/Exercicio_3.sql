CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(255) NOT NULL,
    descricao VARCHAR(500) NOT NULL
);

CREATE TABLE tb_produtos (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(255) NOT NULL, 
    marca VARCHAR(255) NOT NULL,
    preco DECIMAL(8,2) NOT NULL,
    estoque INT NOT NULL,
    data_validade DATE,
    categoria_id BIGINT,
    
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome_categoria, descricao) 
VALUES	("Medicamentos", "Remédios para tratamento e prevenção de doenças."),
		("Cosméticos", "Produtos para cuidados com a pele, cabelo e estética."),
		("Higiene Pessoal", "Produtos para higiene diária e cuidados pessoais."),
		("Infantil", "Produtos destinados a bebês e crianças."),
		("Suplementos", "Vitaminas e suplementos alimentares.");
        
INSERT INTO tb_produtos (nome_produto, marca, preco, estoque, data_validade, categoria_id) 
VALUES	("Dipirona 500mg", "Neo Química", 12.90, 150, "2027-05-10", 1),
		("Paracetamol 750mg", "EMS", 18.50, 200, "2026-11-15", 1),
		("Protetor Solar FPS 50", "Nivea", 45.90, 80, "2026-09-01", 2),
		("Shampoo Anticaspa", "Clear", 22.00, 120, "2027-01-20", 3),
		("Sabonete Líquido", "Dove", 8.90, 300, "2028-02-10", 3),
		("Lenço Umedecido", "Johnson's Baby", 15.90, 180, "2026-12-30", 4),
		("Pomada para Assaduras", "Hipoglós", 19.90, 90, "2027-04-25", 4),
		("Vitamina C 1g", "Cimed", 29.90, 140, "2027-08-14", 5),
		("Whey Protein 900g", "Growth", 129.90, 60, "2026-06-18", 5),
		("Hidratante Corporal", "Nivea", 24.50, 110, "2027-03-12", 2);
        
-- Seleciona unindo as tabelas com INNER JOIN --
SELECT  nome_produto,
		marca,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco,
		estoque,
        DATE_FORMAT(data_validade, '%d/%m/%Y') AS validade,
        nome_categoria,
        descricao
FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id;

-- Todos produtos com preco maior que 50.00 -- 
SELECT  nome_produto,
		marca,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco,
		estoque,
        DATE_FORMAT(data_validade, '%d/%m/%Y') AS validade,
        nome_categoria,
        descricao
FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id WHERE Preco > 50.00;

-- Todos os produtos com preco entre 5.00 e 60.00 reais -- 
SELECT  nome_produto,
		marca,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco,
		estoque,
        DATE_FORMAT(data_validade, '%d/%m/%Y') AS validade,
        nome_categoria,
        descricao
FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id WHERE Preco BETWEEN 5.00 AND 60.00;

-- Todos os produtos que tem a letra c no nome -- 
SELECT  nome_produto,
		marca,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco,
		estoque,
        DATE_FORMAT(data_validade, '%d/%m/%Y') AS validade,
        nome_categoria,
        descricao
FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id WHERE nome_produto LIKE "%C%";

-- Todos os produtos da categoria cosmetico -- 
SELECT  nome_produto,
		marca,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco,
		estoque,
        DATE_FORMAT(data_validade, '%d/%m/%Y') AS validade,
        nome_categoria,
        descricao
FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id WHERE nome_categoria = "COSMETICOS";