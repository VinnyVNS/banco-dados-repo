CREATE DATABASE loja;

USE loja;

CREATE TABLE cliente (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    cidade VARCHAR(45)
);

CREATE TABLE acompanhamento (
	id_acompanhamento INT AUTO_INCREMENT PRIMARY KEY,
    situacao VARCHAR(45)
);

CREATE TABLE pedido (
	id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE,
    valor DECIMAL(8,2),
    cliente_id INT,
    acompanhamento_id INT,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente),
    FOREIGN KEY (acompanhamento_id) REFERENCES acompanhamento(id_acompanhamento)
);


INSERT INTO cliente
(nome, cidade)
VALUES
('João', 'Macaé'),
('Carlos', 'Salvador'),
('Maria', 'Niteroí'),
('Ana', 'Campinas'),
('Marcos', 'Santos');


INSERT INTO acompanhamento
(situacao)
VALUES
('Registrado'),
('Em transporte'),
('Entregue');


INSERT INTO pedido
(data_pedido, valor, cliente_id, acompanhamento_id)
VALUES
('2024-09-24', 250, 2, 1),
('2024-09-25', 150, 1, 2),
('2024-09-25', 450, 4, 3);

SELECT * FROM cliente;
SELECT * FROM pedido;
SELECT * FROM acompanhamento;


SELECT pedido.id_pedido, cliente.nome, pedido.data_pedido, pedido.valor, acompanhamento.situacao FROM pedido
JOIN cliente
ON pedido.cliente_id = cliente.id_cliente
JOIN acompanhamento
ON pedido.acompanhamento_id = acompanhamento.id_acompanhamento;