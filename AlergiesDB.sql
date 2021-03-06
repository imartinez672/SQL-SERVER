USE [master]
GO
/****** Object:  Database [AccountingTracker]    Script Date: 3/15/2022 11:50:24 AM ******/
CREATE DATABASE [AccountingTracker]
 CONTAINMENT = NONE

GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AccountingTracker].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AccountingTracker] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AccountingTracker] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AccountingTracker] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AccountingTracker] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AccountingTracker] SET ARITHABORT OFF 
GO
ALTER DATABASE [AccountingTracker] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AccountingTracker] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AccountingTracker] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AccountingTracker] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AccountingTracker] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AccountingTracker] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AccountingTracker] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AccountingTracker] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AccountingTracker] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AccountingTracker] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AccountingTracker] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AccountingTracker] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AccountingTracker] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AccountingTracker] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AccountingTracker] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AccountingTracker] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AccountingTracker] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AccountingTracker] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AccountingTracker] SET  MULTI_USER 
GO
ALTER DATABASE [AccountingTracker] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AccountingTracker] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AccountingTracker] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AccountingTracker] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AccountingTracker] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AccountingTracker] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AccountingTracker] SET QUERY_STORE = OFF
GO
USE [AccountingTracker]
GO
/****** Object:  Table [dbo].[Expense]    Script Date: 3/15/2022 11:50:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expense](
	[ExID] [int] IDENTITY(1,1) NOT NULL,
	[ExAmount] [decimal](18, 0) NOT NULL,
	[ExDate] [date] NOT NULL,
	[ExDescription] [varchar](250) NOT NULL,
	[ExCategory] [varchar](50) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Expense] PRIMARY KEY CLUSTERED 
(
	[ExID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 3/15/2022 11:50:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NULL,
	[Password] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Expense]  WITH CHECK ADD  CONSTRAINT [FK_Expense_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserLogins] ([id])
GO
ALTER TABLE [dbo].[Expense] CHECK CONSTRAINT [FK_Expense_User]
GO
USE [master]
GO
ALTER DATABASE [AccountingTracker] SET  READ_WRITE 
GO