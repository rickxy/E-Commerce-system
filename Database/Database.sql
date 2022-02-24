
-- cerate all table here

--1


CREATE TABLE tblBrands(
	[BrandID] [int] IDENTITY(1,1) NOT NULL primary key,
	[Name] [nvarchar](500) NULL,
)
--2
CREATE TABLE tblCart(
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [int] NULL,
	[PID] [int] NULL,
	[PName] [nvarchar](max) NULL,
	[PPrice] [money] NULL,
	[PSelPrice] [money] NULL,
	[SubPAmount]  AS ([PPrice]*[Qty]),
	[SubSAmount]  AS ([PSelPrice]*[Qty]),
	[Qty] [int] NULL,
)

--3
 
CREATE TABLE tblCategory(
	[CatID] [int] IDENTITY(1,1) NOT NULL primary key,
	[CatName] [nvarchar](max) NULL,
)

---4
	CREATE TABLE tblSubCategory(
	[SubCatID] [int] IDENTITY(1,1) NOT NULL primary key,
	[SubCatName] [nvarchar](max) NULL,
	[MainCatID] [int] NULL,
CONSTRAINT [FK_tblSubCategory_tblCategory] FOREIGN KEY([MainCatID]) REFERENCES tblCategory ([CatID])
)
---------5

create table tblUsers
(
Uid int identity(1,1) primary key not null,
Username nvarchar(100)Null, 
Password nvarchar(100)Null,
Email nvarchar(100)Null,
Name nvarchar(100)Null,
Usertype nvarchar(50) default 'User'
)
insert into tblUsers Values('coderbaba','123','coderbaba@yahoo.com','Coder baba','Admin')
insert into tblUsers Values('user','123','user@yahoo.com','Userbabu','User')

select * from tblUsers

---------6
CREATE TABLE tblOrderProducts(
	[OrderProID] [int] IDENTITY(1,1) NOT NULL primary key,
	[OrderID] [nvarchar](50) NULL,
	[UserID] [int] NULL,
	[PID] [int] NULL,
	[Products] [nvarchar](max) NULL,
	[Quantity] [int] NULL,
	[OrderDate] [datetime] NULL,
	[Status] [nvarchar](100) NULL,
Constraint [FK_tblOrderProducts_ToTable] FOREIGN KEY ([UserID]) REFERENCES [tblUsers] ([uid])
)


---7
create table ForgotPass
(
Id nvarchar (500)  not null,
Uid int null,
RequestDateTime DATETIME null,
Constraint [FK_ForgotPass_tblUsers] FOREIGN KEY ([Uid]) REFERENCES [tblUsers] ([Uid])

)

---8
create table tblGender
(
GenderID int identity(1,1) primary key,
GenderName   nvarchar(MAX)

)


--9
CREATE TABLE tblOrders(
	[OrderID] [int] IDENTITY(1,1) NOT NULL primary key,
	[UserID] [int] NULL,
	[EMail] [nvarchar](max) NULL,
	[CartAmount] [money] NULL,
	[CartDiscount] [money] NULL,
	[TotalPaid] [money] NULL,
	[PaymentType] [nvarchar](50) NULL,
	[PaymentStatus] [nvarchar](50) NULL,
	[DateOfPurchase] [datetime] NULL,
	[Name] [nvarchar](200) NULL,
	[Address] [nvarchar](max) NULL,
	[MobileNumber] [nvarchar](50) NULL,
	[OrderStatus] [nvarchar](50) NULL,
	[OrderNumber] [nvarchar](50) NULL,
	Constraint [FK_tblOrders_ToTable] FOREIGN KEY ([UserID]) REFERENCES [tblUsers] ([uid])
)

--10

