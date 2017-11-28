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
-- TRIGGERS Tarjeta from Liga
-- -----------------------------------------------------
CREATE TRIGGER insert_Tarjeta after insert on Tarjeta
FOR EACH ROW
BEGIN
IF NEW.id_db = 2 THEN
  insert into Tarjeta_UEFA values(
  	new.id_tarjeta,
  	new.valor,
  	new.id_db
  	);
END IF;
END;//

CREATE TRIGGER update_Tarjeta after update on Tarjeta
FOR EACH ROW
BEGIN
IF NEW.id_db = 2 THEN
  update Tarjeta_UEFA SET 
  	id_tarjeta=new.id_tarjeta,
  	valor=new.valor,
  	id_db=new.id_db
  	where id_tarjeta=old.id_tarjeta;
END IF;
END;//
