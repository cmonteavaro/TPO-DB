create table Usuarios (
	idUsuario int,
	nombre varchar(200),
	alias varchar(50),
	contra varchar(100),
	activo int,
	correo varchar(200)
)
go

create table noticias(
	idNoticia int,
	titulo varchar(150),
	idCategoria int,
	autor varchar(100),
	fecha date,
	ubicacion varchar(100)
)
go

create table categorias(
	idCategoria int,
	nombre varchar(100),
	descripcion varchar(200)
)
go

create table comentarios(
	idComenatario int,
	idNoticia int,
	texto varchar(200),
	idUsuario int,
	fecha date
)
go

create table privilegios(
	idUsuario int,
	privilegio varchar(15),
	idCategoria int
)
go

create table votaciones(
	idVotacion int,
	idNoticia int,
	fechaInicio date,
	fechaFin date,
	pregunta varchar(100),
	respUno varchar(100),
	respDos varchar(100),
	respTres varchar(100),
	votosUno int,
	votosDos int,
	votosTres int
)
go