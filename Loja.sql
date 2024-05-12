CREATE TABLE loja.marca(
      codigo SERIAL PRIMARY KEY,
      nome varchar (250) not null
);

INSERT INTO loja.marca (nome) VALUES ('Nestlé');
INSERT INTO loja.marca (nome) VALUES ('Kopenhagen');
INSERT INTO loja.marca (nome) VALUES ('Cacau Show');
INSERT INTO loja.marca (nome) VALUES ('Lindt');

SELECT * FROM loja.marca;

CREATE TABLE loja.chocolates(
      codigo SERIAL PRIMARY KEY,
      nome varchar (250) not null,
      valor NUMERIC (10,2),
      codigo_marca INTEGER,
      FOREIGN KEY (codigo_marca) REFERENCES loja.marca (codigo)
);

INSERT INTO loja.chocolates (nome, valor,codigo_marca) VALUES ('kitkat', 4.50, 1);
INSERT INTO loja.chocolates (nome, valor,codigo_marca) VALUES ('suflair', 6.00, 1);
INSERT INTO loja.chocolates (nome, valor,codigo_marca) VALUES ('chokito', 4.50, 1);
INSERT INTO loja.chocolates (nome, valor,codigo_marca) VALUES ('lingua de gato', 8.90, 2);
INSERT INTO loja.chocolates (nome, valor,codigo_marca) VALUES ('nhá benta', 7.00, 2);
INSERT INTO loja.chocolates (nome, valor,codigo_marca) VALUES ('bombom maracujá', 2.50, 3);
INSERT INTO loja.chocolates (nome, valor,codigo_marca) VALUES ('bombom cereja', 3.50, 3);
INSERT INTO loja.chocolates (nome) VALUES ('bombom chocolate branco');
INSERT INTO loja.chocolates (nome, valor) VALUES ('bombom pistache', 6.00);
INSERT INTO loja.chocolates (nome) VALUES ('natal');

SELECT * FROM loja.chocolates 

SELECT * FROM loja.marca INNER JOIN loja.chocolates
ON loja.marca.codigo = loja.chocolates.codigo_marca;

SELECT * FROM loja.marca LEFT OUTER JOIN loja.chocolates
ON loja.marca.codigo = loja.chocolates.codigo_marca;

SELECT * FROM loja.marca LEFT OUTER JOIN loja.chocolates
ON loja.marca.codigo = loja.chocolates.codigo_marca
WHERE loja.chocolates.codigo_marca IS NULL; 

SELECT * FROM loja.marca RIGHT OUTER JOIN loja.chocolates
ON loja.marca.codigo = loja.chocolates.codigo_marca;

SELECT * FROM loja.marca RIGHT OUTER JOIN loja.chocolates
ON loja.marca.codigo = loja.chocolates.codigo_marca
WHERE marca.codigo IS NULL; 

SELECT * FROM loja.marca FULL OUTER JOIN loja.chocolates
ON loja.marca.codigo = loja.chocolates.codigo_marca;

SELECT * FROM loja.marca FULL OUTER JOIN loja.chocolates
ON loja.marca.codigo = loja.chocolates.codigo_marca
WHERE loja.chocolates.codigo_marca IS NULL
OR loja.marca.codigo IS NULL;

SELECT max(valor) FROM loja.chocolates;
SELECT * FROM loja.chocolates WHERE valor = 8.9;

SELECT * FROM loja.chocolates
WHERE valor =(SELECT max (valor) FROM loja.chocolates);

INSERT INTO loja.chocolates (nome, codigo_marca) VALUES ('Bombom 55%', 
		(SELECT codigo FROM loja.marca WHERE nome = 'Cacau Show'));
		
UPDATE loja.chocolates SET valor = valor * 0.9
WHERE codigo_marca = 
	(SELECT codigo FROM loja.marca WHERE nome = 'Cacau Show')
	
DELETE FROM loja.chocolates
WHERE codigo_marca =
	(SELECT codigo FROM loja.marca WHERE nome = 'Kopenhagen')