-- MySQL Script generated by MySQL Workbench
-- Thu Nov  2 00:35:21 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema SMART_CITY
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SMART_CITY
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SMART_CITY` DEFAULT CHARACTER SET utf8 ;
USE `SMART_CITY` ;

-- -----------------------------------------------------
-- Table `SMART_CITY`.`userType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SMART_CITY`.`userType` (
  `userTypeID` INT NOT NULL,
  `typeName` VARCHAR(45) NOT NULL,
  `typeDesc` TEXT NOT NULL,
  PRIMARY KEY (`userTypeID`),
  UNIQUE INDEX `userTypeID_UNIQUE` (`userTypeID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SMART_CITY`.`userInfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SMART_CITY`.`userInfo` (
  `userID` INT NOT NULL AUTO_INCREMENT,
  `userInfo_userTypeID` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` CHAR(30) NOT NULL,
  `fname` VARCHAR(45) NULL,
  `lname` VARCHAR(45) NULL,
  `dob` DATE NULL,
  `email` VARCHAR(100) NULL,
  `contactNumber` INT NULL,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`userID`),
  UNIQUE INDEX `userInfoID_UNIQUE` (`userID` ASC),
  INDEX `userTypeID_idx` (`userInfo_userTypeID` ASC),
  CONSTRAINT `userInfo_userTypeID`
    FOREIGN KEY (`userInfo_userTypeID`)
    REFERENCES `SMART_CITY`.`userType` (`userTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SMART_CITY`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SMART_CITY`.`city` (
  `cityID` INT NOT NULL AUTO_INCREMENT,
  `cityName` VARCHAR(45) NULL,
  `cityDesc` TEXT NULL,
  `restrurantsLink` VARCHAR(45) NULL,
  `collegesLink` VARCHAR(45) NULL,
  `librariesLink` VARCHAR(45) NULL,
  `industriesLink` VARCHAR(45) NULL,
  `hotelsLink` VARCHAR(45) NULL,
  `parksLink` VARCHAR(45) NULL,
  `zoosLink` VARCHAR(45) NULL,
  `museumsLink` VARCHAR(45) NULL,
  `mallsLink` VARCHAR(45) NULL,
  `longitude` VARCHAR(45) NULL,
  `latitude` VARCHAR(45) NULL,
  PRIMARY KEY (`cityID`),
  UNIQUE INDEX `cityID_UNIQUE` (`cityID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SMART_CITY`.`dataType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SMART_CITY`.`dataType` (
  `dataTypeID` INT NOT NULL,
  `dataType_userTypeID` INT NOT NULL,
  `dataName` VARCHAR(45) NULL,
  `dataDesc` TEXT NULL,
  INDEX `userTypeID_idx` (`dataType_userTypeID` ASC),
  INDEX `dataTypeID_idx` (`dataTypeID` ASC),
  PRIMARY KEY (`dataTypeID`),
  UNIQUE INDEX `dataTypeID_UNIQUE` (`dataTypeID` ASC),
  CONSTRAINT `dataType_userTypeID`
    FOREIGN KEY (`dataType_userTypeID`)
    REFERENCES `SMART_CITY`.`userType` (`userTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SMART_CITY`.`cityInfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SMART_CITY`.`cityInfo` (
  `cityInfoID` INT NOT NULL,
  `cityInfo_cityID` INT NOT NULL,
  `cityInfo_userTypeID` INT NOT NULL,
  `cityInfoName` VARCHAR(45) NULL,
  `cityInfoDesc` TEXT NULL,
  PRIMARY KEY (`cityInfoID`),
  INDEX `cityID_idx` (`cityInfo_cityID` ASC),
  INDEX `userTypeID_idx` (`cityInfo_userTypeID` ASC),
  UNIQUE INDEX `cityInfoID_UNIQUE` (`cityInfoID` ASC),
  CONSTRAINT `cityInfo_cityID`
    FOREIGN KEY (`cityInfo_cityID`)
    REFERENCES `SMART_CITY`.`city` (`cityID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cityInfo_userTypeID`
    FOREIGN KEY (`cityInfo_userTypeID`)
    REFERENCES `SMART_CITY`.`userType` (`userTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SMART_CITY`.`reviewData`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SMART_CITY`.`reviewData` (
  `reviewData_dataTypeID` INT NOT NULL,
  `reviewData_userID` INT NOT NULL,
  `reviewData_Text` TEXT NULL,
  INDEX `review_dataTypeID_idx` (`reviewData_dataTypeID` ASC),
  CONSTRAINT `reviewData_dataTypeID`
    FOREIGN KEY (`reviewData_dataTypeID`)
    REFERENCES `SMART_CITY`.`dataType` (`dataTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `reviewData_userID`
    FOREIGN KEY (`reviewData_userID`)
    REFERENCES `SMART_CITY`.`userInfo` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SMART_CITY`.`reviewCityInfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SMART_CITY`.`reviewCityInfo` (
  `reviewCity_cityInfoID` INT NOT NULL,
  `reviewCity_userID` INT NOT NULL,
  `reviewCity_Text` TEXT NULL,
  INDEX `review_cityInfo_idx` (`reviewCity_cityInfoID` ASC),
  INDEX `review_userID_idx` (`reviewCity_userID` ASC),
  CONSTRAINT `reviewCity_cityInfoID`
    FOREIGN KEY (`reviewCity_cityInfoID`)
    REFERENCES `SMART_CITY`.`cityInfo` (`cityInfoID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `reviewCity_userID`
    FOREIGN KEY (`reviewCity_userID`)
    REFERENCES `SMART_CITY`.`userInfo` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
