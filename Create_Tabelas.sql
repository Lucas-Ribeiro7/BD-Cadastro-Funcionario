-- Criando Tabelas no schemas "cadastro"

--Tabela Pessoa
CREATE TABLE cadastro.pessoa
(
    id_pessoa serial NOT NULL,
    id_cidade integer,
    id_estado_civil integer,
    nome character varying,
    cpf character varying,
    cadastro time without time zone,
    nascimento time without time zone,
    CONSTRAINT pk_pessoa PRIMARY KEY (id_pessoa)
);

ALTER TABLE cadastro.pessoa
    OWNER to postgres;
    
--Tabela Estado
CREATE TABLE cadastro.estado
(
    id_estado serial NOT NULL,
    sigla character varying(2),
    estado character varying(250),
    CONSTRAINT pk_estado PRIMARY KEY (id_estado)
);

ALTER TABLE cadastro.estado
    OWNER to postgres;
    
--Tabela Estado Civil
CREATE TABLE cadastro."estado civil"
(
    id_estado_civil serial NOT NULL,
    estado_civil character varying(250),
    CONSTRAINT pk_estado_civil PRIMARY KEY (id_estado_civil)
);

ALTER TABLE cadastro."estado civil"
    OWNER to postgres;  
    
--Tabela Cidades
CREATE TABLE cadastro.cidades
(
    id_cidade serial NOT NULL,
    id_estado integer,
    cidade character varying(350),
    CONSTRAINT pk_cidade PRIMARY KEY (id_cidade)
);

ALTER TABLE cadastro.cidades
    OWNER to postgres;
    
--Tabela Cargo
CREATE TABLE cadastro.cargo
(
    id_cargo serial NOT NULL,
    ativo boolean,
    CONSTRAINT pk_cargo PRIMARY KEY (id_cargo)
);

ALTER TABLE cadastro.cargo
    OWNER to postgres;
    
--Tabela Funcionário
CREATE TABLE cadastro.funcionario
(
    id_funcionario serial NOT NULL,
    id_pessoa integer,
    id_cargo integer,
    ativo boolean,
    salario_base integer,
    premiacao integer,
    vale_transporte boolean,
    plano_odonto integer,
    admissao date,
    CONSTRAINT pk_funcionario PRIMARY KEY (id_funcionario)
);

ALTER TABLE cadastro.funcionario
    OWNER to postgres;
    
--Tabela Dependente
CREATE TABLE cadastro.dependente
(
    id_dependente serial NOT NULL,
    id_pessoa integer,
    id_funcionario integer,
    id_parentesco character varying,
    ativo boolean,
    CONSTRAINT pk_dependente PRIMARY KEY (id_dependente)
);

ALTER TABLE cadastro.dependente
    OWNER to postgres;
    
--Tabela Cliente
   CREATE TABLE cadastro.cliente
(
    id_cliente serial NOT NULL,
    id_pessoa integer,
    ativo boolean,
    empresa character varying,
    autorizado boolean,
    CONSTRAINT pk_cliente PRIMARY KEY (id_cliente)
);

ALTER TABLE cadastro.cliente
    OWNER to postgres;