--Conexões das tabelas

--Conexão Cidade
alter table cadastro.cidades
add constraint cidades_estado_fk 
foreign key (id_estado) 
references cadastro.estado (id_estado);

--Conexão Cliente
alter table cadastro.cliente 
add constraint cliente_pessoa_fk 
foreign key (id_pessoa) 
references cadastro.pessoa (id_pessoa);

--Conexão Dependente
alter table cadastro.dependente 
add constraint dependente_funcionario_fk 
foreign key (id_funcionario) 
references cadastro.funcionario (id_funcionario);

alter table cadastro.dependente 
add constraint dependente_pessoa_fk 
foreign key (id_pessoa) 
references cadastro.pessoa (id_pessoa);

--Conexão Funcionário
alter table cadastro.funcionario
add constraint funcionario_pessoa_fk 
foreign key (id_pessoa) 
references cadastro.pessoa (id_pessoa);

alter table cadastro.funcionario
add constraint funcionario_cargo_fk 
foreign key (id_cargo) 
references cadastro.cargo (id_cargo);

--Conexão Pessoa
alter table cadastro.pessoa 
add constraint pessoa_estado_civil_fk 
foreign key (id_estado_civil) 
references cadastro."estado civil" (id_estado_civil);

alter table cadastro.pessoa 
add constraint pessoa_cidade_fk 
foreign key (id_cidade) 
references cadastro.cidades (id_cidade);