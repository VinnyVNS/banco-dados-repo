CREATE DATABASE usinagem;

USE usinagem;

CREATE TABLE fornecedor (
	id_fornecedor INT NOT NULL PRIMARY KEY,
    nome VARCHAR(45),
    nacionalidade VARCHAR(45)
);

CREATE TABLE categoria (
	id_categoria INT NOT NULL PRIMARY KEY,
    descricao TEXT
);

CREATE TABLE peca (
	id_peca INT NOT NULL PRIMARY KEY,
	nome VARCHAR(45),
	peso DECIMAL(8, 2),
	ano_fabricacao YEAR,
	fornecedor_id INT,
    categoria_id INT,
	FOREIGN KEY (fornecedor_id) REFERENCES fornecedor(id_fornecedor),
    FOREIGN KEY (categoria_id) REFERENCES categoria(id_categoria)
);