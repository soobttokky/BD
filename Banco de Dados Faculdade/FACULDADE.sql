/*Criação de tabelas*/

CREATE TABLE faculdade.turno (
	IDturno integer primary key,
	Nome varchar (100)
);

CREATE TABLE faculdade.materia(
	IDmateria integer primary key,
	carga_hor integer,
	media numeric
);

CREATE TABLE faculdade.departamento (
	IDdept integer primary key,
	nome varchar (100),
	orcamento integer
);

CREATE TABLE faculdade.salario (
	IDsal integer primary key,
	grausal varchar (100),
	valor_sal integer
);

CREATE TABLE faculdade.curso(
	IDcurso serial primary key,
	IDmodalidade integer,
	IDtipo integer,
	nome varchar (100),
	horascomp integer,
	carghor integer,
	qtsem integer ,
	tipocur varchar(100),
	tipomod varchar (100),
	IDturno integer,
	FOREIGN KEY (IDturno) REFERENCES faculdade.turno (IDturno)
	
);

CREATE TABLE faculdade.funcionario (
	IDfunc integer primary key,
	IDsal integer,
	admissao date,
	data_nasc date,
	nome varchar (100),
	IDdept integer,
	FOREIGN KEY (IDdept) REFERENCES faculdade.departamento (IDdept),
	FOREIGN KEY (IDsal) REFERENCES faculdade.salario (IDsal)
);

CREATE TABLE faculdade.professor (
	IDprof serial primary key,
	CPF integer,
	dependentes varchar (100),
	dataingr date,
	datanasc date,
	nome varchar,
	IDfunc integer,
	IDsal integer,
	IDdept integer,
	FOREIGN KEY (IDdept) REFERENCES faculdade.departamento (IDdept),
	FOREIGN KEY (IDfunc) REFERENCES faculdade.funcionario (IDfunc),
	FOREIGN KEY (IDsal) REFERENCES faculdade.salario (IDsal)
);

CREATE TABLE faculdade.mensalidade(
	IDmensalidade integer primary key,
	valormens integer,
	IDcurso integer,
	FOREIGN KEY (IDcurso) REFERENCES faculdade.curso (IDcurso)
);


CREATE TABLE faculdade.aluno (
	RGM serial primary key,
	CPF serial,
	data_nas date,
	nome varchar(1000),
	IDcurso integer,
	IDturno integer,
	IDmensalidade integer,
	FOREIGN KEY (IDcurso) REFERENCES faculdade.curso (IDcurso),
	FOREIGN KEY (IDturno) REFERENCES faculdade.turno (IDturno),
	FOREIGN KEY (IDmensalidade) REFERENCES faculdade.mensalidade(IDmensalidade)
);

CREATE TABLE faculdade.endereco (
	cep integer primary key,
	uf varchar (100),
	bairro varchar (100),
	cidade varchar (100),
	numero integer,
	RGM integer,
	IDprof integer,
	FOREIGN KEY (RGM) REFERENCES faculdade.aluno (RGM),
	FOREIGN KEY (IDprof) REFERENCES faculdade.professor (IDprof)
);

CREATE TABLE faculdade.campus(
	IDcampus integer primary key,
	cep integer,
	qtd_max_aluno integer,
	FOREIGN KEY (cep) REFERENCES faculdade.endereco (cep)
);

CREATE TABLE faculdade.sala(
	IDsala integer primary key,
	qtdlabenf integer,
	qtdsala integer,
	qtdlabbio integer,
	IDcampus integer,
	FOREIGN KEY (IDcampus) REFERENCES faculdade.campus (IDcampus)
);

CREATE TABLE faculdade.contem(
	IDcurso integer,
	IDmateria integer,
	FOREIGN KEY (IDcurso) REFERENCES faculdade.curso (IDcurso),
	FOREIGN KEY (IDmateria) REFERENCES faculdade.materia(IDmateria)
);

CREATE TABLE faculdade.formacao (
	IDformacao integer primary key,
	tipo varchar (100),
	Nome varchar (100),
	IDprof integer,
	FOREIGN KEY (IDprof) REFERENCES faculdade.professor (IDprof)
);

CREATE TABLE faculdade.coordenacao (
	IDcoordenacao integer primary key,
	nomecoord varchar (100),
	IDcoordenador integer,
	IDsal integer,
	IDfunc integer,
	IDdept integer,
	FOREIGN KEY (IDfunc) REFERENCES faculdade.funcionario (IDfunc),
	FOREIGN KEY (IDsal) REFERENCES faculdade.salario (IDsal),
	FOREIGN KEY (IDdept) REFERENCES faculdade.departamento (IDdept)
);

CREATE TABLE faculdade.coordena (
	IDprof integer,
	IDcoordenacao integer,
	FOREIGN KEY (IDprof) REFERENCES faculdade.professor (IDprof),
	FOREIGN KEY (IDcoordenacao) REFERENCES faculdade.coordenacao (IDcoordenacao)
);

CREATE TABLE faculdade.funciona (
	IDcurso integer,
	IDturno integer,
	FOREIGN KEY (IDcurso) REFERENCES faculdade.curso (IDcurso),
	FOREIGN KEY (IDturno) REFERENCES faculdade.turno (IDturno)
);

CREATE TABLE faculdade.contato (
	IDcontato integer primary key,
	telefone integer,
	email varchar (100),
	IDprof integer,
	RGM integer,
	IDfunc integer,
	FOREIGN KEY (IDfunc) REFERENCES faculdade.funcionario (IDfunc),
	FOREIGN KEY (IDprof) REFERENCES faculdade.professor (IDprof),
	FOREIGN KEY (RGM) REFERENCES faculdade.aluno (RGM)
);

CREATE TABLE faculdade.leciona ( 
	IDmateria integer,
	IDprof integer,
	RGM integer,
	FOREIGN KEY (IDmateria) REFERENCES faculdade.materia (IDmateria),
	FOREIGN KEY (IDprof) REFERENCES faculdade.professor (IDprof),
	FOREIGN KEY (RGM) REFERENCES faculdade.aluno (RGM)
);

CREATE TABLE faculdade.estudo (
	IDmateria integer,
	RGM integer,
	FOREIGN KEY (IDmateria) REFERENCES faculdade.materia (IDmateria),
	FOREIGN KEY (RGM) REFERENCES faculdade.aluno (RGM)
);

/*População de tabelas*/

select * from faculdade.curso;

/*Tabela Turno*/
INSERT INTO faculdade.turno (IDturno, Nome)
VALUES (01, 'Matutino');
INSERT INTO faculdade.turno (IDturno, Nome)
VALUES (02,'Vespertino');
INSERT INTO faculdade.turno (IDturno, Nome)
VALUES (03, 'Noturno');
INSERT INTO faculdade.turno (IDturno, Nome)
VALUES (04, 'Diurno');

