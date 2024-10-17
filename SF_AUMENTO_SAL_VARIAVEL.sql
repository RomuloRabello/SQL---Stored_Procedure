DELIMITER $$

CREATE FUNCTION SF_AUMENTO_SAL_VARIAVEL (salario_atual DECIMAL(10,2), percentual_aumento DECIMAL(5,2))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE salario_com_aumento DECIMAL(10,2);
    -- Calcula o aumento baseado no percentual fornecido
    SET salario_com_aumento = salario_atual * (1 + (percentual_aumento / 100));
    -- Formata o valor no formato brasileiro (com vírgula para decimais)
    RETURN FORMAT(salario_com_aumento, 2, 'de_DE');
END $$

DELIMITER ;
