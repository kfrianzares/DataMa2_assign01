-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Teller`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Teller` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tell_name` VARCHAR(55) NULL,
  `tell_address` VARCHAR(45) NULL,
  `tell_desc` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Account_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Account_types (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	type VARCHAR(45) NOT NULL
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Client` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cli_name` VARCHAR(55) NOT NULL,
  `cli_address` VARCHAR(45) NOT NULL,
  `cli_acc_type` INT NOT NULL,
  `teller_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Client_Teller1_idx` (`teller_id` ASC),
  FOREIGN KEY (cli_acc_type) REFERENCES mydb.Account_types(mydb.Account_types.id),
  CONSTRAINT `fk_Client_Teller1`
    FOREIGN KEY (`teller_id`)
    REFERENCES `mydb`.`Teller` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Payment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pay_type` VARCHAR(45) NULL,
  `pay_address` VARCHAR(45) NULL,
  `client_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Payment_Client1_idx` (`client_id` ASC),
  CONSTRAINT `fk_Payment_Client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `mydb`.`Client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Account` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `acc_name` VARCHAR(45) NULL,
  `acc_desc` VARCHAR(45) NULL,
  `client_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Account_Client1_idx` (`client_id` ASC),
  CONSTRAINT `fk_Account_Client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `mydb`.`Client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Slip`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Slip` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `slip_size` VARCHAR(45) NULL,
  `slip_date` VARCHAR(45) NULL,
  `client_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Slip_Client1_idx` (`client_id` ASC),
  CONSTRAINT `fk_Slip_Client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `mydb`.`Client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Investment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Investment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `inv_type` VARCHAR(45) NULL,
  `inv_date` DATE NULL,
  `inv` DATE NULL,
  `client_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Investment_Client1_idx` (`client_id` ASC),
  CONSTRAINT `fk_Investment_Client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `mydb`.`Client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Loan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Loan` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `loan_amt` VARCHAR(45) NULL,
  `loan_date` DATE NULL,
  `loan_type` VARCHAR(45) NULL,
  `client_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Loan_Client1_idx` (`client_id` ASC),
  CONSTRAINT `fk_Loan_Client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `mydb`.`Client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`car`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`car` (
  `loan_id` INT NOT NULL,
  `car_color` VARCHAR(45) NULL DEFAULT NULL,
  `car_model` VARCHAR(45) NULL DEFAULT NULL,
  `car_plate` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`loan_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`home`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`home` (
  `loan_id` INT NOT NULL,
  `home_address` VARCHAR(45) NULL DEFAULT NULL,
  `home_color` VARCHAR(45) NULL DEFAULT NULL,
  `home_building` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`loan_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`personal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`personal` (
  `loan_id` INT NOT NULL,
  `personal_address` VARCHAR(45) NULL DEFAULT NULL,
  `personal_name` VARCHAR(45) NULL DEFAULT NULL,
  `personalcol` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`loan_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`loan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`loan` (
  `loan_id` INT NOT NULL,
  `loan_amt` VARCHAR(45) NULL DEFAULT NULL,
  `loan_date` VARCHAR(45) NULL DEFAULT NULL,
  `car_loan_id` INT NOT NULL,
  `home_loan_id` INT NOT NULL,
  `personal_loan_id` INT NOT NULL,
  PRIMARY KEY (`loan_id`, `car_loan_id`, `home_loan_id`, `personal_loan_id`),
  INDEX `fk_loan_car_idx` (`car_loan_id` ASC),
  INDEX `fk_loan_home1_idx` (`home_loan_id` ASC),
  INDEX `fk_loan_personal1_idx` (`personal_loan_id` ASC),
  CONSTRAINT `fk_loan_car`
    FOREIGN KEY (`car_loan_id`)
    REFERENCES `mydb`.`car` (`loan_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_loan_home1`
    FOREIGN KEY (`home_loan_id`)
    REFERENCES `mydb`.`home` (`loan_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_loan_personal1`
    FOREIGN KEY (`personal_loan_id`)
    REFERENCES `mydb`.`personal` (`loan_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`fixed income sec`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`fixed income sec` (
  `inv_id` INT NOT NULL,
  `fixed_date` DATE NULL DEFAULT NULL,
  `fixed_payment` INT(11) NULL DEFAULT NULL,
  `fixed_rate` DECIMAL(5,2) NULL DEFAULT NULL,
  PRIMARY KEY (`inv_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`uitf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`uitf` (
  `inv_id` INT NOT NULL,
  `uitf_amt` INT(11) NULL DEFAULT NULL,
  `uitf_rate` DECIMAL(5,2) NULL DEFAULT NULL,
  `uitf_desc` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`inv_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`sb capital market`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sb capital market` (
  `inv_id` INT NOT NULL,
  `sb_income` INT(11) NULL DEFAULT NULL,
  `sb_rate` DECIMAL(5,2) NULL DEFAULT NULL,
  PRIMARY KEY (`inv_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`investment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`investment` (
  `inv_id` INT NOT NULL,
  `inv_amt` VARCHAR(45) NULL DEFAULT NULL,
  `inv_type` VARCHAR(45) NULL DEFAULT NULL,
  `inv_date` DATE NULL DEFAULT NULL,
  `investmentcol` VARCHAR(45) NULL DEFAULT NULL,
  `fixed income sec_inv_id` INT NOT NULL,
  `uitf_inv_id` INT NOT NULL,
  `sb capital market_inv_id` INT NOT NULL,
  PRIMARY KEY (`inv_id`, `fixed income sec_inv_id`, `uitf_inv_id`, `sb capital market_inv_id`),
  INDEX `fk_investment_fixed income sec1_idx` (`fixed income sec_inv_id` ASC),
  INDEX `fk_investment_uitf1_idx` (`uitf_inv_id` ASC),
  INDEX `fk_investment_sb capital market1_idx` (`sb capital market_inv_id` ASC),
  CONSTRAINT `fk_investment_fixed income sec1`
    FOREIGN KEY (`fixed income sec_inv_id`)
    REFERENCES `mydb`.`fixed income sec` (`inv_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_investment_uitf1`
    FOREIGN KEY (`uitf_inv_id`)
    REFERENCES `mydb`.`uitf` (`inv_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_investment_sb capital market1`
    FOREIGN KEY (`sb capital market_inv_id`)
    REFERENCES `mydb`.`sb capital market` (`inv_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
