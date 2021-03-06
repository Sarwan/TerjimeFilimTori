USE [master]
GO
/****** Object:  Database [UyTerjimeWeb]    Script Date: 7/22/2013 6:47:09 PM ******/
CREATE DATABASE [UyTerjimeWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UyTerjimeWeb', FILENAME = N'E:\Projects\UyTerjimeWeb\DB\UyTerjimeWeb.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UyTerjimeWeb_log', FILENAME = N'E:\Projects\UyTerjimeWeb\DB\UyTerjimeWeb_log.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UyTerjimeWeb] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UyTerjimeWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UyTerjimeWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UyTerjimeWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UyTerjimeWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UyTerjimeWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UyTerjimeWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [UyTerjimeWeb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [UyTerjimeWeb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UyTerjimeWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UyTerjimeWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UyTerjimeWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UyTerjimeWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UyTerjimeWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UyTerjimeWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UyTerjimeWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UyTerjimeWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UyTerjimeWeb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UyTerjimeWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UyTerjimeWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UyTerjimeWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UyTerjimeWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UyTerjimeWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UyTerjimeWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UyTerjimeWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UyTerjimeWeb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UyTerjimeWeb] SET  MULTI_USER 
GO
ALTER DATABASE [UyTerjimeWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UyTerjimeWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UyTerjimeWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UyTerjimeWeb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UyTerjimeWeb]
GO
/****** Object:  User [DbUser]    Script Date: 7/22/2013 6:47:09 PM ******/
CREATE USER [DbUser] FOR LOGIN [DbUser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [DbUser]
GO
/****** Object:  Table [dbo].[Advertizement]    Script Date: 7/22/2013 6:47:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertizement](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](1000) NOT NULL,
	[Title] [nvarchar](500) NULL,
	[State] [bit] NOT NULL,
	[AddTime] [datetime] NOT NULL,
	[NavUrl] [nvarchar](1000) NULL,
 CONSTRAINT [PK_ADVERTIZEMENT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Article]    Script Date: 7/22/2013 6:47:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[ArticleContent] [nvarchar](max) NOT NULL,
	[Catgory] [int] NOT NULL,
	[State] [bit] NOT NULL,
	[AddTime] [datetime] NOT NULL,
	[ManagerID] [bigint] NOT NULL,
	[VistCount] [bigint] NOT NULL,
 CONSTRAINT [PK_ARTICLE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ArticleCatogry]    Script Date: 7/22/2013 6:47:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleCatogry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Descraption] [nvarchar](max) NULL,
	[State] [bit] NOT NULL,
 CONSTRAINT [PK_ARTICLECATOGRY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Downloads]    Script Date: 7/22/2013 6:47:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Downloads](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Type] [nvarchar](100) NULL,
	[Url] [nvarchar](max) NULL,
	[AddTime] [datetime] NOT NULL,
	[Descraption] [nvarchar](max) NULL,
	[State] [bit] NOT NULL,
	[DownCount] [bigint] NOT NULL,
 CONSTRAINT [PK_DOWNLOADS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Links]    Script Date: 7/22/2013 6:47:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Links](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nchar](100) NULL,
	[Descraption] [nchar](1000) NULL,
	[Url] [nchar](500) NOT NULL,
	[Image] [nchar](500) NULL,
	[State] [bit] NOT NULL,
	[IsImageLink] [bit] NOT NULL,
	[AddTime] [datetime] NOT NULL,
	[Serial] [int] NOT NULL,
 CONSTRAINT [PK_Links] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Manager]    Script Date: 7/22/2013 6:47:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Type] [int] NOT NULL,
	[State] [bit] NOT NULL,
	[Password] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[TelePhone] [nvarchar](30) NULL,
	[Task] [nvarchar](max) NULL,
	[AddTime] [datetime] NOT NULL,
 CONSTRAINT [PK_MANAGER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 7/22/2013 6:47:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](max) NULL,
	[State] [bit] NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[Target] [nvarchar](10) NULL,
	[Serial] [int] NOT NULL,
	[Parent] [int] NOT NULL,
 CONSTRAINT [PK_MENU] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Movie]    Script Date: 7/22/2013 6:47:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Cover] [nvarchar](1000) NULL,
	[OtherName] [nvarchar](200) NULL,
	[ReleaseTime] [date] NULL,
	[Country] [nvarchar](100) NULL,
	[Type] [int] NOT NULL,
	[Language] [nvarchar](100) NULL,
	[Subtitle] [nvarchar](100) NULL,
	[IMDBUrl] [nvarchar](1000) NULL,
	[IMDBID] [nvarchar](50) NULL,
	[Director] [nvarchar](100) NULL,
	[Artst] [nvarchar](1000) NULL,
	[Source] [nvarchar](1000) NULL,
	[Descraption] [nvarchar](max) NULL,
	[State] [bit] NOT NULL,
	[WatchCount] [bigint] NOT NULL,
	[DownCount] [bigint] NOT NULL,
	[AddTime] [datetime] NOT NULL,
	[WhatUrl] [nchar](1000) NULL,
 CONSTRAINT [PK_MOVIE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MovieAddr]    Script Date: 7/22/2013 6:47:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieAddr](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MovieID] [bigint] NOT NULL,
	[Url] [nvarchar](max) NULL,
	[FileType] [nvarchar](10) NULL,
	[Resolution] [nvarchar](16) NULL,
	[OtherInfo] [nvarchar](max) NULL,
	[State] [bit] NOT NULL,
	[Size] [int] NULL,
	[MovieTime] [int] NULL,
	[DownCount] [bigint] NOT NULL,
	[WatchCount] [bigint] NOT NULL,
	[AddTime] [datetime] NOT NULL,
 CONSTRAINT [PK_MOVIEADDR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MovieCatgory]    Script Date: 7/22/2013 6:47:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieCatgory](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Descraption] [nvarchar](max) NULL,
	[State] [bit] NOT NULL,
 CONSTRAINT [PK_MOVIECATGORY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Picture]    Script Date: 7/22/2013 6:47:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Picture](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MovieID] [bigint] NOT NULL,
	[Descraption] [nvarchar](max) NULL,
	[Url] [nvarchar](max) NULL,
	[State] [bit] NOT NULL,
	[AddTime] [datetime] NOT NULL,
 CONSTRAINT [PK_PICTURE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Recommend]    Script Date: 7/22/2013 6:47:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recommend](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MovieID] [bigint] NOT NULL,
	[State] [bit] NOT NULL,
	[AddTime] [date] NOT NULL,
 CONSTRAINT [PK_TABLE_12] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkingMovies]    Script Date: 7/22/2013 6:47:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkingMovies](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Cover] [nvarchar](1000) NULL,
	[OtherName] [nvarchar](200) NULL,
	[ReleaseTime] [date] NULL,
	[Country] [nvarchar](100) NULL,
	[Language] [nvarchar](100) NULL,
	[IMDBUrl] [nvarchar](1000) NULL,
	[IMDBID] [nvarchar](50) NULL,
	[Source] [nvarchar](1000) NULL,
	[State] [bit] NOT NULL,
	[Url] [nvarchar](max) NULL,
	[WorkingState] [int] NOT NULL,
	[AddTime] [datetime] NOT NULL,
 CONSTRAINT [PK_WORKINGMOVIES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Advertizement] ADD  CONSTRAINT [DF_Advertizement_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[Article] ADD  CONSTRAINT [DF_Article_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[Article] ADD  CONSTRAINT [DF_Article_VistCount]  DEFAULT ((0)) FOR [VistCount]
GO
ALTER TABLE [dbo].[ArticleCatogry] ADD  CONSTRAINT [DF_ArticleCatogry_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[Downloads] ADD  CONSTRAINT [DF_Downloads_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[Downloads] ADD  CONSTRAINT [DF_Downloads_DownCount]  DEFAULT ((0)) FOR [DownCount]
GO
ALTER TABLE [dbo].[Links] ADD  CONSTRAINT [DF_Links_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[Links] ADD  CONSTRAINT [DF_Links_IsImageLink]  DEFAULT ((0)) FOR [IsImageLink]
GO
ALTER TABLE [dbo].[Links] ADD  CONSTRAINT [DF_Links_Serial]  DEFAULT ((0)) FOR [Serial]
GO
ALTER TABLE [dbo].[Manager] ADD  CONSTRAINT [DF_Manager_Type]  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Manager] ADD  CONSTRAINT [DF_Manager_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_Target]  DEFAULT (N'_Balnk') FOR [Target]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_Serial]  DEFAULT ((0)) FOR [Serial]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_Parent]  DEFAULT ((0)) FOR [Parent]
GO
ALTER TABLE [dbo].[Movie] ADD  CONSTRAINT [DF_Movie_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[Movie] ADD  CONSTRAINT [DF_Movie_WatchCount]  DEFAULT ((0)) FOR [WatchCount]
GO
ALTER TABLE [dbo].[Movie] ADD  CONSTRAINT [DF_Movie_DownCount]  DEFAULT ((0)) FOR [DownCount]
GO
ALTER TABLE [dbo].[MovieAddr] ADD  CONSTRAINT [DF_MovieAddr_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[MovieAddr] ADD  CONSTRAINT [DF_MovieAddr_DownCount]  DEFAULT ((0)) FOR [DownCount]
GO
ALTER TABLE [dbo].[MovieAddr] ADD  CONSTRAINT [DF_MovieAddr_WatchCount]  DEFAULT ((0)) FOR [WatchCount]
GO
ALTER TABLE [dbo].[MovieCatgory] ADD  CONSTRAINT [DF_MovieCatgory_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[Picture] ADD  CONSTRAINT [DF_Picture_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[Recommend] ADD  CONSTRAINT [DF_Recommend_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[WorkingMovies] ADD  CONSTRAINT [DF_WorkingMovies_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[WorkingMovies] ADD  CONSTRAINT [DF_WorkingMovies_WorkingState]  DEFAULT ((0)) FOR [WorkingState]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_ArticleCatogry] FOREIGN KEY([Catgory])
REFERENCES [dbo].[ArticleCatogry] ([ID])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_ArticleCatogry]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_Manager] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Manager] ([ID])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_Manager]
GO
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [FK_Movie_MovieCatgory] FOREIGN KEY([Type])
REFERENCES [dbo].[MovieCatgory] ([ID])
GO
ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [FK_Movie_MovieCatgory]
GO
ALTER TABLE [dbo].[MovieAddr]  WITH CHECK ADD  CONSTRAINT [FK_MovieAddr_Movie] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movie] ([ID])
GO
ALTER TABLE [dbo].[MovieAddr] CHECK CONSTRAINT [FK_MovieAddr_Movie]
GO
ALTER TABLE [dbo].[Picture]  WITH CHECK ADD  CONSTRAINT [FK_Picture_Movie] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movie] ([ID])
GO
ALTER TABLE [dbo].[Picture] CHECK CONSTRAINT [FK_Picture_Movie]
GO
ALTER TABLE [dbo].[Recommend]  WITH CHECK ADD  CONSTRAINT [FK_Recommend_Movie] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movie] ([ID])
GO
ALTER TABLE [dbo].[Recommend] CHECK CONSTRAINT [FK_Recommend_Movie]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'MB' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MovieAddr', @level2type=N'COLUMN',@level2name=N'Size'
GO
USE [master]
GO
ALTER DATABASE [UyTerjimeWeb] SET  READ_WRITE 
GO
