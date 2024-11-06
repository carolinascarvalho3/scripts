create database encomenda;

use encomenda;

create table cliente(
	codigoCliente int not null primary key auto_increment,
    nome varchar(150) not null,
    cpf BIGINT not null,
    telefone varchar(15) not null,
    email varchar(100) not null,
    endereco varchar(200) not null,
    codigoEncomenda int not null
)engine = InnoDB;

create table encomenda(
	codigoEncomenda int not null primary key auto_increment,
    produto varchar(50) not null,
    quantidade int(8) not null,
    dtValidade date not null,
    formaPagamento varchar(50) not null
)engine = InnoDB;

alter table cliente add constraint clienteEncomenda
foreign key(codigoEncomenda) references encomenda(codigoEncomenda);