-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=`TRADITIONAL,ALLOW_INVALID_DATES`;

-- -----------------------------------------------------
-- Schema UEFA
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `UEFA` ;

-- -----------------------------------------------------
-- Schema UEFA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `UEFA` DEFAULT CHARACTER SET utf8 ;
USE `UEFA` ;

-- -----------------------------------------------------
-- Table `UEFA`.`Pais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UEFA`.`Pais` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Pais` (
  `id_pais` INT NOT NULL,
  `id_db` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id_pais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UEFA`.`Jugador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UEFA`.`Jugador` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Jugador` (
  `id_jugador` INT NOT NULL,
  `numero` INT NULL,
  `nombre` VARCHAR(45) NULL,
  `posicion` VARCHAR(45) NULL,
  `fecha_de_nacimiento` DATE NULL,
  `nacionalidad` INT NULL,
  `estatura` INT NULL,
  `id_db` INT NOT NULL,
  `liga` INT NULL,
  PRIMARY KEY (`id_jugador`),
  FOREIGN KEY (`nacionalidad`)
  REFERENCES `UEFA`.`Pais` (`id_pais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UEFA`.`Arbitro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UEFA`.`Arbitro` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Arbitro` (
  `id_arbitro` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `fecha_de_nacimiento` DATE NULL,
  `nacionalidad` INT NULL,
  `id_db` INT NOT NULL,
  `liga` INT NULL,
  PRIMARY KEY (`id_arbitro`),
  FOREIGN KEY (`nacionalidad`)
    REFERENCES `UEFA`.`Pais` (`id_pais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UEFA`.`Arbitraje`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UEFA`.`Arbitraje` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Arbitraje` (
  `id_partido` INT NOT NULL,
  `id_arbitro` INT NULL,
  `id_abanderado1` INT NULL,
  `id_abanderado2` INT NULL,
  `id_cuartooficial` INT NULL,
  `id_db` INT NOT NULL,
  `liga` INT NULL,
  PRIMARY KEY (`id_partido`),
  FOREIGN KEY (`id_partido`)
    REFERENCES `UEFA`.`Partido_Equipo_Liga` (`id_partido_equipo_liga`),
  FOREIGN KEY (`id_arbitro`)
    REFERENCES `UEFA`.`Arbitro` (`id_arbitro`),
  FOREIGN KEY (`id_abanderado1`)
    REFERENCES `UEFA`.`Arbitro` (`id_arbitro`),
  FOREIGN KEY (`id_abanderado2`)
    REFERENCES `UEFA`.`Arbitro` (`id_arbitro`),
  FOREIGN KEY (`id_cuartooficial`)
    REFERENCES `UEFA`.`Arbitro` (`id_arbitro`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UEFA`.`Tarjeta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UEFA`.`Tarjeta` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Tarjeta` (
  `id_tarjeta` INT NOT NULL,
  `valor` TINYINT NULL,
  `id_db` INT NOT NULL,
  `liga` INT NOT NULL,
  PRIMARY KEY (`id_tarjeta`, `liga`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UEFA`.`Falta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UEFA`.`Falta` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Falta` (
  `id_falta` INT NOT NULL,
  `id_jugador` INT NOT NULL,
  `id_partido` INT NOT NULL,
  `minuto` INT NULL,
  `id_tarjeta` INT NULL,
  `id_db` INT NOT NULL,
  `liga` INT NOT NULL,
  PRIMARY KEY (`id_falta`, `id_jugador`, `id_partido`),
  FOREIGN KEY (`id_jugador`)
  REFERENCES `UEFA`.`Jugador` (`id_jugador`),
  FOREIGN KEY (`id_partido`)
  REFERENCES `UEFA`.`Partido` (`id_partido`),
  FOREIGN KEY (`id_tarjeta`)
  REFERENCES `UEFA`.`Tarjeta` (`id_tarjeta`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UEFA`.`Estadio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UEFA`.`Estadio` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Estadio` (
  `id_estadio` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `id_pais` INT NULL,
  `ciudad` VARCHAR(45) NULL,
  `id_db` INT NOT NULL,
  `liga` INT NULL,
  PRIMARY KEY (`id_estadio`),
  FOREIGN KEY (`id_pais`)
  REFERENCES `UEFA`.`Pais` (`id_pais`)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UEFA`.`Director_tecnico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UEFA`.`Director_tecnico` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Director_tecnico` (
  `id_director_tecnico` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `fecha_de_nacimiento` DATE NULL,
  `nacionalidad` INT NULL,
  `id_db` INT NOT NULL,
  `liga` INT NULL,
  PRIMARY KEY (`id_director_tecnico`),
  FOREIGN KEY (`nacionalidad`)
  REFERENCES `UEFA`.`Pais` (`id_pais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UEFA`.`Equipo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UEFA`.`Equipo` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Equipo` (
  `id_equipo` INT NOT NULL,
  `id_director_tecnico` INT NULL,
  `nombre` VARCHAR(45) NULL,
  `id_pais` INT NULL,
  `id_estadio` INT NULL,
  `id_db` INT NOT NULL,
  `liga` INT NULL,
  PRIMARY KEY (`id_equipo`),
   FOREIGN KEY (`id_director_tecnico`)
  REFERENCES `UEFA`.`Director_tecnico` (`id_director_tecnico`),
   FOREIGN KEY (`id_pais`)
  REFERENCES `UEFA`.`Pais` (`id_pais`),
   FOREIGN KEY (`id_estadio`)
  REFERENCES `UEFA`.`Estadio` (`id_estadio`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UEFA`.`Temporada`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UEFA`.`Temporada` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Temporada` (
  `id_temporada` INT NOT NULL,
  `año` INT NULL,
  `id_db` INT NOT NULL,
  `liga` INT NULL,
  PRIMARY KEY (`id_temporada`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UEFA`.`Liga`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UEFA`.`Liga` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Liga` (
  `id_liga` INT NOT NULL,
  `temporada` INT NULL,
  `pais` INT NULL,
  `id_db` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id_liga`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `UEFA`.`Equipo_Liga`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UEFA`.`Posiciones` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Posiciones` (
  `id_temporada` INT NOT NULL,
  `id_equipo` INT NOT NULL,
  `id_liga` INT NOT NULL,
  `id_db` INT NOT NULL,
  `posicion` INT NULL,
  PRIMARY KEY (`id_temporada`, `id_equipo`, `id_liga`),
  FOREIGN KEY (`id_temporada`)
    REFERENCES `UEFA`.`Temporada` (`id_temporada`),
  FOREIGN KEY (`id_equipo`)
    REFERENCES `UEFA`.`Equipo` (`id_equipo`),
  FOREIGN KEY (`id_liga`) 
    REFERENCES `UEFA`.`Liga` (`id_liga`)
)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `UEFA`.`Partido_Equipo_Liga`
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;


DROP TABLE IF EXISTS `UEFA`.`Partido` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Partido` (
  id_partido INT NOT NULL,
  `id_temporada` INT NOT NULL,
  `id_local` INT NOT NULL,
  `id_visitante` INT NOT NULL,
  `id_db` INT NOT NULL,
  `id_liga` INT NOT NULL,
  PRIMARY KEY (`id_partido`),
  FOREIGN KEY (`id_temporada`)
    REFERENCES `UEFA`.`Temporada` (`id_temporada`),
  FOREIGN KEY (`id_local`)
    REFERENCES `UEFA`.`Equipo` (`id_equipo`),
  FOREIGN KEY (`id_visitante`)
    REFERENCES `UEFA`.`Equipo` (`id_equipo`),
  FOREIGN KEY (`id_liga`)
    REFERENCES `UEFA`.`Liga` (`id_liga`)
)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `UEFA`.`Gol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UEFA`.`Gol` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Gol` (
  `id_gol` INT NOT NULL,
  `id_partido` INT NULL,
  `id_equipo` INT NULL,
  `minuto` INT NULL,
  `id_jugador` INT NULL,
  `penal` TINYINT NULL,
  `id_db` INT NOT NULL,
  `liga` INT NULL,
  PRIMARY KEY (`id_gol`),
    FOREIGN KEY (`id_partido`)
    REFERENCES `UEFA`.`Partido` (`id_partido`),
    FOREIGN KEY (`id_equipo`)
    REFERENCES `UEFA`.`Jugador` (`id_jugador`),
    FOREIGN KEY (`id_equipo`)
    REFERENCES `UEFA`.`Equipo` (`id_equipo`))
ENGINE = InnoDB;

SET FOREIGN_KEY_CHECKS=1; 
