USE [master]
GO
/****** Object:  Database [StockManagementSystem]    Script Date: 8/29/2018 7:45:01 AM ******/
CREATE DATABASE [StockManagementSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StockManagementSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\StockManagementSystem.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StockManagementSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\StockManagementSystem_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StockManagementSystem] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockManagementSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StockManagementSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StockManagementSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StockManagementSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StockManagementSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [StockManagementSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StockManagementSystem] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [StockManagementSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StockManagementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StockManagementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StockManagementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StockManagementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StockManagementSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StockManagementSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StockManagementSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StockManagementSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StockManagementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StockManagementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StockManagementSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StockManagementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StockManagementSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StockManagementSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StockManagementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StockManagementSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StockManagementSystem] SET  MULTI_USER 
GO
ALTER DATABASE [StockManagementSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StockManagementSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StockManagementSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StockManagementSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [StockManagementSystem]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/29/2018 7:45:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[SL] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](100) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[SL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company]    Script Date: 8/29/2018 7:45:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[SL] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Company_1] PRIMARY KEY CLUSTERED 
(
	[SL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item]    Script Date: 8/29/2018 7:45:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item](
	[ItemNo] [int] IDENTITY(1,1) NOT NULL,
	[CategorySL] [int] NOT NULL,
	[CompanySL] [int] NOT NULL,
	[ItemName] [varchar](150) NULL,
	[ReorderLevel] [int] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockIn]    Script Date: 8/29/2018 7:45:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockIn](
	[StockInNo] [int] IDENTITY(1,1) NOT NULL,
	[CompanySL] [int] NULL,
	[ItemNo] [int] NULL,
	[StockInQuantity] [int] NULL,
 CONSTRAINT [PK_StockIn] PRIMARY KEY CLUSTERED 
(
	[StockInNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockOut]    Script Date: 8/29/2018 7:45:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockOut](
	[StockOutNo] [int] IDENTITY(1,1) NOT NULL,
	[CompanySL] [int] NULL,
	[ItemNo] [int] NULL,
	[StockOutQuantity] [int] NULL,
	[Type] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
 CONSTRAINT [PK_StockOut] PRIMARY KEY CLUSTERED 
(
	[StockOutNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/29/2018 7:45:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[SalesReport]    Script Date: 8/29/2018 7:45:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SalesReport]
AS
SELECT        dbo.Item.ItemName, SUM(dbo.StockOut.StockOutQuantity) AS SalesQuantity, dbo.StockOut.Type, dbo.StockOut.Date
FROM            dbo.Item INNER JOIN
                         dbo.StockOut ON dbo.Item.ItemNo = dbo.StockOut.ItemNo
WHERE        (dbo.StockOut.Type = 'Sell')
GROUP BY dbo.Item.ItemName, dbo.StockOut.Type, dbo.StockOut.Date



GO
/****** Object:  View [dbo].[SearchCompanyCategory]    Script Date: 8/29/2018 7:45:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SearchCompanyCategory]
AS
SELECT        dbo.Category.CategoryName, dbo.Company.CompanyName, dbo.Item.ItemName, dbo.StockIn.StockInQuantity, dbo.Item.ItemNo, dbo.Item.ReorderLevel
FROM            dbo.Category INNER JOIN
                         dbo.Company ON dbo.Category.SL = dbo.Company.SL INNER JOIN
                         dbo.Item ON dbo.Category.SL = dbo.Item.CategorySL AND dbo.Company.SL = dbo.Item.CompanySL INNER JOIN
                         dbo.StockIn ON dbo.Company.SL = dbo.StockIn.CompanySL


GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([SL], [CategoryName]) VALUES (1, N'Stationary')
INSERT [dbo].[Category] ([SL], [CategoryName]) VALUES (2, N'Cosmetics')
INSERT [dbo].[Category] ([SL], [CategoryName]) VALUES (3, N'Electronics')
INSERT [dbo].[Category] ([SL], [CategoryName]) VALUES (4, N'Kitchen Items')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([SL], [CompanyName]) VALUES (1, N'Unilever')
INSERT [dbo].[Company] ([SL], [CompanyName]) VALUES (2, N'RFL')
INSERT [dbo].[Company] ([SL], [CompanyName]) VALUES (3, N'Walton')
INSERT [dbo].[Company] ([SL], [CompanyName]) VALUES (4, N'Nova')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([ItemNo], [CategorySL], [CompanySL], [ItemName], [ReorderLevel]) VALUES (6, 1, 1, N'Panjabi', 0)
INSERT [dbo].[Item] ([ItemNo], [CategorySL], [CompanySL], [ItemName], [ReorderLevel]) VALUES (8, 2, 1, N'TShirts', 20)
INSERT [dbo].[Item] ([ItemNo], [CategorySL], [CompanySL], [ItemName], [ReorderLevel]) VALUES (9, 2, 2, N'Shirts', 21)
INSERT [dbo].[Item] ([ItemNo], [CategorySL], [CompanySL], [ItemName], [ReorderLevel]) VALUES (10, 1, 2, N'Table', 5)
INSERT [dbo].[Item] ([ItemNo], [CategorySL], [CompanySL], [ItemName], [ReorderLevel]) VALUES (11, 3, 4, N'mobile', 10)
INSERT [dbo].[Item] ([ItemNo], [CategorySL], [CompanySL], [ItemName], [ReorderLevel]) VALUES (12, 2, 1, N'Lux', 15)
INSERT [dbo].[Item] ([ItemNo], [CategorySL], [CompanySL], [ItemName], [ReorderLevel]) VALUES (13, 3, 3, N'PhoneRX2', 0)
INSERT [dbo].[Item] ([ItemNo], [CategorySL], [CompanySL], [ItemName], [ReorderLevel]) VALUES (14, 4, 2, N'test', 0)
SET IDENTITY_INSERT [dbo].[Item] OFF
SET IDENTITY_INSERT [dbo].[StockIn] ON 

INSERT [dbo].[StockIn] ([StockInNo], [CompanySL], [ItemNo], [StockInQuantity]) VALUES (1, 1, 1, 4)
INSERT [dbo].[StockIn] ([StockInNo], [CompanySL], [ItemNo], [StockInQuantity]) VALUES (2, 2, 3, 1)
INSERT [dbo].[StockIn] ([StockInNo], [CompanySL], [ItemNo], [StockInQuantity]) VALUES (3, 3, 4, 33)
INSERT [dbo].[StockIn] ([StockInNo], [CompanySL], [ItemNo], [StockInQuantity]) VALUES (4, 1, 6, 36)
INSERT [dbo].[StockIn] ([StockInNo], [CompanySL], [ItemNo], [StockInQuantity]) VALUES (5, 1, 8, 9)
INSERT [dbo].[StockIn] ([StockInNo], [CompanySL], [ItemNo], [StockInQuantity]) VALUES (6, 2, 4, 2)
INSERT [dbo].[StockIn] ([StockInNo], [CompanySL], [ItemNo], [StockInQuantity]) VALUES (7, 3, 2, 10)
INSERT [dbo].[StockIn] ([StockInNo], [CompanySL], [ItemNo], [StockInQuantity]) VALUES (8, 4, 11, 97)
INSERT [dbo].[StockIn] ([StockInNo], [CompanySL], [ItemNo], [StockInQuantity]) VALUES (9, 1, 12, 187)
INSERT [dbo].[StockIn] ([StockInNo], [CompanySL], [ItemNo], [StockInQuantity]) VALUES (10, 2, 10, 490)
INSERT [dbo].[StockIn] ([StockInNo], [CompanySL], [ItemNo], [StockInQuantity]) VALUES (11, 3, 13, 51)
INSERT [dbo].[StockIn] ([StockInNo], [CompanySL], [ItemNo], [StockInQuantity]) VALUES (12, 2, 14, 201)
SET IDENTITY_INSERT [dbo].[StockIn] OFF
SET IDENTITY_INSERT [dbo].[StockOut] ON 

INSERT [dbo].[StockOut] ([StockOutNo], [CompanySL], [ItemNo], [StockOutQuantity], [Type], [Date]) VALUES (33, 1, 8, 10, N'Damage', N'08/29/2018')
INSERT [dbo].[StockOut] ([StockOutNo], [CompanySL], [ItemNo], [StockOutQuantity], [Type], [Date]) VALUES (35, 1, 12, 10, N'Sell', N'08/29/2018')
INSERT [dbo].[StockOut] ([StockOutNo], [CompanySL], [ItemNo], [StockOutQuantity], [Type], [Date]) VALUES (36, 1, 12, 10, N'Sell', N'08/29/2018')
INSERT [dbo].[StockOut] ([StockOutNo], [CompanySL], [ItemNo], [StockOutQuantity], [Type], [Date]) VALUES (37, 1, 12, 3, N'Sell', N'08/29/2018')
INSERT [dbo].[StockOut] ([StockOutNo], [CompanySL], [ItemNo], [StockOutQuantity], [Type], [Date]) VALUES (40, 2, 10, 100, NULL, NULL)
INSERT [dbo].[StockOut] ([StockOutNo], [CompanySL], [ItemNo], [StockOutQuantity], [Type], [Date]) VALUES (41, 4, 11, 10, NULL, NULL)
INSERT [dbo].[StockOut] ([StockOutNo], [CompanySL], [ItemNo], [StockOutQuantity], [Type], [Date]) VALUES (42, 4, 11, 3, N'Sell', N'08/29/2018')
INSERT [dbo].[StockOut] ([StockOutNo], [CompanySL], [ItemNo], [StockOutQuantity], [Type], [Date]) VALUES (43, 3, 13, 3, NULL, NULL)
INSERT [dbo].[StockOut] ([StockOutNo], [CompanySL], [ItemNo], [StockOutQuantity], [Type], [Date]) VALUES (44, 3, 13, 3, N'Sell', N'08/29/2018')
INSERT [dbo].[StockOut] ([StockOutNo], [CompanySL], [ItemNo], [StockOutQuantity], [Type], [Date]) VALUES (45, 3, 13, 3, N'Sell', N'08/29/2018')
INSERT [dbo].[StockOut] ([StockOutNo], [CompanySL], [ItemNo], [StockOutQuantity], [Type], [Date]) VALUES (46, 2, 14, 3, NULL, NULL)
INSERT [dbo].[StockOut] ([StockOutNo], [CompanySL], [ItemNo], [StockOutQuantity], [Type], [Date]) VALUES (47, 2, 14, 3, NULL, NULL)
INSERT [dbo].[StockOut] ([StockOutNo], [CompanySL], [ItemNo], [StockOutQuantity], [Type], [Date]) VALUES (48, 2, 14, 3, N'Sell', N'08/29/2018')
INSERT [dbo].[StockOut] ([StockOutNo], [CompanySL], [ItemNo], [StockOutQuantity], [Type], [Date]) VALUES (49, 2, 14, 10, N'Sell', N'08/29/2018')
SET IDENTITY_INSERT [dbo].[StockOut] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [UserName], [Password]) VALUES (1, N'Anis', N'12345')
INSERT [dbo].[Users] ([UserId], [UserName], [Password]) VALUES (2, N'Fariha', N'12345')
INSERT [dbo].[Users] ([UserId], [UserName], [Password]) VALUES (3, N'Sonia', N'12345')
INSERT [dbo].[Users] ([UserId], [UserName], [Password]) VALUES (4, N'Lipi', N'12345')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Category] FOREIGN KEY([CategorySL])
REFERENCES [dbo].[Category] ([SL])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Category]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Company] FOREIGN KEY([CompanySL])
REFERENCES [dbo].[Company] ([SL])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Company]
GO
ALTER TABLE [dbo].[StockIn]  WITH CHECK ADD  CONSTRAINT [FK_StockIn_Company] FOREIGN KEY([CompanySL])
REFERENCES [dbo].[Company] ([SL])
GO
ALTER TABLE [dbo].[StockIn] CHECK CONSTRAINT [FK_StockIn_Company]
GO
ALTER TABLE [dbo].[StockOut]  WITH CHECK ADD  CONSTRAINT [FK_StockOut_Company] FOREIGN KEY([CompanySL])
REFERENCES [dbo].[Company] ([SL])
GO
ALTER TABLE [dbo].[StockOut] CHECK CONSTRAINT [FK_StockOut_Company]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Item"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 221
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "StockOut"
            Begin Extent = 
               Top = 6
               Left = 259
               Bottom = 136
               Right = 442
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SalesReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SalesReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Category"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Company"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 419
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Item"
            Begin Extent = 
               Top = 6
               Left = 457
               Bottom = 136
               Right = 627
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "StockIn"
            Begin Extent = 
               Top = 6
               Left = 665
               Bottom = 136
               Right = 839
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SearchCompanyCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SearchCompanyCategory'
GO
USE [master]
GO
ALTER DATABASE [StockManagementSystem] SET  READ_WRITE 
GO
