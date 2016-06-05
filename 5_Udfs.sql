use Sistema;

GO
DROP FUNCTION udf_getRecibos;
GO
CREATE FUNCTION udf_getRecibos() RETURNS TABLE AS
	RETURN(SELECT Num_Recibo,NIf_Recibo,N_Reserva,Posto_Venda_fk,Local_Partida,Local_Destino,Hora_partida_origem,Valor FROM Recibo 
			LEFT OUTER JOIN Reserva ON N_Reserva_fk=N_Reserva 
			LEFT OUTER JOIN  Itinerario_da_Viagem ON Itinerario_fk=ID_v);

GO
DROP FUNCTION udf_getEstadias;
GO
CREATE FUNCTION udf_getEstadias() RETURNS TABLE AS
	RETURN(SELECT ID_Estadia,Morada, Pais, Duracao, Custo FROM Estadia);


GO
DROP FUNCTION udf_getReservas;
GO
CREATE FUNCTION udf_getReservas() RETURNS TABLE AS
	RETURN (SELECT N_Reserva,Nif_Cliente_fk,Local_Partida,Local_Destino FROM Reserva LEFT OUTER JOIN Itinerario_da_Viagem ON Itinerario_fk=ID_v);


GO
DROP FUNCTION udf_getItinerarios;
GO
CREATE FUNCTION udf_getItinerarios() RETURNS TABLE AS
	RETURN(SELECT *FROM Itinerario_da_Viagem);


GO
DROP FUNCTION udf_getEtapasdaViagem;
GO
CREATE FUNCTION udf_getEtapasdaViagem (@Id_v smallint) RETURNS TABLE AS
	RETURN(SELECT N_Etapa,Preco,Origem,Destino,Hora_de_Partida FROM Etapas WHERE ID_itinerario_fk1=@Id_v);

GO
DROP FUNCTION udf_getTiposdeTransporte ;
GO
CREATE FUNCTION udf_getTiposdeTransporte() RETURNS TABLE AS
	RETURN(SELECT DISTINCT Designacao,Companhia FROM Tipo_Transporte INNER JOIN Transporte ON ID_transporte_fk=ID_t);

GO
DROP FUNCTION udf_getCompanhias ;
GO
CREATE FUNCTION udf_getCompanhias () RETURNS TABLE AS
	RETURN(SELECT Companhia FROM Transporte);


GO
DROP FUNCTION udf_getEmpresas ;
GO
CREATE FUNCTION udf_getEmpresas () RETURNS TABLE AS
	RETURN(SELECT NRegisto,Nome,Nif,Contacto_telefonico FROM Empresa INNER JOIN Cliente ON Nif3=Nif);


GO
DROP FUNCTION udf_getEmpresa ;
GO
CREATE FUNCTION udf_getEmpresa (@Nif int) RETURNS TABLE AS
	RETURN(SELECT NRegisto,Nome,Nif,Contacto_telefonico FROM Empresa INNER JOIN Cliente ON Nif3=Nif AND Nif=@Nif);


GO 
DROP FUNCTION udf_getClienteSingulares ;
GO
CREATE FUNCTION udf_getClienteSingulares () RETURNS  TABLE AS
	RETURN(SELECT CC,Nome,Nif,Contacto_telefonico FROM Pessoa_Singular LEFT JOIN Pessoa  ON CC_Pessoa_Singular=CC LEFT JOIN Cliente ON Nif2=Nif);


GO 
DROP FUNCTION udf_getTrabalhadores ;
GO
CREATE FUNCTION udf_getTrabalhadores () RETURNS TABLE  AS
	RETURN(SELECT Numero_de_funcionario,Nome,CC FROM Funcionario LEFT JOIN Pessoa ON CC_funcionario=CC);


GO 
DROP FUNCTION udf_getWorksOn;
GO
CREATE FUNCTION udf_getWorksOn () RETURNS TABLE  AS
	RETURN(SELECT Numero_de_funcionario,Nome,N_Balcao  FROM Trabalha LEFT JOIN Funcionario ON Num_Funcionario_fk=Numero_de_funcionario 
					LEFT JOIN Pessoa ON CC_funcionario=CC 
					LEFT JOIN Posto_Venda ON N_Balcao_fk=N_Balcao);


SELECT * FROM Pessoa;
SELECT * FROM Funcionario;
SELECT * FROM Posto_Venda;
SELECT * FROM Cliente;
SELECT * FROM Trabalha;
--SELECT * FROM Pessoa_Singular;
--SELECT * FROM Empresa;
--SELECT * FROM Itinerario_da_Viagem;
--SELECT * FROM Transporte;
--SELECT * FROM Tipo_Transporte;
--SELECT * FROM Reserva;
--SELECT * FROM Itinerario_da_Viagem;
--SELECT * FROM Etapas;
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



