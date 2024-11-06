create database biblioteca;

use biblioteca;

create table biblioteca(
	codigoBiblioteca int not null primary key auto_increment,
    titulo varchar(200) not null,
    autor varchar(150) not null,
    categoria varchar(150) not null,
    edicao varchar(50) not null,
    editora varchar(50) not null
)engine = InnoDB;

create table cliente(
	codigoCliente int not null primary key auto_increment,
	cliente varchar(150) not null,
    cpf BIGINT not null,
    endereco varchar(200) not null,
    telefone varchar(15) not null,
    celular varchar(15) not null
    )engine = InnoDB;
    
create table reserva(
	codigoReserva int not null primary key auto_increment,
    cliente varchar(150) not null,
    cpf BIGINT not null,
    titulo varchar(200) not null,
    dtDevolucao date not null,
    dtEntrada date not null
    )engine = InnoDB;
    
create table sistema(
	codigoSistema int not null primary key auto_increment,
    acesso varchar(50) not null,
    login varchar(50) not null,
    senha varchar(50) not null,
    cpf BIGINT not null,
    endereco varchar(200) not null,
    telefone varchar(15) not null
)engine = InnoDB;

create table compra(
	codigoCompra int not null primary key auto_increment,
    formaPagaemento varchar(50) not null,
    quantidade int(8) not null
    )engine = InnoDB;

create table pagar(
	codigoPagar int not null primary key auto_increment,
    codigoCliente int not null,
    codigoCompra int not null
)engine = InnoDB;

create table reservado(
	codigoReservado int not null primary key auto_increment,
    codigoCliente int not null,
    codigoReserva int not null
)engine = InnoDB;

alter table sistema add codigoBiblioteca int not null;
alter table sistema add codigoCliente int not null;

alter table pagar add constraint pagamentoCliente
foreign key(codigoCliente) references cliente(codigoCliente);

alter table pagar add constraint pagamentoCompra
foreign key(codigoCompra) references compra(codigoCompra);

alter table reservado add constraint reservaCliente
foreign key(codigoCliente) references cliente(codigoCliente);

alter table reservado add constraint reservaReservado
foreign key(codigoReserva) references reserva(codigoReserva);

alter table biblioteca add codigoCliente int not null;

alter table biblioteca add constraint clienteBiblioteca
foreign key(codigoCliente) references cliente(codigoCliente);

alter table sistema add constraint clienteSistema
foreign key(codigoCliente) references cliente(codigoCliente);

alter table sistema add constraint sistemaBiblioteca
foreign key(codigoBiblioteca) references biblioteca(codigoBiblioteca);