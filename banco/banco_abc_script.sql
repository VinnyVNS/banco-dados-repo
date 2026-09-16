CREATE DATABASE banco_abc;

USE banco_abc;

CREATE TABLE agencia (
	num_agencia INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom_agencia VARCHAR(100)
);

CREATE TABLE tipo_conta (
	cod_tipo_conta INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    des_tipo_conta VARCHAR(100)
);

CREATE TABLE categoria_cliente (
	cod_categoria_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom_categoria_cliente VARCHAR(100)
);

CREATE TABLE cliente (
	cod_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom_cliente VARCHAR(100),
    num_cpf_cnpj VARCHAR(20),
    num_celular VARCHAR(20),
    rua VARCHAR(50),
    numero VARCHAR(5),
    bairro VARCHAR(50),
    cep VARCHAR(8),
    cidade VARCHAR(20),
    estado VARCHAR(2),
    categoria_cliente_cod INT,
    FOREIGN KEY (categoria_cliente_cod) REFERENCES categoria_cliente(cod_categoria_cliente)
);

CREATE TABLE conta (
	num_conta INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    val_saldo DECIMAL(8, 2),
    agencia_num INT,
    cliente_cod INT,
    tipo_conta_cod INT,
    FOREIGN KEY (agencia_num) REFERENCES agencia(num_agencia),
    FOREIGN KEY (cliente_cod) REFERENCES cliente(cod_cliente),
    FOREIGN KEY (tipo_conta_cod) REFERENCES tipo_conta(cod_tipo_conta)
);

ALTER TABLE cliente RENAME COLUMN num_celular TO telefone;

ALTER TABLE categoria_cliente ADD COLUMN observacao TEXT;

ALTER TABLE cliente ADD COLUMN renda DECIMAL(8, 2);

ALTER TABLE tipo_conta MODIFY des_tipo_conta TEXT;

ALTER TABLE agencia MODIFY nom_agencia VARCHAR(45);

ALTER TABLE cliente DROP COLUMN estado;

ALTER TABLE categoria_cliente RENAME TO categoria;

ALTER TABLE tipo_conta ADD COLUMN observacao TEXT;

INSERT INTO categoria
(nom_categoria_cliente, observacao)
VALUES
('Private','Cliente com rende acima de 50mil.'),
('Exclusive','Cliente com rende acima de 30mil.'),
('Gold','Cliente com rende acima de 20mil.'),
('Básico','Cliente com rende acima de 10mil.');

INSERT INTO agencia
(nom_agencia)
VALUES
('Campeche'),
('Ingleses'),
('Centro');

INSERT INTO tipo_conta
(des_tipo_conta)
VALUES
('Poupança'),
('Corrente');

INSERT INTO cliente
(nom_cliente, num_cpf_cnpj, cidade, renda, categoria_cliente_cod)
VALUES
('Mattheus', '55544433375', 'Floripa', '15000', '4'),
('João', '55544433375', 'Floripa', '40000', '2'),
('José', '55544433375', 'Floripa', '50000', '1'),
('Rodrigo', '55544433375', 'Floripa', '15000', '4'),
('Diogo', '55544433375', 'Floripa', '10000', '4'),
('Ana', '55544433375', 'Floripa', '25000', '3'),
('Maria', '55544433375', 'Floripa', '15000', '4');

INSERT INTO conta
(val_saldo, agencia_num, cliente_cod, tipo_conta_cod)
VALUES
('50000', '1', '1', '2'),
('30000', '1', '2', '2'),
('10000', '2', '3', '2'),
('25000', '3', '4', '1'),
('50000', '1', '5', '2'),
('100000', '1', '6', '2'),
('60000', '3', '7', '1'),
('20000', '1', '8', '1');

SELECT * FROM categoria;
SELECT * FROM agencia;
SELECT * FROM tipo_conta;
SELECT * FROM cliente;
SELECT * FROM conta;