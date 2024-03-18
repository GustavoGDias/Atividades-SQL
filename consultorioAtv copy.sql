create database consultorio2;

use consultorio2;

create table pessoas(
	id int not null primary key identity,
	data_nascimento date not null,
	genero varchar(50),
	estado_civil varchar(50),
	rg varchar(14) not null
);

-- Inserindo dados na tabela pessoas
insert into
	pessoas (data_nascimento, genero, estado_civil, rg)
values
	(
		'1990-01-01',
		'Masculino',
		'Solteiro',
		'123456789'
	);

insert into
	pessoas (data_nascimento, genero, estado_civil, rg)
values
	('1985-02-15', 'Feminino', 'Casado', '987654321');

insert into
	pessoas (data_nascimento, genero, estado_civil, rg)
values
	(
		'1978-06-30',
		'Masculino',
		'Divorciado',
		'456789123'
	);

insert into
	pessoas (data_nascimento, genero, estado_civil, rg)
values
	(
		'2000-10-20',
		'Feminino',
		'Solteiro',
		'321654987'
	);

insert into
	pessoas (data_nascimento, genero, estado_civil, rg)
values
	('1995-12-25', 'Masculino', 'Casado', '654987321');

create table telefones(
	id_pessoa int not null,
	ddd int not null,
	telefone varchar(10) not null,
	primary key (id_pessoa, ddd, telefone),
	foreign key (id_pessoa) references pessoas (id)
);

-- Telefones
insert into
	telefones (id_pessoa, ddd, telefone)
values
	(1, 11, '123456789');

insert into
	telefones (id_pessoa, ddd, telefone)
values
	(2, 11, '987654321');

insert into
	telefones (id_pessoa, ddd, telefone)
values
	(3, 11, '456789123');

insert into
	telefones (id_pessoa, ddd, telefone)
values
	(4, 11, '321654987');

insert into
	telefones (id_pessoa, ddd, telefone)
values
	(5, 11, '654987321');

create table enderecos(
	id int not null identity,
	id_pessoa int not null,
	logradouro varchar(50),
	numero varchar(10) not null,
	cep varchar(9) not null,
	bairro varchar(50),
	cidade varchar(50),
	estado varchar(50),
	primary key (id, id_pessoa),
	foreign key (id_pessoa) references pessoas (id)
);

-- Endereços
insert into
	enderecos (
		id_pessoa,
		logradouro,
		numero,
		cep,
		bairro,
		cidade,
		estado
	)
values
	(
		1,
		'Rua A',
		'100',
		'12345-678',
		'Centro',
		'São Paulo',
		'SP'
	);

insert into
	enderecos (
		id_pessoa,
		logradouro,
		numero,
		cep,
		bairro,
		cidade,
		estado
	)
values
	(
		2,
		'Rua B',
		'200',
		'54321-876',
		'Centro',
		'Rio de Janeiro',
		'RJ'
	);

insert into
	enderecos (
		id_pessoa,
		logradouro,
		numero,
		cep,
		bairro,
		cidade,
		estado
	)
values
	(
		3,
		'Rua C',
		'300',
		'98765-432',
		'Centro',
		'Belo Horizonte',
		'MG'
	);

insert into
	enderecos (
		id_pessoa,
		logradouro,
		numero,
		cep,
		bairro,
		cidade,
		estado
	)
values
	(
		4,
		'Rua D',
		'400',
		'56789-012',
		'Centro',
		'Porto Alegre',
		'RS'
	);

insert into
	enderecos (
		id_pessoa,
		logradouro,
		numero,
		cep,
		bairro,
		cidade,
		estado
	)
values
	(
		5,
		'Rua E',
		'500',
		'34567-890',
		'Centro',
		'Curitiba',
		'PR'
	);

create table pacientes(
	id_pessoa int not null primary key,
	convenio varchar(50),
	foreign key (id_pessoa) references pessoas (id)
);

-- Pacientes
insert into
	pacientes (id_pessoa, convenio)
values
	(1, 'Unimed');

insert into
	pacientes (id_pessoa, convenio)
values
	(2, 'Amil');

insert into
	pacientes (id_pessoa, convenio)
