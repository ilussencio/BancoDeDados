select d.nome ,min(c.salario), max(c.salario)
from funcionario f join cargo c on f.cod_cargo = c.cod_cargo
	join departamento d on d.cod_depto = f.cod_depto
group by 1
order by 1;


select year(data_adm), month(data_adm), count(*)
from funcionario
group by 1,2
order by 1,2;

select nome, count(nivel)
from cargo
group by nome;

select d.nome, sum(c.salario) soma
from funcionario f join cargo c on f.cod_cargo = c.cod_cargo
	join departamento d on d.cod_depto = f.cod_depto
group by d.nome
order by soma desc;

select d.nome, min(f.data_adm) menor, max(f.data_adm) maior
from funcionario f join departamento d on d.cod_depto = f.cod_depto
group by d.nome;

select d.nome, f.sexo, count(*)
from funcionario f join departamento d on d.cod_depto = f.cod_depto
group by d.nome, f.sexo
order by d.nome;

select c.nome, sum(c.salario)
from funcionario f join cargo c on f.cod_cargo = c.cod_cargo
group by c.nome
order by c.nome;

select c.nome, c.nivel, sum(c.salario)
from funcionario f join cargo c on f.cod_cargo = c.cod_cargo
 join departamento d on d.cod_depto = f.cod_depto
 where d.nome = 'Informática'
group by c.nome, c.nivel;


	
    