/*Tabela Curso*/
INSERT INTO faculdade.curso (IDmodalidade, IDtipo, nome, horascomp, carghor, qtsem, tipocur, tipomod, IDturno) 
VALUES (1, 1, 'Ciencia da Computação', 80, 3200, 8, 'Bacharelado', 'Presencial', 01);
INSERT INTO faculdade.curso (IDmodalidade, IDtipo, nome, horascomp, carghor, qtsem, tipocur, tipomod, IDturno) 
VALUES (1, 1, 'Ciencia da Computação', 80, 3200, 8, 'Bacharelado', 'Presencial', 03);
INSERT INTO faculdade.curso (IDmodalidade, IDtipo, nome, horascomp, carghor, qtsem, tipocur, tipomod, IDturno) 
VALUES (1, 3, 'Analise e Desenvolvimento de Sistemas', 120, 1600, 4, 'Tecnologo', 'Presencial', 01);
INSERT INTO faculdade.curso (IDmodalidade, IDtipo, nome, horascomp, carghor, qtsem, tipocur, tipomod, IDturno) 
VALUES (1, 3, 'Analise e Desenvolvimento de Sistemas', 120, 1600, 4, 'Tecnologo', 'Presencial', 03);
INSERT INTO faculdade.curso (IDmodalidade, IDtipo, nome, horascomp, carghor, qtsem, tipocur, tipomod, IDturno) 
VALUES (1, 1, 'Enfermagem', 80, 4000, 10, 'Bacharelado', 'Presencial', 04);
INSERT INTO faculdade.curso (IDmodalidade, IDtipo, nome, horascomp, carghor, qtsem, tipocur, tipomod, IDturno) 
VALUES (1, 2, 'Letras Ingles', 140, 3485, 8, 'Licenciatura', 'Presencial', 02);
INSERT INTO faculdade.curso (IDmodalidade, IDtipo, nome, horascomp, carghor, qtsem, tipocur, tipomod, IDturno) 
VALUES (1, 2, 'Letras Ingles', 140, 3485, 8, 'Licenciatura', 'Presencial', 03);
INSERT INTO faculdade.curso (IDmodalidade, IDtipo, nome, horascomp, carghor, qtsem, tipocur, tipomod, IDturno) 
VALUES (2, 3, 'Design Grafico', 120, 3485, 4, 'Tecnologo', 'EAD', 04);
INSERT INTO faculdade.curso (IDmodalidade, IDtipo, nome, horascomp, carghor, qtsem, tipocur, tipomod, IDturno) 
VALUES (1, 1, 'Arquitetura', 80, 3600, 8, 'Bacharelado', 'Presencial', 02);
INSERT INTO faculdade.curso (IDmodalidade, IDtipo, nome, horascomp, carghor, qtsem, tipocur, tipomod, IDturno) 
VALUES (1, 1, 'Arquitetura', 80, 3600, 8, 'Bacharelado', 'Presencial', 01);
INSERT INTO faculdade.curso (IDmodalidade, IDtipo, nome, horascomp, carghor, qtsem, tipocur, tipomod, IDturno) 
VALUES (1, 2, 'Matematica', 140, 3360, 8, 'Licenciatura', 'Presencial', 01);
INSERT INTO faculdade.curso (IDmodalidade, IDtipo, nome, horascomp, carghor, qtsem, tipocur, tipomod, IDturno) 
VALUES (1, 2, 'Matematica', 140, 3360, 8, 'Licenciatura', 'Presencial', 03);
INSERT INTO faculdade.curso (IDmodalidade, IDtipo, nome, horascomp, carghor, qtsem, tipocur, tipomod, IDturno) 
VALUES (1, 1, 'Administração', 80, 3000, 8, 'Bacharelado', 'Presencial', 01);
INSERT INTO faculdade.curso (IDmodalidade, IDtipo, nome, horascomp, carghor, qtsem, tipocur, tipomod, IDturno) 
VALUES (1, 1, 'Administração', 80, 3000, 8, 'Bacharelado', 'Presencial', 02);
INSERT INTO faculdade.curso (IDmodalidade, IDtipo, nome, horascomp, carghor, qtsem, tipocur, tipomod, IDturno) 
VALUES (1, 1, 'Relações Internacionais', 80, 2940, 8, 'Bacharelado', 'Presencial', 03);
INSERT INTO faculdade.curso (IDmodalidade, IDtipo, nome, horascomp, carghor, qtsem, tipocur, tipomod, IDturno) 
VALUES (1, 1, 'Relações Internacionais', 80, 2940, 8, 'Bacharelado', 'Presencial', 01);
INSERT INTO faculdade.curso (IDmodalidade, IDtipo, nome, horascomp, carghor, qtsem, tipocur, tipomod, IDturno) 
VALUES (1, 3, 'Design de Moda', 120, 1680, 8, 'Tecnologo', 'Presencial', 01);
INSERT INTO faculdade.curso (IDmodalidade, IDtipo, nome, horascomp, carghor, qtsem, tipocur, tipomod, IDturno) 
VALUES (1, 1, 'Turismo', 80, 3200, 8, 'Bacharelado', 'Presencial', 02);
INSERT INTO faculdade.curso (IDmodalidade, IDtipo, nome, horascomp, carghor, qtsem, tipocur, tipomod, IDturno) 
VALUES (2, 1, 'Publicidade e Propaganda', 80, 2720, 6, 'Bacharelado', 'EAD', 04);
INSERT INTO faculdade.curso (IDmodalidade, IDtipo, nome, horascomp, carghor, qtsem, tipocur, tipomod, IDturno) 
VALUES (1, 1, 'Medicina Veterinaria', 80, 4000, 10, 'Bacharelado', 'Presencial', 04);
INSERT INTO faculdade.curso (IDmodalidade, IDtipo, nome, horascomp, carghor, qtsem, tipocur, tipomod, IDturno) 
VALUES (1, 1, 'Direito', 80, 3700, 10, 'Bacharelado', 'Presencial', 01);
INSERT INTO faculdade.curso (IDmodalidade, IDtipo, nome, horascomp, carghor, qtsem, tipocur, tipomod, IDturno) 
VALUES (1, 1, 'Direito', 80, 3700, 10, 'Bacharelado', 'Presencial', 03);
INSERT INTO faculdade.curso (IDmodalidade, IDtipo, nome, horascomp, carghor, qtsem, tipocur, tipomod, IDturno) 
VALUES (3, 1, 'Biomedicina', 80, 3600, 10, 'Bacharelado', 'Hibrido', 01);
INSERT INTO faculdade.curso (IDmodalidade, IDtipo, nome, horascomp, carghor, qtsem, tipocur, tipomod, IDturno) 
VALUES (3, 1, 'Biomedicina', 80, 3600, 10, 'Bacharelado', 'Hibrido', 03);

/*Tabela Departamento*/
INSERT INTO faculdade.departamento (IDdept, nome, orcamento) 
VALUES (1415, 'Financeiro', 20000);
INSERT INTO faculdade.departamento (IDdept, nome, orcamento) 
VALUES (1416, 'Administrativo', 10000);
INSERT INTO faculdade.departamento (IDdept, nome, orcamento) 
VALUES (1417, 'Tesouraria', 50000);
INSERT INTO faculdade.departamento (IDdept, nome, orcamento) 
VALUES (1418, 'Marketing', 20000);
INSERT INTO faculdade.departamento (IDdept, nome, orcamento) 
VALUES (1419, 'Gestão de Riscos', 30000);
INSERT INTO faculdade.departamento (IDdept, nome, orcamento) 
VALUES (1420, 'Recursos Humanos', 40000);
INSERT INTO faculdade.departamento (IDdept, nome, orcamento) 
VALUES (1421, 'TI', 50000);
INSERT INTO faculdade.departamento (IDdept, nome, orcamento) 
VALUES (1422, 'Juridico', 60000);
INSERT INTO faculdade.departamento (IDdept, nome, orcamento) 
VALUES (1423, 'Atendimento ao Cliente', 20000);
INSERT INTO faculdade.departamento (IDdept, nome, orcamento) 
VALUES (1424, 'Corpo Docente', 50000);

