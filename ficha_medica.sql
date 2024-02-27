create database ficha_medica
use ficha_medica

create table pessoa (
	id int not null primary key identity,
	nome varchar(100) not null,
	data_nascimento date not null,
	genero varchar(10) not null,
	estado_civil varchar(10) not null,
	rg varchar (14) not null,
);

create table paciente(
	id_pessoa int not null primary key,
	convenio varchar(50) not null
	foreign key (id_pessoa) references pessoa (id)
);

create table telefones(
	id_pessoa int not null identity,
	ddd int not null,
	telefone varchar(11) not null
	foreign key (id_pessoa) references pessoa (id)
);


create table medico (
	id_pessoa int not null primary key,
	crm varchar(10) not null,
	foreign key (id_pessoa) references pessoa (id)
);


create table endereco(
	id int not null,
	id_pessoa int not null,
	cep varchar(15) not null,
	estado varchar(10) not null,
	cidade varchar(15) not null,
	bairro varchar(15) not null,
	logradouro varchar(15) not null,
	numero varchar(10) not null,
	primary key (id, id_pessoa),
	foreign key (id_pessoa) references pessoa (id)
);
create table consulta (
	id int not null primary key, 
	id_paciente int not null,
	id_medico int not null,
	data datetime not null,
	diagnostcio varchar (50) not null,
	foreign key (id_medico) references medico (id_pessoa),
	foreign key (id_paciente) references paciente (id_pessoa)
);


create table exame(
	id int not null primary key,
	id_consulta int not null,
	exame varchar(100),
	data datetime not null,
	foreign key (id_consulta) references consulta (id)
);

use master
drop database ficha_medica