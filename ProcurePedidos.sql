-- Procedure para Inserir Pedido
CREATE PROCEDURE InsertPedido
    @ped_data DATETIME,
    @ped_valor DECIMAL(7,2),
    @ped_status INT,
    @fun_codigo INT,
    @cli_codigo INT,
    @est_codigo INT
AS
BEGIN
    INSERT INTO pedidos (ped_data, ped_valor, ped_status, fun_codigo, cli_codigo, est_codigo)
    VALUES (@ped_data, @ped_valor, @ped_status, @fun_codigo, @cli_codigo, @est_codigo);
END;
GO

-- Procedure para Atualizar Pedido
CREATE PROCEDURE UpdatePedido
    @ped_numero INT,
    @ped_data DATETIME,
    @ped_valor DECIMAL(7,2),
    @ped_status INT,
    @fun_codigo INT,
    @cli_codigo INT,
    @est_codigo INT
AS
BEGIN
    UPDATE pedidos
    SET ped_data = @ped_data,
        ped_valor = @ped_valor,
        ped_status = @ped_status,
        fun_codigo = @fun_codigo,
        cli_codigo = @cli_codigo,
        est_codigo = @est_codigo
    WHERE ped_numero = @ped_numero;
END;
GO

-- Procedure para Deletar Pedido
CREATE PROCEDURE DeletePedido
    @ped_numero INT
AS
BEGIN
    DELETE FROM pedidos
    WHERE ped_numero = @ped_numero;
END;
GO

-- Exemplos de Execução das Procedures
-- Inserir Pedido
EXEC InsertPedido '2024-07-17 10:00', 150.00, 1, 6, 2, 3;

-- Atualizar Pedido
EXEC UpdatePedido 1, '2024-07-17 12:00', 200.00, 2, 7, 3, 4;

-- Deletar Pedido
EXEC DeletePedido 1;
