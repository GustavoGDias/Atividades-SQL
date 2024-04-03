use vendas

-- 1. Selecionar todos os nomes de pessoas envolvidas (estagiário, cliente e Funcionário) na compra do produto 3
SELECT DISTINCT p.pes_nome
FROM pessoas p
JOIN clientes c ON p.pes_codigo = c.pes_codigo
JOIN pedidos pd ON c.pes_codigo = pd.cli_codigo
JOIN itens_pedidos ip ON pd.ped_numero = ip.ped_numero
WHERE ip.prd_codigo = 3
UNION
SELECT p.pes_nome
FROM pessoas p
JOIN estagiarios e ON p.pes_codigo = e.pes_codigo
JOIN pedidos pd ON e.pes_codigo = pd.est_codigo
JOIN itens_pedidos ip ON pd.ped_numero = ip.ped_numero
WHERE ip.prd_codigo = 3
UNION
SELECT p.pes_nome
FROM pessoas p
JOIN funcionarios f ON p.pes_codigo = f.pes_codigo
JOIN pedidos pd ON f.pes_codigo = pd.fun_codigo
JOIN itens_pedidos ip ON pd.ped_numero = ip.ped_numero
WHERE ip.prd_codigo = 3;

-- 2. Selecionar nome e valor bolsa dos estagiários
SELECT p.pes_nome, e.est_bolsa
FROM pessoas p
JOIN estagiarios e ON p.pes_codigo = e.pes_codigo;

-- 3. Selecionar nome e renda de todos os clientes
SELECT p.pes_nome, c.cli_renda
FROM pessoas p
JOIN clientes c ON p.pes_codigo = c.pes_codigo;

-- 4. Selecionar salário e nome de todos os funcionários
SELECT p.pes_nome, f.fun_salario
FROM pessoas p
JOIN funcionarios f ON p.pes_codigo = f.pes_codigo;

-- 5. Selecione todos os produtos (código, descrição, quantidade) do pedido 1
SELECT ip.prd_codigo, prd_descricao, itp_qtd
FROM itens_pedidos ip
JOIN produtos p ON ip.prd_codigo = p.prd_codigo
WHERE ped_numero = 1;

-- 6. Selecione o nome dos clientes que compraram o produto 1
SELECT DISTINCT p.pes_nome
FROM pessoas p
JOIN clientes c ON p.pes_codigo = c.pes_codigo
JOIN pedidos pd ON c.pes_codigo = pd.cli_codigo
JOIN itens_pedidos ip ON pd.ped_numero = ip.ped_numero
WHERE ip.prd_codigo = 1;

-- 7. Construa uma consulta que mostre o código do pedido, a data da compra, o nome do cliente, o nome do funcionário, dos pedidos que foram vendidos mais de 5 itens
SELECT pd.ped_numero, pd.ped_data, pc.pes_nome AS Cliente, pf.pes_nome AS Funcionario
FROM pedidos pd
JOIN pessoas pc ON pd.cli_codigo = pc.pes_codigo
JOIN pessoas pf ON pd.fun_codigo = pf.pes_codigo
JOIN (
    SELECT ped_numero
    FROM itens_pedidos
    GROUP BY ped_numero
    HAVING COUNT(*) > 5
) ip ON pd.ped_numero = ip.ped_numero;

-- 8. Construa uma consulta que mostre o cliente que mais efetuou pedidos
SELECT p.pes_nome, COUNT(*) AS Total_Pedidos
FROM pessoas p
JOIN clientes c ON p.pes_codigo = c.pes_codigo
JOIN pedidos pd ON c.pes_codigo = pd.cli_codigo
GROUP BY p.pes_nome
ORDER BY Total_Pedidos DESC


-- 9. Construa uma consulta para exibir o código, o valor, a data (pedido) e o nome do estagiário do pedido com o menor valor efetuado pelo estagiário 3
SELECT pd.ped_numero, SUM(ip.itp_valor) AS Valor_Total, pd.ped_data, pe.pes_nome AS Nome_Estagiario
FROM pedidos pd
JOIN itens_pedidos ip ON pd.ped_numero = ip.ped_numero
JOIN pessoas pe ON pd.est_codigo = pe.pes_codigo
WHERE pd.est_codigo = 3
GROUP BY pd.ped_numero, pd.ped_data, pe.pes_nome
ORDER BY Valor_Total ASC
