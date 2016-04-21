CREATE DATABASE Sistema

use Sistema;


CREATE TABLE Pessoa (
	CC INT(9) NOT NULL ,
	Nome varCHAR(128) CHECK (Nome like '([a-z]|[A-Z])+'),
	Constraint Pk_CC PRIMARY KEY (CC)
);

CREATE TABLE Funcionario (
	Numero_de_funcionario smallint NOT NULL,
	CC_funcionario INT(9) NOT NULL,
	Constraint Pk_num_func PRIMARY KEY (Numero_de_funcionario),
	CONSTRAINT Fk_CC_funcionario FOREIGN KEY (CC_funcionario) REFERENCES Pessoa(CC)
);

CREATE TABLE Posto_Venda (
	N_Balcao smallint UNIQUE NOT NULL,
	Constraint Pk_N_Balcao PRIMARY KEY (N_Balcao)
);

CREATE TABLE Cliente (
	Nif INT(9) NOT NULL,
	Contacto_telefonico INT(9) ,
	Constraint Pk_Nif PRIMARY KEY (Nif)
);

CREATE TABLE Trabalha (
	N_Balcao_fk smallint NOT NULL,
	Num_Funcionario_fk smallint NOT NULL,
	CONSTRAINT Fk_N_Balcao FOREIGN KEY (N_Balcao_fk) REFERENCES Posto_Venda(N_Balcao),
	CONSTRAINT Fk_Num_Funcionario_fk FOREIGN KEY (Num_Funcionario_fk) REFERENCES Funcionario(Numero_de_funcionario)

);

CREATE TABLE Pessoa_Singular (
	CC_Pessoa_Singular INT(9) NOT NULL,
	Nif2 INT(9) NOT NULL,
	CONSTRAINT Fk_CC_Singular FOREIGN KEY (CC_Pessoa_Singular) REFERENCES Pessoa(CC),
	CONSTRAINT Fk_Nif2 FOREIGN KEY (Nif2) REFERENCES Cliente(Nif)
);

CREATE TABLE Empresa (
	NRegisto smallint NOT NULL CHECK( NRegisto<200000),
	Nome varCHAR(128),
	Capital_Social int,
	Nif3 INT(9) NOT NULL,
	Constraint Pk_NRegisto PRIMARY KEY (NRegisto),
	CONSTRAINT Fk_Nif_E FOREIGN KEY (Nif3) REFERENCES Cliente(Nif)
);



CREATE TABLE Recibo (
	Num_Recibo int NOT NULL CHECK (Num_Recibo like '([0-9]+)'),
	Nif_Recibo INT(9),
	Valor float,
	Data Date,
	N_Reserva_fk int,
	Constraint Pk_Num_Recibo PRIMARY KEY (Num_Recibo),

);

CREATE TABLE Itinerario_da_Viagem (
	Local_Partida varchar(64) NOT NULL CHECK (Local_Partida like '([a-z]|[A-Z])+'),
	Local_Destino varchar(64) NOT NULL CHECK (Local_Destino like '([a-z]|[A-Z])+'),
	Hora_partida_origem Timestamp,
	N_etapas smallint CHECK (N_etapas<1000),
	Primary key(Local_Partida, Local_Destino)
);

CREATE TABLE Etapas (
	N_Etapa tinyint NOT NULL,
	Local_Partida_fk varchar(64) NOT NULL,
	Local_Destino_fk varchar(64) NOT NULL,
	Origem varchar(64) NOT NULL,
	Destino varchar(64) NOT NULL,
	Hora_de_Partida timestamp NOT NULL,
	ID_Transporte_fk smallint NOT NULL, -- alterar

);

CREATE TABLE Transporte (
	ID smallint NOT NULL,
	Bilhete smallint NOT NULL,
	Companhia varchar(64) CHECK  (Companhia like '([a-z]|[A-Z])+'),
	Constraint Pk_ID PRIMARY KEY (ID)
);

CREATE TABLE Tipo_Transporte (
	ID_Tipo_Transporte smallint NOT NULL,
	ID_transporte_fk smallint NOT NULL,
	Designacao varchar(64) CHECK  (Designacao like '([a-z]|[A-Z])+') ,
	Constraint Pk_ID_Tipo_Transporte PRIMARY KEY (ID_Tipo_Transporte),
	CONSTRAINT Fk_ID_transporte FOREIGN KEY (ID_transporte_fk) REFERENCES Transporte(ID)

);

CREATE TABLE Estadia (
	ID_Estadia smallint NOT NULL,
	Morada varchar(128),
	Pais varchar(32) CHECK (Pais like '([a-z]|[A-Z])+'),
	Custo float,
	Duracao smallint,
	N_Reserva_fk int NOT NULL,
	Constraint Pk_ID_Estadia PRIMARY KEY (ID_Estadia)
);

CREATE TABLE Reserva (
	N_Reserva int NOT NULL,
	Posto_venda_fk smallint NOT NULL,
	Nif_Cliente_fk INT(9) NOT NULL,
	Local_partida_fk varchar(64) NOT NULL,
	Local_destino_fk varchar(64) NOT NULL,
	Custo float,
	Constraint Pk_N_Reserva PRIMARY KEY (N_Reserva),
	CONSTRAINT Fk_Posto_venda FOREIGN KEY (Posto_venda_fk) REFERENCES Posto_Venda(N_Balcao),
	CONSTRAINT Fk_Nif_Cliente FOREIGN KEY (Nif_Cliente_fk) REFERENCES Cliente(Nif),
	CONSTRAINT Fk_Local FOREIGN KEY (Local_partida_fk, Local_destino_fk) REFERENCES Itinerario_da_Viagem(Local_Partida, Local_Destino),

);

ALTER TABLE Recibo
	ADD CONSTRAINT fk_N_Reserva FOREIGN KEY(N_Reserva_fk) REFERENCES Reserva(N_Reserva);

ALTER TABLE Etapas
	ADD CONSTRAINT fk_ID_Transporte2 FOREIGN KEY(ID_Transporte_fk) REFERENCES Transporte(ID),
		CONSTRAINT fk_local_pd FOREIGN KEY(Local_Partida_fk, Local_Destino_fk) REFERENCES Itinerario_da_Viagem(Local_Partida, Local_Destino);


ALTER TABLE Estadia
	ADD CONSTRAINT fk_N_reserva2 FOREIGN KEY(N_Reserva_fk) REFERENCES Reserva(N_Reserva);
