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
SELECT pai.id_pai, pai.nome_pai, pai.filho_id, filho.nome_filho FROM pai
JOIN filho
ON pai.filho_id = filho.id_filho;

SELECT * FROM paiFilho;