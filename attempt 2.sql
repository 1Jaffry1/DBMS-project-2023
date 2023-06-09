
CREATE TABLE IF NOT EXISTS `Researcher` (
  `Researcher_ID` INT NOT NULL,
  `Fname` VARCHAR(45) NULL,
  `Lname` VARCHAR(45) NULL,
  `Fav_field` VARCHAR(45) NULL,
  PRIMARY KEY (`Researcher_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Research Activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Research Activity` (
  `ACTid` INT NOT NULL,
  `No_of_Pages` VARCHAR(45) NULL,
  `Start_Date` DATE NULL,
  `End_Date` DATE NULL,
  `INTL?` TINYINT NULL COMMENT '0 for domsetic and 1 for intl',
  `Date_Recieved` INT NULL,
  `Date_of_Admission` INT NULL,
  `TYPE` VARCHAR(45) NULL,
  `TYPE_DATE` DATE NULL,
  `PLACE` VARCHAR(45) NULL,
  `Correspondent` INT NOT NULL,
  PRIMARY KEY (`ACTid`),
  INDEX `Correspondent_idx` (`Correspondent` ASC) VISIBLE,
  UNIQUE INDEX `Correspondent_UNIQUE` (`Correspondent` ASC) VISIBLE,
  CONSTRAINT `Correspondent`
    FOREIGN KEY (`Correspondent`)
    REFERENCES `Researcher` (`Researcher_ID`)
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
  `ACTid` INT NOT NULL,
  `Loan_value` INT NULL,
  `Donation_value` INT NULL,
  PRIMARY KEY (`ACTid`, `InstID`),
  INDEX `RID_idx` (`InstID` ASC) VISIBLE,
  CONSTRAINT `InstID`
    FOREIGN KEY (`InstID`)
    REFERENCES `Institute` (`InstID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `ra key`
    FOREIGN KEY (`ACTid`)
    REFERENCES `Research Activity` (`ACTid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Staff` (
  `Staff_id` INT NOT NULL,
  `Type` VARCHAR(45) NULL COMMENT 'domain is \n\nexe\nrev\nman',
  `FName` VARCHAR(45) NULL,
  `LName` VARCHAR(45) NULL,
  `BoolRA` TINYINT NULL,
  `Bool-INS` TINYINT NULL,
  `RA_or_inst_num` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EXE_Office`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EXE_Office` (
  `Office_NO` INT NOT NULL,
  `ACTid` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Place` VARCHAR(45) NULL,
  PRIMARY KEY (`Office_NO`),
  INDEX `RID_idx` (`ACTid` ASC) VISIBLE,
  CONSTRAINT `ACT_id`
    FOREIGN KEY (`ACTid`)
    REFERENCES `Research Activity` (`ACTid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `edRecord`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `edRecord` (
  `RECid` INT NOT NULL,
  `RID` INT NOT NULL,
  PRIMARY KEY (`RECid`, `RID`),
  INDEX `rid_idx` (`RID` ASC) VISIBLE,
  CONSTRAINT `rid`
    FOREIGN KEY (`RID`)
    REFERENCES `Researcher` (`Researcher_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sponsoring`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sponsoring` (
  `RID` INT NOT NULL,
  `INSTid` INT NOT NULL,
  PRIMARY KEY (`RID`, `INSTid`),
  INDEX `InstID_idx` (`INSTid` ASC) VISIBLE,
  CONSTRAINT `RID`
    FOREIGN KEY (`RID`)
    REFERENCES `Research Activity` (`ACTid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `InstID`
    FOREIGN KEY (`INSTid`)
    REFERENCES `Institute` (`InstID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Agreement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Agreement` (
  `RID` INT NOT NULL,
  `ACT-ID` INT NULL,
  PRIMARY KEY (`RID`),
  INDEX `ra key_idx` (`ACT-ID` ASC) VISIBLE,
  CONSTRAINT `ra key`
    FOREIGN KEY (`ACT-ID`)
    REFERENCES `Research Activity` (`ACTid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `rs key`
    FOREIGN KEY (`RID`)
    REFERENCES `Researcher` (`Researcher_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Has_staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Has_staff` (
  `Staff_id` INT NOT NULL,
  `ACT-id` INT NULL,
  PRIMARY KEY (`Staff_id`),
  INDEX `actid_idx` (`ACT-id` ASC) VISIBLE,
  CONSTRAINT `actid`
    FOREIGN KEY (`ACT-id`)
    REFERENCES `Research Activity` (`ACTid`)
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
  `Act-ID` INT NULL,
  PRIMARY KEY (`TopicID`),
  INDEX `Act-id_idx` (`Act-ID` ASC) VISIBLE,
  CONSTRAINT `Act-id`
    FOREIGN KEY (`Act-ID`)
    REFERENCES `Research Activity` (`ACTid`)
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
  `Transaction type` VARCHAR(45) NULL,
  `Amount` INT NULL,
  `Inst_num` INT NULL,
  PRIMARY KEY (`TRid`),
  INDEX `inst_num_idx` (`Inst_num` ASC) VISIBLE,
  CONSTRAINT `inst_num`
    FOREIGN KEY (`Inst_num`)
    REFERENCES `Institute` (`InstID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
PACK_KEYS = Default;