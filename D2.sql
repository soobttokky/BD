create table d2.disciplina(
	nome varchar(100),
	codigo integer primary key
);
create table d2.curso(
	codigo integer primary key,
	nome varchar(100)
);
create table d2.curriculo(
	opc varchar(100),
	codigodisc integer,
	codigocurso integer,
	foreign key (codigodisc) references d2.disciplina(codigo),
	foreign key (codigocurso) references d2.curso(codigo)
);
insert into d2.disciplina (nome, codigo) values ('BD',01);
insert into d2.disciplina (nome, codigo) values ('POO',02);
insert into d2.disciplina (nome, codigo) values ('ED',03);
insert into d2.disciplina (nome, codigo) values ('GP',04);

insert into d2.curso (nome, codigo) values ('CCO',275);
insert into d2.curso (nome, codigo) values ('ADS',413);
insert into d2.curso (nome, codigo) values ('EDD',154);
insert into d2.curso (nome, codigo) values ('RH',043);

insert into d2.curriculo (opc, codigodisc, codigocurso) values ('obrigatorio',01,275);
insert into d2.curriculo (opc, codigodisc, codigocurso) values ('opcional',02,043);
insert into d2.curriculo (opc, codigodisc, codigocurso) values ('obrigatorio',03,154);
insert into d2.curriculo (opc, codigodisc, codigocurso) values ('opcional',04,275);

select (nome) from d2.disciplina;
select * from d2.curso;
select * from d2.curriculo;

insert into d2.curso (nome, codigo) values ('AVS',321);
select (nome) from d2.curso where (codigo = 321);

insert into d2.curso (nome, codigo) values ('BDD',1412)
select (nome) from d2.curso where nome like 'B%'
select (nome) from d2.disciplina where nome like 'B%'

alter table d2.disciplina
	add numero numeric(50,1)
select * from d2.disciplina 

update d2.disciplina set numero = 50 where codigo=4
select * from d2.disciplina 

select avg(numero) from d2.disciplina
select avg(numero) as media from d2.disciplina

select (codigo) from d2.disciplina where nome = 'BD' or nome = 'POO'

select c.nome from d2.disciplina d, d2.curso c, d2.curriculo w 
where w.codigocurso= c.codigo 
AND w.codigodisc=d.codigo 
AND d.codigo =2
		foreign key (codigodisc) references d2.disciplina(codigo),
		foreign key (codigocurso) references d2.curso(codigo)
