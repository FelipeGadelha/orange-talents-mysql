CREATE TABLE tbAluno (
	email VARCHAR(30) PRIMARY KEY,
    nome VARCHAR(30),
    idade SMALLINT
);

INSERT INTO tbAluno(
	email, nome, idade
) VALUES (
	'fulano@zup.com.br', 'Fulano da Silva Sauro', 18
);

INSERT INTO tbAluno(
	email, nome, idade
) VALUES (
	'siclano@email.com.br', 'Sicrano dos Santos', 33
);

INSERT INTO tbAluno(
	email, nome, idade
) VALUES (
	'beltrano@teste.com.br', 'Beltrano da Cruz', 25
);

INSERT INTO tbAluno(
	email, nome, idade
) VALUES (
	'dital@zup.com.br', 'Dital Pereira', 30
);

SELECT * FROM tbAluno;

DELETE FROM tbAluno WHERE email = 'siclano@email.com.br';

SELECT * FROM tbAluno WHERE email LIKE '%zup%';

SELECT * FROM tbAluno ORDER BY IDADE ASC;

