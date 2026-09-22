CREATE DATABASE regra_constraint;

USE regra_constraint;

CREATE TABLE usuario (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cpf BIGINT UNIQUE,
    pais VARCHAR(50) DEFAULT 'Brasil',
    graduado ENUM('Sim', 'Não'),
    num_filhos INT DEFAULT 0,
    CHECK (num_filhos >= 0)
);

SELECT * FROM usuario;

SELECT nome, num_filhos FROM usuario;

INSERT INTO usuario
(nome,cpf,graduado)
VALUES
('Vinicius', 12345678955, 'Sim');