USE [OnlineShop3]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([BrandID], [BrandName], [phoneContact], [address], [country], [status]) VALUES (1, N'BrandA', N'123-456-7890', N'123 Main St                                                                                                                                                                                                                                                    ', N'CountryA', 1)
INSERT [dbo].[Brand] ([BrandID], [BrandName], [phoneContact], [address], [country], [status]) VALUES (2, N'BrandB', N'987-654-3210', N'456 Oak St                                                                                                                                                                                                                                                     ', N'CountryB', 1)
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Laptops')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Smartphones')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Tablets')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'Cameras')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'Headphones')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (9, N'Laptop D1', N'Premium laptop with OLED display and discrete graphics', 35900000, 31900000, 0.1, N'images\baotram.jpg', 15, 1, 1, 1, N'Intel i9', N'64GB', N'1TB SSD', N'NVIDIA RTX 3070', N'15.6 inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (10, N'Smartphone D2', N'Foldable smartphone with innovative design', 28900000, 24900000, 0.14, N'images\baotram.jpg', 30, 1, 2, 2, N'Snapdragon 888', N'16GB', N'256GB', N'Adreno 660', N'7.6 inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (11, N'Tablet E1', N'Versatile tablet with pen support for creative professionals', 15500000, 13900000, 0.09, N'images\baotram.jpg', 25, 1, 1, 3, N'Octa-core', N'6GB', N'256GB', N'Adreno 618', N'12.4 inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (12, N'Camera E2', N'High-resolution DSLR camera with advanced autofocus system', 44900000, 38900000, 0.13, N'images\baotram.jpg', 12, 1, 2, 4, N'Canon EOS 5D Mark IV', N'128GB', N'512GB SD', N'N/A', N'N/A')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (13, N'Laptop F1', N'Budget-friendly laptop for everyday tasks', 16900000, 14900000, 0.11, N'images\baotram.jpg', 40, 1, 1, 1, N'Intel i5', N'8GB', N'512GB SSD', N'Intel UHD Graphics', N'14 inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (14, N'Smartphone F2', N'Mid-range smartphone with versatile camera setup', 11200000, 9900000, 0.12, N'images\baotram.jpg', 60, 1, 2, 2, N'Snapdragon 720G', N'4GB', N'128GB', N'Adreno 618', N'6.44 inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (15, N'Laptop G1', N'Convertible laptop with touchscreen for productivity', 24900000, 21900000, 0.12, N'images\baotram.jpg', 18, 1, 1, 3, N'AMD Ryzen 7', N'16GB', N'1TB NVMe SSD', N'AMD Radeon Graphics', N'13.3 inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (16, N'Smartphone G2', N'Rugged smartphone with waterproof and shockproof features', 17900000, 15900000, 0.11, N'images\baotram.jpg', 27, 1, 2, 4, N'Helio P35', N'6GB', N'128GB', N'PowerVR GE8320', N'5.7 inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (21, N'Laptop H1', N'Gaming laptop with high-refresh-rate display', 28900000, 25900000, 0.1, N'images\baotram.jpg', 22, 1, 1, 1, N'AMD Ryzen 5', N'16GB', N'512GB SSD', N'NVIDIA GTX 1660 Ti', N'15.6 inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (22, N'Smartphone H2', N'Flagship smartphone with AI-enhanced camera features', 21500000, 18900000, 0.12, N'images\baotram.jpg', 35, 1, 2, 2, N'Snapdragon 865', N'12GB', N'256GB', N'Adreno 650', N'6.7 inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (23, N'Tablet I1', N'Compact tablet with long battery life', 10500000, 8900000, 0.07, N'images\baotram.jpg', 28, 1, 1, 3, N'Octa-core', N'4GB', N'128GB', N'Mali-G72 MP3', N'8.0 inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (24, N'Camera I2', N'Mirrorless camera with 4K video recording', 17900000, 15900000, 0.09, N'images\baotram.jpg', 13, 1, 1, 4, N'Sony Alpha a6100', N'32GB', N'256GB SD', N'N/A', N'N/A')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (25, N'Laptop J1', N'Premium ultrabook with touchscreen and fingerprint sensor', 35900000, 32900000, 0.08, N'images\baotram.jpg', 17, 1, 2, 1, N'Intel i7', N'16GB', N'1TB NVMe SSD', N'Intel Iris Xe Graphics', N'13.3 inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (26, N'Smartphone J2', N'Affordable smartphone with dual-camera setup', 11200000, 9900000, 0.12, N'images\baotram.jpg', 45, 1, 1, 2, N'Snapdragon 665', N'4GB', N'64GB', N'Adreno 610', N'6.5 inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (27, N'Laptop D1', N'Premium laptop with OLED display and discrete graphics', 35900000, 31900000, 0.1, N'images\baotram.jpg', 15, 1, 1, 1, N'Intel i9', N'64GB', N'1TB SSD', N'NVIDIA RTX 3070', N'15.6 inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (28, N'Laptop D1', N'Premium laptop with OLED display and discrete graphics', 35900000, 31900000, 0.1, N'images\baotram.jpg', 14, 1, 1, 1, N'Intel i9', N'64GB', N'1TB SSD', N'NVIDIA RTX 3070', N'15.6 inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (29, N'may tinh bang 1', N'<p>ok dep do</p>', 10000000, 10000000, 0.1, N'images/416491838_770296531616146_1540081363864174141_n.jpg', 1000, 1, 1, 1, N'intel i9', N'64', N'1tb hdd', N'abc gta 999', N'21.5 inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (30, N'hahah hihiihih okok', N'hiih được đ', 2450000, 2500000, 0.2, N'images/349670168_269565538962855_8509813916598241968_n.jpg', 1000, 1, 2, 2, N'intel i9', N'64', N'1tb hdd', N'abc gta 999', N'21.5 inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (31, N'hu hah hihji', N'akj @df xin xi con dê', 2200000, 3500000, 0.1, N'images/', 1000, 1, 2, 3, N'intel i9', N'6GB', N'500gb hdd', N'abc gta 222', N'24.5 inch')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginPrice], [SalePrice], [Discount], [ProductImg], [Quantity], [ProductStatus], [BrandID], [CategoryID], [CPU], [RAM], [Capacity], [GraphicCard], [Display]) VALUES (32, N'con vit con', N'ok con vit 4 chan', 200000, 300000, 0.1, N'images/hinh-nen-may-tinh-hoat-hinh-hai-huoc_085722595.jpg', 1000, 1, 1, 5, N'intel i9', N'64', N'1tb hdd', N'abc gta 999', N'21.5 inch')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Username], [Password], [firstName], [lastName], [Gender], [Email], [Phone], [Address], [status]) VALUES (1, N'khanhpd', N'433FC25BC782D6BFBB88A70EEA7CFA83', N'Pham', N'Khanh', 1, N'duykhanhdeptrai2002@gmail.com', N'0966328802', N'Ha Noi- Viet Nam', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [UserID], [OrderDate], [Address], [Phone], [TotalMoney], [OrderNote], [OrderStatus], [amountCoupon]) VALUES (2, 1, CAST(N'2024-02-19' AS Date), N'Ha Noi- Viet Nam', N'0966328802', 30218000, N'', 1, 50000)
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderDate], [Address], [Phone], [TotalMoney], [OrderNote], [OrderStatus], [amountCoupon]) VALUES (3, 1, CAST(N'2024-02-19' AS Date), N'Ha Noi- Viet Nam', N'0966328802', 71749000, N'', 1, 50000)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (2, 25, 1, 18, 0.08)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (3, 24, 2, 15, 0.09)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (3, 16, 1, 28, 0.11)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price], [Discount]) VALUES (3, 28, 1, 15, 0.1)
GO
SET IDENTITY_INSERT [dbo].[Coupon] ON 

INSERT [dbo].[Coupon] ([ID], [Code], [Value], [Type], [expirationDate]) VALUES (1, N'GIAM10', 0.1, 1, CAST(N'2024-03-31' AS Date))
INSERT [dbo].[Coupon] ([ID], [Code], [Value], [Type], [expirationDate]) VALUES (2, N'KHUYENMAI50', 50000, 0, CAST(N'2024-02-28' AS Date))
INSERT [dbo].[Coupon] ([ID], [Code], [Value], [Type], [expirationDate]) VALUES (3, N'GIAOHANGMIENPHI', 1, 1, CAST(N'2024-04-15' AS Date))
SET IDENTITY_INSERT [dbo].[Coupon] OFF
GO
