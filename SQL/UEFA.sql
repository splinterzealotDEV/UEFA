-- MySQL Workbench Synchronization
-- Generated: 2017-10-16 17:39
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: taka

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `UEFA` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Pais` (
  `id_pais` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_pais`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `UEFA`.`Temporada` (
  `id_temporada` INT(11) NOT NULL AUTO_INCREMENT,
  `año` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_temporada`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `UEFA`.`Arbitro` (
  `id_arbitro` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_nacimiento` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id_arbitro`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `UEFA`.`Liga` (
  `id_liga` INT(11) NOT NULL AUTO_INCREMENT,
  `temporada` INT(11) NULL DEFAULT NULL,
  `pais` INT(11) NULL DEFAULT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_liga`),
  INDEX `pais_idx` (`pais` ASC),
  INDEX `temporada_idx` (`temporada` ASC),
  CONSTRAINT `pais_liga`
    FOREIGN KEY (`pais`)
    REFERENCES `UEFA`.`Pais` (`id_pais`),
  CONSTRAINT `temporada`
    FOREIGN KEY (`temporada`)
    REFERENCES `UEFA`.`Temporada` (`id_temporada`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `UEFA`.`Jugador` (
  `id_jugador` INT(11) NOT NULL,
  `numero` INT(11) NULL DEFAULT NULL,
  `Nombre` VARCHAR(60) NULL DEFAULT NULL,
  `posicion` VARCHAR(20) NULL DEFAULT NULL,
  `fecha_de_nacimiento` DATE NULL DEFAULT NULL,
  `nacionalidad` INT(11) NULL DEFAULT NULL,
  `estatura` DECIMAL NULL DEFAULT NULL,
  `efectividad` DECIMAL NULL DEFAULT NULL,
  PRIMARY KEY (`id_jugador`),
  INDEX `nacionalidad_idx` (`nacionalidad` ASC),
  CONSTRAINT `nacionalidad_jug`
    FOREIGN KEY (`nacionalidad`)
    REFERENCES `UEFA`.`Pais` (`id_pais`)
    )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `UEFA`.`Director_Tecnico` (
  `id_director_tecnico` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_de_nacimiento` DATE NULL DEFAULT NULL,
  `nacionalidad` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_director_tecnico`),
  INDEX `nacionalidad_idx` (`nacionalidad` ASC),
  CONSTRAINT `nacionalidad_dir`
    FOREIGN KEY (`nacionalidad`)
    REFERENCES `UEFA`.`Pais` (`id_pais`)
    )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `UEFA`.`Estadio` (
  `id_estadio` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `pais` INT(11) NULL DEFAULT NULL,
  `ciudad` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_estadio`),
  INDEX `pais_idx` (`pais` ASC),
  CONSTRAINT `pais_estadio`
    FOREIGN KEY (`pais`)
    REFERENCES `UEFA`.`Pais` (`id_pais`)
    )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `UEFA`.`Equipo` (
  `id_equipo` INT(11) NOT NULL AUTO_INCREMENT,
  `dt` INT(11) NULL DEFAULT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `pais` INT(11) NULL DEFAULT NULL,
  `estadio` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_equipo`),
  INDEX `dt_idx` (`dt` ASC),
  INDEX `pais_idx` (`pais` ASC),
  INDEX `estadio_idx` (`estadio` ASC),
  CONSTRAINT `dt`
    FOREIGN KEY (`dt`)
    REFERENCES `UEFA`.`Director_Tecnico` (`id_director_tecnico`),
  CONSTRAINT `pais_equipo`
    FOREIGN KEY (`pais`)
    REFERENCES `UEFA`.`Pais` (`id_pais`),
  CONSTRAINT `estadio_equipo`
    FOREIGN KEY (`estadio`)
    REFERENCES `UEFA`.`Estadio` (`id_estadio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `UEFA`.`Partido_Equipo_Liga` (
  `id_partido_equipo_liga` INT(11) NOT NULL AUTO_INCREMENT,
  `id_local` INT(11) NULL DEFAULT NULL,
  `id_visitante` INT(11) NULL DEFAULT NULL,
  `id_liga` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_partido_equipo_liga`),
  INDEX `id_local_idx` (`id_local` ASC),
  INDEX `id_visitante_idx` (`id_visitante` ASC),
  INDEX `id_liga_idx` (`id_liga` ASC),
  CONSTRAINT `id_local_pel`
    FOREIGN KEY (`id_local`)
    REFERENCES `UEFA`.`Equipo` (`id_equipo`),
  CONSTRAINT `id_visitante_pel`
    FOREIGN KEY (`id_visitante`)
    REFERENCES `UEFA`.`Equipo` (`id_equipo`),
  CONSTRAINT `id_liga_pel`
    FOREIGN KEY (`id_liga`)
    REFERENCES `UEFA`.`Liga` (`id_liga`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `UEFA`.`Falta` (
  `id_falta` INT(11) NOT NULL AUTO_INCREMENT,
  `id_jugador` INT(11) NULL DEFAULT NULL,
  `id_partido` INT(11) NULL DEFAULT NULL,
  `minuto` INT(11) NULL DEFAULT NULL,
  `tarjeta` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`id_falta`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `UEFA`.`Gol` (
  `id_gol` INT(11) NOT NULL AUTO_INCREMENT,
  `id_partido` INT(11) NULL DEFAULT NULL,
  `id_equipo` INT(11) NULL DEFAULT NULL,
  `minuto` INT(11) NULL DEFAULT NULL,
  `id_jugador` INT(11) NULL DEFAULT NULL,
  `penal` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id_gol`),
  INDEX `id_partido_idx` (`id_partido` ASC),
  INDEX `id_jugador_idx` (`id_equipo` ASC),
  CONSTRAINT `id_partido_gol`
    FOREIGN KEY (`id_partido`)
    REFERENCES `UEFA`.`Partido_Equipo_Liga` (`id_partido_equipo_liga`),
  CONSTRAINT `id_jugador_gol`
    FOREIGN KEY (`id_equipo`)
    REFERENCES `UEFA`.`Jugador` (`id_jugador`),
  CONSTRAINT `id_equipo_gol`
    FOREIGN KEY (`id_equipo`)
    REFERENCES `UEFA`.`Equipo` (`id_equipo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `UEFA`.`Equipo_Liga` (
  `idequipo_liga` INT(11) NOT NULL,
  `id_equipo` INT(11) NULL DEFAULT NULL,
  `id_liga` INT(11) NULL DEFAULT NULL,
  `posicion` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idequipo_liga`),
  INDEX `id_equipo_idx` (`id_equipo` ASC),
  INDEX `id_liga_idx` (`id_liga` ASC),
  CONSTRAINT `id_equipo_el`
    FOREIGN KEY (`id_equipo`)
    REFERENCES `UEFA`.`Equipo` (`id_equipo`),
  CONSTRAINT `id_liga_el`
    FOREIGN KEY (`id_liga`)
    REFERENCES `UEFA`.`Liga` (`id_liga`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `UEFA`.`Arbitraje` (
  `id_arbitraje` INT(11) NOT NULL AUTO_INCREMENT,
  `id_arbitro` INT(11) NULL DEFAULT NULL,
  `id_abanderado1` INT(11) NULL DEFAULT NULL,
  `id_abanderado2` INT(11) NULL DEFAULT NULL,
  `id_cuarto_oficial` INT(11) NULL DEFAULT NULL,
  `id_partido` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_arbitraje`),
  INDEX `id_partido_idx` (`id_partido` ASC),
  INDEX `id_arbitro_idx` (`id_arbitro` ASC),
  INDEX `id_ab1_idx` (`id_abanderado1` ASC),
  CONSTRAINT `id_partido_arbitraje`
    FOREIGN KEY (`id_partido`)
    REFERENCES `UEFA`.`Partido_Equipo_Liga` (`id_partido_equipo_liga`),
  CONSTRAINT `id_arbitro_arbitraje`
    FOREIGN KEY (`id_arbitro`)
    REFERENCES `UEFA`.`Arbitro` (`id_arbitro`),
  CONSTRAINT `id_ab1_arbitraje`
    FOREIGN KEY (`id_abanderado1`)
    REFERENCES `UEFA`.`Arbitro` (`id_arbitro`),
  CONSTRAINT `id_ab2_arbitraje`
    FOREIGN KEY (`id_arbitraje`)
    REFERENCES `UEFA`.`Arbitro` (`id_arbitro`),
  CONSTRAINT `id_cuarto_o_arbitraje`
    FOREIGN KEY (`id_arbitraje`)
    REFERENCES `UEFA`.`Arbitro` (`id_arbitro`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
