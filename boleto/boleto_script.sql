CREATE DATABASE boleto;

USE boleto;

CREATE TABLE cliente (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE mensalidade (
	id_mensalidade INT AUTO_INCREMENT PRIMARY KEY,
	valor DECIMAL(5,2),
    status_pagamento ENUM('Fatura Paga', 'Em débito'),
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente)
);

INSERT INTO cliente
(nome)
VALUES
('Jose'),
('Carlos'),
('Marcos');

INSERT INTO mensalidade
(valor, status_pagamento, cliente_id)
VALUES
(650, 'Fatura Paga', 1),
(670, 'Fatura Paga', 2),
(690, 'Fatura Paga', 3),
(720, 'Em débito', 1),
(740, 'Em débito', 2),
(760, 'Em débito', 3),
(800, 'Em débito', 3);

SELECT * FROM mensalidade;

SELECT * FROM cliente;

SELECT cliente.id_cliente, cliente.nome, mensalidade.id_mensalidade, mensalidade.valor, mensalidade.status_pagamento FROM mensalidade
JOIN cliente ON cliente.id_cliente = mensalidade.cliente_id;

UPDATE cliente
SET nome = 'Vinicius'
WHERE id_cliente = 1;

UPDATE cliente
SET nome = 'Jose'
WHERE id_cliente = 1;

SELECT count(mensalidade.status_pagamento) FROM mensalidade;

SELECT cliente.nome, count(mensalidade.status_pagamento) FROM mensalidade
JOIN cliente ON cliente.id_cliente = mensalidade.cliente_id
GROUP BY cliente.id_cliente;

SELECT cliente.nome, sum(mensalidade.valor) FROM mensalidade
JOIN cliente ON cliente.id_cliente = mensalidade.cliente_id
GROUP BY cliente.id_cliente;

SELECT cliente.nome, avg(mensalidade.valor) AS valor_medio FROM mensalidade
JOIN cliente ON cliente.id_cliente = mensalidade.cliente_id
GROUP BY cliente.id_cliente;