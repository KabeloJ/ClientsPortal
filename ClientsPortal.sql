﻿USE [master]
GO
/****** Object:  Database [ClientsPortal]    Script Date: 12/10/2022 09:13:01 ******/
CREATE DATABASE [ClientsPortal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentPortal', FILENAME = N'C:\Users\User\StudentPortal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentPortal_log', FILENAME = N'C:\Users\User\StudentPortal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ClientsPortal] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClientsPortal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClientsPortal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClientsPortal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClientsPortal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClientsPortal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClientsPortal] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClientsPortal] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ClientsPortal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClientsPortal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClientsPortal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClientsPortal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClientsPortal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClientsPortal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClientsPortal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClientsPortal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClientsPortal] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ClientsPortal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClientsPortal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClientsPortal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClientsPortal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClientsPortal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClientsPortal] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ClientsPortal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClientsPortal] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ClientsPortal] SET  MULTI_USER 
GO
ALTER DATABASE [ClientsPortal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClientsPortal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClientsPortal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClientsPortal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ClientsPortal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ClientsPortal] SET QUERY_STORE = OFF
GO
USE [ClientsPortal]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ClientsPortal]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/10/2022 09:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 12/10/2022 09:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/10/2022 09:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/10/2022 09:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/10/2022 09:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/10/2022 09:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/10/2022 09:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 12/10/2022 09:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 12/10/2022 09:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ContactType] [nvarchar](50) NOT NULL,
	[ContactNumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Contact\] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interests]    Script Date: 12/10/2022 09:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[Interest] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Interests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserExt]    Script Date: 12/10/2022 09:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserExt](
	[Id] [nvarchar](450) NOT NULL,
	[FirstName] [nvarchar](250) NOT NULL,
	[LastName] [nvarchar](250) NOT NULL,
	[AccessType] [int] NOT NULL,
	[Country] [nvarchar](250) NULL,
	[Gender] [nvarchar](10) NULL,
	[DateOfBirth] [date] NOT NULL,
	[UserCompletedProfile] [bit] NOT NULL,
 CONSTRAINT [PK_UserExt] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'5.0.16')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'61ddfd0c-a79e-414a-8f9c-174ecd6f8998', N'thato', N'THATO', N'thato@gmail.com', N'THATO@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEAbsMrWrLJX+rk+Yy+Ug3ZSFti2wLpG5QQEyxDE8ue96MKr/DsX5yyASfhegUB+6gA==', N'QK74LA6NJ3BQBBNSSHESCV6NKSEKF566', N'f8f72a6c-35c1-4ee7-b9c9-0a8556a1d32a', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'710ca3ae-c51c-48af-96cc-7c3c1bfefe55', N'Thopane', N'THOPANE', N'thopane@gmail.com', N'THOPANE@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAECnhr65UJAnTp3D7MMz33zHDlSPqIjzgN7Met1i6dz7vDdINv6bUcRct8zZEsToFUw==', N'NFSE6CWPRXZTWQK32CLM3NHKA4NDBJZI', N'b35b7588-5530-438f-85ed-1c16f4a66664', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c581b808-d8c1-4a2f-b83e-374dbaca9f9f', N'admin', N'admin', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEDSj/zWAkU2sTRn97gW1nJVMQ1KTa5vZcdwS5/9gjGNE4TWCXc7yQbM9GaPjqvplEQ==', N'XDIXNNDAL56CRWHUH6VSUSEBCWQ2MV27', N'a47fa2cb-9c79-4540-a986-9c3054d969b5', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'fe20fb98-9a25-4aff-87b2-fffb469e447a', N'tester', N'TESTER', N'tester@gmail.com', N'TESTER@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEP6G/8pqqs4LX2qzvqvARTwWB0LrVbqBqR5wq0DsNEpG/bOY5km1EHkg2VNMNxYtJA==', N'AI6AVIXELNE4U5R57S4HTPJXXSB4CAU4', N'5cb4bea1-3d08-4b9e-b675-59d7cd772c11', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([Id], [UserId], [ContactType], [ContactNumber]) VALUES (2, N'c581b808-d8c1-4a2f-b83e-374dbaca9f9f', N'Mobile', N'067 070 2507')
