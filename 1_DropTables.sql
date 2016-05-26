--use Sistema;

--EXEC sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"

--DECLARE @sql NVARCHAR(max)=''

--SELECT @sql += ' Drop table [' + TABLE_SCHEMA + '].['+ TABLE_NAME + ']'
--FROM   INFORMATION_SCHEMA.TABLES
--WHERE  TABLE_TYPE = 'BASE TABLE'

--Exec Sp_executesql @sql 


USE Sistema;

GO

DROP PROC sp_DROP_T_if_Exists;
GO

CREATE PROC sp_DROP_T_if_Exists @Table_n varchar(40)
AS
	BEGIN TRANSACTION transDrop
	
	BEGIN TRY 

		IF EXISTS (SELECT s.name, t.name 
			  FROM sys.tables AS t 
			  INNER JOIN sys.schemas AS s 
			  ON t.[schema_id] = s.[schema_id] 
			  WHERE t.name LIKE @Table_n)
		BEGIN
				DECLARE @sqlCmd varchar(100);
				SET @sqlCmd = concat('DROP TABLE ', @Table_n);
				EXEC (@sqlCmd);
		END
		COMMIT TRANSACTION transDrop
	
	END TRY

	BEGIN CATCH 
		ROLLBACK TRANSACTION transDrop
	END CATCH
GO


DROP PROC sp_dropAll;
GO
CREATE PROC sp_dropAll
AS
	BEGIN TRANSACTION tranDropAll
	BEGIN TRY
		EXEC sp_DROP_T_if_Exists 'Recibo';
		EXEC sp_DROP_T_if_Exists 'Estadia';
		EXEC sp_DROP_T_if_Exists 'Reserva';
		EXEC sp_DROP_T_if_Exists 'Etapas';
		EXEC sp_DROP_T_if_Exists 'Tipo_Transporte';
		EXEC sp_DROP_T_if_Exists 'Transporte';
		EXEC sp_DROP_T_if_Exists 'Itinerario_da_Viagem';
		EXEC sp_DROP_T_if_Exists 'Empresa';
		EXEC sp_DROP_T_if_Exists 'Pessoa_Singular';
		EXEC sp_DROP_T_if_Exists 'Trabalha';
		EXEC sp_DROP_T_if_Exists 'Cliente';
		EXEC sp_DROP_T_if_Exists 'Posto_Venda';
		EXEC sp_DROP_T_if_Exists 'Funcionario';
		EXEC sp_DROP_T_if_Exists 'Pessoa';
		COMMIT TRANSACTION tranDropAll
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION tranDropAll
		PRINT 'Failed to drop all tables'
	END CATCH 
GO

EXECUTE sp_dropAll;
