create database hotel;

use hotel;

--Categoria (Codigo, Descricao, ValorDiaria)
create table categoria(
	codigo int not null identity primary key,
	descricao varchar(50) not null,
	valor_diaria money not null
);

--Produto (Codigo, Descricao, PrecoVenda, Estoque)
create table produto(
	codigo int not null identity primary key,
	descricao varchar(50) not null,
	preco_venda money,
	estoque int
);

--Pessoa (CPF, Nome, CEP,  Logradouro, Numero, Bairro, Cidade, Estado)
create table pessoa(
	codigo int not null identity primary key,
	cpf varchar(15) not null unique,
	nome varchar(100) not null,
	cep varchar(9),
	logradouro varchar(500),
	numero varchar(10),
	bairro varchar(50),
	cidade varchar(50),
	estado varchar(50)
);

--Telefone_Pessoa (CPF, DDI, DDD, Telefone, NomeContato, Descricao) CPF referencia Pessoa:CPF
create table telefone_pessoa(
	codigo_pessoa int not null,
	DDI VARCHAR(3) NOT NULL,
	DDD VARCHAR(3) NOT NULL,
	Telefone VARCHAR(11) NOT NULL,
	NomeContato VARCHAR(20) NOT NULL,
	Descricao VARCHAR(20) NOT NULL
	primary key(codigo_pessoa,ddi,ddd)
	FOREIGN KEY(codigo_pessoa) REFERENCES pessoa(codigo)
);

--Cliente(CPF , DataNascimento) CPF referencia Pessoa:CPF
create table cliente(
	codigo_pessoa int not null primary key,
	data_nascimento date not null,
	foreign key (codigo_pessoa) references pessoa (codigo)
);

--Funcionario (CPF, DataEfetivacao, CargaHorariaSemanal) CPF referencia Pessoa:CPF
create table funcionario(
	codigo_pessoa int not null primary key,
	data_efetivacao datetime not null,
	carga_horaria_semanal int not null,
	foreign key (codigo_pessoa) references pessoa (codigo)
);

--Email_Cliente (CPF, Email) CPF referencia Cliente:CPF
create table email_cliente(
	codigo_pessoa int not null,
	email varchar(50) not null,
	primary key(codigo_pessoa, email),
	foreign key(codigo_pessoa) references cliente (codigo_pessoa)
);

--Apartamento (Numero, Status, CodigoCategoria)  CodigoCategoria referencia Categoria:Codigo
create table apartamento(
	Numero INT identity PRIMARY KEY,
	Status int NOT NULL,
	Codigo_categoria INT NOT NULL,
	FOREIGN KEY(Codigo_categoria) REFERENCES Categoria(Codigo)
);

--Reserva (Codigo, DataInicio, DataPrevistaSaida, NumeroApartamento, CPFCliente, CPFFuncionario) NumeroApartamento referencia Apartamento:Numero, CPFCliente referencia Cliente:CPF, CPFFuncionario referencia Funcionario:CPF
create table reserva(
	codigo int not null primary key identity,
	data_inicio datetime not null,
	data_prevista_saida datetime,
	numero_apartamento int not null,
	codigo_cliente INT not null,
	codigo_funcionario INT null,
	FOREIGN KEY(numero_apartamento) REFERENCES Apartamento (numero),
	FOREIGN KEY(codigo_cliente) REFERENCES Cliente(codigo_pessoa),
	FOREIGN KEY(codigo_funcionario) REFERENCES Funcionario(codigo_pessoa)
);

--Hospedagem (Codigo, DataInicio, DataTermino, Status, CodigoReserva, CPFFuncionarioAbertura, CPFFuncionarioEncerramento, ValorTotal) CodigoReserva referencia Reserva:Codigo, CPFFuncionarioAbertura referencia Funcionario:CPF, CPFFuncionarioEncerramento referencia Funcionario:CPF
create table hospedagem(
	codigo int not null primary key identity,
	data_inicio datetime not null,
	data_termino datetime,
	Status int not null,
	codigo_reserva int not null,
	codigo_funcionario_abertura INT NOT NULL,
	codigo_funcionario_encerramento INT NOT NULL,
	valor_total money,
	FOREIGN KEY(codigo_reserva) REFERENCES reserva (codigo),
	FOREIGN KEY(codigo_funcionario_abertura) REFERENCES Funcionario(codigo_pessoa),
	FOREIGN KEY(codigo_funcionario_encerramento) REFERENCES Funcionario(codigo_pessoa)
);

--Consumo (CodigoHospedagem, CodigoProduto, Qtde, PrecoUnitario) CodigoHospedagem referencia Hospedagem:Codigo, CodigoProduto referencia Produto:Codigo
create table consumo(
	codigo_hospedagem int not null,
	codigo_produto int not null,
	quantidade int not null,
	preco_unitario money not null,
	primary key (codigo_hospedagem, codigo_produto),
	foreign key (codigo_hospedagem) references hospedagem (codigo),
	foreign key (codigo_produto) references produto (codigo)
);
