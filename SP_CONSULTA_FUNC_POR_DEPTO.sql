-- Listar o código e o nome dos funcionários e o código e o nome do departamento 
-- formado, ou seja, o código do departamento é passado para a SP com um 
-- parâmetro de entrada.

DROP PROCEDURE if exists SP_CONSULTA_FUNC_POR_DEPTO;

    DELIMITER $$
    CREATE PROCEDURE  SP_CONSULTA_FUNC_POR_DEPTO( in sp_codDepto int)
    BEGIN
		SELECT f.nome as Nome_Funcionarrio,
        f.cod_func as códFuncionario,
        d.nome as Nome_depto,
        d.cod_depto as códDepto
        FROM funcionario f JOIN departamento d on f.cod_depto = d.cod_depto
        where sp_codDepto = d.cod_depto;
	END $$
	DELIMITER ;
    
    
