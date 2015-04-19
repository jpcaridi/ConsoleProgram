
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/19/2015 08:41:19
-- Generated from EDMX file: C:\dev\Testing\ConsoleProgram\ConsoleProgram\DataModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [testing];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Address_Street] nvarchar(max)  NOT NULL,
    [Address_City] nvarchar(max)  NOT NULL,
    [Address_Country] nvarchar(max)  NOT NULL,
    [Address_State] nvarchar(max)  NOT NULL,
    [Address_PostalCode] int  NOT NULL
);
GO

-- Creating table 'Accounts'
CREATE TABLE [dbo].[Accounts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CreationDate] datetime  NOT NULL,
    [Customer_Id] int  NOT NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [OrderNumber] int IDENTITY(1,1) NOT NULL,
    [OrderDate] datetime  NOT NULL,
    [AccountId] int  NOT NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [SKU] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ShoppingCarts'
CREATE TABLE [dbo].[ShoppingCarts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Account_Id] int  NOT NULL
);
GO

-- Creating table 'OrderProduct'
CREATE TABLE [dbo].[OrderProduct] (
    [Orders_OrderNumber] int  NOT NULL,
    [Products_SKU] int  NOT NULL
);
GO

-- Creating table 'ShoppingCartProduct'
CREATE TABLE [dbo].[ShoppingCartProduct] (
    [ShoppingCartProduct_Product_Id] int  NOT NULL,
    [Products_SKU] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Accounts'
ALTER TABLE [dbo].[Accounts]
ADD CONSTRAINT [PK_Accounts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [OrderNumber] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([OrderNumber] ASC);
GO

-- Creating primary key on [SKU] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([SKU] ASC);
GO

-- Creating primary key on [Id] in table 'ShoppingCarts'
ALTER TABLE [dbo].[ShoppingCarts]
ADD CONSTRAINT [PK_ShoppingCarts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Orders_OrderNumber], [Products_SKU] in table 'OrderProduct'
ALTER TABLE [dbo].[OrderProduct]
ADD CONSTRAINT [PK_OrderProduct]
    PRIMARY KEY CLUSTERED ([Orders_OrderNumber], [Products_SKU] ASC);
GO

-- Creating primary key on [ShoppingCartProduct_Product_Id], [Products_SKU] in table 'ShoppingCartProduct'
ALTER TABLE [dbo].[ShoppingCartProduct]
ADD CONSTRAINT [PK_ShoppingCartProduct]
    PRIMARY KEY CLUSTERED ([ShoppingCartProduct_Product_Id], [Products_SKU] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Customer_Id] in table 'Accounts'
ALTER TABLE [dbo].[Accounts]
ADD CONSTRAINT [FK_CustomerAcount]
    FOREIGN KEY ([Customer_Id])
    REFERENCES [dbo].[Customers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerAcount'
CREATE INDEX [IX_FK_CustomerAcount]
ON [dbo].[Accounts]
    ([Customer_Id]);
GO

-- Creating foreign key on [AccountId] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_AccountOrder]
    FOREIGN KEY ([AccountId])
    REFERENCES [dbo].[Accounts]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountOrder'
CREATE INDEX [IX_FK_AccountOrder]
ON [dbo].[Orders]
    ([AccountId]);
GO

-- Creating foreign key on [Account_Id] in table 'ShoppingCarts'
ALTER TABLE [dbo].[ShoppingCarts]
ADD CONSTRAINT [FK_AccountShoppingCart]
    FOREIGN KEY ([Account_Id])
    REFERENCES [dbo].[Accounts]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountShoppingCart'
CREATE INDEX [IX_FK_AccountShoppingCart]
ON [dbo].[ShoppingCarts]
    ([Account_Id]);
GO

-- Creating foreign key on [Orders_OrderNumber] in table 'OrderProduct'
ALTER TABLE [dbo].[OrderProduct]
ADD CONSTRAINT [FK_OrderProduct_Order]
    FOREIGN KEY ([Orders_OrderNumber])
    REFERENCES [dbo].[Orders]
        ([OrderNumber])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Products_SKU] in table 'OrderProduct'
ALTER TABLE [dbo].[OrderProduct]
ADD CONSTRAINT [FK_OrderProduct_Product]
    FOREIGN KEY ([Products_SKU])
    REFERENCES [dbo].[Products]
        ([SKU])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderProduct_Product'
CREATE INDEX [IX_FK_OrderProduct_Product]
ON [dbo].[OrderProduct]
    ([Products_SKU]);
GO

-- Creating foreign key on [ShoppingCartProduct_Product_Id] in table 'ShoppingCartProduct'
ALTER TABLE [dbo].[ShoppingCartProduct]
ADD CONSTRAINT [FK_ShoppingCartProduct_ShoppingCart]
    FOREIGN KEY ([ShoppingCartProduct_Product_Id])
    REFERENCES [dbo].[ShoppingCarts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Products_SKU] in table 'ShoppingCartProduct'
ALTER TABLE [dbo].[ShoppingCartProduct]
ADD CONSTRAINT [FK_ShoppingCartProduct_Product]
    FOREIGN KEY ([Products_SKU])
    REFERENCES [dbo].[Products]
        ([SKU])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ShoppingCartProduct_Product'
CREATE INDEX [IX_FK_ShoppingCartProduct_Product]
ON [dbo].[ShoppingCartProduct]
    ([Products_SKU]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------