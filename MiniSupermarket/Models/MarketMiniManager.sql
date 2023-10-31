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
	isDeleted tinyint not null default(1),
	primary key (EmployeeID)
)
GO

-- Rot du lieu vao bang nhan vien
insert into Employee(EmployeeID,Name,Address,PhoneNumber,Email,Sex,UserName,Password)
values
	('E0001',N'Nguyễn Văn A',N'123 An Dương Vương, Phường 3, Quận 2, TPHCM','0912312371','NguyenVanA@gmail.com',N'Nam','admin','1'),
	('E0002',N'Nguyễn Văn B',N'456 Hoàng Hoa Thám, Phường 1, Quận Bình Tân, TPHCM','0914736281','NguyenVanB@gmail.com',N'Nữ','E0002','1'),
	('E0003',N'Nguyễn Văn C',N'789 Nam Kỳ Khởi Nghĩa, Phường 9, Quận 8, TPHCM','0936271371','NguyenVanC@gmail.com',N'Nam','E0003','1')
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
	[Image] varchar(50),
	isDeleted tinyint not null default(1),
	PromotionID varchar(10),
	primary key (ProductID)
)
GO

-- Rot du lieu bang san pham	
insert into Product(ProductID,[Name],TypeID,Quantity,CurrentPrice,[Description],Unit,[Image])
values
	('P0001',N'Mì Kokomi','PT0001',100,2000,N'Mì Kokomi tôm chua cay 100g',N'Gói','.'),
	('P0002',N'Sữa Milo','PT0002',100,4000,N'Sữa Milo vị ca cao lúa mạch 100ml',N'Hộp','.'),
	('P0003',N'Bánh Slay','PT0003',100,9000,N'Bánh Slay khoai tây chiên vị tảo',N'Gói','.'),
	('P0004',N'Mì Hảo hảo','PT0001',100,2500,N'Mì hảo hảo lẩu thái tôm',N'Gói','.')
GO

--Tao bang khuyen mai
create table Promotion(
	PromotionID varchar(10) not null,
	[Name] nvarchar(50) not null,
	StartDate datetime not null,
	EndDate datetime not null,
	Discount float(50) not null,
	isDeleted tinyint not null default(1),
	primary key (PromotionID)
)
GO

-- Rot du lieu vao bang khuyen mai
INSERT INTO Promotion (PromotionID, [Name], StartDate, EndDate, Discount)
VALUES
    ('PM0001', N'Khuyến mãi giờ vàng', '2023-9-24', '2023-11-24', 10),
    ('PM0002', N'Khuyến mãi lễ 2/9', '2023-08-30', '2023-09-03', 20),
    ('PM0003', N'Khuyến mãi điểm tích luỹ', '2023-03-01', '2040-03-01', 10);
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
	CustomerID varchar(10) not null,
	EstimatedPrice float(50) not null,
	ReducePrice float(50) not null,
	TotalPrice float(50) not null,
	[Status] tinyint not null default(0),
	isDeleted tinyint not null default(1),
	primary key(BillID)
)
GO

-- Rot du lieu vao bang hoa don
INSERT INTO Bill (BillID, [Date], EmployeeID, CustomerID, EstimatedPrice, ReducePrice, TotalPrice)
VALUES
    ('B0001', '2023-09-23', 'E0001', 'C0001', 100.0, 0, 100.0),
    ('B0002', '2023-09-23', 'E0002', 'C0002', 200.0, 0, 200.0),
    ('B0003', '2023-09-23', 'E0003', 'C0003', 300.0, 0, 300.0);
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
	Unit nvarchar(50) not null,
	PurchasePrice float(50) not null,
	primary key (ProductID,OrderID)
)
GO

-- Rot du lieu vao bang chi tiet phieu nhap
INSERT INTO DetailPurchaseOrder (ProductID, OrderID, Quantity, Unit, PurchasePrice)
VALUES
    ('P0001', 'PO0001', 100, N'Gói', 2000),
    ('P0002', 'PO0002', 100, N'Hộp', 4000),
    ('P0003', 'PO0003', 100, N'Gói', 9000);
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
	ExpiredDate datetime not null,
	isDisplayed tinyint not null default(1),
	primary key (OrderID,ProductID)
)
GO

--Rot du lieu vao bang hang ton kho
INSERT INTO Inventory (ProductID, OrderID, CurrentQuantity, ExpiredDate)
VALUES
    ('P0001', 'PO0001', 100, '2023-12-30'),
    ('P0002', 'PO0002', 100, '2023-12-30'),
    ('P0003', 'PO0003', 100, '2023-12-30');
GO

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