create database EventosYa;
use EventosYa;


#Entidades y tablas
create table Usuarios(
	idUsuario int primary key auto_increment ,
    nombreUsu varchar(50) ,
    apellidoUsu varchar(50) ,
    correoUsu varchar(100),
    contraseñaUsu varchar(100) ,
    paisUsu varchar(30),
    ciudadUsu varchar(30),
    generoUsu varchar(10)
)auto_increment = 0;

create table Categoria(
	idCategoria int auto_increment primary key,
    nombreCategoria varchar(20),
    descripcionCategoria varchar(20)
)auto_increment = 300;


create table Evento(
	idEvento int auto_increment primary key,
    nombreEvento varchar(30),
    descripcionEvento varchar(500),
    ubicacionEvento varchar(30),
    imagenEvento longblob,
    fechaInicio datetime ,
    fechaFin datetime,
    idCategoria int,
    Constraint fkIdCategoria foreign key (idCategoria) references Categoria(idCategoria)
)auto_increment = 1000;

create table Asistente(
	idAsistente int primary key auto_increment,
	idUsuario int,
    idEvento int,
    fechaAsistencia datetime  ,
	constraint fkIdUsuario_Asistente foreign key(idUsuario) references Usuarios(idUsuario),
    constraint fkIdEvento_Asistente foreign key(idEvento) references Evento(idEvento)
);


create table Organizador(
	idOrganizador int primary key auto_increment,
	idUsuario int,
    idEvento int,
	constraint fkIdUsuario_Organizador foreign key(idUsuario) references Usuarios(idUsuario),
    constraint fkIdEvento_Organizador foreign key(idEvento) references Evento(idEvento)
)auto_increment = 2000;

CREATE TABLE Comentario (
  idComentario INT PRIMARY KEY AUTO_INCREMENT,
  idEvento INT,
  idAsistente INT,
  Contenido TEXT,
  FechaHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  constraint fkIdEvento_Comentario FOREIGN KEY (idEvento) REFERENCES Evento(idEvento),
  constraint fkIdAsistente_Comentario FOREIGN KEY (idAsistente) REFERENCES Asistente(idAsistente)
)auto_increment=10000;


insert into categoria values (null,"Popular","Evento Popular ");
insert into categoria values (null,"Cultural","Evento Cultural ");
insert into categoria values (null,"Urbano","Evento Urbano ");
insert into categoria values (null,"Privado","Evento Privado ");
