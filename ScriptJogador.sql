create database jogador;

use jogador;

create table jogador(
	codigoJogador int not null primary key auto_increment,
    nome varchar(150) not null,
    camisa varchar(15) not null,
    equipe varchar(5) not null,
    codigoEquipe int not null
)engine = InnoDB;

create table equipe(
	codigoEquipe int not null primary key auto_increment,
    numJogador varchar(30) not null,
    tecnico varchar(150) not null
)engine = InnoDB;

create table formacao(
	codigoFormacao int not null primary key auto_increment,
    codigoJogador int not null,
    codigoEquipe int not null
)engine = InnoDB;

alter table formacao add constraint formacaoEquipe
foreign key(codigoEquipe) references equipe(codigoEquipe);

alter table formacao add constraint formacaoJogador
foreign key(codigoJogador) references jogador(codigoJogador);

