CREATE DATABASE estacionamento_x;

USE estacionamento_x;

CREATE TABLE cliente (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    dt_nascimento DATE
);

CREATE TABLE categoria (
	id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20),
    descricao TEXT
);

CREATE TABLE veiculo (
	id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(8),
    cor VARCHAR(20),
    cliente_id INT,
    categoria_id INT,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente),
    FOREIGN KEY (categoria_id) REFERENCES categoria(id_categoria)
);

CREATE TABLE estacionamento (
	id_estacionamento INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    capacidade INT,
    dt_entrada DATE,
    dt_saida DATE,
    hs_entrada TIME,
    hs_saida TIME,
    veiculo_id INT,
    FOREIGN KEY (veiculo_id) REFERENCES veiculo(id_veiculo)
);

INSERT INTO cliente
(nome, dt_nascimento)
VALUES
('Vinicius', '2000-08-02'),
('Mattheus', '2008-05-12'),
('Carlos', '2005-12-15');

INSERT INTO categoria
(nome, descricao)
VALUES
('Sedan', 'Descrição do carro.'),
('Hatch', 'Descrição do carro.'),
('SUV', 'Descrição do carro.');

INSERT INTO veiculo
(placa, cor, cliente_id, categoria_id)
VALUES
('MVD-7354', 'Preto', 1, 2),
('MYT-4722', 'Branco', 1, 3),
('MUU-5791', 'Azul', 2, 3),
('MMS-3984', 'Branco', 1, 2);

INSERT INTO estacionamento
(nome, capacidade, dt_entrada, dt_saida, hs_entrada, hs_saida, veiculo_id)
VALUES
('Estacionamento X-A', 10, '2026-10-01', '2026-10-01', '18:00:00', '19:00:00', 2),
('Estacionamento X-A', 10, '2026-10-02', '2026-10-02', '15:00:00', '17:00:00', 1),
('Estacionamento X-B', 15, '2026-10-04', '2026-10-05', '22:00:00', '01:00:00', 3);

SELECT * FROM veiculo
JOIN categoria ON veiculo.categoria_id = categoria.id_categoria
JOIN cliente ON veiculo.cliente_id = cliente.id_cliente;

SELECT * FROM veiculo
LEFT JOIN cliente ON veiculo.cliente_id = cliente.id_cliente;

SELECT * FROM veiculo
RIGHT JOIN categoria ON veiculo.categoria_id = categoria.id_categoria;

SELECT * FROM veiculo
LEFT JOIN cliente ON veiculo.cliente_id = cliente.id_cliente
UNION
SELECT * FROM veiculo
RIGHT JOIN categoria ON veiculo.categoria_id = categoria.id_categoria;

CREATE VIEW vw_veiculo_cliente AS
SELECT veiculo.id_veiculo, veiculo.placa, veiculo.cor, cliente.nome FROM veiculo
JOIN cliente ON veiculo.cliente_id = cliente.id_cliente;

SELECT * FROM vw_veiculo_cliente;