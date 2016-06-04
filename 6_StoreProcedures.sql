use Sistema;


--------------------INSERTS ---------

GO
DROP PROC sp_insertPessoa;
GO
CREATE PROC sp_insertPessoa 
	@cc int, 
	@nome varchar(40)
WITH EXECUTE AS OWNER AS 
BEGIN 
	INSERT INTO Pessoa(CC,Nome) VALUES (@cc, @nome);
END

--Select * FROM Pessoa WHERE CC=12412;

GO 
DROP PROC sp_insertFuncionario; 
GO
CREATE PROC sp_insertFuncionario
	@numfunc smallint,
	@cc	int
WITH EXECUTE AS OWNER AS 

BEGIN
	IF NOT EXISTS(SELECT CC FROM Pessoa WHERE CC= @cc)
		RAISERROR('Não existe ninguém com o CC especificado',16,1)
	ELSE
		INSERT INTO Funcionario(Numero_de_funcionario,CC_funcionario) 
		VALUES (@numfunc,@cc);
END

--EXECUTE sp_insertFuncionario 1231,12346
--EXECUTE sp_insertFuncionario 1525,5153 --error


GO 
DROP PROCEDURE sp_insertPosto_Venda
GO

CREATE PROCEDURE sp_insertPosto_Venda

	@Nbalcao smallint
WITH EXECUTE AS OWNER AS
BEGIN 
	
	INSERT INTO Posto_Venda(N_Balcao) VALUES (@Nbalcao);
END

--EXECUTE sp_insertPosto_Venda 7;


GO
DROP PROCEDURE sp_insertCliente;
GO
CREATE PROCEDURE sp_insertCliente
	@Nif int,
	@Contato_telefonico int
WITH EXECUTE AS OWNER AS
BEGIN
	INSERT INTO Cliente(Nif,Contacto_telefonico) VALUES(@Nif,@Contato_telefonico);
END

--EXECUTE sp_insertCliente 185848846,961515352;


GO 
DROP PROC sp_insertTrabalha
GO
CREATE PROCEDURE sp_insertTrabalha
	@Nbalcao smallint,
	@Numfuncionario int
WITH EXECUTE AS OWNER AS 
BEGIN
	IF NOT EXISTS(SELECT N_Balcao FROM Posto_Venda WHERE N_Balcao=@Nbalcao)
		RAISERROR('O Numero do Balcao nao existe', 16,1);
	IF NOT EXISTS(SELECT Numero_de_funcionario FROM Funcionario WHERE Numero_de_funcionario=@Numfuncionario )
		RAISERROR('O Numerro de funcionario nao existe',16,1);
	ELSE
		INSERT INTO Trabalha(N_Balcao_fk,Num_Funcionario_fk) VALUES (@Nbalcao,@Numfuncionario);
END

--EXECUTE sp_insertTrabalha 9,16;

--SELECT *  FROM Trabalha;


GO 
DROP PROCEDURE sp_insertPessoaSingular
GO
CREATE PROCEDURE sp_insertPessoaSingular
	@CC_fk int,
	@Nif_fk int
WITH EXECUTE AS OWNER AS
BEGIN
	IF NOT EXISTS(SELECT CC FROM Pessoa WHERE CC=@CC_fk)
		RAISERROR('O Cidadão nao existe', 16,1);
	IF NOT EXISTS(SELECT Nif FROM Cliente WHERE Nif=@Nif_fk)
		RAISERROR('O Cliente em questão não existe',16,1);
	ELSE
		INSERT INTO Pessoa_Singular(CC_Pessoa_Singular,Nif2) VALUES (@CC_fk,@Nif_fk)
END

--EXECUTE sp_insertPessoaSingular 6,122312


GO 
DROP PROCEDURE sp_insertEmpresa
GO
CREATE PROCEDURE sp_insertEmpresa
	@NRegisto int,
	@Nome varchar(40),
	@CapitalSocial int,
	@Nif int
WITH EXECUTE AS OWNER AS
BEGIN
	IF NOT EXISTS(SELECT Nif FROM Cliente WHERE Nif=@Nif)
		RAISERROR('O Cliente em questão não existe',16,1);
	ELSE
		INSERT INTO Empresa(NRegisto,Nome,Capital_Social,Nif3)
		 VALUES (@NRegisto,@Nome,@CapitalSocial,@Nif)
END

