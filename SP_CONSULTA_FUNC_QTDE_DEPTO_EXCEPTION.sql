DELIMITER $$

CREATE PROCEDURE SP_CONSULTA_FUNC_QTDE_DEPTO_EXCEPTION(IN sp_codDepto INT)
BEGIN
    DECLARE qtde INT DEFAULT 0;
    
    IF sp_codDepto IS NULL THEN
		SELECT ' Código não informado' as Mensagem;
    ELSE
		SELECT COUNT(*) INTO qtde
        from departamento
        where cod_depto = sp_codDepto;
        
        IF qtde = 0 THEN
			select 'Depto Inexistente' as Mensagem;
		ELSE
			SELECT COUNT(f.cod_func) AS QuantidadeFuncionarios
        FROM funcionario f
        WHERE f.cod_depto = codDepto;        
    
		END IF;
	END IF;
END $$

DELIMITER ;