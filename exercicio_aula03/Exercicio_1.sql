CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_classe VARCHAR(255) NOT NULL,
    descricao VARCHAR(500) NOT NULL
);

CREATE TABLE tb_personagens (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_personagem VARCHAR(255) NOT NULL,
	poder_ataque INT NOT NULL,
    poder_defesa INT NOT NULL,
    nivel INT NOT NULL,
    classe_id BIGINT,
    
    FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

INSERT INTO tb_classes (nome_classe, descricao) 
VALUES	("Guerreiro", "Especialista em combate corpo a corpo, possui alta resistência e defesa."),
		("Mago", "Utiliza magias poderosas de ataque à distância, porém possui baixa defesa."),
		("Arqueiro", "Ataca à distância com precisão e velocidade."),
		("Assassino", "Rápido e furtivo, causa alto dano crítico."),
		("Paladino", "Classe equilibrada, combina ataque físico com habilidades de suporte e cura.");

INSERT INTO tb_personagens (nome_personagem, poder_ataque, poder_defesa, nivel, classe_id) 
VALUES	("Thoran", 2500, 1800, 15, 1),
		("Eldria", 3200, 900, 18, 2),
		("Kael", 2100, 1200, 14, 3),
		("Nyx", 2900, 1000, 17, 4),
		("Valerius", 2300, 2000, 16, 5),
		("Brakus", 2600, 1900, 19, 1),
		("Selena", 3400, 800, 20, 2),
		("Raven", 2800, 1100, 13, 4),
		("Aldor", 2700, 2100, 22, 1),
		("Lyra", 3600, 950, 24, 2),
		("Fenrir", 2200, 1400, 18, 3),
		("Zarek", 3100, 1200, 23, 4),
		("Helena", 2500, 2300, 21, 5),
		("Draven", 2950, 1700, 20, 1),
		("Morgana", 3800, 1000, 25, 2),
		("Kira", 2400, 1300, 19, 3);

-- Consulta com Inner Join unindo as tabelas -- 
SELECT  nome_personagem AS Personagem, 
		poder_ataque AS Ataque, 
        poder_defesa AS Defesa, 
        nivel AS Nível, 
        nome_classe AS Classe, 
        descricao AS Descrição
FROM tb_personagens INNER JOIN tb_classes ON tb_personagens.classe_id = tb_classes.id ORDER BY tb_personagens.nivel; 

-- Poder de ataque maior eu 2000 -- 
SELECT  nome_personagem AS Personagem, 
		poder_ataque AS Ataque, 
        nivel AS Nível, 
        nome_classe AS Classe, 
        descricao AS Descrição
FROM tb_personagens INNER JOIN tb_classes ON tb_personagens.classe_id = tb_classes.id WHERE tb_personagens.poder_ataque > 2000
ORDER BY poder_ataque DESC;

-- Poder de defesa entre 1000 e 2000 -- 
SELECT  nome_personagem AS Personagem, 
		poder_defesa AS Defesa, 
		nivel AS Nível, 
        nome_classe AS Classe, 
        descricao AS Descrição
FROM tb_personagens INNER JOIN tb_classes ON tb_personagens.classe_id = tb_classes.id WHERE tb_personagens.poder_defesa BETWEEN 1000 AND 2000
ORDER BY poder_defesa DESC;

-- Personagem com maior defesa -- 
SELECT  nome_personagem AS Personagem, 
		poder_defesa AS Defesa, 
		nivel AS Nível, 
        nome_classe AS Classe, 
        descricao AS Descrição
FROM tb_personagens INNER JOIN tb_classes ON tb_personagens.classe_id = tb_classes.id ORDER BY poder_defesa DESC LIMIT 1;

-- Se nome do personagem possui letra c -- 
SELECT  nome_personagem AS Personagem, 
		poder_ataque AS Ataque, 
        poder_defesa AS Defesa, 
        nivel AS Nível, 
        nome_classe AS Classe, 
        descricao AS Descrição
FROM tb_personagens INNER JOIN tb_classes ON tb_personagens.classe_id = tb_classes.id WHERE tb_personagens.nome_personagem LIKE "%a%";

-- Todos os personagens da classe arqueiro -- 
SELECT  nome_personagem AS Personagem, 
		poder_ataque AS Ataque,
		poder_defesa AS Defesa,
		nivel AS Nível,
        nome_classe AS Classe,
        descricao AS Descrição
FROM tb_personagens INNER JOIN tb_classes ON tb_personagens.classe_id = tb_classes.id WHERE nome_classe = "Arqueiro"; 


-- EXTRAS --  
-- Média de ataque por classe -- 
SELECT nome_classe AS Classe,
       AVG(poder_ataque) AS MédiaAtaque
FROM tb_personagens INNER JOIN tb_classes ON tb_personagens.classe_id = tb_classes.id GROUP BY nome_classe;

-- Modificação da Tabela Classes -- 
ALTER TABLE tb_classes ADD vida_base INT NOT NULL, ADD mana_base INT NOT NULL;

-- Atualizando os dados da Tabela Classes com a modificação -- 
UPDATE tb_classes SET vida_base = 6000, mana_base = 300 WHERE id = 1;

UPDATE tb_classes SET vida_base = 3500, mana_base = 2500 WHERE id = 2;

UPDATE tb_classes SET vida_base = 4200, mana_base = 800 WHERE id = 3;

UPDATE tb_classes SET vida_base = 3800, mana_base = 900 WHERE id = 4;

UPDATE tb_classes SET vida_base = 5500, mana_base = 1200 WHERE id = 5;

-- Modificanco Tabela personagens -- 
ALTER TABLE tb_personagens ADD experiencia INT DEFAULT 0;

-- Adicionando xp aos personagens -- 
UPDATE tb_personagens SET experiencia = 15000 WHERE id = 1;
UPDATE tb_personagens SET experiencia = 800 WHERE id = 2;
UPDATE tb_personagens SET experiencia = 14000 WHERE id = 3;
UPDATE tb_personagens SET experiencia = 1700 WHERE id = 4;
UPDATE tb_personagens SET experiencia = 16000 WHERE id = 5;
UPDATE tb_personagens SET experiencia = 19000 WHERE id = 6;
UPDATE tb_personagens SET experiencia = 20000 WHERE id = 7;
UPDATE tb_personagens SET experiencia = 13000 WHERE id = 8;
UPDATE tb_personagens SET experiencia = 2000 WHERE id = 9;
UPDATE tb_personagens SET experiencia = 24000 WHERE id = 10;
UPDATE tb_personagens SET experiencia = 1800 WHERE id = 11;
UPDATE tb_personagens SET experiencia = 23000 WHERE id = 12;
UPDATE tb_personagens SET experiencia = 21000 WHERE id = 13;
UPDATE tb_personagens SET experiencia = 20100 WHERE id = 14;
UPDATE tb_personagens SET experiencia = 25000 WHERE id = 15;
UPDATE tb_personagens SET experiencia = 19000 WHERE id = 16;

SET SQL_SAFE_UPDATES = 1;

-- Atualiza na tabela o nível do personagem através do xp -- 
UPDATE tb_personagens SET nivel = FLOOR(experiencia / 1000) + 1;

SELECT  nome_personagem AS Personagem, 
		poder_ataque AS Ataque, 
        poder_defesa AS Defesa, 
        mana_base AS Mana,
        nivel AS Nível, 
        experiencia AS XP,
        nome_classe AS Classe, 
        descricao AS Descrição
FROM tb_personagens INNER JOIN tb_classes ON tb_personagens.classe_id = tb_classes.id ORDER BY tb_personagens.nivel; 


