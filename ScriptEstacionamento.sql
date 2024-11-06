create database estacionamento;

use estacionamento;

create table colntrole(
	codigocControle int not null primary key auto_increment,
    entrada datetime not null,
    saida datetime not null,
    codigoEstacionamento varchar(10)
    )engine = InnoDB;
    
alter table controle drop column codigoEstacionamento;
alter table colntrole rename to controle;
alter table controle add codigoEstacionamento varchar(10) not null;

create table cliente(
	codigoCliente int not null primary key auto_increment,
    nome varchar(150) not null,
    cpf BIGINT not null,
    telefone varchar(15) not null,
    veiculo varchar(100) not null
)engine = InnoDB;

create table mensalista(
	codigoMensalista int not null primary key auto_increment,
    nome varchar(150) not null,
    telefone varchar(15) not null,
    endereco varchar(200) not null,
    carro varchar(50) not null,
    cor varchar(50) not null,
    placa varchar(50) not null,
    dtPagamento date not null,
    valorMensal decimal(10,2),
    codigoControle int not null
)engine = InnoDB;

alter table mensalista add codigoControle int not null;

create table registro(
	codigoRegistro int not null primary key auto_increment,
    codigoCliente int not null,
    codigoControle int not null
)engine = InnoDB;

create table mensal(
	codigoMensal int not null primary key not null,
    codigoFuncionario int not null,
    codigoMensalista int not null
)engine = InnoDB;

create table funcionario(
	codigoFuncionario int not null primary key not null,
    nome varchar(150) not null,
    telefone int(15) not null,
    endereco varchar(200) not null,
    salario decimal(10,2) not null,
    cargo varchar(50) not null
)engine = InnoDB;

create table gerente(
	codigoGerente int not null primary key auto_increment,
    nome varchar(150) not null,
    cpf BIGINT not null,
    salario decimal(10,2) not null,
    cargo varchar(50) not null
)engine = InnoDB;

create table cadastrar(
	codigoCadastrar int not null primary key auto_increment,
    codigoGerente int not null,
    codigoFuncionario int not null
)engine = InnoDB;

alter table registro add constraint registroControle
foreign key(codigoControle) references controle(codigoControle);

alter table registro add constraint registroCliente
foreign key(codigoCliente) references cliente(codigoCliente);

alter table mensal add constraint mensalMensalista
foreign key(codigoMensalista) references mensalista(codigoMensalista);

alter table mensal add constraint mensalFuncionario
foreign key(codigoFuncionario) references funcionario(codigoFuncionario);

alter table cadastrar add constraint cadastroGerente
foreign key(codigoGerente) references gerente(codigoGerente);

alter table cadastrar add constraint cadastroFuncionario
foreign key(codigoFuncionario) references funcionario(codigoFuncionario);