/*Tabela Salario*/
INSERT INTO faculdade.salario (IDsal, grausal, valor_sal) 
VALUES (1410, 'Tecnico de Informatica', 3500);
INSERT INTO faculdade.salario (IDsal, grausal, valor_sal) 
VALUES (1411, 'Professor com Mestrado', 6500);
INSERT INTO faculdade.salario (IDsal, grausal, valor_sal) 
VALUES (1412, 'Professor com Doutorado', 10500);
INSERT INTO faculdade.salario (IDsal, grausal, valor_sal) 
VALUES (1413, 'Professor Coordenador', 12500);
INSERT INTO faculdade.salario (IDsal, grausal, valor_sal) 
VALUES (1414, 'Tecnico Administrativo', 2500);
INSERT INTO faculdade.salario (IDsal, grausal, valor_sal) 
VALUES (1415, 'Contador', 5500);
INSERT INTO faculdade.salario (IDsal, grausal, valor_sal) 
VALUES (1416, 'Advogado', 8500);
INSERT INTO faculdade.salario (IDsal, grausal, valor_sal) 
VALUES (1417, 'Serviços Gerais', 1500);
INSERT INTO faculdade.salario (IDsal, grausal, valor_sal) 
VALUES (1418, 'Segurança', 2500);
INSERT INTO faculdade.salario (IDsal, grausal, valor_sal) 
VALUES (1419, 'Analista de Recursos Humanos', 3500);
INSERT INTO faculdade.salario (IDsal, grausal, valor_sal) 
VALUES (1420, 'Financeiro', 4500);
INSERT INTO faculdade.salario (IDsal, grausal, valor_sal) 
VALUES (1421, 'Publicitario', 2500);
INSERT INTO faculdade.salario (IDsal, grausal, valor_sal) 
VALUES (1422, 'Analista de Marketing', 1500);
INSERT INTO faculdade.salario (IDsal, grausal, valor_sal) 
VALUES (1423, 'Analista Service Desk', 1500);

/*Tabela Funcionario*/
INSERT INTO faculdade.funcionario (IDfunc, IDsal, admissao, data_nasc, nome, IDdept) 
VALUES (1401, 1420, '2022-10-24', '1985-03-20', 'Carlos Silva', 1415);
INSERT INTO faculdade.funcionario (IDfunc, IDsal, admissao, data_nasc, nome, IDdept) 
VALUES (1402, 1420, '2022-11-13', '1990-07-25', 'Ana Oliveira', 1415);
INSERT INTO faculdade.funcionario (IDfunc, IDsal, admissao, data_nasc, nome, IDdept) 
VALUES (1403, 1414, '2022-05-15', '1988-09-05', 'Rafael Santos', 1416);
INSERT INTO faculdade.funcionario (IDfunc, IDsal, admissao, data_nasc, nome, IDdept) 
VALUES (1404, 1414, '2022-01-17', '1993-04-15', 'Juliana Costa', 1416);
INSERT INTO faculdade.funcionario (IDfunc, IDsal, admissao, data_nasc, nome, IDdept) 
VALUES (1405, 1415, '2022-02-12', '1982-01-20', 'Pedro Almeida', 1417);
INSERT INTO faculdade.funcionario (IDfunc, IDsal, admissao, data_nasc, nome, IDdept) 
VALUES (1406, 1415, '2022-12-19', '1997-06-08', 'Camila Rodrigues', 1417);
INSERT INTO faculdade.funcionario (IDfunc, IDsal, admissao, data_nasc, nome, IDdept) 
VALUES (1407, 1421, '2022-03-04', '1991-12-12', 'Lucas Pereira', 1418);
INSERT INTO faculdade.funcionario (IDfunc, IDsal, admissao, data_nasc, nome, IDdept) 
VALUES (1408, 1422, '2022-03-15', '1989-08-03', 'Fernanda Souza', 1418);
INSERT INTO faculdade.funcionario (IDfunc, IDsal, admissao, data_nasc, nome, IDdept) 
VALUES (1409, 1418, '2022-04-13', '1980-05-18', 'Gustavo Lima', 1419);
INSERT INTO faculdade.funcionario (IDfunc, IDsal, admissao, data_nasc, nome, IDdept) 
VALUES (1410, 1417, '2022-05-12', '1995-11-30', 'Isabela Ferreira', 1419);
INSERT INTO faculdade.funcionario (IDfunc, IDsal, admissao, data_nasc, nome, IDdept) 
VALUES (1411, 1419, '2022-08-11', '1987-02-22', 'Marcelo Oliveira', 1420);
INSERT INTO faculdade.funcionario (IDfunc, IDsal, admissao, data_nasc, nome, IDdept) 
VALUES (1412, 1419, '2022-07-17', '1994-10-07', 'Amanda Costa', 1420);
INSERT INTO faculdade.funcionario (IDfunc, IDsal, admissao, data_nasc, nome, IDdept) 
VALUES (1413, 1410, '2022-08-18', '1984-07-14', 'Rodrigo Santos', 1421);
INSERT INTO faculdade.funcionario (IDfunc, IDsal, admissao, data_nasc, nome, IDdept) 
VALUES (1414, 1410, '2022-06-26', '1998-09-09', 'Larissa Silva', 1421);
INSERT INTO faculdade.funcionario (IDfunc, IDsal, admissao, data_nasc, nome, IDdept) 
VALUES (1415, 1416, '2022-08-20', '1986-03-28', 'Diego Alves', 1422);
INSERT INTO faculdade.funcionario (IDfunc, IDsal, admissao, data_nasc, nome, IDdept) 
VALUES (1416, 1423, '2022-04-24', '1992-01-11', 'Carolina Mendes', 1423);
INSERT INTO faculdade.funcionario (IDfunc, IDsal, admissao, data_nasc, nome, IDdept) 
VALUES (1417, 1411, '2022-04-24', '1985-03-20', 'Carlos Silva', 1424);
INSERT INTO faculdade.funcionario (IDfunc, IDsal, admissao, data_nasc, nome, IDdept) 
VALUES (1418, 1411, '2022-04-24', '1990-07-25', 'Ana Oliveira', 1424);
INSERT INTO faculdade.funcionario (IDfunc, IDsal, admissao, data_nasc, nome, IDdept) 
VALUES (1419, 1412, '2022-04-24', '1988-09-05', 'Rafael Santos', 1424);
INSERT INTO faculdade.funcionario (IDfunc, IDsal, admissao, data_nasc, nome, IDdept) 
VALUES (1420, 1411, '2022-04-24', '1993-04-15', 'Juliana Costa', 1424);
INSERT INTO faculdade.funcionario (IDfunc, IDsal, admissao, data_nasc, nome, IDdept) 
VALUES (1421, 1411, '2022-04-24', '1982-01-20', 'Pedro Almeida', 1424);
INSERT INTO faculdade.funcionario (IDfunc, IDsal, admissao, data_nasc, nome, IDdept) 
VALUES (1422, 1412, '2022-04-24', '1997-06-08', 'Camila Rodrigues', 1424);
INSERT INTO faculdade.funcionario (IDfunc, IDsal, admissao, data_nasc, nome, IDdept) 
VALUES (1423, 1412, '2022-04-24', '1991-12-12', 'Lucas Pereira', 1424);
INSERT INTO faculdade.funcionario (IDfunc, IDsal, admissao, data_nasc, nome, IDdept) 
VALUES (1424, 1412, '2022-04-24', '1987-07-21', 'Eduardo Pereira', 1424);
INSERT INTO faculdade.funcionario (IDfunc, IDsal, admissao, data_nasc, nome, IDdept) 
VALUES (1425, 1412, '2022-04-24', '1995-03-29', 'Beatriz Souza', 1424);
INSERT INTO faculdade.funcionario (IDfunc, IDsal, admissao, data_nasc, nome, IDdept) 
VALUES (1426, 1413, '2022-04-24', '1982-10-18', 'Ricardo Lima', 1424);

