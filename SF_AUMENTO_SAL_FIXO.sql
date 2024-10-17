DELIMITER $$

CREATE FUNCTION calcular_aumento_salario (salario_atual DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN salario_atual * 1.20;
END $$

DELIMITER ;
