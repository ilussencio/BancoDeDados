use empresa;

set sql_safe_updates = 0;

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
    );

-- Listar os dados dos funcionarios, exceto daqueles que sao atendentes
select f.*
from funcionario f
where f.cod_cargo != (
    select c.cod_cargo from cargo c where c.nome = 'Atendente'
    );

-- Listar o nome, sexo e data de admissão dos funcionario que foram contratador apos o Gabriel Pereira
select f.nome, f.sexo, f.data_adm
from funcionario f
where f.data_adm > (
    select data_adm from funcionario where nome = 'Gabriel Pereira'
    );

-- Listar os dados do funcionario contratado mais recentemente pela empresa
select * from funcionario
where data_adm = (
    select max(data_adm) from funcionario
          );

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

select d.*
from departamento d
where exists(
    select * from funcionario f
    where d.cod_depto = f.cod_depto
          );


-- Listar as informacoes dos cargos que nao possuem funcionarios
select c.*
from cargo c
where not exists(
    select * from funcionario f where f.cod_cargo = c.cod_cargo
    );

-- Criar uma tabela custocargo com o código, nome dos cargos e o custo efetivo por cargo(que e o dobro do salario, mais 10% do valor mesmo)
create table custo_cargo(
    cod_cargo int auto_increment,
    nome varchar(40),
    nivel varchar(40),
    custo_efetivo float,
    primary key (cod_cargo)
);

insert into custo_cargo(cod_cargo, nome, nivel, custo_efetivo)
select cod_cargo, nome, nivel, (salario*2.1)
from cargo;

-- Atualizar o nome do cargo de contador para gerente contabil
update cargo set nome = 'Gerente Contábil' where nome = 'Contador';

-- Atualizar o nome do cargo e o salario do Atendente para Assistente de telemarketing, com novo salario de 1200
update cargo set nome = 'Assistente de Telemarketing', salario = 1200 where nome = 'Atendente';

use empresa;
-- Atualiza o salario de todos dos cargos nivel jr em 15%
update cargo set salario = salario * 1.15 where nivel = 'JR';

-- Atualizar as siglas dos departamentos incluindo a letra D no inicio
update departamento
set nome = concat('D', sigla);

insert into departamento(cod_depto,nome,sigla)
values (5,'Marketing','MKT'),
       (6,'Logistica','LOG');

-- Os departamentos de Marketing e Comercial não vão mais fazer parte da empresa, dê o comando para excluir estes departamentos
delete from departamento where nome in('Marketing');
delete from departamento where nome in('Logistica');

delete from departamento where nome in('Informatica');

