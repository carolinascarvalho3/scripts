create database agendamento;

use agendamento;

create table paciente(
	codigoPaciente int not null primary key auto_increment,
    nome varchar(150),
    cpf bigint not null,
    telefone varchar(13),
    endereco varchar(200),
    especialidade varchar(50),
    carteiraConvenio varchar(10)
)engine = InnoDB;

create table medico(
	codigoMedico int not null primary key auto_increment,
    nome varchar(150),
    crm varchar(8),
    especialidade varchar(50),
    agenda date not null,
    encaminhamento varchar(50)
)engine = InnoDB;

create table recepcionista(
	codigoRecepcionista int not null primary key auto_increment,
    cadastro varchar(20),
    acesso varchar(20)
)engine = InnoDB;

create table tratamento(
	codigoTratamento int not null primary key auto_increment,
    codigoMedico int not null,
    codigoPaciente int not null
)engine = InnoDB;

create table agendamento(
	codigoAgendamento int not null primary key auto_increment,
    codigoRecepcionista int not null,
    codigoPaciente int not null
)engine = InnoDB;

alter table tratamento add constraint tratamentoMedico
foreign key(codigoMedico) references medico(codigoMedico);

alter table tratamento add constraint tratamentoPaciente
foreign key(codigoPaciente) references paciente(codigoPaciente);

alter table agendamento add constraint agendamentoPaciente
foreign key(codigoPaciente) references paciente(codigoPaciente);

alter table agendamento add constraint agendamentoRecepcionista
foreign key(codigoRecepcionista) references recepcionista(codigoRecepcionista);



