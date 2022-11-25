use VoeBem;

insert into companhia(nome_comp, sigla) values 
('TAM Linhas aéreas', 'TAM'),
('GOL Linhas aéreas', 'GOL'),
('TAP Linhas aéreas', 'TAP');

insert into piloto(nome_piloto,salario,gratificacao,cod_cia,pais,email) values
('Roberto Carlos', 5000.00, 2000.00, 1, 'Brasil','beto@gmail.com'),
('Rafael Marinho', 6000.00, 3000,2,'Brasil','rafa@gmail.com'),
('Marcos Jose', 4000, 1000, 3, 'Brasil', 'marcos@gmail.com'),
('Daniel Oliveria', 4000, 1500, 1, 'Brasil', 'dani@gmail.com');

insert into aeroporto(codigo_aeroporto, nome_aeroporto, cidade_aeroporto, pais) values
('001', 'Trancredo Neves', 'Confins', 'Brasil'),
('002', 'Internacional de São Paulo - Guarulhos', 'Guarulhos', 'Brasil'),
('003', 'Cesar Bombonato', 'Uberlândia', 'Brasil');

insert into voo(codigo,aeroporto_origem, aeroporto_destino, hora) values
('A200','001','002','07:00'),
('A100','002','003','12:00'),
('A300','003','001','23:00'),
('A400','003','002','16:00'),
('A500','001','003','07:00'),
('A600','001','002','11:00');

insert into escala(codigo_voo, data_voo, codigo_piloto, aviao) values
('A200', '2018/05/12', 1, 'Boing 385'),
('A100', '2018/05/12', 4, 'Boing 385'),
('A300', '2018/05/13', 2, 'Airbus 232'),
('A400', '2018/06/14', 3, 'Airbus 123'),
('A500', '2018/06/15', 1, 'Airbus 123'),
('A600', '2018/06/17', 2, 'Boing 385');

	

