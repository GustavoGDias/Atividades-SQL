-- Procedure para Inserir Cliente
CREATE PROCEDURE InsertCliente
    @pes_nome VARCHAR(50),
    @pes_cpf VARCHAR(12),
    @pes_status INT,
    @cli_renda DECIMAL(7,2),
    @cli_credito DECIMAL(7,2)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Inserir Pessoa
        INSERT INTO pessoas (pes_nome, pes_cpf, pes_status)
        VALUES (@pes_nome, @pes_cpf, @pes_status);

        -- Obter o ID da Pessoa Inserida
        DECLARE @pes_codigo INT;
        SET @pes_codigo = SCOPE_IDENTITY();

        -- Inserir Cliente
        INSERT INTO clientes (pes_codigo, cli_renda, cli_credito)
        VALUES (@pes_codigo, @cli_renda, @cli_credito);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        -- Capturar e Relançar o Erro
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO

-- Procedure para Inserir Funcionário
CREATE PROCEDURE InsertFuncionario
    @pes_nome VARCHAR(50),
    @pes_cpf VARCHAR(12),
    @pes_status INT,
    @fun_salario DECIMAL(7,2),
    @sup_codigo INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Inserir Pessoa
        INSERT INTO pessoas (pes_nome, pes_cpf, pes_status)
        VALUES (@pes_nome, @pes_cpf, @pes_status);

        -- Obter o ID da Pessoa Inserida
        DECLARE @pes_codigo INT;
        SET @pes_codigo = SCOPE_IDENTITY();

        -- Inserir Funcionário
        INSERT INTO funcionarios (pes_codigo, fun_salario, sup_codigo)
        VALUES (@pes_codigo, @fun_salario, @sup_codigo);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        -- Capturar e Relançar o Erro
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO

-- Exemplos de Execução das Procedures
-- Inserir Cliente
EXEC InsertCliente 'João Silva', '12345678901', 1, 5000.00, 1000.00;

-- Inserir Funcionário
EXEC InsertFuncionario 'Maria Oliveira', '98765432100', 1, 3000.00, NULL;
