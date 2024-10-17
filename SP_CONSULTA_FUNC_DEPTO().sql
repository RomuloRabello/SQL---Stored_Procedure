-- 1) Listar o código e o nome dos funcionários e o código e o nome dos departamentos Onde estão alocados.  
    
    DROP PROCEDURE IF exists SP_CONSULTA_FUNC_DEPTO;
    DELIMITER $$
    CREATE PROCEDURE  SP_CONSULTA_FUNC_DEPTO()
    BEGIN
		SELECT f.nome as Nome_Funcionarrio,
        f.cod_func as códFuncionario,
        d.nome as Nome_depto,
        d.cod_depto as códDepto
        FROM funcionario f JOIN departamento d on f.cod_depto = d.cod_depto;
	END $$
	DELIMITER ;
    
    CALL SP_CONSULTA_FUNC_DEPTO();
    
    