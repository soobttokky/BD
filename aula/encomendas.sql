CREATE TABLE encomendas.cliente(
	cpf integer primary key,
	nome character varying (100)
);

CREATE TABLE encomendas.encomenda(
	cod integer primary key,
	valor integer,
	cpf integer,
	dt date,
	
	foreign key (cpf) REFERENCES encomendas.cliente (cpf)
);