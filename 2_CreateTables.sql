--CREATE DATABASE Sistema

use Sistema;


CREATE TABLE Pessoa (
	CC INT NOT NULL,
	Nome varCHAR(128) CHECK (Nome like '[a-Z][a-Z]%'),
	Constraint Pk_CC PRIMARY KEY (CC)
);

CREATE TABLE Funcionario (
	Numero_de_funcionario smallint NOT NULL,
	CC_funcionario INT NOT NULL,
	Constraint Pk_num_func PRIMARY KEY (Numero_de_funcionario),
	CONSTRAINT Fk_CC_funcionario FOREIGN KEY (CC_funcionario) REFERENCES Pessoa(CC)
);

CREATE TABLE Posto_Venda (
	N_Balcao smallint UNIQUE NOT NULL,
	Constraint Pk_N_Balcao PRIMARY KEY (N_Balcao)
);

CREATE TABLE Cliente (
	Nif INT NOT NULL,
	Contacto_telefonico INT ,
	Constraint Pk_Nif PRIMARY KEY (Nif)
);

CREATE TABLE Trabalha (
	N_Balcao_fk smallint NOT NULL,
	Num_Funcionario_fk smallint NOT NULL,
	CONSTRAINT Fk_N_Balcao FOREIGN KEY (N_Balcao_fk) REFERENCES Posto_Venda(N_Balcao),
	CONSTRAINT Fk_Num_Funcionario_fk FOREIGN KEY (Num_Funcionario_fk) REFERENCES Funcionario(Numero_de_funcionario)

);

CREATE TABLE Pessoa_Singular (
	CC_Pessoa_Singular INT NOT NULL,
	Nif2 INT NOT NULL,
	CONSTRAINT Fk_CC_Singular FOREIGN KEY (CC_Pessoa_Singular) REFERENCES Pessoa(CC),
	CONSTRAINT Fk_Nif2 FOREIGN KEY (Nif2) REFERENCES Cliente(Nif)
);

CREATE TABLE Empresa (
	NRegisto smallint NOT NULL CHECK( NRegisto<200000),
	Nome varCHAR(128),
	Capital_Social int,
	Nif3 INT NOT NULL,
	Constraint Pk_NRegisto PRIMARY KEY (NRegisto),
	CONSTRAINT Fk_Nif_E FOREIGN KEY (Nif3) REFERENCES Cliente(Nif)
);

CREATE TABLE Itinerario_da_Viagem (
	ID_v smallint NOT NULL , --IDENTITY(1,1)
	Local_Partida varchar(64) NOT NULL CHECK (Local_Partida like '[a-Z][a-Z]%'),
	Local_Destino varchar(64) NOT NULL CHECK (Local_Destino like '[a-Z][a-Z]%'),
	Hora_partida_origem DATE,
	Constraint Pk_ID_v Primary key(ID_v)
);

CREATE TABLE Transporte (
	ID_t smallint NOT NULL , --IDENTITY(1,1)
	Bilhete smallint NOT NULL,
	Companhia varchar(64) CHECK  (Companhia like '[a-Z][a-Z]%'),
	Constraint Pk_ID PRIMARY KEY (ID_t)
);

CREATE TABLE Tipo_Transporte (
	ID_Tipo_Transporte smallint NOT NULL,
	ID_transporte_fk smallint NOT NULL,
	Designacao varchar(64) CHECK  (Designacao like '[a-Z][a-Z]%') ,
	Constraint Pk_ID_Tipo_Transporte PRIMARY KEY (ID_Tipo_Transporte),
	CONSTRAINT Fk_ID_transporte FOREIGN KEY (ID_transporte_fk) REFERENCES Transporte(ID_t)
);

CREATE TABLE Etapas (
	N_Etapa tinyint NOT NULL,
	Preco decimal(10, 2) NOT NULL,
	Origem varchar(64) NOT NULL,
	Destino varchar(64) NOT NULL,
	Hora_de_Partida DATE NOT NULL,
	ID_transporte_fk1 smallint NOT NULL,
	ID_itinerario_fk1 smallint NOT NULL,
	CONSTRAINT Pk_N_Etapa PRIMARY KEY (N_Etapa,ID_itinerario_fk1),
	CONSTRAINT FK_ID_Itinerario FOREIGN KEY (ID_itinerario_fk1) REFERENCES Itinerario_da_Viagem(ID_v),
	CONSTRAINT FK_ID_transporte_1 FOREIGN KEY (ID_transporte_fk1) REFERENCES Transporte(ID_t)
);

CREATE TABLE Reserva (
	N_Reserva int NOT NULL IDENTITY(1,1),
	Posto_venda_fk smallint NOT NULL,
	Nif_Cliente_fk INT NOT NULL,
	Itinerario_fk Smallint NOT NULL,
	Constraint Pk_N_Reserva PRIMARY KEY (N_Reserva),
	CONSTRAINT Fk_Posto_venda FOREIGN KEY (Posto_venda_fk) REFERENCES Posto_Venda(N_Balcao),
	CONSTRAINT Fk_Nif_Cliente FOREIGN KEY (Nif_Cliente_fk) REFERENCES Cliente(Nif),
	CONSTRAINT Fk_Local FOREIGN KEY (Itinerario_fk) REFERENCES Itinerario_da_Viagem(ID_v)
);

CREATE TABLE Estadia (
	ID_Estadia smallint NOT NULL IDENTITY(1,1),
	Morada varchar(128),
	Pais varchar(32) CHECK (Pais like '[a-Z][a-Z]%'),
	Custo float,
	Duracao smallint,
	N_Reserva_fk int NOT NULL,
	Constraint Pk_ID_Estadia PRIMARY KEY (ID_Estadia),
	CONSTRAINT fk_N_reserva2 FOREIGN KEY(N_Reserva_fk) REFERENCES Reserva(N_Reserva)
);


CREATE TABLE Recibo (
	Num_Recibo int NOT NULL IDENTITY(1,1),
	Nif_Recibo INT,
	Valor float,
	Data DATE NOT NULL DEFAULT GETDATE(),
	N_Reserva_fk int,
	Constraint Pk_Num_Recibo PRIMARY KEY (Num_Recibo),
	CONSTRAINT fk_N_Reserva FOREIGN KEY(N_Reserva_fk) REFERENCES Reserva(N_Reserva)
);

--ALTER TABLE Recibo
	--ADD CONSTRAINT fk_N_Reserva FOREIGN KEY(N_Reserva_fk) REFERENCES Reserva(N_Reserva);

--ALTER TABLE Estadia
	--ADD CONSTRAINT fk_N_reserva2 FOREIGN KEY(N_Reserva_fk) REFERENCES Reserva(N_Reserva);
