CREATE TABLE firma.cargo(
	codcargo character varying (5) primary key,
	vrsalario numeric,
	nome character varying (100)
);

CREATE TABLE firma.depto(
	coddepto character varying (5) primary key,
	ramal integer,
	nome character varying (100)
);

CREATE TABLE firma.funcionario(
	ccargo char (5),
	cdepto char (5),
	nummatricula integer,
	nome character varying (100),
	dtadm date,
	sexo character varying (1),
	
	foreign key (ccargo) REFERENCES firma.cargo (codcargo),
	foreign key (cdepto) REFERENCES firma.depto (coddepto)
);

INSERT INTO firma.cargo (codcargo, vrsalario, nome) VALUES ('1', 20000, 'ADM');
INSERT INTO firma.cargo (codcargo, vrsalario, nome) VALUES ('2', 14800, 'Gerente');
INSERT INTO firma.cargo (codcargo, vrsalario, nome) VALUES ('3', 5000, 'Funcionário');

INSERT INTO firma.depto (coddepto, ramal, nome) VALUES ('1', 333, 'CEO');
INSERT INTO firma.depto (coddepto, ramal, nome) VALUES ('2', 483, 'RH');
INSERT INTO firma.depto (coddepto, ramal, nome) VALUES ('3', 763, 'Administração Financeira');

INSERT INTO firma.funcionario (nummatricula, nome, dtadm, sexo, ccargo, cdepto) VALUES (334352, 'César', '2004-12-15', 'm', '1', '1');
INSERT INTO firma.funcionario (nummatricula, nome, dtadm, sexo, ccargo, cdepto) VALUES (233342, 'Cleslley', '2003-06-14', 'm', '1', '1');
INSERT INTO firma.funcionario (nummatricula, nome, dtadm, sexo, ccargo, cdepto) VALUES (132343, 'Victor', '2003-12-29', 'm', '1', '1');
INSERT INTO firma.funcionario (nummatricula, nome, dtadm, sexo, ccargo, cdepto) VALUES (301323, 'Gabriel', '2002-05-16', 'm', '1', '2');
INSERT INTO firma.funcionario (nummatricula, nome, dtadm, sexo, ccargo, cdepto) VALUES (301323, 'Lara', '2004-04-01', 'f', '1', '2');

SELECT * FROM firma.cargo
SELECT * FROM firma.depto
SELECT * FROM firma.funcionario

UPDATE firma.cargo SET vrsalario=25000 WHERE nome='ADM' AND codcargo='1'; -- update do salário do funcionário

-- a) Liste o nome de todos os funcionários:
SELECT nome FROM firma.funcionario;
-- b) Liste o nome de todos os funcionários do sexo feminino
SELECT nome FROM firma.funcionario WHERE sexo ='f';
-- c) Lista o nome completo, a data de admissão de todos os funcionários do sexo masculino
SELECT nome, dtadm FROM firma.funcionario WHERE sexo ='m';
-- d) Liste o nome completo, a data de admissão e o salário de todos os funcinários
SELECT firma.funcionario.nome, dtadm, vrsalario
FROM firma.funcionario, firma.cargo, firma.depto
WHERE firma.funcionario.ccargo=firma.cargo.codcargo
AND firma.depto.coddepto=firma.funcionario.cdepto

SELECT f.nome, dtadm, vrsalario
FROM firma.funcionario f, firma.cargo c
WHERE f.ccargo=c.codcargo
-- e) Liste o nome completo, a data de admissão e salário de todos os funcionários do sexo feminino
SELECT firma.funcionario.nome, dtadm, vrsalario
FROM firma.funcionario, firma.cargo, firma.depto
WHERE firma.funcionario.ccargo=firma.cargo.codcargo 
AND firma.depto.coddepto=firma.funcionario.cdepto

SELECT f.nome, dtadm, vrsalario
FROM firma.funcionario f, firma.cargo c
WHERE f.ccargo=c.codcargo AND sexo='f'
-- f) Liste o nome de todos os funcionários que terminam com a letra 'a' SELECT nome FROM firma.funcionario WHERE nome LIKE '%a'
	SELECT nome FROM firma.funcionario WHERE nome LIKE '%a'
-- g) Liste todos os funcionários que ganham entre 200 e 790 reais

SELECT f.nome, vrsalario
FROM firma.funcionario f, firma.cargo c
WHERE f.ccargo=c.codcargo
AND vrsalario >= 200 and vrsalario <= 790