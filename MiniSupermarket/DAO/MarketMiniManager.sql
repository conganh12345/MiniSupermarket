--Tao database
IF EXISTS (
    SELECT name FROM sys.databases 
    WHERE name = N'MarketMiniManager'
)
Drop database MarketMiniManager

Create database MarketMiniManager
GO
use MarketMiniManager
GO

--Tao bang loai san pham
create table ProductType(
	TypeID varchar(10) not null,
	[Name] nvarchar(50) not null,
	isDeleted tinyint not null default(1),
	primary key (TypeID)
)
GO

-- Rot du lieu vao bang loai san pham
insert into ProductType(TypeID,Name)
values 
	('PT0001',N'Mì'),
	('PT0002',N'Sữa'),
	('PT0003',N'Bánh')
GO

--Tao bang nhan vien
create table Employee(
	EmployeeID varchar(10) not null,
	[Name] nvarchar(50) not null,
	[Address] nvarchar(50) not null,
	PhoneNumber varchar(50) not null,
	Email varchar(50) not null,
	Sex nvarchar(10) not null,
	UserName varchar(50) not null,
	[Password] varchar(50) not null,
	BirthDate DATE,
	isDeleted tinyint not null default(1),
	primary key (EmployeeID)
)
GO

-- Rot du lieu vao bang nhan vien
insert into Employee(EmployeeID,Name,Password,Sex,BirthDate,PhoneNumber,Email,Address,UserName)
values
	('E0001',N'Nguyễn Văn A','1',N'Nam','2003-01-01','0912312371','NguyenVanA@gmail.com',N'123 An Dương Vương, Phường 3, Quận 2, TPHCM','admin'),
	('E0002',N'Nguyễn Văn B','1',N'Nữ','2003-02-15','0914736281','NguyenVanB@gmail.com',N'456 Hoàng Hoa Thám, Phường 1, Quận Bình Tân, TPHCM','E0002'),
	('E0003',N'Nguyễn Văn C','1',N'Nam','2003-08-30','0936271371','NguyenVanC@gmail.com',N'789 Nam Kỳ Khởi Nghĩa, Phường 9, Quận 8, TPHCM','E0003')
GO

--Tao bang san pham
create table Product(
	ProductID varchar(10) not null,
	[Name] nvarchar(50) not null,
	TypeID varchar(10) not null,
	Quantity int not null,
	CurrentPrice float(50) not null,
	[Description] nvarchar(100),
	Unit nvarchar(20) not null,
	PromotionID varchar(10),
	isDeleted tinyint not null default(1),
	
	primary key (ProductID)
)
GO

-- Rot du lieu bang san pham	
insert into Product(ProductID,[Name],TypeID,Quantity,CurrentPrice,[Description],Unit,PromotionID)
values
	('P0001',N'Mì Kokomi','PT0001',100,2000,N'Mì Kokomi tôm chua cay 100g',N'Gói','PM0001'),
	('P0002',N'Sữa Milo','PT0002',100,4000,N'Sữa Milo vị ca cao lúa mạch 100ml',N'Hộp','PM0001'),
	('P0003',N'Bánh Slay','PT0003',100,9000,N'Bánh Slay khoai tây chiên vị tảo',N'Gói','PM0002'),
	('P0004',N'Mì Hảo hảo','PT0001',100,2500,N'Mì hảo hảo lẩu thái tôm',N'Gói','PM0003')
GO

--Tao bang khuyen mai
create table Promotion(
	PromotionID varchar(10) not null,
	[Name] nvarchar(50) not null,
	StartDate datetime not null,
	EndDate datetime not null,
	Discount float(50) not null,
	[Status] nvarchar(50) not null,
	isDeleted tinyint not null default(1),
	primary key (PromotionID)
)
GO

-- Rot du lieu vao bang khuyen mai
INSERT INTO Promotion (PromotionID, [Name], StartDate, EndDate, Discount, [Status])
VALUES
    ('PM0001', N'Khuyến mãi giờ vàng', '2023-9-24', '2023-11-24', 10,N'Đang hoạt động'),
    ('PM0002', N'Khuyến mãi lễ 2/9', '2023-08-30', '2023-09-03', 20, N'Không hoạt động'),
    ('PM0003', N'Khuyến mãi điểm tích luỹ', '2023-03-01', '2040-03-01', 10, N'Không hoạt động');
GO

--Tao bang khach hang
create table Customer(
	CustomerID varchar(10) not null,
	[Name] nvarchar(50) not null,
	PhoneNumber varchar(50) not null,
	Sex nvarchar(10) not null,
	Point int default(0),
	isDeleted tinyint not null default(1),
	primary key (CustomerID)
)
GO

-- Rot du lieu vao bang khach hang
INSERT INTO Customer (CustomerID, [Name], PhoneNumber, Sex)
VALUES
    ('C0001', N'Trần Thị D', '0123456789', N'Nữ'),
    ('C0002', N'Lê Hữu E', '09876543321', N'Nam'),
    ('C0003', N'Võ Thị Vân F', '0206521773', N'Nữ');
