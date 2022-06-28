CREATE TABLE medicos (
	matricula INT,
	nombre VARCHAR(100),
	apellido VARCHAR(100),
	activo INT,
	sexo CHAR,
	CONSTRAINT pk_medicos_matricula PRIMARY KEY (matricula)
)
go

create table especialidades (
	idespecialidad int,
	especialidad varchar(100),
	constraint pk_especialidades primary key (idespecialidad)
)
go
create table espemedi (
	matricula int,
	idespecialidad int,
	constraint fk_espemedi_medicos foreign key (matricula) references medicos,
	constraint fk_espemedi_especialidades foreign key (idespecialidad) references especialidades
)
go

create table estudios (
	idestudio int,
	estuido varchar(100),
	activo int,
	constraint pk_estudios primary key (idestudio)
)
go

create table estuespe (
	idestudio int,
	idespecialidad int,
	constraint pk_estuespe primary key(idestudio, idespecialidad),
	constraint fk_estuespe_estudios foreign key (idestudio) references estudios,
	constraint fk_estuespe_especialidad foreign key (idespecialidad) references especialidades
)
go


create table institutos (
	idinstituto int,
	instituto varchar(100),
	activo int,
	constraint pk_institutos primary key (idinstituto)
)
go

create table precios (
	idestudio int,
	idinstituto int,
	precio float,
	constraint fk_precios_institutos foreign key (idinstituto) references institutos,
	constraint fk_precios_estudios foreign key (idestudio) references estudios,
	constraint pk_precios primary key (idestudio, idinstituto)
)
go

create table ooss (
	sigla varchar(10),
	nombre varchar(100),
	categoria varchar(50)
	constraint pk_ooss primary key (sigla)
)
go

create table planes(
	sigla varchar(10),
	nroplan int,
	nombre varchar(100),
	activo int,
	constraint pk_planes primary key(sigla, nroplan),
	constraint fk_planes_ooss foreign key (sigla) references ooss,
)
go

create table coberturas(
	sigla varchar(10),
	nroplan int,
	idestudio int,
	cobertura float,
	constraint pk_coberturas primary key (sigla, nroplan, idestudio),
	constraint fk_coberturas_estudios foreign key (idestudio) references estudios,
	constraint fk_cobertuas_planes foreign key (sigla, nroplan) references planes
)
go

create table afiliados(
	dni int,
	sigla varchar(10),
	nroplan int,
	nroafiliado int,
	constraint pk_afiliados primary key (dni, sigla),
	constraint fk_afiliados_planes foreign key (sigla, nroplan) references planes
)
go

create table pacientes(
	dni int,
	nombre varchar(50),
	apellido varchar(50),
	sexo char,
	nacimiento date,
	constraint pk_pacientes primary key (dni)
)
go

create table historias(
	dni int,
	idestudio int,
	idinstituto int,
	fecha date,
	matricula int,
	sigla varchar(10),
	pagado int,
	observaciones varchar(500),
	constraint pk_historias primary key (dni, idestudio, idinstituto, fecha),
	constraint fk_historias_medicos foreign key (matricula) references medicos,
	constraint fk_historias_pacientes foreign key (dni) references pacientes,
	constraint fk_historias_afiliados foreign key (dni, sigla) references afiliados,
	constraint fk_historias_precios foreign key (idestudio, idinstituto) references precios
)
go

