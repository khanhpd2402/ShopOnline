USE [master]
GO
/****** Object:  Database [OnlineShop3]    Script Date: 31/01/2024 11:38:36 CH ******/
CREATE DATABASE [OnlineShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineShop3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HUYHQ\MSSQL\DATA\OnlineShop3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineShop3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HUYHQ\MSSQL\DATA\OnlineShop3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [OnlineShop3] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineShop3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineShop3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineShop3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineShop3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineShop3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineShop3] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineShop3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineShop3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineShop3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineShop3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineShop3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineShop3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineShop3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineShop3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineShop3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineShop3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OnlineShop3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineShop3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineShop3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineShop3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineShop3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineShop3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineShop3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineShop3] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineShop3] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineShop3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineShop3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineShop3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineShop3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineShop3] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineShop3', N'ON'
GO
ALTER DATABASE [OnlineShop3] SET QUERY_STORE = OFF
GO
USE [OnlineShop3]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 31/01/2024 11:38:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Author] [nvarchar](100) NULL,
	[Title] [nvarchar](2500) NULL,
	[Content] [nvarchar](max) NULL,
	[ImageLink] [nvarchar](1000) NULL,
 CONSTRAINT [PK__Blog__3214EC27E07CA858] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 31/01/2024 11:38:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 31/01/2024 11:38:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 31/01/2024 11:38:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackID] [int] NOT NULL,
	[ProductID] [int] NULL,
	[UserID] [int] NULL,
	[Content] [varchar](max) NULL,
	[CreatedDate] [date] NULL,
	[FeedbackStatus] [bit] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 31/01/2024 11:38:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_ID] [int] NOT NULL,
	[UserID] [int] NULL,
	[OrderDate] [date] NULL,
	[CustomerName] [nvarchar](255) NULL,
	[Address] [nvarchar](max) NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [varchar](20) NULL,
	[TotalMoney] [money] NULL,
	[OrderNote] [nvarchar](max) NULL,
	[OrderStatus] [bit] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 31/01/2024 11:38:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 31/01/2024 11:38:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](1000) NULL,
	[Description] [nvarchar](max) NULL,
	[OriginPrice] [money] NULL,
	[SalePrice] [money] NULL,
	[Discount] [float] NULL,
	[ProductImg] [varchar](2550) NULL,
	[Quantity] [int] NULL,
	[ProductStatus] [bit] NULL,
	[BrandID] [int] NULL,
	[CategoryID] [int] NULL,
	[CPU] [nvarchar](50) NULL,
	[RAM] [nvarchar](50) NULL,
	[Capacity] [nvarchar](50) NULL,
	[GraphicCard] [nvarchar](50) NULL,
	[Display] [nvarchar](50) NULL,
 CONSTRAINT [PK__Product__B40CC6ED0DAF9F57] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 31/01/2024 11:38:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 31/01/2024 11:38:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Img] [varchar](2500) NULL,
	[Title] [nvarchar](2500) NULL,
	[Description] [nvarchar](2500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 31/01/2024 11:38:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](255) NULL,
	[Password] [varchar](30) NULL,
	[Fullname] [nvarchar](255) NULL,
	[Gender] [bit] NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [varchar](20) NULL,
	[Address] [nvarchar](max) NULL,
	[RoleID] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK__Users__1788CCAC851A21BA] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([ID], [Author], [Title], [Content], [ImageLink]) VALUES (1, N'mantn', N'Top Những Chiếc Laptop Dưới 20 Triệu Mỏng Nhẹ, Cấu Hình Mạnh 2023', N'Máy tính Dell Vostro 5410 i5 (V4I5214W1) tự hào với phong cách thiết kế  tinh tế và sắc sảo cùng thông số kỹ thuật khá ấn tượng, đáp ứng nhiều nhu cầu khác nhau, từ máy tính xách tay làm việc, văn phòng đến giải trí cơ bản, đây sẽ là một sự lựa chọn tuyệt vời.
Laptop MacBook Air M1 13 inch 256GB MGND3SA/A Vàng trang bị bộ vi xử lý Apple M1 8 core với sức mạnh đột phá giúp Macbook Air trở thành chiếc một trong những chiếc laptop nhỏ gọn, sang trọng với hiệu năng mạnh mẽ nhất từ trước đến nay. Bộ vi xử lý M1 8 nhân cực mạnh mang đến hiệu suất đáng kinh ngạc, tốc độ xử lý tuyệt vời, mượt mà tác vụ đồng thời kéo dài tuổi thọ pin.
Laptop HP Pavilion x360 14-dy0168TU i7- 1165G7/8GB/512GB SSD/ Win 11 4Y1D3PA nổi bật nhờ lối thiết kế hiện đại, trẻ trung với màu Vàng sang trọng đặc biệt là khả năng xoay 360 độ thuận tiện cho người dùng khi làm việc cũng như giải trí. Ngoài ra sản phẩm khá gọn nhẹ, trọng lượng chỉ 1.5 kg thuận tiện mang theo khi đi học, đi làm,....', N'top-lap-duoi-20tr.jpg')
INSERT [dbo].[Blog] ([ID], [Author], [Title], [Content], [ImageLink]) VALUES (2, N'hung11', N'Hướng Dẫn Vệ Sinh Laptop Sạch Sẽ Từ A - Z', N'Bạn có thể chuẩn bị một bộ dung cụ vệ sinh laptop chuyên dụng hoặc tự chuẩn bị tăm bông, vải mềm, bình xịt khí nén cũng như tự pha dung dịch vệ sinh làm từ nước lọc với giấm trắng (theo tỷ lệ 1:1).Nếu như bạn không có cồn hoặc giấm trắng, bạn sử dụng các dung dịch vệ sinh chuyên dụng. Hoặc bạn có thể thay thế bằng dung dịch lau màn hình, lau kính chuyên dụng đều được.
Màn hình thường là bộ phận mỏng manh, dễ hư hỏng nhất của laptop. Vì thế bạn cần vệ sinh màn hình máy tính xách tay thật nhẹ nhàng. Bạn sử dụng tấm khăn vải mềm được tẩm ướt dung dịch vệ sinh rồi lau nhẹ nhàng lên màn hình. Bạn dùng 1 tay còn lại để đỡ lấy màn hình.
Việc một số bàn phím máy tính chứa lượng vi khuẩn có hại nhiều hơn cả bệ ngồi toilet có thể khiến bạn sợ hãi. Và thông tin này chứng tỏ rằng bàn phím laptop rất bẩn, cũng như dễ tích tụ lại nhiều bụi bẩn, cũng như rất khó để làm sạch. Tuy nhiên vệ sinh bàn phím laptop không phải là công việc bất khả thi. Bạn sử dụng loại chổi vệ sinh máy tính chuyên dụng rồi làm sạch các bề mặt bàn phím cũng như các khe để loại bỏ bụi bẩn bám tại đây. Sau đó bạn có thể dùng máy hút bụi mini để hút sạch bụi bẩn.
Các cổng kết nối của laptop cũng rất dễ đọng lại bụi bẩn. Hơn nữa những vị trí này rất khó làm sạch cặn kẽ.Do đó bạn nên sử dụng bông khô lau sạch bên ngoài, sau đó dùng cọ chuyên dụng để quét sạch bụi bám bên trong.', N'huong-dan-ve-sinh-laptop.jpg')
INSERT [dbo].[Blog] ([ID], [Author], [Title], [Content], [ImageLink]) VALUES (3, N'anh12', N'Tại Sao Laptop Không Lên Màn Hình', N'Máy tính hoạt động ở nơi nguồn điện không ổn định sẽ dẫn đến việc phần cứng laptop sẽ bị hư hỏng hoặc cháy các bộ phận quan trọng như: CPU, RAM hay Chipset. Khi các bộ phận này bị hư hỏng thì màn hình laptop của bạn mở không lên hay nói chính xác là laptop bị hư mở không lên nguồn và màn hình.
Khi mở laptop không lên mặc dù đã thử cắm sạc và để 1 thời gian thì khả năng cao là do pin laptop bị hỏng. Bạn cần kiểm tra lại 1 lần nữa rằng mình có đang cắm sạc adapter hay không?
Laptop có thể bị hoạt động quá công suất nên không lên màn hình. Khi máy hoạt động quá công suất nhưng hệ thống tản nhiệt bị bám nhiều bụi bặm nên tản nhiệt. Khi máy bị nóng quá mức sẽ quá nóng khiến máy tắt đột ngột và mở không lên.', N'cach-khac-phuc-laptop-khong-len-man-hinh-1.jpg')
INSERT [dbo].[Blog] ([ID], [Author], [Title], [Content], [ImageLink]) VALUES (4, N'author_1', N'Top 3 mẫu Laptop vừa học vừa chơi game tốt nhất 2023', N'Đứng đầu trong danh sách chính là một siêu phẩm đến từ thương hiệu Dell, đó chính là Laptop Dell Gaming G15. Với dòng này người dùng sẽ có ba sự lựa chọn về bộ vi xử lý, bao gồm: Laptop Dell Gaming G15 5515 R5-5600H, Laptop Dell Gaming G15 5515 R7 5800H, Laptop Dell Gaming G15 5511 i7-11800H.
Laptop HP Victus 4R0U6PA sở hữu bộ vi xử lý AMD Ryzen 7 5800H với 8 nhân 16 luồng, kiến trúc Zen 3, tiến trình 7nm và tốc độ cơ bản 3.2 GHz đạt tối đa tới 4.4 GHz có thể chạy mọi tựa game cũng như những phần mềm thiết kế ảnh, Render Video.
Ngay từ khi ra mắt thiết kế của Asus TUF Gaming F15 FX506HC đã nhận được phản hồi rất tốt từ người tiêu dùng. Máy có tone màu đen mạnh mẽ, những đường cắt tinh tế trên thân máy mang đến một vẻ cuốn hút rất riêng.', N'top-3-mau-laptop-vua-hoc-vua-choi-game.jpg')
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (1, N'Apple')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (2, N'Asus')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (3, N'HP')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (4, N'Dell')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (5, N'Acer')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (6, N'MSI')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (7, N'Lenovo')
SET IDENTITY_INSERT [dbo].[Brand] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Office')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Gaming')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Business')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'Graphics - Engineering')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'Touchscreen')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (1, N'Lenovo IdeaPad 1 15ALC7', N'Laptop Lenovo Ideapad 1 15ALC7 sẽ là sự lựa chọn hoàn hảo cho không chỉ sinh viên mà ngay cả người đi làm đang tìm kiếm thiết bị đáp ứng trọn vẹn cho nhu cầu công việc và giải trí', 13000000.0000, 11700000.0000, 0.1, N'ideapad-1-15alc7.jpg', 20, 1, 7, 1, N'AMD Ryzen 5', N'8GB', N'SSD 256GB', N'Onboard', N'15.6inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (2, N'Asus Vivobook 15 OLED A1505VA-L1113W', N'Laptop Asus Vivobook 15 OLED A1505VA-L1113W mang đến những trải nghiệm làm việc và giải trí tuyệt vời khi sở hữu thông số cấu hình vô cùng ấn tượng. Thiết bị giúp bạn hoàn thành mọi công việc nhanh chóng khi tích hợp bộ vi xử lý hàng đầu. Với màn hình OLED rực rỡ, chiếc laptop Asus Vivobook cũng mở ra một thế giới giải trí vô cùng phong phú và chân thực.', 20000000.0000, 20000000.0000, 0, N'asus_vivobook_15_oled_a1505va.jpg', 20, 1, 2, 1, N'Intel Core i5', N'16GB', N'SSD 512GB', N'Onboard', N'14inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (3, N'HP Pavilion 14-dv2073TU', N'Dù có thiết kế nhỏ gọn với màn hình 14 inch, HP Pavilion 14-dv2073TU vẫn tự tin giải quyết tốt các nhu cầu sử dụng hàng ngày của bạn vì máy có hệ thống phần cứng mạnh mẽ. Đồng thời, bạn còn có thể cho máy vào balo hoặc túi đựng và mang đi bất kì nơi nào.', 19000000.0000, 17100000.0000, 0.1, N'hp-pavilion-14-dv2073TU.jpg', 20, 1, 3, 1, N'Intel Core i5', N'16GB', N'SSD 512GB', N'Onboard', N'14inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (4, N'MSI Gaming Thin GF63 12VE-454VN', N'Với MSI Gaming Thin GF63 12VE-454VN độ mỏng 21.7mm và khối lượng 1.86kg sẽ cực kì thuận tiện cho việc mang máy đến nhiều nơi để sử dụng chứ không nhất thiết phải để yên trong nhà. Phần mặt bàn phím và kê tay được phủ chất liệu hợp kim cao cấp để tăng cường cảm giác thoải mái khi game thủ đặt tay lên và gõ chữ, còn phần mặt lưng máy thì chỉ sử dụng nhựa thôi nhưng lớp nhựa này có khả năng hạn chế bụi bẩn cũng như vân tay rất tốt. Logo MSI có hình Rồng Đỏ nằm ngay phía trên mặt lưng rất dễ nhận diện.', 20490000.0000, 20490000.0000, 0, N'msi-15-thin-GF63.jpg', 20, 1, 6, 2, N'Intel Core i7', N'16GB', N'SSD 512GB', N'Nvidia RTX 4050 6GB', N'15.6inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (5, N'Asus TUF Gaming FX507ZC4-HN095W', N'Luôn sẵn sàng cho mọi hành trình, Asus TUF F15 FX507ZC4 HN095W xử lý dễ dàng mọi tác vụ dù là chơi game, phát trực tiếp và hơn thế nữa. Sức mạnh CPU Intel Core i5-12500H thế hệ thứ 12 phù hợp để giải trí và làm việc hàng ngày. Đồ họa nhanh và mượt mà với GPU NVIDIA GeForce RTX 3050 mang lại tốc độ khung hình cao ổn định. 16GB RAM DDR4-3200 RAM cho phép bạn đổi trang bị giữa trận một cách trơn tru. Đồng thời, ổ cứng SSD NVMe PCIe lên đến 512GB giúp đẩy nhanh thời gian tải trên tất cả các ứng dụng và trò chơi của bạn.', 19990000.0000, 19990000.0000, 0, N'asus-tuf-fx507zc4.jpg', 15, 1, 2, 2, N'Intel Core i7', N'16GB', N'SSD 512GB', N'Nvidia RTX 3050 4GB', N'15.6inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (6, N'Acer Nitro 5 Gaming AN515-57-53F9', N'Acer Nitro 5 Gaming AN515-57-53F9 sẽ theo chân bạn trong mọi cuộc vui ở thế giới ảo. Chiếc laptop gaming có vẻ ngoài cool ngầu này trang bị hệ thống phần cứng mạnh mẽ hàng đầu từ Intel và NVIDIA, đồng thời tích hợp thêm nhiều cổng kết nối vô cùng tiện lợi cho các loại phụ kiện gắn ngoài mà bạn muốn sử dụng.', 17000000.0000, 17000000.0000, 0, N'Acer Nitro 5 Gaming AN515-57-53F9.jpg', 10, 1, 5, 2, N'AMD Ryzen 5', N'8GB', N'SSD 512GB', N'Nvidia RTX 4050 6GB', N'15.6inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (7, N'Asus TUF Gaming FX517ZC-HN077W', N'Asus TUF Dash F15 2022 có thiết kế hoàn toàn mới với nắp nhôm phong cách mecha màu Đen Xám Off Black cực ngầu, kết cấu Teflon bền vững và đèn báo 4 chiều độc đáo. Bạn có thể cảm nhận được sự thanh thoát, tối giản nhưng cũng rất mạnh mẽ với vẻ đẹp lạnh lùng trong thiết kế máy. Hơn nữa, Asus TUF Dash F15 FX517ZC-HN077W vẫn tiếp bước truyền thống của dòng Dash, đó là sự nhỏ gọn đáng kinh ngạc. Là mẫu laptop chơi game cấu hình cao nhưng laptop này chỉ mỏng 19,9mm và trọng lượng 2.0kg, những thông số tương đương với laptop văn phòng, dễ dàng để bạn chơi game linh hoạt mọi lúc mọi nơi.

', 18690000.0000, 16821000.0000, 0.1, N'asus-tuf-fx517zc.jpg', 10, 1, 2, 2, N'Intel Core i5', N'16GB', N'SSD 512GB', N'Nviadia RTX 3050 4GB', N'15.6inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (8, N'Lenovo Ideapad Gaming 3 15ARH7', N'Lenovo IdeaPad Gaming 3 15ARH7 thế hệ mới 2023 được nâng cấp mạnh mẽ về cấu hình với những linh kiện mới nhất. Từ bộ vi xử lý AMD Ryzen 7000 series cho đến card đồ họa RTX 4000 series, đây hứa hẹn tiếp tục là chiếc laptop gaming cấu hình vượt trội trong tầm giá rẻ.', 19990000.0000, 19990000.0000, 0, N'lenovo_ideapad_gaming_3_15a.jpg', 10, 1, 7, 2, N'AMD Ryzen 5', N'16GB', N'SSD 512GB', N'Nvidia RTX 4050 6GB', N'15.6inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (9, N'HP Gaming Victus 16-e1104AX', N'Mang trong mình vẻ đẹp tối giản nhưng đậm nét phong cách và sang trọng, máy tính xách tay HP Gaming Victus 16-e1104AX là một lựa chọn xứng đáng với bạn trong phân khúc cao cấp. Chiếc laptop gaming này có màn hình 16.1 inch với độ phân giải Full HD, phần cứng mạnh mẽ, nhiều cổng kết nối phụ kiện.', 20990000.0000, 20990000.0000, 0, N'hp-victus-16.jpg', 5, 1, 3, 2, N'AMD Ryzen 7', N'16GB', N'SSD 512GB', N'Nviadia RTX 3050 4GB', N'16inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (10, N'Lenovo ThinkPad X1 Carbon Gen 10', N'Thinkpad X1 Carbon Gen 10 không có sự nâng cấp về thiết kế, bộ vỏ gần giống như Thinkpad X1 Carbon Gen 9   giố cả về cách hoàn thiện lẫn sắp xếp nhưng vẫn chất liệu hợp kim Nhôm - Magie vẫn đem lại cảm giác cực kì chắn chắn khi cầm nắm và được chịu lực tốt khi có tác động vật lý bên ngoài. Laptop phủ Carbon Fiber đảm bảo độ êm ái và tính thẩm mỹ.', 22000000.0000, 22000000.0000, 0, N'Lenovo-ThinkPad-X1-Carbon-Gen-10.jpg', 12, 1, 7, 3, N'Intel Core i5', N'16GB', N'SSD 1TB', N'Onboard', N'14inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (11, N'Lenovo ThinkPad X1 Nano Gen 2', N'Lenovo ThinkPad X1 Nano là siêu phẩm laptop dành cho doanh nhân với sức mạnh không tưởng trong một thiết kế nhẹ chưa tới 1kg. Chứng nhận chuẩn Intel Evo, màn hình 2K tuyệt sắc, ThinkPad X1 Nano chính là chìa khóa đưa bạn đến thành công.', 21000000.0000, 21000000.0000, 0, N'Lenovo_ThinkPad_X1_Nano_Gen_2.jpg', 9, 1, 7, 3, N'Intel Core i5', N'16GB', N'SSD 512GB', N'Onboard', N'13inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (12, N'Asus Zenbook UX3402VA-KM203W', N'Thiết kế mới siêu mỏng nhẹ, đường nét hiện đại vượt thời gian, màn hình OLED 2.8K hoàn hảo và cấu hình đẳng cấp từ bộ vi xử lý Intel thế hệ thứ 13, ASUS Zenbook UX3402VA-KM203W đưa bạn đến những trải nghiệm chưa từng có về sức mạnh, tốc độ, hình ảnh cùng niềm cảm hứng bất tận.', 22990000.0000, 22990000.0000, 0, N'asus-zenbook-ux3402.jpg', 8, 1, 2, 3, N'Intel Core i5', N'16GB', N'SSD 512GB', N'Onboard', N'14inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (13, N'MSI Prestige 14Evo B13M-401VN ', N'MSI Prestige 14 Evo B13M-401VN hướng đến đối tượng sử dụng là các nhân viên văn phòng muốn sở hữu một cỗ máy làm việc có vẻ ngoài sang trọng, chính vì vậy máy đã sử dụng chất liệu thép cùng với màu bạc để phủ toàn thân. Khu vực mặt lưng phía sau cũng được làm tối giản với độc nhất logo MSI ở phía trên, ngoài ra không có bất kì một họa tiết hay hoa văn nào khác. Chính vì được làm từ chất liệu thép, máy sẽ không bám vân tay và bụi bẩn cũng như có khả năng chống trầy xước rất tốt', 21990000.0000, 21990000.0000, 0, N'msi-14evo-b13.jpg', 10, 1, 6, 3, N'Intel Core i5', N'16GB', N'SSD 512GB', N'Onboard', N'14inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (14, N'Dell Inspiron 15 N3530', N'Laptop Dell Inspiron 15 3530 vẫn được thiết kế như các phiên bản trước đó, ưu tiên sự mỏng nhẹ, tiện lợi cho người dùng có thể dễ dàng di chuyển trong phòng làm việc hay đi học, đi chơi. Bên cạnh đó, Dell Inspiron sở hữu gam màu đen ấn tượng và bắt kịp xu hướng của giới trẻ hiện nay là sự mạnh mẽ, đơn giản. Tổng thể chiếc laptop được thiết kế với khung và vỏ nhựa cứng, tuy nhiên sẽ không làm giảm sự sang trọng của chiếc máy mà còn giúp giảm chi phí và trông chiếc laptop gọn nhẹ hơn bao giờ hết.', 23990000.0000, 23990000.0000, 0, N'dell-15-n3530.jpg', 8, 1, 4, 3, N'Intel Core i7', N'16GB', N'SSD 512GB', N'Nvidia MX550 2GB', N'15.6inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (15, N'MacBook Air 13', N'MacBook Air M2 2022 sẽ khiến bạn kinh ngạc về độ mỏng gọn của mình. Sự hỗ trợ của chip xử lý Apple M2 giúp sản phẩm vừa đảm bảo được sức mạnh ấn tượng mà vẫn duy trì được tính thời trang và vẻ ngoài sắc sảo.', 26000000.0000, 26000000.0000, 0, N'mac-air-m2.jpg', 12, 1, 1, 3, N'M2', N'8GB', N'SSD 256GB', N'Onboard', N'13inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (16, N'MacBook Pro 14', N'Với dòng laptop mới của thương hiệu vừa được ra mắt trong thời gian mới đây, Macbook Pro 14 2023 M2 Pro mang lại cho chúng ta hai lựa chọn màu sắc. Phù hợp cho người dùng thích sự đơn giản và tông màu trung tính đó là xám và bạc quen thuộc. Thiết kế mang lại sự sang trọng khó dòng laptop nào làm được.Với thiết kế vô cùng mỏng nhẹ mà Apple hướng đến, màn hình tràn viền cùng bàn phím vô cùng đẹp mắt. Logo quả táo khuyết quen thuộc vẫn được đặt sau lưng máy nhưng được tăng kích thước.', 41990000.0000, 41990000.0000, 0, N'mac-pro-m2pro.jpg', 10, 1, 1, 4, N'M2', N'16GB', N'SSD 512GB', N'Onboard', N'14inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (17, N'Dell precision 7670', N'Với Dell Precision 7670 Workstation bạn sẽ có một chiếc máy trạm đúng nghĩa, to dày, chắc chắn với chất liệu được làm từ nhôm nguyên khối cùng với logo Dell được CNC tỉ mỉ ở mặt sau càng tôn lên sự sang trọng.Tính bền bỉ còn được thể hiện khi chiếc Dell Precision này đạt được tiêu chuẩn Quân đội MIL-STD 810G giúp nó có thể làm việc tốt trong bất kì điều kiện khắc nghiệt nào.', 37500000.0000, 37500000.0000, 0, N'dell-precision-7670.jpg', 6, 1, 4, 4, N'Intel Core i7', N'32GB', N'SSD 1TB', N'Nvidia RTX A1000 4GB', N'16inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (18, N'Lenovo Thinkpad P14S G2', N'Lenovo ThinkPad P14s G2 thích hợp cho kiến trúc sư, kỹ sư hay những người làm công việc sáng tạo, thường xuyên phải di chuyển nhiều khi sở hữu hiệu suất hết sức mạnh mẽ. Bộ vi xử lý Intel Core i5 với 4 nhân 8 luồng, sản xuất trên tiến trình 10nm tiên tiến mang đến tốc độ nhanh chóng. Trong khi đó card đồ họa chuyên nghiệp cung cấp sức mạnh đồ họa, khả năng kết xuất và các nhiệm vụ chuyên sâu khác.', 25990000.0000, 25990000.0000, 0, N'thinkpad-p14s-g2.jpg', 14, 1, 7, 4, N'Intel Core i5', N'16GB', N'SSD 512GB', N'Nvidia Quadro T500 4GB', N'14inch')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Saler')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Customer')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (4, N'Marketer')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([ID], [Img], [Title], [Description]) VALUES (1, N'Laptop-thuong-thang1.jpg', N'Sale Sốc Cuối Năm - Sắm Ngay Laptop', N'Cuối năm sale sốc, chương trình khuyến mại siêu hấp dẫn dành cho tất cả Quý khách hàng: Laptop Core i3 giá siêu khuyến mãi chỉ từ 7.990.000 VNĐ. Học sinh, sinh viên nhận thêm ưu đãi riêng với chương trình giảm giá tới 368.000VNĐ. ')
INSERT [dbo].[Slider] ([ID], [Img], [Title], [Description]) VALUES (2, N'Laptop-hanghieu.jpg', N'Laptop hàng hiệu - Ưu đãi tiền triệu', N'Chỉ cần ngồi nhà, không cần đi đâu xa mà bạn vẫn mua sắm được các sản phẩm laptop chất lượng, hấp dẫn với chương trình "Laptop hàng hiệu - Ưu đãi tiền triệu". Theo đó khách hàng khi mua các sản phẩm Laptop sẽ được hưởng ngay ưu đãi giảm giá lên đến 1.000.000đ và kèm theo các ưu đãi giá trị khác. ')
INSERT [dbo].[Slider] ([ID], [Img], [Title], [Description]) VALUES (3, N'lg-thu-cu-gia-hoi-len-doi.jpg', N'Tự tin thu cũ giá hời - Lên đời máy chất với laptop LG', N'Cùng thương hiệu LG triển khải chương trình “Thu cũ đổi mới" với trợ giá lên đến 4 triệu đồng cùng nhiều quà tặng hấp dẫn, LG giúp các bạn trẻ dễ dàng lên đời các dòng máy LG gram, hòa nhịp cùng thế hệ “làm chất - cân tất".')
SET IDENTITY_INSERT [dbo].[Slider] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Gender], [Email], [Phone], [Address], [RoleID], [Status]) VALUES (1, N'admin', N'admin', N'admin', 1, N'admin@gmail.com', N'0128346728', N'Ha noi', 1, 1)
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Gender], [Email], [Phone], [Address], [RoleID], [Status]) VALUES (2, N'sale', N'sale', N'Sale', 1, N'sale@gmail.com', N'0963726578', N'Ha noi', 2, 1)
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Gender], [Email], [Phone], [Address], [RoleID], [Status]) VALUES (3, N'customer', N'customer', N'Customer', 1, N'customer@gmail.com', N'0864528759', N'Ha noi', 3, 1)
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Gender], [Email], [Phone], [Address], [RoleID], [Status]) VALUES (4, N'marketing', N'marketing', N'Marketing', 1, N'marketing@gmail.com', N'0964738921', N'Ha noi', 4, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Product]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([Order_ID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [BrandID_in_Brand] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brand] ([BrandID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [BrandID_in_Brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [product_in_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [product_in_Category]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [RoleID_in_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [RoleID_in_Role]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [CK__Product__Discoun__31EC6D26] CHECK  (([Discount]>=(0) AND [Discount]<=(100)))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [CK__Product__Discoun__31EC6D26]
GO
USE [master]
GO
ALTER DATABASE [OnlineShop3] SET  READ_WRITE 
GO