GO

--Tao bang hoa don
create table Bill(
	BillID varchar(10) not null,
	[Date] datetime not null,
	EmployeeID varchar(10) not null,
	CustomerID varchar(10),
	EstimatedPrice float(50) not null default(0),
	ReducePrice float(50) not null default(0),
	TotalPrice float(50) not null default(0),
	[Status] tinyint not null default(0),
	isDeleted tinyint not null default(1),
	primary key(BillID)
)
GO


-- Rot du lieu vao bang hoa don
INSERT INTO Bill (BillID, [Date], EmployeeID, CustomerID, EstimatedPrice, ReducePrice, TotalPrice, [Status])
VALUES
    ('B0001', '2023-09-23', 'E0001', 'C0001', 100.0, 0, 100.0, 0),
    ('B0002', '2023-09-23', 'E0002', 'C0002', 200.0, 0, 200.0, 0),
    ('B0003', '2023-09-23', 'E0003', 'C0003', 300.0, 0, 300.0, 1);
GO

--Tao bang nha cung cap
create table Supplier(
	SupplierID varchar(50) not null,
	[Name] nvarchar(50) not null,
	[Address] nvarchar(100) not null,
	PhoneNumber varchar(50) not null,
	Email varchar(50) not null,
	isDeleted tinyint not null default(1),
	primary key (SupplierID)
)
GO

-- Rot du lieu vao bang nha cung cap
INSERT INTO Supplier (SupplierID, Name, Address, PhoneNumber, Email)
VALUES
    ('S0001', N'Kokomi', N'135 Lê Đại Hành, Phường 4, Quận 7, TPHCM', '0803174618', 'Kokomi135@gmail.com'),
    ('S0002', N'Milo', N'246 Ông Ích Khiêm, Phường 5, Quận 11, TPHCM', '06941273221', 'Milo246@gmail.com'),
    ('S0003', N'Slay', N'879 Luỹ Bán Bích, Phường 6, Quận 5, TPHCM', '0943866248', 'Slay879@gmail.com')
GO

--Tao bang phieu nhap
create table PurchaseOrder(
	OrderID varchar(10) not null,
	EmployeeID varchar(10) not null,
	SupplierID varchar(50) not null,
	importDate datetime not null,
	TotalPrice float(50) not null,
	[Status] tinyint not null default(0),
	isDeleted tinyint not null default(1),
	primary key(OrderID)
)
GO

-- Rot du lieu vao bang phieu nhap
INSERT INTO PurchaseOrder (OrderID, EmployeeID, SupplierID, importDate, TotalPrice)
VALUES
    ('PO0001', 'E0001', 'S0001', '2023-01-01', 10000000),
    ('PO0002', 'E0002', 'S0002', '2023-02-01', 20000000),
    ('PO0003', 'E0003', 'S0003', '2023-03-01', 30000000);
GO

--Tao bang chi tiet hoa don
create table DetailBill(
	BillID varchar(10) not null,
	ProductID varchar(10) not null,
	OrderID varchar(10) not null,
	SalePrice float(50) not null,
	Quantity int not null,
	primary key (BillID,ProductID,OrderID)
)
GO

-- Rot du lieu vao bang chi tiet hoa don
INSERT INTO DetailBill (BillID, ProductID, OrderID, SalePrice, Quantity)
VALUES
    ('B0001', 'P0001', 'PO0001', 3000, 1),
    ('B0002', 'P0002', 'PO0002', 5000, 2),
    ('B0003', 'P0003', 'PO0003', 10000, 3)
GO

-- Tao bang chi tiet phieu nhap
create table DetailPurchaseOrder(
	ProductID varchar(10) not null,
	OrderID varchar(10) not null,
	Quantity int not null,
	PurchasePrice float(50) not null,
	primary key (ProductID,OrderID)
)
GO

-- Rot du lieu vao bang chi tiet phieu nhap
INSERT INTO DetailPurchaseOrder (ProductID, OrderID, Quantity, PurchasePrice)
VALUES
    ('P0001', 'PO0001', 100, 2000),
    ('P0002', 'PO0002', 100, 4000),
    ('P0003', 'PO0003', 100, 9000);
GO

--Tao bang san pham ma nha cung cap cung cap
create table SupplierProduct(
	SupplierID varchar(50) not null,
	ProductID varchar(10) not null,
	SupplyStartDate datetime not null,
	primary key (SupplierID,ProductID)
)
GO

-- Rot du lieu vao bang san pham ma nha cung cap cung cap
INSERT INTO SupplierProduct (SupplierID, ProductID, SupplyStartDate)
VALUES
    ('S0001', 'P0001', '2023-01-01'),
    ('S0002', 'P0002', '2023-02-01'),
    ('S0003', 'P0003', '2023-03-01');
GO

--Tao bang hang ton kho
create table Inventory(
	ProductID varchar(10) not null,
	OrderID varchar(10) not null,
	CurrentQuantity int not null,
	isDisplayed tinyint not null default(1),
	primary key (OrderID,ProductID)
)
GO

