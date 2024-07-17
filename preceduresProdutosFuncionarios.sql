-- Procedure para Inserir Produto
CREATE PROCEDURE InsertProduto
    @prd_descricao VARCHAR(50),
    @prd_qtd INT,
    @prd_valor DECIMAL(7,2),
    @prd_status INT
AS
BEGIN
    INSERT INTO produtos (prd_descricao, prd_qtd, prd_valor, prd_status)
    VALUES (@prd_descricao, @prd_qtd, @prd_valor, @prd_status);
END;
GO

-- Procedure para Atualizar Produto
CREATE PROCEDURE UpdateProduto
    @prd_codigo INT,
    @prd_descricao VARCHAR(50),
    @prd_qtd INT,
    @prd_valor DECIMAL(7,2),
    @prd_status INT
AS
BEGIN
    UPDATE produtos
    SET prd_descricao = @prd_descricao,
        prd_qtd = @prd_qtd,
        prd_valor = @prd_valor,
        prd_status = @prd_status
    WHERE prd_codigo = @prd_codigo;
END;
GO

-- Procedure para Deletar Produto
CREATE PROCEDURE DeleteProduto
    @prd_codigo INT
AS
BEGIN
    DELETE FROM produtos
    WHERE prd_codigo = @prd_codigo;
END;
GO

-- Procedure para Inserir Funcionário
CREATE PROCEDURE InsertFuncionario
    @pes_codigo INT,
    @fun_salario DECIMAL(7,2),
    @sup_codigo INT
AS
BEGIN
    INSERT INTO funcionarios (pes_codigo, fun_salario, sup_codigo)
    VALUES (@pes_codigo, @fun_salario, @sup_codigo);
END;
GO

-- Procedure para Atualizar Funcionário
CREATE PROCEDURE UpdateFuncionario
    @pes_codigo INT,
    @fun_salario DECIMAL(7,2),
    @sup_codigo INT
AS
BEGIN
    UPDATE funcionarios
    SET fun_salario = @fun_salario,
        sup_codigo = @sup_codigo
    WHERE pes_codigo = @pes_codigo;
END;
GO

-- Procedure para Deletar Funcionário
CREATE PROCEDURE DeleteFuncionario
    @pes_codigo INT
AS
BEGIN
    DELETE FROM funcionarios
    WHERE pes_codigo = @pes_codigo;
END;
GO

-- Exemplos de Execução das Procedures
-- Inserir Produto
EXEC InsertProduto 'Novo Produto', 100, 9.99, 1;

-- Atualizar Produto
EXEC UpdateProduto 1, 'Produto Atualizado', 150, 12.99, 2;

-- Deletar Produto
EXEC DeleteProduto 1;

-- Inserir Funcionário
EXEC InsertFuncionario 10, 3000.00, NULL;

-- Atualizar Funcionário
EXEC UpdateFuncionario 10, 3500.00, 4;

-- Deletar Funcionário
EXEC DeleteFuncionario 10;
