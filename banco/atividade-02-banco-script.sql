CREATE DATABASE banco_abc;

USE banco_abc;

CREATE TABLE agencia (
	num_agencia INT NOT NULL PRIMARY KEY,
    nom_agencia VARCHAR(100)
);

CREATE TABLE tipo_conta (
	cod_tipo_conta INT NOT NULL PRIMARY KEY,
    des_tipo_conta VARCHAR(100)
);

CREATE TABLE categoria_cliente (
	cod_categoria_cliente INT NOT NULL PRIMARY KEY,
    nom_categoria_cliente VARCHAR(100)
);

CREATE TABLE cliente (
	cod_cliente INT NOT NULL PRIMARY KEY,
    nom_cliente VARCHAR(100),
    num_cpf_cnpj VARCHAR(20),
    num_celular VARCHAR(20),
    rua VARCHAR(45),
    numero VARCHAR(45),
    bairro VARCHAR(45),
    cep VARCHAR(45),
    cidade VARCHAR(45),
    estado VARCHAR(45),
    categoria_cliente_cod INT,
    FOREIGN KEY (categoria_cliente_cod) REFERENCES categoria_cliente(cod_categoria_cliente)
);

CREATE TABLE conta (
	num_conta INT NOT NULL PRIMARY KEY,
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