--Rot du lieu vao bang hang ton kho
--INSERT INTO Inventory (ProductID, OrderID, CurrentQuantity)
--VALUES
    --('P0001', 'PO0001', 100),
    --('P0002', 'PO0002', 100),
    --('P0003', 'PO0003', 100);
--GO

--Tao bang quan ly quyen
create table [Role](
	RoleID varchar(10) not null,
	[Name] nvarchar(50) not null,
	[Description] nvarchar(100),
	isDeleted tinyint not null default(1),
	primary key (RoleID)
)
GO

--Rot du lieu vao bang quan ly quyen
INSERT INTO Role (RoleID, Name, Description)
VALUES
    ('R0001', N'Admin', N'Cho phép thực hiện đa số chức năng của hệ thống trừ bán hàng.'),
    ('R0002', N'Nhân viên bán hàng', N'Cho phép Quản lý bán hàng, quản lý khách hàng và sản phẩm.'),
    ('R0003', N'Nhân viên thủ kho', N'Cho phép quản lý kho như nhập, xuất hàng tồn kho.');
GO

-- Tao ban chuc nang cho quyen
create table Functions(
	FunctionID varchar(10) not null,
	[Name] nvarchar(50) not null,
	[Description] nvarchar(100),
	primary key (FunctionID)
)
GO

--Rot du lieu cho bang chuc nang cho quyền
INSERT INTO Functions (FunctionID, Name, Description)
VALUES
    ('F0001', N'Quản lý sản phẩm', N'Tham gia quản lý sản phẩm như thêm, xoá,... sản phẩm.'),
    ('F0002', N'Quản lý loại sản phẩm', N'Quản lý loại sản phẩm.'),
    ('F0003', N'Quản lý khách hàng', N'Tham gia quản lý thông tin khách hàng.'),
    ('F0004', N'Quản lý nhập hàng', N'Tham gia quản lý nhập hàng.'),
    ('F0005', N'Quản lý bán hàng', N'Tham gia bán hàng như tạo hoá đơn và thanh toán.'),
    ('F0006', N'Quản lý nhân viên', N'Tham gia quản lý thông tin nhân viên và tạo tài khoản.'),
    ('F0007', N'Quản lý quyền', N'Tham gia quản lý quyền.'),
    ('F0008', N'Quản lý chương trình khuyến mãi', N'Tham gia quản lý chương trình khuyến mãi.'),
    ('F0009', N'Quản lý nhà cung cấp', N'Tham gia quản lý thông tin nhà cung cấp.'),
    ('F0010', N'Thống kê', N'Thống kê.');
GO

-- Tao bang quyen cua nhan vien
create table EmployeeRole(
	EmployeeID varchar(10) not null,
	RoleID varchar(10) not null,
	primary key(EmployeeID,RoleID)
)
GO

-- Rot du lieu cho bang quyen cua nhan vien
INSERT INTO EmployeeRole (EmployeeID, RoleID)
VALUES
    ('E0001', 'R0001'),
    ('E0002', 'R0002'),
    ('E0003', 'R0003');
GO

-- Tao bang chuc nang cho quyen quyen nhan vien
create table RoleFunction(
	RoleID varchar(10) not null,
	FunctionID varchar(10) not null,
	primary key(FunctionID,RoleID)
)
GO

--Rot du lieu vao bang chuc nang cho quyen cua nhan vien
INSERT INTO RoleFunction (RoleID, FunctionID)
VALUES
    ('R0001', 'F0006'),
    ('R0001', 'F0007'),
    ('R0001', 'F0008'),
    ('R0001', 'F0010'),
    ('R0002', 'F0001'),
    ('R0002', 'F0002'),
    ('R0002', 'F0003'),
    ('R0002', 'F0005'),
    ('R0003', 'F0004'),
    ('R0003', 'F0009');
GO

--Them khoa ngoai cho tung bang
--Bang san pham
alter table Product
add constraint fk_Product_ProductType foreign key (TypeID) references ProductType (TypeID)
GO
alter table Product
add constraint fk_Product_Promotion foreign key (PromotionID) references Promotion (PromotionID)
GO

--Bang Bill
alter table Bill
add constraint fk_Bill_Customer foreign key (CustomerID) references Customer (CustomerID)
GO
alter table Bill
add constraint fk_Bill_Employee foreign key (EmployeeID) references Employee (EmployeeID)
GO

--Bang phieu nhap
alter table PurchaseOrder
add constraint fk_PurchaseOrder_Supplier foreign key (SupplierID) references Supplier (SupplierID)
GO
alter table PurchaseOrder
add constraint fk_PurchaseOrder_Employee foreign key (EmployeeID) references Employee (EmployeeID)
GO

--Bang Chi tiet hoa don
alter table DetailBill
add constraint fk_DetailBill_PurchaseOrder foreign key (OrderID) references PurchaseOrder (OrderID)
GO
alter table DetailBill
add constraint fk_DetailBill_Product foreign key (ProductID) references Product (ProductID)
GO
alter table DetailBill
add constraint fk_DetailBill_Bill foreign key (BillID) references Bill (BillID)
GO

