-- -----------------------------------------------------
-- TRIGGERS Pais from Liga
-- -----------------------------------------------------
CREATE TRIGGER insert_Pais after insert on Pais
FOR EACH ROW
BEGIN
IF NEW.id_db = 2 THEN
  insert into Pais_UEFA values(new.id_pais,new.nombre,new.id_db);
END IF;
END;//

CREATE TRIGGER update_Pais after update on Pais
FOR EACH ROW
BEGIN
IF NEW.id_db = 2 THEN
  update Pais_UEFA SET id_pais=new.id_pais,nombre=new.nombre,id_db=new.id_db where id_pais=old.id_pais;
END IF;
END;//

-- -----------------------------------------------------
-- TRIGGERS Jugador from Liga
-- -----------------------------------------------------
CREATE TRIGGER insert_Jugador after insert on Jugador
FOR EACH ROW
BEGIN
IF NEW.id_db = 2 THEN
  insert into Jugador_UEFA values(
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
IF NEW.id_db = 2 THEN
  update Jugador_UEFA SET 
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
-- TRIGGERS Arbitro from Liga
-- -----------------------------------------------------
CREATE TRIGGER insert_Arbitro after insert on Arbitro
FOR EACH ROW
BEGIN
IF NEW.id_db = 2 THEN
  insert into Arbitro_UEFA values(
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
IF NEW.id_db = 2 THEN
  update Arbitro_UEFA SET 
  	id_arbitro=new.id_arbitro,
  	nombre=new.nombre,
  	fecha_de_nacimiento=new.fecha_de_nacimiento,
  	nacionalidad=new.nacionalidad,
  	id_db=new.id_db
  	where id_arbitro=old.id_arbitro;
END IF;
END;//

-- -----------------------------------------------------
-- TRIGGERS Arbitraje from Liga
-- -----------------------------------------------------
CREATE TRIGGER insert_Arbitraje after insert on Arbitro
FOR EACH ROW
BEGIN
IF NEW.id_db = 2 THEN
  insert into Arbitraje_UEFA values(
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
IF NEW.id_db = 2 THEN
  update Arbitraje_UEFA SET 
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
-- TRIGGERS Falta from Liga
-- -----------------------------------------------------
CREATE TRIGGER insert_Falta after insert on Falta
FOR EACH ROW
BEGIN
IF NEW.id_db = 2 THEN
  insert into Falta_UEFA values(
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
IF NEW.id_db = 2 THEN
  update Falta_UEFA SET 
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
-- TRIGGERS Estadio from Liga
-- -----------------------------------------------------
CREATE TRIGGER insert_Estadio after insert on Estadio
FOR EACH ROW
BEGIN
IF NEW.id_db = 2 THEN
  insert into Estadio_UEFA values(
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
IF NEW.id_db = 2 THEN
  update Estadio_UEFA SET 
  	id_estadio=new.id_estadio,
  	nombre=new.nombre,
  	id_pais=new.id_pais,
    ciudad=new.ciudad,
    id_db=new.id_db
  	where id_estadio=old.id_estadio;
END IF;
END;//

-- -----------------------------------------------------
-- TRIGGERS Director_tecnico from Liga
-- -----------------------------------------------------
CREATE TRIGGER insert_Director_tecnico after insert on Director_tecnico
FOR EACH ROW
BEGIN
IF NEW.id_db = 2 THEN
  insert into Director_tecnico_UEFA values(
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
IF NEW.id_db = 2 THEN
  update Director_tecnico_UEFA SET 
  	id_director_tecnico=new.id_director_tecnico,
  	nombre=new.nombre,
  	fecha_de_nacimiento=new.fecha_de_nacimiento,
    nacionalidad=new.nacionalidad,
    id_db=new.id_db
  	where id_director_tecnico=old.id_director_tecnico;
END IF;
END;//

-- -----------------------------------------------------
-- TRIGGERS Equipo from Liga
-- -----------------------------------------------------
CREATE TRIGGER insert_Equipo after insert on Equipo
FOR EACH ROW
BEGIN
IF NEW.id_db = 2 THEN
  insert into Equipo_UEFA values(
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
IF NEW.id_db = 2 THEN
  update Equipo_UEFA SET 
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
-- TRIGGERS Temporada from Liga
-- -----------------------------------------------------
CREATE TRIGGER insert_Temporada after insert on Temporada
FOR EACH ROW
BEGIN
IF NEW.id_db = 2 THEN
  insert into Temporada_UEFA values(
  	new.id_temporada,
  	new.año,
    new.id_db
  	);
END IF;
END;//

CREATE TRIGGER update_Temporada after update on Temporada
FOR EACH ROW
BEGIN
IF NEW.id_db = 2 THEN
  update Temporada_UEFA SET 
  	id_temporada=new.id_temporada,
  	año=new.año,
    id_db=new.id_db
  	where id_temporada=old.id_temporada;
END IF;
END;//

-- -----------------------------------------------------
-- TRIGGERS Partido from Liga
-- -----------------------------------------------------
CREATE TRIGGER insert_Partido after insert on Partido
FOR EACH ROW
BEGIN
IF NEW.id_db = 2 THEN
  insert into Partido_UEFA values(
  	new.id_partido,
  	new.id_temporada,
  	new.id_local,
  	new.id_visitante,
    new.id_db
  	);
END IF;
END;//

CREATE TRIGGER update_Partido after update on Partido
FOR EACH ROW
BEGIN
IF NEW.id_db = 2 THEN
  update Partido_UEFA SET 
  	id_partido=new.id_partido,
  	id_temporada=new.id_temporada,
  	id_local=new.id_local,
    id_visitante=new.id_visitante,
    id_db=new.id_db
  	where id_partido=old.id_partido;
END IF;
END;//

-- -----------------------------------------------------
-- TRIGGERS Gol from Liga
-- -----------------------------------------------------
CREATE TRIGGER insert_Gol after insert on Gol
FOR EACH ROW
BEGIN
IF NEW.id_db = 2 THEN
  insert into Gol_UEFA values(
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
IF NEW.id_db = 2 THEN
  update Gol_UEFA SET 
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