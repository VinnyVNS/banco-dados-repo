CREATE DATABASE escola_x;

USE escola_x;

CREATE TABLE aluno (
	id_aluno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    dt_nascimento DATE,
    cpf BIGINT UNIQUE
);

CREATE TABLE disciplina (
	id_disciplina INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    qtd_creditos INT
);

CREATE TABLE turma (
	id_turma INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    disciplina_id INT,
    turno VARCHAR(20),
    FOREIGN KEY (disciplina_id) REFERENCES disciplina(id_disciplina)
);

CREATE TABLE inscricao (
	id_inscricao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT,
    turma_id INT,
    dt_inscricao DATE,
    FOREIGN KEY (aluno_id) REFERENCES aluno(id_aluno),
    FOREIGN KEY (turma_id) REFERENCES turma(id_turma)
);

CREATE TABLE mensalidade (
	id_mensalidade INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    inscricao_id INT,
    dt_vencimento DATE,
    valor DECIMAL(8,2),
    status_pagamento ENUM('Pago', 'Não Pago'),
    FOREIGN KEY (inscricao_id) REFERENCES inscricao(id_inscricao)
);

INSERT INTO aluno
(nome, dt_nascimento, cpf)
VALUES
('Vinicius', '2000-08-02', 05732353178);

INSERT INTO aluno
(nome, dt_nascimento, cpf)
VALUES
('Matheus', '2009-10-15', 12345678912);

INSERT INTO aluno
(nome, dt_nascimento, cpf)
VALUES
('Julia', '2005-03-06', 32165498721);

INSERT INTO aluno
(nome, dt_nascimento, cpf)
VALUES
('João', '1999-01-12', 98765432198);

INSERT INTO aluno
(nome, dt_nascimento, cpf)
VALUES
('Rodrigo', '1992-05-25', 78945612389);


INSERT INTO disciplina
(nome, qtd_creditos)
VALUES
('Banco de Dados', 30);

INSERT INTO disciplina
(nome, qtd_creditos)
VALUES
('Matemática', 10);

INSERT INTO disciplina
(nome, qtd_creditos)
VALUES
('Inglês', 5);

INSERT INTO disciplina
(nome, qtd_creditos)
VALUES
('Programação', 20);

INSERT INTO disciplina
(nome, qtd_creditos)
VALUES
('Português', 40);


INSERT INTO turma
(disciplina_id, turno)
VALUES
(1, 'Noite');

INSERT INTO turma
(disciplina_id, turno)
VALUES
(2, 'Noite');

INSERT INTO turma
(disciplina_id, turno)
VALUES
(3, 'Manhã');

INSERT INTO turma
(disciplina_id, turno)
VALUES
(4, 'Tarde');

INSERT INTO turma
(disciplina_id, turno)
VALUES
(5, 'Manhã');


INSERT INTO inscricao
(dt_inscricao, aluno_id, turma_id)
VALUES
('2024-01-01', 4, 1);

INSERT INTO inscricao
(dt_inscricao, aluno_id, turma_id)
VALUES
('2024-01-01', 3, 2);

INSERT INTO inscricao
(dt_inscricao, aluno_id, turma_id)
VALUES
('2024-01-01', 2, 3);

INSERT INTO inscricao
(dt_inscricao, aluno_id, turma_id)
VALUES
('2024-06-01', 4, 1);

INSERT INTO inscricao
(dt_inscricao, aluno_id, turma_id)
VALUES
('2024-06-01', 3, 2);

INSERT INTO inscricao
(dt_inscricao, aluno_id, turma_id)
VALUES
('2024-06-01', 2, 3);

INSERT INTO inscricao
(dt_inscricao)
VALUES
('2024-06-01');


INSERT INTO mensalidade
(dt_vencimento, valor, status_pagamento, inscricao_id)
VALUES
('2024-01-05', 600, 'Pago', 1);

INSERT INTO mensalidade
(dt_vencimento, valor, status_pagamento, inscricao_id)
VALUES
('2024-01-05', 600, 'Pago', 2);

INSERT INTO mensalidade
(dt_vencimento, valor, status_pagamento, inscricao_id)
VALUES
('2024-01-05', 600, 'Pago', 3);

INSERT INTO mensalidade
(dt_vencimento, valor, status_pagamento, inscricao_id)
VALUES
('2024-06-05', 700, 'Não Pago', 4);

INSERT INTO mensalidade
(dt_vencimento, valor, status_pagamento, inscricao_id)
VALUES
('2024-06-05', 700, 'Não Pago', 5);

INSERT INTO mensalidade
(dt_vencimento, valor, status_pagamento, inscricao_id)
VALUES
('2024-06-05', 700, 'Não Pago', 6);


SELECT * FROM aluno;
SELECT * FROM disciplina;
SELECT * FROM turma;
SELECT * FROM inscricao;
SELECT * FROM mensalidade;