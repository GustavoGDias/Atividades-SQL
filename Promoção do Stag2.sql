use vendas

CREATE PROCEDURE ContratarEstagiario
    @pes_codigo INT,                 -- Código da pessoa
    @est_bolsa DECIMAL(7,2),        -- Valor da bolsa
    @fun_salario DECIMAL(7,2),       -- Salário do novo funcionário
    @sup_codigo INT                  -- Código do supervisor
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verifica se a pessoa existe na tabela pessoas
        IF NOT EXISTS (SELECT 1 FROM pessoas WHERE pes_codigo = @pes_codigo)
        BEGIN
            RAISERROR ('Código de pessoa não encontrado.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Verifica se a pessoa já é um estagiário
        IF EXISTS (SELECT 1 FROM estagiarios WHERE pes_codigo = @pes_codigo)
        BEGIN
            RAISERROR ('Estagiário já existe.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Insere o novo estagiário
        INSERT INTO estagiarios (pes_codigo, est_bolsa)
        VALUES (@pes_codigo, @est_bolsa);

        -- Atualiza o status do estagiário para ativo
        UPDATE pessoas
        SET pes_status = 1
        WHERE pes_codigo = @pes_codigo;

        -- Cria um registro de funcionário para o novo estagiário
        INSERT INTO funcionarios (pes_codigo, fun_salario, sup_codigo)
        VALUES (@pes_codigo, @fun_salario, @sup_codigo);

        -- Commit da transação
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback da transação em caso de erro
        ROLLBACK TRANSACTION;
        -- Exibe mensagem de erro
        PRINT ERROR_MESSAGE();
    END CATCH
END;


CREATE PROCEDURE DesligarEstagiario
    @pes_codigo INT                  -- Código da pessoa
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verifica se o estagiário existe
        IF NOT EXISTS (SELECT 1 FROM estagiarios WHERE pes_codigo = @pes_codigo)
        BEGIN
            RAISERROR ('Estagiário não encontrado.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Atualiza o status do estagiário para inativo
        UPDATE pessoas
        SET pes_status = 2
        WHERE pes_codigo = @pes_codigo;

        -- Commit da transação
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback da transação em caso de erro
        ROLLBACK TRANSACTION;
        -- Exibe mensagem de erro
        PRINT ERROR_MESSAGE();
    END CATCH
END;

-- Exemplo de inserção na tabela pessoas
INSERT INTO pessoas VALUES ( 'cleiton', 3164, 1);

select * from pessoas

drop procedure ContratarEstagiario
drop procedure DesligarEstagiario

select * from estagiarios

-- Testa a contratação de um estagiário
EXEC ContratarEstagiario @pes_codigo = 25, @est_bolsa = 800.00, @fun_salario = 3000.00, @sup_codigo = 4;

-- Testa o desligamento de um estagiário
EXEC DesligarEstagiario @pes_codigo = 25;

drop procedure sp_contratar_estagiario

EXEC sp_contratar_estagiario 
    @pes_codigo_estagiario = 3,  
    @novo_salario = 2500.00, 
    @sup_codigo = 4;  

SELECT * FROM VW_PEDIDOS_ESTAGIARIOS_INATIVOS



