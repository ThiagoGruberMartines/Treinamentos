CREATE DATABASE escola;

USE escola;

CREATE TABLE pessoa(
	id_pessoa INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_pessoa VARCHAR(50) NOT NULL,
    sobrenome_pessoa VARCHAR(60) NOT NULL,
    cpf VARCHAR (14) NOT NULL,
    data_nascimento date,
    salario DECIMAL(10,2),
    titulo_cargo VARCHAR(35)
);

CREATE TABLE cargo(
	titulo_cargo VARCHAR(35) NOT NULL PRIMARY KEY,
    data_cadastro date
);


ALTER TABLE pessoa
ADD CONSTRAINT fk_cargo
FOREIGN KEY (titulo_cargo)
REFERENCES cargo (titulo_cargo);



ALTER TABLE cargo
DROP data_cadastro;



INSERT INTO cargo VALUES ('Professor(a)');
INSERT INTO cargo VALUES ('Aluno(a)');
INSERT INTO cargo VALUES ('Diretor(a)');
INSERT INTO cargo VALUES ('Pedagogo(a)');
INSERT INTO cargo VALUES ('Bibliotecário(a)');
INSERT INTO cargo VALUES ('Zelador(a)');
INSERT INTO cargo VALUES ('Técnico(a)');
INSERT INTO cargo VALUES ('Cozinheiro(a)');



INSERT INTO pessoa VALUES (NULL, 'João', 'da Silva', '158.654.852-90', '1997-12-05', 3500, 'Professor(a)');
INSERT INTO pessoa VALUES (NULL, 'Pedro', 'da Silva', '168.549.826-95', '1985-10-02', 3300, 'Professor(a)');
INSERT INTO pessoa VALUES (NULL, 'Pedro', 'Coelho da Rocha', '165.499.866-25', '1987-06-26', 3600, 'Professor(a)');
INSERT INTO pessoa VALUES (NULL, 'Thiago', 'Alex Santana', '268.969.716-56', '1985-10-02', 3500, 'Professor(a)');
INSERT INTO pessoa VALUES (NULL, 'Alex', 'da Rocha', '922.945.249-29', '2005-05-29', NULL, 'Aluno(a)');
INSERT INTO pessoa VALUES (NULL, 'Gabriel', 'da Silva', '909.569.956-96', '2006-05-29', NULL, 'Aluno(a)');
INSERT INTO pessoa VALUES (NULL, 'João', 'da Rocha', '009.239.959-39', '2001-05-29', NULL, 'Aluno(a)');
INSERT INTO pessoa VALUES (NULL, 'José', 'da Penha', '289.949.759-29', '2001-05-29', NULL, 'Aluno(a)');
INSERT INTO pessoa VALUES (NULL, 'Marcos', 'da Penha', '929.995.969-33', '2008-05-29', NULL, 'Aluno(a)');
INSERT INTO pessoa VALUES (NULL, 'Juliano', 'Coelho da Rocha', '589.929.966-49', '2005-05-29', NULL, 'Aluno(a)');
INSERT INTO pessoa VALUES (NULL, 'Thiago', 'Souza', '589.926.929-69', '2008-05-29', NULL, 'Aluno(a)');
INSERT INTO pessoa VALUES (NULL, 'Alex', 'Souza', '229.559.999-25', '2006-05-29', NULL, 'Aluno(a)');
INSERT INTO pessoa VALUES (NULL, 'Elton', 'Feliciano de Paula', '649.254.626-92', '1972-05-06', 2800, 'Zelador(a)');
INSERT INTO pessoa VALUES (NULL, 'Marcos', 'Oliveira de Souza', '123.456.789-10', '1985-10-23', 4500, 'Diretor(a)');
INSERT INTO pessoa VALUES (NULL, 'Joana', 'da Silva', '195.626.256-10', '1995-09-15', 4500, 'Diretor(a)');
INSERT INTO pessoa VALUES (NULL, 'Maria Joana', 'Oliveira de Souza', '157.682.654-92', '1974-02-12', 1800, 'Cozinheiro(a)');
INSERT INTO pessoa VALUES (NULL, 'Maria', 'da Silva', '168.122.456-57', '1978-08-22', 1800, 'Cozinheiro(a)');
INSERT INTO pessoa VALUES (NULL, 'Analina', 'Souza', '758.444.521-74', '1979-01-17', 1800, 'Cozinheiro(a)');
INSERT INTO pessoa VALUES (NULL, 'Firmino', 'de Paula', '123.423.543-45', '1992-06-15', 2200, 'Bibliotecário(a)');


SELECT * FROM pessoa;
SELECT * FROM cargo;




-- FILTRANDO PESQUISA - APENAS ALUNOS, ORGANIZADOS POR ORDEM CRESCENTE.
SELECT p.nome_pessoa AS Nome, 
p.sobrenome_pessoa AS Sobrenome,
c.titulo_cargo AS Cargo
FROM pessoa p
INNER JOIN cargo c
on p.titulo_cargo = c.titulo_cargo
WHERE p.titulo_cargo = 'Aluno(a)'
ORDER BY p.nome_pessoa ASC;