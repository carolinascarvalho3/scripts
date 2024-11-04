create database bercario;

use bercario;


create table mae(
	codigoMae int not null primary key auto_increment;
    nome varchar(150) not null,
    endereco varchar(200) not null,
    telefone varchar(13) not null,
    dtNascimento date not null
)engine = InnoDB;