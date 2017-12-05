SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=`TRADITIONAL,ALLOW_INVALID_DATES`;

create table Pais(
id_Pais int(11) not null primary key auto_increment,
id_db int(11) not null,
nombre varchar(30)
);

create table Temporada(
id_Temporada int(11) not null primary key auto_increment,
Agno int(11),
id_db int(11) not null,
);

create table Liga (
id_Liga int(11) not null primary key,
temporada int(11) not null,
pais int (11) not null,
id_db int(11) not null,
nombre varchar(30) not null,
foreign key (temporada) references Temporada(id_Temporada),
foreign key (pais) references Pais(id_Pais)
);

create table Jugador (
id_Jugador int(11) not null primary key auto_increment,
Numero int(15) not null,
Nombre varchar(30) not null,
Posicion varchar(30) not null,
Fecha_Nacimiento DATE not null,
Nacionalidad int(11) not null,
Estatura int(10) not null,
id_db int(11) not null,
Efectividad varchar(40),
Foreign key (Nacionalidad) references Pais(id_Pais)
);

create table Arbitro(
id_Arbitro int(11) not null primary key auto_increment,
Nombre varchar(30) not null,
Fecha_Nacimiento DATE not null,
Nacionalidad int(11) not null,
id_db int(11) not null,
foreign key(Nacionalidad) references Pais(id_Pais)
);

create table Director_Tecnico(
id_DirectorTecnico int(11) not null primary key auto_increment,
Nombre varchar(30) not null,
Fecha_Nacimiento DATE not null,
Nacionalidad int(11) not null,
id_db int(11) not null,
foreign key (Nacionalidad) references Pais(id_Pais)
);

create table Estadio(
id_Estadio int(11) not null primary key auto_increment,
Nombre varchar(30) not null,
id_Pais int(11) not null,
Ciudad varchar(30) not null,
id_db int(11) not null,
foreign key (id_Pais) references Pais(id_Pais)
);

create table Equipo(
id_Equipo int(11) not null primary key auto_increment,
id_DirectorTecnico int(11) not null, 
Nombre varchar(30) not null,
id_Pais int(11) not null,
id_Estadio int(11) not null,
id_db int(11) not null,
foreign key (id_DirectorTecnico) references Director_Tecnico(id_DirectorTecnico),
foreign key (id_Pais) references Pais(id_Pais),
foreign key (id_Estadio) references Estadio(id_Estadio)
);

create table Tarjeta(
id_Tarjeta int(11) not null primary key auto_increment,
Valor varchar(30) not null,
id_db int(11) not null
);

create table PartidoEL(
id_Partido int(11) not null primary key auto_increment,
id_Temporada int(11) not null,
id_Local int(11) not null,
id_Visitante int(11) not null,
id_db int(11) not null,
foreign key(id_Temporada) references Temporada(id_Temporada),
foreign key (id_Local) references Equipo(id_Equipo),
foreign key (id_Visitante) references Equipo(id_Equipo)
);

create table Arbitraje(
id_Partido int(11) not null,
id_Arbitro int(11) not null,
id_Abanderado1 int(11) not null,
id_Abanderado2 int(11) not null,
id_CuartoOficial int(11) not null,
id_db int(11) not null,
primary key (id_Partido, id_Arbitro, id_Abanderado1, id_Abanderado2, id_CuartoOficial),
foreign key (id_Partido) references PartidoEL(id_Partido)
);

create table Gol(
id_Gol int(11) not null primary key auto_increment,
id_Partido int(11) not null,
id_Equipo int(11) not null,
minuto int(10) not null,
id_Jugador int(11) not null,
penal bool not null,
id_db int(11) not null,
foreign key (id_Partido) references PartidoEL(id_Partido),
foreign key (id_Equipo) references Equipo(id_Equipo),
foreign key (id_Jugador) references Jugador(id_Jugador)
);

create table Posiciones(
id_Temporada int(11) not null,
id_Equipo int(11) not null,
id_db int(11) not null,
foreign key (id_Equipo) references Equipo(id_Equipo),
foreign key(id_Temporada) references Temporada(id_Temporada)
);

create table Falta(
id_Falta int(11) not null,
id_Jugador int(11) not null,
id_Partido int(11) not null,
minuto int(10) null,
id_Tarjeta int(11) not null,
id_db int(11) not null,
primary key(id_Falta, id_Jugador, id_Partido),
foreign key (id_Partido) references PartidoEL(id_Partido),
foreign key (id_Jugador) references Jugador(id_Jugador),
foreign key (id_Tarjeta) references Tarjeta(id_Tarjeta)
);

SET FOREIGN_KEY_CHECKS=1; 