/*Tabela Professor*/
INSERT INTO faculdade.professor (CPF, dependentes, dataingr, datanasc, nome, IDfunc, IDsal, IDdept)
VALUES (0001, 'Marcelo Oliveira', '2022-01-24', '1985-03-20', 'Carlos Silva',1417, 1411, 1424);
INSERT INTO faculdade.professor (CPF, dependentes, dataingr, datanasc, nome, IDfunc, IDsal, IDdept)
VALUES (0002, 'Juliana Costa', '2022-01-24', '1990-07-25', 'Ana Oliveira',1418, 1411, 1424);
INSERT INTO faculdade.professor (CPF, dependentes, dataingr, datanasc, nome, IDfunc, IDsal, IDdept)
VALUES (0003, 'Roberto Alves', '2022-01-24', '1988-09-05', 'Rafael Santos',1419, 1411, 1424);
INSERT INTO faculdade.professor (CPF, dependentes, dataingr, datanasc, nome, IDfunc, IDsal, IDdept)
VALUES (0005, 'Bruno Costa', '2022-01-24', '1993-04-15', 'Juliana Costa',1420, 1411, 1424);
INSERT INTO faculdade.professor (CPF, dependentes, dataingr, datanasc, nome, IDfunc, IDsal, IDdept)
VALUES (0006, 'Mariana Silva', '2022-01-24', '1982-01-20', 'Pedro Almeida',1421, 1411, 1424);
INSERT INTO faculdade.professor (CPF, dependentes, dataingr, datanasc, nome, IDfunc, IDsal, IDdept)
VALUES (0007, 'Gabriela Rodrigues', '2022-01-24', '1997-06-08', 'Camila Rodrigues',1422, 1411, 1424);
INSERT INTO faculdade.professor (CPF, dependentes, dataingr, datanasc, nome, IDfunc, IDsal, IDdept)
VALUES (0008, 'Gustavo Lima', '2022-01-24', '1991-12-12', 'Lucas Pereira',1423, 1411, 1424);
INSERT INTO faculdade.professor (CPF, dependentes, dataingr, datanasc, nome, IDfunc, IDsal, IDdept)
VALUES (0009, 'Larissa Silva', '2022-01-24', '1987-07-21', 'Eduardo Pereira',1424, 1411, 1424);
INSERT INTO faculdade.professor (CPF, dependentes, dataingr, datanasc, nome, IDfunc, IDsal, IDdept)
VALUES (0010, 'Carolina Mendes', '2022-01-24', '1995-03-29', 'Beatriz Souza',1425, 1411, 1424);
INSERT INTO faculdade.professor (CPF, dependentes, dataingr, datanasc, nome, IDfunc, IDsal, IDdept)
VALUES (0011, 'Pedro Almeida', '2022-01-24', '1982-10-18', 'Ricardo Lima',1426, 1411, 1424);

/*Tabela Mensalidade*/
INSERT INTO faculdade.mensalidade (IDmensalidade, valormens, IDcurso)
VALUES (01, 930, 3);
INSERT INTO faculdade.mensalidade (IDmensalidade, valormens, IDcurso)
VALUES (02, 450, 5);
INSERT INTO faculdade.mensalidade (IDmensalidade, valormens, IDcurso)
VALUES (03, 620, 12);
INSERT INTO faculdade.mensalidade (IDmensalidade, valormens, IDcurso)
VALUES (04, 750, 1);
INSERT INTO faculdade.mensalidade (IDmensalidade, valormens, IDcurso)
VALUES (05, 650, 2);
INSERT INTO faculdade.mensalidade (IDmensalidade, valormens, IDcurso)
VALUES (06, 569, 4);
INSERT INTO faculdade.mensalidade (IDmensalidade, valormens, IDcurso)
VALUES (07, 348, 6);
INSERT INTO faculdade.mensalidade (IDmensalidade, valormens, IDcurso)
VALUES (08, 301, 7);
INSERT INTO faculdade.mensalidade (IDmensalidade, valormens, IDcurso)
VALUES (09, 480, 8);
INSERT INTO faculdade.mensalidade (IDmensalidade, valormens, IDcurso)
VALUES (10, 525, 9);
INSERT INTO faculdade.mensalidade (IDmensalidade, valormens, IDcurso)
VALUES (11, 574, 10);
INSERT INTO faculdade.mensalidade (IDmensalidade, valormens, IDcurso)
VALUES (12, 333, 11);
INSERT INTO faculdade.mensalidade (IDmensalidade, valormens, IDcurso)
VALUES (13, 920, 13);
INSERT INTO faculdade.mensalidade (IDmensalidade, valormens, IDcurso)
VALUES (14, 940, 14);
INSERT INTO faculdade.mensalidade (IDmensalidade, valormens, IDcurso)
VALUES (15, 874, 15);

