use Sistema;

---------------------------------------------
--------------------INSERTS -----------------
---------------------------------------------
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
	@cc	int
WITH EXECUTE AS OWNER AS 

BEGIN
	IF NOT EXISTS(SELECT CC FROM Pessoa WHERE CC= @cc)
		RAISERROR('Não existe ninguém com o CC especificado',16,1)
	ELSE
		INSERT INTO Funcionario(CC_funcionario) VALUES (@cc);
END

--EXECUTE sp_insertFuncionario 1231,12346
--EXECUTE sp_insertFuncionario 1525,5153 --error


GO 
DROP PROCEDURE sp_insertPosto_Venda
GO

CREATE PROCEDURE sp_insertPosto_Venda

	--@Nbalcao smallint
WITH EXECUTE AS OWNER AS
BEGIN 
	
	INSERT INTO Posto_Venda DEFAULT VALUES;-- VALUES (@Nbalcao);
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
	@Nome varchar(40),
	@CapitalSocial int,
	@Nif int
WITH EXECUTE AS OWNER AS
BEGIN
	IF NOT EXISTS(SELECT Nif FROM Cliente WHERE Nif=@Nif)
		RAISERROR('O Cliente em questão não existe',16,1);
	ELSE
		INSERT INTO Empresa(Nome,Capital_Social,Nif3)
		 VALUES (@Nome,@CapitalSocial,@Nif)
END

--EXECUTE sp_insertEmpresa 15151, 'Cenas',551,185848846

GO 
DROP PROCEDURE sp_insertItinerario_de_Viagem
GO
CREATE PROCEDURE sp_insertItinerario_de_Viagem 
	@Partida varchar(50),
	@Destino varchar(50),
	@Date DATE

WITH EXECUTE AS OWNER AS
BEGIN
	INSERT INTO Itinerario_da_Viagem(Local_Partida,Local_Destino,Hora_partida_origem) 
	VALUES(@Partida,@Destino,@Date)

END

--EXECUTE sp_insertItinerario_de_Viagem 1223,'Fracas','Madrid','2009-02-05'


GO 
DROP PROCEDURE	sp_insertTransporte
GO
CREATE PROCEDURE sp_insertTransporte
	@Bilhete smallint,
	@Companhia varchar(50)

WITH EXECUTE AS OWNER AS
BEGIN
	INSERT INTO Transporte(Bilhete,Companhia) 
	VALUES(@Bilhete,@Companhia)

END

--EXECUTE sp_insertItinerario_de_Viagem 1223,'Fracas','Madrid','2009-02-05'

GO 
DROP PROCEDURE sp_insertTipotrans
GO
CREATE PROCEDURE sp_insertTipotrans
	@Id_tipo smallint,
	@Designacao varchar(40)
WITH EXECUTE AS OWNER AS
BEGIN
	IF NOT EXISTS(SELECT ID_t FROM Transporte WHERE ID_t=@Id_tipo)
		RAISERROR('O Transporte em questão não existe',16,1);
	ELSE
		INSERT INTO Tipo_Transporte(ID_Tipo_Transporte,ID_transporte_fk,Designacao)
		 VALUES (@Id_tipo,@Id_tipo,@Designacao)
END

--EXECUTE sp_insertTipotrans 4,4,'ASDASD0'

GO 
DROP PROCEDURE sp_insertEtapas
GO
CREATE PROCEDURE sp_insertEtapas
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
		INSERT INTO Etapas(Preco,Origem,Destino,Hora_de_Partida,ID_transporte_fk1,ID_itinerario_fk1) 
		VALUES(@Preco,@Origem,@Destino,@Data,@Idt,@IDv);
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
		INSERT INTO Reserva(Posto_venda_fk,Nif_Cliente_fk,Itinerario_fk) VALUES (@Postovenda,@Nif,@Itinerario_fk);
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
		INSERT INTO Recibo(Nif_Recibo,Valor,Data,N_Reserva_fk) VALUES (@NifRecibo,@Preco,@Data,@NReserva);
END


---------------------------------------------
-------------------- DELETE -----------------
---------------------------------------------


GO 
DROP PROCEDURE sp_deleteReserva
GO
CREATE PROCEDURE sp_deleteReserva
	@NReserva int
WITH EXECUTE AS OWNER AS
BEGIN
	IF NOT EXISTS (SELECT N_Reserva FROM Reserva WHERE N_Reserva=@NReserva)
		RAISERROR('A Reserva nao existe',16,1);
	ELSE
		DELETE FROM Reserva WHERE N_Reserva=@NReserva;
