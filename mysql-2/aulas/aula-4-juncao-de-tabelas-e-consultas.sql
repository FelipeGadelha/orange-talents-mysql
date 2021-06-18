select * from tabela_de_vendedores;
select * from tabela_de_clientes;
select * from tabela_de_produtos;
select * from notas_fiscais;
select * from itens_notas_fiscais;


select * from tabela_de_vendedores A
inner join notas_fiscais B
on A.matricula = B.matricula;

select A.MATRICULA, A.NOME, count(*) as NOTAS from tabela_de_vendedores A
inner join notas_fiscais B
on A.matricula = B.matricula
group by A.MATRICULA, A.NOME;

select A.MATRICULA, A.NOME, count(*) as NOTAS from tabela_de_vendedores A, notas_fiscais B
where A.matricula = B.matricula
group by A.MATRICULA, A.NOME;

select year(DATA_VENDA) as ANO, sum(INF.QUANTIDADE * INF.PRECO) as FATURAMENTO from notas_fiscais NF
inner join itens_notas_fiscais INF
on NF.NUMERO = INF.NUMERO
group by year(DATA_VENDA);

Select count(*) as TOTAL from tabela_de_clientes;
Select * from tabela_de_clientes;

Select CPF, count(*) as TOTAL from notas_fiscais
group by CPF;

select distinct CLIENTES.CPF, CLIENTES.NOME, NF.CPF from tabela_de_clientes CLIENTES
inner join notas_fiscais NF
on CLIENTES.CPF = NF.CPF;

select distinct CLIENTES.CPF, CLIENTES.NOME, NF.CPF from tabela_de_clientes CLIENTES
left join notas_fiscais NF
on CLIENTES.CPF = NF.CPF;

select distinct CLIENTES.CPF, CLIENTES.NOME, NF.CPF from tabela_de_clientes CLIENTES
left join notas_fiscais NF
on CLIENTES.CPF = NF.CPF
where NF.CPF is null;

select distinct CLIENTES.CPF, CLIENTES.NOME, NF.CPF from tabela_de_clientes CLIENTES
left join notas_fiscais NF
on CLIENTES.CPF = NF.CPF
where NF.CPF is null and (NF.DATA_VENDA) = 2015;

select distinct CLIENTES.CPF, CLIENTES.NOME, NF.CPF from notas_fiscais NF
right join tabela_de_clientes CLIENTES 
on CLIENTES.CPF = NF.CPF
where NF.CPF is null;

select * from tabela_de_vendedores;

select * from tabela_de_clientes;

select * from tabela_de_vendedores 
inner join tabela_de_clientes
on tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

select 
tabela_de_vendedores.BAIRRO, 
tabela_de_vendedores.NOME,
tabela_de_vendedores.DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME
from tabela_de_vendedores 
inner join tabela_de_clientes
on tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

select 
tabela_de_vendedores.BAIRRO, 
tabela_de_vendedores.NOME,
DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME
from tabela_de_vendedores 
inner join tabela_de_clientes
on tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

select 
tabela_de_vendedores.BAIRRO, 
tabela_de_vendedores.NOME,
DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME
from tabela_de_vendedores 
left join tabela_de_clientes
on tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

select 
tabela_de_vendedores.BAIRRO, 
tabela_de_vendedores.NOME,
DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME
from tabela_de_vendedores 
right join tabela_de_clientes
on tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

select 
tabela_de_vendedores.BAIRRO, 
tabela_de_vendedores.NOME,
DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME
from tabela_de_vendedores 
cross join tabela_de_clientes;

select 
tabela_de_vendedores.BAIRRO, 
tabela_de_vendedores.NOME,
DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME
from tabela_de_vendedores, tabela_de_clientes;

select distinct BAIRRO from tabela_de_clientes
union
select distinct BAIRRO from tabela_de_vendedores;

select distinct BAIRRO from tabela_de_clientes
union all
select distinct BAIRRO from tabela_de_vendedores;

select distinct BAIRRO, NOME from tabela_de_clientes
union
select distinct BAIRRO, NOME from tabela_de_vendedores;

select distinct BAIRRO, NOME, 'CLIENTE' as TIPO from tabela_de_clientes
union
select distinct BAIRRO, NOME, 'VENDEDOR' as TIPO from tabela_de_vendedores;

select distinct BAIRRO, NOME, 'CLIENTE' as TIPO_CLIENTE from tabela_de_clientes
union
select distinct BAIRRO, NOME, 'VENDEDOR' as TIPO_VENDEDOR from tabela_de_vendedores;

select distinct BAIRRO, NOME, 'CLIENTE' as TIPO_CLIENTE, CPF from tabela_de_clientes
union
select distinct BAIRRO, NOME, 'VENDEDOR' as TIPO_VENDEDOR, MATRICULA from tabela_de_vendedores;

-- igual ao full join
select 
tabela_de_vendedores.BAIRRO, 
tabela_de_vendedores.NOME,
DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME
from tabela_de_vendedores 
left join tabela_de_clientes
on tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO
union
select 
tabela_de_vendedores.BAIRRO, 
tabela_de_vendedores.NOME,
DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME
from tabela_de_vendedores 
right join tabela_de_clientes
on tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

-- sub consultas

select distinct BAIRRO from tabela_de_vendedores;

select * from tabela_de_clientes where BAIRRO 
in ('Tijuca', 'Jardins', 'Copacabana', 'Santo Amaro');

select * from tabela_de_clientes where BAIRRO 
in (select distinct BAIRRO from tabela_de_vendedores);

select X.EMBALAGEM, X.PRECO_MAXIMO from
(select EMBALAGEM, max(PRECO_DE_LISTA) as PRECO_MAXIMO from tabela_de_produtos
group by EMBALAGEM) X
where X.PRECO_MAXIMO >= 10;

SELECT X.CPF, X.CONTADOR FROM 
(SELECT CPF, COUNT(*) AS CONTADOR FROM notas_fiscais
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY CPF) X WHERE X.CONTADOR > 2000;

-- View

select EMBALAGEM, max(PRECO_DE_LISTA) as PRECO_MAXIMO from tabela_de_produtos
group by EMBALAGEM;

select X.EMBALAGEM, X.PRECO_MAXIMO from
(select EMBALAGEM, max(PRECO_DE_LISTA) as PRECO_MAXIMO from tabela_de_produtos
group by EMBALAGEM) X
where X.PRECO_MAXIMO >= 10;

select * from VW_MAIORES_EMBALAGENS;

select X.EMBALAGEM, X.PRECO_MAXIMO from
VW_MAIORES_EMBALAGENS X
where X.PRECO_MAXIMO >= 10;

select A.NOME_DO_PRODUTO, A.EMBALAGEM, A.PRECO_DE_LISTA, X.PRECO_MAXIMO, ((A.PRECO_DE_LISTA / X.PRECO_MAXIMO)-1) * 100 as PERCENTUAL
from tabela_de_produtos A 
inner join VW_MAIORES_EMBALAGENS X
on A.EMBALAGEM = X.EMBALAGEM;











