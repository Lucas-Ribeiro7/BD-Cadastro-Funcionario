--Consultas 

select * from cadastro.tb_cargo tc order by dsc_cargo asc; --Ou desc que é descresente 
select isn_estado_civil,count(*) from cadastro.tb_pessoa tp group by isn_estado_civil; --Estado civil das pessoas e o Count(*) vai contar quantas pessoas vai ter em cada estado civil
select isn_cargo, count(*), sum(vlr_salario_base), avg(vlr_salario_base ), min(vlr_salario_base ), max(vlr_salario_base )from cadastro.tb_funcionario a group by isn_cargo; -- AVG Calcula a média, Min é o menor valor, e o max é o maior valor