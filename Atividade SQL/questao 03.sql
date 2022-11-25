# a)
select * 
from piloto p inner join companhia c on p.cod_cia = c.cod_cia
where c.sigla in ("TAM","TAP");

# b)
select a.cidade_aeroporto, 	v.hora
from voo v inner join aeroporto a on v.aeroporto_destino = a.codigo_aeroporto
where v.codigo = "A200";

# c)
select v.codigo, e.data_voo, v.hora
from voo v inner join aeroporto a on v.aeroporto_destino = a.codigo_aeroporto
	inner join escala e on e.codigo_voo = v.codigo
where a.cidade_aeroporto = "Guarulhos";

# d)
select ds.nome_aeroporto, v.hora
from voo v inner join aeroporto a on v.aeroporto_origem = a.codigo_aeroporto
	inner join aeroporto ds on v.aeroporto_origem = ds.codigo_aeroporto
where a.cidade_aeroporto = "Uberlândia" and v.hora >= '12:00:00' and v.hora <= '23:59:00';

# e)
select count(*)
from voo v inner join aeroporto a on v.aeroporto_origem = a.codigo_aeroporto
	inner join escala e on e.codigo_voo = v.codigo
where a.cidade_aeroporto = "Uberlândia" and month(e.data_voo) in (5,6);

# f) 
select p.nome_piloto, c.sigla, v.codigo, e.data_voo, o.nome_aeroporto, d.nome_aeroporto
from piloto p inner join companhia c on p.cod_cia = c.cod_cia
	inner join escala e on e.codigo_piloto = p.codigo_piloto
    inner join voo v on e.codigo_voo = v.codigo
    inner join aeroporto o on v.aeroporto_origem = o.codigo_aeroporto
    inner join aeroporto d on v.aeroporto_destino = d.codigo_aeroporto;

# g)
select min(salario), max(salario), avg(salario), min(gratificacao), max(gratificacao), avg(gratificacao)
from piloto;

# h)
select c.sigla, count(codigo_voo)
from escala e inner join piloto p on e.codigo_piloto = p.codigo_piloto
	inner join companhia c on p.cod_cia = c.cod_cia
    inner join voo v on e.codigo_voo = v.codigo
group by c.sigla;
    
# i) nome do piloto, 
select p.nome_piloto, count(*) ct
from piloto p inner join companhia c on p.cod_cia = c.cod_cia
	inner join escala e on p.codigo_piloto = e.codigo_piloto
    inner join voo v on v.codigo = e.codigo_voo
group by p.nome_piloto 
having ct >= 2;

# j)
select nome_piloto, salario, gratificacao
from piloto
order by salario desc;




