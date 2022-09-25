
-- criando database oficina

CREATE DATABASE IF NOT EXISTS Oficina;
USE Oficina;


-- criando tabela Pagamento

CREATE TABLE IF NOT EXISTS `Oficina`.`Pagamento` (
  `idPagamento` INT NOT NULL AUTO_INCREMENT,
  `Debito` VARCHAR(45) NULL,
  `Credito` VARCHAR(45) NULL,
  `Dinheiro` VARCHAR(45) NULL,
  PRIMARY KEY (`idPagamento`)
  );



-- criando tabela Autorizacao

CREATE TABLE IF NOT EXISTS `Oficina`.`Autorizacao` (
  `idAutorizacao` INT NOT NULL,
  `Autorizado` TINYINT NOT NULL,
  PRIMARY KEY (`idAutorizacao`)
  );



-- criando tabela Cliente

CREATE TABLE IF NOT EXISTS `Oficina`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `CPF` CHAR(11) NOT NULL,
  `Pagamento_idPagamento` INT NOT NULL,
  `Autorizacao_idAutorizacao` INT NOT NULL,
  PRIMARY KEY (`idCliente`, `Pagamento_idPagamento`, `Autorizacao_idAutorizacao`),
  INDEX `fk_Cliente_Pagamento1_idx` (`Pagamento_idPagamento` ASC) VISIBLE,
  INDEX `fk_Cliente_Autorizacao1_idx` (`Autorizacao_idAutorizacao` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Pagamento1`
    FOREIGN KEY (`Pagamento_idPagamento`)
    REFERENCES `Oficina`.`Pagamento` (`idPagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_Autorizacao1`
    FOREIGN KEY (`Autorizacao_idAutorizacao`)
    REFERENCES `Oficina`.`Autorizacao` (`idAutorizacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
	);



-- criando tabela Mecanico

CREATE TABLE IF NOT EXISTS `Oficina`.`Mecanico` (
  `idMecanico` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Especialidade` VARCHAR(45) NOT NULL,
  `Endereco` VARCHAR(45) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Cliente_Pagamento_idPagamento` INT NOT NULL,
  `Cliente_Autorizacao_idAutorizacao` INT NOT NULL,
  PRIMARY KEY (`idMecanico`, `Cliente_idCliente`, `Cliente_Pagamento_idPagamento`, `Cliente_Autorizacao_idAutorizacao`),
  INDEX `fk_Mecanico_Cliente1_idx` (`Cliente_idCliente` ASC, `Cliente_Pagamento_idPagamento` ASC, `Cliente_Autorizacao_idAutorizacao` ASC) VISIBLE,
  CONSTRAINT `fk_Mecanico_Cliente1`
    FOREIGN KEY (`Cliente_idCliente` , `Cliente_Pagamento_idPagamento` , `Cliente_Autorizacao_idAutorizacao`)
    REFERENCES `Oficina`.`Cliente` (`idCliente` , `Pagamento_idPagamento` , `Autorizacao_idAutorizacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
	);



-- criando tabela Referencia_mao_de_obra`

CREATE TABLE IF NOT EXISTS `Oficina`.`Referencia_mao_de_obra` (
  `idReferencia_mao_de_obra` INT NOT NULL,
  `Descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`idReferencia_mao_de_obra`)
  );



-- criando tabela Ordem_de_servico

CREATE TABLE IF NOT EXISTS `Oficina`.`Ordem_de_servico` (
  `idOrdem_de_servico` INT NOT NULL AUTO_INCREMENT,
  `Valor` FLOAT NOT NULL,
  `Data_emissao` DATE NULL,
  `Data_conclusao` DATE NULL,
  `Status` ENUM('Em processamnto', 'Gerado') NOT NULL DEFAULT 'Em processamento',
  `Referencia_mao_de_obra_idReferencia_mao_de_obra` INT NOT NULL,
  PRIMARY KEY (`idOrdem_de_servico`, `Referencia_mao_de_obra_idReferencia_mao_de_obra`),
  INDEX `fk_Ordem_de_servico_Referencia_mao_de_obra1_idx` (`Referencia_mao_de_obra_idReferencia_mao_de_obra` ASC) VISIBLE,
  CONSTRAINT `fk_Ordem_de_servico_Referencia_mao_de_obra1`
    FOREIGN KEY (`Referencia_mao_de_obra_idReferencia_mao_de_obra`)
    REFERENCES `Oficina`.`Referencia_mao_de_obra` (`idReferencia_mao_de_obra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
	);



-- criando tabela Veiculo

CREATE TABLE IF NOT EXISTS `Oficina`.`Veiculo` (
  `idVeiculo` INT NOT NULL AUTO_INCREMENT,
  `Placa` VARCHAR(45) NOT NULL,
  `Modelo` VARCHAR(45) NOT NULL,
  `Ano` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Cliente_Pagamento_idPagamento` INT NOT NULL,
  `Cliente_Autorizacao_idAutorizacao` INT NOT NULL,
  PRIMARY KEY (`idVeiculo`, `Cliente_idCliente`, `Cliente_Pagamento_idPagamento`, `Cliente_Autorizacao_idAutorizacao`),
  INDEX `fk_Veiculo_Cliente1_idx` (`Cliente_idCliente` ASC, `Cliente_Pagamento_idPagamento` ASC, `Cliente_Autorizacao_idAutorizacao` ASC) VISIBLE,
  CONSTRAINT `fk_Veiculo_Cliente1`
    FOREIGN KEY (`Cliente_idCliente` , `Cliente_Pagamento_idPagamento` , `Cliente_Autorizacao_idAutorizacao`)
    REFERENCES `Oficina`.`Cliente` (`idCliente` , `Pagamento_idPagamento` , `Autorizacao_idAutorizacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
	);



-- criando tabela Servico

CREATE TABLE IF NOT EXISTS `Oficina`.`Servico` (
  `idServico` INT NOT NULL AUTO_INCREMENT,
  `Descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idServico`)
  );



-- criando tabela Peca

CREATE TABLE IF NOT EXISTS `Oficina`.`Peca` (
  `idPeca` INT NOT NULL AUTO_INCREMENT,
  `Descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPeca`)
  );



