CREATE DATABASE estacionamento_abc;

USE estacionamento_abc;

CREATE TABLE ticket (
	id_ticket INT NOT NULL PRIMARY KEY,
    codigo_barra INT,
    observacao TEXT
);

CREATE TABLE estacionamento (
	id_estacionamento INT NOT NULL PRIMARY KEY,
    nome VARCHAR(45),
    cnpj BIGINT,
    ticket_id INT,
    FOREIGN KEY (ticket_id) REFERENCES ticket(id_ticket)
);

CREATE TABLE setor (
	id_setor INT NOT NULL PRIMARY KEY,
    nome VARCHAR(45),
    descricao VARCHAR(45),
    estacionamento_id INT,
    FOREIGN KEY (estacionamento_id) REFERENCES estacionamento(id_estacionamento)
);

CREATE TABLE vaga (
	id_vaga INT NOT NULL PRIMARY KEY,
    numero_vaga INT,
    setor_id INT,
    FOREIGN KEY (setor_id) REFERENCES setor(id_setor)
);

-- Apagar chave estrangeira

ALTER TABLE vaga DROP FOREIGN KEY vaga_ibfk_1;

-- Adicionar chave estrangeira

ALTER TABLE vaga ADD FOREIGN KEY (setor_id) REFERENCES setor(id_setor);

-- Adicionar uma nova coluna

ALTER TABLE ticket ADD COLUMN descricao TEXT;

-- Alterar nome da tabela

ALTER TABLE estacionamento RENAME TO parking;

-- Alterar nome da coluna

ALTER TABLE ticket RENAME COLUMN observacao TO observation;

-- Modificar tipo de dado da coluna

ALTER TABLE ticket MODIFY descricao VARCHAR(100);

-- Apagar coluna

ALTER TABLE ticket DROP COLUMN descricao;

DESCRIBE setor;
DESCRIBE ticket;