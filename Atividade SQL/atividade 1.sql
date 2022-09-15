create database empresa;
use empresa;
#CRIAR TABELA
create table Cargo(
	cod_cargo int primary key,
    nome varchar(50),
    nivel char(5),
    salario int
);
create table Departamento(
	cod_depto int primary key,
    nome varchar(50),
    sigla char(5)
);
create table Funcionario(
	cod_func int primary key,
    nome varchar(50),
    data_adm date,
    sexo char(2),
    cod_cargo int,
    cod_depto int,
    foreign key (cod_cargo) references Cargo(cod_cargo),
    foreign key (cod_depto) references Departamento(cod_depto)
);

#INSERT TABLE CARGO
insert into cargo(cod_cargo, nome, nivel, salario) values 
(1,'Analista de Sitemas','JR',1500),
(2,'Desenvolvedor','JR',2100),
(3,'Desenvolvedor','Pleno',3200);

insert into cargo(cod_cargo,nome,salario) values
(4,'Atendente',980),
(5,'Contador',4500);

#INSERT TABLE DEPARTAMENTO
insert into departamento(cod_depto,nome,sigla) values
(1,'Informatica','INF'),
(2,'Financeiro','FIN'),
(3,'Pessoal','RH');

#INSERT TABLE FUNCIONARIO
insert into funcionario(cod_func, nome, data_adm, sexo, cod_cargo, cod_depto) values
(1, 'João Nogueira', '2008/03/12','M',1,1),
(2, 'Maria Silveira', '2008/03/20','F',4,3),
(3, 'Marcos Silva', '2008/07/05','M',2,1),
(4, 'Gabriel Pereira', '2008/07/10','M',5,2),
(5, 'Carla Junqueira', '2008/08/15','M',1,1),
(6, 'Janete Rosa','2008/10/01','F',4,3),
(7, 'Fernando Silva','2009/02/03','M',3,1),
(8, 'Marília Vieira','2009/02/05','F',2,1),
(9, 'Patrícia Chaves','2009/03/01','F',5,2),
(10,'João Marques','2008/03/15','M',3,1);

#SELECTS
select * from funcionario;
select * from departamento;
select * from cargo;