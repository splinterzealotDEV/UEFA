DROP TABLE IF EXISTS `UEFA`.`del_UEFA` ;

CREATE TABLE IF NOT EXISTS `UEFA`.`del_UEFA` (
  `id` INT NOT NULL,
  `id_record` INT NOT NULL,
  `id_tabla` INT NOT NULL,
  
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `Liga`.`del_Liga` ;

CREATE TABLE IF NOT EXISTS `Liga`.`del_Liga` (
  `id` INT NOT NULL,
  `id_record` INT NOT NULL,
  `id_tabla` INT NOT NULL,
  
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `UEFA`.`del_Liga_F` (
  `id` INT NOT NULL,
  `id_record` INT NOT NULL,
  `id_tabla` INT NOT NULL,
  
  PRIMARY KEY (`id`))
ENGINE=FEDERATED DEFAULT CHARACTER SET = utf8 CONNECTION='mysql://user1:user1@10.2.0.16:3306/Liga/del_Liga';

CREATE TABLE IF NOT EXISTS `Liga`.`del_UEFA_F` (
  `id` INT NOT NULL,
  `id_record` INT NOT NULL,
  `id_tabla` INT NOT NULL,
  
  PRIMARY KEY (`id`))
ENGINE=FEDERATED DEFAULT CHARACTER SET = utf8 CONNECTION='mysql://user1:user1@10.2.0.16:3306/UEFA/del_UEFA';