/*Tabela Aluno*/
INSERT INTO faculdade.aluno (nome, data_nas,IDcurso,IDturno,IDmensalidade)
VALUES ('Ana Beatriz Silva', '1992-06-15', 3, 04, 01);
INSERT INTO faculdade.aluno (nome, data_nas,IDcurso,IDturno,IDmensalidade)
VALUES ('Carlos Eduardo Rocha', '1985-03-22', 8, 01, 09);
INSERT INTO faculdade.aluno (nome, data_nas,IDcurso,IDturno,IDmensalidade)
VALUES ('Fernanda Correia Lima',  '1978-11-30', 11, 02, 10);
INSERT INTO faculdade.aluno (nome, data_nas,IDcurso,IDturno,IDmensalidade)
VALUES ('Diego Alves Souza',  '2000-01-09', 2, 01,05);
INSERT INTO faculdade.aluno (nome, data_nas,IDcurso,IDturno,IDmensalidade)
VALUES ('Elisa Martins Barbosa',  '1995-07-20', 5, 04,02);
INSERT INTO faculdade.aluno (nome, data_nas,IDcurso,IDturno,IDmensalidade)
VALUES ('Gabriel Costa Neves',  '1983-02-17', 7, 03,08);
INSERT INTO faculdade.aluno (nome, data_nas,IDcurso,IDturno,IDmensalidade)
VALUES ('Helena Gomes Ribeiro',  '1975-12-05', 10, 01,11);
INSERT INTO faculdade.aluno (nome, data_nas,IDcurso,IDturno,IDmensalidade)
VALUES ('Igor Santos Oliveira',  '1999-04-28', 15, 03,15);
INSERT INTO faculdade.aluno (nome, data_nas,IDcurso,IDturno,IDmensalidade)
VALUES ('Juliana Pereira Castro',  '1986-09-14', 14, 03,14);
INSERT INTO faculdade.aluno (nome, data_nas,IDcurso,IDturno,IDmensalidade)
VALUES ('Lucas Mendes Almeida',  '2001-08-23', 1, 01, 03);
INSERT INTO faculdade.aluno (nome, data_nas,IDcurso,IDturno,IDmensalidade)
VALUES ('Mariana Dias Cardoso',  '1993-10-11',6, 01, 07);
INSERT INTO faculdade.aluno (nome, data_nas,IDcurso,IDturno,IDmensalidade)
VALUES ('Nelson Pinto Carvalho',  '1980-05-06',9,01, 10);
INSERT INTO faculdade.aluno (nome, data_nas,IDcurso,IDturno,IDmensalidade)
VALUES ('Olívia Freitas Ferreira',  '1979-07-29',10,01, 11);
INSERT INTO faculdade.aluno (nome, data_nas,IDcurso,IDturno,IDmensalidade)
VALUES ('Paulo Sérgio Moreira',  '1965-03-15',15,01,15);
INSERT INTO faculdade.aluno (nome, data_nas,IDcurso,IDturno,IDmensalidade)
VALUES ('Renata Fonseca Tavares',  '1987-08-18',4,02,06);
INSERT INTO faculdade.aluno (nome, data_nas,IDcurso,IDturno,IDmensalidade)
VALUES ('Sérgio Lopes Araújo',  '1972-02-02',2,03,05);
INSERT INTO faculdade.aluno (nome, data_nas,IDcurso,IDturno,IDmensalidade)
VALUES ('Tânia Figueiredo Sampaio',  '1990-11-21',6,01,07);
INSERT INTO faculdade.aluno (nome, data_nas,IDcurso,IDturno,IDmensalidade)
VALUES ('Vitor Hugo Andrade',  '1984-12-12',9,01,10);
INSERT INTO faculdade.aluno (nome, data_nas,IDcurso,IDturno,IDmensalidade)
VALUES ('Yasmin Batista Duarte',  '1998-05-25',13,04,13);
INSERT INTO faculdade.aluno (nome, data_nas,IDcurso,IDturno,IDmensalidade)
VALUES ('William Morais Teixeira',  '1976-10-30',5,04,02);

/*Tabela Endereço*/
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (70000001, 'DF', 'Asa Norte', 'Brasília', 100);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (70000002, 'DF', 'Asa Sul', 'Brasília', 101);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (70000003, 'DF', 'Lago Norte', 'Brasília', 102);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (70000004, 'DF', 'Lago Sul', 'Brasília', 103);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (70000005, 'DF', 'Águas Claras', 'Brasília', 104);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (70000006, 'DF', 'Taguatinga', 'Brasília', 105);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (70000007, 'DF', 'Guará', 'Brasília', 106);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (70000008, 'DF', 'Sudoeste', 'Brasília', 107);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (70000009, 'DF', 'Noroeste', 'Brasília', 108);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (70000010, 'DF', 'Gama', 'Brasília', 109);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (70000011, 'DF', 'Samambaia', 'Brasília', 110);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (70000012, 'DF', 'Santa Maria', 'Brasília', 111);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (70000013, 'DF', 'Sobradinho', 'Brasília', 112);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (70000014, 'DF', 'Ceilândia', 'Brasília', 113);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (70000015, 'DF', 'Planaltina', 'Brasília', 114);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (70000016, 'DF', 'Recanto das Emas', 'Brasília', 115);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (70000017, 'DF', 'Paranoá', 'Brasília', 116);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (70000018, 'DF', 'Riacho Fundo', 'Brasília', 117);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (70000019, 'DF', 'Cruzeiro', 'Brasília', 118);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (70000020, 'DF', 'Candangolândia', 'Brasília', 119);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (72000021, 'DF', 'Setor de Mansões de Sobradinho', 'Brasília', 21);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (72000022, 'DF', 'Setor Habitacional Vicente Pires', 'Brasília', 22);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (72000023, 'DF', 'Setor de Habitações Individuais Sul', 'Brasília', 23);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (72000024, 'DF', 'Setor de Habitações Individuais Norte', 'Brasília', 24);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (72000025, 'DF', 'Setor Noroeste', 'Brasília', 25);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (72000026, 'DF', 'Setor Sudoeste', 'Brasília', 26);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (72000027, 'DF', 'Núcleo Bandeirante', 'Brasília', 27);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (72000028, 'DF', 'Candangolândia', 'Brasília', 28);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (72000029, 'DF', 'Setor de Indústria e Abastecimento', 'Brasília', 29);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (72000030, 'DF', 'Setor de Grandes Áreas Norte', 'Brasília', 30);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (72000031, 'DF', 'Setor de Grandes Áreas Sul', 'Brasília', 31);
INSERT INTO faculdade.endereco (cep, uf, bairro, cidade, numero) VALUES (73000032, 'DF', 'Park Way', 'Brasília', 32);

/*Tabela Campus*/
INSERT INTO faculdade.campus (IDcampus, cep, qtd_max_aluno) VALUES (234,73000032,750);

/*Tabela Sala*/
INSERT INTO faculdade.sala (IDsala, qtdlabenf, qtdsala, qtdlabbio, IDcampus) VALUES (430, 54, 53, 53, 234);

/*Tabela Materia*/
INSERT INTO faculdade.materia (IDmateria, carga_hor, media) VALUES (1, 64, 7.5);
INSERT INTO faculdade.materia (IDmateria, carga_hor, media) VALUES (2, 72, 8.0);
INSERT INTO faculdade.materia (IDmateria, carga_hor, media) VALUES (3, 48, 6.7);
INSERT INTO faculdade.materia (IDmateria, carga_hor, media) VALUES (4, 80, 7.8);
INSERT INTO faculdade.materia (IDmateria, carga_hor, media) VALUES (5, 56, 7.2);
INSERT INTO faculdade.materia (IDmateria, carga_hor, media) VALUES (6, 60, 7.0);
INSERT INTO faculdade.materia (IDmateria, carga_hor, media) VALUES (7, 44, 6.5);
INSERT INTO faculdade.materia (IDmateria, carga_hor, media) VALUES (8, 68, 8.3);
INSERT INTO faculdade.materia (IDmateria, carga_hor, media) VALUES (9, 76, 7.9);
INSERT INTO faculdade.materia (IDmateria, carga_hor, media) VALUES (10, 52, 6.8);
INSERT INTO faculdade.materia (IDmateria, carga_hor, media) VALUES (11, 88, 8.1);
INSERT INTO faculdade.materia (IDmateria, carga_hor, media) VALUES (12, 40, 6.9);
INSERT INTO faculdade.materia (IDmateria, carga_hor, media) VALUES (13, 36, 7.1);
INSERT INTO faculdade.materia (IDmateria, carga_hor, media) VALUES (14, 92, 8.4);
INSERT INTO faculdade.materia (IDmateria, carga_hor, media) VALUES (15, 100, 8.5);

