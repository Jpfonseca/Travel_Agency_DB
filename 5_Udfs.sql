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


GO 
DROP FUNCTION udf_getListaPessoas ;
GO
CREATE FUNCTION udf_getListaPessoas () RETURNS  TABLE AS
	RETURN(SELECT *FROM Pessoa);

GO 
DROP FUNCTION udf_getPrecoReservasemEstadia ;
GO
CREATE FUNCTION udf_getPrecoReservasemEstadia (@NReserva int) RETURNS INT AS
BEGIN
DECLARE @Preco INT;
	SELECT @Preco=SUM(Preco) FROM Etapas 
				INNER JOIN Itinerario_da_Viagem ON Etapas.ID_itinerario_fk1=Itinerario_da_Viagem.ID_v
				INNER JOIN Reserva ON Itinerario_da_Viagem.ID_v=Reserva.Itinerario_fk WHERE N_Reserva=@NReserva
	RETURN @Preco;
END
GO 

DROP FUNCTION udf_getPrecoEstadia ;
GO
CREATE FUNCTION udf_getPrecoEstadia (@NReserva int) RETURNS INT AS
BEGIN	
	DECLARE @Preco int;
	SELECT @Preco=SUM(Custo) FROM Estadia INNER JOIN Reserva ON Estadia.N_Reserva_fk=Reserva.N_Reserva WHERE N_Reserva =@NReserva;

	RETURN @Preco;
END

GO
DROP FUNCTION udf_getNumReservaspCliente ;
GO
CREATE FUNCTION udf_getNumReservaspCliente (@NifCliente int) RETURNS INT  AS
BEGIN
	DECLARE @NumReservas int;
	SELECT @NumReservas=COUNT(*) FROM Reserva WHERE Nif_Cliente_fk=@NifCliente;
	RETURN @NumReservas;
END

GO
DROP FUNCTION udf_getNumEtapasItinerario ;
GO
CREATE FUNCTION udf_getNumEtapasItinerario (@NumItinerario int) RETURNS INT  AS
BEGIN
	DECLARE @NumEtapas int;
	SELECT @NumEtapas=COUNT(*) FROM Etapas WHERE ID_itinerario_fk1=@NumItinerario;
	RETURN @NumEtapas;
END

GO
DROP FUNCTION udf_getNumFuncionarios ;
GO
CREATE FUNCTION udf_getNumFuncionarios () RETURNS INT  AS
BEGIN
	DECLARE @Numfuncionarios INT;
	SELECT @Numfuncionarios=COUNT(*) FROM Funcionario ;
	RETURN @Numfuncionarios ;
END

GO
DROP FUNCTION udf_getVendaspPosto ;
GO
CREATE FUNCTION udf_getVendaspPosto (@Nposto smallint) RETURNS TABLE   AS

	RETURN(SELECT Posto_venda_fk, N_Reserva, Custo FROM Estadia INNER JOIN Reserva ON Estadia.N_Reserva_fk=Reserva.N_Reserva 
			WHERE Posto_venda_fk=@Nposto );
GO

DROP FUNCTION udf_getPostosdeVenda ;
GO
CREATE FUNCTION udf_getPostosdeVenda () RETURNS TABLE   AS

	RETURN(SELECT * FROM Posto_Venda );
GO

DROP FUNCTION udf_getItinerarioseTransporte;
GO
CREATE FUNCTION udf_getItinerarioseTransporte(@IDitinerario smallint) RETURNS TABLE AS

	RETURN (SELECT ID_v,Local_Partida,Local_Destino,Origem,Destino,Hora_de_Partida,Designacao,Companhia FROM Itinerario_da_Viagem LEFT JOIN Etapas ON ID_itinerario_fk1=ID_v 
			LEFT JOIN Transporte ON ID_transporte_fk1=ID_t 
			LEFT JOIN Tipo_Transporte ON ID_transporte_fk=ID_transporte_fk1 WHERE ID_itinerario_fk1=@IDitinerario);

GO

DROP FUNCTION udf_getItinerarioeEtapaTransporte;
GO
CREATE FUNCTION udf_getItinerarioeEtapaTransporte(@IDitinerario smallint,@Netapa tinyint) RETURNS TABLE AS

	RETURN (SELECT ID_v,N_Etapa,Local_Partida,Local_Destino,Origem,Destino,Hora_de_Partida,Designacao,Companhia FROM Itinerario_da_Viagem LEFT JOIN Etapas ON ID_itinerario_fk1=ID_v 
			LEFT JOIN Transporte ON ID_transporte_fk1=ID_t 
			LEFT JOIN Tipo_Transporte ON ID_transporte_fk=ID_transporte_fk1 WHERE ID_itinerario_fk1=@IDitinerario AND N_Etapa=@Netapa);

GO

DROP FUNCTION udf_getItinerarioporTransporte;
GO
CREATE FUNCTION udf_getItinerarioporTransporte(@Transporte smallint) RETURNS TABLE AS

	RETURN (SELECT ID_v,N_Etapa,Local_Partida,Local_Destino,Origem,Destino,Hora_de_Partida,Designacao,Companhia FROM Itinerario_da_Viagem LEFT JOIN Etapas ON ID_itinerario_fk1=ID_v 
			LEFT JOIN Transporte ON ID_transporte_fk1=ID_t 
			LEFT JOIN Tipo_Transporte ON ID_transporte_fk=ID_transporte_fk1 WHERE ID_t=@Transporte);

