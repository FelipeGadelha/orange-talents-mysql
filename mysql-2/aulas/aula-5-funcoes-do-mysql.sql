select ltrim('       olá') as RESULTADO;
 
select rtrim('olá      ') as RESULTADO;

select trim('        olá      ') as RESULTADO;

select concat('olá', ' ', 'Tudo bem', '?') as RESULTADO;

select upper('olá, tudo bem ?') as RESULTADO;

select lower('OLÁ, TUDO BEM ?') as RESULTADO;

select substring('OLÁ, TUDO BEM ?', 6) as RESULTADO;

select substring('OLÁ, TUDO BEM ?', 6, 4) as RESULTADO;

select concat(NOME, ' (', CPF, ') ') as RESULTADO from tabela_de_clientes;

select * from tabela_de_clientes;

select concat(NOME, ' (', ENDERECO_1, ', ', BAIRRO, ', ', CIDADE, ', ', ESTADO ,')') as ENDERECO from tabela_de_clientes;

select current_date();

select current_time();

select current_timestamp();

select current_user();

select curdate();

select year(current_timestamp());

select month(current_timestamp());

select day(current_timestamp());

select monthname(current_timestamp());

select datediff(current_timestamp(), '2021-01-01') as RESULTADO;

select datediff(current_timestamp(), '1990-07-15') as RESULTADO;

select concat(datediff(current_timestamp(), '1990-04-05'),' dias') as RESULTADO;

select current_timestamp() as DIA_HOJE, date_sub(current_timestamp(), interval 5 day) as RESULTADO;

select distinct DATA_VENDA, 
dayname(DATA_VENDA) as DIA, 
monthname(DATA_VENDA) as MES, 
year(DATA_VENDA) as ANO 
from notas_fiscais;

select * from tabela_de_clientes;

SELECT NOME, TIMESTAMPDIFF (YEAR, DATA_DE_NASCIMENTO, CURDATE()) AS IDADE
FROM  tabela_de_clientes;

select (23+((25-2)/2)*45) as RESULTADO;

select ceiling(12.33333323232332) as RESULTADO;

select round(12.33333323232332) as RESULTADO;

select round(12.77772332333333) as RESULTADO;

select floor(12.77772332333333) as RESULTADO;

select rand() as RESULTADO;

select NUMERO, QUANTIDADE, PRECO, round(QUANTIDADE * PRECO, 2) as FATURAMENTO 
from itens_notas_fiscais;

SELECT YEAR(DATA_VENDA), FLOOR(SUM(IMPOSTO * (QUANTIDADE * PRECO))) as FATURAMENTO
FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(DATA_VENDA) = 2016 
GROUP BY YEAR(DATA_VENDA);

select current_timestamp() as RESULTADO;

select concat('O dia de hoje é: ', current_timestamp()) as RESULTADO;

select concat('O dia de hoje é: ', date_format(current_timestamp(), '%Y')) as RESULTADO;

select concat('O dia de hoje é: ', date_format(current_timestamp(), '%y')) as RESULTADO;

select concat('O dia de hoje é: ', date_format(current_timestamp(), '%m/%y')) as RESULTADO;

select concat('O dia de hoje é: ', date_format(current_timestamp(), '%c/%y')) as RESULTADO;

select concat('O dia de hoje é: ', date_format(current_timestamp(), '%d/%c/%y')) as RESULTADO;

select concat('O dia de hoje é: ', date_format(current_timestamp(), '%d/%m/%Y')) as RESULTADO;

select concat('O dia de hoje é: ', date_format(current_timestamp(), '%W, %d/%m/%Y')) as RESULTADO;

select concat('O dia de hoje é: ', date_format(current_timestamp(), '%W, %d/%m/%Y - %U')) as RESULTADO;

select convert(23.3, char) as RESULTADO;

select substring(convert(23.3, char), 1,1) as RESULTADO;

select * from tabela_de_clientes;

select * from notas_fiscais;

-- problema com order by
SELECT CONCAT('O cliente ', TC.NOME, ' faturou ', 
CAST(SUM(INF.QUANTIDADE * INF.preco) AS char (20))
 , ' no ano ', CAST(YEAR(NF.DATA_VENDA) AS char (20))) AS SENTENCA FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
INNER JOIN tabela_de_clientes TC ON NF.CPF = TC.CPF
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY TC.NOME, YEAR(DATA_VENDA); -- problema com order by

select FLOOR(SUM(IMPOSTO*(QUANTIDADE*PRECO)))  AS IMP_PAGAR 
from notas_fiscais NOTAS_FISCAIS
inner join  itens_notas_fiscais ITENS_NOTAS_FISCAIS ON 
NOTAS_FISCAIS.NUMERO = ITENS_NOTAS_FISCAIS.NUMERO
WHERE YEAR(DATA_VENDA)=2016;

select FORMAT(FLOOR(SUM(IMPOSTO*(QUANTIDADE*PRECO))), 0)  AS IMP_PAGAR 
from notas_fiscais NOTAS_FISCAIS
inner join  itens_notas_fiscais ITENS_NOTAS_FISCAIS ON 
NOTAS_FISCAIS.NUMERO = ITENS_NOTAS_FISCAIS.NUMERO
WHERE YEAR(DATA_VENDA)=2016;

select concat('O cliente ', NOME, ' faturou' ) as RESULTADO;









