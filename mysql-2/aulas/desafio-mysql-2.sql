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