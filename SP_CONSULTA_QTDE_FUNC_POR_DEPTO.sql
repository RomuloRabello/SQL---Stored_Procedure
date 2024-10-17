DROP PROCEDURE IF EXISTS SP_CONSULTA_QTDE_FUNC_POR_DEPTO;


DELIMITER $$
CREATE PROCEDURE SP_CONSULTA_QTDE_FUNC_POR_DEPTO( IN sp_codDepto INT)
BEGIN
	SELECT COUNT(f.cod_depto) as qtdFuncionario
        FROM funcionario f 
        WHERE sp_codDepto = f.cod_depto;
END $$
DELIMITER ;

	