drop table tbAluno;
drop table tbAvaliacao;

CREATE TABLE aluno (
	email VARCHAR(30) PRIMARY KEY,
    nome VARCHAR(30),
    idade tinyint
);

CREATE TABLE avaliacao (
	id int PRIMARY KEY auto_increment not null, 
	titulo VARCHAR(30),
    descricao VARCHAR(30),
    resposta VARCHAR(255),
    aluno_email VARCHAR(30),
    foreign key (aluno_email) references aluno(email)
);

CREATE TABLE correcao (
	id int PRIMARY KEY auto_increment not null, 
	nota Tinyint,
    resposta_corrigida VARCHAR(255),
    avaliacao_id int,
    foreign key (avaliacao_id) references avaliacao(id)
);

-- INSERT ALUNO
INSERT INTO aluno(
	email, nome, idade
) VALUES (
	'fulano@zup.com.br', 'Fulano da Silva Sauro', 18
);

INSERT INTO aluno(
	email, nome, idade
) VALUES (
	'sicrano@email.com.br', 'Sicrano dos Santos', 33
);

INSERT INTO aluno(
	email, nome, idade
) VALUES (
	'beltrano@teste.com.br', 'Beltrano da Cruz', 25
);

INSERT INTO aluno(
	email, nome, idade
) VALUES (
	'dital@zup.com.br', 'Dital Pereira', 30
);
-- INSERT AVALIACAO
INSERT INTO avaliacao(
	titulo, descricao, resposta, aluno_email
) VALUES (
	'teste 1', 'descrição do teste 1', 'resposta 1','fulano@zup.com.br'
);
INSERT INTO avaliacao(
	titulo, descricao, resposta, aluno_email
) VALUES (
	'teste 2', 'descrição do teste 2', 'resposta 2','fulano@zup.com.br'
);
INSERT INTO avaliacao(
	titulo, descricao, resposta, aluno_email
) VALUES (
	'teste 3', 'descrição do teste 3', 'resposta 3','fulano@zup.com.br'
);

INSERT INTO avaliacao(
	titulo, descricao, resposta, aluno_email
) VALUES (
	'teste 1', 'descrição do dital teste 1', 'resposta 1 com dital','dital@zup.com.br'
);
INSERT INTO avaliacao(
	titulo, descricao, resposta, aluno_email
) VALUES (
	'teste 2', 'descrição do beltrano teste 2', 'resposta beltrano 2','beltrano@teste.com.br'
);

INSERT INTO avaliacao(
	titulo, descricao, resposta, aluno_email
) VALUES (
	'teste 3', 'descrição do sicrano teste 3', 'resposta sicrano 3','sicrano@email.com.br'
);

INSERT INTO correcao(
	nota, resposta_corrigida, avaliacao_id
) VALUES (
	6, 'correcaoda descricao do teste 3', 3
);
INSERT INTO correcao(
	nota, resposta_corrigida, avaliacao_id
) VALUES (
	6, 'correcaoda descricao do teste 4', 4
);
INSERT INTO correcao(
	nota, resposta_corrigida, avaliacao_id
) VALUES (
	6, 'correcaoda descricao do teste 5', 5
);
INSERT INTO correcao(
	nota, resposta_corrigida, avaliacao_id
) VALUES (
	2, 'correcaoda descricao do teste 5', 5
);
INSERT INTO correcao(
	nota, resposta_corrigida, avaliacao_id
) VALUES (
	7, 'correcaoda descricao do teste 5', 5
);
INSERT INTO correcao(
	nota, resposta_corrigida, avaliacao_id
) VALUES (
	2, 'correcaoda descricao do teste 3', 3
);
-- CONSULTA AVALIACAO PELO TITULO

select * from aluno
inner join avaliacao
on aluno.email = avaliacao.aluno_email
where avaliacao.titulo = 'teste 1';
-- ou
select aluno.nome, aluno.email from aluno
inner join avaliacao
on aluno.email = avaliacao.aluno_email
where avaliacao.titulo = 'teste 1';

-- RESPOSTAS DADA POR AVALIACAO
select titulo, count(*) as QUANTIDADE 
from avaliacao 
group by titulo;

-- MÉDIA DA AUTOCORREÇAO POR AVALIAÇÃO
select avaliacao.titulo, avg(nota)
from correcao
inner join avaliacao
on correcao.avaliacao_id = avaliacao.id
group by avaliacao.titulo;












