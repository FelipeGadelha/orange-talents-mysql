select * from itens_notas_fiscais;

select * from notas_fiscais;

select NF.CPF, NF.DATA_VENDA, INF.QUANTIDADE from notas_fiscais NF
inner join itens_notas_fiscais INF
on NF.NUMERO = INF.NUMERO;

/* 	CONSULTA COM VENDAS DE CLIENTES POR MES */
select NF.CPF, date_format(NF.DATA_VENDA, '%Y-%m') as MES_ANO, sum(INF.QUANTIDADE) as QUANTIDADE_VENDAS from notas_fiscais NF
inner join itens_notas_fiscais INF
on NF.NUMERO = INF.NUMERO
group by NF.CPF, date_format(NF.DATA_VENDA, '%Y-%m');

/* 	LIMITE DE COMPRA POR CLIENTE */
select * from tabela_de_clientes TC;

select TC.CPF, TC.NOME, TC.VOLUME_DE_COMPRA as QUANTIDADE from tabela_de_clientes TC;

select NF.CPF, TC.NOME, date_format(NF.DATA_VENDA, '%Y-%m') as MES_ANO, 
sum(INF.QUANTIDADE) as QUANTIDADE_VENDAS,
TC.VOLUME_DE_COMPRA as QUANTIDADE_LIMITE
from notas_fiscais NF
inner join itens_notas_fiscais INF
on NF.NUMERO = INF.NUMERO
inner join tabela_de_clientes TC
on TC.CPF = NF.CPF
group by NF.CPF, TC.NOME, date_format(NF.DATA_VENDA, '%Y-%m');

select NF.CPF, TC.NOME, date_format(NF.DATA_VENDA, '%Y-%m') as MES_ANO, 
(INF.QUANTIDADE) as QUANTIDADE_VENDAS,
TC.VOLUME_DE_COMPRA as QUANTIDADE_LIMITE
from notas_fiscais NF
inner join itens_notas_fiscais INF
on NF.NUMERO = INF.NUMERO
inner join tabela_de_clientes TC
on TC.CPF = NF.CPF;

select NF.CPF, TC.NOME, date_format(NF.DATA_VENDA, '%Y-%m') as MES_ANO, 
sum(INF.QUANTIDADE) as QUANTIDADE_VENDAS,
max(TC.VOLUME_DE_COMPRA) as QUANTIDADE_LIMITE
from notas_fiscais NF
inner join itens_notas_fiscais INF
on NF.NUMERO = INF.NUMERO
inner join tabela_de_clientes TC
on TC.CPF = NF.CPF
group by NF.CPF, TC.NOME, date_format(NF.DATA_VENDA, '%Y-%m');

