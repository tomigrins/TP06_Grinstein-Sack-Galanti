USE [master]
GO
/****** Object:  Database [Presentacion]    Script Date: 17/7/2025 14:57:36 ******/
CREATE DATABASE [Presentacion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Presentacion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Presentacion.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Presentacion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Presentacion_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Presentacion] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Presentacion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Presentacion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Presentacion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Presentacion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Presentacion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Presentacion] SET ARITHABORT OFF 
GO
ALTER DATABASE [Presentacion] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Presentacion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Presentacion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Presentacion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Presentacion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Presentacion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Presentacion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Presentacion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Presentacion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Presentacion] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Presentacion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Presentacion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Presentacion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Presentacion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Presentacion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Presentacion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Presentacion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Presentacion] SET RECOVERY FULL 
GO
ALTER DATABASE [Presentacion] SET  MULTI_USER 
GO
ALTER DATABASE [Presentacion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Presentacion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Presentacion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Presentacion] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Presentacion] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Presentacion', N'ON'
GO
ALTER DATABASE [Presentacion] SET QUERY_STORE = OFF
GO
USE [Presentacion]
GO
/****** Object:  User [alumno]    Script Date: 17/7/2025 14:57:36 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[DatoFamiliar]    Script Date: 17/7/2025 14:57:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatoFamiliar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Parentesco] [varchar](50) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DatoFamiliar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatoInteres]    Script Date: 17/7/2025 14:57:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatoInteres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[TipoInteres] [int] NOT NULL,
	[Interes] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DatoInteres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 17/7/2025 14:57:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[FechaNacimiento] [datetime] NOT NULL,
	[Foto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DatoFamiliar] ON 

INSERT [dbo].[DatoFamiliar] ([Id], [IdUsuario], [Nombre], [Apellido], [Parentesco], [Descripcion]) VALUES (1, 1, N'Diego', N'Grinstein', N'Padre', N'Es mi papa.')
INSERT [dbo].[DatoFamiliar] ([Id], [IdUsuario], [Nombre], [Apellido], [Parentesco], [Descripcion]) VALUES (2, 1, N'Lionel', N'Messi', N'Hermanos', N'Somos identicos.')
INSERT [dbo].[DatoFamiliar] ([Id], [IdUsuario], [Nombre], [Apellido], [Parentesco], [Descripcion]) VALUES (3, 2, N'Magali', N'Galanti', N'Hermana', N'Tiene 6 años.')
INSERT [dbo].[DatoFamiliar] ([Id], [IdUsuario], [Nombre], [Apellido], [Parentesco], [Descripcion]) VALUES (4, 2, N'Romina', N'Goldfarb', N'Madre', N'Trabaja en ORT.')
INSERT [dbo].[DatoFamiliar] ([Id], [IdUsuario], [Nombre], [Apellido], [Parentesco], [Descripcion]) VALUES (5, 3, N'Alejandro (Marley)', N'Wiebe', N'Tio', N'Viaja por el Mundo.')
INSERT [dbo].[DatoFamiliar] ([Id], [IdUsuario], [Nombre], [Apellido], [Parentesco], [Descripcion]) VALUES (6, 3, N'Mariangeles', N'Macagno', N'Madre', N'Es mi mamá')
INSERT [dbo].[DatoFamiliar] ([Id], [IdUsuario], [Nombre], [Apellido], [Parentesco], [Descripcion]) VALUES (7, 3, N'Mirko', N'Wiebe', N'Primo', N'Es muy tierno.')
SET IDENTITY_INSERT [dbo].[DatoFamiliar] OFF
GO
SET IDENTITY_INSERT [dbo].[DatoInteres] ON 

INSERT [dbo].[DatoInteres] ([Id], [IdUsuario], [TipoInteres], [Interes]) VALUES (1, 1, 1, N'futbol')
INSERT [dbo].[DatoInteres] ([Id], [IdUsuario], [TipoInteres], [Interes]) VALUES (2, 1, 3, N'Stanca')
INSERT [dbo].[DatoInteres] ([Id], [IdUsuario], [TipoInteres], [Interes]) VALUES (3, 1, 3, N'Leo')
INSERT [dbo].[DatoInteres] ([Id], [IdUsuario], [TipoInteres], [Interes]) VALUES (4, 2, 4, N'Crema del Cielo')
INSERT [dbo].[DatoInteres] ([Id], [IdUsuario], [TipoInteres], [Interes]) VALUES (6, 2, 4, N'Dulce de Leche Granizado')
INSERT [dbo].[DatoInteres] ([Id], [IdUsuario], [TipoInteres], [Interes]) VALUES (7, 2, 2, N'Drácula, de Bram Stoker')
INSERT [dbo].[DatoInteres] ([Id], [IdUsuario], [TipoInteres], [Interes]) VALUES (8, 3, 2, N'Outer Banks')
INSERT [dbo].[DatoInteres] ([Id], [IdUsuario], [TipoInteres], [Interes]) VALUES (9, 3, 4, N'Chocolate')
INSERT [dbo].[DatoInteres] ([Id], [IdUsuario], [TipoInteres], [Interes]) VALUES (10, 3, 3, N'Galanti')
SET IDENTITY_INSERT [dbo].[DatoInteres] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [FechaNacimiento], [Foto]) VALUES (1, N'Tomás', N'Grinstein', N'49190820@est.ort.edu.ar', N'leoteamo', CAST(N'2009-02-01T00:00:00.000' AS DateTime), N'/Imagenes/FotoTomi.JPG')
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [FechaNacimiento], [Foto]) VALUES (2, N'Uriel', N'Galanti', N'49553172@est.ort.edu.ar', N'secreto', CAST(N'2009-06-04T00:00:00.000' AS DateTime), N'/Imagenes/FotoGalanti.JPG')
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contraseña], [FechaNacimiento], [Foto]) VALUES (3, N'Flor', N'Sack', N'49628016@est.ort.edu.ar', N'megustaelfortnite', CAST(N'2009-06-26T00:00:00.000' AS DateTime), N'/Imagenes/FotoFlor.JPG')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[DatoFamiliar]  WITH CHECK ADD  CONSTRAINT [FK_DatoFamiliar_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[DatoFamiliar] CHECK CONSTRAINT [FK_DatoFamiliar_Usuario]
GO
ALTER TABLE [dbo].[DatoInteres]  WITH CHECK ADD  CONSTRAINT [FK_DatoInteres_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[DatoInteres] CHECK CONSTRAINT [FK_DatoInteres_Usuario]
GO
USE [master]
GO
ALTER DATABASE [Presentacion] SET  READ_WRITE 
GO
