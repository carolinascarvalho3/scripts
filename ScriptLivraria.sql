create database livraria;

use livraria;

create table autor(
	codigo int not null primary key auto_increment,
    nome varchar(150) not null,
    biografia varchar(200) not null,
    nacionalidade varchar(20) not null
)engine = InnoDB;

create table livro(
	isbn bigint not null primary key,
	categoria varchar(45) not null,
    quantidade int not null,
    valor decimal(10,2) not null,
    titulo varchar(45) not null,
    codigoAutor int not null
)engine = InnoDB;

-- Relacionamento 1:N
alter table livro add constraint livroAutor 
foreign key(codigoAutor) references autor(codigo);