create database escola; -- Criação de BD 
 

use escola; -- Escolhendo o BD 

create table aluno(
	codigoAluno int not null primary key auto_increment,
	nome varchar(150) not null,
    telefone varchar(13) not null,
    endereco varchar(200) not null
)engine = InnoDB;

create table trabalho(
	codigoTrabalho int not null primary key auto_increment,
	titulo varchar(120) not null,
    disciplina varchar(45) not null,
    professor varchar(150) not null
)engine = InnoDB;

create table fazer(
	codigoFazer int not null primary key auto_increment,
	codigoAluno int not null, 
    codigotrabalho int not null
)engine = InnoDB;

-- Relacionamento entre as tabelas de acordo com o MER 
alter table fazer add constraint fazerAluno
foreign key(codigoAluno) references aluno(codigoAluno);

alter table fazer add constraint fazerTrabalho
foreign key(codigoTrabalho) references trabalho(codigoTrabalho);

-- Comandos para modificação de tabelas 
drop table aluno; -- Comando que apaga a tabela inteira 
drop database escola; -- APAGA o banco de dados inteiro  

-- COMANDOS DE DESCRIÇÃO 
describe estudante; -- Descrever
select * from aluno; -- Visualizar dados
show tables; -- Visualizar as tabelas 

-- Alter table comandos para quando errar
alter table aluno add notas decimal(5,2) not null; -- Adicionando colunas
alter table aluno change notas nota decimal(5,2) not null; -- Troca a coluna
alter table aluno rename to estudante;
alter table estudante drop column nota; 