INSERT [dbo].[Contact] ([Id], [UserId], [ContactType], [ContactNumber]) VALUES (3, N'c581b808-d8c1-4a2f-b83e-374dbaca9f9f', N'Email', N'kabelojones@gmail.com')
INSERT [dbo].[Contact] ([Id], [UserId], [ContactType], [ContactNumber]) VALUES (4, N'710ca3ae-c51c-48af-96cc-7c3c1bfefe55', N'Mobile', N'0670702507')
INSERT [dbo].[Contact] ([Id], [UserId], [ContactType], [ContactNumber]) VALUES (5, N'710ca3ae-c51c-48af-96cc-7c3c1bfefe55', N'Fax', N'0869862122')
INSERT [dbo].[Contact] ([Id], [UserId], [ContactType], [ContactNumber]) VALUES (6, N'fe20fb98-9a25-4aff-87b2-fffb469e447a', N'Mobile', N'067 070 2507')
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[Interests] ON 

INSERT [dbo].[Interests] ([Id], [UserId], [Interest]) VALUES (6, N'c581b808-d8c1-4a2f-b83e-374dbaca9f9f', N'Gaming')
INSERT [dbo].[Interests] ([Id], [UserId], [Interest]) VALUES (7, N'c581b808-d8c1-4a2f-b83e-374dbaca9f9f', N'Reading')
INSERT [dbo].[Interests] ([Id], [UserId], [Interest]) VALUES (8, N'c581b808-d8c1-4a2f-b83e-374dbaca9f9f', N'Biking')
INSERT [dbo].[Interests] ([Id], [UserId], [Interest]) VALUES (9, N'c581b808-d8c1-4a2f-b83e-374dbaca9f9f', N'Travelling')
INSERT [dbo].[Interests] ([Id], [UserId], [Interest]) VALUES (10, N'c581b808-d8c1-4a2f-b83e-374dbaca9f9f', N'Coding')
INSERT [dbo].[Interests] ([Id], [UserId], [Interest]) VALUES (11, N'c581b808-d8c1-4a2f-b83e-374dbaca9f9f', N'Hiking')
INSERT [dbo].[Interests] ([Id], [UserId], [Interest]) VALUES (12, N'710ca3ae-c51c-48af-96cc-7c3c1bfefe55', N'Coding')
INSERT [dbo].[Interests] ([Id], [UserId], [Interest]) VALUES (13, N'710ca3ae-c51c-48af-96cc-7c3c1bfefe55', N'Walking')
INSERT [dbo].[Interests] ([Id], [UserId], [Interest]) VALUES (14, N'710ca3ae-c51c-48af-96cc-7c3c1bfefe55', N'Gaming')
INSERT [dbo].[Interests] ([Id], [UserId], [Interest]) VALUES (15, N'fe20fb98-9a25-4aff-87b2-fffb469e447a', N'Coding')
INSERT [dbo].[Interests] ([Id], [UserId], [Interest]) VALUES (16, N'fe20fb98-9a25-4aff-87b2-fffb469e447a', N'Gaming')
SET IDENTITY_INSERT [dbo].[Interests] OFF
GO
INSERT [dbo].[UserExt] ([Id], [FirstName], [LastName], [AccessType], [Country], [Gender], [DateOfBirth], [UserCompletedProfile]) VALUES (N'61ddfd0c-a79e-414a-8f9c-174ecd6f8998', N'', N'', 0, NULL, NULL, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[UserExt] ([Id], [FirstName], [LastName], [AccessType], [Country], [Gender], [DateOfBirth], [UserCompletedProfile]) VALUES (N'710ca3ae-c51c-48af-96cc-7c3c1bfefe55', N'Thopane', N'Rachuene', 0, N'Botswana', N'Male', CAST(N'1985-01-04' AS Date), 1)
INSERT [dbo].[UserExt] ([Id], [FirstName], [LastName], [AccessType], [Country], [Gender], [DateOfBirth], [UserCompletedProfile]) VALUES (N'c581b808-d8c1-4a2f-b83e-374dbaca9f9f', N'Kabelo Jones', N'Modiba', 1, N'South Africa', N'Male', CAST(N'2000-01-14' AS Date), 1)
INSERT [dbo].[UserExt] ([Id], [FirstName], [LastName], [AccessType], [Country], [Gender], [DateOfBirth], [UserCompletedProfile]) VALUES (N'fe20fb98-9a25-4aff-87b2-fffb469e447a', N'Mr Test', N'Tester', 0, N'South Afrika', N'Male', CAST(N'1995-03-31' AS Date), 1)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 12/10/2022 09:13:01 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/10/2022 09:13:01 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 12/10/2022 09:13:01 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 12/10/2022 09:13:01 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 12/10/2022 09:13:01 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 12/10/2022 09:13:01 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/10/2022 09:13:01 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [ClientsPortal] SET  READ_WRITE 
GO
