CREATE DATABASE db_construindo_vidas;

USE db_construindo_vidas;

CREATE TABLE tb_categorias (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(255) NOT NULL,
    descricao VARCHAR(500) NOT NULL
);

CREATE TABLE tb_produtos (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(150) NOT NULL,
    marca VARCHAR(100),
    preco DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    data_validade DATE NOT NULL, 
    disponivel BOOLEAN NOT NULL,
    categoria_id BIGINT,
    
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome_categoria, descricao) 
VALUES	('Cimento e Argamassa', 'Materiais para estrutura e assentamento'),
		('Tintas e Acessórios', 'Tintas, rolos, pincéis e complementos'),
		('Ferramentas', 'Ferramentas manuais e elétricas'),
		('Hidráulica', 'Tubos, conexões e materiais hidráulicos'),
		('Elétrica', 'Fios, cabos e materiais elétricos');
        
INSERT INTO tb_produtos (nome_produto, marca, preco, quantidade_estoque, data_validade, disponivel, categoria_id) 
VALUES	('Cimento CP II 50kg', 'Votoran', 42.90, 120, '2026-12-31', 1, 1),
		('Argamassa AC3 20kg', 'Quartzolit', 28.50, 80, '2026-10-15', 1, 1),
		('Rejunte Flexível 1kg', 'Quartzolit', 12.90, 200, '2027-03-10', 1, 1),
		('Tinta Acrílica Branca 18L', 'Suvinil', 329.90, 45, '2027-05-20', 1, 2),
		('Tinta Esmalte Sintético 3,6L', 'Coral', 89.90, 60, '2027-08-18', 1, 2),
		('Rolo de Pintura 23cm', 'Atlas', 19.90, 150, '2028-01-10', 1, 2),
		('Furadeira de Impacto', 'Bosch', 499.90, 25, '2029-03-01', 1, 3),
		('Martelo 27mm', 'Tramontina', 35.00, 60, '2030-07-15', 1, 3),
		('Serra Circular 1500W', 'Makita', 799.90, 15, '2031-02-28', 1, 3),
		('Tubo PVC 100mm 6m', 'Tigre', 89.90, 40, '2031-08-12', 1, 4),
		('Torneira para Pia Inox', 'Deca', 149.90, 30, '2032-11-30', 1, 4),
		('Caixa d''Água 1000L', 'Fortlev', 499.00, 10, '2035-06-20', 1, 4),
		('Fio Flexível 2,5mm 100m', 'Sil', 259.90, 20, '2029-09-25', 1, 5),
		('Disjuntor 40A', 'Steck', 39.90, 70, '2030-04-18', 1, 5),
		('Lâmpada LED 12W', 'Philips', 14.90, 180, '2033-12-01', 0, 5);
        
SELECT  nome_produto,
		marca,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco,
        quantidade_estoque,
        DATE_FORMAT(data_validade, '%d/%m/%Y') AS validade,
        IF(disponivel = 1, "Sim", "Não") AS Disponivel,
        nome_categoria,
        descricao
FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id;

-- Todos os produtos com preco maior que 100.00 -- 
SELECT  nome_produto,
		marca,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco,
        quantidade_estoque,
        DATE_FORMAT(data_validade, '%d/%m/%Y') AS validade,
        IF(disponivel = 1, "Sim", "Não") AS Disponivel,
        nome_categoria,
        descricao
FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id WHERE Preco > 100.00;

-- Todos os produtos com preco entre 70.00 e 150.00 -- 
SELECT  nome_produto,
		marca,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco,
        quantidade_estoque,
        DATE_FORMAT(data_validade, '%d/%m/%Y') AS validade,
        IF(disponivel = 1, "Sim", "Não") AS Disponivel,
        nome_categoria,
        descricao
FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id WHERE Preco BETWEEN 70.00 AND 150.00;

-- Todos os produtos com a letra c no nome -- 
SELECT  nome_produto,
		marca,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco,
        quantidade_estoque,
        DATE_FORMAT(data_validade, '%d/%m/%Y') AS validade,
        IF(disponivel = 1, "Sim", "Não") AS Disponivel,
        nome_categoria,
        descricao
FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id WHERE nome_produto LIKE "%C%";

-- Todos os produtos da categoria hidraulica -- 
SELECT  nome_produto,
		marca,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco,
        quantidade_estoque,
        DATE_FORMAT(data_validade, '%d/%m/%Y') AS validade,
        IF(disponivel = 1, "Sim", "Não") AS Disponivel,
        nome_categoria,
        descricao
FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id WHERE nome_categoria = "hidraulica";