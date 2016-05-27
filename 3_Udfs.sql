use Sistema;

-SELECT * FROM Pessoa;
SELECT * FROM Funcionario;
SELECT * FROM Posto_Venda;
SELECT * FROM Cliente;
SELECT * FROM Trabalha;
SELECT * FROM Pessoa_Singular;
SELECT * FROM Empresa;
SELECT * FROM Itinerario_da_Viagem;
SELECT * FROM Transporte;
SELECT * FROM Tipo_Transporte;
SELECT * FROM Reserva;
SELECT * FROM Itinerario_da_Viagem;
SELECT * FROM Etapas;
SELECT * FROM Estadia;
SELECT * FROM Recibo;



SELECT Reserva.N_Reserva, Etapas.*, Reserva.Preco
	FROM Etapas 
		INNER JOIN Itinerario_da_Viagem ON Etapas.ID_itinerario_fk1=Itinerario_da_Viagem.ID_v
		INNER JOIN Reserva ON Itinerario_da_Viagem.ID_v=Reserva.Itinerario_fk
	WHERE N_Reserva = 1

SUM
