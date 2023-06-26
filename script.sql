USE [master]
GO
/****** Object:  Database [CustomerDB]    Script Date: 5/26/2023 2:29:54 PM ******/
CREATE DATABASE [CustomerDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CustomerDB', FILENAME = N'C:\Users\z004rf0a\CustomerDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CustomerDB_log', FILENAME = N'C:\Users\z004rf0a\CustomerDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CustomerDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CustomerDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CustomerDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CustomerDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CustomerDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CustomerDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CustomerDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CustomerDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CustomerDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CustomerDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CustomerDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CustomerDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CustomerDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CustomerDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CustomerDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CustomerDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CustomerDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CustomerDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CustomerDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CustomerDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CustomerDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CustomerDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CustomerDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CustomerDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CustomerDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CustomerDB] SET  MULTI_USER 
GO
ALTER DATABASE [CustomerDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CustomerDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CustomerDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CustomerDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CustomerDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CustomerDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CustomerDB] SET QUERY_STORE = OFF
GO
USE [CustomerDB]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/26/2023 2:29:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] NOT NULL,
	[FirstName] [varchar](20) NULL,
	[LastName] [varchar](20) NULL,
	[AddressId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustAddress]    Script Date: 5/26/2023 2:29:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustAddress](
	[AddressId] [int] NOT NULL,
	[AddressText] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustPassword]    Script Date: 5/26/2023 2:29:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustPassword](
	[CustomerId] [int] NOT NULL,
	[CPassword] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Temp]    Script Date: 5/26/2023 2:29:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Temp]
AS
SELECT c.Id, p.CPassword, c.FirstName, c.LastName, a.AddressId AS Expr1, a.AddressId, a.AddressText
FROM     dbo.Customer AS c INNER JOIN
                  dbo.CustAddress AS a ON c.AddressId = a.AddressId INNER JOIN
                  dbo.CustPassword AS p ON c.Id = p.CustomerId
