use vendas

CREATE PROCEDURE sp_inserir_massa
    @opcao INT
AS
BEGIN
    -- Início da transação
    BEGIN TRANSACTION

    -- Bloco TRY para capturar erros
    BEGIN TRY
        -- Variável de controle do WHILE
        DECLARE @i INT = 1;
        DECLARE @cpfBase VARCHAR(9) = '000000000';
        DECLARE @cpf VARCHAR(12);

        -- Condição para opção 1: Inserir cinco funcionários
        IF @opcao = 1
        BEGIN
            WHILE @i <= 5
            BEGIN
                SET @cpf = @cpfBase + RIGHT('000' + CAST(@i AS VARCHAR), 3);

                INSERT INTO pessoas (pes_nome, pes_cpf, pes_status)
                VALUES ('AAAAAA', @cpf, 1);

                INSERT INTO funcionarios (pes_codigo, fun_salario, sup_codigo)
                VALUES (@@IDENTITY, 1000.00, NULL);

                SET @i = @i + 1;
            END
        END

        -- Condição para opção 2: Inserir cinco clientes
        ELSE IF @opcao = 2
        BEGIN
            WHILE @i <= 5
            BEGIN
                SET @cpf = @cpfBase + RIGHT('111' + CAST(@i AS VARCHAR), 3);

                INSERT INTO pessoas (pes_nome, pes_cpf, pes_status)
                VALUES ('AAAAAA', @cpf, 1);

                INSERT INTO clientes (pes_codigo, cli_renda, cli_credito)
                VALUES (@@IDENTITY, 5000.00, 1000.00);

                SET @i = @i + 1;
            END
        END

        -- Condição para opção inválida
        ELSE
        BEGIN
            RAISERROR('Opção inválida', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Confirmação da transação
        COMMIT TRANSACTION;
    END TRY

    -- Bloco CATCH para manipulação de erros
    BEGIN CATCH
        -- Desfazer transação em caso de erro
        ROLLBACK TRANSACTION;

        -- Retornar mensagem de erro
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;

EXEC sp_inserir_massa @opcao = 1;

EXEC sp_inserir_massa @opcao = 2;

EXEC sp_inserir_massa @opcao = 3;  -- Isso vai gerar um erro com a mensagem "Opção inválida"