select X.CPF, X.NOME, X.MES_ANO, X.QUANTIDADE_VENDAS, X.QUANTIDADE_LIMITE,
X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS as DIFERENCA,
case when (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0 
	then 'INVÁLIDA'
else 'VÁLIDA' end as STATUS_VENDA
from 
(select NF.CPF, TC.NOME, date_format(NF.DATA_VENDA, '%Y-%m') as MES_ANO, 
sum(INF.QUANTIDADE) as QUANTIDADE_VENDAS,
max(TC.VOLUME_DE_COMPRA) as QUANTIDADE_LIMITE
from notas_fiscais NF
inner join itens_notas_fiscais INF
on NF.NUMERO = INF.NUMERO
inner join tabela_de_clientes TC
on TC.CPF = NF.CPF
group by NF.CPF, TC.NOME, date_format(NF.DATA_VENDA, '%Y-%m')) X;

select X.CPF, X.NOME, X.MES_ANO, X.QUANTIDADE_VENDAS, X.QUANTIDADE_LIMITE,
case when (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0 
	then 'INVÁLIDA'
else 'VÁLIDA' end as STATUS_VENDA
from 
(select NF.CPF, TC.NOME, date_format(NF.DATA_VENDA, '%Y-%m') as MES_ANO, 
sum(INF.QUANTIDADE) as QUANTIDADE_VENDAS,
max(TC.VOLUME_DE_COMPRA) as QUANTIDADE_LIMITE
from notas_fiscais NF
inner join itens_notas_fiscais INF
on NF.NUMERO = INF.NUMERO
inner join tabela_de_clientes TC
on TC.CPF = NF.CPF
group by NF.CPF, TC.NOME, date_format(NF.DATA_VENDA, '%Y-%m')) X;

SELECT X.CPF, X.NOME, X.MES_ANO, X.QUANTIDADE_VENDAS, X.QUANTIDADE_LIMITE,
CASE WHEN (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0 THEN 'INVÁLIDA'
ELSE 'VÁLIDA' END AS STATUS_VENDA, (1 - (X.QUANTIDADE_LIMITE/X.QUANTIDADE_VENDAS)) * 100 AS PERCENTUAL
FROM (SELECT NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO
, SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS 
, MAX(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF
ON NF.NUMERO = INF.NUMERO
INNER JOIN tabela_de_clientes TC 
ON TC.CPF = NF.CPF
GROUP BY NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')) X
WHERE (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0;

select TP.SABOR, NF.DATA_VENDA, INF.QUANTIDADE 
from tabela_de_produtos TP
inner join itens_notas_fiscais INF
on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join notas_fiscais NF
on NF.NUMERO = INF.NUMERO;

/*	QUANTIDADE VENDIDA POR SABER ANO 2016	*/
select TP.SABOR, year(NF.DATA_VENDA) as ANO, sum(INF.QUANTIDADE) as QUANTIDADE 
from tabela_de_produtos TP
inner join itens_notas_fiscais INF
on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join notas_fiscais NF
on NF.NUMERO = INF.NUMERO
where year(NF.DATA_VENDA) = 2016
group by TP.SABOR, year(NF.DATA_VENDA)
order by sum(INF.QUANTIDADE) desc;

select year(NF.DATA_VENDA) as ANO, sum(INF.QUANTIDADE) as QUANTIDADE 
from tabela_de_produtos TP
inner join itens_notas_fiscais INF
on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join notas_fiscais NF
on NF.NUMERO = INF.NUMERO
where year(NF.DATA_VENDA) = 2016
group by year(NF.DATA_VENDA)
order by sum(INF.QUANTIDADE) desc;


select * from 
(select TP.SABOR, year(NF.DATA_VENDA) as ANO, sum(INF.QUANTIDADE) as QUANTIDADE 
from tabela_de_produtos TP
inner join itens_notas_fiscais INF
on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join notas_fiscais NF
on NF.NUMERO = INF.NUMERO
where year(NF.DATA_VENDA) = 2016
group by TP.SABOR, year(NF.DATA_VENDA)) as VENDA_SABOR
inner join 
(select year(NF.DATA_VENDA) as ANO, sum(INF.QUANTIDADE) as QUANTIDADE 
from tabela_de_produtos TP
inner join itens_notas_fiscais INF
on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join notas_fiscais NF
on NF.NUMERO = INF.NUMERO
where year(NF.DATA_VENDA) = 2016
group by year(NF.DATA_VENDA)) as VENDA_TOTAL
on VENDA_SABOR.ANO = VENDA_TOTAL.ANO;


select VENDA_SABOR.SABOR, VENDA_SABOR.ANO, VENDA_SABOR.QUANTIDADE,
concat(round((VENDA_SABOR.QUANTIDADE / VENDA_TOTAL.QUANTIDADE) * 100, 2),'%') as PARTICIPACAO from 
(select TP.SABOR, year(NF.DATA_VENDA) as ANO, sum(INF.QUANTIDADE) as QUANTIDADE 
from tabela_de_produtos TP
inner join itens_notas_fiscais INF
on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join notas_fiscais NF
on NF.NUMERO = INF.NUMERO
where year(NF.DATA_VENDA) = 2016
group by TP.SABOR, year(NF.DATA_VENDA)) as VENDA_SABOR
inner join 
(select year(NF.DATA_VENDA) as ANO, sum(INF.QUANTIDADE) as QUANTIDADE 
from tabela_de_produtos TP
inner join itens_notas_fiscais INF
on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join notas_fiscais NF
on NF.NUMERO = INF.NUMERO
where year(NF.DATA_VENDA) = 2016
group by year(NF.DATA_VENDA)) as VENDA_TOTAL
on VENDA_SABOR.ANO = VENDA_TOTAL.ANO
order by VENDA_SABOR.QUANTIDADE desc;

select VENDA_SABOR.SABOR, VENDA_SABOR.ANO, VENDA_SABOR.QUANTIDADE,
round((VENDA_SABOR.QUANTIDADE / VENDA_TOTAL.QUANTIDADE) * 100, 2) as PARTICIPACAO from 
(select TP.SABOR, year(NF.DATA_VENDA) as ANO, sum(INF.QUANTIDADE) as QUANTIDADE 
from tabela_de_produtos TP
inner join itens_notas_fiscais INF
on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join notas_fiscais NF
on NF.NUMERO = INF.NUMERO
where year(NF.DATA_VENDA) = 2016
group by TP.SABOR, year(NF.DATA_VENDA)) as VENDA_SABOR
inner join 
(select year(NF.DATA_VENDA) as ANO, sum(INF.QUANTIDADE) as QUANTIDADE 
from tabela_de_produtos TP
inner join itens_notas_fiscais INF
on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join notas_fiscais NF
on NF.NUMERO = INF.NUMERO
where year(NF.DATA_VENDA) = 2016
group by year(NF.DATA_VENDA)) as VENDA_TOTAL
on VENDA_SABOR.ANO = VENDA_TOTAL.ANO
order by VENDA_SABOR.QUANTIDADE desc;

SELECT VENDA_TAMANHO.TAMANHO, VENDA_TAMANHO.ANO, VENDA_TAMANHO.QUANTIDADE,
ROUND((VENDA_TAMANHO.QUANTIDADE/VENDA_TOTAL.QUANTIDADE) * 100, 2) AS PARTICIPACAO FROM 
(SELECT TP.TAMANHO, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
tabela_de_produtos TP 
INNER JOIN itens_notas_fiscais INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN notas_fiscais NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.TAMANHO, YEAR(NF.DATA_VENDA)) AS VENDA_TAMANHO
INNER JOIN 
(SELECT YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
tabela_de_produtos TP 
INNER JOIN itens_notas_fiscais INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN notas_fiscais NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY YEAR(NF.DATA_VENDA)) AS VENDA_TOTAL
ON VENDA_TAMANHO.ANO = VENDA_TOTAL.ANO
ORDER BY VENDA_TAMANHO.QUANTIDADE DESC;















