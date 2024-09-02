use vendas

CREATE PROCEDURE sp_contratar_estagiario
    @pes_codigo_estagiario INT,
    @novo_salario DECIMAL(7,2),
    @sup_codigo INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verifica se o estagiário existe na tabela pessoas
        IF NOT EXISTS (SELECT 1 FROM pessoas WHERE pes_codigo = @pes_codigo_estagiario)
        BEGIN
            RAISERROR('Estagiário não encontrado.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Verifica se o supervisor existe na tabela funcionarios
        IF NOT EXISTS (SELECT 1 FROM funcionarios WHERE pes_codigo = @sup_codigo)
        BEGIN
            RAISERROR('Supervisor não encontrado.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Verifica se o estagiário já é um funcionário
        IF EXISTS (SELECT 1 FROM funcionarios WHERE pes_codigo = @pes_codigo_estagiario)
        BEGIN
            RAISERROR('Estagiário já é funcionário.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Insere o estagiário na tabela de funcionários
        INSERT INTO funcionarios (pes_codigo, fun_salario, sup_codigo)
        VALUES (@pes_codigo_estagiario, @novo_salario, @sup_codigo);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;

CREATE VIEW VW_PEDIDOS_ESTAGIARIOS_INATIVOS AS
SELECT 
    p.ped_numero AS Numero_Pedido,
    pc.pes_nome AS Nome_Cliente,
    pe.pes_nome AS Nome_Estagiario
FROM 
    pedidos p
    JOIN clientes c ON p.cli_codigo = c.pes_codigo
    JOIN pessoas pc ON c.pes_codigo = pc.pes_codigo
    LEFT JOIN estagiarios e ON p.est_codigo = e.pes_codigo
    LEFT JOIN pessoas pe ON e.pes_codigo = pe.pes_codigo
WHERE 
    pe.pes_status = 0; -- Estagiários inativos


EXEC sp_contratar_estagiario 
    @pes_codigo_estagiario = 3,  
    @novo_salario = 2500.00, 
    @sup_codigo = 4;  

SELECT * FROM VW_PEDIDOS_ESTAGIARIOS_INATIVOS



