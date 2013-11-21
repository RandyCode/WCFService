USE [master]
GO
/****** Object:  Database [ebusiness]    Script Date: 11/21/2013 16:04:46 by randy******/
CREATE DATABASE [ebusiness] ON  PRIMARY 
( NAME = N'ebusiness', FILENAME = N'D:\Database\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ebusiness.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ebusiness_log', FILENAME = N'D:\Database\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ebusiness_log.LDF' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ebusiness] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ebusiness].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ebusiness] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ebusiness] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ebusiness] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ebusiness] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ebusiness] SET ARITHABORT OFF
GO
ALTER DATABASE [ebusiness] SET AUTO_CLOSE ON
GO
ALTER DATABASE [ebusiness] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ebusiness] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ebusiness] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ebusiness] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ebusiness] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ebusiness] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ebusiness] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ebusiness] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ebusiness] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ebusiness] SET  ENABLE_BROKER
GO
ALTER DATABASE [ebusiness] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ebusiness] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ebusiness] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ebusiness] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ebusiness] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ebusiness] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ebusiness] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ebusiness] SET  READ_WRITE
GO
ALTER DATABASE [ebusiness] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ebusiness] SET  MULTI_USER
GO
ALTER DATABASE [ebusiness] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ebusiness] SET DB_CHAINING OFF
GO
USE [ebusiness]
GO
/****** Object:  Table [dbo].[business_role]    Script Date: 11/21/2013 16:04:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[business_role](
	[id] [varchar](36) NOT NULL,
	[role_name] [nvarchar](32) NOT NULL,
	[create_datetime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[business_authority]    Script Date: 11/21/2013 16:04:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[business_authority](
	[id] [varchar](36) NOT NULL,
	[authority] [nvarchar](36) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cargo_kinds]    Script Date: 11/21/2013 16:04:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cargo_kinds](
	[id] [varchar](36) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
	[createtime] [datetime] NOT NULL,
 CONSTRAINT [PK_cargo_kinds] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[business_user]    Script Date: 11/21/2013 16:04:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[business_user](
	[id] [varchar](36) NOT NULL,
	[create_datetime] [datetime] NOT NULL,
	[business_role_id] [varchar](36) NOT NULL,
	[user_name] [varchar](36) NOT NULL,
	[user_password] [varchar](32) NOT NULL,
 CONSTRAINT [PK__business__3213E83F108B795B] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[business_role_authority]    Script Date: 11/21/2013 16:04:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[business_role_authority](
	[id] [varchar](36) NOT NULL,
	[business_role_id] [varchar](36) NOT NULL,
	[business_authority_id] [varchar](36) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cargo_kinds_type]    Script Date: 11/21/2013 16:04:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cargo_kinds_type](
	[id] [varchar](36) NOT NULL,
	[name] [nvarchar](128) NOT NULL,
	[type] [nvarchar](128) NOT NULL,
	[createtime] [datetime] NOT NULL,
	[caargo_kinds_id] [varchar](36) NOT NULL,
 CONSTRAINT [PK_cargo_kinds_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cargo_product]    Script Date: 11/21/2013 16:04:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cargo_product](
	[id] [varchar](36) NOT NULL,
	[createtime] [datetime2](7) NOT NULL,
	[user_id] [varchar](36) NOT NULL,
	[cargo_kinds_type_id] [varchar](36) NOT NULL,
 CONSTRAINT [PK_cargo_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user_cart]    Script Date: 11/21/2013 16:04:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_cart](
	[id] [varchar](36) NOT NULL,
	[user_id] [varchar](36) NOT NULL,
	[product_id] [varchar](36) NOT NULL,
	[product_count] [int] NOT NULL,
	[product_total] [money] NOT NULL,
 CONSTRAINT [PK_user_cart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cargo_product_detail]    Script Date: 11/21/2013 16:04:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cargo_product_detail](
	[id] [varchar](36) NOT NULL,
	[product_id] [varchar](36) NOT NULL,
	[price] [money] NOT NULL,
	[description] [nchar](10) NULL,
	[product_name] [nvarchar](50) NOT NULL,
	[product_image] [varchar](256) NULL,
	[createtime] [datetime] NOT NULL,
 CONSTRAINT [PK_cargo_product_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cargo_product_comment]    Script Date: 11/21/2013 16:04:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cargo_product_comment](
	[id] [varchar](36) NOT NULL,
	[user_id] [varchar](36) NOT NULL,
	[product_id] [varchar](36) NOT NULL,
	[message] [nvarchar](max) NOT NULL,
	[createtime] [datetime] NOT NULL,
 CONSTRAINT [PK_cargo_product_comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_cargo_kinds_createtime]    Script Date: 11/21/2013 16:04:47 ******/
