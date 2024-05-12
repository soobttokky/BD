CREATE TABLE cursinho.disciplina(
	cod_discp integer primary key,
	nome character varying (100)
);

CREATE TABLE cursinho.curso(
	cod_curso integer primary key,
	nome character varying (100)
);

CREATE TABLE cursinho.curriculo(
	codd integer,
	codc integer,
	obrigatoriedade character varying (3),
	
	foreign key (codd) REFERENCES cursinho.disciplina (cod_discp),
	foreign key (codc) REFERENCES cursinho.curso (cod_curso)
);

INSERT INTO cursinho.disciplina (cod_discp, nome) VALUES (1, 'Cálculo I');
INSERT INTO cursinho.disciplina (cod_discp, nome) VALUES (2, 'POO');
INSERT INTO cursinho.disciplina (cod_discp, nome) VALUES (3, 'BD');
INSERT INTO cursinho.disciplina (cod_discp, nome) VALUES (4, 'Cobol');

INSERT INTO cursinho.curso (cod_curso, nome) VALUES (10, 'ccp');
INSERT INTO cursinho.curso (cod_curso, nome) VALUES (20, 'ads');
INSERT INTO cursinho.curso (cod_curso, nome) VALUES (30, 'eds');
INSERT INTO cursinho.curso (cod_curso, nome) VALUES (40, 'eng');

INSERT INTO cursinho.curriculo (obrigatoriedade, codd, codc) VALUES ('sim', 1, 10);
INSERT INTO cursinho.curriculo (obrigatoriedade, codd, codc) VALUES ('sim', 2, 20);
INSERT INTO cursinho.curriculo (obrigatoriedade, codd, codc) VALUES ('sim', 3, 30);
INSERT INTO cursinho.curriculo (obrigatoriedade, codd, codc) VALUES ('não', 4, 40);

SELECT * FROM cursinho.disciplina
SELECT * FROM cursinho.curso
SELECT * FROM cursinho.curriculo

-- 1) Selecione todos os nomes das disciplinas
SELECT nome FROM cursinho.disciplina;
SELECT * FROM cursinho.disciplina;
-- 2) Selecione todos oc cursos
SELECT nome FROM cursinho.curso;
SELECT * FROM cursinho.curso;
-- 3) Inserir um novo curso, cujo o código é igual a 321
INSERT INTO cursinho.curso(cod_curso) VALUES (321);
-- 4) Selecione o nome do curso cujo o código é igual a 321
SELECT nome FROM cursinho.curso WHERE cod_curso=321;
-- 5) Selecione todos os nomes de disciplinas que comecem com a letra B
SELECT nome FROM cursinho.disciplina WHERE nome LIKE 'B%' 
	-- '%' ao final significa que vai procurar o que COMEÇA com B
	-- '%' ao final ele vai procurar as variáveis que TERMINAM em B.
-- 6) Adicione um novo atributo em disciplina, valor (numeric)
ALTER TABLE cursinho.disciplina ADD valor numeric(50,1);
-- 7) Adicionar valores para todas as disciplinas cadastradas
UPDATE cursinho.disciplina SET valor=45;
UPDATE cursinho.disciplina SET valor=45 WHERE cod_discp = 45 AND nome = 'LFA';

SELECT * FROM cursinho.disciplina;
-- 8) Liste a média dos valores de todas as disciplinas
SELECT AVG(valor) AS media FROM cursinho.disciplina;
-- 9) Liste o código das disciplinas 'BD' e 'IA'
SELECT cod_discp FROM cursinho.disciplina WHERE nome = 'POO' OR nome = 'Cobol'

-- 10) Liste o nome dos cursos que tenham a disciplina cujo o código é 2
SELECT c.nome FROM cursinho.disciplina d, cursinho.curso c;
SELECT c.nome
FROM cursinho.disciplina d, cursinho.curso c, cursinho.curriculo w
WHERE w.codc=c.cod_curso 
AND w.codd=d.cod_discp
AND d.cod_discp=2