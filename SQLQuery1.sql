
CREATE DATABASE Atividade
USE Atividade;

CREATE TABLE Categoria(
	Codigo INT NOT NULL IDENTITY PRIMARY KEY,
	Descricao VARCHAR(50) NOT NULL,
	ValorDiaria INT NOT NULL
);

CREATE TABLE Produto(
	Codigo INT NOT NULL IDENTITY PRIMARY KEY,
	Descricao VARCHAR(50) NOT NULL,
	PrecoVenda INT NOT NULL,
	Estoque INT NOT NULL
);

CREATE TABLE Pessoa(
	CPF INT NOT NULL IDENTITY PRIMARY KEY,
	Nome VARCHAR(20) NOT NULL,
	CEP INT NOT NULL,
	Logradouro VARCHAR(50) NOT NULL,
	Numero INT NOT NULL,
	Bairro VARCHAR(20) NOT NULL,
	Ciadade VARCHAR(20) NOT NULL,
	Estado VARCHAR(20) NOT NULL
);

CREATE TABLE Telefone_Pessoa(
	CPF INT NOT NULL IDENTITY PRIMARY KEY,
	DDI VARCHAR(3) NOT NULL,
	DDD VARCHAR(3) NOT NULL,
	Telefone VARCHAR(10) NOT NULL,
	NomeContato VARCHAR(20) NOT NULL,
	Descricao VARCHAR(20) NOT NULL
	FOREIGN KEY(CPF) REFERENCES Pessoa(CPF)
);

CREATE TABLE Cliente(
	CPF INT NOT NULL PRIMARY KEY,
	DataNacismento DATE
	FOREIGN KEY(CPF) REFERENCES Pessoa(CPF)
);

CREATE TABLE Funcionario(
	CPF INT NOT NULL PRIMARY KEY,
	DataEfetivacao date not null,
	CargaHorariaSemanal int not null
	FOREIGN KEY(CPF) REFERENCES Pessoa(CPF)
);

CREATE TABLE Email_Cliente(
	CPF INT NOT NULL PRIMARY KEY,
	Email VARCHAR(25) NOT NULL,
	FOREIGN KEY(CPF) REFERENCES Cliente(CPF)
);

CREATE TABLE Apartamento(
	Numero INT PRIMARY KEY,
	Status1 VARCHAR (20) NOT NULL,
	CodigoCategoria INT NOT NULL,
	FOREIGN KEY(CodigoCategoria) REFERENCES Categoria(Codigo)
);

CREATE TABLE Reserva(
	Codigo int not null identity primary key,
	DataInicio date,
	DataOrevistaSaida date,
	NumeroApartamento int,
	CPFCliente INT,
	CPFFuncionario INT,
	FOREIGN KEY(NumeroApartamento) REFERENCES Apartamento(Numero),
	FOREIGN KEY(CPFCliente) REFERENCES Cliente(CPF),
	FOREIGN KEY(CPFFuncionario) REFERENCES Funcionario(CPF)
);

CREATE TABLE Hospedagem(
	Codigo int not null identity primary key,
	DataInicio date,
	DataTermino date,
	Status1 VARCHAR(20),
	CodigoReserva int,
	CPFFuncionarioAbertura INT NOT NULL,
	CPFFuncionarioEncerramento INT NOT NULL,
	ValorTotal INT,
	FOREIGN KEY(CodigoReserva) REFERENCES Reserva(Codigo),
	FOREIGN KEY(CPFFuncionarioAbertura) REFERENCES Funcionario(CPF),
	FOREIGN KEY(CPFFuncionarioEncerramento) REFERENCES Funcionario(CPF)
);

CREATE TABLE Consumo(
	CodigoHospedagem INT NOT NULL IDENTITY PRIMARY KEY,
	CodigoProduto INT NOT NULL,
	Qtde INT NOT NULL,
	PrecoUnitario INT NOT NULL,
	FOREIGN KEY(CodigoHospedagem) REFERENCES Hospedagem(Codigo),
	FOREIGN KEY(CodigoProduto) REFERENCES Produto(Codigo)
);