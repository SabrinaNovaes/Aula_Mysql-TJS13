CREATE DATABASE db_ecommerce; 

USE db_ecommerce;

CREATE TABLE tb_produtos (
	id BIGINT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(255) NOT NULL, 
    cor VARCHAR(255),
    lancamento DATE, 
    marca VARCHAR(255),
    quantidade INT,
    preco DECIMAL(8, 2) NOT NULL, 
    categoria VARCHAR(255) NOT NULL,
    descricao VARCHAR(500)
);

INSERT INTO tb_produtos (nome, cor, lancamento, marca, quantidade, preco, categoria, descricao)
VALUES  ("Notebook", "Prata", "2026-01-25", "Asus", 2000, 3900.00, "Computadores", "Notebook Asus, prata"), 
		("Iphone", "Laranja", "2025-10-25", "Apple", 5000, 16900.00, "Smartphones", "Iphone 17, laranja"),
        ("Secador", "Vermelho", "2023-11-10", "Babyliss", 10000, 299.00, "Eletrodoméstico", "Secador de cabelo Babyliss, vermelho"),
        ("Maquina lava e seca", "Preta", "2025-06-25", "Samsung", 2000, 5900.00, "Eletrodoméstico", "Máquina lava e seca Samsung, Preta"),
        ("TV", "Preta", "2022-07-02", "LG", 7000, 5900.00, "Eletrodoméstico", "TV 55 LG, preta"),
        ("tenis", "rosa", "2020-01-25", "All Star", 2000, 200.00, "Vestuário", "Tenis All Start, Rosa"),
        ("Camisa Polo", "branca", "2020-01-25", "Prada", 2000, 900.00, "Vestuário", "Camisa Polo Prada, Branca"),
        ("Mochila", "Azul", "2026-01-25", "Brit", 2000, 150.00, "Acessório", "Mochila Brit, Azul");
        
SELECT  nome,
		cor,
        DATE_FORMAT(lancamento, '%d/%m/%Y') AS Data_lancamento,
        marca,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco,
        categoria,
        descricao 
FROM tb_produtos;
	
SELECT  nome,
		cor,
        DATE_FORMAT(lancamento, '%d/%m/%Y') AS Data_lancamento,
        marca,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco,
        categoria,
        descricao 
FROM tb_produtos WHERE preco > 500.00;

SELECT  nome,
		cor,
        DATE_FORMAT(lancamento, '%d/%m/%Y') AS Data_lancamento,
        marca,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco,
        categoria,
        descricao 
FROM tb_produtos WHERE preco < 500.00;

SELECT  nome,
		cor,
        DATE_FORMAT(lancamento, '%d/%m/%Y') AS Data_lancamento,
        marca,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco,
        UPPER(categoria),
        descricao 
FROM tb_produtos WHERE categoria = "eletrodomestico";

UPDATE tb_produtos SET marca = "Polo" WHERE id = 7;