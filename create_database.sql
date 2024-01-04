-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema UMTminiStudentManagementSystem
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema UMTminiStudentManagementSystem
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `UMTminiStudentManagementSystem` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema umtministudentmanagementsystem
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema umtministudentmanagementsystem
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `umtministudentmanagementsystem` DEFAULT CHARACTER SET utf8 ;
USE `UMTminiStudentManagementSystem` ;

-- -----------------------------------------------------
-- Table `UMTminiStudentManagementSystem`.`program`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UMTminiStudentManagementSystem`.`program` (
  `ID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Duration` INT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UMTminiStudentManagementSystem`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UMTminiStudentManagementSystem`.`Student` (
  `ID` BIGINT(40) NOT NULL,
  `FirstName` VARCHAR(45) NULL,
  `middleName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  `studentAddress` VARCHAR(45) NULL,
  `DOB` DATETIME NULL,
  `programID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_student_program1_idx` (`programID` ASC) VISIBLE,
  CONSTRAINT `fk_student_program1`
    FOREIGN KEY (`programID`)
    REFERENCES `UMTminiStudentManagementSystem`.`program` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UMTminiStudentManagementSystem`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UMTminiStudentManagementSystem`.`Department` (
  `ID` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UMTminiStudentManagementSystem`.`Subjects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UMTminiStudentManagementSystem`.`Subjects` (
  `ID` VARCHAR(10) NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Department_ID` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Subjects_Department1_idx` (`Department_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Subjects_Department1`
    FOREIGN KEY (`Department_ID`)
    REFERENCES `UMTminiStudentManagementSystem`.`Department` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UMTminiStudentManagementSystem`.`Teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UMTminiStudentManagementSystem`.`Teacher` (
  `ID` INT NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `middleName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `Salary` INT NOT NULL,
  `Department_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Teacher_Department1_idx` (`Department_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Teacher_Department1`
    FOREIGN KEY (`Department_ID`)
    REFERENCES `UMTminiStudentManagementSystem`.`Department` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UMTminiStudentManagementSystem`.`teacher_subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UMTminiStudentManagementSystem`.`teacher_subject` (
  `Subjects_ID` VARCHAR(10) NOT NULL,
  `Teacher_ID` INT NOT NULL,
  PRIMARY KEY (`Subjects_ID`, `Teacher_ID`),
  INDEX `fk_Subjects_has_Teacher_Teacher1_idx` (`Teacher_ID` ASC) VISIBLE,
  INDEX `fk_Subjects_has_Teacher_Subjects1_idx` (`Subjects_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Subjects_has_Teacher_Subjects1`
    FOREIGN KEY (`Subjects_ID`)
    REFERENCES `UMTminiStudentManagementSystem`.`Subjects` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Subjects_has_Teacher_Teacher1`
    FOREIGN KEY (`Teacher_ID`)
    REFERENCES `UMTminiStudentManagementSystem`.`Teacher` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UMTminiStudentManagementSystem`.`Student_enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UMTminiStudentManagementSystem`.`Student_enrollment` (
  `Student_ID` BIGINT(40) NOT NULL,
  `Subjects_ID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Student_ID`, `Subjects_ID`),
  INDEX `fk_Student_has_Subjects_Subjects1_idx` (`Subjects_ID` ASC) VISIBLE,
  INDEX `fk_Student_has_Subjects_Student1_idx` (`Student_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Student_has_Subjects_Student1`
    FOREIGN KEY (`Student_ID`)
    REFERENCES `UMTminiStudentManagementSystem`.`Student` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_has_Subjects_Subjects1`
    FOREIGN KEY (`Subjects_ID`)
    REFERENCES `UMTminiStudentManagementSystem`.`Subjects` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `umtministudentmanagementsystem` ;

-- -----------------------------------------------------
-- Table `umtministudentmanagementsystem`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `umtministudentmanagementsystem`.`department` (
  `ID` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `umtministudentmanagementsystem`.`program`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `umtministudentmanagementsystem`.`program` (
  `ID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Duration` INT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `umtministudentmanagementsystem`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `umtministudentmanagementsystem`.`student` (
  `ID` BIGINT NOT NULL,
  `FirstName` VARCHAR(45) NULL DEFAULT NULL,
  `middleName` VARCHAR(45) NULL DEFAULT NULL,
  `LastName` VARCHAR(45) NULL DEFAULT NULL,
  `studentAddress` VARCHAR(45) NULL DEFAULT NULL,
  `DOB` DATETIME NULL DEFAULT NULL,
  `programID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_student_program1_idx` (`programID` ASC) VISIBLE,
  CONSTRAINT `fk_student_program1`
    FOREIGN KEY (`programID`)
    REFERENCES `umtministudentmanagementsystem`.`program` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `umtministudentmanagementsystem`.`subjects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `umtministudentmanagementsystem`.`subjects` (
  `ID` VARCHAR(10) NOT NULL,
  `Name` VARCHAR(45) NULL DEFAULT NULL,
  `Department_ID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Subjects_Department1_idx` (`Department_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Subjects_Department1`
    FOREIGN KEY (`Department_ID`)
    REFERENCES `umtministudentmanagementsystem`.`department` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `umtministudentmanagementsystem`.`student_enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `umtministudentmanagementsystem`.`student_enrollment` (
  `Student_ID` BIGINT NOT NULL,
  `Subjects_ID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Student_ID`, `Subjects_ID`),
  INDEX `fk_Student_has_Subjects_Subjects1_idx` (`Subjects_ID` ASC) VISIBLE,
  INDEX `fk_Student_has_Subjects_Student1_idx` (`Student_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Student_has_Subjects_Student1`
    FOREIGN KEY (`Student_ID`)
    REFERENCES `umtministudentmanagementsystem`.`student` (`ID`),
  CONSTRAINT `fk_Student_has_Subjects_Subjects1`
    FOREIGN KEY (`Subjects_ID`)
    REFERENCES `umtministudentmanagementsystem`.`subjects` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `umtministudentmanagementsystem`.`teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `umtministudentmanagementsystem`.`teacher` (
  `ID` INT NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `middleName` VARCHAR(45) NULL DEFAULT NULL,
  `lastName` VARCHAR(45) NULL DEFAULT NULL,
  `Salary` INT NOT NULL,
  `Department_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Teacher_Department1_idx` (`Department_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Teacher_Department1`
    FOREIGN KEY (`Department_ID`)
    REFERENCES `umtministudentmanagementsystem`.`department` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `umtministudentmanagementsystem`.`teacher_subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `umtministudentmanagementsystem`.`teacher_subject` (
  `Subjects_ID` VARCHAR(10) NOT NULL,
  `Teacher_ID` INT NOT NULL,
  PRIMARY KEY (`Subjects_ID`, `Teacher_ID`),
  INDEX `fk_Subjects_has_Teacher_Teacher1_idx` (`Teacher_ID` ASC) VISIBLE,
  INDEX `fk_Subjects_has_Teacher_Subjects1_idx` (`Subjects_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Subjects_has_Teacher_Subjects1`
    FOREIGN KEY (`Subjects_ID`)
    REFERENCES `umtministudentmanagementsystem`.`subjects` (`ID`),
  CONSTRAINT `fk_Subjects_has_Teacher_Teacher1`
    FOREIGN KEY (`Teacher_ID`)
    REFERENCES `umtministudentmanagementsystem`.`teacher` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;