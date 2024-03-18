use vendas

--8.Consultar duas pessoas que possuem nome com alguma subpalavra 'super'
SELECT TOP 2 *
FROM pessoas
WHERE pes_nome LIKE '%super%';

--9.Consultar as pessoas com letra b na a inicial do nome.
SELECT *
FROM pessoas
WHERE pes_nome LIKE 'b%';

--10.Consultar as pessoas que possuem a letra p como sendo a terceira letra do nome.
SELECT *
FROM pessoas
WHERE pes_nome LIKE '__p%';

--11.Consultar o valor médio dos produtos.
SELECT AVG(prd_valor) AS Valor_Médio
FROM produtos;

--12.Consultar o maior valor de venda de produto.
SELECT MAX(itp_valor) AS Maior_Valor_de_Venda
FROM itens_pedidos;

--13.Consultar o menor valor de venda de produto.
SELECT MIN(itp_valor) AS Menor_Valor_de_Venda
FROM itens_pedidos;

--14.Consultar o valor médio de produto, bem como o maior valor, o menor valor e a quantidade de produtos cadastrados.
SELECT AVG(prd_valor) AS Valor_Médio,
       MAX(prd_valor) AS Maior_Valor,
       MIN(prd_valor) AS Menor_Valor,
       COUNT(*) AS Quantidade_de_Produtos
FROM produtos;

--15.Consultar as pessoas com o código 1 ou 7.
SELECT *
FROM pessoas
WHERE pes_codigo IN (1, 7);

--16.Consultar as pessoas com o código 1 e 7.
SELECT *
FROM pessoas
WHERE pes_codigo = 1 OR pes_codigo = 7;

--17.Consultar as pessoas que possuem os códigos 1,2 e 5.
SELECT *
FROM pessoas
WHERE pes_codigo IN (1, 2, 5);

--18.Consultar as pessoas que possuem código entre 3 e 6.
SELECT *
FROM pessoas
WHERE pes_codigo BETWEEN 3 AND 6;

--19.Consultar os supervisores.
SELECT *
FROM funcionarios
WHERE sup_codigo IS NOT NULL;

--20.Consultar somente os funcionários.
SELECT *
FROM funcionarios
WHERE sup_codigo IS NULL;

--21.Consultar todos os pedidos do cliente 2.
SELECT *
FROM pedidos
WHERE cli_codigo = 2;

--22.Consultar todos os pedidos do cliente 2 que foram vendidos pelo funcionário 6.
SELECT *
FROM pedidos
WHERE cli_codigo = 2 AND fun_codigo = 6; 