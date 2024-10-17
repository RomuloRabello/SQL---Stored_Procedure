DELIMITER //

CREATE PROCEDURE SP_CONSULTA_FUNC_QTDE_DEPTO_XYZ(IN codDepto INT)
BEGIN
    DECLARE qtde INT DEFAULT 0;
    SELECT COUNT(*) INTO qtde
    FROM departamento
    WHERE cod_depto = codDepto;

    IF qtde = 0 THEN
        SELECT 'Depto Inexistente!' AS Mensagem;
    ELSE
        SELECT COUNT(f.cod_func) AS QuantidadeFuncionarios
        FROM funcionario f
        WHERE f.cod_depto = codDepto;
    END IF;
END //

DELIMITER ;
