-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Gradovi
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Gradovi` ;

-- -----------------------------------------------------
-- Schema Gradovi
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Gradovi` DEFAULT CHARACTER SET utf8mb4 ;
USE `Gradovi` ;

-- -----------------------------------------------------
-- Table `Gradovi`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Gradovi`.`country` (
  `Code` CHAR(3) NOT NULL DEFAULT '',
  `Name` CHAR(52) NOT NULL DEFAULT '',
  `Continent` ENUM('Asia', 'Europe', 'North America', 'Africa', 'Oceania', 'Antarctica', 'South America') NOT NULL DEFAULT 'Asia',
  `Region` CHAR(26) NOT NULL DEFAULT '',
  `SurfaceArea` DECIMAL(10,2) NOT NULL DEFAULT '0.00',
  `IndepYear` SMALLINT(6) NULL DEFAULT NULL,
  `Population` INT(11) NOT NULL DEFAULT '0',
  `LifeExpectancy` DECIMAL(3,1) NULL DEFAULT NULL,
  `GNP` DECIMAL(10,2) NULL DEFAULT NULL,
  `GNPOld` DECIMAL(10,2) NULL DEFAULT NULL,
  `LocalName` CHAR(45) NOT NULL DEFAULT '',
  `GovernmentForm` CHAR(45) NOT NULL DEFAULT '',
  `HeadOfState` CHAR(60) NULL DEFAULT NULL,
  `Capital` INT(11) NULL DEFAULT NULL,
  `Code2` CHAR(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`Code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `Gradovi`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Gradovi`.`city` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` CHAR(35) NOT NULL DEFAULT '',
  `CountryCode` CHAR(3) NOT NULL DEFAULT '',
  `District` CHAR(20) NOT NULL DEFAULT '',
  `Population` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `unique_city` (`Name`, `CountryCode`, `District`, `Population`),
  INDEX `CountryCode` (`CountryCode` ASC) ,
  CONSTRAINT `city_ibfk_1`
    FOREIGN KEY (`CountryCode`)
    REFERENCES `Gradovi`.`country` (`Code`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `Gradovi`.`countrylanguage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Gradovi`.`countrylanguage` (
  `CountryCode` CHAR(3) NOT NULL DEFAULT '',
  `Language` CHAR(30) NOT NULL DEFAULT '',
  `IsOfficial` ENUM('T', 'F') NOT NULL DEFAULT 'F',
  `Percentage` DECIMAL(4,1) NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`CountryCode`, `Language`),
  INDEX `CountryCode` (`CountryCode` ASC) ,
  CONSTRAINT `countryLanguage_ibfk_1`
    FOREIGN KEY (`CountryCode`)
    REFERENCES `Gradovi`.`country` (`Code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `Gradovi`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Gradovi`.`users` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `username` CHAR(35) NOT NULL DEFAULT '',
  `email` CHAR(100) NOT NULL DEFAULT '',
  `password` CHAR(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`email`),
  UNIQUE INDEX `email` (`email` ASC) ,
  UNIQUE INDEX `username` (`username` ASC) ,
  INDEX `ID` (`ID` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `Gradovi`.`userlevel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Gradovi`.`userlevel` (
  `userId` INT(11) NOT NULL,
  `userLevel` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`userId`),
  INDEX `fk_userLevel_users_idx` (`userId` ASC) ,
  CONSTRAINT `fk_userLevel_users`
    FOREIGN KEY (`userId`)
    REFERENCES `Gradovi`.`users` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO `Gradovi`.`country` (`Code`, `Name`, `Continent`, `Region`, `SurfaceArea`, `IndepYear`, `Population`, `LifeExpectancy`, `GNP`, `GNPOld`, `LocalName`, `GovernmentForm`, `HeadOfState`, `Capital`, `Code2`) VALUES
  ('USA', 'United States', 'North America', 'Northern America', 9372610.00, 1776, 331449281, 78.8, 19390600.00, 18624400.00, 'United States', 'Federal Republic', 'Joe Biden', 1, 'US'),
  ('GBR', 'United Kingdom', 'Europe', 'British Islands', 242900.00, 1066, 66040229, 80.3, 1378330.00, 1296830.00, 'United Kingdom', 'Constitutional Monarchy', 'Charles III', 456, 'GB'),
  ('FRA', 'France', 'Europe', 'Western Europe', 551500.00, 843, 67595000, 78.8, 1424285.00, 1392448.00, 'France', 'Republic', 'Emmanuel Macron', 34, 'FR'),
  ('JPN', 'Japan', 'Asia', 'Eastern Asia', 377829.00, -660, 125720000, 80.7, 3787042.00, 4192638.00, 'Nihon/Nippon', 'Constitutional Monarchy', 'Naruhito', 1532, 'JP'),
  ('DEU', 'Germany', 'Europe', 'Western Europe', 357022.00, 1951, 83536115, 77.4, 2133367.00, 2102826.00, 'Deutschland', 'Federal Republic', 'Frank-Walter Steinmeier', 3068, 'DE'),
  ('AUS', 'Australia', 'Oceania', 'Australia and New Zealand', 7741220.00, 1901, 25649909, 80.1, 351182.00, 392911.00, 'Australia', 'Constitutional Monarchy, Federation', 'Queen Elizabeth II', 135, 'AU'),
  ('ITA', 'Italy', 'Europe', 'Southern Europe', 301316.00, 1861, 57680000, 79.0, 1161755.00, 1145372.00, 'Italia', 'Republic', 'Sergio Mattarella', 1464, 'IT'),
  ('CAN', 'Canada', 'North America', 'North America', 9976140.00, 1867, 38005238, 81.9, 857653.00, 892532.00, 'Canada', 'Constitutional Monarchy, Federation', 'Queen Elizabeth II', 35, 'CA'),
  ('RUS', 'Russia', 'Europe', 'Eastern Europe', 17075400.00, 1991, 146599183, 66.0, 276608.00, 442989.00, 'Rossija', 'Federal Republic', 'Vladimir Putin', 3580, 'RU'),
  ('BRA', 'Brazil', 'South America', 'South America', 8547403.00, 1822, 211049527, 62.9, 776739.00, 804108.00, 'Brasil', 'Federal Republic', 'Jair Bolsonaro', 2115, 'BR'),
  ('EGY', 'Egypt', 'Africa', 'Northern Africa', 1001449.00, 1922, 68470000, 63.3, 82710.00, 75617.00, 'Misr', 'Republic', 'Abdel Fattah el-Sisi', 608, 'EG'),
  ('IND', 'India', 'Asia', 'Southern and Central Asia', 3287263.00, 1947, 1013662000, 62.5, 447114.00, 430572.00, 'Bharat/India', 'Federal Republic', 'Ram Nath Kovind', 1109, 'IN'),
  ('MEX', 'Mexico', 'North America', 'Central America', 1958201.00, 1810, 98881000, 71.5, 414972.00, 401461.00, 'México', 'Federal Republic', 'Andrés Manuel López Obrador', 2515, 'MX'),
  ('CHN', 'China', 'Asia', 'Eastern Asia', 9572900.00, -1523, 1277558000, 71.4, 982268.00, 917719.00, 'Zhongquo', 'People''sRepublic', 'Hu Jintao', 1891, 'CN'),
  ('ARE', 'United Arab Emirates', 'Asia', 'Middle East', 83600.00, 1971, 2441000, 74.1, 37966.00, 36846.00, 'Al-Imarat al-´Arabiya al-Muttahida', 'Emirate Federation', 'Khalifa bin Zayed al-Nahayan', 65, 'AE'),
  ('THA', 'Thailand', 'Asia', 'Southeast Asia', 513115.00, 1350, 61399000, 68.6, 116416.00, 153907.00, 'Prathet Thai', 'Constitutional Monarchy', 'Maha Vajiralongkorn', 3320, 'TH'),
  ('NLD', 'Netherlands', 'Europe', 'Western Europe', 41526.00, 1581, 15864000, 78.3, 371362.00, 360478.00, 'Nederland', 'Constitutional Monarchy', 'Willem-Alexander', 5, 'NL'),
  ('KOR', 'South Korea', 'Asia', 'Eastern Asia', 99434.00, 1948, 46844000, 74.4, 320749.00, 442544.00, 'Taehan Min''guk (Namhan)', 'Republic', 'Moon Jae-in', 2331, 'KR'),
  ('SRB', 'Serbia', 'Europe', 'Southern Europe', 102173.00, 1878, 7379339, 72.4, 17043.00, NULL, 'Srbija', 'Republic', 'Aleksandar Vučić', 2928, 'RS');


INSERT INTO `Gradovi`.`countrylanguage` (`CountryCode`, `Language`, `IsOfficial`, `Percentage`) VALUES
  ('USA', 'English', 'T', 86.2),
  ('GBR', 'English', 'T', 97.3),
  ('FRA', 'French', 'T', 100),
  ('JPN', 'Japanese', 'T', 100),
  ('DEU', 'German', 'T', 92.0),
  ('AUS', 'English', 'T', 81.2),
  ('ITA', 'Italian', 'T', 96.0),
  ('CAN', 'English', 'T', 60.4),
  ('CAN', 'French', 'T', 23.2),
  ('RUS', 'Russian', 'T', 87.7),
  ('BRA', 'Portuguese', 'T', 97.5),
  ('EGY', 'Arabic', 'T', 98.8),
  ('IND', 'Hindi', 'T', 41.0),
  ('IND', 'Bengali', 'F', 8.1),
  ('MEX', 'Spanish', 'T', 98.2),
  ('CHN', 'Chinese', 'T', 92.0),
  ('ARE', 'Arabic', 'T', 42.0),
  ('THA', 'Thai', 'T', 95.9),
  ('NLD', 'Dutch', 'T', 95.6),
  ('KOR', 'Korean', 'T', 99.9),
  ('SRB', 'Serbian', 'T', 88.1);

INSERT INTO `Gradovi`.`city` (`Name`, `CountryCode`, `District`, `Population`) VALUES
('New York', 'USA', 'New York', 8537673),
('Los Angeles', 'USA', 'California', 3971883),
('London', 'GBR', 'Greater London', 8787892),
('Tokyo', 'JPN', 'Tokyo', 13929286),
('Paris', 'FRA', 'Ile-de-France', 2140526),
('Berlin', 'DEU', 'Berlin', 3669491),
('Moscow', 'RUS', 'Moscow (City)', 12506468),
('Sydney', 'AUS', 'New South Wales', 5312000),
('Toronto', 'CAN', 'Ontario', 2731571),
('Rio de Janeiro', 'BRA', 'Rio de Janeiro', 6476631),
('Cairo', 'EGY', 'Cairo', 7897644),
('Mumbai', 'IND', 'Maharashtra', 18414288),
('Mexico City', 'MEX', 'Distrito Federal', 8918653),
('Beijing', 'CHN', 'Beijing', 21540000),
('Dubai', 'ARE', 'Dubai', 3325000),
('Rome', 'ITA', 'Lazio', 2872800),
('Bangkok', 'THA', 'Bangkok', 8280925),
('Amsterdam', 'NLD', 'Noord-Holland', 821752),
('São Paulo', 'BRA', 'São Paulo', 11895893),
('Seoul', 'KOR', 'Seoul', 9776000),
('Belgrade', 'SRB', 'Central Serbia', 1233794),
('Niš', 'SRB', 'Central Serbia', 260237);





  INSERT INTO `Gradovi`.`users` (`username`, `email`, `password`) VALUES
  ('Nikola123', 'Nikola@example.com', 'password123'),
  ('Jovana456', 'Jovana@example.com', 'pass456'),
  ('Marko789', 'admin@example.com', 'adminpass789');


  INSERT INTO `Gradovi`.`userlevel` (`userId`, `userLevel`) VALUES
  (1, 'user'),
  (2, 'manager'),
  (3, 'admin');