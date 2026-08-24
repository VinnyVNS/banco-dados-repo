CREATE DATABASE escola;

USE escola;

CREATE TABLE sala (
	id_sala INT NOT NULL PRIMARY KEY,
    nome_sala VARCHAR(45),
    capacidade_sala INT
);

CREATE TABLE turma (
	id_turma INT NOT NULL PRIMARY KEY,
    nome_turma VARCHAR(45),
    periodo VARCHAR(45),
    sala_id INT,
    FOREIGN KEY (sala_id) REFERENCES sala(id_sala)
);

CREATE TABLE professor (
	id_professor INT NOT NULL PRIMARY KEY,
    nome_prof VARCHAR(45),
    formacao_prof VARCHAR(45),
    turma_id INT,
    FOREIGN KEY (turma_id) REFERENCES turma(id_turma)
);

CREATE TABLE aula (
	id_aula INT NOT NULL PRIMARY KEY,
    nome VARCHAR(45),
    professor_id INT,
    FOREIGN KEY (professor_id) REFERENCES professor(id_professor)
);