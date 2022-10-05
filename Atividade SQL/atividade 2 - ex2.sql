#EXERCICIO 02
create database academico;
use academico;
create table curso (
	cod_curso int primary key,
    nome varchar(100),
    sigla char(10)
);

create table aluno(
	mat int primary key,
    nome varchar(100),
    entrada varchar(100),
    cod_curso int
);

create table disciplina(
	cod_disc int primary key,
    nome varchar(100),
    sigla char(10),
    carga_hor int
);

create table professor(
	cod_prof int primary key,
    nome varchar(100)
);

create table turma(
	cod_turma int primary key,
    ano varchar(100),
    sem int
);

create table alocacao(
	cod_aloc int primary key,
	cod_turma int,
    cod_disp int,
    cod_prof int
);

create table historico(
	cod_historico int primary key,
	cod_turma int,
    mat int,
    cod_disc int,
    media float
);

create table pre_req (
	cod_pre int primary key,
	cod_disc int,
    cod_disc_req int
);

alter table aluno add foreign key (cod_curso) references curso(cod_curso);
alter table historico add foreign key (mat) references aluno(mat);
alter table historico add foreign key (cod_disc) references disciplina(cod_disc);
alter table pre_req add foreign key (cod_disc) references disciplina(cod_disc);
alter table alocacao add foreign key (cod_prof) references professor(cod_prof);
alter table alocacao add foreign key (cod_turma) references turma(cod_turma);
alter table historico add foreign key (cod_turma) references turma(cod_turma);


insert into curso(cod_curso, nome, sigla) values
(1, 'Sistemas para Internet', 'TSPI'),
(2, 'Licenciatura em Computador', 'LCOMP');

insert into aluno (mat, nome, entrada, cod_curso) values
(1001, 'Paulo Silva', '2016_1',1),
(1002, 'Carla Martins', '2016_2',1),
(1003, 'Marcos Ferreira','2017_1',2);

insert into disciplina (cod_disc, nome, sigla, carga_hor) values
(1,'Lógica', 'Log', 105),
(2, 'Algoritmos','Alg', 80),
(3, 'Banco de dados 1','BD1',75),
(4, 'Programação Orientada a Objetos','POO',120);

insert into professor(cod_prof,nome) values
(1,'Clarimundo'),
(2, 'Mateus'),
(3, 'Cibele');

insert into turma(cod_turma, ano, sem) values
(44, 2016, 1),
(46, 2016, 1),
(47, 2016, 2),
(48, 2017, 1);

insert into alocacao(cod_aloc,cod_turma, cod_disp, cod_prof) values
(1, 44, 1, 1),
(2, 46, 3, 2),
(3, 46, 2, 1),
(4, 47, 3, 3),
(5, 48, 4, 1);

insert into historico(cod_historico, cod_turma, mat, cod_disc, media) values
(1, 44, 1001, 1, 6.0),
(2, 46, 1001, 2, 5.5),
(3, 47, 1002, 3, 7.0);

insert into pre_req(cod_pre,cod_disc, cod_disc_req) values
(1, 2, 1),
(2, 4, 2);

select nome
from disciplina
where carga_hor >= 100;

select *
from aluno
where nome like '%a %';

select *
from aluno
where nome like '%a';

select * 
from aluno 
where entrada like '2016%';

select a.nome, h.media, h.cod_disc
from historico h inner join aluno a on h.mat = a.mat
where a.mat = 1001;