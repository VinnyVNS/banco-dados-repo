CREATE DATABASE loja_x;

USE loja_x;

CREATE TABLE cliente (
	id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    cpf BIGINT UNIQUE
);

CREATE TABLE produto (
	id_produto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    codigo VARCHAR(45),
    estoque INT
);

CREATE TABLE compra (
	id_compra INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_horario DATETIME,
    quantidade INT,
    produto_id INT,
    cliente_id INT,
    FOREIGN KEY (produto_id) REFERENCES produto(id_produto),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente)
);


INSERT INTO cliente
(nome, cpf)
VALUES
('João', 18161227688),
('Carlos', 18161227299),
('Maria', 18161227211),
('Ana', 18161227233),
('Thiago', 18161227244);


INSERT INTO produto
(nome, codigo, estoque)
VALUES
('Computador', '212A22', 10),
('Mesa', '212A33', 20),
('Monitor', '133A22', 15),
('TV', '212B50', 5),
('Cadeira', '512C22', 45);


INSERT INTO compra
(data_horario, quantidade, produto_id, cliente_id)
VALUES
('2024-09-10 20:00:00', 5, 1, 3),
('2024-09-10 21:00:00', 5, 2, 2),
('2024-09-10 22:00:00', 4, 1, 3),
('2024-09-10 23:00:00', 8, 2, 2),
('2024-09-11 18:00:00', 2, 5, 5);


SELECT * FROM cliente;
SELECT * FROM produto;
SELECT * FROM compra;