--Bang chi tiet phieu nhap
alter table DetailPurchaseOrder
add constraint fk_DetailPurchaseOrder_PurchaseOrder foreign key (OrderID) references PurchaseOrder (OrderID)
GO
alter table DetailPurchaseOrder
add constraint fk_DetailPurchaseOrder_Product foreign key (ProductID) references Product (ProductID)
GO

--Bang San pham ma nha cung cap cung cap
alter table SupplierProduct
add constraint fk_SupplierProduct_Supplier foreign key (SupplierID) references Supplier (SupplierID)
GO
alter table SupplierProduct
add constraint fk_SupplierProduct_Product foreign key (ProductID) references Product (ProductID)
GO

--Bang ton kho
alter table Inventory
add constraint fk_Inventory_PurchaseOrder foreign key (OrderID) references PurchaseOrder (OrderID)
GO
alter table Inventory
add constraint fk_Inventory_Product foreign key (ProductID) references Product (ProductID)
GO

-- Bang quyen cua nhan vien
alter table EmployeeRole
add constraint fk_EmployeeRole_Employee foreign key (EmployeeID) references Employee (EmployeeID)
GO
alter table EmployeeRole
add constraint fk_EmployeeRole_Role foreign key (RoleID) references Role (RoleID)
GO

-- bang chuc nang cua quyen
alter table RoleFunction
add constraint fk_RoleFunction_Role foreign key (RoleID) references Role (RoleID)
GO
alter table RoleFunction
add constraint fk_RoleFunction_Functions foreign key (FunctionID) references Functions (FunctionID)
GO

-- Tạo các procedures

-- Thien ======================================================================================================

-- Select * from ProductType
CREATE PROCEDURE SelectAllFromProductType
AS
BEGIN
    SELECT TypeID, [Name] FROM ProductType Where isDeleted = 1
END;
GO

-- Insert Into ProductType
CREATE PROCEDURE InsertIntoProductType
    @TypeID varchar(10),
	@Name nvarchar(50)
AS
BEGIN
    INSERT INTO ProductType(TypeID, [Name])
    VALUES (@TypeID, @Name)
END;
GO

-- Delete ProductType
CREATE PROCEDURE DeleteProductType
    @TypeID varchar(10)
AS
BEGIN
	UPDATE ProductType SET isDeleted = 0 WHERE TypeID = @TypeID
END;
GO

-- Update ProductType
CREATE PROCEDURE UpdateProductType
    @TypeID varchar(10),
	@Name nvarchar(50)
AS
BEGIN
	UPDATE ProductType SET [Name] = @Name WHERE TypeID = @TypeID
END;
GO

-- Đếm số account
CREATE PROCEDURE CountAccount
    @userName varchar(50),
    @Password varchar(50)
AS
BEGIN
    SELECT COUNT(*) FROM Employee
    WHERE UserName COLLATE SQL_Latin1_General_CP1_CS_AS = @userName 
    AND [Password] = @Password
END;
GO


-- Lấy các chức năng từ account
CREATE PROCEDURE SelectFunctionNameFromAccount
    @userName varchar(50),
	@Password varchar(50)
AS
BEGIN
	SELECT Functions.[Name]
	FROM Employee, EmployeeRole, [Role], RoleFunction, Functions
    Where Employee.EmployeeID = EmployeeRole.EmployeeID 
	AND EmployeeRole.RoleID = [Role].RoleID
    AND [Role].RoleID = RoleFunction.RoleID
    AND RoleFunction.FunctionID = Functions.FunctionID
    AND UserName = @userName AND [Password] = @Password
    AND Employee.IsDeleted = 1
END;
GO

-- Lấy thông tin tài khoản từ username
CREATE PROCEDURE SelectInfoFromAccount
    @userName varchar(50)
AS
BEGIN
	SELECT EmployeeID, [Name], [Address], PhoneNumber, Email
    FROM Employee Where UserName = @userName
    AND Employee.IsDeleted = 1
END;
GO

-- Cập nhật thông tin tài khoản
CREATE PROCEDURE UpdateAccountInfor
    @EmployeeId varchar(10),
	@address nvarchar(50),
	@phone varchar(50),
	@email varchar(50)
AS
BEGIN
	UPDATE Employee SET [Address] = @address, PhoneNumber = @phone, Email = @email
    WHERE EmployeeID = @EmployeeId
END;
GO

-- Cập nhật mật khẩu tài khoản
CREATE PROCEDURE UpdateAccountPassword
    @EmployeeId varchar(10),
	@Password varchar(50)
AS
BEGIN
	UPDATE Employee SET Password = @Password
    WHERE EmployeeID = @EmployeeId
END;
GO

