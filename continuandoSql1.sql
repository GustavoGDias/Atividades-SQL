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
SELECT ped_numero, ped_data, funcionarios.pes_nome AS Nome_Funcionario, clientes.pes_nome AS Nome_Cliente, estagiarios.pes_nome AS Nome_Estagiario
FROM pedidos
JOIN funcionarios ON pedidos.fun_codigo = funcionarios.pes_codigo
JOIN clientes ON pedidos.cli_codigo = clientes.pes_codigo
JOIN estagiarios ON pedidos.est_codigo = estagiarios.pes_codigo;

--35.Consultar código, nome, salário e o nome do supervisor de cada funcionário.
SELECT funcionarios.pes_codigo AS Codigo_Funcionario, funcionarios.pes_nome AS Nome_Funcionario, fun_salario AS Salario_Funcionario, supervisores.pes_nome AS Nome_Supervisor
FROM funcionarios
LEFT JOIN funcionarios AS supervisores ON funcionarios.sup_codigo = supervisores.pes_codigo;

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