--CREATE TABLE tblProducts(
--	[PID] [int] IDENTITY(1,1) NOT NULL primary key,
--	[PName] [nvarchar](max) NULL,
--	[PPrice] [money] NULL,
--	[PSelPrice] [money] NULL,
--	[PBrandID] [int] NULL,
--	[PCategoryID] [int] NULL,
--	[PSubCatID] [int] NULL,
--	[PDescription] [nvarchar](max) NULL,
--	[FreeDelivery] [int] NULL,
--	[7DayRTN] [int] NULL,
--	[COD] [int] NULL
--)

select * from tblProducts
create table tblProducts
(
PID int identity(1,1) primary key ,
PName   nvarchar(MAX),
PPrice money,
PSelPrice money,
PBrandID int,
PCategoryID int,
PSubCatID int,
PGender int,

PDescription nvarchar(MAX),
PProductDetails nvarchar(MAX),
PMaterialCare  nvarchar(MAX),
FreeDelivery int,
[30DayRet]  int,
COD       int,
Constraint [FK_tblProducts_ToTable] FOREIGN KEY ([PBrandID]) REFERENCES [tblBrands] ([BrandID]),
Constraint [FK_tblProducts_ToTable1] FOREIGN KEY ([PCategoryID]) REFERENCES [tblCategory] ([CatID]),
Constraint [FK_tblProducts_ToTable2] FOREIGN KEY ([PSubCatID]) REFERENCES [tblSubCategory] ([SubCatID]),
Constraint [FK_tblProducts_ToTable3] FOREIGN KEY ([PGender]) REFERENCES [tblGender] ([GenderID])


)