-- Lấy tất cả thông tin hóa đơn
CREATE PROCEDURE SelectAllBills
AS
BEGIN
	SELECT Bill.BillID, Bill.[Date], Bill.EmployeeID,
    Employee.[Name] AS EmployeeName, Bill.CustomerID,
    Customer.[Name] AS CustomerName, 
    Bill.EstimatedPrice, Bill.ReducePrice, Bill.TotalPrice, Bill.[Status], Bill.isDeleted
	FROM Bill INNER JOIN Employee
	ON Bill.EmployeeID = Employee.EmployeeID LEFT JOIN Customer
	ON Bill.CustomerID = Customer.CustomerID
END;
GO
--Lấy tất cả thông tin nhà cung cấp
CREATE PROCEDURE SelectAllSupplier
AS
BEGIN
	SELECT 
	Supplier.SupplierID AS ID,
	Supplier.[Name] AS TÊN ,
	Supplier.[Address] [Địa chỉ],
	Supplier.PhoneNumber AS [Số điện thoại],
	Supplier.Email
	FROM Supplier 
	WHERE Supplier.isDeleted=1;
END;
GO
--Lấy thông tin chi tiết nhà cung cấp
Create PROCEDURE SelectAllSupplierDetail
	@ID varchar(10)
AS
BEGIN
	SELECT
	SupplierProduct.ProductID AS ID,
	SupplierProduct.SupplyStartDate AS [Ngày nhập],
	Product.[Name],
	Product.CurrentPrice

	FROM 
	(Supplier INNER JOIN SupplierProduct ON Supplier.SupplierID =SupplierProduct.SupplierID) INNER JOIN 
	Product ON SupplierProduct.ProductID=Product.ProductID

	WHERE SupplierProduct.SupplierID=@ID
END;
GO
--Tìm thông tin theo ID nhà cung cấp
Create PROCEDURE FindSupplierWithID
	@ID varchar(10)
AS
BEGIN
	SELECT
	Supplier.SupplierID AS ID,
	Supplier.[Name] AS TÊN ,
	Supplier.[Address] [Địa chỉ],
	Supplier.PhoneNumber AS [Số điện thoại],
	Supplier.Email
	FROM Supplier 
	WHERE Supplier.SupplierID=@ID
END;
GO
--Thêm nhà cung cấp 
CREATE PROCEDURE AddSupplier
	@ID varchar(50),
	@Name nvarchar(50),
	@Address nvarchar(50),
	@PhoneNumber varchar(50),
	@Email varchar(50),
	@ProductID varchar(10),
	@Date datetime

AS
BEGIN
	INSERT INTO Supplier(SupplierID,[Name],[Address],PhoneNumber,Email)
	VALUES 
		(@ID,@Name,@Address,@PhoneNumber,@Email)
	INSERT INTO SupplierProduct(SupplierID,ProductID,SupplyStartDate)
	VALUES
		(@ID,@ProductID,@Date)

END;
GO
--Xóa nhà cung cấp
Create PROCEDURE DelSupplier
	@ID varchar(10)
AS
BEGIN
	DELETE FROM SupplierProduct
	WHERE SupplierID=@ID
	DELETE FROM Supplier
	WHERE SupplierID=@ID
	
END;
GO
--Lấy thông tin sản phẩm
CREATE PROCEDURE AllProduct
AS
BEGIN
	SELECT 
	Product.ProductID AS ID,
	Product.[Name] AS Tên,
	Product.TypeID AS Loại,
	Product.CurrentPrice AS Giá
	FROM Product
	WHERE Product.isDeleted=1;
END;
GO

-- Lấy mã KH và tên KH
CREATE PROCEDURE SelectCustomerIdAndName
AS
BEGIN
	SELECT CustomerID, [Name]
	FROM Customer
    WHERE isDeleted = 1
END;
GO

-- Thêm một bill mới
CREATE PROCEDURE InsertIntoBill
	@BillID varchar(10),
	@Date datetime,
	@EmployeeID varchar(10),
	@CustomerID varchar(10) = NULL
AS
BEGIN
	INSERT INTO Bill(BillID, [Date], EmployeeID, CustomerID)
	VALUES (@BillID, @Date, @EmployeeID, @CustomerID)
END;
GO

-- Thêm khách hàng cho hóa đơn
CREATE PROC InsertCustomerSale
	@CustomerID varchar(10),
	@Name nvarchar(50),
	@PhoneNumber varchar(50),
	@Sex nvarchar(10)
AS
BEGIN
	INSERT INTO Customer(CustomerID, [Name], PhoneNumber, Sex)
	VALUES (@CustomerID, @Name, @PhoneNumber, @Sex)
END;
GO

-- Xóa hóa đơn
CREATE PROC DeleteBill
	@BillID varchar(10)
AS
BEGIN
	UPDATE Bill
	SET Bill.isDeleted = 0
	WHERE BillID = @BillID AND isDeleted = 1
END;
GO

-- Thien ======================================================================================================


--========= Đại ==========
---------------------------------------------------Chương trình khuyến mãi và chi tiết chương trình khuyến mãi----------------------------------------------------