/*Tabela Contem*/
INSERT INTO faculdade.contem (IDmateria,IDcurso) VALUES (1, 1);
INSERT INTO faculdade.contem (IDmateria,IDcurso) VALUES (1, 2);
INSERT INTO faculdade.contem (IDmateria,IDcurso) VALUES (2, 3);
INSERT INTO faculdade.contem (IDmateria,IDcurso) VALUES (2, 4);
INSERT INTO faculdade.contem (IDmateria,IDcurso) VALUES (3, 5);
INSERT INTO faculdade.contem (IDmateria,IDcurso) VALUES (4, 6);
INSERT INTO faculdade.contem (IDmateria,IDcurso) VALUES (4, 7);
INSERT INTO faculdade.contem (IDmateria,IDcurso) VALUES (5, 8);
INSERT INTO faculdade.contem (IDmateria,IDcurso) VALUES (6, 9);
INSERT INTO faculdade.contem (IDmateria,IDcurso) VALUES (6, 10);
INSERT INTO faculdade.contem (IDmateria,IDcurso) VALUES (7, 11);
INSERT INTO faculdade.contem (IDmateria,IDcurso) VALUES (7, 12);
INSERT INTO faculdade.contem (IDmateria,IDcurso) VALUES (8, 13);
INSERT INTO faculdade.contem (IDmateria,IDcurso) VALUES (8, 14);
INSERT INTO faculdade.contem (IDmateria,IDcurso) VALUES (9, 15);
INSERT INTO faculdade.contem (IDmateria,IDcurso) VALUES (9, 16);
INSERT INTO faculdade.contem (IDmateria,IDcurso) VALUES (10, 17);
INSERT INTO faculdade.contem (IDmateria,IDcurso) VALUES (11, 18);
INSERT INTO faculdade.contem (IDmateria,IDcurso) VALUES (12, 19);
INSERT INTO faculdade.contem (IDmateria,IDcurso) VALUES (13, 20);
INSERT INTO faculdade.contem (IDmateria,IDcurso) VALUES (14, 21);
INSERT INTO faculdade.contem (IDmateria,IDcurso) VALUES (14, 22);
INSERT INTO faculdade.contem (IDmateria,IDcurso) VALUES (15, 23);
INSERT INTO faculdade.contem (IDmateria,IDcurso) VALUES (15, 24);

/*Tabela Formação*/
INSERT INTO faculdade.formacao (IDformacao, tipo, Nome, IDprof) VALUES (1, 'Doutorado', 'Engenharia Elétrica', 1);
INSERT INTO faculdade.formacao (IDformacao, tipo, Nome, IDprof) VALUES (2, 'Mestrado', 'Ciência da Computação', 2);
INSERT INTO faculdade.formacao (IDformacao, tipo, Nome, IDprof) VALUES (3, 'Doutorado', 'Literatura Inglesa', 3);
INSERT INTO faculdade.formacao (IDformacao, tipo, Nome, IDprof) VALUES (4, 'Mestrado', 'Matemática Aplicada', 4);
INSERT INTO faculdade.formacao (IDformacao, tipo, Nome, IDprof) VALUES (5, 'Doutorado', 'Física Quântica', 5);
INSERT INTO faculdade.formacao (IDformacao, tipo, Nome, IDprof) VALUES (6, 'Especialização', 'Administração de Empresas', 6);
INSERT INTO faculdade.formacao (IDformacao, tipo, Nome, IDprof) VALUES (7, 'Doutorado', 'Direito Tributário', 7);
INSERT INTO faculdade.formacao (IDformacao, tipo, Nome, IDprof) VALUES (8, 'Mestrado', 'Biologia Molecular', 8);
INSERT INTO faculdade.formacao (IDformacao, tipo, Nome, IDprof) VALUES (9, 'Doutorado', 'Química Orgânica', 9);
INSERT INTO faculdade.formacao (IDformacao, tipo, Nome, IDprof) VALUES (10, 'Especialização', 'Marketing Digital', 10);

/*Tabela Coordenação*/
INSERT INTO faculdade.coordenacao (IDcoordenacao, nomecoord, IDcoordenador, IDfunc, IDsal, IDdept) 
VALUES (1, 'Coordenação de engenharia e tecnologia', 101, 1417, 1411,1424);
INSERT INTO faculdade.coordenacao (IDcoordenacao, nomecoord, IDcoordenador, IDfunc, IDsal, IDdept) 
VALUES (2, 'Coordenação de comunicação', 102,1418, 1411,1424);
INSERT INTO faculdade.coordenacao (IDcoordenacao, nomecoord, IDcoordenador, IDfunc, IDsal, IDdept) 
VALUES (3, 'Coordenação de direito e relações internacionais', 103,1419, 1412,1424);
INSERT INTO faculdade.coordenacao (IDcoordenacao, nomecoord, IDcoordenador, IDfunc, IDsal, IDdept) 
VALUES (4, 'Coordenação de educação', 104,1420, 1411,1424);
INSERT INTO faculdade.coordenacao (IDcoordenacao, nomecoord, IDcoordenador, IDfunc, IDsal, IDdept) 
VALUES (5, 'Coordenação de gastronomia e hospitalidade', 105,1421, 1411,1424);
INSERT INTO faculdade.coordenacao (IDcoordenacao, nomecoord, IDcoordenador, IDfunc, IDsal, IDdept) 
VALUES (6, 'Coordenação de gestão e negocios', 106,1422, 1412,1424);
INSERT INTO faculdade.coordenacao (IDcoordenacao, nomecoord, IDcoordenador, IDfunc, IDsal, IDdept) 
VALUES (7, 'Coordenação de saúde', 107,1423, 1412,1424);

/*Tabela Coordena*/
INSERT INTO faculdade.coordena (IDprof,IDcoordenacao) VALUES (1, 1);
INSERT INTO faculdade.coordena (IDprof,IDcoordenacao) VALUES (2, 7);
INSERT INTO faculdade.coordena (IDprof,IDcoordenacao) VALUES (3, 2);
INSERT INTO faculdade.coordena (IDprof,IDcoordenacao) VALUES (4, 1);
INSERT INTO faculdade.coordena (IDprof,IDcoordenacao) VALUES (5, 4);
INSERT INTO faculdade.coordena (IDprof,IDcoordenacao) VALUES (6, 1);
INSERT INTO faculdade.coordena (IDprof,IDcoordenacao) VALUES (7, 5);
INSERT INTO faculdade.coordena (IDprof,IDcoordenacao) VALUES (8, 3);
INSERT INTO faculdade.coordena (IDprof,IDcoordenacao) VALUES (9, 2);
INSERT INTO faculdade.coordena (IDprof,IDcoordenacao) VALUES (10, 1);

