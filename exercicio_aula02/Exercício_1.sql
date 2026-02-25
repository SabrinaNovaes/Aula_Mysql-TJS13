CREATE DATABASE db_rh; 

USE db_rh;

CREATE TABLE tb_colaboradores (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(255) NOT NULL, 
    salario DECIMAL(6, 2) NOT NULL,
    setor VARCHAR(255)
);

INSERT INTO tb_colaboradores (nome, cargo, salario, setor)
VALUES  ("Coco Channel", "Desenvolvedora Fullstack", 4500.00, "TI"),
		("Rebekah Mickaelson", "Recepcionista", 2200.00, "ADM"),
        ("Katherine Pierce", "Desenvolvedora Backend", 4500.00, "TI"),
        ("Stefan Salvatore", "Suporte Tecnico", 1900.00, "Atendimento"),
        ("Matt Donavan", "Segurança", 2000.00, "Segurança");
        
SELECT nome, cargo, CONCAT('R$ ', FORMAT(salario, 2, 'pt_BR')) AS Salario FROM tb_colaboradores WHERE salario > 2000.00;

SELECT  nome, cargo, CONCAT('R$ ', FORMAT(salario, 2, 'pt_BR')) AS Salario FROM tb_colaboradores WHERE salario < 2000.00;

UPDATE tb_colaboradores SET salario = 1600.00 WHERE id = 5;
