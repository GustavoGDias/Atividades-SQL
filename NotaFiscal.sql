-- Cria o banco de dados para a atividade
CREATE DATABASE NotasFiscais;

-- Seleciona o banco de dados para utilização
USE NotasFiscais;

-- Criação das tabelas

create table enderecos(
	id int not null primary key identity,
	cep char(8) not null unique, --somente números
	uf char(2) not null,
	cidade varchar(50) not null,
	logradouro varchar(50) not null,
	bairro varchar(50)
);

create table empresas(
	id int not null primary key identity,
	cnpj char(14) not null unique,
	razao_social varchar(100) not null,
	inscricao_estadual varchar(20),
	protocolo_nfe char(44) not null
);

create table empresas_enderecos(
	id int not null primary key identity, 
	empresa_id int not null,
	endereco_id int not null,
	numero varchar(10),
	foreign key(empresa_id) references empresas(id),
	foreign key(endereco_id) references enderecos(id)
);

create table empresas_telefones(
	id_empresa int not null,
	ddd int not null,
	telefone varchar(10) not null,
	primary key (id_empresa, ddd, telefone),
	foreign key (id_empresa) references empresas(id)
);

create table clientes(
	id int not null primary key identity, 
	nome varchar(100) not null
);

create table clientes_juridicos (
	id_cliente int not null,
	cnpj char(14) not null,
	inscricao_estadual varchar(20),
	primary key(id_cliente),
	foreign key(id_cliente) references clientes(id)
);

create table clientes_fisicas(
	id_cliente int not null,
	cpf char(11) not null,
	rg varchar(20),
	primary key(id_cliente),
	foreign key(id_cliente) references clientes(id)
);

create table clientes_telefones(
	id_cliente int not null,
	ddd int not null,
	telefone varchar(10) not null,
	primary key (id_cliente, ddd, telefone),
	foreign key (id_cliente) references clientes(id)
);

create table clientes_enderecos(
	id int not null primary key identity, 
	cliente_id int not null,
	endereco_id int not null,
	numero varchar(10),
	foreign key(cliente_id) references clientes(id),
	foreign key(endereco_id) references enderecos(id)
);

create table transportadoras(
	id int not null primary key identity,
	cnpj char(14) not null unique,
	razao_social varchar(100) not null,
	inscricao_estadual varchar(20)
);

create table transportadoras_enderecos(
	id int not null primary key identity, 
	transportadora_id int not null,
	endereco_id int not null,
	numero varchar(10),
	foreign key(transportadora_id) references transportadoras(id),
	foreign key(endereco_id) references enderecos(id)
);

create table produtos(
	id int not null primary key identity, 
	codigo varchar(10) not null unique,
	descricao varchar(50) not null,
	preco money not null,
	unidade_medida varchar(10) not null,
	peso decimal(9,2) not null,
	cfop varchar(10),
	cst int,
	ncm varchar(10),
	icms decimal(5,2)
);

create table notas_fiscais(
	serie int not null,
	numero int not null,
	cod_operacao int not null,
	chave_acesso char(44) not null,
	natureza_operacao varchar(20) not null,
	data_emissao date not null,
	dados_adicionais text,
	primary key(serie, numero)
);

create table impostos(
	id int not null primary key identity,
	serie int not null,
	numero int not null,
	imposto_descricao varchar(20) not null,
	base_calculo money not null,
	valor_imposto money not null,
	desconto money not null,
	foreign key(serie, numero) references notas_fiscais(serie, numero),
);

create table faturas(
	id int not null primary key identity,
	serie int not null,
	numero int not null,
	data_vencimento date not null,
	valor money not null,
	foreign key(serie, numero) references notas_fiscais(serie, numero)
);

create table itens_pedido(
	id int not null primary key identity, 
	serie int not null,
	numero int not null,
	produto_id int not null,
	valor_item money not null,
	qtde_item int not null,
	valor_total money not null,
	valor_icms money not null,
	foreign key(serie, numero) references notas_fiscais(serie, numero),
	foreign key(produto_id) references produtos(id)
);

create table transportes(
	serie int not null,
	numero int not null,
	transportadora_id int not null,
	especie varchar(20) not null,
	qtde int not null,
	peso decimal(9,2) not null,
	valor_frete money not null,
	antt varchar(10),
	placa char(7),
	primary key(serie, numero),
	foreign key(serie, numero) references notas_fiscais(serie, numero),
	foreign key(transportadora_id) references transportadoras(id)
);