-- Đại
-- Lấy tất cả thông tin chương trình khuyến mãi
CREATE PROC SelectAllPromotions
AS
BEGIN
	SELECT Promotion.PromotionID AS ID, Promotion.Name, Promotion.StartDate,
	Promotion.EndDate, Promotion.Discount, Promotion.[Status]
	FROM Promotion
	WHERE Promotion.isDeleted = 1
END;
GO

-- Thêm chương trình khuyến mãi
CREATE PROC InsertPromotion
	@PromotionID varchar(10),
	@Name nvarchar(50),
	@StartDate datetime,
	@EndDate datetime,
	@Discount float(50)
AS
BEGIN
	INSERT INTO Promotion(PromotionID,[Name],StartDate,EndDate,Discount,[Status])
	VALUES (@PromotionID,@Name,@StartDate,@EndDate,@Discount,N'Không hoạt động')
END;
GO

-- Sửa thông tin chương trình khuyến mãi
CREATE PROC UpdatePromotion
	@PromotionID varchar(10),
	@Name nvarchar(50),
	@StartDate datetime,
	@EndDate datetime,
	@Discount float(50)
AS
BEGIN
	UPDATE Promotion SET Name = @Name, StartDate = @StartDate, EndDate = @EndDate, Discount = @Discount
	WHERE PromotionID = @PromotionID
END;
GO

-- Xoá chương trình khuyến mãi
CREATE PROC DeletePromotion
	@PromotionID varchar(10)
AS
BEGIN
	UPDATE Promotion SET isDeleted = '0'
	WHERE PromotionID = @PromotionID
END;
GO

-- Áp dụng chương trình khuyến mãi
CREATE PROC StartWork
	@PromotionID varchar(10)
AS
BEGIN
	UPDATE Promotion SET [Status] = N'Đang hoạt động'
	WHERE PromotionID = @PromotionID
END;
GO

-- Ngưng áp dụng chương trình khuyến mãi
CREATE PROC StopWork
	@PromotionID varchar(10)
AS
BEGIN
	UPDATE Promotion SET [Status] = N'Không hoạt động'
	WHERE PromotionID = @PromotionID
END;
GO

-- Tải danh sách sản phẩm cho chương trình khuyến mãi (danh sách chọn)
CREATE PROC SelectProductToPromotion
	@PromotionID varchar(10)
AS
BEGIN
	SELECT ProductID, P.[Name], PT.Name, PromotionID, [Description]
	FROM Product P, ProductType PT
	WHERE (PromotionID != @PromotionID and P.TypeID = PT.TypeID and P.isDeleted = '1') or PromotionID is null
END;
GO

-- Tải danh sách sản phẩm cho chương trình khuyến mãi (danh sách đã chọn)
CREATE PROC SelectProductToPromotionApply
	@PromotionID varchar(10)
AS
BEGIN
	SELECT ProductID, P.[Name], PT.Name, [Description]
	FROM Product P, ProductType PT
	WHERE PromotionID = @PromotionID and P.isDeleted = '1' and P.TypeID = PT.TypeID
END;
GO

-- Xoá sản phẩm khuyến mãi khỏi danh sách chi tiết khuyến mãi
CREATE PROC DeleteProductFromPromotionProduct
	@ProductID varchar(10)
AS
BEGIN
	UPDATE Product SET PromotionID = null
	WHERE ProductID = @ProductID
END;
GO

-- Thêm sản phẩm vào danh sách chi tiết khuyến mãi
CREATE PROC AddProductToPromotionProduct
	@ProductID varchar(10),
	@PromotionID varchar(10)
AS
BEGIN
	UPDATE Product SET PromotionID = @PromotionID
	WHERE ProductID = @ProductID
END;
GO

-- Lấy mã chương trình khuyến mãi trong danh sách
CREATE PROC GetPromotionIDFromProductID
	@ProductID varchar(10)
AS
BEGIN
	SELECT PromotionID
	FROM Product
	WHERE ProductID = @ProductID
END;
GO

-- Tìm kiếm chương trình khuyến mãi theo mã CTKM
CREATE PROC SearchPromotionByID
	@PromotionID varchar(10)
AS
BEGIN
	SELECT PM.PromotionID AS ID, PM.Name, PM.StartDate,
	PM.EndDate, PM.Discount, PM.[Status]
	FROM Promotion PM
	WHERE PM.isDeleted = 1 and PM.PromotionID like '%'+@PromotionID+'%'
END;
GO

-- Tìm kiếm chương trình khuyến mãi theo tên CTKM
CREATE PROC SearchPromotionByName
	@PromotionName nvarchar(50)
AS
BEGIN
	SELECT PM.PromotionID AS ID, PM.Name, PM.StartDate,
	PM.EndDate, PM.Discount, PM.[Status]
	FROM Promotion PM
	WHERE PM.isDeleted = 1 and PM.Name like '%'+@PromotionName+'%'
END;
GO

CREATE PROC ClearAllProductsFromPromotion
	@PromotionID varchar(10)
AS
BEGIN
	UPDATE Product SET PromotionID = null WHERE PromotionID = @PromotionID
