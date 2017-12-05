-- -----------------------------------------------------
-- TRIGGERS Pais from UEFA
-- -----------------------------------------------------
CREATE TRIGGER insert_Pais after insert on Pais
FOR EACH ROW
BEGIN
IF NEW.id_db = 1 THEN
  insert into Pais_Liga values(new.id_pais,new.nombre,new.id_db);
END IF;
END;//

CREATE TRIGGER update_Pais after update on Pais
FOR EACH ROW
BEGIN
IF NEW.id_db = 1 THEN
  update Pais_Liga SET id_pais=new.id_pais,nombre=new.nombre,id_db=new.id_db where id_pais=old.id_pais;
END IF;
END;//

-- -----------------------------------------------------
-- TRIGGERS Jugador from UEFA
-- -----------------------------------------------------
CREATE TRIGGER insert_Jugador after insert on Jugador
FOR EACH ROW
BEGIN
IF NEW.id_db = 1 THEN
  insert into Jugador_Liga values(
  	new.id_jugador,
  	new.numero,
  	new.nombre,
  	new.posicion,
  	new.fecha_de_nacimiento,
  	new.nacionalidad,
  	new.estatura,
  	new.id_db
  	);
END IF;
END;//

CREATE TRIGGER update_Jugador after update on Jugador
FOR EACH ROW
BEGIN
IF NEW.id_db = 1 THEN
  update Jugador_Liga SET
  	id_jugador=new.id_jugador,
  	numero=new.numero,
  	nombre=new.nombre,
  	posicion=new.posicion,
  	fecha_de_nacimiento=new.fecha_de_nacimiento,
  	nacionalidad=new.nacionalidad,
  	estatura=new.estatura,
  	id_db=new.id_db
  	where id_jugador=old.id_jugador;
END IF;
END;//

-- -----------------------------------------------------
-- TRIGGERS Arbitro from UEFA
-- -----------------------------------------------------
CREATE TRIGGER insert_Arbitro after insert on Arbitro
FOR EACH ROW
BEGIN
IF NEW.id_db = 1 THEN
  insert into Arbitro_Liga values(
  	new.id_arbitro,
  	new.nombre,
  	new.fecha_de_nacimiento,
  	new.nacionalidad,
  	new.id_db
  	);
END IF;
END;//

CREATE TRIGGER update_Arbitro after update on Arbitro
FOR EACH ROW
BEGIN
IF NEW.id_db = 1 THEN
  update Arbitro_Liga SET
  	id_arbitro=new.id_arbitro,
  	nombre=new.nombre,
  	fecha_de_nacimiento=new.fecha_de_nacimiento,
  	nacionalidad=new.nacionalidad,
  	id_db=new.id_db
  	where id_arbitro=old.id_arbitro;
END IF;
END;//

-- -----------------------------------------------------
-- TRIGGERS Arbitraje from UEFA
-- -----------------------------------------------------
CREATE TRIGGER insert_Arbitraje after insert on Arbitro
FOR EACH ROW
BEGIN
IF NEW.id_db = 1 THEN
  insert into Arbitraje_Liga values(
  	new.id_partido,
  	new.id_arbitro,
  	new.id_abanderado1,
  	new.id_abanderado2,
  	new.id_cuartooficial,
  	new.id_db
  	);
END IF;
END;//

CREATE TRIGGER update_Arbitraje after update on Arbitro
FOR EACH ROW
BEGIN
IF NEW.id_db = 1 THEN
  update Arbitraje_Liga SET
  	id_partido=new.id_partido,
  	id_arbitro=new.id_arbitro,
  	id_abanderado1=new.id_abanderado1,
  	id_abanderado2=new.id_abanderado2,
  	id_cuartooficial=new.id_cuartooficial,
  	id_db=new.id_db
  	where id_partido=old.id_partido;
END IF;
END;//

-- -----------------------------------------------------
-- TRIGGERS Tarjeta from UEFA
-- -----------------------------------------------------
CREATE TRIGGER insert_Tarjeta after insert on Tarjeta
FOR EACH ROW
BEGIN
IF NEW.id_db = 1 THEN
  insert into Tarjeta_Liga values(
  	new.id_tarjeta,
  	new.valor,
  	new.id_db
  	);
END IF;
END;//

CREATE TRIGGER update_Tarjeta after update on Tarjeta
FOR EACH ROW
BEGIN
IF NEW.id_db = 1 THEN
  update Arbitraje_Liga SET
  	id_tarjeta=new.id_tarjeta,
  	valor=new.valor,
  	id_db=new.id_db
  	where id_tarjeta=old.id_tarjeta;
END IF;
END;//

-- -----------------------------------------------------
-- TRIGGERS Falta from UEFA
-- -----------------------------------------------------
CREATE TRIGGER insert_Falta after insert on Falta
FOR EACH ROW
BEGIN
IF NEW.id_db = 1 THEN
  insert into Falta_Liga values(
  	new.id_falta,
  	new.id_jugador,
  	new.id_partido,
  	new.minuto,
  	new.id_tarjeta,
    new.id_db
  	);
