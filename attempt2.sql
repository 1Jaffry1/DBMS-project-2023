-- -----------------------------------------------------
-- Table `Researcher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Researcher` (
  `RID` INT NOT NULL,
  `Fname` VARCHAR(45) NULL,
  `Lname` VARCHAR(45) NULL,
  `Fav_field` VARCHAR(45) NULL,
  PRIMARY KEY (`RID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Research Activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Research Activity` (
  `ACT-ID` INT NOT NULL,
  `No_of_Pages` VARCHAR(45) NULL,
  `Start_Date` DATE NULL,
  `End_Date` DATE NULL,
  `INTL?` TINYINT NULL COMMENT '0 for domsetic and 1 for intl',
  `Date_Recieved` INT NULL,
  `Date_of_Admission` INT NULL,
  `TYPE` VARCHAR(45) NULL COMMENT 'Generalization \n',
  `TYPE_DATE` DATE NULL,
  `TYPE_PLACE` VARCHAR(45) NULL,
  `Correspondent` INT NOT NULL,
  PRIMARY KEY (`ACT-ID`),
  INDEX `Correspondent_idx` (`Correspondent` ASC) VISIBLE,
  UNIQUE INDEX `Correspondent_UNIQUE` (`Correspondent` ASC) VISIBLE,
  CONSTRAINT `Correspondent`
    FOREIGN KEY (`Correspondent`)
    REFERENCES `Researcher` (`RID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Institute`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Institute` (
  `InstID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `BoolRC` TINYINT NULL,
  `BoolEXE` TINYINT NULL,
  `boolGOV?` TINYINT NULL,
  `BoolUNI` TINYINT NULL,
  PRIMARY KEY (`InstID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Funding`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Funding` (
  `InstID` INT NOT NULL,
  `ACT-ID` INT NOT NULL,
  `Loan_value` INT NULL,
  `Donation_value` INT NULL,
  PRIMARY KEY (`ACT-ID`, `InstID`),
  INDEX `RID_idx` (`InstID` ASC) VISIBLE,
  CONSTRAINT `InstID`
    FOREIGN KEY (`InstID`)
    REFERENCES `Institute` (`InstID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `ra key`
    FOREIGN KEY (`ACT-ID`)
    REFERENCES `Research Activity` (`ACT-ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Staff` (
  `Staff_id` INT NOT NULL,
  `FName` VARCHAR(45) NULL,
  `LName` VARCHAR(45) NULL,
  `Bool-RA` TINYINT NULL,
  `Bool-INS` TINYINT NULL,
  `Type` VARCHAR(45) NULL COMMENT 'domain is :\nexe\nrev\nman',
  `RA_or_inst_num` INT NOT NULL,
  PRIMARY KEY (`Staff_id`),
  INDEX `isnt_idx` (`RA_or_inst_num` ASC) VISIBLE,
  CONSTRAINT `ra`
    FOREIGN KEY (`RA_or_inst_num`)
    REFERENCES `Research Activity` (`ACT-ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `isnt`
    FOREIGN KEY (`RA_or_inst_num`)
    REFERENCES `Institute` (`InstID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EXE_Office`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EXE_Office` (
  `O_num` INT NOT NULL,
  `ACT-ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Place` VARCHAR(45) NULL,
  PRIMARY KEY (`O_num`),
  INDEX `RID_idx` (`ACT-ID` ASC) VISIBLE,
  CONSTRAINT `ACT_id`
    FOREIGN KEY (`ACT-ID`)
    REFERENCES `Research Activity` (`ACT-ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `edRecord`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `edRecord` (
  `RECid` INT NOT NULL,
  `RID` INT NOT NULL,
  `Inst_id` INT NULL,
  PRIMARY KEY (`RECid`, `RID`),
  INDEX `rid_idx` (`RID` ASC) VISIBLE,
  INDEX `inst-id_idx` (`Inst_id` ASC) VISIBLE,
  CONSTRAINT `rid`
    FOREIGN KEY (`RID`)
    REFERENCES `Researcher` (`RID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `inst-id`
    FOREIGN KEY (`Inst_id`)
    REFERENCES `Institute` (`InstID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sponsoring`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sponsoring` (
  `ACT-ID` INT NOT NULL,
  `InstID` INT NOT NULL,
  PRIMARY KEY (`ACT-ID`, `InstID`),
  INDEX `InstID_idx` (`InstID` ASC) VISIBLE,
  CONSTRAINT `ACT-ID`
    FOREIGN KEY (`ACT-ID`)
    REFERENCES `Research Activity` (`ACT-ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `InstID`
    FOREIGN KEY (`InstID`)
    REFERENCES `Institute` (`InstID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Agreement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Agreement` (
  `RID` INT NOT NULL,
  `ACT-ID` INT NOT NULL,
  `Role` VARCHAR(45) NULL,
  `End_Date` DATE NULL,
  `Start_Date` DATE NULL,
  `Total_Salary` VARCHAR(45) NULL,
  PRIMARY KEY (`RID`, `ACT-ID`),
  INDEX `ra key_idx` (`ACT-ID` ASC) VISIBLE,
  CONSTRAINT `ra key`
    FOREIGN KEY (`ACT-ID`)
    REFERENCES `Research Activity` (`ACT-ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `rs key`
    FOREIGN KEY (`RID`)
    REFERENCES `Researcher` (`RID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Has_staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Has_staff` (
  `Staff_id` INT NOT NULL,
  `ACT-ID` INT NOT NULL,
  PRIMARY KEY (`Staff_id`, `ACT-ID`),
  INDEX `actid_idx` (`ACT-ID` ASC) VISIBLE,
  CONSTRAINT `actid`
    FOREIGN KEY (`ACT-ID`)
    REFERENCES `Research Activity` (`ACT-ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `staffid`
    FOREIGN KEY (`Staff_id`)
    REFERENCES `Staff` (`Staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Topic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Topic` (
  `TopicID` INT NOT NULL,
  `Field` VARCHAR(45) NULL,
  `Topic` VARCHAR(45) NULL,
  PRIMARY KEY (`TopicID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Has_topic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Has_topic` (
  `TopicID` INT NOT NULL,
  `Act-ID` INT NOT NULL,
  PRIMARY KEY (`TopicID`, `Act-ID`),
  INDEX `Act-id_idx` (`Act-ID` ASC) VISIBLE,
  CONSTRAINT `Act-id`
    FOREIGN KEY (`Act-ID`)
    REFERENCES `Research Activity` (`ACT-ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `topicId`
    FOREIGN KEY (`TopicID`)
    REFERENCES `Topic` (`TopicID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Finances`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Finances` (
  `TRid` INT NOT NULL,
  `InstID` INT NULL,
  `Transaction type` VARCHAR(45) NULL,
  `Amount` INT NULL,
  PRIMARY KEY (`TRid`),
  INDEX `inst_num_idx` (`InstID` ASC) VISIBLE,
  CONSTRAINT `inst_num`
    FOREIGN KEY (`InstID`)
    REFERENCES `Institute` (`InstID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
PACK_KEYS = Default;


-- -----------------------------------------------------
-- Table `Conducted_by`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Conducted_by` (
  `InstID` INT NOT NULL,
  `ACT-ID` INT NOT NULL,
  PRIMARY KEY (`InstID`, `ACT-ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Duty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Duty` (
  `RID` INT NOT NULL,
  `ACT-ID` INT NOT NULL,
  `Duty-ID` INT NOT NULL,
  `discription` VARCHAR(45) NULL,
  PRIMARY KEY (`RID`, `ACT-ID`, `Duty-ID`),
  CONSTRAINT `ag id`
    FOREIGN KEY (`RID` , `ACT-ID`)
    REFERENCES `Agreement` (`RID` , `ACT-ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Transaction` (
  `NUM` INT NOT NULL,
  `ACT-ID` INT NOT NULL,
  `RID` INT NOT NULL,
  `item_id` VARCHAR(45) NULL,
  `Amount` VARCHAR(45) NULL,
  PRIMARY KEY (`NUM`, `ACT-ID`, `RID`),
  INDEX `ra_idx` (`ACT-ID` ASC) VISIBLE,
  CONSTRAINT `ra`
    FOREIGN KEY (`ACT-ID`)
    REFERENCES `Research Activity` (`ACT-ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `rs`
    FOREIGN KEY (`RID`)
    REFERENCES `Researcher` (`RID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
