 create database Traine_Stored_Procedure;

CREATE TABLE IF NOT EXISTS departamento
(
  cod_depto INT NOT NULL,
  nome VARCHAR(45) NULL,
  valor_orcamento DECIMAL(8,2) NULL,
  dt_criacao DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (cod_depto)
);

-- -----------------------------------------------------
-- Table cargo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cargo
(
  cod_cargo INT NOT NULL,
  nome VARCHAR(45) NULL,
  dt_criacao DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (cod_cargo)
);

-- -----------------------------------------------------
-- Table funcionario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS funcionario
(
  cod_func INT NOT NULL,
  nome VARCHAR(45) NULL,
  email VARCHAR(45) NULL,
  cpf VARCHAR(45) NULL,
  salario DECIMAL(8,2) NULL,
  dt_nascimento date NULL,
  cod_depto INT NULL,
  cod_cargo INT NOT NULL,
  dt_admissao DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (cod_func),
  UNIQUE INDEX cpf_UNIQUE (cpf ASC),
  INDEX fk_funcionario_departamento_idx (cod_depto ASC),
  INDEX fk_funcionario_cargo_idx (cod_cargo ASC),
  CONSTRAINT fk_funcionario_departamento
    FOREIGN KEY (cod_depto)
    REFERENCES departamento (cod_depto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_funcionario_cargo
    FOREIGN KEY (cod_cargo)
    REFERENCES cargo (cod_cargo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table auditoria
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS auditoria
(
  cod_audit INT NOT NULL AUTO_INCREMENT,
  dt_audit DATETIME NULL,
  usuario_bd VARCHAR(45) NULL,
  mensagem VARCHAR(100) NULL,
  PRIMARY KEY (cod_audit)
);

-- -----------------------------------------------------
-- Popular a base de dados departamento
-- -----------------------------------------------------
INSERT INTO departamento (cod_depto, nome, valor_orcamento) 
VALUES 
(100, 'Tecnologia da Informação', 100000),
(200, 'Produto', 200000),
(300, 'Serviços', 100000),
(400, 'Recursos Humanos', 90000), 
(500, 'Diretoria', 500000);

-- -----------------------------------------------------
-- Popular a base de dados unip_lpbd.cargo
-- -----------------------------------------------------
INSERT INTO cargo (cod_cargo, nome) 
VALUES 
(10,'Analista de Sistemas'),
(20, 'Desenvolvedor Full Stack'),
(30, 'Motorista'),
(40, 'Analista de RH'),
(50, 'Vice-Presidente');

-- -------------------------------------------------------------------------------------------------
-- Popular a base de dados unip_lpbd.funcionariodepartamento
-- -------------------------------------------------------------------------------------------------
INSERT INTO funcionario (cod_func, nome, email, cpf, salario, dt_nascimento, cod_depto, cod_cargo)
VALUES 
(1000, 'Mario', 'mario.quinello@docente.unip.br', 11111111111, '20000', '1989-01-10', 100, 10),
(1100, 'Fernando', 'fernando@fernando.com.br', 22222222222, '10000', '1998-05-23', 100, 10),
(1200, 'Otavio', 'otavio@otavio.com.br', 33333333333, '30000', '1979-10-28', 100, 20),
(1300, 'Lauro', 'lauro@lauro.com.br', 44444444444, '30000', '1980-03-02', 100, 20),
(1400, 'Gumercindo', 'gumercindo@gumercindo.com.br', 55555555555, '20000', '1982-07-31', 100, 20),
(1500, 'Roberto', 'roberto@roberto.com.br', 66666666666, '20000', '2000-06-18', 400, 40),
(1600, 'Claudio', 'claudio@claudio.com.br', 77777777777, '20000', '2001-08-21', 500, 50);



SELECT * FROM departamento;

SELECT * FROM cargo;

SELECT * FROM funcionario;