END;
GO

----------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------Phiếu nhập và chi tiết phiếu nhập----------------------------------------------------
-- Lấy danh sách phiếu nhập
CREATE PROC SelectAllPurchaseOrder
AS
BEGIN
	SELECT OrderID, E.Name, S.Name, PO.importDate, PO.TotalPrice, PO.Status
	FROM PurchaseOrder PO, Employee E, Supplier S
	WHERE PO.EmployeeID = E.EmployeeID and PO.SupplierID = S.SupplierID and PO.isDeleted = '1'
END;
GO

-- Tạo phiếu nhập
CREATE PROC InsertPurchaseOrder
	@OrderID varchar(10),
	@EmployeeID varchar(10),
	@SupplierID varchar(10),
	@importDate datetime,
	@TotalPrice float(50)
AS
BEGIN
	INSERT INTO PurchaseOrder (OrderID,EmployeeID,SupplierID,importDate,TotalPrice)
	VALUES (@OrderID,@EmployeeID, @SupplierID, @importDate, @TotalPrice)
END;
GO

-- Sửa phiếu nhập
CREATE PROC UpdatePurchaseOrder
	@OrderID varchar(10),
	@SupplierID varchar(10)
AS
BEGIN
	UPDATE PurchaseOrder SET SupplierID = @SupplierID WHERE OrderID = @OrderID
END;
GO

-- Xoá phiếu nhập
CREATE PROC DeletePurchaseOrder
	@OrderID varchar(10)
AS
BEGIN
	UPDATE PurchaseOrder SET isDeleted = '0' WHERE OrderID = @OrderID
END;
GO

--Tải danh sách các sản phẩm vào chi tiết phiếu nhập( Tất cả sản phẩm)
CREATE PROC SelectProductsToPurchaseOrder
	@OrderID varchar(10)
AS
BEGIN
	SELECT P.ProductID, P.Name, P.Quantity, P.Unit
	FROM Product P
	WHERE isDeleted = '1' and P.ProductID not in (SELECT DPO.ProductID FROM DetailPurchaseOrder DPO WHERE DPO.OrderID = @OrderID)
END;
GO

-- Tải danh sách các sản phẩm đang nhập và đã nhập vào chi tiết phiếu nhập
CREATE PROC SelectProductsToDetailOrder
	@OrderID varchar(10)
AS
BEGIN
	SELECT P.ProductID, P.Name, DPO.Quantity, P.Unit, DPO.PurchasePrice
	FROM DetailPurchaseOrder DPO, Product P
	WHERE DPO.ProductID = P.ProductID and DPO.OrderID = @OrderID
END;
GO

-- Thêm sản phẩm vào chi tiết phiếu nhập
CREATE PROC AddProductToDetailOrder
	@Order varchar(10),
	@ProductID varchar(10),
	@OrderPrice float(50),
	@Quantity int
AS
BEGIN
	INSERT INTO DetailPurchaseOrder (OrderID,ProductID,Quantity,PurchasePrice)
	VALUES (@Order,@ProductID,@Quantity,@OrderPrice)
END;
GO

-- Thêm lô sản phẩm vào kho
CREATE PROC AddProductsToInventory
	@Order varchar(10),
	@ProductID varchar(10),
	@CurrentQuantity int
AS
BEGIN
	INSERT INTO Inventory (OrderID,ProductID,CurrentQuantity)
	VALUES (@Order,@ProductID,@CurrentQuantity)
END;
GO

-- Xoá sản phẩm khỏi danh sách chọn trong chi tiết phiếu nhập
CREATE PROC DeleteProductFromDetailOrder
	@OrderID varchar(10),
	@ProductID varchar(10)
AS
BEGIN
	DELETE FROM DetailPurchaseOrder WHERE OrderID = @OrderID and ProductID = @ProductID
END;
GO

-- Thanh toán phiếu nhập
CREATE PROC PayOrder
	@OrderID varchar(10)
AS
BEGIN
	UPDATE PurchaseOrder SET [Status] = '1' WHERE OrderID = @OrderID
END;
GO

 
----------------------------------------------------------------------------------------------------------------------------------------------------------
-- Công Anh 

--Lấy danh sách sản phẩm 
CREATE PROCEDURE SelectAllFromProduct
AS
BEGIN
    SELECT
        ProductID,
        [Name],
        TypeID,
        Quantity,
        CurrentPrice,
        [Description],
        Unit,
		 PromotionID
      FROM Product
    WHERE isDeleted = 1
END;
GO
-- Thêm sản phẩm
CREATE PROCEDURE InsertIntoProduct
    @ProductID varchar(10),
    @Name nvarchar(50),
    @TypeID varchar(10),
    @Quantity int,
    @CurrentPrice float(53),
    @Description nvarchar(100),
    @Unit nvarchar(20),
	@PromotionID varchar(10)
    
AS
BEGIN
    INSERT INTO Product (ProductID, [Name], TypeID, Quantity, CurrentPrice, [Description], Unit, PromotionID)
    VALUES (@ProductID, @Name, @TypeID, @Quantity, @CurrentPrice, @Description, @Unit, @PromotionID )
