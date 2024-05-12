CREATE TABLE cliente.cliente(
	codcliente integer primary key,
	cpf integer,
	name character varying  (100)
);

CREATE TABLE cliente.nf(
	numnf integer primary key,
	dt_emissao date,
	codcliente integer,
	name character varying (100),
	foreign key (codcliente) REFERENCES cliente.cliente (codcliente)
);

INSERT into cliente.cliente (codcliente, cpf) values (383212, 0265493);
INSERT into cliente.cliente (codcliente, cpf) values (362781, 0238626);

INSERT into cliente.nf (numnf, dt_emissao, codcliente) values (234,'2016-06-22 19:10:25-07', 383212);
INSERT into cliente.nf (numnf, dt_emissao, codcliente) values (235,'2016-06-26 19:10:25-07', 362781);

select * FROM cliente.cliente
select * FROM cliente.nf

