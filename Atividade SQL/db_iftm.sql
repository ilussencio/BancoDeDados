use academico;

select a.nome, a.mat, c.nome
from aluno a inner join curso c on a.cod_curso = c.cod_curso;

select a.nome, a.mat, c.nome
from aluno a inner join curso c on a.cod_curso = c.cod_curso
where a.entrada like '2016%';

select a.nome, d.nome, h.media
from aluno a inner join historico h on a.mat = h.mat inner join disciplina d on d.cod_disc = h.cod_disc;

select p.nome, d.nome
from alocacao a inner join turma t on t.cod_turma = a.cod_turma
	inner join disciplina d on d.cod_disc = a.cod_disp
    inner join professor p on p.cod_prof = a.cod_prof
where t.ano = '2016';

select d.nome, dr.nome
from pre_req p inner join disciplina d on d.cod_disc = p.cod_disc
	inner join disciplina dr on p.cod_disc_req = dr.cod_disc;