END IF;
END;//

CREATE TRIGGER update_Falta after update on Falta
FOR EACH ROW
BEGIN
IF NEW.id_db = 1 THEN
  update Falta_Liga SET
  	id_falta=new.id_falta,
  	id_jugador=new.id_jugador,
  	id_partido=new.id_partido,
    minuto=new.minuto,
    id_tarjeta=new.id_tarjeta,
    id_db=new.id_db
  	where id_falta=old.id_falta and id_jugador=old.id_jugador and id_partido=old.id_partido ;
END IF;
END;//

-- -----------------------------------------------------
-- TRIGGERS Estadio from UEFA
-- -----------------------------------------------------
CREATE TRIGGER insert_Estadio after insert on Estadio
FOR EACH ROW
BEGIN
IF NEW.id_db = 1 THEN
  insert into Estadio_Liga values(
  	new.id_estadio,
  	new.nombre,
  	new.id_pais,
  	new.ciudad,
    new.id_db
  	);
END IF;
END;//

CREATE TRIGGER update_Estadio after update on Estadio
FOR EACH ROW
BEGIN
IF NEW.id_db = 1 THEN
  update Estadio_Liga SET
  	id_estadio=new.id_estadio,
  	nombre=new.nombre,
  	id_pais=new.id_pais,
    ciudad=new.ciudad,
    id_db=new.id_db
  	where id_estadio=old.id_estadio;
END IF;
END;//

-- -----------------------------------------------------
-- TRIGGERS Director_tecnico from UEFA
-- -----------------------------------------------------
CREATE TRIGGER insert_Director_tecnico after insert on Director_tecnico
FOR EACH ROW
BEGIN
IF NEW.id_db = 1 THEN
  insert into Director_tecnico_Liga values(
  	new.id_estadio,
  	new.nombre,
  	new.id_pais,
  	new.ciudad,
    new.id_db
  	);
END IF;
END;//

CREATE TRIGGER update_Director_tecnico after update on Director_tecnico
FOR EACH ROW
BEGIN
IF NEW.id_db = 1 THEN
  update Director_tecnico_Liga SET
  	id_director_tecnico=new.id_director_tecnico,
  	nombre=new.nombre,
  	fecha_de_nacimiento=new.fecha_de_nacimiento,
    nacionalidad=new.nacionalidad,
    id_db=new.id_db
  	where id_director_tecnico=old.id_director_tecnico;
END IF;
END;//

-- -----------------------------------------------------
-- TRIGGERS Equipo from UEFA
-- -----------------------------------------------------
CREATE TRIGGER insert_Equipo after insert on Equipo
FOR EACH ROW
BEGIN
IF NEW.id_db = 1 THEN
  insert into Equipo_Liga values(
  	new.id_falta,
  	new.id_jugador,
  	new.id_partido,
  	new.minuto,
  	new.id_tarjeta,
    new.id_db
  	);
END IF;
END;//

CREATE TRIGGER update_Equipo after update on Equipo
FOR EACH ROW
BEGIN
IF NEW.id_db = 1 THEN
  update Equipo_Liga SET
  	id_falta=new.id_falta,
  	id_jugador=new.id_jugador,
  	id_partido=new.id_partido,
    minuto=new.minuto,
    id_tarjeta=new.id_tarjeta,
    id_db=new.id_db
  	where id_equipo=old.id_equipo;
END IF;
END;//

-- -----------------------------------------------------
-- TRIGGERS Temporada from UEFA
-- -----------------------------------------------------
CREATE TRIGGER insert_Temporada after insert on Temporada
FOR EACH ROW
BEGIN
IF NEW.id_db = 1 THEN
  insert into Temporada_Liga values(
  	new.id_temporada,
  	new.año,
    new.id_db
  	);
END IF;
END;//

CREATE TRIGGER update_Temporada after update on Temporada
FOR EACH ROW
BEGIN
IF NEW.id_db = 1 THEN
  update Temporada_Liga SET
  	id_temporada=new.id_temporada,
  	año=new.año,
    id_db=new.id_db
  	where id_temporada=old.id_temporada;
END IF;
END;//

-- -----------------------------------------------------
-- TRIGGERS Gol from UEFA
-- -----------------------------------------------------
CREATE TRIGGER insert_Gol after insert on Gol
FOR EACH ROW
BEGIN
IF NEW.id_db = 1 THEN
  insert into Gol_Liga values(
  	new.id_gol,
  	new.id_partido,
  	new.id_equipo,
  	new.minuto,
  	new.id_jugador,
    new.penal,
    new.id_db
  	);
END IF;
END;//

CREATE TRIGGER update_Gol after update on Gol
FOR EACH ROW
BEGIN
IF NEW.id_db = 1 THEN
  update Gol_Liga SET
  	id_gol=new.id_gol,
  	id_partido=new.id_partido,
  	id_equipo=new.id_equipo,
    minuto=new.minuto,
    id_jugador=new.id_jugador,
    penal=new.penal,
    id_db=new.id_db
  	where id_gol=old.id_gol;
END IF;
END;//