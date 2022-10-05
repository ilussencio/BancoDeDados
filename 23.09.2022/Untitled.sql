use empresa;
show tables;
#TABELA CARGO/DEPARTAMENTO/FUNCIONARIO
select 
* from 
funcionario;

select nome, sexo
from
funcionario;

select nome, cod_cargo
from funcionario
where sexo = 'M';

select cod_func, nome
from funcionario
where sexo = 'M' and cod_depto = 1;

select cod_cargo, cod_depto, nome, data_adm
from funcionario
where sexo = 'F' and data_adm >= '2008-01-01' and data_adm <= '2008-12-31';

select * from cargo;

select nome
from cargo
where salario >= 2000 and salario <= 5000;

select nome, salario
from cargo
where salario >= 3000;

select *
from funcionario
where nome = "Fernando Silva";

select * from funcionario;

select nome, cod_cargo, data_adm
from funcionario
where data_adm between '2009-01-01' and '2009-12-31';

select nome, cod_cargo, data_adm
from funcionario
where sexo = 'F' and data_adm between '2008-01-01' and '2008-12-31';

select *
from funcionario
where nome like "%o %";

select *
from funcionario
where nome like "j%";

select *
from funcionario
where nome like "% S%";

select *
from funcionario
where nome like "_____________";

select *
from cargo
where nome not like "%dor";

select *
from funcionario
where nome like "%eira %";

select *
from funcionario
where nome like "%a %" and nome like "%a";

select *
from funcionario
where cod_depto in (2,3);

select *
from funcionario
where cod_cargo not in (1,2);

select *
from cargo
where nome in ("Atendente","Contador");

select *
from departamento
where nome in ("Financeiro","Pessoal");

select nome
from funcionario
where sexo not in ("F");

select nome, data_adm
from funcionario
where cod_depto not in (1,2);

select *
from funcionario
where data_adm is null;

select *
from cargo
where nivel is not null;

select *
from funcionario
where data_adm like "2008%";

select *
from funcionario
where data_adm like "%-03%-";

select nome, cod_cargo, data_adm
from funcionario
where data_adm like "2009-%" and sexo = 'F';

select nome, cod_cargo, data_adm
from funcionario
where data_adm like "%-02-%";

select nome, cod_cargo, data_adm
from funcionario
where year(data_adm) = 2009 and sexo = 'F';

select nome, cod_cargo, data_adm
from funcionario
where month(data_adm) = 2;

select * from departamento;
select * from cargo;
select * from funcionario;
