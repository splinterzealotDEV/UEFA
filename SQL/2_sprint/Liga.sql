-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=`TRADITIONAL,ALLOW_INVALID_DATES`;

-- -----------------------------------------------------
-- Schema Liga
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Liga` ;

-- -----------------------------------------------------
-- Schema Liga
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Liga` DEFAULT CHARACTER SET utf8 ;
USE `Liga` ;

-- -----------------------------------------------------
-- Table `Liga`.`Pais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Liga`.`Pais` ;

CREATE TABLE IF NOT EXISTS `Liga`.`Pais` (
  `id_pais` INT NOT NULL ,
  `version` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `id_db` INT DEFAULT 2,
  PRIMARY KEY (`id_pais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Liga`.`Jugador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Liga`.`Jugador` ;

CREATE TABLE IF NOT EXISTS `Liga`.`Jugador` (
  `id_jugador` INT NOT NULL,
  `numero` INT NULL,
  `nombre` VARCHAR(45) NULL,
  `posicion` VARCHAR(45) NULL,
  `fecha_de_nacimiento` DATE NULL,
  `nacionalidad` INT NULL,
  `estatura` INT NULL,
  `version` INT NOT NULL AUTO_INCREMENT,
  `id_db` INT DEFAULT 2,
  PRIMARY KEY (`id_jugador`),
  FOREIGN KEY (`nacionalidad`)
  REFERENCES `Liga`.`Pais` (`id_pais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Liga`.`Arbitro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Liga`.`Arbitro` ;

CREATE TABLE IF NOT EXISTS `Liga`.`Arbitro` (
  `id_arbitro` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `fecha_de_nacimiento` DATE NULL,
  `nacionalidad` INT NULL,
  `version` INT NOT NULL AUTO_INCREMENT,
  `id_db` INT DEFAULT 2,
  PRIMARY KEY (`id_arbitro`),
  FOREIGN KEY (`nacionalidad`)
    REFERENCES `Liga`.`Pais` (`id_pais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Liga`.`Arbitraje`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Liga`.`Arbitraje` ;

CREATE TABLE IF NOT EXISTS `Liga`.`Arbitraje` (
  `id_partido` INT NOT NULL,
  `id_arbitro` INT NULL,
  `id_abanderado1` INT NULL,
  `id_abanderado2` INT NULL,
  `id_cuartooficial` INT NULL,
  `version` INT NOT NULL AUTO_INCREMENT,
  `id_db` INT DEFAULT 2,
  PRIMARY KEY (`id_partido`),
  FOREIGN KEY (`id_partido`)
    REFERENCES `Liga`.`Partido_Equipo_Liga` (`id_partido_equipo_liga`),
  FOREIGN KEY (`id_arbitro`)
    REFERENCES `Liga`.`Arbitro` (`id_arbitro`),
  FOREIGN KEY (`id_abanderado1`)
    REFERENCES `Liga`.`Arbitro` (`id_arbitro`),
  FOREIGN KEY (`id_abanderado2`)
    REFERENCES `Liga`.`Arbitro` (`id_arbitro`),
  FOREIGN KEY (`id_cuartooficial`)
    REFERENCES `Liga`.`Arbitro` (`id_arbitro`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Liga`.`Tarjeta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Liga`.`Tarjeta` ;

CREATE TABLE IF NOT EXISTS `Liga`.`Tarjeta` (
  `id_tarjeta` INT NOT NULL,
  `valor` TINYINT NULL,
  `version` INT NOT NULL AUTO_INCREMENT,
  `id_db` INT DEFAULT 2,
  PRIMARY KEY (`id_tarjeta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Liga`.`Falta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Liga`.`Falta` ;

CREATE TABLE IF NOT EXISTS `Liga`.`Falta` (
  `id_falta` INT NOT NULL,
  `id_jugador` INT NOT NULL,
  `id_partido` INT NOT NULL,
  `minuto` INT NULL,
  `id_tarjeta` INT NULL,
  `version` INT NOT NULL AUTO_INCREMENT,
  `id_db` INT DEFAULT 2,
  PRIMARY KEY (`id_falta`, `id_jugador`, `id_partido`),
  FOREIGN KEY (`id_jugador`)
  REFERENCES `Liga`.`Jugador` (`id_jugador`),
  FOREIGN KEY (`id_partido`)
  REFERENCES `Liga`.`Partido` (`id_partido`),
  FOREIGN KEY (`id_tarjeta`)
  REFERENCES `Liga`.`Tarjeta` (`id_tarjeta`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Liga`.`Estadio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Liga`.`Estadio` ;

CREATE TABLE IF NOT EXISTS `Liga`.`Estadio` (
  `id_estadio` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `id_pais` INT NULL,
  `ciudad` VARCHAR(45) NULL,
  `version` INT NOT NULL AUTO_INCREMENT,
  `id_db` INT DEFAULT 2,
  PRIMARY KEY (`id_estadio`),
  FOREIGN KEY (`id_pais`)
  REFERENCES `Liga`.`Pais` (`id_pais`)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Liga`.`Director_tecnico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Liga`.`Director_tecnico` ;

CREATE TABLE IF NOT EXISTS `Liga`.`Director_tecnico` (
  `id_director_tecnico` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `fecha_de_nacimiento` DATE NULL,
  `nacionalidad` INT NULL,
  `version` INT NOT NULL AUTO_INCREMENT,
  `id_db` INT DEFAULT 2,
  PRIMARY KEY (`id_director_tecnico`),
  FOREIGN KEY (`nacionalidad`)
  REFERENCES `Liga`.`Pais` (`id_pais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Liga`.`Equipo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Liga`.`Equipo` ;

CREATE TABLE IF NOT EXISTS `Liga`.`Equipo` (
  `id_equipo` INT NOT NULL,
  `id_director_tecnico` INT NULL,
  `nombre` VARCHAR(45) NULL,
  `id_pais` INT NULL,
  `id_estadio` INT NULL,
  `version` INT NOT NULL AUTO_INCREMENT,
  `id_db` INT DEFAULT 2,
  PRIMARY KEY (`id_equipo`),
   FOREIGN KEY (`id_director_tecnico`)
  REFERENCES `Liga`.`Director_tecnico` (`id_director_tecnico`),
   FOREIGN KEY (`id_pais`)
  REFERENCES `Liga`.`Pais` (`id_pais`),
   FOREIGN KEY (`id_estadio`)
  REFERENCES `Liga`.`Estadio` (`id_estadio`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Liga`.`Temporada`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Liga`.`Temporada` ;

CREATE TABLE IF NOT EXISTS `Liga`.`Temporada` (
  `id_temporada` INT NOT NULL,
  `año` INT NULL,
  `version` INT NOT NULL AUTO_INCREMENT,
  `id_db` INT DEFAULT 2,
  PRIMARY KEY (`id_temporada`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `Liga`.`Partido_Equipo_Liga`
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;


DROP TABLE IF EXISTS `Liga`.`Partido` ;

CREATE TABLE IF NOT EXISTS `Liga`.`Partido` (
  id_partido INT NOT NULL,
  `id_temporada` INT NOT NULL,
  `id_local` INT NOT NULL,
  `id_visitante` INT NOT NULL,
  `version` INT NOT NULL AUTO_INCREMENT,
  `id_db` INT DEFAULT 2,
  PRIMARY KEY (`id_partido`),
  FOREIGN KEY (`id_temporada`)
    REFERENCES `Liga`.`Temporada` (`id_temporada`),
  FOREIGN KEY (`id_local`)
    REFERENCES `Liga`.`Equipo` (`id_equipo`),
  FOREIGN KEY (`id_visitante`)
    REFERENCES `Liga`.`Equipo` (`id_equipo`)
)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Liga`.`Gol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Liga`.`Gol` ;

CREATE TABLE IF NOT EXISTS `Liga`.`Gol` (
  `id_gol` INT NOT NULL,
  `id_partido` INT NULL,
  `id_equipo` INT NULL,
  `minuto` INT NULL,
  `id_jugador` INT NULL,
  `penal` TINYINT NULL,
  `version` INT NOT NULL AUTO_INCREMENT,
  `id_db` INT DEFAULT 2,
  PRIMARY KEY (`id_gol`),
    FOREIGN KEY (`id_partido`)
    REFERENCES `Liga`.`Partido` (`id_partido`),
    FOREIGN KEY (`id_equipo`)
    REFERENCES `Liga`.`Jugador` (`id_jugador`),
    FOREIGN KEY (`id_equipo`)
    REFERENCES `Liga`.`Equipo` (`id_equipo`))
ENGINE = InnoDB;

SET FOREIGN_KEY_CHECKS=1;


DROP TABLE IF EXISTS `Liga`.`Liga` ;

CREATE TABLE IF NOT EXISTS `Liga`.`Liga` (
  `id_liga` INT NOT NULL,
  `version` INT NOT NULL AUTO_INCREMENT,
  `nombre` INT,
   PRIMARY KEY (`id_liga`)
)ENGINE = InnoDB;
 
