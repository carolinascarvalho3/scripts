create database sisLivraria;

use sisLivraria;

create table autores(
	codigoAutores int not null primary key auto_increment,
    nome varchar(150) not null,
    nacionalidade varchar(100) not null
)engine = InnoDB;

create table criar(
	codigoCriar int not null primary key auto_increment,
    codigoAutores int not null,
    codigoLivro int not null
)engine = InnoDB;

create table criacoes(
	codigoCriacoes int not null primary key auto_increment,
    coddigoLivro int not null,
    codigoAutores int not null
)engine = InnoDB;

alter table criacoes change coddigoLivro codigoLivro int not null;
create table livro(
	codigoLivro int not null primary key auto_increment,
    isbn BIGINT not null,
    titulo varchar(50) not null,
    autor varchar(100) not null,
    categoria varchar(200) not null,
    ano date not null
)engine = InnoDB;

create table categoria(
	codigoCategoria int not null primary key auto_increment,
    suspense varchar(200) not null,
    drama varchar(200) not null,
    acao varchar(200) not null,
    descricao varchar(200) not null,
    romance varchar(200) not null,
    comedia varchar(200) not null,
    aventura varchar(200) not null,
    terror varchar(200) not null,
    biografia varchar(200) not null,
    infantoJuvenil varchar(200) not null,
    quadrinhos varchar(200) not null
)engine = InnoDB;

create table categorizar(
	codigoCategorizar int not null primary key auto_increment,
    codigoLivro int not null,
    codigoCategoria int not null
)engine = InnoDB;

alter table criar add constraint criarAutores
foreign key(codigoAutores) references autores(codigoAutores);

alter table criar add constraint criarLivro
foreign key(codigoLivro) references livro(codigoLivro);

alter table criacoes add constraint criacoesAutores
foreign key(codigoAutores) references autores(codigoAutores);

alter table criacoes add constraint criacoesLivro
foreign key(codigoLivro) references livro(codigoLivro);

alter table categorizar add constraint categorizarCategoria
foreign key(codigoCategoria) references categoria(codigoCategoria);

alter table categorizar add constraint categorizarLivro
foreign key(codigoLivro) references livro(codigoLivro);



