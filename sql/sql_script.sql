USE Kaggle
GO
-- En caso no exista la tabla
if NOT EXISTS (select*FROM sys.tables WHERE object_id= OBJECT_ID(N'dbo.olympics')AND type='U') 
	CREATE TABLE dbo.olympics(
		NOC varchar(10),	
		Gold INT,
		Silver INT,
		Bronze INT,
		Total INT
	)

go

--SI YA EXISTE LA TABLA

TRUNCATE TABLE dbo.olympics;
GO

--IMPORTAR DATA DESDE ARCHIVO

BULK INSERT dbo.olympics

FROM 'C:\Users\USUARIO\Desktop\Proyecto_Parcial\dataset\Athens 2004 Olympics Nations Medals.csv'

WITH

(
		FIRSTROW=2,
		FIELDTERMINATOR=',',
		ROWTERMINATOR='0x0a' -- SALTO DE LINEA
)
GO