GO
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (100, N'MAD-e145')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (101, N'USA')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (102, N'UK')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (103, N'UKSS123')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (104, N'RUSSIA')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (105, N'IND')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (106, N'JAPAN')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (107, N'IND')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (108, N'AFG')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (109, N'ALB')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (110, N'DZA')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (111, N'ASM')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (112, N'AND')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (113, N'AGO')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (114, N'AIA')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (115, N'ATA')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (116, N'ATG')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (117, N'ARG')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (118, N'ARM')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (119, N'ABW')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (120, N'AUS')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (121, N'AUT')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (122, N'AZE')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (123, N'BHS')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (124, N'BHR')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (125, N'BGD')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (126, N'BRB')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (127, N'BLR')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (128, N'BEL')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (129, N'BLZ')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (130, N'BEN')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (131, N'BMU')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (132, N'BTN')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (133, N'BOL')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (134, N'BES')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (135, N'BIH')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (136, N'BWA')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (137, N'BVT')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (138, N'BRA')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (139, N'IOT')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (140, N'BRN')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (141, N'BGR')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (142, N'BFA')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (143, N'BDI')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (144, N'CPV')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (145, N'KHM')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (146, N'CMR')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (147, N'CAN')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (148, N'CYM')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (149, N'CAF')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (150, N'TCD')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (151, N'CHL')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (152, N'CHN')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (153, N'CXR')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (154, N'CCK')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (155, N'COL')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (156, N'COM')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (157, N'COD')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (158, N'COG')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (159, N'COK')
INSERT [dbo].[CustAddress] ([AddressId], [AddressText]) VALUES (160, N'CRI')
GO
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (1, N'John-e14', N'Lee', 100)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (2, N'Mark', N'Hastings', 101)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (3, N'Steve', N'Pound', 102)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (4, N'BenqsS123', N'Hoskins', 103)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (5, N'Philip', N'Hastings', 104)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (6, N'Mary', N'Lambeth', 105)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (7, N'Valarie', N'Vikings', 106)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (8, N'John', N'Stanmore', 107)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (9, N'string', N'string', 108)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (10, N'Mohit', N'Kumar', 109)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (11, N'Kshitija', N'Ravinder', 110)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (12, N'Anuradha', N'Reva', 111)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (13, N'Dinesh', N'Lavanya', 112)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (14, N'Jitender', N'Kaveri', 113)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (15, N'Uttara ', N'Gauri', 114)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (16, N'Aniket', N'Anit', 115)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (17, N'Vijaya', N'Brijesh', 116)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (18, N'Jyotsana ', N'Mahesh', 117)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (19, N'Partha', N'Gulshan', 118)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (20, N'Avani', N'Dipti', 119)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (21, N'Partha', N'Gulshan', 120)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (22, N'Ankit', N'Rajendra', 121)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (23, N'Surinder', N'Reshma', 122)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (24, N'Ravinder', N'Chandrasekhar', 123)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (25, N'Maya', N'Avani', 124)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (26, N'Pankaj', N'Parminder', 125)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (27, N'Purushottam', N'Shrinivas', 126)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (28, N'Nilima', N'Jagannath', 127)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (29, N'Vihaan', N'Jagjit', 128)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (30, N'Kamakshi', N'Rukmini', 129)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (31, N'Apoorva', N'Bhavana', 130)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (32, N'Dipak ', N'Drishti', 131)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (33, N'Jaya', N'Ankit', 132)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (34, N'Vinay', N'Aniruddha', 133)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (35, N'Rajnish', N'Ram', 134)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (36, N'Anita', N'Purushottam', 135)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (37, N'Ramadevi', N'Vivek', 136)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (38, N'Harendra', N'Vipul', 137)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (39, N'Avani', N'Neeraj', 138)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (40, N'Chiranjeevi ', N'Reshmi', 139)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (41, N'Ramadevi', N'Gopinath', 140)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (42, N'Shekhar ', N'Rajneesh', 141)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (43, N'Dev', N'Kirtida', 142)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (44, N'Vasu', N'Agni', 143)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (45, N'Sanjeev', N'Asha', 144)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (46, N'Jagjit', N'Mani', 145)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (47, N'Jyoti', N'Shanti', 146)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (48, N'Maya', N'Chandana', 147)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (49, N'Roshan', N'Sundar', 148)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (50, N'Ravindra', N'Ayaan', 149)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (51, N'Bipin', N'Dipa', 150)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (52, N'Namrata', N'Jayanta', 151)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (53, N'Harpreet', N'Indra', 152)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (54, N'Rambabu', N'Nandita', 153)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (55, N'Tushar', N'Aradhana', 154)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (56, N'Sushil', N'Gautam', 155)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (57, N'Bharath', N'Chandana', 156)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (58, N'Sri', N'Gita', 157)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (59, N'Pran', N'Sumeet', 158)
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [AddressId]) VALUES (60, N'Mohandas', N'Narinder', 159)
GO
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (1, N'12345')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (2, N'23456')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (3, N'34567')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (4, N'45678')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (5, N'56789')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (6, N'67890')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (7, N'78901')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (8, N'89123')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (9, N'91234')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (10, N'10123')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (11, N'11234')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (12, N'12345')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (13, N'13456')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (14, N'14567')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (15, N'15678')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (16, N'16789')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (17, N'17890')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (18, N'18910')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (19, N'19101')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (20, N'20123')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (21, N'21234')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (22, N'22345')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (23, N'23456')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (24, N'24567')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (25, N'25678')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (26, N'26789')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (27, N'27890')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (28, N'28901')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (29, N'29012')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (30, N'30123')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (31, N'31234')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (32, N'32345')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (33, N'33456')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (34, N'34567')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (35, N'35678')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (36, N'36789')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (37, N'37890')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (38, N'38901')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (39, N'39012')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (40, N'40123')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (41, N'41234')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (42, N'42345')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (43, N'43456')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (44, N'44567')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (45, N'45678')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (46, N'46789')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (47, N'47890')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (48, N'48901')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (49, N'49012')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (50, N'50123')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (51, N'51234')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (52, N'52345')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (53, N'53456')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (54, N'54567')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (55, N'55678')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (56, N'56789')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (57, N'57890')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (58, N'58901')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (59, N'59012')
INSERT [dbo].[CustPassword] ([CustomerId], [CPassword]) VALUES (60, N'60123')
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[65] 4[3] 2[13] 3) )"
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
         Top = -480
         Left = 0
      End
      Begin Tables = 
         Begin Table = "c"
            Begin Extent = 
               Top = 520
               Left = 129
               Bottom = 697
               Right = 402
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 714
               Left = 540
               Bottom = 833
               Right = 734
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 506
               Left = 770
               Bottom = 625
               Right = 964
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
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Temp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Temp'
GO
USE [master]
GO
ALTER DATABASE [CustomerDB] SET  READ_WRITE 
GO
