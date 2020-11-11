-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema beautyrecord
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `beautyrecord` ;

-- -----------------------------------------------------
-- Schema beautyrecord
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `beautyrecord` DEFAULT CHARACTER SET utf8 ;
USE `beautyrecord` ;

-- -----------------------------------------------------
-- Table `beautyrecord`.`Funcionário`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beautyrecord`.`Funcionário` (
  `idFuncionário` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`idFuncionário`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beautyrecord`.`Procedimentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beautyrecord`.`Procedimentos` (
  `idProcedimento` INT NOT NULL AUTO_INCREMENT,
  `nomeProcedimento` VARCHAR(45) NOT NULL,
  `valor` VARCHAR(45) NOT NULL DEFAULT 'DECIMAL',
  PRIMARY KEY (`idProcedimento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beautyrecord`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beautyrecord`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beautyrecord`.`Atendimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beautyrecord`.`Atendimento` (
  `idAtendimento` INT NOT NULL AUTO_INCREMENT,
  `data_hora` DATETIME NOT NULL DEFAULT NOW(),
  `Funcionário_idFuncionário` INT NOT NULL,
  `Procedimentos_idProcedimento` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idAtendimento`),
  INDEX `fk_Atendimento_Funcionário_idx` (`Funcionário_idFuncionário` ASC),
  INDEX `fk_Atendimento_Procedimentos1_idx` (`Procedimentos_idProcedimento` ASC),
  INDEX `fk_Atendimento_Cliente1_idx` (`Cliente_idCliente` ASC),
  CONSTRAINT `fk_Atendimento_Funcionário`
    FOREIGN KEY (`Funcionário_idFuncionário`)
    REFERENCES `beautyrecord`.`Funcionário` (`idFuncionário`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Atendimento_Procedimentos1`
    FOREIGN KEY (`Procedimentos_idProcedimento`)
    REFERENCES `beautyrecord`.`Procedimentos` (`idProcedimento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Atendimento_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `beautyrecord`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `beautyrecord`.`Funcionário`
-- -----------------------------------------------------
START TRANSACTION;
USE `beautyrecord`;
INSERT INTO `beautyrecord`.`Funcionário` (`idFuncionário`, `nome`, `CPF`) VALUES (DEFAULT, 'Giovana', '07363776113');
INSERT INTO `beautyrecord`.`Funcionário` (`idFuncionário`, `nome`, `CPF`) VALUES (DEFAULT, 'Geovana', '08310407181');
INSERT INTO `beautyrecord`.`Funcionário` (`idFuncionário`, `nome`, `CPF`) VALUES (DEFAULT, 'Gabrielly', '05721115173');
INSERT INTO `beautyrecord`.`Funcionário` (`idFuncionário`, `nome`, `CPF`) VALUES (DEFAULT, 'Marielle', '04644715166');
INSERT INTO `beautyrecord`.`Funcionário` (`idFuncionário`, `nome`, `CPF`) VALUES (DEFAULT, 'Mariana', '08696669169');
INSERT INTO `beautyrecord`.`Funcionário` (`idFuncionário`, `nome`, `CPF`) VALUES (DEFAULT, 'Maryane', '04273755173');
INSERT INTO `beautyrecord`.`Funcionário` (`idFuncionário`, `nome`, `CPF`) VALUES (DEFAULT, 'Carolyne', '06348909131');
INSERT INTO `beautyrecord`.`Funcionário` (`idFuncionário`, `nome`, `CPF`) VALUES (DEFAULT, 'Pedro', '02239185120');
INSERT INTO `beautyrecord`.`Funcionário` (`idFuncionário`, `nome`, `CPF`) VALUES (DEFAULT, 'Gabriela', '07938736147');

COMMIT;


-- -----------------------------------------------------
-- Data for table `beautyrecord`.`Procedimentos`
-- -----------------------------------------------------
START TRANSACTION;
USE `beautyrecord`;
INSERT INTO `beautyrecord`.`Procedimentos` (`idProcedimento`, `nomeProcedimento`, `valor`) VALUES (DEFAULT, 'Selagem ', '140,00');
INSERT INTO `beautyrecord`.`Procedimentos` (`idProcedimento`, `nomeProcedimento`, `valor`) VALUES (DEFAULT, 'Corte', '35,00');
INSERT INTO `beautyrecord`.`Procedimentos` (`idProcedimento`, `nomeProcedimento`, `valor`) VALUES (DEFAULT, 'Hidratação', '40,00');
INSERT INTO `beautyrecord`.`Procedimentos` (`idProcedimento`, `nomeProcedimento`, `valor`) VALUES (DEFAULT, 'Unhas', '30,00');
INSERT INTO `beautyrecord`.`Procedimentos` (`idProcedimento`, `nomeProcedimento`, `valor`) VALUES (DEFAULT, 'Escova ', '40,00');
INSERT INTO `beautyrecord`.`Procedimentos` (`idProcedimento`, `nomeProcedimento`, `valor`) VALUES (DEFAULT, 'Make', '70,00');

COMMIT;


-- -----------------------------------------------------
-- Data for table `beautyrecord`.`Cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `beautyrecord`;
INSERT INTO `beautyrecord`.`Cliente` (`idCliente`, `nome`) VALUES (DEFAULT, 'Juliana');
INSERT INTO `beautyrecord`.`Cliente` (`idCliente`, `nome`) VALUES (DEFAULT, 'Carolina');
INSERT INTO `beautyrecord`.`Cliente` (`idCliente`, `nome`) VALUES (DEFAULT, 'Julia');
INSERT INTO `beautyrecord`.`Cliente` (`idCliente`, `nome`) VALUES (DEFAULT, 'Viviane');
INSERT INTO `beautyrecord`.`Cliente` (`idCliente`, `nome`) VALUES (DEFAULT, 'Beatriz');
INSERT INTO `beautyrecord`.`Cliente` (`idCliente`, `nome`) VALUES (DEFAULT, 'Amanda');
INSERT INTO `beautyrecord`.`Cliente` (`idCliente`, `nome`) VALUES (DEFAULT, 'Bianca');
INSERT INTO `beautyrecord`.`Cliente` (`idCliente`, `nome`) VALUES (DEFAULT, 'Milena');

COMMIT;


-- -----------------------------------------------------
-- Data for table `beautyrecord`.`Atendimento`
-- -----------------------------------------------------
START TRANSACTION;
USE `beautyrecord`;
INSERT INTO `beautyrecord`.`Atendimento` (`idAtendimento`, `data_hora`, `Funcionário_idFuncionário`, `Procedimentos_idProcedimento`, `Cliente_idCliente`) VALUES (DEFAULT, '2020-11-09 16:37:00', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO `beautyrecord`.`Atendimento` (`idAtendimento`, `data_hora`, `Funcionário_idFuncionário`, `Procedimentos_idProcedimento`, `Cliente_idCliente`) VALUES (DEFAULT, '2020-11-09 16:37:00', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO `beautyrecord`.`Atendimento` (`idAtendimento`, `data_hora`, `Funcionário_idFuncionário`, `Procedimentos_idProcedimento`, `Cliente_idCliente`) VALUES (DEFAULT, '2020-11-09 16:37:00', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO `beautyrecord`.`Atendimento` (`idAtendimento`, `data_hora`, `Funcionário_idFuncionário`, `Procedimentos_idProcedimento`, `Cliente_idCliente`) VALUES (DEFAULT, '2020-11-09 16:37:00', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO `beautyrecord`.`Atendimento` (`idAtendimento`, `data_hora`, `Funcionário_idFuncionário`, `Procedimentos_idProcedimento`, `Cliente_idCliente`) VALUES (DEFAULT, '2020-11-09 16:37:00', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO `beautyrecord`.`Atendimento` (`idAtendimento`, `data_hora`, `Funcionário_idFuncionário`, `Procedimentos_idProcedimento`, `Cliente_idCliente`) VALUES (DEFAULT, '2020-11-09 16:37:00', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO `beautyrecord`.`Atendimento` (`idAtendimento`, `data_hora`, `Funcionário_idFuncionário`, `Procedimentos_idProcedimento`, `Cliente_idCliente`) VALUES (DEFAULT, '2020-11-09 16:37:00', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO `beautyrecord`.`Atendimento` (`idAtendimento`, `data_hora`, `Funcionário_idFuncionário`, `Procedimentos_idProcedimento`, `Cliente_idCliente`) VALUES (DEFAULT, '2020-11-09 16:37:00', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO `beautyrecord`.`Atendimento` (`idAtendimento`, `data_hora`, `Funcionário_idFuncionário`, `Procedimentos_idProcedimento`, `Cliente_idCliente`) VALUES (DEFAULT, '2020-11-09 16:37:00', DEFAULT, DEFAULT, DEFAULT);

COMMIT;

