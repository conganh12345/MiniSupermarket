USE [master]
GO
/****** Object:  Database [MarketMiniManager]    Script Date: 11/30/2023 1:16:37 AM ******/
CREATE DATABASE [MarketMiniManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MarketMiniManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MarketMiniManager.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MarketMiniManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MarketMiniManager_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MarketMiniManager] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MarketMiniManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MarketMiniManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MarketMiniManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MarketMiniManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MarketMiniManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MarketMiniManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [MarketMiniManager] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MarketMiniManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MarketMiniManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MarketMiniManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MarketMiniManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MarketMiniManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MarketMiniManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MarketMiniManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MarketMiniManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MarketMiniManager] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MarketMiniManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MarketMiniManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MarketMiniManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MarketMiniManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MarketMiniManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MarketMiniManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MarketMiniManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MarketMiniManager] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MarketMiniManager] SET  MULTI_USER 
GO
ALTER DATABASE [MarketMiniManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MarketMiniManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MarketMiniManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MarketMiniManager] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MarketMiniManager] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MarketMiniManager] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MarketMiniManager] SET QUERY_STORE = ON
GO
ALTER DATABASE [MarketMiniManager] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MarketMiniManager]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[BillID] [varchar](10) NOT NULL,
	[Date] [datetime] NOT NULL,
	[EmployeeID] [varchar](10) NOT NULL,
	[CustomerID] [varchar](10) NOT NULL,
	[EstimatedPrice] [float] NOT NULL,
	[ReducePrice] [float] NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[isDeleted] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[Sex] [nvarchar](10) NOT NULL,
	[Point] [int] NULL,
	[isDeleted] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailBill]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailBill](
	[BillID] [varchar](10) NOT NULL,
	[ProductID] [varchar](10) NOT NULL,
	[OrderID] [varchar](10) NOT NULL,
	[SalePrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BillID] ASC,
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailPurchaseOrder]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailPurchaseOrder](
	[ProductID] [varchar](10) NOT NULL,
	[OrderID] [varchar](10) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Unit] [nvarchar](50) NOT NULL,
	[PurchasePrice] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Sex] [nvarchar](10) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[isDeleted] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeRole]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeRole](
	[EmployeeID] [varchar](10) NOT NULL,
	[RoleID] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Functions]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Functions](
	[FunctionID] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[FunctionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[ProductID] [varchar](10) NOT NULL,
	[OrderID] [varchar](10) NOT NULL,
	[CurrentQuantity] [int] NOT NULL,
	[ExpiredDate] [datetime] NOT NULL,
	[isDisplayed] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[TypeID] [varchar](10) NOT NULL,
	[Quantity] [int] NOT NULL,
	[CurrentPrice] [float] NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Unit] [nvarchar](20) NOT NULL,
	[Image] [varchar](50) NULL,
	[isDeleted] [tinyint] NOT NULL,
	[PromotionID] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[TypeID] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[isDeleted] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion](
	[PromotionID] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Discount] [float] NOT NULL,
	[isDeleted] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PromotionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrder](
	[OrderID] [varchar](10) NOT NULL,
	[EmployeeID] [varchar](10) NOT NULL,
	[SupplierID] [varchar](50) NOT NULL,
	[importDate] [datetime] NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[isDeleted] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[isDeleted] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleFunction]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleFunction](
	[RoleID] [varchar](10) NOT NULL,
	[FunctionID] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FunctionID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[isDeleted] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierProduct]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierProduct](
	[SupplierID] [varchar](50) NOT NULL,
	[ProductID] [varchar](10) NOT NULL,
	[SupplyStartDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Bill] ([BillID], [Date], [EmployeeID], [CustomerID], [EstimatedPrice], [ReducePrice], [TotalPrice], [Status], [isDeleted]) VALUES (N'B0001', CAST(N'2023-09-23T00:00:00.000' AS DateTime), N'E0001', N'C0001', 100, 0, 100, 0, 1)
INSERT [dbo].[Bill] ([BillID], [Date], [EmployeeID], [CustomerID], [EstimatedPrice], [ReducePrice], [TotalPrice], [Status], [isDeleted]) VALUES (N'B0002', CAST(N'2023-09-23T00:00:00.000' AS DateTime), N'E0002', N'C0002', 200, 0, 200, 0, 1)
INSERT [dbo].[Bill] ([BillID], [Date], [EmployeeID], [CustomerID], [EstimatedPrice], [ReducePrice], [TotalPrice], [Status], [isDeleted]) VALUES (N'B0003', CAST(N'2023-09-23T00:00:00.000' AS DateTime), N'E0003', N'C0003', 300, 0, 300, 0, 1)
GO
INSERT [dbo].[Customer] ([CustomerID], [Name], [PhoneNumber], [Sex], [Point], [isDeleted]) VALUES (N'', N'', N'', N'', 0, 1)
INSERT [dbo].[Customer] ([CustomerID], [Name], [PhoneNumber], [Sex], [Point], [isDeleted]) VALUES (N'C0001', N'Trần Thị D', N'0123456789', N'Nữ', 0, 1)
INSERT [dbo].[Customer] ([CustomerID], [Name], [PhoneNumber], [Sex], [Point], [isDeleted]) VALUES (N'C0002', N'Lê hữu e', N'03968451', N'Dsdaddasđ', 0, 1)
INSERT [dbo].[Customer] ([CustomerID], [Name], [PhoneNumber], [Sex], [Point], [isDeleted]) VALUES (N'C0003', N'Võ Thị Vân F', N'0206521773', N'Nữ', 0, 1)
INSERT [dbo].[Customer] ([CustomerID], [Name], [PhoneNumber], [Sex], [Point], [isDeleted]) VALUES (N'C0004', N'Văn Tiến ', N'0396875451', N'Nam', 100, 1)
INSERT [dbo].[Customer] ([CustomerID], [Name], [PhoneNumber], [Sex], [Point], [isDeleted]) VALUES (N'C0005', N'addasdas', N'0369754815', N'Nam', 0, 1)
INSERT [dbo].[Customer] ([CustomerID], [Name], [PhoneNumber], [Sex], [Point], [isDeleted]) VALUES (N'C002', N'', N'', N'', 0, 1)
INSERT [dbo].[Customer] ([CustomerID], [Name], [PhoneNumber], [Sex], [Point], [isDeleted]) VALUES (N'C004', N'', N'', N'', 0, 1)
INSERT [dbo].[Customer] ([CustomerID], [Name], [PhoneNumber], [Sex], [Point], [isDeleted]) VALUES (N'C005', N'', N'', N'', 0, 1)
GO
INSERT [dbo].[DetailBill] ([BillID], [ProductID], [OrderID], [SalePrice], [Quantity]) VALUES (N'B0001', N'P0001', N'PO0001', 6000, 3)
INSERT [dbo].[DetailBill] ([BillID], [ProductID], [OrderID], [SalePrice], [Quantity]) VALUES (N'B0001', N'P0002', N'PO0001', 12000, 3)
INSERT [dbo].[DetailBill] ([BillID], [ProductID], [OrderID], [SalePrice], [Quantity]) VALUES (N'B0002', N'P0001', N'PO0001', 6000, 3)
INSERT [dbo].[DetailBill] ([BillID], [ProductID], [OrderID], [SalePrice], [Quantity]) VALUES (N'B0002', N'P0002', N'PO0001', 12000, 3)
INSERT [dbo].[DetailBill] ([BillID], [ProductID], [OrderID], [SalePrice], [Quantity]) VALUES (N'B0002', N'P0003', N'PO0001', 27000, 3)
INSERT [dbo].[DetailBill] ([BillID], [ProductID], [OrderID], [SalePrice], [Quantity]) VALUES (N'B0002', N'P0004', N'PO0001', 7500, 3)
GO
INSERT [dbo].[DetailPurchaseOrder] ([ProductID], [OrderID], [Quantity], [Unit], [PurchasePrice]) VALUES (N'P0001', N'PO0001', 100, N'Gói', 2000)
INSERT [dbo].[DetailPurchaseOrder] ([ProductID], [OrderID], [Quantity], [Unit], [PurchasePrice]) VALUES (N'P0002', N'PO0002', 100, N'Hộp', 4000)
INSERT [dbo].[DetailPurchaseOrder] ([ProductID], [OrderID], [Quantity], [Unit], [PurchasePrice]) VALUES (N'P0003', N'PO0003', 100, N'Gói', 9000)
GO
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Address], [PhoneNumber], [Email], [Sex], [UserName], [Password], [isDeleted]) VALUES (N'E0001', N'Nguyễn Văn A', N'123 An Dương Vương, Phường 3, Quận 2, TPHCM', N'0912312371', N'NguyenVanA@gmail.com', N'Nam', N'admin', N'1', 1)
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Address], [PhoneNumber], [Email], [Sex], [UserName], [Password], [isDeleted]) VALUES (N'E0002', N'Nguyễn Văn B', N'456 Hoàng Hoa Thám, Phường 1, Quận Bình Tân, TPHCM', N'0914736281', N'NguyenVanB@gmail.com', N'Nữ', N'E0002', N'1', 1)
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Address], [PhoneNumber], [Email], [Sex], [UserName], [Password], [isDeleted]) VALUES (N'E0003', N'Nguyễn Văn C', N'789 Nam Kỳ Khởi Nghĩa, Phường 9, Quận 8, TPHCM', N'0936271371', N'NguyenVanC@gmail.com', N'Nam', N'E0003', N'1', 1)
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Address], [PhoneNumber], [Email], [Sex], [UserName], [Password], [isDeleted]) VALUES (N'E0004', N'Văn Tiến', N'70 Hòa Hảo', N'0396875451', N'VanTien@gmail.com', N'Nam', N'vt', N'1', 1)
GO
INSERT [dbo].[EmployeeRole] ([EmployeeID], [RoleID]) VALUES (N'E0001', N'R0001')
INSERT [dbo].[EmployeeRole] ([EmployeeID], [RoleID]) VALUES (N'E0002', N'R0002')
INSERT [dbo].[EmployeeRole] ([EmployeeID], [RoleID]) VALUES (N'E0003', N'R0003')
INSERT [dbo].[EmployeeRole] ([EmployeeID], [RoleID]) VALUES (N'E0004', N'R0004')
GO
INSERT [dbo].[Functions] ([FunctionID], [Name], [Description]) VALUES (N'F0001', N'Quản lý sản phẩm', N'Tham gia quản lý sản phẩm như thêm, xoá,... sản phẩm.')
INSERT [dbo].[Functions] ([FunctionID], [Name], [Description]) VALUES (N'F0002', N'Quản lý loại sản phẩm', N'Quản lý loại sản phẩm.')
INSERT [dbo].[Functions] ([FunctionID], [Name], [Description]) VALUES (N'F0003', N'Quản lý khách hàng', N'Tham gia quản lý thông tin khách hàng.')
INSERT [dbo].[Functions] ([FunctionID], [Name], [Description]) VALUES (N'F0004', N'Quản lý nhập hàng', N'Tham gia quản lý nhập hàng.')
INSERT [dbo].[Functions] ([FunctionID], [Name], [Description]) VALUES (N'F0005', N'Quản lý bán hàng', N'Tham gia bán hàng như tạo hoá đơn và thanh toán.')
INSERT [dbo].[Functions] ([FunctionID], [Name], [Description]) VALUES (N'F0006', N'Quản lý nhân viên', N'Tham gia quản lý thông tin nhân viên và tạo tài khoản.')
INSERT [dbo].[Functions] ([FunctionID], [Name], [Description]) VALUES (N'F0007', N'Quản lý quyền', N'Tham gia quản lý quyền.')
INSERT [dbo].[Functions] ([FunctionID], [Name], [Description]) VALUES (N'F0008', N'Quản lý chương trình khuyến mãi', N'Tham gia quản lý chương trình khuyến mãi.')
INSERT [dbo].[Functions] ([FunctionID], [Name], [Description]) VALUES (N'F0009', N'Quản lý nhà cung cấp', N'Tham gia quản lý thông tin nhà cung cấp.')
INSERT [dbo].[Functions] ([FunctionID], [Name], [Description]) VALUES (N'F0010', N'Thống kê', N'Thống kê.')
GO
INSERT [dbo].[Inventory] ([ProductID], [OrderID], [CurrentQuantity], [ExpiredDate], [isDisplayed]) VALUES (N'P0001', N'PO0001', 94, CAST(N'2023-12-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Inventory] ([ProductID], [OrderID], [CurrentQuantity], [ExpiredDate], [isDisplayed]) VALUES (N'P0002', N'PO0001', 88, CAST(N'2323-12-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Inventory] ([ProductID], [OrderID], [CurrentQuantity], [ExpiredDate], [isDisplayed]) VALUES (N'P0002', N'PO0002', 100, CAST(N'2023-12-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Inventory] ([ProductID], [OrderID], [CurrentQuantity], [ExpiredDate], [isDisplayed]) VALUES (N'P0003', N'PO0003', 100, CAST(N'2023-12-30T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Product] ([ProductID], [Name], [TypeID], [Quantity], [CurrentPrice], [Description], [Unit], [Image], [isDeleted], [PromotionID]) VALUES (N'P0001', N'Mì Kokomi', N'PT0001', 94, 2000, N'Mì Kokomi tôm chua cay 100g', N'Gói', N'.', 1, NULL)
INSERT [dbo].[Product] ([ProductID], [Name], [TypeID], [Quantity], [CurrentPrice], [Description], [Unit], [Image], [isDeleted], [PromotionID]) VALUES (N'P0002', N'Sữa Milo', N'PT0002', 94, 4000, N'Sữa Milo vị ca cao lúa mạch 100ml', N'Hộp', N'.', 1, NULL)
INSERT [dbo].[Product] ([ProductID], [Name], [TypeID], [Quantity], [CurrentPrice], [Description], [Unit], [Image], [isDeleted], [PromotionID]) VALUES (N'P0003', N'Bánh Slay', N'PT0003', 97, 9000, N'Bánh Slay khoai tây chiên vị tảo', N'Gói', N'.', 1, NULL)
INSERT [dbo].[Product] ([ProductID], [Name], [TypeID], [Quantity], [CurrentPrice], [Description], [Unit], [Image], [isDeleted], [PromotionID]) VALUES (N'P0004', N'Mì Hảo hảo', N'PT0001', 73, 2500, N'Mì hảo hảo lẩu thái tôm', N'Gói', N'.', 1, NULL)
GO
INSERT [dbo].[ProductType] ([TypeID], [Name], [isDeleted]) VALUES (N'PT0001', N'Mì', 1)
INSERT [dbo].[ProductType] ([TypeID], [Name], [isDeleted]) VALUES (N'PT0002', N'Sữa', 1)
INSERT [dbo].[ProductType] ([TypeID], [Name], [isDeleted]) VALUES (N'PT0003', N'Bánh', 1)
GO
INSERT [dbo].[Promotion] ([PromotionID], [Name], [StartDate], [EndDate], [Discount], [isDeleted]) VALUES (N'PM0001', N'Khuyến mãi giờ vàng', CAST(N'2023-09-24T00:00:00.000' AS DateTime), CAST(N'2023-11-24T00:00:00.000' AS DateTime), 10, 1)
INSERT [dbo].[Promotion] ([PromotionID], [Name], [StartDate], [EndDate], [Discount], [isDeleted]) VALUES (N'PM0002', N'Khuyến mãi lễ 2/9', CAST(N'2023-08-30T00:00:00.000' AS DateTime), CAST(N'2023-09-03T00:00:00.000' AS DateTime), 20, 1)
INSERT [dbo].[Promotion] ([PromotionID], [Name], [StartDate], [EndDate], [Discount], [isDeleted]) VALUES (N'PM0003', N'Khuyến mãi điểm tích luỹ', CAST(N'2023-03-01T00:00:00.000' AS DateTime), CAST(N'2040-03-01T00:00:00.000' AS DateTime), 10, 1)
GO
INSERT [dbo].[PurchaseOrder] ([OrderID], [EmployeeID], [SupplierID], [importDate], [TotalPrice], [Status], [isDeleted]) VALUES (N'PO0001', N'E0001', N'S0001', CAST(N'2023-01-01T00:00:00.000' AS DateTime), 10000000, 0, 1)
INSERT [dbo].[PurchaseOrder] ([OrderID], [EmployeeID], [SupplierID], [importDate], [TotalPrice], [Status], [isDeleted]) VALUES (N'PO0002', N'E0002', N'S0002', CAST(N'2023-02-01T00:00:00.000' AS DateTime), 20000000, 0, 1)
INSERT [dbo].[PurchaseOrder] ([OrderID], [EmployeeID], [SupplierID], [importDate], [TotalPrice], [Status], [isDeleted]) VALUES (N'PO0003', N'E0003', N'S0003', CAST(N'2023-03-01T00:00:00.000' AS DateTime), 30000000, 0, 1)
GO
INSERT [dbo].[Role] ([RoleID], [Name], [Description], [isDeleted]) VALUES (N'R0001', N'Admin', N'Cho phép thực hiện đa số chức năng của hệ thống trừ bán hàng.', 1)
INSERT [dbo].[Role] ([RoleID], [Name], [Description], [isDeleted]) VALUES (N'R0002', N'Nhân viên bán hàng', N'Cho phép Quản lý bán hàng, quản lý khách hàng và sản phẩm.', 1)
INSERT [dbo].[Role] ([RoleID], [Name], [Description], [isDeleted]) VALUES (N'R0003', N'Nhân viên thủ kho', N'Cho phép quản lý kho như nhập, xuất hàng tồn kho.', 1)
INSERT [dbo].[Role] ([RoleID], [Name], [Description], [isDeleted]) VALUES (N'R0004', N'Khach Hang va Hoa Don', N'Cho phép quản lý kh và hd', 1)
GO
INSERT [dbo].[RoleFunction] ([RoleID], [FunctionID]) VALUES (N'R0002', N'F0001')
INSERT [dbo].[RoleFunction] ([RoleID], [FunctionID]) VALUES (N'R0002', N'F0002')
INSERT [dbo].[RoleFunction] ([RoleID], [FunctionID]) VALUES (N'R0002', N'F0003')
INSERT [dbo].[RoleFunction] ([RoleID], [FunctionID]) VALUES (N'R0004', N'F0003')
INSERT [dbo].[RoleFunction] ([RoleID], [FunctionID]) VALUES (N'R0003', N'F0004')
INSERT [dbo].[RoleFunction] ([RoleID], [FunctionID]) VALUES (N'R0002', N'F0005')
INSERT [dbo].[RoleFunction] ([RoleID], [FunctionID]) VALUES (N'R0001', N'F0006')
INSERT [dbo].[RoleFunction] ([RoleID], [FunctionID]) VALUES (N'R0001', N'F0007')
INSERT [dbo].[RoleFunction] ([RoleID], [FunctionID]) VALUES (N'R0001', N'F0008')
INSERT [dbo].[RoleFunction] ([RoleID], [FunctionID]) VALUES (N'R0003', N'F0009')
INSERT [dbo].[RoleFunction] ([RoleID], [FunctionID]) VALUES (N'R0001', N'F0010')
GO
INSERT [dbo].[Supplier] ([SupplierID], [Name], [Address], [PhoneNumber], [Email], [isDeleted]) VALUES (N'S0001', N'Kokomi', N'135 Lê Đại Hành, Phường 4, Quận 7, TPHCM', N'0803174618', N'Kokomi135@gmail.com', 1)
INSERT [dbo].[Supplier] ([SupplierID], [Name], [Address], [PhoneNumber], [Email], [isDeleted]) VALUES (N'S0002', N'Milo', N'246 Ông Ích Khiêm, Phường 5, Quận 11, TPHCM', N'06941273221', N'Milo246@gmail.com', 1)
INSERT [dbo].[Supplier] ([SupplierID], [Name], [Address], [PhoneNumber], [Email], [isDeleted]) VALUES (N'S0003', N'Slay', N'879 Luỹ Bán Bích, Phường 6, Quận 5, TPHCM', N'0943866248', N'Slay879@gmail.com', 1)
GO
INSERT [dbo].[SupplierProduct] ([SupplierID], [ProductID], [SupplyStartDate]) VALUES (N'S0001', N'P0001', CAST(N'2023-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[SupplierProduct] ([SupplierID], [ProductID], [SupplyStartDate]) VALUES (N'S0002', N'P0002', CAST(N'2023-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[SupplierProduct] ([SupplierID], [ProductID], [SupplyStartDate]) VALUES (N'S0003', N'P0003', CAST(N'2023-03-01T00:00:00.000' AS DateTime))
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((1)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ((0)) FOR [Point]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ((1)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Employee] ADD  DEFAULT ((1)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Inventory] ADD  DEFAULT ((1)) FOR [isDisplayed]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((1)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[ProductType] ADD  DEFAULT ((1)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Promotion] ADD  DEFAULT ((1)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  DEFAULT ((1)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Role] ADD  DEFAULT ((1)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Supplier] ADD  DEFAULT ((1)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [fk_Bill_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [fk_Bill_Customer]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [fk_Bill_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [fk_Bill_Employee]
GO
ALTER TABLE [dbo].[DetailBill]  WITH CHECK ADD  CONSTRAINT [fk_DetailBill_Bill] FOREIGN KEY([BillID])
REFERENCES [dbo].[Bill] ([BillID])
GO
ALTER TABLE [dbo].[DetailBill] CHECK CONSTRAINT [fk_DetailBill_Bill]
GO
ALTER TABLE [dbo].[DetailBill]  WITH CHECK ADD  CONSTRAINT [fk_DetailBill_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[DetailBill] CHECK CONSTRAINT [fk_DetailBill_Product]
GO
ALTER TABLE [dbo].[DetailBill]  WITH CHECK ADD  CONSTRAINT [fk_DetailBill_PurchaseOrder] FOREIGN KEY([OrderID])
REFERENCES [dbo].[PurchaseOrder] ([OrderID])
GO
ALTER TABLE [dbo].[DetailBill] CHECK CONSTRAINT [fk_DetailBill_PurchaseOrder]
GO
ALTER TABLE [dbo].[DetailPurchaseOrder]  WITH CHECK ADD  CONSTRAINT [fk_DetailPurchaseOrder_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[DetailPurchaseOrder] CHECK CONSTRAINT [fk_DetailPurchaseOrder_Product]
GO
ALTER TABLE [dbo].[DetailPurchaseOrder]  WITH CHECK ADD  CONSTRAINT [fk_DetailPurchaseOrder_PurchaseOrder] FOREIGN KEY([OrderID])
REFERENCES [dbo].[PurchaseOrder] ([OrderID])
GO
ALTER TABLE [dbo].[DetailPurchaseOrder] CHECK CONSTRAINT [fk_DetailPurchaseOrder_PurchaseOrder]
GO
ALTER TABLE [dbo].[EmployeeRole]  WITH CHECK ADD  CONSTRAINT [fk_EmployeeRole_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeRole] CHECK CONSTRAINT [fk_EmployeeRole_Employee]
GO
ALTER TABLE [dbo].[EmployeeRole]  WITH CHECK ADD  CONSTRAINT [fk_EmployeeRole_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[EmployeeRole] CHECK CONSTRAINT [fk_EmployeeRole_Role]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [fk_Inventory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [fk_Inventory_Product]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [fk_Inventory_PurchaseOrder] FOREIGN KEY([OrderID])
REFERENCES [dbo].[PurchaseOrder] ([OrderID])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [fk_Inventory_PurchaseOrder]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [fk_Product_ProductType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[ProductType] ([TypeID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [fk_Product_ProductType]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [fk_Product_Promotion] FOREIGN KEY([PromotionID])
REFERENCES [dbo].[Promotion] ([PromotionID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [fk_Product_Promotion]
GO
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD  CONSTRAINT [fk_PurchaseOrder_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [fk_PurchaseOrder_Employee]
GO
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD  CONSTRAINT [fk_PurchaseOrder_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [fk_PurchaseOrder_Supplier]
GO
ALTER TABLE [dbo].[RoleFunction]  WITH CHECK ADD  CONSTRAINT [fk_RoleFunction_Functions] FOREIGN KEY([FunctionID])
REFERENCES [dbo].[Functions] ([FunctionID])
GO
ALTER TABLE [dbo].[RoleFunction] CHECK CONSTRAINT [fk_RoleFunction_Functions]
GO
ALTER TABLE [dbo].[RoleFunction]  WITH CHECK ADD  CONSTRAINT [fk_RoleFunction_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[RoleFunction] CHECK CONSTRAINT [fk_RoleFunction_Role]
GO
ALTER TABLE [dbo].[SupplierProduct]  WITH CHECK ADD  CONSTRAINT [fk_SupplierProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[SupplierProduct] CHECK CONSTRAINT [fk_SupplierProduct_Product]
GO
ALTER TABLE [dbo].[SupplierProduct]  WITH CHECK ADD  CONSTRAINT [fk_SupplierProduct_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[SupplierProduct] CHECK CONSTRAINT [fk_SupplierProduct_Supplier]
GO
/****** Object:  StoredProcedure [dbo].[AddDetailBill]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddDetailBill]
    @BillID varchar(10),
    @ProductID varchar(10),
    @OrderID varchar(10),
    @SalePrice float,
    @Quantity int
AS
BEGIN
    -- Thêm DetailBill
    INSERT INTO DetailBill (BillID, ProductID, OrderID, SalePrice, Quantity)
    VALUES (@BillID, @ProductID, @OrderID, @SalePrice, @Quantity);

    -- Kiểm tra xem INSERT có thành công hay không
	--@ROWCOUNT sẽ trả về số dòng bị ảnh hưởng bởi câu lệnh INSERT
    IF @@ROWCOUNT > 0
    BEGIN
        -- Cập nhật Quantity từ Product và Iventory
        UPDATE Product
        SET Quantity = Quantity - @Quantity
        WHERE ProductID = @ProductID;

        UPDATE Inventory
        SET CurrentQuantity = CurrentQuantity - @Quantity
        WHERE ProductID = @ProductID AND OrderID = @OrderID;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[CountAccount]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Đếm số account
CREATE PROCEDURE [dbo].[CountAccount]
    @UserName NVARCHAR(50),
    @Password NVARCHAR(50)
AS
BEGIN
    SELECT COUNT(*)
    FROM Employee
    WHERE UserName = @UserName AND Password = @Password
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCustomer]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCustomer]
    @CustomerID VARCHAR(10)
AS
BEGIN
    -- Your query to delete a customer by CustomerID
    DELETE FROM customer WHERE CustomerID = @CustomerID;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteDetailBill]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteDetailBill]
    @BillID varchar(10),
    @ProductID varchar(10),
    @OrderID varchar(10)
AS
BEGIN
    -- Lấy giá trị Quantity từ DetailBill để giảm đi từ bảng Product
    DECLARE @Quantity int;
    SELECT @Quantity = Quantity
    FROM DetailBill
    WHERE BillID = @BillID AND ProductID = @ProductID AND OrderID = @OrderID;

    -- Xóa DetailBill
    DELETE FROM DetailBill
    WHERE BillID = @BillID AND ProductID = @ProductID AND OrderID = @OrderID;

    -- Kiểm tra xem DELETE có thành công hay không
	-- @ROWCOUNT sẽ trả về số dòng bị ảnh hưởng bởi câu lệnh DetailBill.
    IF @@ROWCOUNT > 0
    BEGIN
        -- Giảm Quantity từ bảng Product
        UPDATE Product
        SET Quantity = Quantity + @Quantity
        WHERE ProductID = @ProductID;

        -- Cập nhật lại CurrentQuantity trong bảng Inventory
        UPDATE Inventory
        SET CurrentQuantity = CurrentQuantity - @Quantity
        WHERE ProductID = @ProductID AND OrderID = @OrderID;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Xóa sản phẩm 
CREATE PROCEDURE [dbo].[DeleteProduct]
    @ProductID varchar(10)
AS
BEGIN
    UPDATE Product
    SET isDeleted = 0
    WHERE ProductID = @ProductID
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteProductType]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Delete ProductType
CREATE PROCEDURE [dbo].[DeleteProductType]
    @TypeID varchar(10)
AS
BEGIN
	UPDATE ProductType SET isDeleted = 0 WHERE TypeID = @TypeID
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAllDetailBills]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllDetailBills]
AS
BEGIN
    SELECT
        DB.[BillID],
        DB.[ProductID],
        DB.[OrderID],
        P.[Name],
        P.[CurrentPrice],
        P.[Unit],
        DB.[SalePrice],
        DB.[Quantity]
    FROM
        DetailBill DB
    INNER JOIN
        Product P ON DB.[ProductID] = P.[ProductID];
END;
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerCount]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCustomerCount]
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @CustomerCount INT;

    -- Your query to get the customer count
    SELECT @CustomerCount = COUNT(*) FROM customer WHERE isDeleted = 0;

    -- Return the result
    SELECT @CustomerCount AS CustomerCount;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetDetailBills]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDetailBills]
    @SelectedBillID NVARCHAR(MAX)
AS
BEGIN
    SELECT
        DB.[BillID],
        DB.[ProductID],
        P.[Name], -- Tên sản phẩm từ bảng Product
        DB.[OrderID],
        DB.[SalePrice],
        DB.[Quantity]
    FROM
        DetailBill DB
    INNER JOIN
        Product P ON DB.[ProductID] = P.[ProductID]
    WHERE
        DB.[BillID] = @SelectedBillID
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertCustomer]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[InsertCustomerSale]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Thêm khách hàng cho hóa đơn
CREATE PROC [dbo].[InsertCustomerSale]
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
/****** Object:  StoredProcedure [dbo].[InsertIntoBill]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Thêm một bill mới
CREATE PROCEDURE [dbo].[InsertIntoBill]
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
/****** Object:  StoredProcedure [dbo].[InsertIntoProduct]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Thêm sản phẩm
CREATE PROCEDURE [dbo].[InsertIntoProduct]
    @ProductID varchar(10),
    @Name nvarchar(50),
    @TypeID varchar(10),
    @Quantity int,
    @CurrentPrice float(53),
    @Description nvarchar(100),
    @Unit nvarchar(20),
    @Image varchar(50),
	@PromotionID varchar(10)
    
AS
BEGIN
    INSERT INTO Product (ProductID, [Name], TypeID, Quantity, CurrentPrice, [Description], Unit, [Image],PromotionID)
    VALUES (@ProductID, @Name, @TypeID, @Quantity, @CurrentPrice, @Description, @Unit, @Image, @PromotionID )
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertIntoProductType]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Insert Into ProductType
CREATE PROCEDURE [dbo].[InsertIntoProductType]
    @TypeID varchar(10),
	@Name nvarchar(50)
AS
BEGIN
    INSERT INTO ProductType(TypeID, [Name])
    VALUES (@TypeID, @Name)
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertPromotion]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Thêm chương trình khuyến mãi
CREATE PROC [dbo].[InsertPromotion]
	@PromotionID nvarchar(10),
	@Name nvarchar(50),
	@StartDate datetime,
	@EndDate datetime,
	@Discount float(50)
AS
BEGIN
	INSERT INTO Promotion(PromotionID,[Name],StartDate,EndDate,Discount)
	VALUES (@PromotionID,@Name,@StartDate,@EndDate,@Discount)
END;
GO
/****** Object:  StoredProcedure [dbo].[SelectAllBills]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Lấy tất cả thông tin hóa đơn
CREATE PROCEDURE [dbo].[SelectAllBills]
AS
BEGIN
    SELECT 
        Bill.BillID,
        Bill.[Date],
        Bill.EmployeeID,
        Employee.[Name] AS EmployeeName,
        Bill.CustomerID,
        Customer.[Name] AS CustomerName,
        Bill.EstimatedPrice,
        Bill.ReducePrice,
        Bill.TotalPrice,
        Bill.[Status],
		Bill.isDeleted
    FROM 
        Bill
        INNER JOIN Employee ON Bill.EmployeeID = Employee.EmployeeID
        LEFT JOIN Customer ON Bill.CustomerID = Customer.CustomerID
    
END;
GO
/****** Object:  StoredProcedure [dbo].[SelectAllCustomer]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllCustomer]
AS
BEGIN
    SELECT * FROM Customer;
END;
GO
/****** Object:  StoredProcedure [dbo].[SelectAllEmployee]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllEmployee]
AS
BEGIN
    SELECT EmployeeID, Name, Address, PhoneNumber, Email, Sex, UserName, Password, isDeleted
    FROM Employee;
END;
GO
/****** Object:  StoredProcedure [dbo].[SelectAllFromProduct]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Công Anh 

--Lấy danh sách sản phẩm 
CREATE PROCEDURE [dbo].[SelectAllFromProduct]
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
        [Image],
        isDeleted,
        PromotionID
    FROM Product
    WHERE isDeleted = 1
END;
GO
/****** Object:  StoredProcedure [dbo].[SelectAllFromProductType]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- Tạo các procedures
-- Select * from ProductType
CREATE PROCEDURE [dbo].[SelectAllFromProductType]
AS
BEGIN
    SELECT TypeID, [Name] FROM ProductType Where isDeleted = 1
END;
GO
/****** Object:  StoredProcedure [dbo].[SelectAllPromotions]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllPromotions]
AS
BEGIN
    SELECT * FROM Promotion;
END;
GO
/****** Object:  StoredProcedure [dbo].[SelectAllSupplier]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllSupplier]
AS
BEGIN
    SELECT SupplierID, Name, Address, PhoneNumber, Email, isDeleted
    FROM Supplier;
END;
GO
/****** Object:  StoredProcedure [dbo].[SelectCustomerIdAndName]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Lấy mã KH và tên KH
CREATE PROCEDURE [dbo].[SelectCustomerIdAndName]
AS
BEGIN
	SELECT CustomerID, [Name]
	FROM Customer
    WHERE isDeleted = 1
END;
GO
/****** Object:  StoredProcedure [dbo].[SelectFunctionNameFromAccount]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Lấy các chức năng từ account
CREATE PROCEDURE [dbo].[SelectFunctionNameFromAccount]
    @UserName varchar(50),
	@Password varchar(50)
AS
BEGIN
	SELECT Functions.[Name]
	FROM Employee, EmployeeRole, [Role], RoleFunction, Functions
    Where Employee.EmployeeID = EmployeeRole.EmployeeID 
	AND EmployeeRole.RoleID = [Role].RoleID
    AND [Role].RoleID = RoleFunction.RoleID
    AND RoleFunction.FunctionID = Functions.FunctionID
    AND UserName = @UserName AND [Password] = @Password
    AND Employee.IsDeleted = 1
END;
GO
/****** Object:  StoredProcedure [dbo].[SelectInfoFromAccount]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Lấy thông tin tài khoản từ username
CREATE PROCEDURE [dbo].[SelectInfoFromAccount]
    @userName varchar(50)
AS
BEGIN
	SELECT EmployeeID, [Name], [Address], PhoneNumber, Email
    FROM Employee Where UserName = @userName
    AND Employee.IsDeleted = 1
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateAccountInfor]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Cập nhật thông tin tài khoản
CREATE PROCEDURE [dbo].[UpdateAccountInfor]
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
/****** Object:  StoredProcedure [dbo].[UpdateAccountPassword]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Cập nhật mật khẩu tài khoản
CREATE PROCEDURE [dbo].[UpdateAccountPassword]
    @EmployeeId varchar(10),
	@Password varchar(50)
AS
BEGIN
	UPDATE Employee SET Password = @Password
    WHERE EmployeeID = @EmployeeId
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateCustomer]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[UpdateDetailBill]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateDetailBill]
    @BillID varchar(10),
    @ProductID varchar(10),
    @OrderID varchar(10),
    @SalePrice float,
    @Quantity int
AS
BEGIN
    -- Lấy giá trị Quantity hiện tại từ DetailBill để so sánh
    DECLARE @CurrentQuantity int;
    SELECT @CurrentQuantity = Quantity
    FROM DetailBill
    WHERE BillID = @BillID AND ProductID = @ProductID AND OrderID = @OrderID;

    -- Cập nhật DetailBill
    UPDATE DetailBill
    SET OrderID = @OrderID, SalePrice = @SalePrice, Quantity = @Quantity
    WHERE BillID = @BillID AND ProductID = @ProductID AND OrderID = @OrderID;

    -- Kiểm tra xem UPDATE có thành công hay không
	--@ROWCOUNT sẽ trả về số dòng bị ảnh hưởng bởi câu lệnh UPDATE
    IF @@ROWCOUNT > 0
    BEGIN
        -- Cập nhật Quantity từ Product và Iventory
        IF @Quantity > @CurrentQuantity
        BEGIN
            -- Tăng Quantity
            UPDATE Product
            SET Quantity = Quantity - (@Quantity - @CurrentQuantity)
            WHERE ProductID = @ProductID;

            -- Giảm CurrentQuantity
            UPDATE Inventory
            SET CurrentQuantity = CurrentQuantity - (@Quantity - @CurrentQuantity)
            WHERE ProductID = @ProductID AND OrderID = @OrderID;
        END
        ELSE IF @Quantity < @CurrentQuantity
        BEGIN
            -- Giảm Quantity
            UPDATE Product
            SET Quantity = Quantity + (@CurrentQuantity - @Quantity)
            WHERE ProductID = @ProductID;

            -- Tăng CurrentQuantity
            UPDATE Inventory
            SET CurrentQuantity = CurrentQuantity + (@CurrentQuantity - @Quantity)
            WHERE ProductID = @ProductID AND OrderID = @OrderID;
        END
        -- Trường hợp không thay đổi Quantity, không cần làm gì cả
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Cập nhật sản phẩm
CREATE PROCEDURE [dbo].[UpdateProduct]
    @ProductID varchar(10),
    @Name nvarchar(50),
    @TypeID varchar(10),
    @Quantity int,
    @CurrentPrice float(53),
    @Description nvarchar(100),
    @Unit nvarchar(20),
    @Image varchar(50),
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
        [Image] = @Image,
		PromotionID = @PromotionID
        
    WHERE ProductID = @ProductID
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateProductType]    Script Date: 11/30/2023 1:16:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Update ProductType
CREATE PROCEDURE [dbo].[UpdateProductType]
    @TypeID varchar(10),
	@Name nvarchar(50)
AS
BEGIN
	UPDATE ProductType SET [Name] = @Name WHERE TypeID = @TypeID
END;
GO
USE [master]
GO
ALTER DATABASE [MarketMiniManager] SET  READ_WRITE 
GO
