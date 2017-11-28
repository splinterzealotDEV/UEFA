
-- -----------------------------------------------------
-- Table `Liga`.`Pais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UEFA`.`Pais_Liga` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Pais_Liga` (
  `id_pais` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `id_db` INT NOT NULL,
  PRIMARY KEY (`id_pais`))
ENGINE=FEDERATED DEFAULT CHARACTER SET = utf8 CONNECTION='mysql://user1:user1@10.2.0.16:3306/Liga/Pais';


-- -----------------------------------------------------
-- Table `Liga`.`Jugador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UEFA`.`Jugador_Liga` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Jugador_Liga` (
  `id_jugador` INT NOT NULL,
  `numero` INT NULL,
  `nombre` VARCHAR(45) NULL,
  `posicion` VARCHAR(45) NULL,
  `fecha_de_nacimiento` DATE NULL,
  `nacionalidad` INT NULL,
  `estatura` INT NULL,
  `id_db` INT NOT NULL,
  PRIMARY KEY (`id_jugador`)
)
ENGINE=FEDERATED DEFAULT CHARACTER SET = utf8 CONNECTION='mysql://user1:user1@10.2.0.16:3306/Liga/Jugador';


-- -----------------------------------------------------
-- Table `Liga`.`Arbitro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UEFA`.`Arbitro_Liga` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Arbitro_Liga` (
  `id_arbitro` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `fecha_de_nacimiento` DATE NULL,
  `nacionalidad` INT NULL,
  `id_db` INT NOT NULL,
  PRIMARY KEY (`id_arbitro`)
)
ENGINE=FEDERATED DEFAULT CHARACTER SET = utf8 CONNECTION='mysql://user1:user1@10.2.0.16:3306/Liga/Arbitro';


-- -----------------------------------------------------
-- Table `Liga`.`Arbitraje`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UEFA`.`Arbitraje_Liga` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Arbitraje_Liga` (
  `id_partido` INT NOT NULL,
  `id_arbitro` INT NULL,
  `id_abanderado1` INT NULL,
  `id_abanderado2` INT NULL,
  `id_cuartooficial` INT NULL,
  `id_db` INT NOT NULL,
  PRIMARY KEY (`id_partido`)
)
ENGINE=FEDERATED DEFAULT CHARACTER SET = utf8 CONNECTION='mysql://user1:user1@10.2.0.16:3306/Liga/Arbitraje';


-- -----------------------------------------------------
-- Table `Liga`.`Tarjeta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UEFA`.`Tarjeta_Liga` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Tarjeta_Liga` (
  `id_tarjeta` INT NOT NULL,
  `valor` TINYINT NULL,
  `id_db` INT NOT NULL,
  PRIMARY KEY (`id_tarjeta`))
ENGINE=FEDERATED DEFAULT CHARACTER SET = utf8 CONNECTION='mysql://user1:user1@10.2.0.16:3306/Liga/Tarjeta';


-- -----------------------------------------------------
-- Table `Liga`.`Falta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UEFA`.`Falta_Liga` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Falta_Liga` (
  `id_falta` INT NOT NULL,
  `id_jugador` INT NOT NULL,
  `id_partido` INT NOT NULL,
  `minuto` INT NULL,
  `id_tarjeta` INT NULL,
  `id_db` INT NOT NULL,
  PRIMARY KEY (`id_falta`, `id_jugador`, `id_partido`)
)
ENGINE=FEDERATED DEFAULT CHARACTER SET = utf8 CONNECTION='mysql://user1:user1@10.2.0.16:3306/Liga/Falta';


-- -----------------------------------------------------
-- Table `Liga`.`Estadio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UEFA`.`Estadio_Liga` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Estadio_Liga` (
  `id_estadio` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `id_pais` INT NULL,
  `ciudad` VARCHAR(45) NULL,
  `id_db` INT NOT NULL,
  PRIMARY KEY (`id_estadio`)
  )
ENGINE=FEDERATED DEFAULT CHARACTER SET = utf8 CONNECTION='mysql://user1:user1@10.2.0.16:3306/Liga/Estadio_Liga';


-- -----------------------------------------------------
-- Table `Liga`.`Director_tecnico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UEFA`.`Director_tecnico_Liga` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Director_tecnico_Liga` (
  `id_director_tecnico` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `fecha_de_nacimiento` DATE NULL,
  `nacionalidad` INT NULL,
  `id_db` INT NOT NULL,
  PRIMARY KEY (`id_director_tecnico`)
)
ENGINE=FEDERATED DEFAULT CHARACTER SET = utf8 CONNECTION='mysql://user1:user1@10.2.0.16:3306/Liga/Director_tecnico';


-- -----------------------------------------------------
-- Table `Liga`.`Equipo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UEFA`.`Equipo_Liga` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Equipo_Liga` (
  `id_equipo` INT NOT NULL,
  `id_director_tecnico` INT NULL,
  `nombre` VARCHAR(45) NULL,
  `id_pais` INT NULL,
  `id_estadio` INT NULL,
  `id_db` INT NOT NULL,
  PRIMARY KEY (`id_equipo`)
)
ENGINE=FEDERATED DEFAULT CHARACTER SET = utf8 CONNECTION='mysql://user1:user1@10.2.0.16:3306/Liga/Equipo';


-- -----------------------------------------------------
-- Table `Liga`.`Temporada`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UEFA`.`Temporada_Liga` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Temporada_Liga` (
  `id_temporada` INT NOT NULL,
  `año` INT NULL,
  `id_db` INT NOT NULL,
  PRIMARY KEY (`id_temporada`))
ENGINE=FEDERATED DEFAULT CHARACTER SET = utf8 CONNECTION='mysql://user1:user1@10.2.16:3306/Liga/Temporada';



-- -----------------------------------------------------
-- Table `Liga`.`Partido_Equipo_Liga`
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;


DROP TABLE IF EXISTS `UEFA`.`Partido_Liga` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Partido_Liga` (
  id_partido INT NOT NULL,
  `id_temporada` INT NOT NULL,
  `id_local` INT NOT NULL,
  `id_visitante` INT NOT NULL,
  `id_db` INT NOT NULL,
  PRIMARY KEY (`id_partido`)
)
ENGINE=FEDERATED DEFAULT CHARACTER SET = utf8 CONNECTION='mysql://user1:user1@10.2.0.16:3306/Liga/Partido';

-- -----------------------------------------------------
-- Table `Liga`.`Gol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UEFA`.`Gol_Liga` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`Gol_Liga` (
  `id_gol` INT NOT NULL,
  `id_partido` INT NULL,
  `id_equipo` INT NULL,
  `minuto` INT NULL,
  `id_jugador` INT NULL,
  `penal` TINYINT NULL,
  `id_db` INT NOT NULL,
  PRIMARY KEY (`id_gol`)
)
ENGINE=FEDERATED DEFAULT CHARACTER SET = utf8 CONNECTION='mysql://user1:user1@10.2.0.16:3306/Liga/Gol';

SET FOREIGN_KEY_CHECKS=1;

 