END



GO
DROP PROCEDURE sp_deleteEstadia
GO
CREATE PROCEDURE sp_deleteEstadia
	@ID_Estadia smallint,
	@N_Reserva int
WITH EXECUTE AS OWNER AS
BEGIN 
	IF NOT EXISTS (SELECT ID_Estadia, N_Reserva_fk FROM Estadia WHERE ID_Estadia=@ID_Estadia AND N_Reserva_fk=@N_Reserva ) 
		RAISERROR('Não existe nenhum local de estadia com os atributos dados ',16,1);
	ELSE
		DELETE FROM Estadia WHERE ID_Estadia=@ID_Estadia AND N_Reserva_fk=@N_Reserva
END



GO
DROP PROCEDURE sp_deleteEtapa
GO
CREATE PROCEDURE sp_deleteEtapa
	@NEtapa tinyint,
	@IDitinerario smallint,
	@IDtransporte smallint
WITH EXECUTE AS OWNER AS
BEGIN 
	IF NOT EXISTS (SELECT N_Etapa, ID_itinerario_fk1,ID_transporte_fk1 FROM Etapas WHERE N_Etapa=@NEtapa AND ID_itinerario_fk1=@IDitinerario AND ID_transporte_fk1=@IDtransporte)
		RAISERROR('A Etapa em questão não existe',16,1);

	ELSE
		DELETE FROM Etapas WHERE N_Etapa=@NEtapa AND ID_itinerario_fk1=@IDitinerario AND ID_transporte_fk1=@IDtransporte;
END		


GO
DROP PROCEDURE sp_deleteTransporte
GO
CREATE PROCEDURE sp_deleteTransporte
	@Id_tipo smallint
WITH EXECUTE AS OWNER AS
BEGIN 
	IF NOT EXISTS (SELECT ID_t FROM Transporte WHERE ID_t=@Id_tipo)
		RAISERROR('O transporte em questão não existe',16,1);

	ELSE
		DELETE FROM Transporte WHERE ID_t=@Id_tipo;
END		


GO
DROP PROCEDURE sp_deleteItinerario_de_Viagem
GO
CREATE PROCEDURE sp_deleteItinerario_de_Viagem
	@IDv smallint
WITH EXECUTE AS OWNER AS
BEGIN 
	IF NOT EXISTS (SELECT ID_v FROM Itinerario_da_Viagem WHERE ID_v=@IDv)
		RAISERROR('O Itinerario Em questão não existe',16,1)
	ELSE
		DELETE FROM Itinerario_da_Viagem WHERE ID_v=@IDv;
END		


GO
DROP PROCEDURE sp_deleteEmpresa
GO
CREATE PROCEDURE sp_deleteEmpresa
	@Nregisto smallint
WITH EXECUTE AS OWNER AS
BEGIN 
	IF NOT EXISTS (SELECT NRegisto FROM Empresa WHERE NRegisto=@Nregisto)
		RAISERROR('A Empresa em questão não existe',16,1);

	ELSE
		DELETE FROM Empresa WHERE  NRegisto=@Nregisto;
END		


GO
DROP PROCEDURE sp_deletePessoaSingular
GO
CREATE PROCEDURE sp_deletePessoaSingular
	@cc int
WITH EXECUTE AS OWNER AS
BEGIN 
	IF NOT EXISTS (SELECT CC_Pessoa_Singular FROM Pessoa_Singular WHERE CC_Pessoa_Singular = @cc)
		RAISERROR('O Cliente em questão não existe',16,1);

	ELSE
		DELETE FROM Pessoa_Singular WHERE CC_Pessoa_Singular=@cc;
END		


GO
DROP PROCEDURE sp_deleteTrabalha
GO
CREATE PROCEDURE sp_deleteTrabalha
	@Nbalcao smallint,
	@NumFuncionario smallint
WITH EXECUTE AS OWNER AS
BEGIN 
		IF NOT EXISTS(SELECT N_Balcao FROM Posto_Venda WHERE N_Balcao=@Nbalcao)
		RAISERROR('O Numero do Balcao nao existe', 16,1);
	IF NOT EXISTS(SELECT Numero_de_funcionario FROM Funcionario WHERE Numero_de_funcionario=@Numfuncionario )
		RAISERROR('O Numerro de funcionario nao existe',16,1);

	ELSE
		DELETE FROM Trabalha WHERE N_Balcao_fk=@Nbalcao AND Num_Funcionario_fk=@NumFuncionario;
