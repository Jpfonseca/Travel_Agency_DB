use Sistema;


DROP FUNCTION udf_getRecibos;
GO
CREATE FUNCTION udf_getRecibos() RETURNS TABLE AS
	RETURN(SELECT Num_Recibo,NIf_Recibo,N_Reserva,Posto_Venda_fk,Local_Partida,Local_Destino,Hora_partida_origem,Valor FROM Recibo 
			LEFT OUTER JOIN Reserva ON N_Reserva_fk=N_Reserva 
			LEFT OUTER JOIN  Itinerario_da_Viagem ON Itinerario_fk=ID_v);
GO

DROP FUNCTION udf_getEstadias;
GO
CREATE FUNCTION udf_getEstadias RETURNS TABLE AS
	RETURN(SELECT ID_Estadia,Morada, Pais, Duracao, Custo FROM Estadia)
GO

DROP FUNCTION udf_getReservas;
GO
CREATE FUNCTION udfgetReservas RETURNS TABLE AS
	RETURN (SELECT N_Reserva,Nif_Cliente_fk,Local_Partida,Local_Destino FROM Reserva LEFT OUTER JOIN Itinerario_da_Viagem ON Itinerario_fk=ID_v);
GO

SELECT * FROM Pessoa;
SELECT * FROM Funcionario;
SELECT * FROM Posto_Venda;
SELECT * FROM Cliente;
SELECT * FROM Trabalha;
SELECT * FROM Pessoa_Singular;
SELECT * FROM Empresa;
SELECT * FROM Itinerario_da_Viagem;
SELECT * FROM Transporte;
SELECT * FROM Tipo_Transporte;
--SELECT * FROM Reserva;
SELECT * FROM Itinerario_da_Viagem;
SELECT * FROM Etapas;
--SELECT * FROM Estadia;
--SELECT * FROM Recibo;



--SELECT SUM(Preco) Preço
--	FROM Etapas
--				INNER JOIN Itinerario_da_Viagem ON Etapas.ID_itinerario_fk1=Itinerario_da_Viagem.ID_v
--				INNER JOIN Reserva ON Itinerario_da_Viagem.ID_v=Reserva.Itinerario_fk 
--	WHERE N_Reserva = 1;

--SELECT SUM(Custo) Preço	FROM Estadia INNER JOIN Reserva ON Estadia.N_Reserva_fk=Reserva.N_Reserva WHERE N_Reserva = 1;

--SELECT * FROM Estadia WHERE N_Reserva_fk = 1;

--SELECT ID_v FROM Itinerario_da_Viagem ,Reserva WHERE ID_v=Itinerario_fk