---11
select * from tblProductImages
CREATE TABLE tblProductImages(
	[PIMGID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[Extention] [nvarchar](500) NULL,
	Constraint [FK_tblProductImages_ToTable] FOREIGN KEY ([PID]) REFERENCES [tblProducts] ([PID])
	)
	

---12

create table tblSizes
(
SizeID int identity(1,1) primary key,
SizeName   nvarchar(500),
BrandID int,
CategoryID int,
SubCategoryID int,
GenderID int,
Constraint [FK_tblSizes_ToBrand] FOREIGN KEY ([BrandID]) REFERENCES [tblBrands] ([BrandID]),
Constraint [FK_tblSizes_ToCat] FOREIGN KEY ([CategoryID]) REFERENCES [tblCategory] ([CatID]),
Constraint [FK_tblSizes_SubCat] FOREIGN KEY ([SubCategoryID]) REFERENCES [tblSubCategory] ([SubCatID]),
Constraint [FK_tblSizes_Gender] FOREIGN KEY ([GenderID]) REFERENCES [tblGender] ([GenderID])

)

---13

create table tblProductSizeQuantity
(
PrdSizeQuantID int identity(1,1) primary key,
PID int,
SizeID int,
Quantity int,
Constraint [FK_tblProductSizeQuantity_ToTable] FOREIGN KEY ([PID]) REFERENCES [tblProducts] ([PID]),
Constraint [FK_tblProductSizeQuantity_ToTable1] FOREIGN KEY ([SizeID]) REFERENCES [tblSizes] ([SizeID])
)

-----14
create table tblPurchase
(
PurchaseID int identity(1,1) primary key,
UserID int,
PIDSizeID nvarchar(MAX),
CartAmount money,
CartDiscount money,
TotalPayed money,
PaymentType nvarchar(50),
PaymentStatus nvarchar(50),
DateOfPurchase datetime,
Name nvarchar(200),
Address nvarchar(MAX),
PinCode nvarchar(10),
MobileNumber nvarchar(50),
CONSTRAINT [FK_tblPurchase_ToUser] FOREIGN KEY ([UserID]) REFERENCES [tblUsers]([UID])

)

-------------------------- stored procedure ----------------

---1
Create procedure sp_InsertProduct
(
@PName nvarchar(MAX),
@PPrice money,
@PSelPrice money,
@PBrandID int,
@PCategoryID int,
@PSubCatID int,
@PGender int,
@PDescription nvarchar(MAX),
@PProductDetails nvarchar(MAX),
@PMaterialCare nvarchar(MAX),
@FreeDelivery int,
@30DayRet int,
@COD int
)
AS

insert into tblProducts values(@PName,@PPrice,@PSelPrice,@PBrandID,@PCategoryID,
@PSubCatID,@PGender,@PDescription,@PProductDetails,@PMaterialCare,@FreeDelivery,
@30DayRet,@COD) 
select SCOPE_IDENTITY()
Return 0

---2
create procedure procBindAllProducts
AS
select A.*,B.*,C.Name ,A.PPrice-A.PSelPrice as DiscAmount,B.Name as ImageName, C.Name as BrandName from tblProducts A
inner join tblBrands C on C.BrandID =A.PBrandID
cross apply(
select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc
)B
order by A.PID desc

Return 0

---------3
create function getSizeName
   
   (
   @SizeID int
   )
   RETURNS Nvarchar(10)
   as
   Begin
   Declare @SizeName nvarchar(10)
 select @SizeName=SizeName from tblSizes where SizeID=@SizeID
 
   RETURN @SizeName
   
   End
   
   
   ---4
   
   CREATE PROCEDURE SP_BindAllProducts
AS
SELECT A.*, B.*,C.Name, A.PPrice-A.PSelPrice AS DiscAmount, B.Name AS ImageName, C.Name AS BrandName FROM tblProducts A
INNER JOIN tblBrands C ON C.BrandID = A.PBrandID
CROSS APPLY(
SELECT TOP 1 * FROM tblProductImages B WHERE B.PID = A.PID ORDER BY B.PID DESC
)B
ORDER BY A.PID DESC

---5

create PROCEDURE SP_BindCartNumberz
(
@UserID int
)
AS
SELECT * FROM tblCart D CROSS APPLY ( SELECT TOP 1 E.Name,Extention FROM tblProductImages E WHERE E.PID = D.PID) Name where D.UID = @UserID

---6

create PROCEDURE SP_BindCartProducts
(
@UID int
)
AS
SELECT PID FROM tblCart WHERE UID = @UID

---7
CREATE PROCEDURE SP_BindPriceData
(
@UserID int
)
AS
SELECT * FROM tblCart D CROSS APPLY ( SELECT TOP 1 E.Name,Extention FROM tblProductImages E WHERE E.PID = D.PID) Name where D.UID = @UserID

---8

CREATE PROCEDURE SP_BindProductDetails
(
@PID int
)
AS
SELECT * FROM tblProducts where PID = @PID

---9

create PROCEDURE SP_BindProductImages
(
@PID int
)
AS
SELECT * FROM tblProductImages where PID = @PID

---10
create PROCEDURE SP_BindUserCart
(
@UserID int
)
AS
SELECT * FROM tblCart D CROSS APPLY ( SELECT TOP 1 E.Name,Extention FROM tblProductImages E WHERE E.PID = D.PID) Name WHERE D.UID = @UserID

---11
CREATE PROCEDURE SP_DeleteThisCartItem
@CartID int
AS
BEGIN
DELETE FROM tblCart WHERE CartID = @CartID
END

---12
CREATE PROCEDURE SP_EmptyCart
@UserID int
AS
BEGIN
DELETE FROM tblCart WHERE UID = @UserID
END

---13

CREATE PROCEDURE SP_FindOrderNumber @FindOrderNumber nvarchar(100)
AS
SELECT * FROM tblOrders WHERE OrderNumber = @FindOrderNumber

---14

CREATE PROCEDURE SP_getUserCartItem
(
@PID int,
@UserID int
)
AS
SELECT * FROM tblCart WHERE PID = @PID AND UID = @UserID

---15

CREATE PROCEDURE SP_InsertCart
(
@UID int,
@PID int,
@PName nvarchar(MAX),
@PPrice money,
@PSelPrice money,
@Qty int
)
AS
INSERT INTO tblCart VALUES(@UID,@PID,@PName,@PPrice,@PSelPrice,@Qty)
SELECT SCOPE_IDENTITY()

---16

CREATE PROCEDURE SP_InsertOrder
(
@UserID int,
@Email nvarchar(MAX),
@CartAmount money,
@CartDiscount money,
@TotalPaid money,
@PaymentType nvarchar(50),
@PaymentStatus nvarchar(50),
@DateOfPurchase datetime,
@Name nvarchar(200),
@Address nvarchar(MAX),
@MobileNumber nvarchar(50),
@OrderStatus nvarchar(50),
@OrderNumber nvarchar(50)
)
AS
INSERT INTO tblOrders VALUES(@UserID,@Email,@CartAmount,@CartDiscount,@TotalPaid,@PaymentType,@PaymentStatus,@DateOfPurchase,@Name,@Address,@MobileNumber,@OrderStatus,@OrderNumber)
SELECT SCOPE_IDENTITY()


---17

CREATE PROCEDURE SP_InsertOrderProducts
(
@OrderID nvarchar(50),
@UserID int,
@PID int,
@Products nvarchar(MAX),
@Quantity int,
@OrderDate datetime,
@Status nvarchar(100)
)
AS
INSERT INTO tblOrderProducts VALUES (@OrderID,@UserID,@PID,@Products,@Quantity,@OrderDate,@Status)
SELECT SCOPE_IDENTITY()


----18

CREATE PROCEDURE SP_IsProductExistInCart
(
@PID int,
@UserID int
)
AS
SELECT * FROM tblCart where PID = @PID and UID = @UserID


----19

CREATE PROCEDURE SP_UpdateCart
(
@UserID int,
@CartPID int,
@Quantity int
)
AS
BEGIN
SET NOCOUNT ON;
UPDATE tblCart SET Qty = @Quantity WHERE PID = @CartPID AND UID = @UserID
END

go
-----------------------

------------
create procedure [dbo].[procBindAllProducts2]
AS
select A.*,B.*,C.Name ,A.PPrice-A.PSelPrice as DiscAmount,B.Name as ImageName, C.Name as BrandName 
from tblProducts A
inner join tblBrands C on C.BrandID =A.PBrandID
inner join tblCategory as t2 on t2.CatID=A.PCategoryID
cross apply(
select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc
)B where t2.CatName='Shirt' 
order by A.PID desc

Return 0

---------------

create procedure [dbo].[procBindAllProductsWomanTop]
AS
select A.*,B.*,C.Name ,A.PPrice-A.PSelPrice as DiscAmount,B.Name as ImageName, C.Name as BrandName 
from tblProducts A
inner join tblBrands C on C.BrandID =A.PBrandID
inner join tblCategory as t2 on t2.CatID=A.PCategoryID
cross apply(
select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc
)B where t2.CatName='Top' OR t2.CatName='Kurtas Kurtis'
order by A.PID desc

Return 0


---------------------------------

select * from tblBrands
insert into tblBrands values('BESPOQE ')
insert into tblBrands values('HIGHLANDER ')
insert into tblBrands values('FASHION DEPTH  ')
insert into tblBrands values('OOMPH ')
select * from tblCategory
INSERT into tblCategory values('TShirt')
INSERT into tblCategory values('Shirt')
INSERT into tblCategory values('Kurtas Kurtis')
INSERT into tblCategory values('Top')

select * from tblSubCategory
insert into tblSubCategory values('Casual',2)
insert into tblSubCategory values('Formal',2)
insert into tblSubCategory values('Kurtis',3)
insert into tblSubCategory values('Casual',4)
select * from tblGender
insert into tblGender values('Male')
insert into tblGender values('Female')

select * from tblProducts
insert into tblProducts values('BESPOQE  Men Regular Fit Solid Casual Shirt',1899.00,799.00,1,2,3,1,'For the best fit, buy one size larger than your usual size.','For the best fit, buy one size larger than your usual size.','For the best fit, buy one size larger than your usual size.',1,1,1)
insert into tblProducts values('HIGHLANDER  Men Slim Fit Checkered Spread Collar Casual Shirt',1299.00,546.00,2,2,1,1,'Product Details    Pack of  1  Style Code  HLSH010263  Fit  Slim  Fabric  Cotton Blend  Sleeve  Full Sleeve  Pattern  Checkered  Reversible  No  Collar  Spread  Color  Green, Black  Fabric Care  Gentle Machine Wash  Suitable For  Western Wear  Hem  Curved','100% cotton','100% cotton',1,1,1)
insert into tblProducts values('FASHION DEPTH  Women Embroidered Rayon Straight Kurta  (Pink)',1699.00,649.00,3,3,4,2,'Product Details    Ideal For  Women  Length Type  Calf Length  Brand Color  Pink  Occasion  Casual  Pattern  Embroidered  Type  Straight  Fabric  Rayon  Neck  Round Neck','Product Details    Ideal For  Women  Length Type  Calf Length  Brand Color  Pink  Occasion  Casual  Pattern  Embroidered  Type  Straight  Fabric  Rayon  Neck  Round Neck','100% cotton',1,1,1)
insert into tblProducts values('Oomph!  Casual Butterfly Sleeve Floral Print Women Multicolor Top',1330.00,450.00,4,4,5,2,'Casual Butterfly Sleeve Floral Print Women Multicolor Top','Product Details    Neck  Round Neck  Sleeve Style  Butterfly Sleeve  Fit  Relaxed  Fabric  Poly Crepe  Type  Regular Top  Belt Included  No  Pattern  Floral Print  Color  Multicolor','100% cotton',1,1,1)

select * from tblProductImages
insert into tblProductImages values(1,'BESPOQE  Men Regular Fit Solid Casual Shirt01','.jpeg')
insert into tblProductImages values(1,'BESPOQE  Men Regular Fit Solid Casual Shirt01','.jpeg')
insert into tblProductImages values(1,'BESPOQE  Men Regular Fit Solid Casual Shirt01','.jpeg')
insert into tblProductImages values(1,'BESPOQE  Men Regular Fit Solid Casual Shirt01','.jpeg')
insert into tblProductImages values(1,'BESPOQE  Men Regular Fit Solid Casual Shirt01','.jpeg')

insert into tblProductImages values(2,'HIGHLANDER  Men Slim Fit Checkered Spread Collar Casual Shirt01','.jpeg')
insert into tblProductImages values(2,'HIGHLANDER  Men Slim Fit Checkered Spread Collar Casual Shirt01','.jpeg')
insert into tblProductImages values(2,'HIGHLANDER  Men Slim Fit Checkered Spread Collar Casual Shirt01','.jpeg')
insert into tblProductImages values(2,'HIGHLANDER  Men Slim Fit Checkered Spread Collar Casual Shirt01','.jpeg')
insert into tblProductImages values(2,'HIGHLANDER  Men Slim Fit Checkered Spread Collar Casual Shirt01','.jpeg')

insert into tblProductImages values(3,'FASHION DEPTH  Women Embroidered Rayon Straight Kurta  (Pink)01','.jpeg')
insert into tblProductImages values(3,'FASHION DEPTH  Women Embroidered Rayon Straight Kurta  (Pink)01','.jpeg')
insert into tblProductImages values(3,'FASHION DEPTH  Women Embroidered Rayon Straight Kurta  (Pink)01','.jpeg')
insert into tblProductImages values(3,'FASHION DEPTH  Women Embroidered Rayon Straight Kurta  (Pink)01','.jpeg')
insert into tblProductImages values(3,'FASHION DEPTH  Women Embroidered Rayon Straight Kurta  (Pink)01','.jpeg')

insert into tblProductImages values(4,'Oomph!  Casual Butterfly Sleeve Floral Print Women Multicolor Top01','.jpeg')
insert into tblProductImages values(4,'Oomph!  Casual Butterfly Sleeve Floral Print Women Multicolor Top01','.jpeg')
insert into tblProductImages values(4,'Oomph!  Casual Butterfly Sleeve Floral Print Women Multicolor Top01','.jpeg')
insert into tblProductImages values(4,'Oomph!  Casual Butterfly Sleeve Floral Print Women Multicolor Top01','.jpeg')
insert into tblProductImages values(4,'Oomph!  Casual Butterfly Sleeve Floral Print Women Multicolor Top01','.jpeg')
select * from tblProductSizeQuantity
insert into tblProductSizeQuantity values(1,1,10)
insert into tblProductSizeQuantity values(2,3,12)
insert into tblProductSizeQuantity values(3,4,12)
insert into tblProductSizeQuantity values(4,5,10)
select * from tblPurchase
select * from tblSizes
insert into tblSizes values('Large',1,2,1,1)
insert into tblSizes values('Small',2,2,1,1)
insert into tblSizes values('Large',2,2,1,1)
insert into tblSizes values('Large',3,3,4,2)
insert into tblSizes values('Large',4,4,5,2)
select * from tblUsers




-------------------------

create procedure [dbo].[procBindAllProducts3]
AS
select A.*,B.*,C.Name ,A.PPrice-A.PSelPrice as DiscAmount,B.Name as ImageName, C.Name as BrandName 
from tblProducts A
inner join tblBrands C on C.BrandID =A.PBrandID
inner join tblCategory as t2 on t2.CatID=A.PCategoryID
cross apply(
select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc
)B where t2.CatName='Pants' or t2.CatName='Jeans'
order by A.PID desc

Return 0

------

create procedure [dbo].[procBindAllProducts4]
AS
select A.*,B.*,C.Name ,A.PPrice-A.PSelPrice as DiscAmount,B.Name as ImageName, C.Name as BrandName 
from tblProducts A
inner join tblBrands C on C.BrandID =A.PBrandID
inner join tblCategory as t2 on t2.CatID=A.PCategoryID
cross apply(
select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc
)B where t2.CatName='Jeans' or t2.CatName='Denim Jeans'or t2.CatName='Pants'
order by A.PID desc

Return 0

-------------

create procedure [dbo].[procBindAllProducts4]
AS
select A.*,B.*,C.Name ,A.PPrice-A.PSelPrice as DiscAmount,B.Name as ImageName, C.Name as BrandName 
from tblProducts A
inner join tblBrands C on C.BrandID =A.PBrandID
inner join tblCategory as t2 on t2.CatID=A.PCategoryID
cross apply(
select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc
)B where t2.CatName='Jeans' 
order by A.PID desc

Return 0

-----------------

create procedure [dbo].[procBindAllProducts5]
AS
select A.*,B.*,C.Name ,A.PPrice-A.PSelPrice as DiscAmount,B.Name as ImageName, C.Name as BrandName 
from tblProducts A
inner join tblBrands C on C.BrandID =A.PBrandID
inner join tblCategory as t2 on t2.CatID=A.PCategoryID
cross apply(
select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc
)B where t2.CatName='Leggings' or t2.CatName='Leggings Western Wear'
order by A.PID desc

Return 0

-------------

create procedure [dbo].[procBindAllProducts6]
AS
select A.*,B.*,C.Name ,A.PPrice-A.PSelPrice as DiscAmount,B.Name as ImageName, C.Name as BrandName 
from tblProducts A
inner join tblBrands C on C.BrandID =A.PBrandID
inner join tblCategory as t2 on t2.CatID=A.PCategoryID
cross apply(
select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc
)B where t2.CatName='SAREES' 
order by A.PID desc

Return 0

----------------------




