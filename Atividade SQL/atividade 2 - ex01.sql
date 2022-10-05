#EXERCICIO 01
select cod_cargo, cod_depto, nome
from funcionario
where year(data_adm) = 2008;

select nome
from cargo
where salario between 2000 and 5000;

select nome, salario
from cargo
where salario >= 3000;

select *
from funcionario
where nome = 'Fernando Silva';

select *
from funcionario
where nome like "%eira";

select *
from funcionario
where nome like "% Silv%";

select nome, data_adm
from funcionario
where nome like 'P%' or nome like 'M%';

select nome, data_adm
from funcionario
where nome not like 'J%' or nome not like 'G%';

select nome, sexo
from funcionario
where nome like '% Silva';

select cod_depto, sigla
from departamento
where nome in ('Informatica','Financeiro');

select cod_func, nome
from funcionario
where sexo not in ('F') and cod_depto not in (1,3);

select cod_cargo, nome, salario
from cargo
where nome in ('Atendente','Contador','Desenvolvedor');



