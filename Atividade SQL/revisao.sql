#EXERCICIO DE REVISÃO
create database clinica;
use clinica;
create table medico(
	codm int not null auto_increment,
    nomem varchar(100),
    especialidade varchar(100),
    sexo varchar(100),
    dt_nasc date,
    primary key (codm)
);

create table paciente(
	codp int not null auto_increment,
    nomep varchar(100),
    dt_nasc date,
    problema varchar(100),
    sexo varchar(100),
    primary key(codp)
);

create table consulta(
	codc int not null auto_increment,
    codm int,
    codp int,
    data_consulta date,
    hora_consulta varchar(100),
    valor_consulta float,
    primary key(codc),
    foreign key (codm) references medico(codm),
    foreign key (codp) references paciente(codp)
);
desc consulta;

insert into medico(nomem, especialidade,sexo,dt_nasc) values
('Claudia Avila', 'Ginecologista', 'F', '1960-08-10'),
('Claudio Felix', 'Oftalmologista', 'M', '1970-01-02'),
('Luciano Fernandes', 'Ginecologista', 'M', '1980-03-04'),
('Manoel Jose', 'Cardiologista', 'M', '1964-11-15'),
('Marcos Paulo', 'Neurologista', 'M', '1975-07-12'),
('Maria Jose', 'Cardiologista', 'F', '1974-12-13'),
('Roberto Carlos', 'Neuropediatra', 'M', '1977-06-05');

insert into paciente(nomep, dt_nasc, problema, sexo) value
('Maria Paula', '1960-08-19','Cardiaco', 'F'),
('Maria do Carmo', '1979-03-10','Hipertensao', 'F'),
('Luiz Inacio', '1950-01-12', 'Diabetes', 'M'),
('Carolina Freitas', '1985-11-05','Miopia', 'F'),
('Luiz Marcelo', '1973-05-15', 'Cardiaco', 'M'),
('Luciano Fernandes', '1980-03-04','Cardiaco', 'M');

insert into consulta(codm, codp,data_consulta,hora_consulta, valor_consulta) values
(1, 2, '2017-06-10', '16:00:00', 150.00),
(3, 1, '2017-06-15', '14:00:00', 180.00),
(3, 2, '2017-06-22', '14:00:00', 150.00),
(1, 1, '2017-06-25', '16:00:00', 150.00),
(4, 5, '2017-06-27', '15:00:00', 130.00),
(2,4, '2017-07-10', '13:00:00', 180.00),
(1, 2, '2017-07-12', '15:00:00', 180.00),
(4, 5, '2017-07-14', '14:00:00', 150.00),
(5, 3, '2017-07-17', '16:30:00', 130.00),
(5, 2, '2017-07-20', '15:00:00', 180.00),
(6, 4, '2017-07-23', '14:00:00', 150.00),
(6, 6, '2017-07-25', '15:00:00', 140.00),
(3, 2, '2017-08-22', '13:00:00', 180.00),
(1, 1, '2017-08-25', '13:00:00', 180.00),
(4, 5, '2018-01-22', '13:00:00', 250.00),
(5, 3, '2018-01-25', '13:00:00', 230.00),
(6, 4, '2019-06-22', '13:00:00', 300.00),
(1, 2, '2019-06-25', '13:00:00', 300.00);

#2 a)
select sum(c.valor_consulta)
from consulta c join medico d on c.codm = d.codm
where d.sexo = 'F' and month(c.data_consulta) = 6 and year(c.data_consulta) = 2017;

# b)
select max(valor_consulta), min(valor_consulta), avg(valor_consulta)
from consulta
where month(data_consulta) in (6,7) and year(data_consulta) = 2017;

# c)
select p.nomep, count(*)
from consulta c join paciente p on c.codp = p.codp
where p.problema = 'Hipertensao'
group by p.nomep;

# d)
select count(*)
from consulta c join medico m on c.codm = m.codm
where year(c.data_consulta) = 2017 and m.especialidade = 'Neurologista';

# e)
select sum(c.valor_consulta)
from consulta c join medico m on c.codm = m.codm
where m.nomem = 'Maria Jose' and year(data_consulta) = 2017 and month(data_consulta) = 7;

# f)
select p.nomep, m.nomem, c.data_consulta, c.hora_consulta
from consulta c join medico m on c.codm = m.codm
	join paciente p on c.codp = p.codp
where year(c.data_consulta) = 2017 and month(c.data_consulta) = 6;


# 3 - a)
select m.nomem, year(c.data_consulta), count(*)
from consulta c join medico m on c.codm = m.codm
group by m.nomem, year(c.data_consulta);

# b)
select m.especialidade, sum(c.valor_consulta)
from consulta c join medico m on c.codm = m.codm
group by m.especialidade
order by c.valor_consulta desc;

# c)
select month(c.data_consulta), m.nomem, sum(c.valor_consulta)
from consulta c join medico m on c.codm = m.codm
group by 1,2
order by m.nomem;

# d)
select m.nomem, year(c.data_consulta), count(*), avg(c.valor_consulta)
from consulta c join medico m on c.codm = m.codm
group by m.nomem, year(c.data_consulta);

# e)
select problema, count(*)
from paciente
group by problema;

# f)
select m.nomem, max(c.valor_consulta), min(c.valor_consulta)
from medico m join consulta c on m.codm = c.codm
where year(c.data_consulta) = 2017
group by m.nomem;

# g)
select m.nomem, count(*)
from medico m join consulta c on m.codm = c.codm
group by m.nomem
order by m.nomem asc;

# h)
select m.nomem, count(c.data_consulta), avg(c.valor_consulta)
from medico m join consulta c on m.codm = c.codm
where year(c.data_consulta) = 2017
group by m.nomem
having count(*) > 1;

# i)
select m.nomem, year(c.data_consulta), sum(c.valor_consulta)
from medico m join consulta c on m.codm = c.codm
group by 1,2
having avg(c.valor_consulta) > 145 and count(*) > 1;

# j)
select m.especialidade, min(c.valor_consulta), max(c.valor_consulta)
from medico m join consulta c on m.codm = c.codm
group by 1;

# k)
select m.especialidade, sum(c.valor_consulta)
from medico m join consulta c on m.codm = c.codm
group by m.especialidade;

# l)
select p.nomep, year(c.data_consulta), sum(c.valor_consulta)
from paciente p join consulta c on p.codp = c.codp
group by p.codp, year(c.data_consulta);

# m)
select p.sexo, count(*), sum(c.valor_consulta)
from paciente p join consulta c on p.codp = c.codp
group by p.sexo;