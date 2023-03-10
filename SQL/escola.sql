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
INSERT INTO pessoa VALUES (NULL, 'Luciano', 'Oliveira', '195.576.857-92', '1995-03-02', 4000, 'Técnico(a)');
INSERT INTO pessoa VALUES (NULL, 'Marcia', 'da Silva', '168.546.654-85', '1972-12-10', 3250, 'Pedagogo(a)');
INSERT INTO pessoa VALUES (NULL, 'Lucia', 'Pereira', '642.578.974-42', '1978-10-28', 3250, 'Pedagogo(a)');



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


ALTER TABLE pessoa
ADD COLUMN data_cadastro datetime;



-- AQUI CRIAMOS UMA TRIGGER QUE TERÁ A FUNÇÃO DE CADASTRAR A DATA CORRETA EM QUE O CADASTRO FOI INSERIDO NO BANCO



CREATE TRIGGER tr_cadastro BEFORE INSERT
ON pessoa
FOR EACH ROW
SET NEW.data_cadastro = NOW();


-- A PARTIR DAQUI, QUALQUER CADASTRO QUE SEJA INSERIDO NA TABELA 'pessoa', SERÁ AUTOMÁTICAMENTE INFORMADO A DATA E A HORA EM QUE FOI CADASTRADO.

INSERT INTO pessoa (nome_pessoa, sobrenome_pessoa, cpf, data_nascimento, titulo_cargo) VALUES ('Willian', 'Toneli', '197.254.958-96', '1998-02-05', 'Aluno(a)');

SELECT * FROM pessoa;






-- Exercício 1: Listar nome e sobrenome ordenado
-- por sobrenome:

	SELECT nome_pessoa AS Nome,
    sobrenome_pessoa AS Sobrenome
    FROM pessoa
    ORDER BY sobrenome_pessoa;
    
    
-- Exercício 2: Liste os funcionários que têm salário
-- superior a R$ 1.000,00 ordenados
-- pelo nome completo:

	SELECT * FROM pessoa
    WHERE salario > 1000
    ORDER BY nome_pessoa, sobrenome_pessoa;
    
    
-- Exercício 3: Liste a data de nascimento e o
-- primeiro nome das pessoas
-- ordenados do mais novo para o mais velho:

	SELECT nome_pessoa AS Nome,
	data_nascimento AS 'Data de Nascimento'
	FROM pessoa
	ORDER BY data_nascimento DESC;


-- Exercício 4: Liste o total da folha de pagamento:

	SELECT SUM(salario)
    AS TOTAL
    FROM pessoa;
    
-- Exercício 5: Liste o total da folha de pagamento por cargo:

	SELECT titulo_cargo AS Cargo,
    SUM(salario) AS TOTAL
    FROM pessoa
    GROUP BY titulo_cargo
    ORDER BY titulo_cargo ASC;
    
    
-- Exercício 6: Liste a quantidade de funcionários dessa escola:

	SELECT COUNT(titulo_cargo) AS Funcionários
    FROM pessoa
    WHERE titulo_cargo <> 'Aluno(a)';
    
-- Exercício 7: Liste a quantidade de alunos dessa escola:

	SELECT COUNT(titulo_cargo) AS Alunos
    FROM pessoa
    WHERE titulo_cargo = 'Aluno(a)';
    
    
    
-- Exercício 8: Liste o salário médio pago pela escola:

	SELECT AVG(salario) AS 'Média Salarial'
    FROM pessoa;
    
    
-- Exercício 9: Liste o menor salário pago pela
-- escola em cada cargo:

	SELECT titulo_cargo AS Cargo,
    MIN(salario)
    FROM pessoa
    WHERE titulo_cargo <> 'Aluno(a)'
    GROUP BY titulo_cargo
    ORDER BY titulo_cargo;
    
-- FAZENDO A MESMA COISA SÓ QUE UTILIZANDO O JOIN (INNER JOIN)
    
    SELECT c.titulo_cargo AS Cargo,
    MIN(p.salario)
    FROM pessoa p
    JOIN cargo c
    ON p.titulo_cargo = c.titulo_cargo
    WHERE c.titulo_cargo <> 'Aluno(a)'
    GROUP BY c.titulo_cargo
    ORDER BY c.titulo_cargo;
    
-- Exercício 10: Liste o nome do cargo e do
-- funcionário ordenados por cargo e funcionário:

SELECT c.titulo_cargo AS Cargo,
p.nome_pessoa AS Funcionário
FROM pessoa p
JOIN cargo c
ON p.titulo_cargo = c.titulo_cargo
WHERE c.titulo_cargo <> 'Aluno(a)'
ORDER BY c.titulo_cargo, p.nome_pessoa;





-- TREINANDO FUNCTIONS

DELIMITER $$
CREATE FUNCTION fn_darAumento(salario DECIMAL(10,2), taxa DECIMAL(10,2))
RETURNS DECIMAL(10,2) 
BEGIN
	 RETURN salario + salario * taxa / 100;
END$$
DELIMITER ;



-- Visualizando apenas como seria um aumento de 10% no salário de cada funcionário.

SELECT nome_pessoa AS Nome,
salario AS Salário,
fn_darAumento(salario, 10) AS 'Salário com aumento de 10%'
FROM pessoa
WHERE titulo_cargo <> 'Aluno(a)'
ORDER BY nome_pessoa;

-- Aqui utilizamos a função fn_darAumento para realmente dar esse aumento, atualizando assim o valor real.

UPDATE pessoa
SET salario = fn_darAumento(salario, 10)
WHERE id_pessoa = 30;





-- Criando uma função que diminua o salário

DELIMITER $$
CREATE FUNCTION fn_diminuiSalario(salario DECIMAL(10,2), taxa DECIMAL(10,2))
RETURNS DECIMAL(10,2)
BEGIN
	RETURN salario - salario * taxa / 100;
END$$
DELIMITER ;


SELECT * FROM pessoa
WHERE id_pessoa = 30;


UPDATE pessoa
SET salario = fn_diminuiSalario(salario, 10)
WHERE id_pessoa = 30;




