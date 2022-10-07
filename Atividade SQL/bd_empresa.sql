use empresa;

select f.nome, f.sexo
from cargo c inner join funcionario f on c.cod_cargo = f.cod_cargo
where c.nome = "Desenvolvedor";

select f.nome, d.sigla
from funcionario f inner join departamento d on f.cod_depto = d.cod_depto;

select f.nome, f.sexo, c.salario
from funcionario f inner join cargo c on f.cod_cargo = c.cod_cargo
where year(f.data_adm) = 2009;

select f.nome, f.data_adm, d.nome
from funcionario f inner join departamento d on f.cod_depto = d.cod_depto
where f.sexo = 'F';

select f.cod_func, f.nome, f.data_adm, f.sexo, c.nome, d.nome
from funcionario f inner join departamento d on f.cod_depto = d.cod_depto inner join cargo c on f.cod_cargo = c.cod_cargo
where d.nome in ('Informática','Financeiro');

select f.nome, c.nome, c.salario, d.nome
from funcionario f inner join departamento d on f.cod_depto = d.cod_depto inner join cargo c on f.cod_cargo = c.cod_cargo
where c.nivel = 'JR' and year(f.data_adm) = 2008;