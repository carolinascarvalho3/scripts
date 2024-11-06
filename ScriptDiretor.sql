create database diretor;

use diretor;

create table diretor(
	codigoDiretor int not null primary key auto_increment,
    nome varchar(150) not null,
    dtNascimento date not null,
    telefone varchar(15) not null,
    dtContratacao date not null,
    cpf BIGINT not null,
    email varchar(50) not null
)engine = InnoDB;

create table departamento(
	codigoDepartamento int not null primary key auto_increment,
    nome varchar(150) not null,
    telefone varchar(15) not null,
    sala varchar(30) not null
)engine = InnoDB;

create table dirigir(
	codigoDirigir int not null primary key auto_increment,
    codigoDiretor int not null,
    codigoDepartamento int not null
)engine = InnoDB;

alter table dirigir add constraint dirigirDiretor
foreign key(codigoDiretor) references diretor(codigoDiretor);

alter table dirigir add constraint dirigirDepartamento
foreign key(codigoDepartamento) references departamento(codigoDepartamento); 