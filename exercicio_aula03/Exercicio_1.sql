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
SELECT  nome_personagem, 
		poder_ataque, 
        poder_defesa, 
        nivel, 
        nome_classe, 
        descricao 
FROM tb_personagens INNER JOIN tb_classes ON tb_personagens.classe_id = tb_classes.id ORDER BY nome_personagem; 

-- Poder de ataque maior eu 2000 -- 
SELECT  nome_personagem, 
		poder_ataque, 
        nivel, 
        nome_classe, 
        descricao 
FROM tb_personagens INNER JOIN tb_classes ON tb_personagens.classe_id = tb_classes.id WHERE poder_ataque > 2000
ORDER BY poder_ataque DESC;

-- Poder de defesa entre 1000 e 2000 -- 
SELECT  nome_personagem, 
		poder_defesa, 
		nivel, 
        nome_classe, 
        descricao 
FROM tb_personagens INNER JOIN tb_classes ON tb_personagens.classe_id = tb_classes.id WHERE poder_defesa BETWEEN 1000 AND 2000
ORDER BY poder_defesa DESC;

-- Se nome do personagem possui letra c -- 
SELECT  nome_personagem, 
		poder_ataque, 
        poder_defesa, 
        nivel, 
        nome_classe, 
        descricao  
FROM tb_personagens INNER JOIN tb_classes ON tb_personagens.classe_id = tb_classes.id WHERE nome_personagem LIKE "%a%";

-- Todos os personagens da classe arqueiro -- 
SELECT  nome_personagem, 
		poder_ataque,
		poder_defesa,
		nivel,
        nome_classe,
        descricao
FROM tb_personagens INNER JOIN tb_classes ON tb_personagens.classe_id = tb_classes.id WHERE tb_classes.nome_classe = "arqueiro"; 




