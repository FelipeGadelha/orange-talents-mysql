USE SUCOS;

UPDATE tbProduto SET EMBALAGEM = 'Lata', PRECO_LISTA = 2.46
WHERE PRODUTO = '544931';

UPDATE tbProduto SET EMBALAGEM = 'Garrafa'
WHERE PRODUTO = '1078680';

SELECT * FROM tbProduto;
