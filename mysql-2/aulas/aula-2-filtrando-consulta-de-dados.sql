select CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO
IDADE, SEXO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA from tabela_de_clientes;

select * from tabela_de_clientes;

select CPF, NOME from tabela_de_clientes;

select CPF as IDENTIFICADOR, NOME as CLIENTE from tabela_de_clientes;

select * from tabela_de_produtos;

select * from tabela_de_produtos where CODIGO_DO_PRODUTO = '1000889';

select * from tabela_de_produtos where SABOR = 'Uva';

select * from tabela_de_produtos where SABOR = 'Laranja';

select * from tabela_de_produtos where EMBALAGEM = 'PET';

select * from tabela_de_produtos where EMBALAGEM = 'pet';

select * from tabela_de_produtos where PRECO_DE_LISTA = 19.50;

select * from tabela_de_produtos where PRECO_DE_LISTA between 19.50 AND 19.52;

select * from tabela_de_produtos where SABOR = 'Manga' or TAMANHO = '470 ml';

select * from tabela_de_produtos where not (SABOR = 'Manga' or TAMANHO = '470 ml');

select * from tabela_de_produtos where SABOR = 'Manga' and not (TAMANHO = '470 ml');

select * from tabela_de_produtos where SABOR in ('Laranja', 'Manga');

select * from tabela_de_produtos where SABOR = 'Laranja' or SABOR = 'Manga';

select * from tabela_de_clientes where CIDADE in ('Rio de Janeiro', 'São Paulo') and IDADE >= 20;

select * from tabela_de_clientes where CIDADE in ('Rio de Janeiro', 'São Paulo') and (IDADE >= 20 and IDADE >= 22);

select * from tabela_de_produtos where SABOR like '%Maça%';

select * from tabela_de_produtos where SABOR like '%Maça%' and EMBALAGEM = 'PET';

select * from tabela_de_clientes where NOME like '%Mattos';








