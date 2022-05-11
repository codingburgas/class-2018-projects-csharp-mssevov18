USE [master]
GO
/****** Object:  Database [Bank_Database]    Script Date: 13.4.2022 г. 17:32:09 ******/
CREATE DATABASE [Bank_Database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bank_Database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Bank_Database.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bank_Database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Bank_Database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Bank_Database] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bank_Database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bank_Database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bank_Database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bank_Database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bank_Database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bank_Database] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bank_Database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bank_Database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bank_Database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bank_Database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bank_Database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bank_Database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bank_Database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bank_Database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bank_Database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bank_Database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bank_Database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bank_Database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bank_Database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bank_Database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bank_Database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bank_Database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bank_Database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bank_Database] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bank_Database] SET  MULTI_USER 
GO
ALTER DATABASE [Bank_Database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bank_Database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bank_Database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bank_Database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bank_Database] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bank_Database] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Bank_Database] SET QUERY_STORE = OFF
GO
USE [Bank_Database]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 13.4.2022 г. 17:32:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[balance] [money] NOT NULL,
	[bank_id] [int] NOT NULL,
	[person_egn] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 13.4.2022 г. 17:32:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank](
	[bank_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Bank] PRIMARY KEY CLUSTERED 
(
	[bank_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bank_Worker]    Script Date: 13.4.2022 г. 17:32:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank_Worker](
	[worker_id] [int] IDENTITY(1,1) NOT NULL,
	[bank_id] [int] NOT NULL,
	[username] [nvarchar](20) NOT NULL,
	[password] [nvarchar](20) NOT NULL,
	[person_egn] [nchar](10) NOT NULL,
	[is_admin] [bit] NOT NULL,
 CONSTRAINT [PK_Bank_Worker] PRIMARY KEY CLUSTERED 
(
	[worker_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 13.4.2022 г. 17:32:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[branch_id] [int] IDENTITY(1,1) NOT NULL,
	[address] [text] NOT NULL,
	[bank_id] [int] NOT NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Card]    Script Date: 13.4.2022 г. 17:32:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[card_id] [int] IDENTITY(1,1) NOT NULL,
	[account_holder_id] [int] NOT NULL,
	[card_num] [nchar](16) NOT NULL,
	[security_num] [nchar](3) NOT NULL,
	[holder_name] [nvarchar](50) NOT NULL,
	[pin] [nchar](4) NOT NULL,
 CONSTRAINT [PK_Card] PRIMARY KEY CLUSTERED 
(
	[card_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Card_Reader]    Script Date: 13.4.2022 г. 17:32:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card_Reader](
	[reader_id] [int] IDENTITY(1,1) NOT NULL,
	[bank_id] [int] NOT NULL,
	[account_reciever_id] [int] NOT NULL,
 CONSTRAINT [PK_Card_Reader] PRIMARY KEY CLUSTERED 
(
	[reader_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 13.4.2022 г. 17:32:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[egn] [nchar](10) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[middle_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[age] [smallint] NOT NULL,
	[residence] [text] NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[egn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 13.4.2022 г. 17:32:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[transaction_id] [int] IDENTITY(1,1) NOT NULL,
	[amount] [money] NOT NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionAccountConnection]    Script Date: 13.4.2022 г. 17:32:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionAccountConnection](
	[connection_id] [int] IDENTITY(1,1) NOT NULL,
	[transaction_id] [int] NOT NULL,
	[account_sender_id] [int] NOT NULL,
	[account_reciever_id] [int] NOT NULL,
 CONSTRAINT [PK_TransactionAccountConnection] PRIMARY KEY CLUSTERED 
(
	[connection_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Bank] FOREIGN KEY([bank_id])
REFERENCES [dbo].[Bank] ([bank_id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Bank]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Person] FOREIGN KEY([person_egn])
REFERENCES [dbo].[Person] ([egn])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Person]
GO
ALTER TABLE [dbo].[Bank_Worker]  WITH CHECK ADD  CONSTRAINT [FK_Bank_Worker_Bank] FOREIGN KEY([bank_id])
REFERENCES [dbo].[Bank] ([bank_id])
GO
ALTER TABLE [dbo].[Bank_Worker] CHECK CONSTRAINT [FK_Bank_Worker_Bank]
GO
ALTER TABLE [dbo].[Bank_Worker]  WITH CHECK ADD  CONSTRAINT [FK_Bank_Worker_Person] FOREIGN KEY([person_egn])
REFERENCES [dbo].[Person] ([egn])
GO
ALTER TABLE [dbo].[Bank_Worker] CHECK CONSTRAINT [FK_Bank_Worker_Person]
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FK_Branch_Bank] FOREIGN KEY([bank_id])
REFERENCES [dbo].[Bank] ([bank_id])
GO
ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK_Branch_Bank]
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD  CONSTRAINT [FK_Card_Account] FOREIGN KEY([account_holder_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[Card] CHECK CONSTRAINT [FK_Card_Account]
GO
ALTER TABLE [dbo].[Card_Reader]  WITH CHECK ADD  CONSTRAINT [FK_Card_Reader_Account] FOREIGN KEY([account_reciever_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[Card_Reader] CHECK CONSTRAINT [FK_Card_Reader_Account]
GO
ALTER TABLE [dbo].[Card_Reader]  WITH CHECK ADD  CONSTRAINT [FK_Card_Reader_Bank] FOREIGN KEY([bank_id])
REFERENCES [dbo].[Bank] ([bank_id])
GO
ALTER TABLE [dbo].[Card_Reader] CHECK CONSTRAINT [FK_Card_Reader_Bank]
GO
ALTER TABLE [dbo].[TransactionAccountConnection]  WITH CHECK ADD  CONSTRAINT [FK_TransactionAccountConnection_Account] FOREIGN KEY([account_sender_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[TransactionAccountConnection] CHECK CONSTRAINT [FK_TransactionAccountConnection_Account]
GO
ALTER TABLE [dbo].[TransactionAccountConnection]  WITH CHECK ADD  CONSTRAINT [FK_TransactionAccountConnection_Account1] FOREIGN KEY([account_reciever_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[TransactionAccountConnection] CHECK CONSTRAINT [FK_TransactionAccountConnection_Account1]
GO
ALTER TABLE [dbo].[TransactionAccountConnection]  WITH CHECK ADD  CONSTRAINT [FK_TransactionAccountConnection_Transaction] FOREIGN KEY([transaction_id])
REFERENCES [dbo].[Transaction] ([transaction_id])
GO
ALTER TABLE [dbo].[TransactionAccountConnection] CHECK CONSTRAINT [FK_TransactionAccountConnection_Transaction]
GO
USE [master]
GO
ALTER DATABASE [Bank_Database] SET  READ_WRITE 
GO
