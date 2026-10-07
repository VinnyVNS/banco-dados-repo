CREATE DATABASE estacionamento_xyz;

USE estacionamento_xyz;

CREATE TABLE estacionamento (
	id_estacionamento INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20),
    capacidade INT,
    subsolo ENUM('Sim', 'Não'),
    especial ENUM('Sim', 'Não')
);

INSERT INTO estacionamento
(nome, capacidade, subsolo, especial)
VALUES
('Estacionamento A', 20, 'Não', 'Não'),
('Estacionamento B', 35, 'Sim', 'Sim'),
('Estacionamento C', 40, 'Sim', 'Sim'),
('Estacionamento D', 50, 'Sim', 'Sim'),
('Estacionamento E', 15, 'Sim', 'Não'),
('Estacionamento F', 85, 'Sim', 'Sim'),
('Estacionamento G', 100, 'Não', 'Não');

SELECT nome, capacidade FROM estacionamento
WHERE especial = 'Sim';

SELECT nome, capacidade FROM estacionamento
WHERE subsolo = 'Sim' AND especial = 'Não';

SELECT nome, capacidade FROM estacionamento
WHERE capacidade > 50
ORDER BY capacidade DESC;

SELECT nome, capacidade FROM estacionamento
WHERE capacidade >= 20 AND capacidade <=40 AND subsolo = 'Sim' AND especial = 'Sim'
ORDER BY capacidade ASC;