SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema VideoGamesMgmt
-- -----------------------------------------------------
-- Database for Video Games Collection Data
CREATE SCHEMA IF NOT EXISTS `VideoGamesMgmt` ;
USE `VideoGamesMgmt` ;

-- -----------------------------------------------------
-- Table `VideoGamesMgmt`.`VideoGames`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `VideoGamesMgmt`.`VideoGames` ;

CREATE TABLE IF NOT EXISTS `VideoGamesMgmt`.`VideoGames` (
  `Game_ID` INT NOT NULL,
  `Game_Name` VARCHAR(45) NULL,
  `Game_Desc` VARCHAR(500) NULL,
  `Game_Title` VARCHAR(45) NULL,
  PRIMARY KEY (`Game_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VideoGamesMgmt`.`Consoles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `VideoGamesMgmt`.`Consoles` ;

CREATE TABLE IF NOT EXISTS `VideoGamesMgmt`.`Consoles` (
  `Console_ID` INT NOT NULL,
  `Console_Name` VARCHAR(45) NULL,
  `Console_Type` VARCHAR(45) NULL,
  PRIMARY KEY (`Console_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VideoGamesMgmt`.`VideoGamesConsoles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `VideoGamesMgmt`.`VideoGamesConsoles` ;

CREATE TABLE IF NOT EXISTS `VideoGamesMgmt`.`VideoGamesConsoles` (
  `VGCon_ID` INT NOT NULL,
  `VGCon_Game_ID` INT NULL,
  `VGCon_Console_ID` INT NULL,
  PRIMARY KEY (`VGCon_ID`),
  INDEX `VGCon_Console_ID_idx` (`VGCon_Console_ID` ASC),
  CONSTRAINT `VGCon_Console_ID`
    FOREIGN KEY (`VGCon_Console_ID`)
    REFERENCES `VideoGamesMgmt`.`Consoles` (`Console_ID`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VideoGamesMgmt`.`CategoriesMaster`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `VideoGamesMgmt`.`CategoriesMaster` ;

CREATE TABLE IF NOT EXISTS `VideoGamesMgmt`.`CategoriesMaster` (
  `Category_ID` INT NOT NULL,
  `Category_Name` VARCHAR(45) NULL,
  PRIMARY KEY (`Category_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VideoGamesMgmt`.`VideoGamesCategories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `VideoGamesMgmt`.`VideoGamesCategories` ;

CREATE TABLE IF NOT EXISTS `VideoGamesMgmt`.`VideoGamesCategories` (
  `VGCat_ID` INT NOT NULL AUTO_INCREMENT,
  `VGCat_Game_ID` INT NULL,
  `VGCat_Category_ID` INT NULL,
  PRIMARY KEY (`VGCat_ID`),
  INDEX `VGCat_Game_ID_idx` (`VGCat_Game_ID` ASC),
  INDEX `VGCat_Category_ID_idx` (`VGCat_Category_ID` ASC),
  CONSTRAINT `VGCat_Game_ID`
    FOREIGN KEY (`VGCat_Game_ID`)
    REFERENCES `VideoGamesMgmt`.`VideoGames` (`Game_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `VGCat_Category_ID`
    FOREIGN KEY (`VGCat_Category_ID`)
    REFERENCES `VideoGamesMgmt`.`CategoriesMaster` (`Category_ID`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VideoGamesMgmt`.`GameComleteness`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `VideoGamesMgmt`.`GameComleteness` ;

CREATE TABLE IF NOT EXISTS `VideoGamesMgmt`.`GameComleteness` (
  `Completeness_ID` INT NOT NULL,
  `Completeness_Name` VARCHAR(45) NULL,
  `Completeness_Description` VARCHAR(500) NULL,
  PRIMARY KEY (`Completeness_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VideoGamesMgmt`.`ConditionsMaster`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `VideoGamesMgmt`.`ConditionsMaster` ;

CREATE TABLE IF NOT EXISTS `VideoGamesMgmt`.`ConditionsMaster` (
  `Condition_ID` INT NOT NULL,
  `Condition_Name` VARCHAR(45) NULL,
  PRIMARY KEY (`Condition_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VideoGamesMgmt`.`GameContents`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `VideoGamesMgmt`.`GameContents` ;

CREATE TABLE IF NOT EXISTS `VideoGamesMgmt`.`GameContents` (
  `GC_ID` INT NOT NULL AUTO_INCREMENT,
  `GC_VGCon_ID` INT NULL,
  `GC_Completeness_ID` INT NULL,
  `GC_AmtPurchased` DECIMAL(10,0) NULL,
  `GC_CurMarketValue` DECIMAL(10,0) NULL,
  `GC_Condition_ID` INT NULL,
  `GC_DatePurchased` DATE NULL,
  PRIMARY KEY (`GC_ID`),
  INDEX `GC_VGCon_ID_idx` (`GC_VGCon_ID` ASC),
  INDEX `GC_GCD_ID_idx` (`GC_Completeness_ID` ASC),
  INDEX `GC_Condition_ID_idx` (`GC_Condition_ID` ASC),
  CONSTRAINT `GC_VGCon_ID`
    FOREIGN KEY (`GC_VGCon_ID`)
    REFERENCES `VideoGamesMgmt`.`VideoGamesConsoles` (`VGCon_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `GC_Completeness_ID`
    FOREIGN KEY (`GC_Completeness_ID`)
    REFERENCES `VideoGamesMgmt`.`GameComleteness` (`Completeness_ID`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `GC_Condition_ID`
    FOREIGN KEY (`GC_Condition_ID`)
    REFERENCES `VideoGamesMgmt`.`ConditionsMaster` (`Condition_ID`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `VideoGamesMgmt`.`VideoGames`
-- -----------------------------------------------------
START TRANSACTION;
USE `VideoGamesMgmt`;
INSERT INTO `VideoGamesMgmt`.`VideoGames` (`Game_ID`, `Game_Name`, `Game_Desc`, `Game_Title`) VALUES (1, 'FIFA 15', 'FIFA 15 is an association football simulation video game developed by EA Canada and published by Electronic Arts.', 'FIFA15');
INSERT INTO `VideoGamesMgmt`.`VideoGames` (`Game_ID`, `Game_Name`, `Game_Desc`, `Game_Title`) VALUES (2, 'Grand Theft Auto', 'Grand Theft Auto V is an open world, action-adventure video game developed by Rockstar North and published by Rockstar Games.', 'GTA 5');
INSERT INTO `VideoGamesMgmt`.`VideoGames` (`Game_ID`, `Game_Name`, `Game_Desc`, `Game_Title`) VALUES (3, 'Super Mario Bros', 'Super Mario Bros. is a 1985 platform video game internally developed by Nintendo EAD and published by Nintendo as a pseudo-sequel to the 1983 game Mario Bros.', 'Mario');
INSERT INTO `VideoGamesMgmt`.`VideoGames` (`Game_ID`, `Game_Name`, `Game_Desc`, `Game_Title`) VALUES (4, 'Assassin\'s Creed IV: Black Flag', 'Assassin\'s Creed IV: Black Flag is a 2013 historical action-adventure video game developed by Ubisoft Montreal and published by Ubisoft.', 'AC4');
INSERT INTO `VideoGamesMgmt`.`VideoGames` (`Game_ID`, `Game_Name`, `Game_Desc`, `Game_Title`) VALUES (5, 'Call of Duty: Black Ops', 'Call of Duty: Black Ops is a 2010 first-person shooter video game. The game was developed by Treyarch, published by Activision, and released worldwide on November 9, 2010 for Microsoft Windows, PlayStation and for others.', 'COD');
INSERT INTO `VideoGamesMgmt`.`VideoGames` (`Game_ID`, `Game_Name`, `Game_Desc`, `Game_Title`) VALUES (6, 'Assassin\'s Creed Unity', 'Assassin\'s Creed Unity is a historical action-adventure video game developed by Ubisoft Montreal and published by Ubisoft.', 'ACU');

COMMIT;


-- -----------------------------------------------------
-- Data for table `VideoGamesMgmt`.`Consoles`
-- -----------------------------------------------------
START TRANSACTION;
USE `VideoGamesMgmt`;
INSERT INTO `VideoGamesMgmt`.`Consoles` (`Console_ID`, `Console_Name`, `Console_Type`) VALUES (1, 'PS3', 'DVD');
INSERT INTO `VideoGamesMgmt`.`Consoles` (`Console_ID`, `Console_Name`, `Console_Type`) VALUES (2, 'Xbox One', 'DVD');
INSERT INTO `VideoGamesMgmt`.`Consoles` (`Console_ID`, `Console_Name`, `Console_Type`) VALUES (3, 'PS4', 'DVD');
INSERT INTO `VideoGamesMgmt`.`Consoles` (`Console_ID`, `Console_Name`, `Console_Type`) VALUES (4, 'Xbox 360', 'DVD');
INSERT INTO `VideoGamesMgmt`.`Consoles` (`Console_ID`, `Console_Name`, `Console_Type`) VALUES (5, 'Nintendo', 'Cartridge');

COMMIT;


-- -----------------------------------------------------
-- Data for table `VideoGamesMgmt`.`VideoGamesConsoles`
-- -----------------------------------------------------
START TRANSACTION;
USE `VideoGamesMgmt`;
INSERT INTO `VideoGamesMgmt`.`VideoGamesConsoles` (`VGCon_ID`, `VGCon_Game_ID`, `VGCon_Console_ID`) VALUES (1, 1, 1);
INSERT INTO `VideoGamesMgmt`.`VideoGamesConsoles` (`VGCon_ID`, `VGCon_Game_ID`, `VGCon_Console_ID`) VALUES (2, 1, 2);
INSERT INTO `VideoGamesMgmt`.`VideoGamesConsoles` (`VGCon_ID`, `VGCon_Game_ID`, `VGCon_Console_ID`) VALUES (3, 5, 3);
INSERT INTO `VideoGamesMgmt`.`VideoGamesConsoles` (`VGCon_ID`, `VGCon_Game_ID`, `VGCon_Console_ID`) VALUES (4, 4, 2);
INSERT INTO `VideoGamesMgmt`.`VideoGamesConsoles` (`VGCon_ID`, `VGCon_Game_ID`, `VGCon_Console_ID`) VALUES (5, 4, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `VideoGamesMgmt`.`CategoriesMaster`
-- -----------------------------------------------------
START TRANSACTION;
USE `VideoGamesMgmt`;
INSERT INTO `VideoGamesMgmt`.`CategoriesMaster` (`Category_ID`, `Category_Name`) VALUES (1, 'Role Playing');
INSERT INTO `VideoGamesMgmt`.`CategoriesMaster` (`Category_ID`, `Category_Name`) VALUES (2, 'Action');
INSERT INTO `VideoGamesMgmt`.`CategoriesMaster` (`Category_ID`, `Category_Name`) VALUES (3, 'Sports');
INSERT INTO `VideoGamesMgmt`.`CategoriesMaster` (`Category_ID`, `Category_Name`) VALUES (4, 'Adventure');

COMMIT;


-- -----------------------------------------------------
-- Data for table `VideoGamesMgmt`.`VideoGamesCategories`
-- -----------------------------------------------------
START TRANSACTION;
USE `VideoGamesMgmt`;
INSERT INTO `VideoGamesMgmt`.`VideoGamesCategories` (`VGCat_ID`, `VGCat_Game_ID`, `VGCat_Category_ID`) VALUES (1, 1, 3);
INSERT INTO `VideoGamesMgmt`.`VideoGamesCategories` (`VGCat_ID`, `VGCat_Game_ID`, `VGCat_Category_ID`) VALUES (2, 2, 1);
INSERT INTO `VideoGamesMgmt`.`VideoGamesCategories` (`VGCat_ID`, `VGCat_Game_ID`, `VGCat_Category_ID`) VALUES (3, 2, 2);
INSERT INTO `VideoGamesMgmt`.`VideoGamesCategories` (`VGCat_ID`, `VGCat_Game_ID`, `VGCat_Category_ID`) VALUES (4, 3, 4);
INSERT INTO `VideoGamesMgmt`.`VideoGamesCategories` (`VGCat_ID`, `VGCat_Game_ID`, `VGCat_Category_ID`) VALUES (5, 4, 1);
INSERT INTO `VideoGamesMgmt`.`VideoGamesCategories` (`VGCat_ID`, `VGCat_Game_ID`, `VGCat_Category_ID`) VALUES (6, 4, 4);
INSERT INTO `VideoGamesMgmt`.`VideoGamesCategories` (`VGCat_ID`, `VGCat_Game_ID`, `VGCat_Category_ID`) VALUES (7, 5, 2);
INSERT INTO `VideoGamesMgmt`.`VideoGamesCategories` (`VGCat_ID`, `VGCat_Game_ID`, `VGCat_Category_ID`) VALUES (8, 6, 1);
INSERT INTO `VideoGamesMgmt`.`VideoGamesCategories` (`VGCat_ID`, `VGCat_Game_ID`, `VGCat_Category_ID`) VALUES (9, 6, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `VideoGamesMgmt`.`GameComleteness`
-- -----------------------------------------------------
START TRANSACTION;
USE `VideoGamesMgmt`;
INSERT INTO `VideoGamesMgmt`.`GameComleteness` (`Completeness_ID`, `Completeness_Name`, `Completeness_Description`) VALUES (1, 'C', 'Only Cartridge');
INSERT INTO `VideoGamesMgmt`.`GameComleteness` (`Completeness_ID`, `Completeness_Name`, `Completeness_Description`) VALUES (2, 'CI', 'Cartridge plus Instructions');
INSERT INTO `VideoGamesMgmt`.`GameComleteness` (`Completeness_ID`, `Completeness_Name`, `Completeness_Description`) VALUES (3, 'CB', 'Cartridge plus Box');
INSERT INTO `VideoGamesMgmt`.`GameComleteness` (`Completeness_ID`, `Completeness_Name`, `Completeness_Description`) VALUES (4, 'CA', 'Cartridge plus Additional Bonus Content');
INSERT INTO `VideoGamesMgmt`.`GameComleteness` (`Completeness_ID`, `Completeness_Name`, `Completeness_Description`) VALUES (5, 'CIB', 'Cartridge plus Instructions plus Box');
INSERT INTO `VideoGamesMgmt`.`GameComleteness` (`Completeness_ID`, `Completeness_Name`, `Completeness_Description`) VALUES (6, 'CBA', 'Cartridge plus Box plus Additional Bonus Content');
INSERT INTO `VideoGamesMgmt`.`GameComleteness` (`Completeness_ID`, `Completeness_Name`, `Completeness_Description`) VALUES (7, 'CIA', 'Cartridge plus Instructions plus Additional Bonus Content');
INSERT INTO `VideoGamesMgmt`.`GameComleteness` (`Completeness_ID`, `Completeness_Name`, `Completeness_Description`) VALUES (8, 'CIBA', 'Cartridge plus Instructions plus Box plus Additional Bonus Content');

COMMIT;


-- -----------------------------------------------------
-- Data for table `VideoGamesMgmt`.`ConditionsMaster`
-- -----------------------------------------------------
START TRANSACTION;
USE `VideoGamesMgmt`;
INSERT INTO `VideoGamesMgmt`.`ConditionsMaster` (`Condition_ID`, `Condition_Name`) VALUES (1, 'New');
INSERT INTO `VideoGamesMgmt`.`ConditionsMaster` (`Condition_ID`, `Condition_Name`) VALUES (2, 'Mint');
INSERT INTO `VideoGamesMgmt`.`ConditionsMaster` (`Condition_ID`, `Condition_Name`) VALUES (3, 'Very Good');
INSERT INTO `VideoGamesMgmt`.`ConditionsMaster` (`Condition_ID`, `Condition_Name`) VALUES (4, 'Good');
INSERT INTO `VideoGamesMgmt`.`ConditionsMaster` (`Condition_ID`, `Condition_Name`) VALUES (5, 'Acceptable');
INSERT INTO `VideoGamesMgmt`.`ConditionsMaster` (`Condition_ID`, `Condition_Name`) VALUES (6, 'Poor');

COMMIT;


-- -----------------------------------------------------
-- Data for table `VideoGamesMgmt`.`GameContents`
-- -----------------------------------------------------
START TRANSACTION;
USE `VideoGamesMgmt`;
INSERT INTO `VideoGamesMgmt`.`GameContents` (`GC_ID`, `GC_VGCon_ID`, `GC_Completeness_ID`, `GC_AmtPurchased`, `GC_CurMarketValue`, `GC_Condition_ID`, `GC_DatePurchased`) VALUES (1, 1, 5, 149.99, 100, 1, '20140615');
INSERT INTO `VideoGamesMgmt`.`GameContents` (`GC_ID`, `GC_VGCon_ID`, `GC_Completeness_ID`, `GC_AmtPurchased`, `GC_CurMarketValue`, `GC_Condition_ID`, `GC_DatePurchased`) VALUES (2, 1, 3, 100, 70, 5, '20141015');
INSERT INTO `VideoGamesMgmt`.`GameContents` (`GC_ID`, `GC_VGCon_ID`, `GC_Completeness_ID`, `GC_AmtPurchased`, `GC_CurMarketValue`, `GC_Condition_ID`, `GC_DatePurchased`) VALUES (3, 3, 5, 300, 250, 1, '20141117');
INSERT INTO `VideoGamesMgmt`.`GameContents` (`GC_ID`, `GC_VGCon_ID`, `GC_Completeness_ID`, `GC_AmtPurchased`, `GC_CurMarketValue`, `GC_Condition_ID`, `GC_DatePurchased`) VALUES (4, 3, 5, 399.99, 250, 1, '20141117');
INSERT INTO `VideoGamesMgmt`.`GameContents` (`GC_ID`, `GC_VGCon_ID`, `GC_Completeness_ID`, `GC_AmtPurchased`, `GC_CurMarketValue`, `GC_Condition_ID`, `GC_DatePurchased`) VALUES (5, 4, 1, 330, 400, 2, '20141110');
INSERT INTO `VideoGamesMgmt`.`GameContents` (`GC_ID`, `GC_VGCon_ID`, `GC_Completeness_ID`, `GC_AmtPurchased`, `GC_CurMarketValue`, `GC_Condition_ID`, `GC_DatePurchased`) VALUES (6, 3, 6, 300, 300, 3, '20120808');
INSERT INTO `VideoGamesMgmt`.`GameContents` (`GC_ID`, `GC_VGCon_ID`, `GC_Completeness_ID`, `GC_AmtPurchased`, `GC_CurMarketValue`, `GC_Condition_ID`, `GC_DatePurchased`) VALUES (7, 3, 8, 500, 600, 4, '20100807');
INSERT INTO `VideoGamesMgmt`.`GameContents` (`GC_ID`, `GC_VGCon_ID`, `GC_Completeness_ID`, `GC_AmtPurchased`, `GC_CurMarketValue`, `GC_Condition_ID`, `GC_DatePurchased`) VALUES (8, 5, 1, 330, 400, 2, '20141117');

COMMIT;

