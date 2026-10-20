CREATE DATABASE escola_xyz;

USE escola_xyz;

CREATE TABLE aluno (
	id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE curso (
	id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    duracao INT
);

CREATE TABLE inscricao (
	id_inscricao INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT,
    dt_inscricao DATE,
    curso_id INT,
    FOREIGN KEY (aluno_id) REFERENCES aluno(id_aluno),
    FOREIGN KEY (curso_id) REFERENCES curso(id_curso)
);

CREATE TABLE mensalidade (
	id_mensalidade INT AUTO_INCREMENT PRIMARY KEY,
    inscricao_id INT,
    dt_vencimento DATE,
    valor DECIMAL(5, 2),
    status_pagamento ENUM ("Pago", "Não Pago"),
    FOREIGN KEY (inscricao_id) REFERENCES inscricao(id_inscricao)
);

INSERT INTO aluno
(nome)
VALUES
("Vinicius"),
("Pedro"),
("João"),
("Matheus"),
("Julia");

INSERT INTO curso
(nome, duracao)
VALUES
("Matematica", 50),
("Geografia", 30),
("Quimica", 60),
("Calculo", 100),
("Programação", 80);

INSERT INTO inscricao
(aluno_id, dt_inscricao, curso_id)
VALUES
(4,"2020-01-02", 4),
(3,"2020-01-02", 3),
(2,"2020-01-02", 2),
(4,"2020-06-02", 4),
(3,"2020-06-02", 3),
(2,"2020-06-02", 2);

INSERT INTO inscricao
(dt_inscricao)
VALUES
("2020-06-02");

INSERT INTO mensalidade
(dt_vencimento, valor, status_pagamento,inscricao_id)
VALUES
("2020-01-10", 550, "Pago", 1),
("2020-01-10", 540, "Pago", 2),
("2020-01-10", 530, "Pago", 3),
("2020-06-10", 580, "Não Pago", 4),
("2020-06-10", 570, "Não Pago", 5),
("2020-06-10", 560, "Não Pago", 6);

-- a)
SELECT aluno.nome, sum(mensalidade.valor) AS total FROM mensalidade
JOIN inscricao ON inscricao.id_inscricao = mensalidade.inscricao_id
JOIN aluno ON aluno.id_aluno = inscricao.aluno_id
GROUP BY aluno.nome;

-- b)
SELECT sum(mensalidade.valor) FROM mensalidade
WHERE mensalidade.status_pagamento = "Não Pago";

-- c)
SELECT aluno.nome, avg(mensalidade.valor) AS media FROM mensalidade
JOIN inscricao ON inscricao.id_inscricao = mensalidade.inscricao_id
JOIN aluno ON aluno.id_aluno = inscricao.aluno_id
GROUP BY aluno.nome;

-- d)
SELECT max(mensalidade.valor) AS valor_maximo FROM mensalidade;

-- e)
SELECT min(mensalidade.valor) AS valor_minimo FROM mensalidade;

-- f)
SELECT min(mensalidade.valor) AS valor_minimo FROM mensalidade
WHERE status_pagamento = "Não Pago";

-- g)
SELECT DISTINCT aluno.nome FROM inscricao
JOIN aluno ON aluno.id_aluno = inscricao.aluno_id;

-- g)
SELECT aluno.nome FROM inscricao
JOIN aluno ON aluno.id_aluno = inscricao.aluno_id
GROUP BY aluno.nome;

-- h)
SELECT mensalidade.dt_vencimento, sum(mensalidade.valor) FROM mensalidade
WHERE mensalidade.dt_vencimento < "2020-06-10"
GROUP BY mensalidade.dt_vencimento;

-- i)
SELECT mensalidade.dt_vencimento, sum(mensalidade.valor) FROM mensalidade
WHERE mensalidade.dt_vencimento > "2020-06-09"
GROUP BY mensalidade.dt_vencimento;

-- j)
SELECT sum(mensalidade.valor) FROM mensalidade
WHERE mensalidade.id_mensalidade >= 2 AND mensalidade.id_mensalidade <= 5;