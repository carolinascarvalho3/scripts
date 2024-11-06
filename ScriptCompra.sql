create database compra;

use compra;

create table compra(
	codigoCompra int not null primary key auto_increment,
    nome varchar(150) not null,
    dtCompra date not null,
    valorTotal decimal(10,2)
)engine = InnoDB;

create table produto(
	codigoProduto int not null primary key auto_increment,
    nomeProduto varchar(200) not null,
    tipo varchar(200) not null,
    quantidade int(8) not null
)engine = InnoDB;

create table cliente(
	codigoCliente int not null primary key auto_increment,
    nome varchar(150) not null,
    rg varchar(20) not null,
    telefone varchar(15),
    endereco varchar(200) not null
    )engine = InnoDB;
    
create table pegar(
	codigoPegar int not null primary key auto_increment,
    codigoCliente int not null,
    codigoProduto int not null
)engine = InnoDB;

create table realizada(
	codigoRealizada int not null primary key auto_increment,
    codigoCliente int not null,
    codigoCompra int not null
)engine= InnoDB;

create table pagar(
	codigoPagar int not null primary key auto_increment,
    codigoProduto int not null,
    codigoCompra int not null
)engine = InnoDB;

alter table pegar add constraint pegarProduto
foreign key(codigoProduto) references produto(codigoProduto);

alter table pegar add constraint pegarCliente
foreign key(codigoCliente) references cliente(codigoCliente);

alter table realizada add constraint compraRealizada
foreign key(codigoCompra) references compra(codigoCompra);

alter table realizada add constraint clienteRealizada
foreign key(codigoCliente) references cliente(codigoCliente);

alter table pagar add constraint pagamentoCompra
foreign key(codigoCompra) references compra(codigoCompra);

alter table pagar add constraint pagamentoProduto
foreign key(codigoProduto) references produto(codigoProduto); 

