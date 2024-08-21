USE vendas

-- 1. Criação da View VW_PEDIDOS
CREATE VIEW VW_PEDIDOS AS
SELECT 
    p.ped_numero AS Numero_Pedido,
    p.ped_data AS Data_Pedido,
    pf.pes_nome AS Nome_Funcionario,
    pc.pes_nome AS Nome_Cliente,
    pe.pes_nome AS Nome_Estagiario
FROM 
    pedidos p
    JOIN funcionarios f ON p.fun_codigo = f.pes_codigo
    JOIN pessoas pf ON f.pes_codigo = pf.pes_codigo
    JOIN clientes c ON p.cli_codigo = c.pes_codigo
    JOIN pessoas pc ON c.pes_codigo = pc.pes_codigo
    LEFT JOIN estagiarios e ON p.est_codigo = e.pes_codigo
    LEFT JOIN pessoas pe ON e.pes_codigo = pe.pes_codigo;


SELECT * FROM VW_PEDIDOS;

SELECT 
    VW_PEDIDOS.Numero_Pedido,
    VW_PEDIDOS.Data_Pedido,
    VW_PEDIDOS.Nome_Funcionario,
    VW_PEDIDOS.Nome_Cliente,
    VW_PEDIDOS.Nome_Estagiario
FROM 
    VW_PEDIDOS
    JOIN itens_pedidos ip ON VW_PEDIDOS.Numero_Pedido = ip.ped_numero
WHERE 
    ip.prd_codigo IN (1, 2, 3);  -- IDs dos três produtos diferentes
