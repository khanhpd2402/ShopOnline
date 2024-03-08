--create database [OnlineShop3]
--drop database [OnlineShop3]

CREATE TABLE [dbo].[Brand](
	[BrandID] [int] IDENTITY(1,1) PRIMARY KEY,
	[BrandName] [nvarchar](1000) NULL,
	phoneContact varchar(15),
	[address] nchar(255), 
	[country] nvarchar(255),
	[status] tinyint  
	)

CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) PRIMARY KEY,
	[CategoryName] [nvarchar](1000) NULL
	)
	
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) PRIMARY KEY,
	[ProductName] [nvarchar](1000) NULL,
	[Description] [nvarchar](max) NULL,
	[OriginPrice] FLOAT CONSTRAINT CHECK_OriginPrice_Product CHECK(OriginPrice >= 0),
	[SalePrice] FLOAT  CONSTRAINT CHECK_SalePrice_Product CHECK(SalePrice >= 0),
	[Discount] [float] NULL,
	[ProductImg] [varchar](max) NULL,
	[Quantity] [int] NULL,
	[ProductStatus] tinyint NULL,
	[BrandID] [int] CONSTRAINT FK_Product_BrandID FOREIGN KEY REFERENCES [Brand](BrandID) NOT NULL,
	[CategoryID] [int] CONSTRAINT FK_Product_categoryID FOREIGN KEY REFERENCES Category(categoryID) NOT NULL,
	[CPU] [nvarchar](50) NULL,
	[RAM] [nvarchar](50) NULL,
	[Capacity] [nvarchar](50) NULL,
	[GraphicCard] [nvarchar](50) NULL,
	[Display] [nvarchar](50) NULL
	)

	
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) PRIMARY KEY,
	[Username] [nvarchar](255) NULL,
	[Password] [varchar](255) NULL,
	firstName nvarchar(255) NOT NULL,
	lastName nvarchar(255) NOT NULL,	
	[Gender] [bit] NULL,
	[status] tinyint DEFAULT 1 CONSTRAINT CHECK_status_User CHECK([status] in (0,1)),
	[UserContactID_Favorite] [int]
	)

CREATE TABLE [dbo].[UserContact](
	[UserContactID] [int] IDENTITY(1,1) PRIMARY KEY,
	[UserID] [int] CONSTRAINT FK_UserContact_UserID FOREIGN KEY REFERENCES [User](UserID) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [varchar](15) NULL,
	[Address] [nvarchar](max) NULL,
	)

CREATE TABLE [dbo].[Admin](
	AdminID int IDENTITY(1,1) PRIMARY KEY, 
	AdminName nvarchar(255) UNIQUE,
	[password] varchar(255) NOT NULL,
	firstName nvarchar(255) NOT NULL,
	lastName nvarchar(255) NOT NULL,
	email varchar(255),
	phoneNumber varchar(15) UNIQUE,
	[address] nvarchar(255)
)

CREATE TABLE [dbo].[Feedback](
	[FeedbackID] [int] IDENTITY(1,1) PRIMARY KEY,
	[ProductID] [int] CONSTRAINT FK_Feedback_productID FOREIGN KEY REFERENCES Product(productID) NOT NULL,
	[UserID] [int] CONSTRAINT FK_Feedback_userID FOREIGN KEY REFERENCES [User](userID) NOT NULL,
	[Content] [varchar](max) NULL,
	[CreatedDate] [date] NULL
	)

CREATE TABLE [dbo].[Order](
    [OrderID] INT IDENTITY(1,1) PRIMARY KEY,
    [UserID] INT CONSTRAINT FK_Order_userID FOREIGN KEY REFERENCES [User](userID) NOT NULL,
    [OrderDate] DATE NULL,
    [Address] NVARCHAR(MAX) NULL,
    [Phone] VARCHAR(20) NULL,
    [TotalMoney] FLOAT NULL,
    [OrderNote] NVARCHAR(MAX) NULL,
    [OrderStatus] INT NULL,
	[amountCoupon] float
);


CREATE TABLE [dbo].[OrderDetail](
	OrderID int CONSTRAINT FK_OrderDetail_OrderID FOREIGN KEY REFERENCES [Order](OrderID) NOT NULL,	
	ProductID int CONSTRAINT FK_OrderDetail_productID FOREIGN KEY REFERENCES Product(productID) NOT NULL,
	[Quantity] [int] NULL,
	[Price] FLOAT NULL,
	Discount [float]
	)

CREATE TABLE [dbo].[Slider](
	[ID] [int] IDENTITY(1,1) PRIMARY KEY,
	[Img] [varchar](2500) NULL,
	[Title] [nvarchar](2500) NULL,
	[Description] [nvarchar](2500) NULL,
	[status] tinyint  
	)

CREATE TABLE [dbo].[Coupon](
	[ID] [int] IDENTITY(1,1) PRIMARY KEY,
	Code nvarchar(50),
	[Value] float,
	[Type] bit,
	[expirationDate] Date
)
----------------------------------------------------
GO
/* cập nhật hàng trong kho sau khi đặt hàng hoặc cập nhật */
CREATE TRIGGER trg_Order ON [OrderDetail] AFTER INSERT AS 
BEGIN
	UPDATE Product
	SET Product.Quantity = Product.Quantity - (
		SELECT quantity
		FROM inserted
		WHERE productID = Product.productID
	)
	FROM Product
	JOIN inserted ON Product.productID = inserted.productID
END
select * from [order]
-------------------------------------------------------------------------------------
GO
/* cập nhật hàng trong kho sau khi hủy đặt hàng status trong [order] bang 5*/
CREATE TRIGGER trg_CancelOrder ON [Order] AFTER UPDATE AS 
BEGIN
    IF UPDATE(OrderStatus)
    BEGIN
        IF EXISTS ( SELECT 1 FROM inserted WHERE OrderStatus = 5 )
        BEGIN
            UPDATE Product
            SET Product.Quantity = Product.Quantity + od.quantity
            FROM Product
            INNER JOIN OrderDetail od ON Product.productID = od.productID
            INNER JOIN deleted ON od.OrderID = deleted.orderID
            INNER JOIN inserted ON deleted.orderID = inserted.orderID
            WHERE inserted.OrderStatus = 5
        END
    END
END
-----------------------------------------------------
GO
--cap nhat status product khi status supplier thay doi
CREATE TRIGGER UpdateProductStatus
ON Brand
AFTER UPDATE
AS
BEGIN
    IF UPDATE(status)
    BEGIN
        DECLARE @NewStatus tinyint
        SELECT @NewStatus = [status] FROM inserted

        UPDATE Product
        SET ProductStatus = @NewStatus
        WHERE BrandID IN (SELECT BrandID FROM inserted)
    END
END