CREATE TABLE projeto.engenheiro( -- entidade
	cod_eng integer primary key,
	nome character varying (100)
);

CREATE TABLE projeto.projeto( -- entidade
	cod_proj integer primary key,
	titulo character varying (100)
);

CREATE TABLE projeto.atuacao( -- relacionamento
	cod_eng integer,
	cod_proj integer,
	titulo character varying (100),
	-- referencia as duas PK de cada entidade neste relacionamento
	foreign key (cod_eng) REFERENCES projeto.engenheiro (cod_eng),
	foreign key (cod_proj) REFERENCES projeto.projeto (cod_proj)
);