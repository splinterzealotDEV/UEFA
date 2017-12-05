SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=`TRADITIONAL,ALLOW_INVALID_DATES`;
DROP TABLE IF EXISTS Pais_Liga;
create table Pais_Liga(
id_Pais int(11) not null primary key auto_increment,

id_db int(11) not null,
nombre varchar(30)
) ENGINE = FEDERATED CONNECTION = 'mysql://test_2R:db@10.2.0.16:3306/liga/Pais';
DROP TABLE IF EXISTS Temporada_Liga;
create table Temporada_Liga(
id_Temporada int(11) not null primary key auto_increment,
Agno int(11),

id_db int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://test_2R:db@10.2.0.16:3306/liga/Temporada';
DROP TABLE IF EXISTS Liga_Liga;
create table Liga_Liga (
id_Liga int(11) not null primary key,
temporada int(11) not null,
pais int (11) not null,

id_db int(11) not null,
nombre varchar(30) not null
) ENGINE = FEDERATED CONNECTION = 'mysql://test_2R:db@10.2.0.16:3306/liga/Liga';
DROP TABLE IF EXISTS Jugador_Liga;
create table Jugador_Liga (
id_Jugador int(11) not null primary key auto_increment,
Numero int(15) not null,
Nombre varchar(30) not null,
Posicion varchar(30) not null,
Fecha_Nacimiento DATE not null,
Nacionalidad int(11) not null,
Estatura int(10) not null,

id_db int(11) not null,
Efectividad varchar(40)
)ENGINE = FEDERATED CONNECTION = 'mysql://test_2R:db@10.2.0.16:3306/liga/Jugador';
DROP TABLE IF EXISTS Arbitro_Liga;
create table Arbitro_Liga(
id_Arbitro int(11) not null primary key auto_increment,
Nombre varchar(30) not null,
Fecha_Nacimiento DATE not null,
Nacionalidad int(11) not null,

id_db int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://test_2R:db@10.2.0.16:3306/liga/Arbitro';
DROP TABLE IF EXISTS Director_Tecnico_Liga;
create table Director_Tecnico_Liga(
id_DirectorTecnico int(11) not null primary key auto_increment,
Nombre varchar(30) not null,
Fecha_Nacimiento DATE not null,
Nacionalidad int(11) not null,

id_db int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://test_2R:db@10.2.0.16:3306/liga/Director_Tecnico';
DROP TABLE IF EXISTS Estadio_Liga;
create table Estadio_Liga(
id_Estadio int(11) not null primary key auto_increment,
Nombre varchar(30) not null,
id_Pais int(11) not null,
Ciudad varchar(30) not null,

id_db int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://test_2R:db@10.2.0.16:3306/liga/Estadio';
DROP TABLE IF EXISTS Equipo_Liga;
create table Equipo_Liga(
id_Equipo int(11) not null primary key auto_increment,
id_DirectorTecnico int(11) not null, 
Nombre varchar(30) not null,
id_Pais int(11) not null,
id_Estadio int(11) not null,

id_db int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://test_2R:db@10.2.0.16:3306/liga/Equipo';
DROP TABLE IF EXISTS Tarjeta_Liga;
create table Tarjeta_Liga(
id_Tarjeta int(11) not null primary key auto_increment,
Valor varchar(30) not null,

id_db int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://test_2R:db@10.2.0.16:3306/liga/Tarjeta';
DROP TABLE IF EXISTS PartidoEL_Liga;
create table PartidoEL_Liga(
id_Partido int(11) not null primary key auto_increment,
id_Temporada int(11) not null,
id_Local int(11) not null,
id_Visitante int(11) not null,

id_db int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://test_2R:db@10.2.0.16:3306/liga/PartidoEL';
DROP TABLE IF EXISTS Arbitraje_Liga;
create table Arbitraje_Liga(
id_Partido int(11) not null,
id_Arbitro int(11) not null,
id_Abanderado1 int(11) not null,
id_Abanderado2 int(11) not null,
id_CuartoOficial int(11) not null,

id_db int(11) not null,
primary key (id_Partido, id_Arbitro, id_Abanderado1, id_Abanderado2, id_CuartoOficial)
)ENGINE = FEDERATED CONNECTION = 'mysql://test_2R:db@10.2.0.16:3306/liga/Arbitraje';
DROP TABLE IF EXISTS Gol_Liga;
create table Gol_Liga(
id_Gol int(11) not null primary key auto_increment,
id_Partido int(11) not null,
id_Equipo int(11) not null,
minuto int(10) not null,
id_Jugador int(11) not null,
penal bool not null,

id_db int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://test_2R:db@10.2.0.16:3306/liga/Gol';
DROP TABLE IF EXISTS Posiciones_Liga;
create table Posiciones_Liga(
id_Temporada int(11) not null,
id_Equipo int(11) not null,

id_db int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://test_2R:db@10.2.0.16:3306/liga/Posiciones';
DROP TABLE IF EXISTS Falta_Liga;
create table Falta_Liga(
id_Falta int(11) not null,
id_Jugador int(11) not null,
id_Partido int(11) not null,
minuto int(10) null,
id_Tarjeta int(11) not null,

id_db int(11) not null,
primary key(id_Falta, id_Jugador, id_Partido)
)ENGINE = FEDERATED CONNECTION = 'mysql://test_2R:db@10.2.0.16:3306/liga/Falta';


SET FOREIGN_KEY_CHECKS=1; 