values
	(3, 'SulAmérica');

insert into
	pacientes (id_pessoa, convenio)
values
	(4, 'Golden Cross');

insert into
	pacientes (id_pessoa, convenio)
values
	(5, 'Bradesco');

create table medicos(
	id_pessoa int not null primary key,
	crm varchar(10),
	foreign key (id_pessoa) references pessoas (id)
);

-- Médicos
insert into
	medicos (id_pessoa, crm)
values
	(1, 'CRM-SP5469');

insert into
	medicos (id_pessoa, crm)
values
	(2, 'CRM-SP5379');

insert into
	medicos (id_pessoa, crm)
values
	(3, 'CRM-SP5489');

insert into
	medicos (id_pessoa, crm)
values
	(4, 'CRM-SP5667');

insert into
	medicos (id_pessoa, crm)
values
	(5, 'CRM-SP5789');

create table consultas(
	id int not null primary key identity,
	data datetime not null,
	diagnostico varchar(100),
	id_medico int not null,
	id_paciente int not null,
	foreign key (id_medico) references medicos (id_pessoa),
	foreign key (id_paciente) references pacientes (id_pessoa)
);

-- Consultas
insert into
	consultas (data, diagnostico, id_medico, id_paciente)
values
	('2024-02-27 10:00:00', 'Gripe', 1, 1);

insert into
	consultas (data, diagnostico, id_medico, id_paciente)
values
	('2024-02-28 11:00:00', 'Dor de cabeça', 2, 2);

insert into
	consultas (data, diagnostico, id_medico, id_paciente)
values
	('2024-02-29 12:00:00', 'Febre', 3, 3);

insert into
	consultas (data, diagnostico, id_medico, id_paciente)
values
	('2024-03-01 13:00:00', 'Dor de garganta', 4, 4);

insert into
	consultas (data, diagnostico, id_medico, id_paciente)
values
	('2024-03-02 14:00:00', 'Tosse', 5, 5);

create table exames(
	id int not null primary key identity,
	id_consulta int not null,
	data datetime not null,
	exame varchar(100) foreign key (id_consulta) references consultas (id)
);

-- Exames
insert into
	exames (id_consulta, data, exame)
values
	(1, '2024-02-27 10:30:00', 'Raio-X de tórax');

insert into
	exames (id_consulta, data, exame)
values
	(
		2,
		'2024-02-28 11:30:00',
		'Ressonância magnética'
	);

insert into
	exames (id_consulta, data, exame)
values
	(
		3,
		'2024-02-29 12:30:00',
		'Tomografia computadorizada'
	);

insert into
	exames (id_consulta, data, exame)
values
	(4, '2024-03-01 13:30:00', 'Exame de sangue');

insert into
	exames (id_consulta, data, exame)
values
	(5, '2024-03-02 14:30:00', 'Eletrocardiograma');

-- Pessoas
select
	*
from
	pessoas;

-- Telefones
select
	*
from
	telefones;

-- Endereços
select
	*
from
	enderecos;

-- Pacientes
select
	*
from
	pacientes;

-- Médicos
select
	*
from
	medicos;

-- Consultas
select
	*
from
	consultas;

-- Exames
select
	*
from
	exames;

alter table
	pessoas
add
	nome varchar(50) not null;

update
	pessoas
set
	nome = 'João'
where
	id = 1;

update
	pessoas
set
	nome = 'Maria'
where
	id = 2;

update
	pessoas
set
	nome = 'José'
where
	id = 3;

update
	pessoas
set
	nome = 'Ana'
where
	id = 4;

update
	pessoas
set
	nome = 'Pedro'
where
	id = 5;

select
	*
from
	consultas
where
	id_medico = 1;

-- Exemplo com o id 1
select
	*
from
	exames
where
	id_consulta = 1;

-- Exemplo com o id 1
select
	*
from
	telefones
where
	id_pessoa = 1;

-- Exemplo com o id 1
select
	*
from
	pessoas
	INNER JOIN pacientes ON pessoas.id = pacientes.id_pessoa;

select
	*
from
	pessoas
	INNER Join medicos ON pessoas.id = medicos.id_pessoa;