#a)
create database VoeBem;
use VoeBem;

# b)
create table companhia(
	cod_cia int auto_increment,
    nome_comp varchar(30),
    sigla varchar(5),
    primary key(cod_cia)
);

create table aeroporto(
	codigo_aeroporto varchar(3),
    nome_aeroporto varchar(100),
    cidade varchar(50),
    pais varchar(15),
    primary key (codigo_aeroporto)
);
create table piloto(
	codigo_piloto int auto_increment,
    nome_piloto varchar(50),
    salario numeric(9,2),
    gratificacao numeric(7,2),
    pais varchar(100),
    cod_cia int,
    primary key (codigo_piloto),
    foreign key (cod_cia) references companhia(cod_cia)
);

create table voo(
	codigo varchar(6),
    aeroporto_origem varchar(3),
    aeroporto_destino varchar(3),
    hora time,
    primary key(codigo),
    foreign key (aeroporto_origem) references aeroporto(codigo_aeroporto),
    foreign key (aeroporto_destino) references aeroporto(codigo_aeroporto)
);

create table escala(
	codigo_voo varchar(6),
    data_voo date,
    codigo_piloto int,
    aviao varchar(30),
    primary key(codigo_voo, data_voo),
	foreign key (codigo_voo) references voo(codigo),
	foreign key (codigo_piloto) references piloto(codigo_piloto)
);
# c)
alter table piloto add email varchar(100);

# d)
alter table aeroporto change column cidade cidade_aeroporto varchar(50);

# e)
alter table companhia modify column nome_comp varchar(40);