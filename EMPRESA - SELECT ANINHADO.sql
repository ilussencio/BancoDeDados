use empresa;

select nome
from departamento
where cod_depto in (
    select cod_depto
    from funcionario);

select distinct d.nome
from departamento d join funcionario f on d.cod_depto = f.cod_depto;

-- listar o nome e nivel dos cargos que possuem funcionarios
SELECT nome, nivel
FROM cargo
where cod_cargo in (
    select cod_cargo from funcionario
    );

-- listar o nome e nivel dos cargos que não possuem funcionarios
SELECT nome, nivel
FROM cargo
where cod_cargo not in (
    select cod_cargo from funcionario
);

-- Listar o nome e sexo dos funcionarios juntamente com o nome do seu departamento
select f.nome, f.sexo, d.nome
from funcionario f, departamento d
where f.cod_depto = d.cod_depto;

select f.nome, f.sexo, d.nome
from funcionario f join departamento d on f.cod_depto = d.cod_depto;

-- Listar o nome e sexo do funcionarios que sao dev pleno
select f.nome, f.sexo
from funcionario f
where f.cod_cargo = (
    select c.cod_cargo from cargo c where c.nome = 'Desenvolvedor' and c.nivel = 'Pleno'
    )

-- Listar os dados dos funcionarios, exceto daqueles que sao atendentes
select f.*
from funcionario f
where f.cod_cargo != (
    select c.cod_cargo from cargo c where c.nome = 'Atendente'
    )

-- Listar o nome, sexo e data de admissão dos funcionario que foram contratador apos o Gabriel Pereira
select f.nome, f.sexo, f.data_adm
from funcionario f
where f.data_adm > (
    select data_adm from funcionario where nome = 'Gabriel Pereira'
    )

-- Listar os dados do funcionario contratado mais recentemente pela empresa
select * from funcionario
where data_adm = (
    select max(data_adm) from funcionario
          )

-- Listar os dados dos funcionarios que recebem o menor salario na empresa
select f.*
from funcionario f join cargo c on f.cod_cargo = c.cod_cargo
where c.salario = (
    select min(salario) from cargo
    );

-- Listar os dados dos funcionarios que recebem o menor salario e sao do departamento de informatica
select f.*
from funcionario f join cargo c on f.cod_cargo = c.cod_cargo
join departamento d2 on f.cod_depto = d2.cod_depto
where d2.nome = 'Informática' and c.salario = (
    select min(c.salario)
    from cargo c, funcionario f, departamento d
    where f.cod_cargo = c.cod_cargo and f.cod_depto = d.cod_depto and d.nome = 'Informática'
);

select f.*
from funcionario f, cargo c
where f.cod_cargo = c.cod_cargo and c.salario = (
    select max(c.salario)
    from cargo c, funcionario f2
    where f.cod_cargo = c.cod_cargo and f.sexo = 'F'
    )
and f.sexo = 'F';

