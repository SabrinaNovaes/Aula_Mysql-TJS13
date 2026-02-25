CREATE DATABASE db_curso_da_minha_vida; 

USE db_curso_da_minha_vida; 

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(255) NOT NULL,
    descricao VARCHAR(500) NOT NULL
);

CREATE TABLE tb_cursos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(255) NOT NULL,
    instrutor VARCHAR(255) NOT NULL,
    carga_horaria INT NOT NULL,
    data_inicio DATE NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    nivel VARCHAR(50),
    vagas_disponiveis INT,
    categoria_id BIGINT,
    
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome_categoria, descricao) 
VALUES	('Programação', 'Cursos voltados para desenvolvimento de software'),
		('Design', 'Cursos de design gráfico e UX/UI'),
		('Marketing Digital', 'Cursos de marketing e redes sociais'),
		('Idiomas', 'Cursos de línguas estrangeiras'),
		('Negócios', 'Cursos de empreendedorismo e gestão');
        
INSERT INTO tb_cursos (nome_curso, instrutor, carga_horaria, data_inicio, preco, nivel, vagas_disponiveis, categoria_id)
VALUES	('Java para Iniciantes', 'Carlos Silva', 40, '2026-03-10', 199.90, 'Básico', 50, 1),
		('Desenvolvimento Web com React', 'Ana Souza', 60, '2026-04-15', 299.90, 'Intermediário', 30, 1),
		('UX/UI Design Completo', 'Mariana Lima', 45, '2026-05-20', 249.90, 'Intermediário', 25, 2),
		('Photoshop do Zero ao Avançado', 'Lucas Mendes', 50, '2026-03-25', 179.90, 'Básico', 40, 2),
		('Marketing para Instagram', 'Fernanda Alves', 30, '2026-04-05', 149.90, 'Básico', 100, 3),
		('Tráfego Pago e Facebook Ads', 'Ricardo Nunes', 35, '2026-05-01', 219.90, 'Avançado', 35, 3),
		('Inglês para Viagem', 'John Miller', 40, '2026-06-10', 189.90, 'Básico', 60, 4),
		('Espanhol Intermediário', 'Laura Gómez', 45, '2026-06-20', 209.90, 'Intermediário', 40, 4),
		('Empreendedorismo Digital', 'Paulo Costa', 55, '2026-07-01', 279.90, 'Avançado', 20, 5),
		('Gestão Financeira para Iniciantes', 'Juliana Rocha', 38, '2026-07-15', 159.90, 'Básico', 45, 5);
	
SELECT  nome_curso,
		instrutor,
        carga_horaria,
        DATE_FORMAT(data_inicio, '%d/%m/%Y') AS Inicio,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco, 
        nivel, 
        vagas_disponiveis,
        nome_categoria,
        descricao
FROM tb_cursos INNER JOIN tb_categorias ON tb_cursos.categoria_id = tb_categorias.id;

-- Todos os produtos com preco maior que 200.00 -- 
SELECT  nome_curso,
		instrutor,
        carga_horaria,
        DATE_FORMAT(data_inicio, '%d/%m/%Y') AS Inicio,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco, 
        nivel, 
        vagas_disponiveis,
        nome_categoria,
        descricao
FROM tb_cursos INNER JOIN tb_categorias ON tb_cursos.categoria_id = tb_categorias.id WHERE Preco > 200.00;

-- Todos os produtos com Preco entre 100.00 e 200.00 -- 
SELECT  nome_curso,
		instrutor,
        carga_horaria,
        DATE_FORMAT(data_inicio, '%d/%m/%Y') AS Inicio,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco, 
        nivel, 
        vagas_disponiveis,
        nome_categoria,
        descricao
FROM tb_cursos INNER JOIN tb_categorias ON tb_cursos.categoria_id = tb_categorias.id WHERE Preco BETWEEN 100.00 AND 200.00;

-- Todos os produtos com a letra j no nome -- 
SELECT  nome_curso,
		instrutor,
        carga_horaria,
        DATE_FORMAT(data_inicio, '%d/%m/%Y') AS Inicio,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco, 
        nivel, 
        vagas_disponiveis,
        nome_categoria,
        descricao
FROM tb_cursos INNER JOIN tb_categorias ON tb_cursos.categoria_id = tb_categorias.id WHERE nome_curso LIKE '%j%';

-- Todos os produtos com a categoria programação -- 
SELECT  nome_curso,
		instrutor,
        carga_horaria,
        DATE_FORMAT(data_inicio, '%d/%m/%Y') AS Inicio,
        CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco, 
        nivel, 
        vagas_disponiveis,
        nome_categoria,
        descricao
FROM tb_cursos INNER JOIN tb_categorias ON tb_cursos.categoria_id = tb_categorias.id WHERE nome_categoria = "programação";