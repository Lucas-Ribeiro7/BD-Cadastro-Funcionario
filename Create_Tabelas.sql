--Tabelas Criadas junto com as Chaves Estrangeira

--Tabela CARGO
CREATE TABLE cadastro.tb_cargo
(
isn_cargo serial NOT NULL,
dsc_cargo character varying(250),
flg_ativo boolean,
CONSTRAINT tb_cargo_pkey PRIMARY KEY (isn_cargo)
);

--Tabela ESTADO CIVIL
CREATE TABLE cadastro.tb_estado_civil
(
isn_estado_civil serial NOT NULL,
dsc_estado_civil character varying(250),
CONSTRAINT tb_estado_civil_pkey PRIMARY KEY (isn_estado_civil)
);

--Tabela ESTADO
CREATE TABLE cadastro.tb_estado
(
isn_estado serial NOT NULL,
dsc_sigla character varying(2),
dsc_estado character varying(250),
CONSTRAINT tb_estado_pkey PRIMARY KEY (isn_estado)
);

--Tabela CIDADE
CREATE TABLE cadastro.tb_cidade
(
isn_cidade serial NOT NULL,
isn_estado integer,
dsc_cidade character varying(350),
CONSTRAINT tb_cidade_pkey PRIMARY KEY (isn_cidade),
CONSTRAINT tb_cidade_isn_estado_fkey FOREIGN KEY (isn_estado)
REFERENCES cadastro.tb_estado (isn_estado) MATCH SIMPLE
ON UPDATE NO ACTION ON DELETE NO ACTION
);

--Tabela PESSOA
create table cadastro.tb_pessoa
(
isn_pessoa serial NOT NULL,
isn_cidade integer,
isn_estado_civil integer,
dsc_nome character varying(500),
dsc_cpf character varying(11),
dth_cadastro timestamp without time zone,
dth_nascimento timestamp without time zone,
CONSTRAINT tb_pessoa_pkey PRIMARY KEY (isn_pessoa),
CONSTRAINT tb_pessoa_isn_cidade_fkey FOREIGN KEY (isn_cidade)
REFERENCES cadastro.tb_cidade (isn_cidade) MATCH SIMPLE
ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT tb_pessoa_isn_estado_civil_fkey FOREIGN KEY (isn_estado_civil)
REFERENCES cadastro.tb_estado_civil (isn_estado_civil) MATCH SIMPLE
ON UPDATE NO ACTION ON DELETE NO ACTION
);

--Tabela CLIENTE
CREATE TABLE cadastro.tb_cliente
(
isn_cliente serial NOT NULL,
isn_pessoa integer,
flg_ativo boolean,
flg_autorizado boolean,
CONSTRAINT tb_cliente_pkey PRIMARY KEY (isn_cliente),
CONSTRAINT tb_cliente_isn_pessoa_fkey FOREIGN KEY (isn_pessoa)
REFERENCES cadastro.tb_pessoa (isn_pessoa) MATCH SIMPLE
ON UPDATE NO ACTION ON DELETE NO ACTION
);

--Tabela FUNCIONARIO
CREATE TABLE cadastro.tb_funcionario
(
isn_funcionario serial NOT NULL,
isn_pessoa integer,
isn_cargo integer,
flg_ativo boolean,
vlr_salario_base numeric(18,2),
vlr_premiacao numeric(18,2),
flg_vale_transporte boolean,
vlr_plano_odonto numeric(18,2),
dth_admissao timestamp without time zone,
CONSTRAINT tb_funcionario_pkey PRIMARY KEY (isn_funcionario),
CONSTRAINT tb_funcionario_isn_cargo_fkey FOREIGN KEY (isn_cargo)
REFERENCES cadastro.tb_cargo (isn_cargo) MATCH SIMPLE
ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT tb_funcionario_isn_pessoa_fkey FOREIGN KEY (isn_pessoa)
REFERENCES cadastro.tb_pessoa (isn_pessoa) MATCH SIMPLE
ON UPDATE NO ACTION ON DELETE NO ACTION
);

--Tabela DEPENDENTE
CREATE TABLE cadastro.tb_dependente
(
isn_dependente serial NOT NULL,
isn_pessoa integer,
isn_funcionario integer,
dsc_parentesco character varying(300),
flg_ativo boolean,
CONSTRAINT tb_dependente_pkey PRIMARY KEY (isn_dependente),
CONSTRAINT tb_dependente_isn_funcionario_fkey FOREIGN KEY (isn_funcionario)
REFERENCES cadastro.tb_funcionario (isn_funcionario) MATCH SIMPLE
ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT tb_dependente_isn_pessoa_fkey FOREIGN KEY (isn_pessoa)
REFERENCES cadastro.tb_pessoa (isn_pessoa) MATCH SIMPLE
ON UPDATE NO ACTION ON DELETE NO ACTION
);