CREATE DATABASE senai;

CREATE TABLE aluno (
	id_aluno INT NOT NULL,
    nome VARCHAR(45),
    data_nascimento DATE,
    PRIMARY KEY (id_aluno)
    );