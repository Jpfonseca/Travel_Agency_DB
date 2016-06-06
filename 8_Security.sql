Use Sistema;

GO

EXECUTE sp_droplogin 'admins';
GO
EXECUTE sp_addlogin 'admins', 'basededados','Sistema','English'
GO
DROP USER random_owner;
GO
CREATE USER random_owner FOR LOGIN admins;
GO

EXECUTE sp_droplogin 'func';
GO
EXECUTE sp_addlogin 'func', 'basededados2','Sistema','English'
GO
DROP USER random_func;
GO
CREATE USER random_func FOR LOGIN func;
GO


EXECUTE sp_droprole 'MyRole2';
GO
EXECUTE sp_addrole 'MyRole2'
GO
GRANT EXECUTE,SELECT,INSERT TO MyRole2;


GO
EXECUTE sp_droprolemember'MyRole2','random_func'
GO
EXECUTE sp_addrolemember 'MyRole2', 'random_func'
GO 

EXECUTE sp_droprolemember'db_securityadmin','random_owner'

GO
EXECUTE sp_addrolemember 'db_securityadmin','random_owner'