--EXECUTE sp_insertEmpresa 15151, 'Cenas',551,185848846

GO 
DROP PROCEDURE sp_insertItinerario_de_Viagem
GO
CREATE PROCEDURE sp_insertItinerario_de_Viagem 
	@Id_v smallint,
	@Partida varchar(50),
	@Destino varchar(50),
	@Date DATE

WITH EXECUTE AS OWNER AS
BEGIN
	INSERT INTO Itinerario_da_Viagem(ID_v,Local_Partida,Local_Destino,Hora_partida_origem) 
	VALUES(@Id_v, @Partida,@Destino,@Date)

END

--EXECUTE sp_insertItinerario_de_Viagem 1223,'Fracas','Madrid','2009-02-05'


GO 
DROP PROCEDURE sp_insertTransporte
GO
CREATE PROCEDURE sp_insertTransporte
	@Id_t smallint,
	@Preco smallint,
	@Companhia varchar(50)

WITH EXECUTE AS OWNER AS
BEGIN
	INSERT INTO Itinerario_da_Viagem(ID_v,Local_Partida,Local_Destino,Hora_partida_origem) 
	VALUES(@Id_v, @Partida,@Destino,@Date)

END

--EXECUTE sp_insertItinerario_de_Viagem 1223,'Fracas','Madrid','2009-02-05'

GO 
DROP PROCEDURE sp_insertTipotrans
GO
CREATE PROCEDURE sp_insertTipotrans
	@Id_tipo smallint,
	@Id_trans smallint,
	@Designacao varchar(40)
WITH EXECUTE AS OWNER AS
BEGIN
	IF NOT EXISTS(SELECT ID_t FROM Transporte WHERE ID_t=@Id_tipo)
		RAISERROR('O Transporte em questão não existe',16,1);
	ELSE
		INSERT INTO Tipo_Transporte(ID_Tipo_Transporte,ID_transporte_fk,Designacao)
		 VALUES (@Id_tipo,@Id_trans,@Designacao)
END

--EXECUTE sp_insertTipotrans 4,4,'ASDASD0'

GO 
DROP PROCEDURE sp_insertEtapas
GO
CREATE PROCEDURE sp_insertEtapas
	@Netapa tinyint,
	@Preco decimal,
	@Origem varchar(40),
	@Destino varchar(40),
	@Data date,
	@Idt smallint,
	@IDv smallint
WITH EXECUTE AS OWNER AS
BEGIN
	IF NOT EXISTS(SELECT ID_t FROM Transporte WHERE ID_t=@Idt)
		RAISERROR('O Transporte em questão não existe',16,1);
	IF NOT EXISTS(SELECT ID_v FROM Itinerario_da_Viagem WHERE ID_v=@IDv)
		RAISERROR('O Itinerario em questão não existe',16,1);
	ELSE
		INSERT INTO Etapas(N_Etapa,Preco,Origem,Destino,Hora_de_Partida,ID_transporte_fk1,ID_itinerario_fk1) VALUES(@Netapa,@Preco,@Origem,@Destino,@Data,@Idt,@IDv);
END


GO
DROP PROCEDURE sp_insertReserva
GO
CREATE PROCEDURE sp_insertReserva
	@Postovenda smallint,
	@Nif int,
	@Itinerario_fk smallint
WITH EXECUTE AS OWNER AS
BEGIN 
	IF NOT EXISTS(SELECT N_Balcao FROM Posto_Venda WHERE N_Balcao=@Postovenda)
		RAISERROR('O Número do Balcão não existe',16,1);
	IF NOT EXISTS(SELECT Nif FROM Cliente WHERE Nif=@Nif)
		RAISERROR('O Cliente não existe',16,1);
	IF NOT EXISTS (SELECT ID_v FROM Itinerario_da_Viagem WHERE ID_v=@Itinerario_fk)
		RAISERROR('O Itinerário nao existe',16,1);
	ELSE
		INSERT INTO Reserva VALUES (@Postovenda,@Nif,@Itinerario_fk);
END

--EXECUTE sp_insertReserva 12, 4,45

GO 
DROP PROCEDURE sp_insertEstadia
GO
CREATE PROCEDURE sp_insertEstadia
	@Morada varchar(90),
	@Pais varchar(32),
	@Custo float,
	@Duracao smallint,
	@N_Reserva_fk int
