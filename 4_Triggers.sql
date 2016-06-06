use Sistema;

GO
DROP TRIGGER DeleteCliente;
GO
CREATE TRIGGER DeleteCliente ON Cliente
INSTEAD OF DELETE
AS
BEGIN
	BEGIN TRANSACTION tranDelete
	BEGIN TRY
		DECLARE @Nif AS INT;
		SELECT @Nif=Nif FROM deleted;

		DELETE FROM Pessoa_Singular WHERE Nif2=@Nif;
		DELETE FROM Empresa WHERE Nif3=@Nif;
		DELETE FROM Reserva WHERE Nif_Cliente_fk=@Nif;

		DELETE FROM Cliente WHERE Nif=@Nif;
		COMMIT TRANSACTION tranDelete;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		THROW;
	END CATCH
END

