USE [master]
GO
/****** Object:  Database [Bank_Database]    Script Date: 8.5.2022 г. 20:11:34 ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 8.5.2022 г. 20:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[balance] [money] NOT NULL,
	[bank_id] [int] NOT NULL,
	[person_egn] [nchar](10) NOT NULL,
	[creation_date] [date] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 8.5.2022 г. 20:11:34 ******/
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
/****** Object:  Table [dbo].[Card]    Script Date: 8.5.2022 г. 20:11:34 ******/
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
	[expiration_date] [date] NOT NULL,
	[creation_date] [date] NOT NULL,
 CONSTRAINT [PK_Card] PRIMARY KEY CLUSTERED 
(
	[card_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 8.5.2022 г. 20:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[egn] [nchar](10) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[middle_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[residence] [text] NOT NULL,
	[birth_day] [date] NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[egn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[GetAccountData]    Script Date: 8.5.2022 г. 20:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetAccountData]
AS
SELECT P.first_name + ' ' + P.middle_name + ' ' + P.last_name AS 'Account Full Name', A.balance AS 'Balance', B.name AS 'Bank Name',
                      (SELECT COUNT(card_id) AS Expr1
                       FROM      dbo.Card AS C
                       WHERE   (A.account_id = account_holder_id)) AS 'Card Amount'
FROM     dbo.Account AS A INNER JOIN
                  dbo.Bank AS B ON B.bank_id = A.bank_id INNER JOIN
                  dbo.Person AS P ON P.egn = A.person_egn
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 8.5.2022 г. 20:11:34 ******/
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
/****** Object:  View [dbo].[GetBranchData]    Script Date: 8.5.2022 г. 20:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetBranchData]
AS
SELECT Br.address AS 'Branch Address', Bk.name AS 'Bank Name'
FROM     dbo.Branch AS Br INNER JOIN
                  dbo.Bank AS Bk ON Bk.bank_id = Br.bank_id
GO
/****** Object:  Table [dbo].[Bank_Worker]    Script Date: 8.5.2022 г. 20:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank_Worker](
	[worker_id] [int] IDENTITY(1,1) NOT NULL,
	[bank_id] [int] NOT NULL,
	[username] [nvarchar](32) NOT NULL,
	[password] [nvarchar](256) NOT NULL,
	[person_egn] [nchar](10) NOT NULL,
	[is_admin] [bit] NOT NULL,
	[salary] [money] NOT NULL,
 CONSTRAINT [PK_Bank_Worker] PRIMARY KEY CLUSTERED 
(
	[worker_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Bank_Worker_Username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[GetBankWorkerData]    Script Date: 8.5.2022 г. 20:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetBankWorkerData]
AS
SELECT P.first_name + ' ' + P.middle_name + ' ' + P.last_name AS 'Worker Full Name', Bk.name AS 'Bank Name'
FROM     dbo.Bank_Worker AS Bw INNER JOIN
                  dbo.Bank AS Bk ON Bk.bank_id = Bw.bank_id INNER JOIN
                  dbo.Person AS P ON P.egn = Bw.person_egn
GO
/****** Object:  Table [dbo].[Card_Reader]    Script Date: 8.5.2022 г. 20:11:34 ******/
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
/****** Object:  Table [dbo].[Request]    Script Date: 8.5.2022 г. 20:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[request_id] [int] IDENTITY(1,1) NOT NULL,
	[requester] [nvarchar](1) NOT NULL,
	[timestamp] [datetime] NOT NULL,
	[is_processed] [bit] NOT NULL,
	[table_affected] [nvarchar](50) NOT NULL,
	[will_delete] [bit] NULL,
	[arguments] [text] NOT NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[request_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 8.5.2022 г. 20:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[transaction_id] [int] IDENTITY(1,1) NOT NULL,
	[amount] [money] NOT NULL,
	[timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionAccountConnection]    Script Date: 8.5.2022 г. 20:11:34 ******/
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
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_balance]  DEFAULT ((0)) FOR [balance]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_person_egn]  DEFAULT ('0000000000') FOR [person_egn]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_creation_date]  DEFAULT (getdate()) FOR [creation_date]
GO
ALTER TABLE [dbo].[Bank] ADD  CONSTRAINT [DF_Bank_name]  DEFAULT ('empty') FOR [name]
GO
ALTER TABLE [dbo].[Bank_Worker] ADD  CONSTRAINT [DF_Bank_Worker_bank_id]  DEFAULT ((0)) FOR [bank_id]
GO
ALTER TABLE [dbo].[Bank_Worker] ADD  CONSTRAINT [DF_Bank_Worker_person_egn]  DEFAULT ('0000000000') FOR [person_egn]
GO
ALTER TABLE [dbo].[Bank_Worker] ADD  CONSTRAINT [DF_Bank_Worker_is_admin]  DEFAULT ((0)) FOR [is_admin]
GO
ALTER TABLE [dbo].[Bank_Worker] ADD  CONSTRAINT [DF_Bank_Worker_salary]  DEFAULT ((0)) FOR [salary]
GO
ALTER TABLE [dbo].[Branch] ADD  CONSTRAINT [DF_Branch_address]  DEFAULT ('empty') FOR [address]
GO
ALTER TABLE [dbo].[Branch] ADD  CONSTRAINT [DF_Branch_bank_id]  DEFAULT ((0)) FOR [bank_id]
GO
ALTER TABLE [dbo].[Card] ADD  CONSTRAINT [DF_Card_card_num]  DEFAULT ('0000000000000000') FOR [card_num]
GO
ALTER TABLE [dbo].[Card] ADD  CONSTRAINT [DF_Card_security_num]  DEFAULT ('000') FOR [security_num]
GO
ALTER TABLE [dbo].[Card] ADD  CONSTRAINT [DF_Card_pin]  DEFAULT ('0000') FOR [pin]
GO
ALTER TABLE [dbo].[Card] ADD  CONSTRAINT [DF_Card_expiration_date]  DEFAULT (getdate()) FOR [expiration_date]
GO
ALTER TABLE [dbo].[Card] ADD  CONSTRAINT [DF_Card_creation_date]  DEFAULT (getdate()) FOR [creation_date]
GO
ALTER TABLE [dbo].[Card_Reader] ADD  CONSTRAINT [DF_Card_Reader_bank_id]  DEFAULT ((0)) FOR [bank_id]
GO
ALTER TABLE [dbo].[Card_Reader] ADD  CONSTRAINT [DF_Card_Reader_account_reciever_id]  DEFAULT ((0)) FOR [account_reciever_id]
GO
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [DF_Person_birth_day]  DEFAULT (getdate()) FOR [birth_day]
GO
ALTER TABLE [dbo].[Request] ADD  CONSTRAINT [DF_Request_requester]  DEFAULT ('n') FOR [requester]
GO
ALTER TABLE [dbo].[Request] ADD  CONSTRAINT [DF_Request_timestamp]  DEFAULT (getdate()) FOR [timestamp]
GO
ALTER TABLE [dbo].[Request] ADD  CONSTRAINT [DF_Request_is_processed]  DEFAULT ((0)) FOR [is_processed]
GO
ALTER TABLE [dbo].[Request] ADD  CONSTRAINT [DF_Request_table_affected]  DEFAULT ('none') FOR [table_affected]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_amount]  DEFAULT ((0)) FOR [amount]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_timestamp]  DEFAULT (getdate()) FOR [timestamp]
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
         Begin Table = "A"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 126
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 170
               Right = 726
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetAccountData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetAccountData'
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
         Begin Table = "Bw"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Bk"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 126
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 170
               Right = 726
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetBankWorkerData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetBankWorkerData'
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
         Begin Table = "Br"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 148
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Bk"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 126
               Right = 484
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetBranchData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetBranchData'
GO
USE [master]
GO
ALTER DATABASE [Bank_Database] SET  READ_WRITE 
GO