END;
GO
-- Cập nhật sản phẩm
CREATE PROCEDURE UpdateProduct
    @ProductID varchar(10),
    @Name nvarchar(50),
    @TypeID varchar(10),
    @Quantity int,
    @CurrentPrice float(53),
    @Description nvarchar(100),
    @Unit nvarchar(20),
	@PromotionID varchar(10)
AS
BEGIN
    UPDATE Product
    SET
        [Name] = @Name,
        TypeID = @TypeID,
        Quantity = @Quantity,
        CurrentPrice = @CurrentPrice,
        [Description] = @Description,
        Unit = @Unit,
		PromotionID = @PromotionID
        
    WHERE ProductID = @ProductID
END;
GO
-- Xóa sản phẩm 
CREATE PROCEDURE DeleteProduct
    @ProductID varchar(10)
AS
BEGIN
    UPDATE Product
    SET isDeleted = '0'
    WHERE ProductID = @ProductID
END;
GO

-- =================================================Sang
-- Lấy danh sách nhân viên
CREATE PROCEDURE SelectAllFromEmployee
AS
BEGIN
		SELECT Employee.EmployeeID, [Password], [Name], Sex, BirthDate, PhoneNumber, Email, [Address]
		FROM Employee
		WHERE isDeleted = 1;

END;
GO

-- Thêm nhân viên
CREATE PROCEDURE InsertIntoEmployee
    @EmployeeID varchar(10),
    @Name nvarchar(50),
    @Address nvarchar(50),
    @PhoneNumber varchar(50),
    @Email varchar(50),
    @Sex nvarchar(10),
    @BirthDate date,
    @Password varchar(50),
    @UserName varchar(50)
AS
BEGIN
        INSERT INTO Employee (EmployeeID, [Name], Address, PhoneNumber, Email, Sex, BirthDate, Password, UserName)
        VALUES (@EmployeeID, @Name, @Address, @PhoneNumber, @Email, @Sex, @BirthDate, @Password, @UserName);
END;
GO


-- Xóa nhân viên
CREATE PROCEDURE EditEmployee
    @EmployeeID varchar(10),
	@Name nvarchar(50),
	@Address nvarchar(50),
	@PhoneNumber varchar(50),
	@Email varchar(50),
	@Sex nvarchar(10),
	@BirthDate date,
	@Password varchar(50),
	@UserName varchar(50)
AS
BEGIN
    UPDATE Employee
    SET
        [Name] = @Name,
        Address = @Address,
        PhoneNumber = @PhoneNumber,
        Email = @Email,
        Sex = @Sex,
        BirthDate = @BirthDate,
        Password = @Password,
		UserName = @UserName
        
    WHERE EmployeeID = @EmployeeID
END;
GO
-- ===================================================End Sang

-- ========================================================Tiến
CREATE PROCEDURE [dbo].[SelectAllCustomer]
AS
BEGIN
    SELECT * FROM Customer;
END;
GO

CREATE PROCEDURE [dbo].[InsertCustomer]
    @CustomerID VARCHAR(10),
    @Name NVARCHAR(MAX),
    @PhoneNumber NVARCHAR(MAX),
    @Sex NVARCHAR(10),
    @Point INT = NULL,  -- Set a default value to allow NULL
    @isDeleted BIT
AS
BEGIN
    -- Your query to insert a new customer
    INSERT INTO customer (CustomerID, Name, PhoneNumber, Sex, Point, isDeleted)
    VALUES (@CustomerID, @Name, @PhoneNumber, @Sex, COALESCE(@Point, 0), @isDeleted);
END;
GO

CREATE PROCEDURE [dbo].[UpdateCustomer]
    @CustomerID VARCHAR(10),
    @Name NVARCHAR(MAX),
    @PhoneNumber NVARCHAR(MAX),
    @Sex NVARCHAR(10),
    @Point INT = NULL,  -- Set a default value to allow NULL
    @isDeleted BIT
AS
BEGIN
    -- Your query to update customer information by CustomerID
    UPDATE customer
    SET
        Name = @Name,
        PhoneNumber = @PhoneNumber,
        Sex = @Sex,
        Point = COALESCE(@Point, 0),
        isDeleted = @isDeleted
    WHERE
        CustomerID = @CustomerID;
END;
GO

-- Xóa khách hàng
CREATE PROCEDURE [dbo].[DeleteCustomer]
    @CustomerID VARCHAR(10)
AS
BEGIN
    -- Your query to delete a customer by CustomerID
    UPDATE customer SET IsDeleted = 0 WHERE CustomerID = @CustomerID;
END;
GO


CREATE PROCEDURE [dbo].[GetAllDetailBills]
AS
BEGIN
    SELECT
        [BillID],
        [ProductID],
        [OrderID],
        [SalePrice],
        [Quantity]
    FROM
        [DetailBill];
END;
GO
-- =========================================================End Tiến