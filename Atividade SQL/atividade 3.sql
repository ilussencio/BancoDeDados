select max(c.salario)
from funcionario f join departamento d on f.cod_depto = d.cod_depto 
	join cargo c on c.cod_cargo = f.cod_cargo
where d.nome = 'Pessoal';


select sum(c.salario)
from funcionario f join departamento d on f.cod_depto = d.cod_depto 
	join cargo c on c.cod_cargo = f.cod_cargo
where d.nome = 'Financeiro';


select count(*)
from funcionario f join departamento d on f.cod_depto = d.cod_depto 
	join cargo c on c.cod_cargo = f.cod_cargo
where d.nome = 'Informática';

select min(c.salario)
from funcionario f join departamento d on f.cod_depto = d.cod_depto 
	join cargo c on c.cod_cargo = f.cod_cargo
where d.nome = 'Informática';

select max(c.salario) maior_salario, min(c.salario) menor_salario, avg(c.salario) media_salario, sum(c.salario) soma_salario
from funcionario f join departamento d on f.cod_depto = d.cod_depto 
	join cargo c on c.cod_cargo = f.cod_cargo
where d.nome = 'Informática';

select count(*)
from funcionario f join departamento d on f.cod_depto = d.cod_depto
where d.nome in ('Financeiro','Pessoal') and f.sexo = 'F';
select * from funcionario;

select avg(c.salario)
from funcionario f join cargo c on c.cod_cargo = f.cod_cargo
where year(f.data_adm) = 2008 and month(f.data_adm) <= 6;

select count(*)
from funcionario f join cargo c on c.cod_cargo = f.cod_cargo
where c.salario < 2000;













