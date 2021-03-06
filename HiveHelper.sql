USE [master]
GO
/****** Object:  Database [HiveHelper]    Script Date: 11/6/2020 4:38:14 PM ******/
CREATE DATABASE [HiveHelper]
GO
ALTER DATABASE [HiveHelper] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HiveHelper].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HiveHelper] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HiveHelper] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HiveHelper] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HiveHelper] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HiveHelper] SET ARITHABORT OFF 
GO
ALTER DATABASE [HiveHelper] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HiveHelper] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HiveHelper] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HiveHelper] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HiveHelper] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HiveHelper] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HiveHelper] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HiveHelper] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HiveHelper] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HiveHelper] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HiveHelper] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HiveHelper] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HiveHelper] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HiveHelper] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HiveHelper] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HiveHelper] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HiveHelper] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HiveHelper] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HiveHelper] SET  MULTI_USER 
GO
ALTER DATABASE [HiveHelper] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HiveHelper] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HiveHelper] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HiveHelper] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HiveHelper] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HiveHelper] SET QUERY_STORE = OFF
GO
USE [HiveHelper]
GO
/****** Object:  Table [dbo].[ActionDetail]    Script Date: 11/6/2020 4:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[hive_id] [int] NOT NULL,
	[completed_by_id] [int] NULL,
	[entered_by_id] [int] NOT NULL,
	[primary_action_id] [int] NOT NULL,
	[secondary_action_id] [int] NOT NULL,
	[tertiary_action_id] [int] NULL,
	[completed] [bit] NOT NULL,
	[entry_date] [datetime] NOT NULL,
	[scheduled_date] [datetime] NULL,
	[completed_date] [datetime] NULL,
	[comments] [text] NULL,
 CONSTRAINT [PK_ActionDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hive]    Script Date: 11/6/2020 4:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hive](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[location_id] [int] NOT NULL,
	[inspection_interval] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[aggressive] [bit] NOT NULL,
	[genetics] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Hive] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 11/6/2020 4:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 11/6/2020 4:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[access_level] [int] NOT NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrimaryAction]    Script Date: 11/6/2020 4:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrimaryAction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_PrimaryAction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecondaryAction]    Script Date: 11/6/2020 4:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecondaryAction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[primary_action_id] [int] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_SecondaryAction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TertiaryAction]    Script Date: 11/6/2020 4:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TertiaryAction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[secondary_action_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_TertiaryAction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/6/2020 4:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[access_level] [int] NOT NULL,
	[password] [nvarchar](max) NULL,
	[username] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ActionDetail] ON 
GO
INSERT [dbo].[ActionDetail] ([id], [hive_id], [completed_by_id], [entered_by_id], [primary_action_id], [secondary_action_id], [tertiary_action_id], [completed], [entry_date], [scheduled_date], [completed_date], [comments]) VALUES (13, 5, 3, 3, 4, 12, 30, 1, CAST(N'2020-09-03T16:28:00.000' AS DateTime), CAST(N'2020-09-03T16:28:00.000' AS DateTime), CAST(N'2020-09-03T16:28:00.000' AS DateTime), N'took 3 brood frames and 2 honey frames from Columbus69, filled the hive with foundation frames')
GO
INSERT [dbo].[ActionDetail] ([id], [hive_id], [completed_by_id], [entered_by_id], [primary_action_id], [secondary_action_id], [tertiary_action_id], [completed], [entry_date], [scheduled_date], [completed_date], [comments]) VALUES (19, 9, 3, 3, 4, 12, 32, 1, CAST(N'2020-11-05T16:45:00.000' AS DateTime), CAST(N'2020-11-05T16:45:00.000' AS DateTime), CAST(N'2020-11-05T16:45:00.000' AS DateTime), N'split hive from detroit 1')
GO
INSERT [dbo].[ActionDetail] ([id], [hive_id], [completed_by_id], [entered_by_id], [primary_action_id], [secondary_action_id], [tertiary_action_id], [completed], [entry_date], [scheduled_date], [completed_date], [comments]) VALUES (20, 12, 3, 3, 4, 12, 30, 1, CAST(N'2020-11-05T18:23:00.000' AS DateTime), CAST(N'2020-11-05T18:23:00.000' AS DateTime), CAST(N'2020-11-05T18:23:00.000' AS DateTime), N'split hive1')
GO
INSERT [dbo].[ActionDetail] ([id], [hive_id], [completed_by_id], [entered_by_id], [primary_action_id], [secondary_action_id], [tertiary_action_id], [completed], [entry_date], [scheduled_date], [completed_date], [comments]) VALUES (21, 11, 1, 1, 1, 2, 8, 0, CAST(N'2020-11-05T19:41:00.000' AS DateTime), CAST(N'2020-11-13T21:43:00.000' AS DateTime), CAST(N'2020-11-13T21:43:00.000' AS DateTime), N'no comments needed')
GO
INSERT [dbo].[ActionDetail] ([id], [hive_id], [completed_by_id], [entered_by_id], [primary_action_id], [secondary_action_id], [tertiary_action_id], [completed], [entry_date], [scheduled_date], [completed_date], [comments]) VALUES (22, 11, 1, 1, 4, 13, 36, 1, CAST(N'2020-11-05T19:41:00.000' AS DateTime), CAST(N'2020-11-05T19:41:00.000' AS DateTime), CAST(N'2020-11-05T19:41:00.000' AS DateTime), N'caught swarm from unknown hive')
GO
INSERT [dbo].[ActionDetail] ([id], [hive_id], [completed_by_id], [entered_by_id], [primary_action_id], [secondary_action_id], [tertiary_action_id], [completed], [entry_date], [scheduled_date], [completed_date], [comments]) VALUES (23, 11, 1, 1, 3, 9, 26, 0, CAST(N'2020-11-05T19:46:00.000' AS DateTime), CAST(N'2020-11-11T21:48:00.000' AS DateTime), CAST(N'2020-11-11T21:48:00.000' AS DateTime), N'actions performed')
GO
INSERT [dbo].[ActionDetail] ([id], [hive_id], [completed_by_id], [entered_by_id], [primary_action_id], [secondary_action_id], [tertiary_action_id], [completed], [entry_date], [scheduled_date], [completed_date], [comments]) VALUES (24, 11, 2, 2, 1, 2, 8, 0, CAST(N'2020-11-05T20:02:00.000' AS DateTime), CAST(N'2020-11-12T23:06:00.000' AS DateTime), CAST(N'2020-11-12T23:06:00.000' AS DateTime), N'moths need a retreat')
GO
INSERT [dbo].[ActionDetail] ([id], [hive_id], [completed_by_id], [entered_by_id], [primary_action_id], [secondary_action_id], [tertiary_action_id], [completed], [entry_date], [scheduled_date], [completed_date], [comments]) VALUES (25, 10, 1, 1, 3, 9, 26, 1, CAST(N'2020-11-05T21:00:00.000' AS DateTime), CAST(N'2020-11-05T21:00:00.000' AS DateTime), CAST(N'2020-11-05T21:00:00.000' AS DateTime), N'all systems normal')
GO
INSERT [dbo].[ActionDetail] ([id], [hive_id], [completed_by_id], [entered_by_id], [primary_action_id], [secondary_action_id], [tertiary_action_id], [completed], [entry_date], [scheduled_date], [completed_date], [comments]) VALUES (26, 1, 2, 2, 1, 2, 8, 1, CAST(N'2020-10-03T00:00:00.000' AS DateTime), CAST(N'2020-10-03T00:00:00.000' AS DateTime), CAST(N'2020-10-03T00:00:00.000' AS DateTime), N'hive needs follow up inspection')
GO
INSERT [dbo].[ActionDetail] ([id], [hive_id], [completed_by_id], [entered_by_id], [primary_action_id], [secondary_action_id], [tertiary_action_id], [completed], [entry_date], [scheduled_date], [completed_date], [comments]) VALUES (27, 13, 3, 3, 4, 12, 32, 1, CAST(N'2020-09-03T14:53:00.000' AS DateTime), CAST(N'2020-09-03T14:53:00.000' AS DateTime), CAST(N'2020-09-03T14:53:00.000' AS DateTime), N'East China 1 was preparing to swarm, removed frame with queen cells and added empty wax foundation frames')
GO
INSERT [dbo].[ActionDetail] ([id], [hive_id], [completed_by_id], [entered_by_id], [primary_action_id], [secondary_action_id], [tertiary_action_id], [completed], [entry_date], [scheduled_date], [completed_date], [comments]) VALUES (28, 14, 3, 3, 4, 11, 29, 1, CAST(N'2020-09-03T14:54:00.000' AS DateTime), CAST(N'2020-09-03T14:54:00.000' AS DateTime), CAST(N'2020-09-03T14:54:00.000' AS DateTime), N'put 3lb package in 10 frame deep box, prewaxed foundation frames')
GO
INSERT [dbo].[ActionDetail] ([id], [hive_id], [completed_by_id], [entered_by_id], [primary_action_id], [secondary_action_id], [tertiary_action_id], [completed], [entry_date], [scheduled_date], [completed_date], [comments]) VALUES (29, 15, 3, 3, 4, 13, 33, 1, CAST(N'2020-11-06T14:54:00.000' AS DateTime), CAST(N'2020-11-06T14:54:00.000' AS DateTime), CAST(N'2020-11-06T14:54:00.000' AS DateTime), N'swarm from what appears to be East China 2, captured and boxed, will relocate to Detroit yard temp.')
GO
INSERT [dbo].[ActionDetail] ([id], [hive_id], [completed_by_id], [entered_by_id], [primary_action_id], [secondary_action_id], [tertiary_action_id], [completed], [entry_date], [scheduled_date], [completed_date], [comments]) VALUES (30, 7, 1, 1, 4, 11, 28, 1, CAST(N'2020-11-06T14:59:00.000' AS DateTime), CAST(N'2020-11-06T14:59:00.000' AS DateTime), CAST(N'2020-11-06T14:59:00.000' AS DateTime), N'1lb local hygenic bees from local breeder')
GO
INSERT [dbo].[ActionDetail] ([id], [hive_id], [completed_by_id], [entered_by_id], [primary_action_id], [secondary_action_id], [tertiary_action_id], [completed], [entry_date], [scheduled_date], [completed_date], [comments]) VALUES (31, 6, 1, 1, 4, 11, 28, 1, CAST(N'2020-11-06T15:00:00.000' AS DateTime), CAST(N'2020-11-06T15:00:00.000' AS DateTime), CAST(N'2020-11-06T15:00:00.000' AS DateTime), N'1lb local breeder, hygenic bees')
GO
INSERT [dbo].[ActionDetail] ([id], [hive_id], [completed_by_id], [entered_by_id], [primary_action_id], [secondary_action_id], [tertiary_action_id], [completed], [entry_date], [scheduled_date], [completed_date], [comments]) VALUES (32, 4, 1, 1, 4, 12, 31, 1, CAST(N'2020-10-06T15:01:00.000' AS DateTime), CAST(N'2020-10-06T15:01:00.000' AS DateTime), CAST(N'2020-10-06T15:01:00.000' AS DateTime), N'pulled split from detroit 2 and detroit 4, pinched queen and replaced with hygienic queen from local stock')
GO
INSERT [dbo].[ActionDetail] ([id], [hive_id], [completed_by_id], [entered_by_id], [primary_action_id], [secondary_action_id], [tertiary_action_id], [completed], [entry_date], [scheduled_date], [completed_date], [comments]) VALUES (33, 4, 2, 1, 1, 1, 1, 1, CAST(N'2020-10-06T15:02:00.000' AS DateTime), CAST(N'2020-11-04T18:05:00.000' AS DateTime), CAST(N'2020-11-06T20:46:21.640' AS DateTime), N'place strips after hive has established itself')
GO
INSERT [dbo].[ActionDetail] ([id], [hive_id], [completed_by_id], [entered_by_id], [primary_action_id], [secondary_action_id], [tertiary_action_id], [completed], [entry_date], [scheduled_date], [completed_date], [comments]) VALUES (34, 1, 1, 1, 5, 14, 37, 0, CAST(N'2020-11-06T16:49:00.000' AS DateTime), CAST(N'2020-11-07T16:49:00.000' AS DateTime), CAST(N'2020-11-07T16:49:00.000' AS DateTime), N'')
GO
INSERT [dbo].[ActionDetail] ([id], [hive_id], [completed_by_id], [entered_by_id], [primary_action_id], [secondary_action_id], [tertiary_action_id], [completed], [entry_date], [scheduled_date], [completed_date], [comments]) VALUES (36, 5, 2, 2, 3, 9, 26, 1, CAST(N'2020-11-06T20:46:00.000' AS DateTime), CAST(N'2020-11-06T20:46:00.000' AS DateTime), CAST(N'2020-11-06T20:46:00.000' AS DateTime), N'inspection complete')
GO
INSERT [dbo].[ActionDetail] ([id], [hive_id], [completed_by_id], [entered_by_id], [primary_action_id], [secondary_action_id], [tertiary_action_id], [completed], [entry_date], [scheduled_date], [completed_date], [comments]) VALUES (37, 20, 5, 5, 7, 16, 39, 1, CAST(N'2020-11-06T20:50:00.000' AS DateTime), CAST(N'2020-11-06T20:50:00.000' AS DateTime), CAST(N'2020-11-06T20:50:00.000' AS DateTime), N'')
GO
SET IDENTITY_INSERT [dbo].[ActionDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Hive] ON 
GO
INSERT [dbo].[Hive] ([id], [location_id], [inspection_interval], [name], [aggressive], [genetics]) VALUES (1, 1, 60, N'Columbus 10', 0, N'European')
GO
INSERT [dbo].[Hive] ([id], [location_id], [inspection_interval], [name], [aggressive], [genetics]) VALUES (4, 3, 90, N'Detroit 1', 1, N'European')
GO
INSERT [dbo].[Hive] ([id], [location_id], [inspection_interval], [name], [aggressive], [genetics]) VALUES (5, 3, 60, N'Detroit 2', 1, N'Hygienic')
GO
INSERT [dbo].[Hive] ([id], [location_id], [inspection_interval], [name], [aggressive], [genetics]) VALUES (6, 4, 90, N'Avoca 5', 0, N'Hygienic')
GO
INSERT [dbo].[Hive] ([id], [location_id], [inspection_interval], [name], [aggressive], [genetics]) VALUES (7, 4, 90, N'Avoca 6', 1, N'Hygienic')
GO
INSERT [dbo].[Hive] ([id], [location_id], [inspection_interval], [name], [aggressive], [genetics]) VALUES (8, 3, 60, N'Detroit 3', 0, N'Local/Unknown')
GO
INSERT [dbo].[Hive] ([id], [location_id], [inspection_interval], [name], [aggressive], [genetics]) VALUES (9, 3, 60, N'Detroit 5', 0, N'Local/Unknown')
GO
INSERT [dbo].[Hive] ([id], [location_id], [inspection_interval], [name], [aggressive], [genetics]) VALUES (10, 5, 90, N'East China 2', 1, N'Italian')
GO
INSERT [dbo].[Hive] ([id], [location_id], [inspection_interval], [name], [aggressive], [genetics]) VALUES (11, 5, 90, N'East China 6', 0, N'Italian')
GO
INSERT [dbo].[Hive] ([id], [location_id], [inspection_interval], [name], [aggressive], [genetics]) VALUES (12, 5, 60, N'East China 1', 1, N'Italian')
GO
INSERT [dbo].[Hive] ([id], [location_id], [inspection_interval], [name], [aggressive], [genetics]) VALUES (13, 5, 60, N'East China 7', 0, N'Italian')
GO
INSERT [dbo].[Hive] ([id], [location_id], [inspection_interval], [name], [aggressive], [genetics]) VALUES (14, 5, 60, N'East China 8', 0, N'Italian')
GO
INSERT [dbo].[Hive] ([id], [location_id], [inspection_interval], [name], [aggressive], [genetics]) VALUES (15, 5, 60, N'East China 10', 0, N'Italian')
GO
INSERT [dbo].[Hive] ([id], [location_id], [inspection_interval], [name], [aggressive], [genetics]) VALUES (20, 8, 30, N'Ferndale Hive 1', 0, N'Italian')
GO
SET IDENTITY_INSERT [dbo].[Hive] OFF
GO
SET IDENTITY_INSERT [dbo].[Location] ON 
GO
INSERT [dbo].[Location] ([id], [name], [address]) VALUES (1, N'Columbus', N'418 Local Rd')
GO
INSERT [dbo].[Location] ([id], [name], [address]) VALUES (3, N'Detroit', N'15 Monroe St')
GO
INSERT [dbo].[Location] ([id], [name], [address]) VALUES (4, N'Avoca', N'1518 Francis St')
GO
INSERT [dbo].[Location] ([id], [name], [address]) VALUES (5, N'East China', N'14768 Adams Dr')
GO
INSERT [dbo].[Location] ([id], [name], [address]) VALUES (8, N'Ferndale', N'123 Main')
GO
SET IDENTITY_INSERT [dbo].[Location] OFF
GO
SET IDENTITY_INSERT [dbo].[Permission] ON 
GO
INSERT [dbo].[Permission] ([id], [name], [access_level]) VALUES (1, N'leader', 2)
GO
INSERT [dbo].[Permission] ([id], [name], [access_level]) VALUES (2, N'admin', 3)
GO
INSERT [dbo].[Permission] ([id], [name], [access_level]) VALUES (3, N'beekeeper', 1)
GO
SET IDENTITY_INSERT [dbo].[Permission] OFF
GO
SET IDENTITY_INSERT [dbo].[PrimaryAction] ON 
GO
INSERT [dbo].[PrimaryAction] ([id], [name], [active]) VALUES (1, N'Pest Treatment', 1)
GO
INSERT [dbo].[PrimaryAction] ([id], [name], [active]) VALUES (2, N'Harvest', 1)
GO
INSERT [dbo].[PrimaryAction] ([id], [name], [active]) VALUES (3, N'Inspection', 1)
GO
INSERT [dbo].[PrimaryAction] ([id], [name], [active]) VALUES (4, N'New Hive', 1)
GO
INSERT [dbo].[PrimaryAction] ([id], [name], [active]) VALUES (5, N'Primary Test', 0)
GO
INSERT [dbo].[PrimaryAction] ([id], [name], [active]) VALUES (6, N'New Test Primary', 0)
GO
INSERT [dbo].[PrimaryAction] ([id], [name], [active]) VALUES (7, N'New ', 1)
GO
SET IDENTITY_INSERT [dbo].[PrimaryAction] OFF
GO
SET IDENTITY_INSERT [dbo].[SecondaryAction] ON 
GO
INSERT [dbo].[SecondaryAction] ([id], [name], [primary_action_id], [active]) VALUES (1, N'Varroa Mites', 1, 1)
GO
INSERT [dbo].[SecondaryAction] ([id], [name], [primary_action_id], [active]) VALUES (2, N'Wax Moth', 1, 1)
GO
INSERT [dbo].[SecondaryAction] ([id], [name], [primary_action_id], [active]) VALUES (3, N'Tracheal Mites', 1, 1)
GO
INSERT [dbo].[SecondaryAction] ([id], [name], [primary_action_id], [active]) VALUES (4, N'Small Hive Beetle', 1, 1)
GO
INSERT [dbo].[SecondaryAction] ([id], [name], [primary_action_id], [active]) VALUES (5, N'Bee Louse', 1, 1)
GO
INSERT [dbo].[SecondaryAction] ([id], [name], [primary_action_id], [active]) VALUES (6, N'Partial Harvest', 2, 1)
GO
INSERT [dbo].[SecondaryAction] ([id], [name], [primary_action_id], [active]) VALUES (7, N'Full Harvest', 2, 1)
GO
INSERT [dbo].[SecondaryAction] ([id], [name], [primary_action_id], [active]) VALUES (8, N'Destroyed Harvest', 2, 1)
GO
INSERT [dbo].[SecondaryAction] ([id], [name], [primary_action_id], [active]) VALUES (9, N'Routine Inspection', 3, 1)
GO
INSERT [dbo].[SecondaryAction] ([id], [name], [primary_action_id], [active]) VALUES (10, N'Non-Routine', 3, 1)
GO
INSERT [dbo].[SecondaryAction] ([id], [name], [primary_action_id], [active]) VALUES (11, N'Bee Package', 4, 1)
GO
INSERT [dbo].[SecondaryAction] ([id], [name], [primary_action_id], [active]) VALUES (12, N'Split', 4, 1)
GO
INSERT [dbo].[SecondaryAction] ([id], [name], [primary_action_id], [active]) VALUES (13, N'Swarm', 4, 1)
GO
INSERT [dbo].[SecondaryAction] ([id], [name], [primary_action_id], [active]) VALUES (14, N'Sub Test', 5, 1)
GO
INSERT [dbo].[SecondaryAction] ([id], [name], [primary_action_id], [active]) VALUES (15, N'Second Test ', 6, 1)
GO
INSERT [dbo].[SecondaryAction] ([id], [name], [primary_action_id], [active]) VALUES (16, N'New Sub', 7, 1)
GO
SET IDENTITY_INSERT [dbo].[SecondaryAction] OFF
GO
SET IDENTITY_INSERT [dbo].[TertiaryAction] ON 
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (1, 1, N'Mite Away Quick Strips', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (2, 1, N'Mann Lake DC301 Hop Guard', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (3, 1, N'Apivar Strips', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (4, 1, N'Blythwood Apivar', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (5, 1, N'Oxalic Acid Vapor', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (6, 1, N'GreenBeeHives the Victor', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (7, 2, N'Freeze Frames', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (8, 2, N'Paradichlorobenzene', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (9, 2, N'Para-Moth', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (10, 2, N'Wax Moth Trap', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (11, 3, N'Veg. Shortening Sugar Patty', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (12, 3, N'Oxalic Acid', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (13, 3, N'Menthol Crystal', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (14, 4, N'Coumaphos', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (15, 4, N'Boric Acid', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (16, 4, N'Permethrin', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (17, 4, N'Diatomaceous Earth', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (18, 5, N'Oxalic Acid', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (19, 5, N'Apivar Strips', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (20, 6, N'Took Some Frames', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (21, 6, N'Took Super', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (22, 7, N'Removed/Replaced Super', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (23, 7, N'Removed Supers', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (24, 8, N'Infestation', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (25, 8, N'Infected/Mold', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (26, 9, N'Normal', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (27, 10, N'Follow Up Needed', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (28, 11, N'1LB Bee Package', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (29, 11, N'3LB Bee Package', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (30, 12, N'Walk-Away Split', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (31, 12, N'Re-Queened', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (32, 12, N'Swarm Cell Split', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (33, 13, N'Capture Swarm', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (36, 13, N'Re-Queened Swarm', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (37, 14, N'Real Test', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (38, 15, N'Final Test', 1)
GO
INSERT [dbo].[TertiaryAction] ([id], [secondary_action_id], [name], [active]) VALUES (39, 16, N'New Final Action', 1)
GO
SET IDENTITY_INSERT [dbo].[TertiaryAction] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([id], [first_name], [last_name], [access_level], [password], [username]) VALUES (1, N'Jim', N'Nofs', 3, NULL, N'jnofs')
GO
INSERT [dbo].[User] ([id], [first_name], [last_name], [access_level], [password], [username]) VALUES (2, N'bee', N'keeper', 1, NULL, N'beekeeper')
GO
INSERT [dbo].[User] ([id], [first_name], [last_name], [access_level], [password], [username]) VALUES (3, N'team', N'leader', 2, NULL, N'teamleader')
GO
INSERT [dbo].[User] ([id], [first_name], [last_name], [access_level], [password], [username]) VALUES (4, N'Test', N'User', 2, NULL, N'testuser')
GO
INSERT [dbo].[User] ([id], [first_name], [last_name], [access_level], [password], [username]) VALUES (5, N'Bee', N'Admin', 3, NULL, N'admin')
GO
INSERT [dbo].[User] ([id], [first_name], [last_name], [access_level], [password], [username]) VALUES (6, N'Bee ', N'Leader', 2, NULL, N'beeleader')
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Hive] ADD  CONSTRAINT [DF_Hive_aggressive]  DEFAULT ((0)) FOR [aggressive]
GO
ALTER TABLE [dbo].[Hive] ADD  CONSTRAINT [DF_Hive_genetics]  DEFAULT (N'unknown') FOR [genetics]
GO
ALTER TABLE [dbo].[PrimaryAction] ADD  CONSTRAINT [DF_PrimaryAction_active]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[SecondaryAction] ADD  CONSTRAINT [DF_SecondaryAction_active]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[TertiaryAction] ADD  CONSTRAINT [DF_TertiaryAction_active]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[ActionDetail]  WITH CHECK ADD  CONSTRAINT [FK_ActionDetail_Hive] FOREIGN KEY([hive_id])
REFERENCES [dbo].[Hive] ([id])
GO
ALTER TABLE [dbo].[ActionDetail] CHECK CONSTRAINT [FK_ActionDetail_Hive]
GO
ALTER TABLE [dbo].[ActionDetail]  WITH CHECK ADD  CONSTRAINT [FK_ActionDetail_PrimaryAction] FOREIGN KEY([primary_action_id])
REFERENCES [dbo].[PrimaryAction] ([id])
GO
ALTER TABLE [dbo].[ActionDetail] CHECK CONSTRAINT [FK_ActionDetail_PrimaryAction]
GO
ALTER TABLE [dbo].[ActionDetail]  WITH CHECK ADD  CONSTRAINT [FK_ActionDetail_SecondaryAction] FOREIGN KEY([secondary_action_id])
REFERENCES [dbo].[SecondaryAction] ([id])
GO
ALTER TABLE [dbo].[ActionDetail] CHECK CONSTRAINT [FK_ActionDetail_SecondaryAction]
GO
ALTER TABLE [dbo].[ActionDetail]  WITH CHECK ADD  CONSTRAINT [FK_ActionDetail_TertiaryAction] FOREIGN KEY([tertiary_action_id])
REFERENCES [dbo].[TertiaryAction] ([id])
GO
ALTER TABLE [dbo].[ActionDetail] CHECK CONSTRAINT [FK_ActionDetail_TertiaryAction]
GO
ALTER TABLE [dbo].[ActionDetail]  WITH CHECK ADD  CONSTRAINT [FK_ActionDetail_User] FOREIGN KEY([entered_by_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[ActionDetail] CHECK CONSTRAINT [FK_ActionDetail_User]
GO
ALTER TABLE [dbo].[ActionDetail]  WITH CHECK ADD  CONSTRAINT [FK_ActionDetail_User1] FOREIGN KEY([completed_by_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[ActionDetail] CHECK CONSTRAINT [FK_ActionDetail_User1]
GO
ALTER TABLE [dbo].[Hive]  WITH CHECK ADD  CONSTRAINT [FK_Hive_Location] FOREIGN KEY([location_id])
REFERENCES [dbo].[Location] ([id])
GO
ALTER TABLE [dbo].[Hive] CHECK CONSTRAINT [FK_Hive_Location]
GO
ALTER TABLE [dbo].[SecondaryAction]  WITH CHECK ADD  CONSTRAINT [FK_SecondaryAction_PrimaryAction] FOREIGN KEY([primary_action_id])
REFERENCES [dbo].[PrimaryAction] ([id])
GO
ALTER TABLE [dbo].[SecondaryAction] CHECK CONSTRAINT [FK_SecondaryAction_PrimaryAction]
GO
ALTER TABLE [dbo].[TertiaryAction]  WITH CHECK ADD  CONSTRAINT [FK_TertiaryAction_SecondaryAction] FOREIGN KEY([secondary_action_id])
REFERENCES [dbo].[SecondaryAction] ([id])
GO
ALTER TABLE [dbo].[TertiaryAction] CHECK CONSTRAINT [FK_TertiaryAction_SecondaryAction]
GO
/****** Object:  StoredProcedure [dbo].[AddHive]    Script Date: 11/6/2020 4:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddHive]
@location_id int, @inspection_interval int, @name nvarchar(50), @genetics nvarchar(50)
AS
INSERT INTO [Hive] (location_id, inspection_interval, name, genetics, aggressive)
VALUES
(@location_id, @inspection_interval, @name, @genetics, 0)
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 11/6/2020 4:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUser]
	@firstname nvarchar(50), @lastname nvarchar(50), @username nvarchar(50), @accesslevel int
AS
	INSERT INTO [User] (first_name, last_name, username, access_level) VALUES (@firstname, @lastname, @username, @accesslevel)
GO
/****** Object:  StoredProcedure [dbo].[AddYard]    Script Date: 11/6/2020 4:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddYard]
@name nvarchar(50), @address nvarchar(MAX)
AS
INSERT INTO [Location] ([name], [address]) VALUES (@name, @address)
GO
/****** Object:  StoredProcedure [dbo].[DeleteHive]    Script Date: 11/6/2020 4:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteHive]
@id int
AS
DELETE FROM [ActionDetail] WHERE hive_id = @id
DELETE FROM [Hive]
WHERE id = @id
 
GO
/****** Object:  StoredProcedure [dbo].[GetActionDetails]    Script Date: 11/6/2020 4:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetActionDetails]
@hive_id int
AS
SELECT ad.id, ad.primary_action_id, ad.secondary_action_id, ad.tertiary_action_id, ad.completed_by_id, ad.completed, ad.completed_date, ad.entered_by_id, ad.entry_date, ad.scheduled_date, ad.comments,
pa.name AS primary_action_name, sa.name AS secondary_action_name, ta.name AS tertiary_action_name, eu.first_name AS entered_by_first_name, eu.last_name AS entered_by_last_name, cu.first_name AS completed_by_first_name, cu.last_name AS completed_by_last_name
FROM ActionDetail ad
JOIN PrimaryAction pa ON ad.primary_action_id = pa.id
JOIN SecondaryAction sa ON ad.secondary_action_id = sa.id
JOIN TertiaryAction ta ON ad.tertiary_action_id = ta.id
JOIN [User] eu ON ad.entered_by_id = eu.id
JOIN [User] cu ON ad.completed_by_id = cu.id
WHERE ad.hive_id = @hive_id

GO
/****** Object:  StoredProcedure [dbo].[UpdatePrimaryAction]    Script Date: 11/6/2020 4:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePrimaryAction]
@id int, @active bit
AS
UPDATE PrimaryAction SET active = @active WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[UpdateSecondaryAction]    Script Date: 11/6/2020 4:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSecondaryAction]
@id int, @active bit
AS
UPDATE SecondaryAction SET active = @active WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[UpdateTertiaryAction]    Script Date: 11/6/2020 4:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateTertiaryAction]
@id int, @active bit
AS
UPDATE TertiaryAction SET active = @active WHERE id = @id
GO
USE [master]
GO
ALTER DATABASE [HiveHelper] SET  READ_WRITE 
GO
