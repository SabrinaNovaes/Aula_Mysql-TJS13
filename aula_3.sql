-- Apagar Banco de Dados db_quitanda
DROP DATABASE db_quitanda;

-- Recriar o Banco de dados db_quitanda
CREATE DATABASE db_quitanda;

-- Selecionar o Banco de Dados db_quitanda
USE db_quitanda;

-- Criar a tabela tb_categorias
CREATE TABLE tb_categorias(
id bigint AUTO_INCREMENT,
descricao varchar(255) NOT NULL,
PRIMARY KEY (id)
);

-- Insere dados na tabela tb_categorias
INSERT INTO tb_categorias (descricao)
VALUES ("Frutas");

INSERT INTO tb_categorias (descricao)
VALUES ("Verduras");

INSERT INTO tb_categorias (descricao)
VALUES ("Legumes");

INSERT INTO tb_categorias (descricao)
VALUES ("Temperos");


INSERT INTO tb_categorias (descricao)
VALUES ("Ovos");

INSERT INTO tb_categorias (descricao)
VALUES ("outros");

-- Lista todos os dados da tabela tb_categorias
SELECT * FROM tb_categorias;

-- Criar a Tabela tb_produtos
CREATE TABLE tb_produtos(
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
quantidade int, 
dtvalidade date NULL,
preco decimal(6, 2),
categoria_id bigint, 
PRIMARY KEY (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Insere dados na tabela tb_produtos
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Maçã", 1000, "2022-03-07", 1.99, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Banana", 1300, "2022-03-08", 5.00, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Batata doce", 2000, "2022-03-09", 10.00, 3);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Alface", 300, "2022-03-10", 7.00, 2);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Cebola", 1020, "2022-03-08", 5.00, 3);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Ovo Branco", 1000, "2022-03-07", 15.00, 5);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Agrião", 1500, "2022-03-06", 3.00, 2);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Cenoura", 1800, "2022-03-09", 3.50, 3);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Pimenta", 1100, "2022-03-15", 10.00, 4);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Alecrim", 130, "2022-03-10", 5.00, 4);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Manga", 200, "2022-03-07", 5.49, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Laranja", 3000, "2022-03-13", 10.00, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Couve", 100, "2022-03-12", 1.50, 2);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Tomate", 1105, "2022-03-15", 3.00, 3);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Rabanete", 1200, "2022-03-15", 13.00, 3);

INSERT INTO tb_produtos(nome, quantidade, preco)
VALUES("Sacola Cinza", 1118, 0.50);

INSERT INTO tb_produtos(nome, quantidade, preco)
VALUES("Sacola Verde", 1118, 0.50);

-- Visualiza todos os dados da tabela tb_produtos
SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos WHERE NOT categoria_id = 1; 

-- Ordena em ordem crescente --
SELECT * FROM tb_produtos WHERE NOT categoria_id = 1 ORDER BY nome; 

-- Ordena em ordem decrescente--
SELECT * FROM tb_produtos WHERE NOT categoria_id = 1 ORDER BY nome DESC; 

-- Ordena 2 atributos escolhidos em ordem decrescente --
SELECT * FROM tb_produtos WHERE NOT categoria_id = 1 ORDER BY nome, preco DESC; 

-- Funciona como o OU, seleciona os produtos com preco definidos ex: 5, 10, 15  --
SELECT * FROM tb_produtos WHERE preco IN(5.00, 10.00, 15.00) ORDER BY preco;

-- Seleciona entre os intervalos definidos, nesse caso 5 e 15 -- Também pode ser usado com datas
SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 15.00;

-- Seleciona as palavras com a silaba que foi selecionada. ex: la% (silaba no começo), %la% (silaba em qualquer lugar) e %la (silaba no final)
SELECT * FROM tb_produtos WHERE nome LIKE "%la%";

-- Conta quantos elementos tem de acordo com o critério estabelecido --
SELECT COUNT(*) FROM tb_produtos;

-- Contando pelo id, não retorna os elementos de valor null --
SELECT COUNT(categoria_id) FROM tb_produtos;

-- Soma todas os valores -- AS é opconal -- 
SELECT SUM(preco) AS soma_precos FROM tb_produtos;

-- Calcula  a média ex: de todos os elementos precos no registro-- 
SELECT AVG(preco) FROM tb_produtos;

-- Está tirando a media dos produtos pela categoria --
SELECT categoria_id, AVG(preco) FROM tb_produtos GROUP BY categoria_id;

SELECT MAX(preco) AS maior_preco FROM tb_produtos;

SELECT MIN(preco) AS menor_preco FROM tb_produtos;

-- Consulta as tabelas que tem relação cruzando os dados -- 
SELECT * FROM tb_produtos INNER JOIN tb_categorias ON  tb_produtos.categoria_id;

SELECT * FROM tb_produtos INNER JOIN tb_categorias ON  tb_produtos.categoria_id WHERE descricao = "Frutas";

SELECT descricao, AVG(preco) AS media_precos FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id GROUP BY descricao;

SELECT descricao, AVG(preco) AS preco_medio FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id GROUP BY descricao HAVING preco_medio > 5.00;

SELECT * FROM tb_produtos LEFT JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id;

SELECT * FROM tb_produtos RIGHT JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id;