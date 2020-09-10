--Consultas 

select * from cadastro.tb_cargo tc order by dsc_cargo asc; --Ou desc que é descresente 
select isn_estado_civil,count(*) from cadastro.tb_pessoa tp group by isn_estado_civil; --Estado civil das pessoas e o Count(*) vai contar quantas pessoas vai ter em cada estado civil
select isn_cargo, count(*), sum(vlr_salario_base), avg(vlr_salario_base ), min(vlr_salario_base ), max(vlr_salario_base )from cadastro.tb_funcionario a group by isn_cargo; -- AVG Calcula a média, Min é o menor valor, e o max é o maior valor

select sum(vlr_salario_base) from cadastro.tb_funcionario tf; --Soma dos Salarios dos Funcinarios

select sum(vlr_premiacao) from cadastro.tb_funcionario tf; --Soma das Premiações 

select sum(vlr_plano_odonto) from cadastro.tb_funcionario tf; --Soma do valor dos Planos de Odonto

select sum((vlr_salario_base + vlr_premiacao) - vlr_plano_odonto) as sal_liquid from cadastro.tb_funcionario a; --Salário Liquido

select count(isn_funcionario) from cadastro.tb_funcionario tf; --Quantidade de Funcionarios

select count(isn_cliente) from cadastro.tb_cliente tc; --Quantidade de Clientes

select max(vlr_salario_base) from cadastro.tb_funcionario tf; --O maior salário

select isn_funcionario from cadastro.tb_funcionario tf where flg_ativo = false; --Funcionarios que estão inativos

select isn_cliente from cadastro.tb_cliente tc where flg_ativo = false; --Clientes que estão inativos

select count(isn_pessoa) from cadastro.tb_pessoa tp ; --Quantidade de Pessoas