GO

DROP FUNCTION udf_getTransporteporLocaiseHora;
GO
CREATE FUNCTION udf_getTransporteporLocaiseHora(@LocalPartida varchar(40), @LocalDestino varchar(40),@Hora DATE) RETURNS TABLE AS

	RETURN (SELECT Designacao,Companhia FROM Itinerario_da_Viagem LEFT JOIN Etapas ON ID_itinerario_fk1=ID_v 
			LEFT JOIN Transporte ON ID_transporte_fk1=ID_t 
			LEFT JOIN Tipo_Transporte ON ID_transporte_fk=ID_transporte_fk1 
			WHERE Hora_partida_origem=@Hora AND Local_Partida=@LocalPartida AND Local_Destino=@LocalDestino);

GO

DROP FUNCTION udf_getLocalPartida;
GO
CREATE FUNCTION udf_getLocalPartida(@Hora DATE ,@Designacao varchar(40)) RETURNS TABLE AS 
	RETURN(SELECT Local_Partida FROM Itinerario_da_Viagem LEFT JOIN Etapas ON ID_itinerario_fk1=ID_v 
			LEFT JOIN Transporte ON ID_transporte_fk1=ID_t 
			LEFT JOIN Tipo_Transporte ON ID_transporte_fk=ID_transporte_fk1 
			WHERE Hora_partida_origem=@Hora AND Designacao=@Designacao);

GO

DROP FUNCTION udf_getLocalDestino;
GO
CREATE FUNCTION udf_getLocalDestino(@LocalPartida varchar(40),@Hora DATE ,@Designacao varchar(40)) RETURNS TABLE AS 
	RETURN(SELECT Local_Destino FROM Itinerario_da_Viagem LEFT JOIN Etapas ON ID_itinerario_fk1=ID_v 
			LEFT JOIN Transporte ON ID_transporte_fk1=ID_t 
			LEFT JOIN Tipo_Transporte ON ID_transporte_fk=ID_transporte_fk1 
			WHERE Hora_partida_origem=@Hora AND Designacao=@Designacao AND Local_Partida=@LocalPartida);

GO

DROP FUNCTION udf_getId_vItinerario;
GO
CREATE FUNCTION udf_getId_vItinerario(@LocalPartida varchar(40), @LocalDestino varchar(40),@Hora DATE) RETURNS TABLE AS

	RETURN (SELECT ID_v FROM Itinerario_da_Viagem LEFT JOIN Etapas ON ID_itinerario_fk1=ID_v 
			LEFT JOIN Transporte ON ID_transporte_fk1=ID_t 
			LEFT JOIN Tipo_Transporte ON ID_transporte_fk=ID_transporte_fk1 
			WHERE Hora_partida_origem=@Hora AND Local_Partida=@LocalPartida AND Local_Destino=@LocalDestino);

GO


DROP FUNCTION udf_getDestinos_partida_hora;
GO
CREATE FUNCTION udf_getDestinos_partida_hora(@LocalPartida varchar(40),@Hora DATE) RETURNS TABLE AS

	RETURN (SELECT Local_Destino FROM Itinerario_da_Viagem LEFT JOIN Etapas ON ID_itinerario_fk1=ID_v 
			LEFT JOIN Transporte ON ID_transporte_fk1=ID_t 
			LEFT JOIN Tipo_Transporte ON ID_transporte_fk=ID_transporte_fk1 
			WHERE Hora_partida_origem=@Hora AND Local_Partida=@LocalPartida);

GO


--SELECT * FROM dbo.udf_getDestinos_partida_hora('Aveiro','2009-02-09');


 --SELECT * FROM dbo.udf_getVendaspPosto(9);
 --SELECT * FROM dbo.udf_getVendaspPosto(10);
--Ajudas

--SELECT * FROM Pessoa;
--SELECT * FROM Funcionario;
--SELECT * FROM Posto_Venda;
--SELECT * FROM Cliente;
--SELECT * FROM Trabalha;
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




--SELECT ID_v,Local_Partida,Local_Destino,Origem,Destino,Hora_de_Partida,Designacao,Companhia,ID_t FROM Itinerario_da_Viagem LEFT JOIN Etapas ON ID_itinerario_fk1=ID_v 		LEFT JOIN Transporte ON ID_transporte_fk1=ID_t 
--	LEFT JOIN Tipo_Transporte ON ID_transporte_fk=ID_transporte_fk1 WHERE ID_itinerario_fk1=1 AND N_Etapa=1

--SELECT Local_Destino FROM Itinerario_da_Viagem LEFT JOIN Etapas ON ID_itinerario_fk1=ID_v 
--			LEFT JOIN Transporte ON ID_transporte_fk1=ID_t 
--			LEFT JOIN Tipo_Transporte ON ID_transporte_fk=ID_transporte_fk1 WHERE Hora_partida_origem='2009-02-09' AND Designacao='Comboio'
--			 AND Local_Partida='Aveiro'


--SELECT Designacao,Companhia FROM Itinerario_da_Viagem LEFT JOIN Etapas ON ID_itinerario_fk1=ID_v 
--			LEFT JOIN Transporte ON ID_transporte_fk1=ID_t 
--			LEFT JOIN Tipo_Transporte ON ID_transporte_fk=ID_transporte_fk1 WHERE Hora_partida_origem='2009-02-09' AND Local_Partida='Aveiro'AND Local_Destino='Régua'