END		


GO
DROP PROCEDURE sp_deleteCliente
GO
CREATE PROCEDURE sp_deleteCliente
	@Nif int
WITH EXECUTE AS OWNER AS
BEGIN 
	IF NOT EXISTS (SELECT Nif FROM Cliente WHERE Nif=@Nif)
		RAISERROR('O Cliente não existe',16,1);

	ELSE
		DELETE FROM Cliente WHERE Nif=@Nif;
END		


GO
DROP PROCEDURE sp_deletePosto_Venda
GO
CREATE PROCEDURE sp_deletePosto_Venda
	@NBalcao smallint
WITH EXECUTE AS OWNER AS
BEGIN 
	IF NOT EXISTS (SELECT N_Balcao FROM Posto_Venda WHERE N_Balcao=@NBalcao )
		RAISERROR('O Balcao seleccionado não existe',16,1);

	ELSE
		DELETE FROM  Posto_Venda WHERE N_Balcao=@NBalcao;
END		


GO
DROP PROCEDURE sp_deleteFuncionario
GO
CREATE PROCEDURE sp_deleteFuncionario
	@Nfuncionario smallint,
	@cc_func int
WITH EXECUTE AS OWNER AS
BEGIN 
	IF NOT EXISTS (SELECT Numero_de_funcionario FROM Funcionario WHERE Numero_de_funcionario=@Nfuncionario AND CC_funcionario=@cc_func)
		RAISERROR('O Funcionario não existe',16,1);

	ELSE
		DELETE FROM Funcionario WHERE Numero_de_funcionario=@Nfuncionario AND CC_funcionario=@cc_func;
END		


GO
DROP PROCEDURE sp_deletePessoa
GO
CREATE PROCEDURE sp_deletePessoa
	@cc_pessoa int
WITH EXECUTE AS OWNER AS
BEGIN 
	IF NOT EXISTS (SELECT CC FROM Pessoa WHERE CC=@cc_pessoa)
		RAISERROR('A pessoa em questão não existe',16,1)

	ELSE
		DELETE FROM Pessoa WHERE CC=@cc_pessoa
END		



---------------------------------------------
-------------------- UPDATE -----------------
---------------------------------------------


GO 
DROP PROCEDURE sp_updateReserva
GO
CREATE PROCEDURE sp_updateReserva
	@NReserva int,
	@NifCliente int
WITH EXECUTE AS OWNER AS
BEGIN
	IF NOT EXISTS (SELECT N_Reserva FROM Reserva WHERE N_Reserva=@NReserva)
		RAISERROR('A Reserva nao existe',16,1);
	ELSE
		UPDATE Reserva SET Nif_Cliente_fk=@NifCliente WHERE N_Reserva=@NReserva;
END



GO
DROP PROCEDURE sp_updateEstadia
GO
CREATE PROCEDURE sp_updateEstadia
	@ID_Estadia smallint,
	@N_Reserva int,
	@Custo float
WITH EXECUTE AS OWNER AS
BEGIN 
	IF NOT EXISTS (SELECT ID_Estadia, N_Reserva_fk FROM Estadia WHERE ID_Estadia=@ID_Estadia AND N_Reserva_fk=@N_Reserva ) 
		RAISERROR('Não existe nenhum local de estadia com os atributos dados ',16,1);
	ELSE
		UPDATE Estadia SET Custo=@Custo WHERE ID_Estadia=@ID_Estadia AND N_Reserva_fk=@N_Reserva
END



GO
DROP PROCEDURE sp_updateEtapa
GO
CREATE PROCEDURE sp_updateEtapa
	@NEtapa tinyint,
	@IDitinerario smallint,
	@IDtransporte smallint,
	@Horas Date
WITH EXECUTE AS OWNER AS
BEGIN 
	IF NOT EXISTS (SELECT N_Etapa, ID_itinerario_fk1,ID_transporte_fk1 FROM Etapas WHERE N_Etapa=@NEtapa AND ID_itinerario_fk1=@IDitinerario AND ID_transporte_fk1=@IDtransporte)
		RAISERROR('A Etapa em questão não existe',16,1);

	ELSE
		UPDATE Etapas SET Hora_de_Partida=@Horas WHERE N_Etapa=@NEtapa AND ID_itinerario_fk1=@IDitinerario AND ID_transporte_fk1=@IDtransporte;
