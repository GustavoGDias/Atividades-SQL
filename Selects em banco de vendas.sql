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

--23.Consultar os pedidos que foram solicitados pelo cliente 2, registrados pelo funcionário 8 e conferidos pelo estagiário 5.
SELECT *
FROM pedidos
WHERE cli_codigo = 2 AND fun_codigo = 8 AND est_codigo = 5;

--24.Consultar a quantidade de itens vendidos	
SELECT SUM(itp_qtd) AS Quantidade_de_Itens_Vendidos
FROM itens_pedidos;

--25.Consultar a quantidade de pedidos do cliente 1.
SELECT COUNT(*) AS Quantidade_de_Pedidos_do_Cliente_1
FROM pedidos
WHERE cli_codigo = 1;

--26.Consultar a quantidade de itens vendidos relacionada ao pedido 2.
SELECT SUM(itp_qtd) AS Quantidade_de_Itens_Vendidos_Pedido_2
FROM itens_pedidos
WHERE ped_numero = 2;

--27.Consultar quantos pedidos foram registrados pelo funcionário 6
SELECT COUNT(*) AS Quantidade_de_Pedidos_Registrados_pelo_Funcionário_6
FROM pedidos
WHERE fun_codigo = 6;

--28.Consultar quantas vezes o produto 3 foi vendido.
SELECT SUM(itp_qtd) AS Quantidade_de_Vezes_Produto_3_Foi_Vendido
FROM itens_pedidos
WHERE prd_codigo = 3;

--29.Consultar todas as pessoas.
SELECT *
FROM pessoas;

--30.Consultar todos os dados dos clientes.
SELECT *
FROM pessoas;

--31.Consultar nome, CPF, renda e crédito de todos os clientes.
SELECT pes_nome, pes_cpf, cli_renda, cli_credito
FROM pessoas
JOIN clientes ON pessoas.pes_codigo = clientes.pes_codigo;

--32.Consultar os produtos (descrição) e as quantidades vendidas no pedido 1.
SELECT prd_descricao, itp_qtd
FROM itens_pedidos
JOIN produtos ON itens_pedidos.prd_codigo = produtos.prd_codigo
WHERE ped_numero = 1;

--33.Consultar os produtos (descrição), quantidades vendidas, valores unitários e o valor de cada item do pedido 2.
SELECT prd_descricao, itp_qtd, prd_valor, itp_valor
FROM itens_pedidos
JOIN produtos ON itens_pedidos.prd_codigo = produtos.prd_codigo
WHERE ped_numero = 2;

--34.Consultar número, data, nome do funcionário, nome do cliente e nome do estagiário de cada pedido.
SELECT p.ped_numero, p.ped_data, fun.pes_nome [nome_funcionario], cli.pes_nome [nome_cliente], est.pes_nome [nome_estagiario]
FROM pedidos p, pessoas fun, pessoas cli, pessoas est
WHERE p.fun_codigo = fun.pes_codigo and p.cli_codigo = cli.pes_codigo and p.est_codigo = est.pes_codigo

--35.Consultar código, nome, salário e o nome do supervisor de cada funcionário.
SELECT funcionarios.pes_codigo [codigo_funcionarios], funcionarios.pes_nome [nome_funcionario], f.fun_salario [salario_funcionario], sup.pes_nome [nome_supervisor]
FROM funcionarios f, pessoas funcionarios, pessoas sup
WHERE f.pes_codigo = funcionarios.pes_codigo and f.sup_codigo = sup.pes_codigo

--36.Consultar o valor de cada item vendido.
SELECT itp_valor AS Valor_Item
FROM itens_pedidos;

--37.Consultar o total vendido (faturado) até o momento.
SELECT SUM(itp_valor) AS Total_Vendido
FROM itens_pedidos;

--38.Consultar o total da folha de pagamento dos supervisores.
SELECT SUM(fun_salario) AS Total_Folha_Pagamento_Supervisores
FROM funcionarios
WHERE sup_codigo IS NULL;

--39.Consultar o valor total do pedido 1.   
SELECT SUM(itp_valor) AS Valor_Total_Pedido_1
FROM itens_pedidos
WHERE ped_numero = 1;

--40.Consultar o total vendido do Produto 4
SELECT SUM(itp_valor) AS Total_Vendido_Produto_4
FROM itens_pedidos
WHERE prd_codigo = 4;

