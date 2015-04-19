--USE [testing]
--GO

--Remove all the old data.
DELETE FROM [dbo].[Customers] WHERE Id > 0
GO

INSERT INTO [dbo].[Customers] VALUES ('John Caridi', 'jpcaridi@gmail.com', '1748 Quentin St.', 'West Babylon', 'USA', 'NY', 11704)
INSERT INTO [dbo].[Customers] VALUES ('Joe Smith', 'joe@smith.com', '123 Main St.', 'Anywhere', 'USA', 'NY', 12345)
GO

INSERT INTO [dbo].[Accounts] (CreationDate, Customer_ID) VALUES (GETDATE(), (SELECT dbo.Customers.Id from dbo.Customers where dbo.Customers.Name = 'John Caridi'))
INSERT INTO [dbo].[Accounts] (CreationDate, Customer_ID) VALUES (GETDATE(), (SELECT dbo.Customers.Id from dbo.Customers where dbo.Customers.Name = 'Joe Smith'))
GO