END		


GO
DROP PROCEDURE sp_updateTransporte
GO
CREATE PROCEDURE sp_updateTransporte
	@Id_tipo smallint,
	@Bilhete smallint
WITH EXECUTE AS OWNER AS
BEGIN 
	IF NOT EXISTS (SELECT ID_t FROM Transporte WHERE ID_t=@Id_tipo)
		RAISERROR('O transporte em questão não existe',16,1);

	ELSE
		UPDATE Transporte SET Bilhete=@Bilhete WHERE ID_t=@Id_tipo;
END		


GO
DROP PROCEDURE sp_updateItinerario_de_Viagem
GO
CREATE PROCEDURE sp_updateItinerario_de_Viagem
	@IDv smallint,
	@hora date
WITH EXECUTE AS OWNER AS
BEGIN 
	IF NOT EXISTS (SELECT ID_v FROM Itinerario_da_Viagem WHERE ID_v=@IDv)
		RAISERROR('O Itinerario Em questão não existe',16,1)
	ELSE
		UPDATE Itinerario_da_Viagem SET Hora_partida_origem=@hora WHERE ID_v=@IDv;
END		


GO
DROP PROCEDURE sp_updateEmpresa
GO
CREATE PROCEDURE sp_updateEmpresa
	@Nregisto smallint,
	@CapitalSocial int
WITH EXECUTE AS OWNER AS
BEGIN 
	IF NOT EXISTS (SELECT NRegisto FROM Empresa WHERE NRegisto=@Nregisto)
		RAISERROR('A Empresa em questão não existe',16,1);

	ELSE
		UPDATE Empresa SET Capital_Social=@CapitalSocial WHERE  NRegisto=@Nregisto;
END		


GO
DROP PROCEDURE sp_updateTrabalha
GO
CREATE PROCEDURE sp_updateTrabalha
	@Nbalcao smallint,
	@NumFuncionario smallint
WITH EXECUTE AS OWNER AS
BEGIN 
		IF NOT EXISTS(SELECT N_Balcao FROM Posto_Venda WHERE N_Balcao=@Nbalcao)
			RAISERROR('O Numero do Balcao nao existe', 16,1);
		IF NOT EXISTS(SELECT Numero_de_funcionario FROM Funcionario WHERE Numero_de_funcionario=@Numfuncionario )
			RAISERROR('O Numerro de funcionario nao existe',16,1);

	ELSE
		UPDATE Trabalha SET Num_Funcionario_fk=@NumFuncionario WHERE N_Balcao_fk=@Nbalcao;
END		


GO
DROP PROCEDURE sp_updateCliente
GO
CREATE PROCEDURE sp_updateCliente
	@Nif int,
	@Contacto int
WITH EXECUTE AS OWNER AS
BEGIN 
	IF NOT EXISTS (SELECT Nif FROM Cliente WHERE Nif=@Nif)
		RAISERROR('O Cliente não existe',16,1);

	ELSE
		UPDATE Cliente SET Contacto_telefonico=@Contacto WHERE Nif=@Nif;
END		


GO
DROP PROCEDURE sp_updateFuncionario
GO
CREATE PROCEDURE sp_updateFuncionario
	@Nfuncionario smallint,
	@cc_func int
WITH EXECUTE AS OWNER AS
BEGIN 
	IF NOT EXISTS (SELECT Numero_de_funcionario FROM Funcionario WHERE Numero_de_funcionario=@Nfuncionario)
		RAISERROR('O Funcionario não existe',16,1);
	IF NOT EXISTS(SELECT CC FROM Pessoa WHERE CC= @cc_func)
		RAISERROR('A Pessoa não existe',16,1);
	ELSE
		UPDATE Funcionario SET CC_funcionario=@cc_func WHERE Numero_de_funcionario=@Nfuncionario;
END		


GO
DROP PROCEDURE sp_updatePessoa
GO
CREATE PROCEDURE sp_updatePessoa
	@cc_pessoa int,
	@Nome varchar(40)
WITH EXECUTE AS OWNER AS
BEGIN 
	IF NOT EXISTS (SELECT CC FROM Pessoa WHERE CC=@cc_pessoa)
		RAISERROR('A pessoa em questão não existe',16,1)

	ELSE
		UPDATE Pessoa SET Nome=@Nome WHERE CC=@cc_pessoa
END		