/*Tabela Funciona*/
INSERT INTO faculdade.funciona (IDcurso,IDturno) VALUES (1, 1);
INSERT INTO faculdade.funciona (IDcurso,IDturno) VALUES (2, 3);
INSERT INTO faculdade.funciona (IDcurso,IDturno) VALUES (3, 1);
INSERT INTO faculdade.funciona (IDcurso,IDturno) VALUES (4, 3);
INSERT INTO faculdade.funciona (IDcurso,IDturno) VALUES (5, 4);
INSERT INTO faculdade.funciona (IDcurso,IDturno) VALUES (6, 2);
INSERT INTO faculdade.funciona (IDcurso,IDturno) VALUES (7, 3);
INSERT INTO faculdade.funciona (IDcurso,IDturno) VALUES (8, 2);
INSERT INTO faculdade.funciona (IDcurso,IDturno) VALUES (9, 2);
INSERT INTO faculdade.funciona (IDcurso,IDturno) VALUES (10, 1);
INSERT INTO faculdade.funciona (IDcurso,IDturno) VALUES (11, 1);
INSERT INTO faculdade.funciona (IDcurso,IDturno) VALUES (12, 3);
INSERT INTO faculdade.funciona (IDcurso,IDturno) VALUES (13, 1);
INSERT INTO faculdade.funciona (IDcurso,IDturno) VALUES (14, 2);
INSERT INTO faculdade.funciona (IDcurso,IDturno) VALUES (15, 3);
INSERT INTO faculdade.funciona (IDcurso,IDturno) VALUES (16, 1);
INSERT INTO faculdade.funciona (IDcurso,IDturno) VALUES (17, 1);
INSERT INTO faculdade.funciona (IDcurso,IDturno) VALUES (18, 2);
INSERT INTO faculdade.funciona (IDcurso,IDturno) VALUES (19, 4);
INSERT INTO faculdade.funciona (IDcurso,IDturno) VALUES (20, 4);
INSERT INTO faculdade.funciona (IDcurso,IDturno) VALUES (21, 1);
INSERT INTO faculdade.funciona (IDcurso,IDturno) VALUES (22, 3);
INSERT INTO faculdade.funciona (IDcurso,IDturno) VALUES (23, 1);
INSERT INTO faculdade.funciona (IDcurso,IDturno) VALUES (24, 3);

/*Tabela Contato*/
INSERT INTO faculdade.contato (IDcontato, telefone, email, RGM) VALUES(1, 1987654321, 'contato1@faculdade.edu', 10);
INSERT INTO faculdade.contato (IDcontato, telefone, email, RGM) VALUES(2, 1987654322, 'contato2@faculdade.edu',11);
INSERT INTO faculdade.contato (IDcontato, telefone, email, RGM) VALUES(3, 1987654323, 'contato3@faculdade.edu',12);
INSERT INTO faculdade.contato (IDcontato, telefone, email, RGM) VALUES(4, 1987654324, 'contato4@faculdade.edu',13);
INSERT INTO faculdade.contato (IDcontato, telefone, email, RGM) VALUES(5, 1987654325, 'contato5@faculdade.edu',14);
INSERT INTO faculdade.contato (IDcontato, telefone, email, RGM) VALUES(6, 1987654326, 'contato6@faculdade.edu',15);
INSERT INTO faculdade.contato (IDcontato, telefone, email, RGM) VALUES(7, 1987654327, 'contato7@faculdade.edu',16);
INSERT INTO faculdade.contato (IDcontato, telefone, email, RGM) VALUES(8, 1987654328, 'contato8@faculdade.edu',17);
INSERT INTO faculdade.contato (IDcontato, telefone, email, RGM) VALUES(9, 1987654329, 'contato9@faculdade.edu',18);
INSERT INTO faculdade.contato (IDcontato, telefone, email, RGM) VALUES(10, 1987654330, 'contato10@faculdade.edu',19);
INSERT INTO faculdade.contato (IDcontato, telefone, email, RGM) VALUES(11, 1987654331, 'contato11@faculdade.edu',20);
INSERT INTO faculdade.contato (IDcontato, telefone, email, RGM) VALUES(12, 1987654332, 'contato12@faculdade.edu',1);
INSERT INTO faculdade.contato (IDcontato, telefone, email, RGM) VALUES(13, 1987654333, 'contato13@faculdade.edu',5);
INSERT INTO faculdade.contato (IDcontato, telefone, email, RGM) VALUES(14, 1987654334, 'contato14@faculdade.edu',2);
INSERT INTO faculdade.contato (IDcontato, telefone, email, RGM) VALUES(15, 1987654335, 'contato15@faculdade.edu',3);
INSERT INTO faculdade.contato (IDcontato, telefone, email, RGM) VALUES(16, 1987654336, 'contato16@faculdade.edu',4);
INSERT INTO faculdade.contato (IDcontato, telefone, email, RGM) VALUES(17, 1987654337, 'contato17@faculdade.edu',6);
INSERT INTO faculdade.contato (IDcontato, telefone, email, RGM) VALUES(18, 1987654338, 'contato18@faculdade.edu',7);
INSERT INTO faculdade.contato (IDcontato, telefone, email, RGM) VALUES(19, 1987654339, 'contato19@faculdade.edu',8);
INSERT INTO faculdade.contato (IDcontato, telefone, email, RGM) VALUES(20, 1987654340, 'contato20@faculdade.edu',9);
INSERT INTO faculdade.contato (IDcontato, telefone, email, IDprof, IDfunc) VALUES(21, 1987654341, 'contato21@faculdade.edu',1, 1417);
INSERT INTO faculdade.contato (IDcontato, telefone, email, IDprof, IDfunc) VALUES(22, 1987654342, 'contato22@faculdade.edu',2, 1418);
INSERT INTO faculdade.contato (IDcontato, telefone, email, IDprof, IDfunc) VALUES(23, 1987654343, 'contato23@faculdade.edu',3, 1419);
INSERT INTO faculdade.contato (IDcontato, telefone, email, IDprof, IDfunc) VALUES(24, 1987654344, 'contato24@faculdade.edu',4, 1420);
INSERT INTO faculdade.contato (IDcontato, telefone, email, IDprof, IDfunc) VALUES(25, 1987654345, 'contato25@faculdade.edu',5, 1421);
INSERT INTO faculdade.contato (IDcontato, telefone, email, IDprof, IDfunc) VALUES(26, 1987654346, 'contato26@faculdade.edu',6, 1422);
INSERT INTO faculdade.contato (IDcontato, telefone, email, IDprof, IDfunc) VALUES(27, 1987654347, 'contato27@faculdade.edu',7, 1423);
INSERT INTO faculdade.contato (IDcontato, telefone, email, IDprof, IDfunc) VALUES(28, 1987654348, 'contato28@faculdade.edu',8, 1424);
INSERT INTO faculdade.contato (IDcontato, telefone, email, IDprof, IDfunc) VALUES(29, 1987654349, 'contato29@faculdade.edu',9, 1425);
INSERT INTO faculdade.contato (IDcontato, telefone, email, IDprof, IDfunc) VALUES(30, 1987654350, 'contato30@faculdade.edu',10, 1426);
INSERT INTO faculdade.contato (IDcontato, telefone, email, IDfunc) VALUES(31, 1987654351, 'contato31@faculdade.edu', 1401);
INSERT INTO faculdade.contato (IDcontato, telefone, email, IDfunc) VALUES(32, 1987654352, 'contato32@faculdade.edu', 1402);
INSERT INTO faculdade.contato (IDcontato, telefone, email, IDfunc) VALUES(33, 1987654353, 'contato33@faculdade.edu', 1403);
INSERT INTO faculdade.contato (IDcontato, telefone, email, IDfunc) VALUES(34, 1987654354, 'contato34@faculdade.edu', 1404);
INSERT INTO faculdade.contato (IDcontato, telefone, email, IDfunc) VALUES(35, 1987654355, 'contato35@faculdade.edu', 1405);
INSERT INTO faculdade.contato (IDcontato, telefone, email, IDfunc) VALUES(36, 1987654356, 'contato36@faculdade.edu', 1406);
INSERT INTO faculdade.contato (IDcontato, telefone, email, IDfunc) VALUES(37, 1987654357, 'contato37@faculdade.edu', 1407);
INSERT INTO faculdade.contato (IDcontato, telefone, email, IDfunc) VALUES(38, 1987654358, 'contato38@faculdade.edu', 1408);
INSERT INTO faculdade.contato (IDcontato, telefone, email, IDfunc) VALUES(39, 1987654359, 'contato39@faculdade.edu', 1409);
INSERT INTO faculdade.contato (IDcontato, telefone, email, IDfunc) VALUES(40, 1987654360, 'contato40@faculdade.edu', 1410);
INSERT INTO faculdade.contato (IDcontato, telefone, email, IDfunc) VALUES(41, 1987654361, 'contato41@faculdade.edu', 1411);
INSERT INTO faculdade.contato (IDcontato, telefone, email, IDfunc) VALUES(42, 1987654362, 'contato42@faculdade.edu', 1412);
INSERT INTO faculdade.contato (IDcontato, telefone, email, IDfunc) VALUES(43, 1987654363, 'contato43@faculdade.edu', 1413);
INSERT INTO faculdade.contato (IDcontato, telefone, email, IDfunc) VALUES(44, 1987654364, 'contato44@faculdade.edu', 1414);
INSERT INTO faculdade.contato (IDcontato, telefone, email, IDfunc) VALUES(45, 1987654365, 'contato45@faculdade.edu', 1415);
INSERT INTO faculdade.contato (IDcontato, telefone, email, IDfunc) VALUES(46, 1987654366, 'contato46@faculdade.edu', 1416);

