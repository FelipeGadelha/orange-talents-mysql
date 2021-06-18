select EMBALAGEM, TAMANHO from tabela_de_produtos;

select distinct EMBALAGEM, TAMANHO from tabela_de_produtos;

select distinct EMBALAGEM, TAMANHO from tabela_de_produtos where SABOR = 'Laranja';

select distinct EMBALAGEM, TAMANHO, SABOR from tabela_de_produtos where SABOR = 'Laranja';

select distinct BAIRRO from tabela_de_clientes where CIDADE='Rio de Janeiro';

select * from tabela_de_produtos;

select * from tabela_de_produtos limit 5;

select * from tabela_de_produtos limit 2,5;

select * from notas_fiscais where DATA_VENDA = '2017-01-01' limit 10;

select * from tabela_de_produtos order by PRECO_DE_LISTA;

select * from tabela_de_produtos order by PRECO_DE_LISTA desc;

select * from tabela_de_produtos order by NOME_DO_PRODUTO;

select * from tabela_de_produtos order by NOME_DO_PRODUTO desc;

select * from tabela_de_produtos order by EMBALAGEM, NOME_DO_PRODUTO;

select * from tabela_de_produtos order by EMBALAGEM desc, NOME_DO_PRODUTO asc;

select * from tabela_de_produtos;

SELECT * FROM tabela_de_produtos WHERE nome_do_produto = 'Linha Refrescante - 1 Litro - Morango/Limão';
SELECT * FROM itens_notas_fiscais WHERE codigo_do_produto = '1101035' ORDER BY QUANTIDADE DESC;

select ESTADO, LIMITE_DE_CREDITO from tabela_de_clientes;

select ESTADO, sum(LIMITE_DE_CREDITO) as LIMITE_TOTAL from tabela_de_clientes group by ESTADO;

select EMBALAGEM, max(PRECO_DE_LISTA) as MAIOR_PRECO from tabela_de_produtos group by EMBALAGEM;

select EMBALAGEM, count(*) as CONTADOR from tabela_de_produtos group by EMBALAGEM;

select BAIRRO, sum(LIMITE_DE_CREDITO) as LIMITE from tabela_de_clientes group by BAIRRO;

select BAIRRO, sum(LIMITE_DE_CREDITO) as LIMITE from tabela_de_clientes where CIDADE = 'Rio de Janeiro' group by BAIRRO;

select ESTADO, BAIRRO, sum(LIMITE_DE_CREDITO) as LIMITE from tabela_de_clientes group by ESTADO, BAIRRO;

select ESTADO, BAIRRO, sum(LIMITE_DE_CREDITO) as LIMITE from tabela_de_clientes 
where CIDADE = 'Rio de Janeiro' 
group by ESTADO, BAIRRO
order by BAIRRO;

select max(QUANTIDADE) as MAIOR_QUANTIDADE from itens_notas_fiscais where CODIGO_DO_PRODUTO = 1101035;
select COUNT(*) from itens_notas_fiscais where codigo_do_produto = '1101035' and QUANTIDADE = 99;

select ESTADO, sum(LIMITE_DE_CREDITO) as LIMITE from tabela_de_clientes group by ESTADO;

select ESTADO, sum(LIMITE_DE_CREDITO) as LIMITE from tabela_de_clientes 
group by ESTADO
having sum(LIMITE_DE_CREDITO) > 900000;

select EMBALAGEM, max(PRECO_DE_LISTA) as MAIOR_PRECO, min(PRECO_DE_LISTA) as MENOR_PRECO
from tabela_de_produtos
group by EMBALAGEM;

select EMBALAGEM, max(PRECO_DE_LISTA) as MAIOR_PRECO, min(PRECO_DE_LISTA) as MENOR_PRECO
from tabela_de_produtos
group by EMBALAGEM
having sum(PRECO_DE_LISTA) <= 80;

select EMBALAGEM, max(PRECO_DE_LISTA) as MAIOR_PRECO, min(PRECO_DE_LISTA) as MENOR_PRECO
from tabela_de_produtos
group by EMBALAGEM
having sum(PRECO_DE_LISTA) <= 80 and max(PRECO_DE_LISTA) >= 5;