WITH EXECUTE AS OWNER AS
BEGIN
	IF NOT EXISTS (SELECT N_Reserva FROM Reserva WHERE N_Reserva=@N_Reserva_fk)
		RAISERROR('O Itinerário nao existe',16,1);
	ELSE
		INSERT INTO Estadia(Morada,Pais,Custo,Duracao,N_Reserva_fk) VALUES (@Morada,@Pais,@Custo,@Duracao,@N_Reserva_fk);

END

--EXECUTE sp_insertEstadia 'Street Random 14', 'Cennas',161,4,4

--SELECT * FROM Recibo

--GO 
--DROP PROCEDURE sp_insertRecibo
--GO
--CREATE PROCEDURE sp_insertRecibo
--	@NRecibo int ,
--	@NifRecibo int,
--	@Preco float,
--	@Data DATE,
--	@NReserva int
--WITH EXECUTE AS OWNER AS
--BEGIN
--	IF NOT EXISTS (SELECT N_Reserva FROM Reserva WHERE N_Reserva=@NReserva)
--		RAISERROR('O Itinerário nao existe',16,1);
--	ELSE
--		INSERT INTO Recibo(Num_Recibo,Nif_Recibo,Valor,Data,N_Reserva_fk) VALUES (@NRecibo ,@NifRecibo,@Preco,@Data,@NReserva);
--END

----EXECUTE sp_insertRecibo 223454988,521,200151,'2009-02-09',4

--SELECT * FROM Recibo

GO 
DROP PROCEDURE sp_insertRecibo
GO
CREATE PROCEDURE sp_insertRecibo
	@NifRecibo int,
	@Preco float,
	@Data DATE,
	@NReserva int
WITH EXECUTE AS OWNER AS
BEGIN
	
	IF NOT EXISTS (SELECT N_Reserva FROM Reserva WHERE N_Reserva=@NReserva)
		RAISERROR('A Reserva nao existe',16,1);
	ELSE
		IF EXISTS(SELECT ID_v FROM Itinerario_da_Viagem ,Reserva WHERE ID_v=Itinerario_fk)
		AND EXISTS(SELECT N_Reserva_fk FROM Estadia WHERE N_Reserva_fk=@NReserva)
			BEGIN
				PRINT('Recibo com Itinerario e Estadia');
				SELECT @Preco=SUM(Preco)  FROM Etapas INNER JOIN Itinerario_da_Viagem ON Etapas.ID_itinerario_fk1=Itinerario_da_Viagem.ID_v INNER JOIN Reserva ON Itinerario_da_Viagem.ID_v=Reserva.Itinerario_fk WHERE N_Reserva = @NReserva;
				SELECT @Preco=@Preco+SUM(Custo) FROM Estadia INNER JOIN Reserva ON Estadia.N_Reserva_fk=Reserva.N_Reserva WHERE N_Reserva = @NReserva;
			END
		IF EXISTS(SELECT ID_v FROM Itinerario_da_Viagem,Reserva WHERE ID_v=Itinerario_fk)AND NOT EXISTS(SELECT N_Reserva_fk FROM Estadia WHERE N_Reserva_fk=@NReserva)
			BEGIN
				PRINT('Recibo com Itinerario e sem Estadia');
				SELECT @Preco=SUM(Preco)  FROM Etapas INNER JOIN Itinerario_da_Viagem ON Etapas.ID_itinerario_fk1=Itinerario_da_Viagem.ID_v INNER JOIN Reserva ON Itinerario_da_Viagem.ID_v=Reserva.Itinerario_fk WHERE N_Reserva = @NReserva;
			END
		IF NOT EXISTS(SELECT ID_v FROM Itinerario_da_Viagem WHERE ID_v=@NReserva)AND EXISTS(SELECT N_Reserva_fk FROM Estadia WHERE N_Reserva_fk=@NReserva)
			BEGIN
				PRINT('Recibo sem Itinerario e com Estadia')
				SELECT @Preco=@Preco+SUM(Custo) FROM Estadia INNER JOIN Reserva ON Estadia.N_Reserva_fk=Reserva.N_Reserva WHERE N_Reserva = @NReserva;
			END
		INSERT INTO Recibo(Nif_Recibo,Valor,Data,N_Reserva_fk) VALUES (@NifRecibo,@Preco,@Data,@NReserva);
END

--EXECUTE sp_insertRecibo 222154988,54545,'2009-02-09',1;


--SELECT *FROM Recibo WHERE N_Reserva_fk=1