-- criando tabela Servico_OS

CREATE TABLE IF NOT EXISTS `Oficina`.`Servico_OS` (
  `Ordem_de_servico_idOrdem_de_servico` INT NOT NULL,
  `Servico_idServico` INT NOT NULL,
  PRIMARY KEY (`Ordem_de_servico_idOrdem_de_servico`, `Servico_idServico`),
  INDEX `fk_Ordem_de_servico_has_Servico_Servico1_idx` (`Servico_idServico` ASC) VISIBLE,
  INDEX `fk_Ordem_de_servico_has_Servico_Ordem_de_servico_idx` (`Ordem_de_servico_idOrdem_de_servico` ASC) VISIBLE,
  CONSTRAINT `fk_Ordem_de_servico_has_Servico_Ordem_de_servico`
    FOREIGN KEY (`Ordem_de_servico_idOrdem_de_servico`)
    REFERENCES `Oficina`.`Ordem_de_servico` (`idOrdem_de_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ordem_de_servico_has_Servico_Servico1`
    FOREIGN KEY (`Servico_idServico`)
    REFERENCES `Oficina`.`Servico` (`idServico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
	);



-- criando tabela Peca_OS

CREATE TABLE IF NOT EXISTS `Oficina`.`Peca_OS` (
  `Peca_idPeca` INT NOT NULL,
  `Ordem_de_servico_idOrdem_de_servico` INT NOT NULL,
  PRIMARY KEY (`Peca_idPeca`, `Ordem_de_servico_idOrdem_de_servico`),
  INDEX `fk_Peca_has_Ordem_de_servico_Ordem_de_servico1_idx` (`Ordem_de_servico_idOrdem_de_servico` ASC) VISIBLE,
  INDEX `fk_Peca_has_Ordem_de_servico_Peca1_idx` (`Peca_idPeca` ASC) VISIBLE,
  CONSTRAINT `fk_Peca_has_Ordem_de_servico_Peca1`
    FOREIGN KEY (`Peca_idPeca`)
    REFERENCES `Oficina`.`Peca` (`idPeca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Peca_has_Ordem_de_servico_Ordem_de_servico1`
    FOREIGN KEY (`Ordem_de_servico_idOrdem_de_servico`)
    REFERENCES `Oficina`.`Ordem_de_servico` (`idOrdem_de_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
	);



-- criando tabela Equipe_mecanicos

CREATE TABLE IF NOT EXISTS `Oficina`.`Equipe_mecanicos` (
  `Ordem_de_servico_idOrdem_de_servico` INT NOT NULL,
  `Ordem_de_servico_Referencia_mao_de_obra_idReferencia_mao_de_obra` INT NOT NULL,
  `Mecanico_idMecanico` INT NOT NULL,
  `Mecanico_Cliente_idCliente` INT NOT NULL,
  `Mecanico_Cliente_Pagamento_idPagamento` INT NOT NULL,
  `Mecanico_Cliente_Autorizacao_idAutorizacao` INT NOT NULL,
  PRIMARY KEY (`Ordem_de_servico_idOrdem_de_servico`, `Ordem_de_servico_Referencia_mao_de_obra_idReferencia_mao_de_obra`, `Mecanico_idMecanico`, `Mecanico_Cliente_idCliente`, `Mecanico_Cliente_Pagamento_idPagamento`, `Mecanico_Cliente_Autorizacao_idAutorizacao`),
  INDEX `fk_Ordem_de_servico_has_Mecanico_Mecanico1_idx` (`Mecanico_idMecanico` ASC, `Mecanico_Cliente_idCliente` ASC, `Mecanico_Cliente_Pagamento_idPagamento` ASC, `Mecanico_Cliente_Autorizacao_idAutorizacao` ASC) VISIBLE,
  INDEX `fk_Ordem_de_servico_has_Mecanico_Ordem_de_servico1_idx` (`Ordem_de_servico_idOrdem_de_servico` ASC, `Ordem_de_servico_Referencia_mao_de_obra_idReferencia_mao_de_obra` ASC) VISIBLE,
  CONSTRAINT `fk_Ordem_de_servico_has_Mecanico_Ordem_de_servico1`
    FOREIGN KEY (`Ordem_de_servico_idOrdem_de_servico` , `Ordem_de_servico_Referencia_mao_de_obra_idReferencia_mao_de_obra`)
    REFERENCES `Oficina`.`Ordem_de_servico` (`idOrdem_de_servico` , `Referencia_mao_de_obra_idReferencia_mao_de_obra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ordem_de_servico_has_Mecanico_Mecanico1`
    FOREIGN KEY (`Mecanico_idMecanico` , `Mecanico_Cliente_idCliente` , `Mecanico_Cliente_Pagamento_idPagamento` , `Mecanico_Cliente_Autorizacao_idAutorizacao`)
    REFERENCES `Oficina`.`Mecanico` (`idMecanico` , `Cliente_idCliente` , `Cliente_Pagamento_idPagamento` , `Cliente_Autorizacao_idAutorizacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
	);