/*Tabela Leciona*/
INSERT INTO faculdade.leciona (IDmateria, IDprof, RGM) VALUES(1, 1, 10);
INSERT INTO faculdade.leciona (IDmateria, IDprof, RGM) VALUES(2, 2, 11);
INSERT INTO faculdade.leciona (IDmateria, IDprof, RGM) VALUES(3, 3, 12);
INSERT INTO faculdade.leciona (IDmateria, IDprof, RGM) VALUES(4, 4, 13);
INSERT INTO faculdade.leciona (IDmateria, IDprof, RGM) VALUES(5, 5, 15);
INSERT INTO faculdade.leciona (IDmateria, IDprof, RGM) VALUES(6, 6, 16);
INSERT INTO faculdade.leciona (IDmateria, IDprof, RGM) VALUES(7, 7, 17);
INSERT INTO faculdade.leciona (IDmateria, IDprof, RGM) VALUES(8, 8, 18);
INSERT INTO faculdade.leciona (IDmateria, IDprof, RGM) VALUES(9, 9, 19);
INSERT INTO faculdade.leciona (IDmateria, IDprof, RGM) VALUES(10, 10, 20);
INSERT INTO faculdade.leciona (IDmateria, IDprof, RGM) VALUES(11, 4, 5);
INSERT INTO faculdade.leciona (IDmateria, IDprof, RGM) VALUES(12, 5, 9);
INSERT INTO faculdade.leciona (IDmateria, IDprof, RGM) VALUES(13, 10, 2);
INSERT INTO faculdade.leciona (IDmateria, IDprof, RGM) VALUES(14, 7, 6);
INSERT INTO faculdade.leciona (IDmateria, IDprof, RGM) VALUES(15, 9, 3);

/*Tabela Estudo*/
INSERT INTO faculdade.estudo (IDmateria, RGM) VALUES(15, 3);
INSERT INTO faculdade.estudo (IDmateria, RGM) VALUES(2, 11);
INSERT INTO faculdade.estudo (IDmateria, RGM) VALUES(3, 12);
INSERT INTO faculdade.estudo (IDmateria, RGM) VALUES(4, 13);
INSERT INTO faculdade.estudo (IDmateria, RGM) VALUES(5, 15);
INSERT INTO faculdade.estudo (IDmateria, RGM) VALUES(6, 16);
INSERT INTO faculdade.estudo (IDmateria, RGM) VALUES(7, 17);
INSERT INTO faculdade.estudo (IDmateria, RGM) VALUES(8, 18);
INSERT INTO faculdade.estudo (IDmateria, RGM) VALUES(9, 19);
INSERT INTO faculdade.estudo (IDmateria, RGM) VALUES(10, 20);
INSERT INTO faculdade.estudo (IDmateria, RGM) VALUES(11, 5);
INSERT INTO faculdade.estudo (IDmateria, RGM) VALUES(12, 9);
INSERT INTO faculdade.estudo (IDmateria, RGM) VALUES(13, 2);
INSERT INTO faculdade.estudo (IDmateria, RGM) VALUES(14, 6);
INSERT INTO faculdade.estudo (IDmateria, RGM) VALUES(1, 10);

/*Manipulação de dados*/

/*1) Adicionar*/
select * from faculdade.materia;
ALTER TABLE faculdade.materia ADD nome varchar(100);

/*2) Atualizar*/
UPDATE faculdade.materia SET nome = 'Cálculo I' WHERE IDmateria = 1;
UPDATE faculdade.materia SET nome = 'Analise de dados' WHERE IDmateria = 2;
UPDATE faculdade.materia SET nome = 'Biologia Molecular' WHERE IDmateria = 3;
UPDATE faculdade.materia SET nome = 'História Medieval' WHERE IDmateria = 4;
UPDATE faculdade.materia SET nome = 'Teoria das Cores' WHERE IDmateria = 5;
UPDATE faculdade.materia SET nome = 'Microeconomia' WHERE IDmateria = 9;
UPDATE faculdade.materia SET nome = 'Direito Constitucional' WHERE IDmateria = 14;
UPDATE faculdade.materia SET nome = 'Gestão de projetos' WHERE IDmateria = 8;
UPDATE faculdade.materia SET nome = 'Desing de interiores' WHERE IDmateria = 6;
UPDATE faculdade.materia SET nome = 'Historia das artes' WHERE IDmateria = 10;
UPDATE faculdade.materia SET nome = 'Geografia turistica' WHERE IDmateria = 11;
UPDATE faculdade.materia SET nome = 'Marketing Digital' WHERE IDmateria = 12;
UPDATE faculdade.materia SET nome = 'Anatomia animal' WHERE IDmateria = 13;
UPDATE faculdade.materia SET nome = 'Direito constitucional' WHERE IDmateria = 14;
UPDATE faculdade.materia SET nome = 'Quimica' WHERE IDmateria = 15;

/*3) Excluir*/
delete from faculdade.sala where IDsala = 430;
select * from faculdade.sala;

/*4) realizar uma consulta envolvendo 2 tabelas */
SELECT C.nome, (
    SELECT T.nome
    FROM faculdade.turno AS T
    WHERE T.IDturno = C.IDcurso
) AS Turno
FROM faculdade.curso AS C;

/*5) Realizar uma consulta envolvendo mais de uma tabela usando JOIN */
SELECT * FROM faculdade.curso INNER JOIN faculdade.turno ON faculdade.curso.IDturno = faculdade.turno.IDturno;
select * from faculdade.curso;
select * from faculdade.turno;