-- 41. Consultar o valor total de cada pedido:
SELECT ped_numero, SUM(itp_valor) AS Valor_Total
FROM itens_pedidos
GROUP BY ped_numero;

-- 42. Consultar o total vendido do produto 3 em cada pedido:
SELECT ped_numero, SUM(itp_qtd) AS Quantidade_Total_Produto_3
FROM itens_pedidos
WHERE prd_codigo = 3
GROUP BY ped_numero;

-- 43. Consultar os pedidos com valor total acima de R$ 30,00 reais:
SELECT ped_numero, SUM(itp_valor) AS Valor_Total
FROM itens_pedidos
GROUP BY ped_numero
HAVING SUM(itp_valor) > 30;

-- 44. Consultar a quantidade de itens por pedido:
SELECT ped_numero, COUNT(*) AS Quantidade_de_Itens
FROM itens_pedidos
GROUP BY ped_numero;

-- 45. Consultar a quantidade de vezes que cada produto foi vendido:
SELECT prd_codigo, SUM(itp_qtd) AS Quantidade_Total_Vendida
FROM itens_pedidos
GROUP BY prd_codigo;

-- 46. Consultar quantos pedidos cada cliente solicitou:
SELECT cli_codigo, COUNT(*) AS Quantidade_de_Pedidos
FROM pedidos
GROUP BY cli_codigo;

-- 47. Consultar quantos pedidos cada funcionário registrou:
SELECT fun_codigo, COUNT(*) AS Quantidade_de_Pedidos_Registrados
FROM pedidos
GROUP BY fun_codigo;

-- 48. Consultar os pedidos que possuem mais do que 3 itens:
SELECT ped_numero
FROM itens_pedidos
GROUP BY ped_numero
HAVING COUNT(*) > 3;

-- 49. Consultar o produto mais vendido em quantidade de itens:
WITH VendasPorProduto AS (
    SELECT prd_codigo, SUM(itp_qtd) AS Quantidade_Total_Vendida
    FROM itens_pedidos
    GROUP BY prd_codigo
)
SELECT prd_codigo, Quantidade_Total_Vendida
FROM VendasPorProduto
WHERE Quantidade_Total_Vendida = (
    SELECT MAX(Quantidade_Total_Vendida)
    FROM VendasPorProduto
);

-- 50. Consultar os pedidos (ped_numero, ped_data) que possuem mais do que 3 itens. Usar exists:
SELECT ped_numero, ped_data
FROM pedidos p
WHERE EXISTS (
    SELECT 1
    FROM itens_pedidos
    WHERE ped_numero = p.ped_numero
    GROUP BY ped_numero
    HAVING COUNT(*) > 3
);

-- 51. Consultar as pessoas que são clientes. Usar exists:
SELECT *
FROM pessoas p
WHERE EXISTS (
    SELECT 1
    FROM clientes c
    WHERE c.pes_codigo = p.pes_codigo
);

-- 52. Consultar os clientes que possuem pedidos com valor total acima de R$ 20,00. Usar exists:
SELECT *
FROM pessoas p
WHERE EXISTS (
    SELECT 1
    FROM pedidos pd
    JOIN itens_pedidos ip ON pd.ped_numero = ip.ped_numero
    WHERE pd.cli_codigo = p.pes_codigo
    GROUP BY pd.ped_numero
    HAVING SUM(ip.itp_valor) > 20.00
);

-- 53. Consultar a data do sistema, e separadamente o ano, mês, dia, hora e minutos:
SELECT GETDATE() AS Data_Sistema,
       YEAR(GETDATE()) AS Ano,
       MONTH(GETDATE()) AS Mes,
       DAY(GETDATE()) AS Dia,
       DATEPART(HOUR, GETDATE()) AS Hora,
       DATEPART(MINUTE, GETDATE()) AS Minutos;

-- 54. Consultar o valor total do pedido 1:
SELECT ped_numero, SUM(itp_valor) AS Valor_Total
FROM itens_pedidos
WHERE ped_numero = 1
GROUP BY ped_numero;

-- 55. Consultar o total vendido do produto 3:
SELECT prd_codigo, SUM(itp_valor) AS Valor_Total_Vendido
FROM itens_pedidos
WHERE prd_codigo = 3
GROUP BY prd_codigo;
