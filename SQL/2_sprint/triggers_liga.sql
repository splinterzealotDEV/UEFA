
SET ID_DB = ID_DB;
-- -----------------------------------------------------
-- TRIGGERS Pais from Liga
-- -----------------------------------------------------
CREATE TRIGGER insert_Pais after insert on Pais
FOR EACH ROW
BEGIN
IF NEW.id_db = ID_DB THEN
  insert into Pais_UEFA values(new.id_pais,new.nombre,new.id_db);
END IF;
END;//

CREATE TRIGGER update_Pais after update on Pais
FOR EACH ROW
BEGIN
IF NEW.id_db = ID_DB THEN
  update Pais_UEFA SET id_pais=new.id_pais,nombre=new.nombre,id_db=new.id_db where id_pais=old.id_pais;
END IF;
END;//

CREATE TRIGGER delete_Pais after delete on Pais
FOR EACH ROW
BEGIN
  insert into del_Liga (id_record, id_tabla, id_db) values(old.id_pais, 1, ID_DB);
END IF;
END;//

-- -----------------------------------------------------
-- TRIGGERS Jugador from Liga
-- -----------------------------------------------------
CREATE TRIGGER insert_Jugador after insert on Jugador
FOR EACH ROW
BEGIN
IF NEW.id_db = ID_DB THEN
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
IF NEW.id_db = ID_DB THEN
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

CREATE TRIGGER delete_Jugador after delete on Jugador
FOR EACH ROW
BEGIN
  insert into del_Liga (id_record, id_tabla, id_db) values(old.id_jugador, 2, ID_DB);
END IF;
END;//
-- -----------------------------------------------------
-- TRIGGERS Arbitro from Liga
-- -----------------------------------------------------
CREATE TRIGGER insert_Arbitro after insert on Arbitro
FOR EACH ROW
BEGIN
IF NEW.id_db = ID_DB THEN
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
IF NEW.id_db = ID_DB THEN
  update Arbitro_UEFA SET 
  	id_arbitro=new.id_arbitro,
  	nombre=new.nombre,
  	fecha_de_nacimiento=new.fecha_de_nacimiento,
  	nacionalidad=new.nacionalidad,
  	id_db=new.id_db
  	where id_arbitro=old.id_arbitro;
END IF;
END;//

CREATE TRIGGER delete_Arbitro after delete on Arbitro
FOR EACH ROW
BEGIN
  insert into del_Liga (id_record, id_tabla, id_db) values(old.id_arbitro, 3, ID_DB);
END IF;
END;//
-- -----------------------------------------------------
-- TRIGGERS Arbitraje from Liga
-- -----------------------------------------------------
CREATE TRIGGER insert_Arbitraje after insert on Arbitraje
FOR EACH ROW
BEGIN
IF NEW.id_db = ID_DB THEN
  insert into Arbitraje_UEFA values(
  	new.id_partido,
  	new.id_arbitro,
  	new.id_abanderado1,
  	new.id_abanderadoID_DB,
  	new.id_cuartooficial,
  	new.id_db
  	);
END IF;
END;//

CREATE TRIGGER update_Arbitraje after update on Arbitraje
FOR EACH ROW
BEGIN
IF NEW.id_db = ID_DB THEN
  update Arbitraje_UEFA SET 
  	id_partido=new.id_partido,
  	id_arbitro=new.id_arbitro,
  	id_abanderado1=new.id_abanderado1,
  	id_abanderadoID_DB=new.id_abanderadoID_DB,
  	id_cuartooficial=new.id_cuartooficial,
  	id_db=new.id_db
  	where id_partido=old.id_partido;
END IF;
END;//

CREATE TRIGGER delete_Arbitraje after delete on Arbitraje
FOR EACH ROW
BEGIN
  insert into del_Liga (id_record, id_tabla, id_db) values(old.id_partido, 4, ID_DB);
END IF;
END;//
-- -----------------------------------------------------
-- TRIGGERS Falta from Liga
-- -----------------------------------------------------
CREATE TRIGGER insert_Falta after insert on Falta
FOR EACH ROW
BEGIN
IF NEW.id_db = ID_DB THEN
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
IF NEW.id_db = ID_DB THEN
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

CREATE TRIGGER delete_Falta after delete on Falta
FOR EACH ROW
BEGIN
  insert into del_Liga (id_record, id_tabla, id_db) values(old.id_falta, 5, ID_DB);
