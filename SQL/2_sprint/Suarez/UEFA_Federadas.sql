SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=`TRADITIONAL,ALLOW_INVALID_DATES`;
DROP TABLE IF EXISTS Pais_UEFA;
create table Pais_UEFA(
id_Pais int(11) not null primary key auto_increment,

id_db int(11) not null,
nombre varchar(30)
) ENGINE = FEDERATED CONNECTION = 'mysql://test_1R:db@10.2.0.15:3306/uefa/Pais';
DROP TABLE IF EXISTS Temporada_UEFA;
create table Temporada_UEFA(
id_Temporada int(11) not null primary key auto_increment,
Agno int(11),

id_db int(11) not null,
id_Liga int(11) not null
) ENGINE = FEDERATED CONNECTION = 'mysql://test_1R:db@10.2.0.15:3306/uefa/Temporada';
DROP TABLE IF EXISTS Liga_UEFA;
create table Liga_UEFA (
id_Liga int(11) not null primary key,
temporada int(11) not null,
pais int (11) not null,

id_db int(11) not null,
nombre varchar(30) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://test_1R:db@10.2.0.15:3306/uefa/Liga';
DROP TABLE IF EXISTS Jugador_UEFA;
create table Jugador_UEFA (
id_Jugador int(11) not null primary key auto_increment,
Numero int(15) not null,
Nombre varchar(30) not null,
Posicion varchar(30) not null,
Fecha_Nacimiento DATE not null,
Nacionalidad int(11) not null,
Estatura int(10) not null,

id_db int(11) not null,
Efectividad varchar(40),
Liga int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://test_1R:db@10.2.0.15:3306/uefa/Jugador';
DROP TABLE IF EXISTS Arbitro_UEFA;
create table Arbitro_UEFA(
id_Arbitro int(11) not null primary key auto_increment,
Nombre varchar(30) not null,
Fecha_Nacimiento DATE not null,
Nacionalidad int(11) not null,

id_db int(11) not null,
Liga int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://test_1R:db@10.2.0.15:3306/uefa/Arbitro';
DROP TABLE IF EXISTS Director_Tecnico_UEFA;
create table Director_Tecnico_UEFA(
id_DirectorTecnico int(11) not null primary key auto_increment,
Nombre varchar(30) not null,
Fecha_Nacimiento DATE not null,
Nacionalidad int(11) not null,

id_db int(11) not null,
Liga int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://test_1R:db@10.2.0.15:3306/uefa/Director_Tecnico';
DROP TABLE IF EXISTS Estadio_UEFA;
create table Estadio_UEFA(
id_Estadio int(11) not null primary key auto_increment,
Nombre varchar(30) not null,
id_Pais int(11) not null,
Ciudad varchar(30) not null,

id_db int(11) not null,
Liga int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://test_1R:db@10.2.0.15:3306/uefa/Estadio';
DROP TABLE IF EXISTS Equipo_UEFA;
create table Equipo_UEFA(
id_Equipo int(11) not null primary key auto_increment,
id_DirectorTecnico int(11) not null, 
Nombre varchar(30) not null,
id_Pais int(11) not null,
id_Estadio int(11) not null,

id_db int(11) not null,
Liga int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://test_1R:db@10.2.0.15:3306/uefa/Equipo';
DROP TABLE IF EXISTS Tarjeta_UEFA;
create table Tarjeta_UEFA(
id_Tarjeta int(11) not null primary key auto_increment,
Valor varchar(30) not null,

id_db int(11) not null,
Liga int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://test_1R:db@10.2.0.15:3306/uefa/Tarjeta';
DROP TABLE IF EXISTS PartidoEL_UEFA;
create table PartidoEL_UEFA(
id_Partido int(11) not null primary key auto_increment,
id_Temporada int(11) not null,
id_Local int(11) not null,
id_Visitante int(11) not null,

id_db int(11) not null,
id_Liga int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://test_1R:db@10.2.0.15:3306/uefa/PartidoEL';
DROP TABLE IF EXISTS Arbitraje_UEFA;
create table Arbitraje_UEFA(
id_Partido int(11) not null,
id_Arbitro int(11) not null,
id_Abanderado1 int(11) not null,
id_Abanderado2 int(11) not null,
id_CuartoOficial int(11) not null,

id_db int(11) not null,
Liga int(11) not null,
primary key (id_Partido, id_Arbitro, id_Abanderado1, id_Abanderado2, id_CuartoOficial)
)ENGINE = FEDERATED CONNECTION = 'mysql://test_1R:db@10.2.0.15:3306/uefa/Arbitraje';
DROP TABLE IF EXISTS Gol_UEFA;
create table Gol_UEFA(
id_Gol int(11) not null primary key auto_increment,
id_Partido int(11) not null,
id_Equipo int(11) not null,
minuto int(10) not null,
id_Jugador int(11) not null,
penal bool not null,

id_db int(11) not null,
Liga int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://test_1R:db@10.2.0.15:3306/uefa/Gol';
DROP TABLE IF EXISTS Posiciones_UEFA;
create table Posiciones_UEFA(
id_Temporada int(11) not null,
id_Equipo int(11) not null,
id_Liga int(11) not null,

id_db int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://test_1R:db@10.2.0.15:3306/uefa/Posiciones';

DROP TABLE IF EXISTS Falta_UEFA;
create table Falta_UEFA(
id_Falta int(11) not null,
id_Jugador int(11) not null,
id_Partido int(11) not null,
minuto int(10) null,
id_Tarjeta int(11) not null,

id_db int(11) not null,
id_Liga int(11) not null,
primary key(id_Falta, id_Jugador, id_Partido)
)ENGINE = FEDERATED CONNECTION = 'mysql://test_1R:db@10.2.0.15:3306/uefa/Falta';

SET FOREIGN_KEY_CHECKS=1; 
