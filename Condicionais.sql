CREATE DATABASE TABUADA
USE TABUADA

-- Criar a procedure para gerar a tabuada
CREATE PROCEDURE GerarTabuada
    @numero INT
AS
BEGIN
    BEGIN TRY
        -- Verificar se o número está dentro do range aceito
        IF @numero < 1 OR @numero > 10
        BEGIN
            -- Lançar exceção com a mensagem
            RAISERROR ('Número escolhido fora do range aceito', 16, 1);
            RETURN;
        END

        -- Inicializar variáveis para o loop
        DECLARE @i INT = 0;
        DECLARE @resultado INT;

        -- Gerar a tabuada usando WHILE
        WHILE @i <= 10
        BEGIN
            SET @resultado = @numero * @i;
            PRINT CAST(@numero AS VARCHAR) + ' X ' + CAST(@i AS VARCHAR) + ' = ' + CAST(@resultado AS VARCHAR);
            SET @i = @i + 1;
        END
    END TRY
    BEGIN CATCH
        -- Capturar e mostrar a mensagem de erro
        PRINT 'Erro: ' + ERROR_MESSAGE();
    END CATCH
END;
GO

-- Testar a procedure com um número válido
EXEC GerarTabuada @numero = 5;
GO

-- Testar a procedure com um número fora do range aceito
EXEC GerarTabuada @numero = 11;
GO
