-- The scripts is intended to be run from sqlcmd utility with -v DbName=... specified

use master
go

if exists (select database_id from sys.databases where name = '$(DbName)')
begin
	Print 'drop database'
	alter database [$(DbName)] set single_user with rollback immediate
	DROP DATABASE [$(DbName)]
end
go

CREATE DATABASE [$(DbName)] COLLATE SQL_Latin1_General_CP1_CI_AS
GO
ALTER DATABASE [$(DbName)] MODIFY FILE
( NAME = N'$(DbName)' , SIZE = 256MB , MAXSIZE = UNLIMITED, FILEGROWTH = 100MB )
GO

ALTER DATABASE [$(DbName)] MODIFY FILE
( NAME = N'$(DbName)_log' , SIZE = 256MB , MAXSIZE = UNLIMITED , FILEGROWTH = 100MB)
GO
ALTER DATABASE [$(DbName)] SET COMPATIBILITY_LEVEL = 120
GO


ALTER DATABASE [$(DbName)] SET RECOVERY SIMPLE 
GO

USE [$(DbName)]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [$(DbName)] MODIFY FILEGROUP [PRIMARY] DEFAULT
GO