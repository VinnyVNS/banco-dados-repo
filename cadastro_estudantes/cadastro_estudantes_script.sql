CREATE DATABASE cadastro_estudantes;

USE cadastro_estudantes;

CREATE TABLE dados_estudantes (
	id_estudante INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    matricula VARCHAR(45)
);

INSERT INTO dados_estudantes
(nome, matricula)
VALUES
("Vinicius", "123");

SELECT * FROM dados_estudantes;