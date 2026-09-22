CREATE DATABASE banco_livraria;

USE banco_livraria;

CREATE TABLE cliente (
	id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    rg_cliente VARCHAR(20),
    cpf_cliente VARCHAR(20) UNIQUE,
    pais_cliente VARCHAR(50) DEFAULT 'Brasil'
);

CREATE TABLE financiador (
	id_financiador INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_financiador VARCHAR(100) DEFAULT 'Financiador Público',
    cnpj_financiador VARCHAR(20)
);

CREATE TABLE autor (
	id_autor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_autor VARCHAR(100) NOT NULL,
    rg_autor VARCHAR(20)
);

CREATE TABLE editora (
	id_editora INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeFantasia_editora ENUM('Editora A', 'Editora B', 'Editora C'),
    razaoSocial_editora VARCHAR(100) NOT NULL,
    pais_editora VARCHAR(50) DEFAULT 'Brasil'
);

CREATE TABLE livro (
	id_livro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    isbn_livro VARCHAR(20),
    titulo_livro VARCHAR(50),
    preco_livro DECIMAL(6, 2),
    CHECK (preco_livro >= 0),
    categoria_livro ENUM('Horror', 'Ficção', 'Romance', 'Ação'),
    editora_id INT,
    autor_id INT,
    financiador_id INT,
    FOREIGN KEY (editora_id) REFERENCES editora(id_editora),
    FOREIGN KEY (autor_id) REFERENCES autor(id_autor),
    FOREIGN KEY (financiador_id) REFERENCES financiador(id_financiador)
);

CREATE TABLE pedido (
	id_pedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    livro_id INT,
    qtd_pedido INT,
    CHECK (qtd_pedido >= 0),
    cliente_id INT,
    FOREIGN KEY (livro_id) REFERENCES livro(id_livro),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente)
);

INSERT INTO cliente
(nome_cliente, rg_cliente, cpf_cliente, pais_cliente)
VALUES
('Matheus', '16.362.192-5', '307.635.170-20', 'Brasil');

INSERT INTO cliente
(nome_cliente, rg_cliente, cpf_cliente, pais_cliente)
VALUES
('Vinicius', '47.034.965-7', '381.905.000-07', 'Brasil');

INSERT INTO cliente
(nome_cliente, rg_cliente, cpf_cliente)
VALUES
('Ana', '37.500.805-6', '007.547.430-12');

SELECT * FROM cliente;

-- Erro nome_cliente
INSERT INTO cliente
(rg_cliente, cpf_cliente)
VALUES
('42.680.472-7', '171.593.930-15');

-- Erro cpf_cliente
INSERT INTO cliente
(nome_cliente, rg_cliente, cpf_cliente)
VALUES
('John', '42.680.472-7', '007.547.430-12');


INSERT INTO financiador
(nome_financiador, cnpj_financiador)
VALUES
('Financiador A', '05.836.215/0001-60');

INSERT INTO financiador
(cnpj_financiador)
VALUES
('86.672.408/0001-25');

INSERT INTO financiador
(cnpj_financiador)
VALUES
('82.406.956/0001-52');

SELECT * FROM financiador;


INSERT INTO autor
(nome_autor, rg_autor)
VALUES
('Paulo', '20.328.927-4');

INSERT INTO autor
(nome_autor, rg_autor)
VALUES
('João', '14.816.658-1');

INSERT INTO autor
(nome_autor, rg_autor)
VALUES
('Claudio', '24.666.005-3');

SELECT * FROM autor;

-- ERRO nome_autor
INSERT INTO autor
(rg_autor)
VALUES
('20.185.449-1');


INSERT INTO editora
(nomeFantasia_editora, razaoSocial_editora, pais_editora)
VALUES
('Editora A', 'Editora ABC', 'Estados Unidos');

INSERT INTO editora
(nomeFantasia_editora, razaoSocial_editora)
VALUES
('Editora B', 'Editora 123');

INSERT INTO editora
(nomeFantasia_editora, razaoSocial_editora)
VALUES
('Editora C', 'Editora 456');

SELECT * FROM editora;

-- ERRO nomeFantasia_editora
INSERT INTO editora
(nomeFantasia_editora, razaoSocial_editora)
VALUES
('Editora ABC', 'Editora 789');

-- ERRO razaoSocial_editora
INSERT INTO editora
(nomeFantasia_editora)
VALUES
('Editora C');


INSERT INTO livro
(isbn_livro, titulo_livro, preco_livro, categoria_livro, editora_id, autor_id, financiador_id)
VALUES
('978-85-333-0227-3', 'Livro 1', 10, 'Horror', 1, 1, 1);

INSERT INTO livro
(isbn_livro, titulo_livro, preco_livro, categoria_livro, editora_id, autor_id, financiador_id)
VALUES
('546-98-333-0227-3', 'Livro 2', 15, 'Ficção', 2, 2, 2);

INSERT INTO livro
(isbn_livro, titulo_livro, preco_livro, categoria_livro, editora_id, autor_id, financiador_id)
VALUES
('123-98-333-0227-3', 'Livro 3', 30, 'Romance', 3, 3, 3);

SELECT * FROM livro;

-- ERRO preco_livro
INSERT INTO livro
(isbn_livro, titulo_livro, preco_livro, categoria_livro, editora_id, autor_id, financiador_id)
VALUES
('789-98-333-0227-3', 'Livro 4', -15, 'Ação', 3, 3, 3); 

-- ERRO categoria_livro
INSERT INTO livro
(isbn_livro, titulo_livro, preco_livro, categoria_livro, editora_id, autor_id, financiador_id)
VALUES
('789-98-333-0227-3', 'Livro 4', 15, 'Comedia', 3, 3, 3);


INSERT INTO pedido
(livro_id, qtd_pedido, cliente_id)
VALUES
(1, 5, 1);

INSERT INTO pedido
(livro_id, qtd_pedido, cliente_id)
VALUES
(2, 10, 2);

INSERT INTO pedido
(livro_id, qtd_pedido, cliente_id)
VALUES
(3, 12, 3);

SELECT * FROM pedido;

-- ERRO qtd_pedido
INSERT INTO pedido
(livro_id, qtd_pedido, cliente_id)
VALUES
(3, -12, 3);