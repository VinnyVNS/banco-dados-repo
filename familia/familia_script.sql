CREATE DATABASE familia;

USE familia;

CREATE TABLE filho (
	id_filho INT AUTO_INCREMENT PRIMARY KEY,
    nome_filho VARCHAR(45)
);

CREATE TABLE pai (
	id_pai INT AUTO_INCREMENT PRIMARY KEY,
    nome_pai VARCHAR(45),
    filho_id INT,
    FOREIGN KEY (filho_id) REFERENCES filho(id_filho)
);

INSERT INTO filho
(nome_filho)
VALUES
('Joãozinho'),
('Mariazinha'),
('Carlinha'),
('Aninha');

INSERT INTO pai
(nome_pai, filho_id)
VALUES
('Antonio', 4),
('Antonio', 3),
('Carlos', 2);

INSERT INTO pai
(nome_pai)
VALUES
('Mateus');

CREATE VIEW paiFilho AS
SELECT pai.nome_pai, filho.nome_filho FROM pai
LEFT JOIN filho
ON pai.filho_id = filho.id_filho;

CREATE VIEW filhoPai AS
SELECT pai.nome_pai, filho.nome_filho FROM pai
RIGHT JOIN filho
ON pai.filho_id = filho.id_filho;

CREATE VIEW paiFilhoFull AS
SELECT pai.nome_pai, filho.nome_filho FROM pai
LEFT JOIN filho
ON pai.filho_id = filho.id_filho
UNION
SELECT pai.nome_pai, filho.nome_filho FROM pai
RIGHT JOIN filho
ON pai.filho_id = filho.id_filho;

SELECT * FROM paiFilho;
SELECT * FROM filhoPai;
SELECT * FROM paiFilhoFull;