ALTER TABLE [dbo].[cargo_kinds] ADD  CONSTRAINT [DF_cargo_kinds_createtime]  DEFAULT (getdate()) FOR [createtime]
GO
/****** Object:  Default [DF_cargo_kinds_type_createtime]    Script Date: 11/21/2013 16:04:47 ******/
ALTER TABLE [dbo].[cargo_kinds_type] ADD  CONSTRAINT [DF_cargo_kinds_type_createtime]  DEFAULT (getdate()) FOR [createtime]
GO
/****** Object:  Default [DF_cargo_product_createtime]    Script Date: 11/21/2013 16:04:47 ******/
ALTER TABLE [dbo].[cargo_product] ADD  CONSTRAINT [DF_cargo_product_createtime]  DEFAULT (getdate()) FOR [createtime]
GO
/****** Object:  ForeignKey [FK__business___busin__1273C1CD]    Script Date: 11/21/2013 16:04:47 ******/
ALTER TABLE [dbo].[business_user]  WITH CHECK ADD  CONSTRAINT [FK__business___busin__1273C1CD] FOREIGN KEY([business_role_id])
REFERENCES [dbo].[business_role] ([id])
GO
ALTER TABLE [dbo].[business_user] CHECK CONSTRAINT [FK__business___busin__1273C1CD]
GO
/****** Object:  ForeignKey [FK__business___busin__173876EA]    Script Date: 11/21/2013 16:04:47 ******/
ALTER TABLE [dbo].[business_role_authority]  WITH CHECK ADD FOREIGN KEY([business_role_id])
REFERENCES [dbo].[business_role] ([id])
GO
/****** Object:  ForeignKey [FK__business___busin__182C9B23]    Script Date: 11/21/2013 16:04:47 ******/
ALTER TABLE [dbo].[business_role_authority]  WITH CHECK ADD FOREIGN KEY([business_authority_id])
REFERENCES [dbo].[business_authority] ([id])
GO
/****** Object:  ForeignKey [FK_cargo_kinds_type_cargo_kinds]    Script Date: 11/21/2013 16:04:47 ******/
ALTER TABLE [dbo].[cargo_kinds_type]  WITH CHECK ADD  CONSTRAINT [FK_cargo_kinds_type_cargo_kinds] FOREIGN KEY([caargo_kinds_id])
REFERENCES [dbo].[cargo_kinds] ([id])
GO
ALTER TABLE [dbo].[cargo_kinds_type] CHECK CONSTRAINT [FK_cargo_kinds_type_cargo_kinds]
GO
/****** Object:  ForeignKey [FK_cargo_product_cargo_kinds_type]    Script Date: 11/21/2013 16:04:47 ******/
ALTER TABLE [dbo].[cargo_product]  WITH CHECK ADD  CONSTRAINT [FK_cargo_product_cargo_kinds_type] FOREIGN KEY([cargo_kinds_type_id])
REFERENCES [dbo].[cargo_kinds_type] ([id])
GO
ALTER TABLE [dbo].[cargo_product] CHECK CONSTRAINT [FK_cargo_product_cargo_kinds_type]
GO
/****** Object:  ForeignKey [FK_user_cart_business_user]    Script Date: 11/21/2013 16:04:47 ******/
ALTER TABLE [dbo].[user_cart]  WITH CHECK ADD  CONSTRAINT [FK_user_cart_business_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[business_user] ([id])
GO
ALTER TABLE [dbo].[user_cart] CHECK CONSTRAINT [FK_user_cart_business_user]
GO
/****** Object:  ForeignKey [FK_user_cart_cargo_product]    Script Date: 11/21/2013 16:04:47 ******/
ALTER TABLE [dbo].[user_cart]  WITH CHECK ADD  CONSTRAINT [FK_user_cart_cargo_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[cargo_product] ([id])
GO
ALTER TABLE [dbo].[user_cart] CHECK CONSTRAINT [FK_user_cart_cargo_product]
GO
/****** Object:  ForeignKey [FK_cargo_product_detail_cargo_product]    Script Date: 11/21/2013 16:04:47 ******/
ALTER TABLE [dbo].[cargo_product_detail]  WITH CHECK ADD  CONSTRAINT [FK_cargo_product_detail_cargo_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[cargo_product] ([id])
GO
ALTER TABLE [dbo].[cargo_product_detail] CHECK CONSTRAINT [FK_cargo_product_detail_cargo_product]
GO
/****** Object:  ForeignKey [FK_cargo_product_comment_business_user]    Script Date: 11/21/2013 16:04:47 ******/
ALTER TABLE [dbo].[cargo_product_comment]  WITH CHECK ADD  CONSTRAINT [FK_cargo_product_comment_business_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[business_user] ([id])
GO
ALTER TABLE [dbo].[cargo_product_comment] CHECK CONSTRAINT [FK_cargo_product_comment_business_user]
GO
/****** Object:  ForeignKey [FK_cargo_product_comment_cargo_product]    Script Date: 11/21/2013 16:04:47 ******/
ALTER TABLE [dbo].[cargo_product_comment]  WITH CHECK ADD  CONSTRAINT [FK_cargo_product_comment_cargo_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[cargo_product] ([id])
GO
ALTER TABLE [dbo].[cargo_product_comment] CHECK CONSTRAINT [FK_cargo_product_comment_cargo_product]
GO