select CPF, count(*) from notas_fiscais 
where year(DATA_VENDA) = 2016
group by CPF
having count(*) > 2000;

select  CPF, count(*) from notas_fiscais
where year(DATA_VENDA) = 2016
and CPF = "3623344710"
group by CPF;

select * from tabela_de_produtos;

select NOME_DO_PRODUTO, PRECO_DE_LISTA, 
case 
	when PRECO_DE_LISTA >= 12 
		then 'PRODUTO CARO'
	when PRECO_DE_LISTA >= 7 and PRECO_DE_LISTA < 12 
		then 'PRODUTO EM CONTA'
else 'PRODUTO BARATO' end as STATUS_PRECO from tabela_de_produtos;

select EMBALAGEM, 
case 
	when PRECO_DE_LISTA >= 12 
		then 'PRODUTO CARO'
	when PRECO_DE_LISTA >= 7 and PRECO_DE_LISTA < 12 
		then 'PRODUTO EM CONTA'
else 'PRODUTO BARATO' end as STATUS_PRECO,
avg(PRECO_DE_LISTA) as PRECO_MEDIO
from tabela_de_produtos
group by EMBALAGEM,
case 
	when PRECO_DE_LISTA >= 12 
		then 'PRODUTO CARO'
	when PRECO_DE_LISTA >= 7 and PRECO_DE_LISTA < 12 
		then 'PRODUTO EM CONTA'
else 'PRODUTO BARATO' end;

select EMBALAGEM, 
case 
	when PRECO_DE_LISTA >= 12 
		then 'PRODUTO CARO'
	when PRECO_DE_LISTA >= 7 and PRECO_DE_LISTA < 12 
		then 'PRODUTO EM CONTA'
else 'PRODUTO BARATO' end as STATUS_PRECO,
avg(PRECO_DE_LISTA) as PRECO_MEDIO
from tabela_de_produtos
group by EMBALAGEM,
case 
	when PRECO_DE_LISTA >= 12 
		then 'PRODUTO CARO'
	when PRECO_DE_LISTA >= 7 and PRECO_DE_LISTA < 12 
		then 'PRODUTO EM CONTA'
else 'PRODUTO BARATO' end
order by EMBALAGEM;

select EMBALAGEM, 
case 
	when PRECO_DE_LISTA >= 12 
		then 'PRODUTO CARO'
	when PRECO_DE_LISTA >= 7 and PRECO_DE_LISTA < 12 
		then 'PRODUTO EM CONTA'
else 'PRODUTO BARATO' end as STATUS_PRECO,
avg(PRECO_DE_LISTA) as PRECO_MEDIO
from tabela_de_produtos
where SABOR = 'Manga'
group by EMBALAGEM,
case 
	when PRECO_DE_LISTA >= 12 
		then 'PRODUTO CARO'
	when PRECO_DE_LISTA >= 7 and PRECO_DE_LISTA < 12 
		then 'PRODUTO EM CONTA'
else 'PRODUTO BARATO' end
order by EMBALAGEM;

select * from tabela_de_clientes;

SELECT NOME,
CASE WHEN YEAR(data_de_nascimento) < 1990 THEN 'Velho'WHEN YEAR(data_de_nascimento) >= 1990 AND
YEAR(data_de_nascimento) <= 1995 THEN 'Jovens' 
ELSE 'Crianças' END
FROM tabela_de_clientes;

select NOME, 
case 
	when year(DATA_DE_NASCIMENTO) < 1990
		then 'Velho'
	when year(DATA_DE_NASCIMENTO) >= 1990 and year(DATA_DE_NASCIMENTO) <= 1995
		then 'Joven'
	else 'Criança' end as CLASSIFICAÇÃO
from tabela_de_clientes
group by NOME,
case 
	when year(DATA_DE_NASCIMENTO) < 1990
		then 'Velho'
	when year(DATA_DE_NASCIMENTO) >= 1990 and year(DATA_DE_NASCIMENTO) <= 1995
		then 'Joven'
	else 'Criança' end;

