END IF;
END;//
-- -----------------------------------------------------
-- TRIGGERS Estadio from Liga
-- -----------------------------------------------------
CREATE TRIGGER insert_Estadio after insert on Estadio
FOR EACH ROW
BEGIN
IF NEW.id_db = ID_DB THEN
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
IF NEW.id_db = ID_DB THEN
  update Estadio_UEFA SET 
  	id_estadio=new.id_estadio,
  	nombre=new.nombre,
  	id_pais=new.id_pais,
    ciudad=new.ciudad,
    id_db=new.id_db
  	where id_estadio=old.id_estadio;
END IF;
END;//

CREATE TRIGGER delete_Estadio after delete on Estadio
FOR EACH ROW
BEGIN
  insert into del_Liga (id_record, id_tabla, id_db) values(old.id_estadio, 6, ID_DB);
END IF;
END;//
-- -----------------------------------------------------
-- TRIGGERS Director_tecnico from Liga
-- -----------------------------------------------------
CREATE TRIGGER insert_Director_tecnico after insert on Director_tecnico
FOR EACH ROW
BEGIN
IF NEW.id_db = ID_DB THEN
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
IF NEW.id_db = ID_DB THEN
  update Director_tecnico_UEFA SET 
  	id_director_tecnico=new.id_director_tecnico,
  	nombre=new.nombre,
  	fecha_de_nacimiento=new.fecha_de_nacimiento,
    nacionalidad=new.nacionalidad,
    id_db=new.id_db
  	where id_director_tecnico=old.id_director_tecnico;
END IF;
END;//

CREATE TRIGGER delete_Director_tecnico after delete on Director_tecnico
FOR EACH ROW
BEGIN
  insert into del_Liga (id_record, id_tabla, id_db) values(old.id_director_tecnico, 7, ID_DB);
END IF;
END;//
-- -----------------------------------------------------
-- TRIGGERS Equipo from Liga
-- -----------------------------------------------------
CREATE TRIGGER insert_Equipo after insert on Equipo
FOR EACH ROW
BEGIN
IF NEW.id_db = ID_DB THEN
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
IF NEW.id_db = ID_DB THEN
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

CREATE TRIGGER delete_Equipo after delete on Equipo
FOR EACH ROW
BEGIN
  insert into del_Liga (id_record, id_tabla, id_db) values(old.id_equipo, 8, ID_DB);
END IF;
END;//

-- -----------------------------------------------------
-- TRIGGERS Temporada from Liga
-- -----------------------------------------------------
CREATE TRIGGER insert_Temporada after insert on Temporada
FOR EACH ROW
BEGIN
IF NEW.id_db = ID_DB THEN
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
IF NEW.id_db = ID_DB THEN
  update Temporada_UEFA SET 
  	id_temporada=new.id_temporada,
  	año=new.año,
    id_db=new.id_db
  	where id_temporada=old.id_temporada;
END IF;
END;//

CREATE TRIGGER delete_Temporada after delete on Temporada
FOR EACH ROW
BEGIN
  insert into del_Liga (id_record, id_tabla, id_db) values(old.id_temporada, 9, ID_DB);
END IF;
END;//
-- -----------------------------------------------------
-- TRIGGERS Partido from Liga
-- -----------------------------------------------------
CREATE TRIGGER insert_Partido after insert on Partido
FOR EACH ROW
BEGIN
IF NEW.id_db = ID_DB THEN
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
IF NEW.id_db = ID_DB THEN
  update Partido_UEFA SET 
  	id_partido=new.id_partido,
  	id_temporada=new.id_temporada,
  	id_local=new.id_local,
    id_visitante=new.id_visitante,
    id_db=new.id_db
  	where id_partido=old.id_partido;
END IF;
END;//

CREATE TRIGGER delete_Partido after delete on Partido
FOR EACH ROW
BEGIN
  insert into del_Liga (id_record, id_tabla, id_db) values(old.id_partido, 10, ID_DB);
END IF;
END;//

-- -----------------------------------------------------
-- TRIGGERS Gol from Liga
-- -----------------------------------------------------
CREATE TRIGGER insert_Gol after insert on Gol
FOR EACH ROW
BEGIN
IF NEW.id_db = ID_DB THEN
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
IF NEW.id_db = ID_DB THEN
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

CREATE TRIGGER delete_Gol after delete on Gol
FOR EACH ROW
BEGIN
  insert into del_Liga (id_record, id_tabla, id_db) values(old.id_gol, 11, ID_DB);
END IF;
END;//
