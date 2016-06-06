Use Sistema;

GO

EXECUTE sp_droplogin 'admins';
GO
EXECUTE sp_addlogin 'admins', 'basededados','Sistema','English'

DROP USER random_guest;
GO
CREATE USER random_guest FOR LOGIN admins;
GO

EXECUTE sp_droprole 'MyRole2';
GO
EXECUTE sp_addrole 'MyRole2'
GO
GRANT EXECUTE, SELECT TO MyRole2;
GO

EXEC sp_addrolemember 'MyRole2', 'random_guest';
