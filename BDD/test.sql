USE [master]
GO
/****** Object:  Database [MasterChef]    Script Date: 06/12/2018 15:57:15 ******/
CREATE DATABASE [MasterChef]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MasterChef', FILENAME = N'/var/opt/mssql/data/MasterChef.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MasterChef_log', FILENAME = N'/var/opt/mssql/data/MasterChef_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MasterChef] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MasterChef].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MasterChef] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MasterChef] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MasterChef] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MasterChef] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MasterChef] SET ARITHABORT OFF 
GO
ALTER DATABASE [MasterChef] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MasterChef] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MasterChef] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MasterChef] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MasterChef] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MasterChef] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MasterChef] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MasterChef] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MasterChef] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MasterChef] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MasterChef] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MasterChef] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MasterChef] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MasterChef] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MasterChef] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MasterChef] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MasterChef] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MasterChef] SET RECOVERY FULL 
GO
ALTER DATABASE [MasterChef] SET  MULTI_USER 
GO
ALTER DATABASE [MasterChef] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MasterChef] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MasterChef] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MasterChef] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MasterChef] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MasterChef', N'ON'
GO
ALTER DATABASE [MasterChef] SET QUERY_STORE = OFF
GO
USE [MasterChef]
GO
/****** Object:  Table [dbo].[CLIENTS]    Script Date: 06/12/2018 15:57:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTS](
	[ID_CLIENT] [int] IDENTITY(0,1) NOT NULL,
	[ID_GROUPE] [int] NOT NULL,
 CONSTRAINT [PK_CLIENTS] PRIMARY KEY CLUSTERED 
(
	[ID_CLIENT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMMANDER]    Script Date: 06/12/2018 15:57:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMMANDER](
	[ID_RECETTE] [int] NOT NULL,
	[ID_TABLE] [int] NOT NULL,
 CONSTRAINT [PK_COMMANDER] PRIMARY KEY CLUSTERED 
(
	[ID_RECETTE] ASC,
	[ID_TABLE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COUVERTS]    Script Date: 06/12/2018 15:57:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COUVERTS](
	[ID_COUVERTS] [int] IDENTITY(0,1) NOT NULL,
	[NOM_COUVERTS] [varchar](15) NOT NULL,
	[NOMBRE_COUVERTS] [int] NOT NULL,
	[UTILISE_COUVERTS] [int] NULL,
 CONSTRAINT [PK_COUVERTS] PRIMARY KEY CLUSTERED 
(
	[ID_COUVERTS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DISPOSER]    Script Date: 06/12/2018 15:57:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DISPOSER](
	[ID_COUVERTS] [int] NOT NULL,
	[ID_TABLE] [int] NOT NULL,
 CONSTRAINT [PK_DISPOSER] PRIMARY KEY CLUSTERED 
(
	[ID_COUVERTS] ASC,
	[ID_TABLE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ETRE_UTILISER]    Script Date: 06/12/2018 15:57:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ETRE_UTILISER](
	[ID_RECETTE] [int] NOT NULL,
	[ID_USTENSILES] [int] NOT NULL,
 CONSTRAINT [PK_ETRE_UTILISER] PRIMARY KEY CLUSTERED 
(
	[ID_RECETTE] ASC,
	[ID_USTENSILES] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GROUPE]    Script Date: 06/12/2018 15:57:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GROUPE](
	[ID_GROUPE] [int] IDENTITY(0,1) NOT NULL,
	[ID_TABLE] [int] NOT NULL,
	[TYPE_GROUPE] [varchar](15) NOT NULL,
 CONSTRAINT [PK_GROUPE] PRIMARY KEY CLUSTERED 
(
	[ID_GROUPE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INGREDIENTS]    Script Date: 06/12/2018 15:57:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INGREDIENTS](
	[ID_INGREDIENT] [int] IDENTITY(0,1) NOT NULL,
	[NOM_INGREDIENT] [varchar](15) NOT NULL,
	[QUANTITE_INGREDIENT] [int] NOT NULL,
 CONSTRAINT [PK_INGREDIENTS] PRIMARY KEY CLUSTERED 
(
	[ID_INGREDIENT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RECETTE]    Script Date: 06/12/2018 15:57:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RECETTE](
	[ID_RECETTE] [int] IDENTITY(0,1) NOT NULL,
	[NOM_RECETTE] [varchar](15) NULL,
	[TEMPS_RECETTE] [int] NULL,
	[type] [nvarchar](50) NULL,
 CONSTRAINT [PK_RECETTE] PRIMARY KEY CLUSTERED 
(
	[ID_RECETTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUPPLEMENT]    Script Date: 06/12/2018 15:57:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUPPLEMENT](
	[ID_SUPPLEMENT] [int] IDENTITY(0,1) NOT NULL,
	[ID_TABLE] [int] NULL,
	[NOM_SUPPLEMENT] [varchar](15) NOT NULL,
	[QUANTITE_SUPPLEMENT] [int] NOT NULL,
	[UTILISE_SUPPLEMENT] [int] NULL,
 CONSTRAINT [PK_SUPPLEMENT] PRIMARY KEY CLUSTERED 
(
	[ID_SUPPLEMENT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TABLE]    Script Date: 06/12/2018 15:57:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TABLE](
	[ID_TABLE] [int] IDENTITY(0,1) NOT NULL,
	[ID_GROUPE] [int] NULL,
	[TAILLE_TABLE] [int] NOT NULL,
	[OCCUPATION_TABLE] [bit] NOT NULL,
 CONSTRAINT [PK_TABLE] PRIMARY KEY CLUSTERED 
(
	[ID_TABLE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USTENSILES]    Script Date: 06/12/2018 15:57:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USTENSILES](
	[ID_USTENSILES] [int] IDENTITY(0,1) NOT NULL,
	[NOM_USTENSILES] [varchar](15) NOT NULL,
	[NOMBRE_USTENSILES] [int] NOT NULL,
	[UTILISE_USTENSILE] [int] NULL,
 CONSTRAINT [PK_USTENSILES] PRIMARY KEY CLUSTERED 
(
	[ID_USTENSILES] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UTILISER]    Script Date: 06/12/2018 15:57:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UTILISER](
	[ID_RECETTE] [int] NOT NULL,
	[ID_INGREDIENT] [int] NOT NULL,
 CONSTRAINT [PK_UTILISER] PRIMARY KEY CLUSTERED 
(
	[ID_RECETTE] ASC,
	[ID_INGREDIENT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WORKERS]    Script Date: 06/12/2018 15:57:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WORKERS](
	[ID_WORKERS] [int] IDENTITY(0,1) NOT NULL,
	[NOM_WORKERS] [varchar](15) NOT NULL,
	[QUANTITE_WORKERS] [int] NOT NULL,
	[UTILISE_WORKERS] [bit] NULL,
 CONSTRAINT [PK_WORKERS] PRIMARY KEY CLUSTERED 
(
	[ID_WORKERS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[COUVERTS] ON 

INSERT [dbo].[COUVERTS] ([ID_COUVERTS], [NOM_COUVERTS], [NOMBRE_COUVERTS], [UTILISE_COUVERTS]) VALUES (3, N'PetiteAssiettes', 150, 0)
INSERT [dbo].[COUVERTS] ([ID_COUVERTS], [NOM_COUVERTS], [NOMBRE_COUVERTS], [UTILISE_COUVERTS]) VALUES (7, N'AssiettesPlates', 150, 0)
INSERT [dbo].[COUVERTS] ([ID_COUVERTS], [NOM_COUVERTS], [NOMBRE_COUVERTS], [UTILISE_COUVERTS]) VALUES (13, N'AssiettesCre', 30, 0)
INSERT [dbo].[COUVERTS] ([ID_COUVERTS], [NOM_COUVERTS], [NOMBRE_COUVERTS], [UTILISE_COUVERTS]) VALUES (14, N'Desserts', 150, 0)
INSERT [dbo].[COUVERTS] ([ID_COUVERTS], [NOM_COUVERTS], [NOMBRE_COUVERTS], [UTILISE_COUVERTS]) VALUES (15, N'fourchettes', 150, 0)
INSERT [dbo].[COUVERTS] ([ID_COUVERTS], [NOM_COUVERTS], [NOMBRE_COUVERTS], [UTILISE_COUVERTS]) VALUES (16, N'Couteaux', 150, 0)
INSERT [dbo].[COUVERTS] ([ID_COUVERTS], [NOM_COUVERTS], [NOMBRE_COUVERTS], [UTILISE_COUVERTS]) VALUES (17, N'CuillèresS', 150, 0)
INSERT [dbo].[COUVERTS] ([ID_COUVERTS], [NOM_COUVERTS], [NOMBRE_COUVERTS], [UTILISE_COUVERTS]) VALUES (18, N'CuillèresC', 150, 0)
INSERT [dbo].[COUVERTS] ([ID_COUVERTS], [NOM_COUVERTS], [NOMBRE_COUVERTS], [UTILISE_COUVERTS]) VALUES (19, N'Veau', 150, 0)
INSERT [dbo].[COUVERTS] ([ID_COUVERTS], [NOM_COUVERTS], [NOMBRE_COUVERTS], [UTILISE_COUVERTS]) VALUES (20, N'Vvin', 150, 0)
INSERT [dbo].[COUVERTS] ([ID_COUVERTS], [NOM_COUVERTS], [NOMBRE_COUVERTS], [UTILISE_COUVERTS]) VALUES (21, N'VChamp', 150, 0)
INSERT [dbo].[COUVERTS] ([ID_COUVERTS], [NOM_COUVERTS], [NOMBRE_COUVERTS], [UTILISE_COUVERTS]) VALUES (22, N'Café', 50, 0)
INSERT [dbo].[COUVERTS] ([ID_COUVERTS], [NOM_COUVERTS], [NOMBRE_COUVERTS], [UTILISE_COUVERTS]) VALUES (23, N'serviettes', 150, 0)
INSERT [dbo].[COUVERTS] ([ID_COUVERTS], [NOM_COUVERTS], [NOMBRE_COUVERTS], [UTILISE_COUVERTS]) VALUES (24, N'nappes', 40, 0)
SET IDENTITY_INSERT [dbo].[COUVERTS] OFF
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (0, 0)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (1, 1)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (2, 2)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (2, 3)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (2, 4)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (3, 2)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (3, 3)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (3, 4)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (3, 8)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (4, 8)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (4, 10)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (4, 12)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (4, 13)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (5, 2)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (5, 3)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (5, 8)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (6, 4)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (6, 6)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (6, 7)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (6, 9)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (6, 12)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (7, 8)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (8, 4)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (8, 13)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (9, 13)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (10, 8)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (10, 11)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (10, 13)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (11, 2)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (11, 8)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (12, 10)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (13, 10)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (13, 12)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (14, 10)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (14, 12)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (15, 9)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (15, 11)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (15, 12)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (16, 9)
INSERT [dbo].[ETRE_UTILISER] ([ID_RECETTE], [ID_USTENSILES]) VALUES (16, 12)
SET IDENTITY_INSERT [dbo].[INGREDIENTS] ON 

INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (0, N'Farine', 50)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (1, N'oeuf', 150)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (2, N'lait', 50)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (3, N'sucre', 20)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (4, N'mascarpone', 5)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (5, N'biscuit', 1)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (6, N'café', 1)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (7, N'cacao', 1)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (9, N'beurre', 2)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (10, N'abricaut', 1)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (11, N'chapelure', 1)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (12, N'oignon', 1)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (13, N'gruyere', 10)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (14, N'tomate', 1)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (15, N'concombre', 1)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (17, N'Paté', 1)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (18, N'champigno', 1)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (20, N'thon', 1)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (22, N'lardon', 5)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (23, N'foie_gras', 1)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (24, N'crevettes', 1)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (25, N'saumon fumé', 1)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (26, N'lotte', 1)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (27, N'veau', 10)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (28, N'carottes', 1)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (29, N'poitrines', 1)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (30, N'foie', 1)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (31, N'poulet', 5)
INSERT [dbo].[INGREDIENTS] ([ID_INGREDIENT], [NOM_INGREDIENT], [QUANTITE_INGREDIENT]) VALUES (32, N'poireau', 1)
SET IDENTITY_INSERT [dbo].[INGREDIENTS] OFF
SET IDENTITY_INSERT [dbo].[RECETTE] ON 

INSERT [dbo].[RECETTE] ([ID_RECETTE], [NOM_RECETTE], [TEMPS_RECETTE], [type]) VALUES (0, N'gaufres', 20, N'dessert')
INSERT [dbo].[RECETTE] ([ID_RECETTE], [NOM_RECETTE], [TEMPS_RECETTE], [type]) VALUES (1, N'crepes', 10, N'dessert')
INSERT [dbo].[RECETTE] ([ID_RECETTE], [NOM_RECETTE], [TEMPS_RECETTE], [type]) VALUES (2, N'tiramisu', 10, N'dessert')
INSERT [dbo].[RECETTE] ([ID_RECETTE], [NOM_RECETTE], [TEMPS_RECETTE], [type]) VALUES (3, N'madeleine', 15, N'dessert')
INSERT [dbo].[RECETTE] ([ID_RECETTE], [NOM_RECETTE], [TEMPS_RECETTE], [type]) VALUES (4, N'bavarois', 30, N'dessert')
INSERT [dbo].[RECETTE] ([ID_RECETTE], [NOM_RECETTE], [TEMPS_RECETTE], [type]) VALUES (5, N'tartellette', 45, N'dessert')
INSERT [dbo].[RECETTE] ([ID_RECETTE], [NOM_RECETTE], [TEMPS_RECETTE], [type]) VALUES (6, N'feulleté crabe', 10, N'entree')
INSERT [dbo].[RECETTE] ([ID_RECETTE], [NOM_RECETTE], [TEMPS_RECETTE], [type]) VALUES (7, N'oeuf cocotte', 10, N'entree')
INSERT [dbo].[RECETTE] ([ID_RECETTE], [NOM_RECETTE], [TEMPS_RECETTE], [type]) VALUES (8, N'gaspatcho', 5, N'entree')
INSERT [dbo].[RECETTE] ([ID_RECETTE], [NOM_RECETTE], [TEMPS_RECETTE], [type]) VALUES (9, N'paté', 20, N'entree')
INSERT [dbo].[RECETTE] ([ID_RECETTE], [NOM_RECETTE], [TEMPS_RECETTE], [type]) VALUES (10, N'tarte thon', 10, N'entree')
INSERT [dbo].[RECETTE] ([ID_RECETTE], [NOM_RECETTE], [TEMPS_RECETTE], [type]) VALUES (11, N'quiche', 15, N'entree')
INSERT [dbo].[RECETTE] ([ID_RECETTE], [NOM_RECETTE], [TEMPS_RECETTE], [type]) VALUES (12, N'foie gras', 60, N'entree')
INSERT [dbo].[RECETTE] ([ID_RECETTE], [NOM_RECETTE], [TEMPS_RECETTE], [type]) VALUES (13, N'soupe', 15, N'plat')
INSERT [dbo].[RECETTE] ([ID_RECETTE], [NOM_RECETTE], [TEMPS_RECETTE], [type]) VALUES (14, N'pates saumon', 20, N'plat')
INSERT [dbo].[RECETTE] ([ID_RECETTE], [NOM_RECETTE], [TEMPS_RECETTE], [type]) VALUES (15, N'blanquette', 10, N'plat')
INSERT [dbo].[RECETTE] ([ID_RECETTE], [NOM_RECETTE], [TEMPS_RECETTE], [type]) VALUES (16, N'poulet', 5, N'plat')
SET IDENTITY_INSERT [dbo].[RECETTE] OFF
SET IDENTITY_INSERT [dbo].[USTENSILES] ON 

INSERT [dbo].[USTENSILES] ([ID_USTENSILES], [NOM_USTENSILES], [NOMBRE_USTENSILES], [UTILISE_USTENSILE]) VALUES (0, N'gaufrier', 1, 0)
INSERT [dbo].[USTENSILES] ([ID_USTENSILES], [NOM_USTENSILES], [NOMBRE_USTENSILES], [UTILISE_USTENSILE]) VALUES (1, N'crepiere', 1, 0)
INSERT [dbo].[USTENSILES] ([ID_USTENSILES], [NOM_USTENSILES], [NOMBRE_USTENSILES], [UTILISE_USTENSILE]) VALUES (2, N'fouet', 5, 0)
INSERT [dbo].[USTENSILES] ([ID_USTENSILES], [NOM_USTENSILES], [NOMBRE_USTENSILES], [UTILISE_USTENSILE]) VALUES (3, N'spatule', 5, 0)
INSERT [dbo].[USTENSILES] ([ID_USTENSILES], [NOM_USTENSILES], [NOMBRE_USTENSILES], [UTILISE_USTENSILE]) VALUES (4, N'bol ', 10, 0)
INSERT [dbo].[USTENSILES] ([ID_USTENSILES], [NOM_USTENSILES], [NOMBRE_USTENSILES], [UTILISE_USTENSILE]) VALUES (5, N'cuillere', 20, 0)
INSERT [dbo].[USTENSILES] ([ID_USTENSILES], [NOM_USTENSILES], [NOMBRE_USTENSILES], [UTILISE_USTENSILE]) VALUES (6, N'couteau', 20, 0)
INSERT [dbo].[USTENSILES] ([ID_USTENSILES], [NOM_USTENSILES], [NOMBRE_USTENSILES], [UTILISE_USTENSILE]) VALUES (7, N'saladier', 2, 0)
INSERT [dbo].[USTENSILES] ([ID_USTENSILES], [NOM_USTENSILES], [NOMBRE_USTENSILES], [UTILISE_USTENSILE]) VALUES (8, N'four', 1, 0)
INSERT [dbo].[USTENSILES] ([ID_USTENSILES], [NOM_USTENSILES], [NOMBRE_USTENSILES], [UTILISE_USTENSILE]) VALUES (9, N'poele', 10, 0)
INSERT [dbo].[USTENSILES] ([ID_USTENSILES], [NOM_USTENSILES], [NOMBRE_USTENSILES], [UTILISE_USTENSILE]) VALUES (10, N'casserol', 10, 0)
INSERT [dbo].[USTENSILES] ([ID_USTENSILES], [NOM_USTENSILES], [NOMBRE_USTENSILES], [UTILISE_USTENSILE]) VALUES (11, N'planche', 5, 0)
INSERT [dbo].[USTENSILES] ([ID_USTENSILES], [NOM_USTENSILES], [NOMBRE_USTENSILES], [UTILISE_USTENSILE]) VALUES (12, N'Feux de cuisson', 5, 0)
INSERT [dbo].[USTENSILES] ([ID_USTENSILES], [NOM_USTENSILES], [NOMBRE_USTENSILES], [UTILISE_USTENSILE]) VALUES (13, N'mixeur', 1, NULL)
SET IDENTITY_INSERT [dbo].[USTENSILES] OFF
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (0, 0)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (0, 1)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (0, 2)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (0, 3)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (1, 0)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (1, 1)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (1, 2)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (1, 3)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (2, 3)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (2, 4)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (2, 5)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (2, 6)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (2, 7)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (3, 0)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (3, 1)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (3, 2)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (3, 3)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (3, 9)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (4, 0)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (4, 1)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (4, 2)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (4, 3)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (4, 10)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (5, 0)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (5, 1)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (5, 2)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (5, 3)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (5, 9)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (5, 10)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (6, 0)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (6, 1)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (6, 11)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (6, 20)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (7, 1)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (7, 13)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (8, 12)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (8, 14)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (8, 17)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (9, 17)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (10, 0)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (10, 1)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (10, 2)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (10, 18)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (10, 20)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (11, 0)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (11, 1)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (11, 2)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (11, 22)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (12, 23)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (13, 2)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (13, 24)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (14, 2)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (14, 25)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (15, 27)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (15, 28)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (15, 29)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (16, 30)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (16, 31)
INSERT [dbo].[UTILISER] ([ID_RECETTE], [ID_INGREDIENT]) VALUES (16, 32)
SET IDENTITY_INSERT [dbo].[WORKERS] ON 

INSERT [dbo].[WORKERS] ([ID_WORKERS], [NOM_WORKERS], [QUANTITE_WORKERS], [UTILISE_WORKERS]) VALUES (0, N'Chef_de_Rang', 1, 0)
INSERT [dbo].[WORKERS] ([ID_WORKERS], [NOM_WORKERS], [QUANTITE_WORKERS], [UTILISE_WORKERS]) VALUES (1, N'Maitre_hotels', 1, 0)
INSERT [dbo].[WORKERS] ([ID_WORKERS], [NOM_WORKERS], [QUANTITE_WORKERS], [UTILISE_WORKERS]) VALUES (2, N'Serveur', 4, 0)
INSERT [dbo].[WORKERS] ([ID_WORKERS], [NOM_WORKERS], [QUANTITE_WORKERS], [UTILISE_WORKERS]) VALUES (3, N'Commis_Salle', 1, 0)
INSERT [dbo].[WORKERS] ([ID_WORKERS], [NOM_WORKERS], [QUANTITE_WORKERS], [UTILISE_WORKERS]) VALUES (4, N'Chef_cuisine', 1, 0)
INSERT [dbo].[WORKERS] ([ID_WORKERS], [NOM_WORKERS], [QUANTITE_WORKERS], [UTILISE_WORKERS]) VALUES (5, N'Chef_partie', 2, 0)
INSERT [dbo].[WORKERS] ([ID_WORKERS], [NOM_WORKERS], [QUANTITE_WORKERS], [UTILISE_WORKERS]) VALUES (6, N'Commis_cuisine', 2, 0)
INSERT [dbo].[WORKERS] ([ID_WORKERS], [NOM_WORKERS], [QUANTITE_WORKERS], [UTILISE_WORKERS]) VALUES (7, N'Plongeur', 1, 0)
SET IDENTITY_INSERT [dbo].[WORKERS] OFF
/****** Object:  Index [APPARTENIR_FK]    Script Date: 06/12/2018 15:57:16 ******/
CREATE NONCLUSTERED INDEX [APPARTENIR_FK] ON [dbo].[CLIENTS]
(
	[ID_GROUPE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [COMMANDER_FK]    Script Date: 06/12/2018 15:57:16 ******/
CREATE NONCLUSTERED INDEX [COMMANDER_FK] ON [dbo].[COMMANDER]
(
	[ID_RECETTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [COMMANDER2_FK]    Script Date: 06/12/2018 15:57:16 ******/
CREATE NONCLUSTERED INDEX [COMMANDER2_FK] ON [dbo].[COMMANDER]
(
	[ID_TABLE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [DISPOSER_FK]    Script Date: 06/12/2018 15:57:16 ******/
CREATE NONCLUSTERED INDEX [DISPOSER_FK] ON [dbo].[DISPOSER]
(
	[ID_COUVERTS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [DISPOSER2_FK]    Script Date: 06/12/2018 15:57:16 ******/
CREATE NONCLUSTERED INDEX [DISPOSER2_FK] ON [dbo].[DISPOSER]
(
	[ID_TABLE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ETRE_UTILISER_FK]    Script Date: 06/12/2018 15:57:16 ******/
CREATE NONCLUSTERED INDEX [ETRE_UTILISER_FK] ON [dbo].[ETRE_UTILISER]
(
	[ID_RECETTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ETRE_UTILISER2_FK]    Script Date: 06/12/2018 15:57:16 ******/
CREATE NONCLUSTERED INDEX [ETRE_UTILISER2_FK] ON [dbo].[ETRE_UTILISER]
(
	[ID_USTENSILES] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [POSSEDER2_FK]    Script Date: 06/12/2018 15:57:16 ******/
CREATE NONCLUSTERED INDEX [POSSEDER2_FK] ON [dbo].[GROUPE]
(
	[ID_TABLE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [AVOIR_FK]    Script Date: 06/12/2018 15:57:16 ******/
CREATE NONCLUSTERED INDEX [AVOIR_FK] ON [dbo].[SUPPLEMENT]
(
	[ID_TABLE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [POSSEDER_FK]    Script Date: 06/12/2018 15:57:16 ******/
CREATE NONCLUSTERED INDEX [POSSEDER_FK] ON [dbo].[TABLE]
(
	[ID_GROUPE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UTILISER_FK]    Script Date: 06/12/2018 15:57:16 ******/
CREATE NONCLUSTERED INDEX [UTILISER_FK] ON [dbo].[UTILISER]
(
	[ID_RECETTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UTILISER2_FK]    Script Date: 06/12/2018 15:57:16 ******/
CREATE NONCLUSTERED INDEX [UTILISER2_FK] ON [dbo].[UTILISER]
(
	[ID_INGREDIENT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CLIENTS]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTS_APPARTENI_GROUPE] FOREIGN KEY([ID_GROUPE])
REFERENCES [dbo].[GROUPE] ([ID_GROUPE])
GO
ALTER TABLE [dbo].[CLIENTS] CHECK CONSTRAINT [FK_CLIENTS_APPARTENI_GROUPE]
GO
ALTER TABLE [dbo].[COMMANDER]  WITH CHECK ADD  CONSTRAINT [FK_COMMANDE_COMMANDER_RECETTE] FOREIGN KEY([ID_RECETTE])
REFERENCES [dbo].[RECETTE] ([ID_RECETTE])
GO
ALTER TABLE [dbo].[COMMANDER] CHECK CONSTRAINT [FK_COMMANDE_COMMANDER_RECETTE]
GO
ALTER TABLE [dbo].[COMMANDER]  WITH CHECK ADD  CONSTRAINT [FK_COMMANDE_COMMANDER_TABLE] FOREIGN KEY([ID_TABLE])
REFERENCES [dbo].[TABLE] ([ID_TABLE])
GO
ALTER TABLE [dbo].[COMMANDER] CHECK CONSTRAINT [FK_COMMANDE_COMMANDER_TABLE]
GO
ALTER TABLE [dbo].[DISPOSER]  WITH CHECK ADD  CONSTRAINT [FK_DISPOSER_DISPOSER_COUVERTS] FOREIGN KEY([ID_COUVERTS])
REFERENCES [dbo].[COUVERTS] ([ID_COUVERTS])
GO
ALTER TABLE [dbo].[DISPOSER] CHECK CONSTRAINT [FK_DISPOSER_DISPOSER_COUVERTS]
GO
ALTER TABLE [dbo].[DISPOSER]  WITH CHECK ADD  CONSTRAINT [FK_DISPOSER_DISPOSER2_TABLE] FOREIGN KEY([ID_TABLE])
REFERENCES [dbo].[TABLE] ([ID_TABLE])
GO
ALTER TABLE [dbo].[DISPOSER] CHECK CONSTRAINT [FK_DISPOSER_DISPOSER2_TABLE]
GO
ALTER TABLE [dbo].[ETRE_UTILISER]  WITH CHECK ADD  CONSTRAINT [FK_ETRE_UTI_ETRE_UTIL_RECETTE] FOREIGN KEY([ID_RECETTE])
REFERENCES [dbo].[RECETTE] ([ID_RECETTE])
GO
ALTER TABLE [dbo].[ETRE_UTILISER] CHECK CONSTRAINT [FK_ETRE_UTI_ETRE_UTIL_RECETTE]
GO
ALTER TABLE [dbo].[ETRE_UTILISER]  WITH CHECK ADD  CONSTRAINT [FK_ETRE_UTI_ETRE_UTIL_USTENSIL] FOREIGN KEY([ID_USTENSILES])
REFERENCES [dbo].[USTENSILES] ([ID_USTENSILES])
GO
ALTER TABLE [dbo].[ETRE_UTILISER] CHECK CONSTRAINT [FK_ETRE_UTI_ETRE_UTIL_USTENSIL]
GO
ALTER TABLE [dbo].[GROUPE]  WITH CHECK ADD  CONSTRAINT [FK_GROUPE_POSSEDER2_TABLE] FOREIGN KEY([ID_TABLE])
REFERENCES [dbo].[TABLE] ([ID_TABLE])
GO
ALTER TABLE [dbo].[GROUPE] CHECK CONSTRAINT [FK_GROUPE_POSSEDER2_TABLE]
GO
ALTER TABLE [dbo].[SUPPLEMENT]  WITH CHECK ADD  CONSTRAINT [FK_SUPPLEME_AVOIR_TABLE] FOREIGN KEY([ID_TABLE])
REFERENCES [dbo].[TABLE] ([ID_TABLE])
GO
ALTER TABLE [dbo].[SUPPLEMENT] CHECK CONSTRAINT [FK_SUPPLEME_AVOIR_TABLE]
GO
ALTER TABLE [dbo].[TABLE]  WITH CHECK ADD  CONSTRAINT [FK_TABLE_POSSEDER_GROUPE] FOREIGN KEY([ID_GROUPE])
REFERENCES [dbo].[GROUPE] ([ID_GROUPE])
GO
ALTER TABLE [dbo].[TABLE] CHECK CONSTRAINT [FK_TABLE_POSSEDER_GROUPE]
GO
ALTER TABLE [dbo].[UTILISER]  WITH CHECK ADD  CONSTRAINT [FK_UTILISER_UTILISER_RECETTE] FOREIGN KEY([ID_RECETTE])
REFERENCES [dbo].[RECETTE] ([ID_RECETTE])
GO
ALTER TABLE [dbo].[UTILISER] CHECK CONSTRAINT [FK_UTILISER_UTILISER_RECETTE]
GO
ALTER TABLE [dbo].[UTILISER]  WITH CHECK ADD  CONSTRAINT [FK_UTILISER_UTILISER2_INGREDIE] FOREIGN KEY([ID_INGREDIENT])
REFERENCES [dbo].[INGREDIENTS] ([ID_INGREDIENT])
GO
ALTER TABLE [dbo].[UTILISER] CHECK CONSTRAINT [FK_UTILISER_UTILISER2_INGREDIE]
GO
USE [master]
GO
ALTER DATABASE [MasterChef] SET  READ_WRITE 
GO
