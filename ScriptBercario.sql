create database bercario;

use bercario;


create table mae(
	codigoMae int not null primary key auto_increment,
    nome varchar(150) not null,
    endereco varchar(200) not null,
    telefone varchar(13) not null,
    dtNascimento date not null
)engine = InnoDB;

create table bebe(
	codigoBebe int not null primary key auto_increment,
    nome varchar(150) not null,
    dtNascimento date not null,
    pesoNascimento decimal(5,2) not null,
    alturaNascimento decimal(5,2) not null,
    mae varchar(150) not null,
    medico varchar(150) not null
)engine = InnoDB;

create table medeico(
	codigoMedico int not null primary key auto_increment,
    crm varchar(6) not null,
    nome varchar(150) not null,
    telefone varchar(15) not null,
    especialidade varchar(50) not null
)engine = InnoDB;

alter table mae add codigoBebe int not null;
alter table medeico rename to medico;

create table cuidar(
	codigoCuidar int not null primary key auto_increment,
    codigoMedico int not null,
    codigoBebe int not null
)engine = InnoDB;

alter table mae add constraint maeBebe
foreign key(codigoBebe) references bebe(codigoBebe);

alter table cuidar add constraint cuidarBebe
foreign key(codigoBebe) references bebe(codigoBebe);

alter table cuidar add constraint cuidarMedico
foreign key(codigoMedico) references medico(codigoMedico);
