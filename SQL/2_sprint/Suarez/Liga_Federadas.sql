SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=`TRADITIONAL,ALLOW_INVALID_DATES`;

create table Pais_Liga(
id_Pais int(11) not null primary key auto_increment,
id_db int(11) not null,
nombre varchar(30)
) ENGINE = FEDERATED CONNECTION = 'mysql://Admin:Admin@192.168.0.3:3306/Liga_Final/Pais';

create table Temporada_Liga(
id_Temporada int(11) not null primary key auto_increment,
Agno int(11),
id_db int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://Admin:Admin@192.168.0.3:3306/Liga_Final/Temporada';

create table Liga_Liga (
id_Liga int(11) not null primary key,
temporada int(11) not null,
pais int (11) not null,
id_db int(11) not null,
nombre varchar(30) not null
) ENGINE = FEDERATED CONNECTION = 'mysql://Admin:Admin@192.168.0.3:3306/Liga_Final/Liga';

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
)ENGINE = FEDERATED CONNECTION = 'mysql://Admin:Admin@192.168.0.3:3306/Liga_Final/Jugador';

create table Arbitro_Liga(
id_Arbitro int(11) not null primary key auto_increment,
Nombre varchar(30) not null,
Fecha_Nacimiento DATE not null,
Nacionalidad int(11) not null,
id_db int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://Admin:Admin@192.168.0.3:3306/Liga_Final/Arbitro';

create table Director_Tecnico_Liga(
id_DirectorTecnico int(11) not null primary key auto_increment,
Nombre varchar(30) not null,
Fecha_Nacimiento DATE not null,
Nacionalidad int(11) not null,
id_db int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://Admin:Admin@192.168.0.3:3306/Liga_Final/Director_Tecnico';

create table Estadio_Liga(
id_Estadio int(11) not null primary key auto_increment,
Nombre varchar(30) not null,
id_Pais int(11) not null,
Ciudad varchar(30) not null,
id_db int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://Admin:Admin@192.168.0.3:3306/Liga_Final/Estadio';

create table Equipo_Liga(
id_Equipo int(11) not null primary key auto_increment,
id_DirectorTecnico int(11) not null, 
Nombre varchar(30) not null,
id_Pais int(11) not null,
id_Estadio int(11) not null,
id_db int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://Admin:Admin@192.168.0.3:3306/Liga_Final/Equipo';

create table Tarjeta_Liga(
id_Tarjeta int(11) not null primary key auto_increment,
Valor varchar(30) not null,
id_db int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://Admin:Admin@192.168.0.3:3306/Liga_Final/Tarjeta';

create table PartidoEL_Liga(
id_Partido int(11) not null primary key auto_increment,
id_Temporada int(11) not null,
id_Local int(11) not null,
id_Visitante int(11) not null,
id_db int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://Admin:Admin@192.168.0.3:3306/Liga_Final/PartidoEL';

create table Arbitraje_Liga(
id_Partido int(11) not null,
id_Arbitro int(11) not null,
id_Abanderado1 int(11) not null,
id_Abanderado2 int(11) not null,
id_CuartoOficial int(11) not null,
id_db int(11) not null,
primary key (id_Partido, id_Arbitro, id_Abanderado1, id_Abanderado2, id_CuartoOficial)
)ENGINE = FEDERATED CONNECTION = 'mysql://Admin:Admin@192.168.0.3:3306/Liga_Final/Arbitraje';

create table Gol_Liga(
id_Gol int(11) not null primary key auto_increment,
id_Partido int(11) not null,
id_Equipo int(11) not null,
minuto int(10) not null,
id_Jugador int(11) not null,
penal bool not null,
id_db int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://Admin:Admin@192.168.0.3:3306/Liga_Final/Gol';

create table Posiciones_Liga(
id_Temporada int(11) not null,
id_Equipo int(11) not null,
id_db int(11) not null
)ENGINE = FEDERATED CONNECTION = 'mysql://Admin:Admin@192.168.0.3:3306/Liga_Final/Posiciones';

create table Falta_Liga(
id_Falta int(11) not null,
id_Jugador int(11) not null,
id_Partido int(11) not null,
minuto int(10) null,
id_Tarjeta int(11) not null,
id_db int(11) not null,
primary key(id_Falta, id_Jugador, id_Partido)
)ENGINE = FEDERATED CONNECTION = 'mysql://Admin:Admin@192.168.0.3:3306/Liga_Final/Falta';


SET FOREIGN_KEY_CHECKS=1; 
