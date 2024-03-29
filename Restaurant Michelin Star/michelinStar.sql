USE [master]
GO
/****** Object:  Database [michelinStar]    Script Date: 14/06/2022 12:19:31 ******/
CREATE DATABASE [michelinStar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'michelinStar', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\michelinStar.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'michelinStar_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\michelinStar_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [michelinStar] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [michelinStar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [michelinStar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [michelinStar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [michelinStar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [michelinStar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [michelinStar] SET ARITHABORT OFF 
GO
ALTER DATABASE [michelinStar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [michelinStar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [michelinStar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [michelinStar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [michelinStar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [michelinStar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [michelinStar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [michelinStar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [michelinStar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [michelinStar] SET  DISABLE_BROKER 
GO
ALTER DATABASE [michelinStar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [michelinStar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [michelinStar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [michelinStar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [michelinStar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [michelinStar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [michelinStar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [michelinStar] SET RECOVERY FULL 
GO
ALTER DATABASE [michelinStar] SET  MULTI_USER 
GO
ALTER DATABASE [michelinStar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [michelinStar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [michelinStar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [michelinStar] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [michelinStar] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [michelinStar] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'michelinStar', N'ON'
GO
ALTER DATABASE [michelinStar] SET QUERY_STORE = OFF
GO
USE [michelinStar]
GO
/****** Object:  UserDefinedDataType [dbo].[descricoesEObs]    Script Date: 14/06/2022 12:19:32 ******/
CREATE TYPE [dbo].[descricoesEObs] FROM [char](250) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[ementaEEmpregado]    Script Date: 14/06/2022 12:19:32 ******/
CREATE TYPE [dbo].[ementaEEmpregado] FROM [numeric](3, 0) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[ingredienteID]    Script Date: 14/06/2022 12:19:32 ******/
CREATE TYPE [dbo].[ingredienteID] FROM [numeric](5, 0) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[modoPagamentoID]    Script Date: 14/06/2022 12:19:32 ******/
CREATE TYPE [dbo].[modoPagamentoID] FROM [numeric](1, 0) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[nifPedidoFatura]    Script Date: 14/06/2022 12:19:32 ******/
CREATE TYPE [dbo].[nifPedidoFatura] FROM [numeric](9, 0) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[nome]    Script Date: 14/06/2022 12:19:32 ******/
CREATE TYPE [dbo].[nome] FROM [char](30) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[pratoID]    Script Date: 14/06/2022 12:19:32 ******/
CREATE TYPE [dbo].[pratoID] FROM [numeric](4, 0) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[quantidade]    Script Date: 14/06/2022 12:19:32 ******/
CREATE TYPE [dbo].[quantidade] FROM [numeric](2, 0) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[tipoPratoEPagamento]    Script Date: 14/06/2022 12:19:32 ******/
CREATE TYPE [dbo].[tipoPratoEPagamento] FROM [char](1) NOT NULL
GO
/****** Object:  Table [dbo].[PratoEmenta]    Script Date: 14/06/2022 12:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PratoEmenta](
	[ementaID] [dbo].[ementaEEmpregado] NOT NULL,
	[pratoID] [dbo].[pratoID] NOT NULL,
 CONSTRAINT [PK_PratoEmenta] PRIMARY KEY CLUSTERED 
(
	[ementaID] ASC,
	[pratoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prato]    Script Date: 14/06/2022 12:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prato](
	[pratoID] [dbo].[pratoID] IDENTITY(1,1) NOT NULL,
	[nomePrato] [dbo].[nome] NOT NULL,
	[descricaoPrato] [dbo].[descricoesEObs] NULL,
	[tipoPrato] [dbo].[tipoPratoEPagamento] NOT NULL,
	[preco] [smallmoney] NOT NULL,
 CONSTRAINT [PK_Prato] PRIMARY KEY CLUSTERED 
(
	[pratoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ementa]    Script Date: 14/06/2022 12:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ementa](
	[ementaID] [dbo].[ementaEEmpregado] IDENTITY(1,1) NOT NULL,
	[dataEmenta] [date] NOT NULL,
	[descricaoEmenta] [dbo].[descricoesEObs] NULL,
 CONSTRAINT [PK_Ementa] PRIMARY KEY CLUSTERED 
(
	[ementaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Ementadehoje ]    Script Date: 14/06/2022 12:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Ementadehoje ]
AS
SELECT        e.ementaID, e.dataEmenta, e.descricaoEmenta, p.tipoPrato, p.nomePrato, p.preco
FROM            dbo.Ementa AS e INNER JOIN
                         dbo.PratoEmenta AS f ON e.ementaID = f.ementaID INNER JOIN
                         dbo.Prato AS p ON f.pratoID = p.pratoID
WHERE        (e.dataEmenta = CONVERT([date], GETDATE()))
GO
/****** Object:  Table [dbo].[IngredientePrato]    Script Date: 14/06/2022 12:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IngredientePrato](
	[pratoID] [dbo].[pratoID] NOT NULL,
	[ingredienteID] [dbo].[ingredienteID] NOT NULL,
	[quantidadeIngredientePrato] [dbo].[quantidade] NOT NULL,
 CONSTRAINT [PK_IngredientePrato] PRIMARY KEY CLUSTERED 
(
	[pratoID] ASC,
	[ingredienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingrediente]    Script Date: 14/06/2022 12:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingrediente](
	[ingredienteID] [dbo].[ingredienteID] IDENTITY(1,1) NOT NULL,
	[nomeIngrediente] [dbo].[nome] NOT NULL,
 CONSTRAINT [PK_Ingrediente] PRIMARY KEY CLUSTERED 
(
	[ingredienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ProdutosEmentaAmanha]    Script Date: 14/06/2022 12:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ProdutosEmentaAmanha]
AS
SELECT        e.dataEmenta, i.nomeIngrediente
FROM            dbo.Ementa AS e INNER JOIN
                         dbo.PratoEmenta AS pe ON e.ementaID = pe.ementaID INNER JOIN
                         dbo.Prato AS p ON pe.pratoID = p.pratoID INNER JOIN
                         dbo.IngredientePrato AS ip ON p.pratoID = ip.pratoID INNER JOIN
                         dbo.Ingrediente AS i ON ip.ingredienteID = i.ingredienteID
WHERE        (e.dataEmenta = CONVERT([date], GETDATE() + 1))
GO
/****** Object:  Table [dbo].[PratoPedido]    Script Date: 14/06/2022 12:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PratoPedido](
	[pedidoID] [dbo].[nifPedidoFatura] NOT NULL,
	[pratoID] [dbo].[pratoID] NOT NULL,
	[quantidadePratoPedido] [dbo].[quantidade] NOT NULL,
 CONSTRAINT [PK_PratoPedido_1] PRIMARY KEY CLUSTERED 
(
	[pedidoID] ASC,
	[pratoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empregado]    Script Date: 14/06/2022 12:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empregado](
	[empregadoID] [dbo].[ementaEEmpregado] NOT NULL,
	[primeiroNome] [ntext] NOT NULL,
	[ultimoNome] [ntext] NOT NULL,
	[sexo] [dbo].[tipoPratoEPagamento] NOT NULL,
 CONSTRAINT [PK_Empregado] PRIMARY KEY CLUSTERED 
(
	[empregadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 14/06/2022 12:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[pedidoID] [dbo].[nifPedidoFatura] IDENTITY(1,1) NOT NULL,
	[empregadoID] [dbo].[ementaEEmpregado] NOT NULL,
	[mesaID] [dbo].[quantidade] NOT NULL,
	[dataPedido] [date] NOT NULL,
	[horaPedido] [time](7) NOT NULL,
	[obs] [dbo].[descricoesEObs] NULL,
	[faturado] [bit] NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[pedidoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PedidosDosClientes]    Script Date: 14/06/2022 12:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PedidosDosClientes]
AS
SELECT        ped.pedidoID AS [Numero do Pedido], ped.empregadoID AS [Numero do Empregado], e.primeiroNome AS [Nome do Empregado], ped.mesaID AS Mesa, ped.obs, p.nomePrato AS [Nome do Prato], 
                         prd.quantidadePratoPedido AS Doses
FROM            dbo.Pedido AS ped INNER JOIN
                         dbo.Empregado AS e ON ped.empregadoID = e.empregadoID INNER JOIN
                         dbo.PratoPedido AS prd ON ped.pedidoID = prd.pedidoID INNER JOIN
                         dbo.Prato AS p ON prd.pratoID = p.pratoID
GO
/****** Object:  View [dbo].[PedidosComDescritivoEPreco]    Script Date: 14/06/2022 12:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PedidosComDescritivoEPreco]
AS
SELECT        ped.pedidoID, ped.empregadoID, p.nomePrato AS [Nome do Prato], prd.quantidadePratoPedido AS Doses, p.preco AS [Preço a dose], p.preco * prd.quantidadePratoPedido AS Preço
FROM            dbo.Pedido AS ped INNER JOIN
                         dbo.PratoPedido AS prd ON ped.pedidoID = prd.pedidoID INNER JOIN
                         dbo.Prato AS p ON prd.pratoID = p.pratoID
GO
/****** Object:  View [dbo].[PedidosTotalAPagar]    Script Date: 14/06/2022 12:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PedidosTotalAPagar]
AS
SELECT        ped.pedidoID, SUM(prd.quantidadePratoPedido) AS [Total de Pratos], SUM(p.preco * prd.quantidadePratoPedido) AS [Preço Total]
FROM            dbo.Pedido AS ped INNER JOIN
                         dbo.PratoPedido AS prd ON ped.pedidoID = prd.pedidoID INNER JOIN
                         dbo.Prato AS p ON prd.pratoID = p.pratoID
GROUP BY ped.pedidoID
GO
/****** Object:  View [dbo].[DiasCorrenteMesCarneEPeixe]    Script Date: 14/06/2022 12:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DiasCorrenteMesCarneEPeixe]
AS
SELECT DISTINCT day(e.dataEmenta) AS DAYS,  MONTH(GETDATE()) AS MONTH
FROM            Ementa e, PratoEmenta f, Prato p
WHERE        (p.tipoPrato = 'P') AND (e.ementaID = f.ementaID AND p.pratoID = f.pratoID) AND MONTH(e.dataEmenta) = MONTH(GETDATE()) 
INTERSECT
SELECT DISTINCT day(e.dataEmenta) AS DAYS, MONTH(GETDATE())  AS MONTH
FROM            Ementa e, PratoEmenta f, Prato p
WHERE        (p.tipoPrato = 'C') AND (e.ementaID = f.ementaID AND p.pratoID = f.pratoID) and MONTH(e.dataEmenta) = MONTH(GETDATE()) 
GO
/****** Object:  Table [dbo].[Fatura]    Script Date: 14/06/2022 12:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fatura](
	[faturaID] [dbo].[nifPedidoFatura] IDENTITY(1,1) NOT NULL,
	[pedidoID] [dbo].[nifPedidoFatura] NOT NULL,
	[dataEmissao] [date] NOT NULL,
	[horaEmissao] [time](7) NOT NULL,
	[nifCliente] [dbo].[nifPedidoFatura] NULL,
	[modoPagamentoID] [dbo].[modoPagamentoID] NOT NULL,
	[valorTotal] [smallmoney] NULL,
 CONSTRAINT [PK_Fatura] PRIMARY KEY CLUSTERED 
(
	[faturaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mesa]    Script Date: 14/06/2022 12:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mesa](
	[mesaID] [dbo].[quantidade] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_Mesa] PRIMARY KEY CLUSTERED 
(
	[mesaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModoPagamento]    Script Date: 14/06/2022 12:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModoPagamento](
	[modoPagamentoID] [dbo].[modoPagamentoID] IDENTITY(1,1) NOT NULL,
	[designacaoPagamento] [dbo].[tipoPratoEPagamento] NOT NULL,
 CONSTRAINT [PK_ModoPagamento] PRIMARY KEY CLUSTERED 
(
	[modoPagamentoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ementa] ADD  CONSTRAINT [DF_Ementa_dataEmenta]  DEFAULT (CONVERT([date],getdate())) FOR [dataEmenta]
GO
ALTER TABLE [dbo].[Fatura] ADD  CONSTRAINT [DF_Fatura_dataEmissao]  DEFAULT (CONVERT([date],getdate())) FOR [dataEmissao]
GO
ALTER TABLE [dbo].[Fatura] ADD  CONSTRAINT [DF_Fatura_horaEmissao]  DEFAULT (CONVERT([time],getdate())) FOR [horaEmissao]
GO
ALTER TABLE [dbo].[Mesa] ADD  CONSTRAINT [DF_Mesa_estado]  DEFAULT ((0)) FOR [estado]
GO
ALTER TABLE [dbo].[Pedido] ADD  CONSTRAINT [DF_Pedido_dataPedido]  DEFAULT (CONVERT([date],getdate())) FOR [dataPedido]
GO
ALTER TABLE [dbo].[Pedido] ADD  CONSTRAINT [DF_Pedido_horaPedido]  DEFAULT (CONVERT([time],getdate())) FOR [horaPedido]
GO
ALTER TABLE [dbo].[Pedido] ADD  CONSTRAINT [DF_Pedido_faturado]  DEFAULT ((0)) FOR [faturado]
GO
ALTER TABLE [dbo].[Fatura]  WITH CHECK ADD  CONSTRAINT [FK_Fatura_ModoPagamento] FOREIGN KEY([modoPagamentoID])
REFERENCES [dbo].[ModoPagamento] ([modoPagamentoID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Fatura] CHECK CONSTRAINT [FK_Fatura_ModoPagamento]
GO
ALTER TABLE [dbo].[Fatura]  WITH CHECK ADD  CONSTRAINT [FK_Fatura_Pedido] FOREIGN KEY([pedidoID])
REFERENCES [dbo].[Pedido] ([pedidoID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Fatura] CHECK CONSTRAINT [FK_Fatura_Pedido]
GO
ALTER TABLE [dbo].[IngredientePrato]  WITH CHECK ADD  CONSTRAINT [FK_IngredientePrato_Ingrediente] FOREIGN KEY([ingredienteID])
REFERENCES [dbo].[Ingrediente] ([ingredienteID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IngredientePrato] CHECK CONSTRAINT [FK_IngredientePrato_Ingrediente]
GO
ALTER TABLE [dbo].[IngredientePrato]  WITH CHECK ADD  CONSTRAINT [FK_IngredientePrato_Prato] FOREIGN KEY([pratoID])
REFERENCES [dbo].[Prato] ([pratoID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IngredientePrato] CHECK CONSTRAINT [FK_IngredientePrato_Prato]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Empregado] FOREIGN KEY([empregadoID])
REFERENCES [dbo].[Empregado] ([empregadoID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Empregado]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Mesa] FOREIGN KEY([mesaID])
REFERENCES [dbo].[Mesa] ([mesaID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Mesa]
GO
ALTER TABLE [dbo].[PratoEmenta]  WITH CHECK ADD  CONSTRAINT [FK_PratoEmenta_Ementa] FOREIGN KEY([ementaID])
REFERENCES [dbo].[Ementa] ([ementaID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PratoEmenta] CHECK CONSTRAINT [FK_PratoEmenta_Ementa]
GO
ALTER TABLE [dbo].[PratoEmenta]  WITH CHECK ADD  CONSTRAINT [FK_PratoEmenta_Prato] FOREIGN KEY([pratoID])
REFERENCES [dbo].[Prato] ([pratoID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PratoEmenta] CHECK CONSTRAINT [FK_PratoEmenta_Prato]
GO
ALTER TABLE [dbo].[PratoPedido]  WITH CHECK ADD  CONSTRAINT [FK_PratoPedido_Pedido] FOREIGN KEY([pedidoID])
REFERENCES [dbo].[Pedido] ([pedidoID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PratoPedido] CHECK CONSTRAINT [FK_PratoPedido_Pedido]
GO
ALTER TABLE [dbo].[PratoPedido]  WITH CHECK ADD  CONSTRAINT [FK_PratoPedido_Prato] FOREIGN KEY([pratoID])
REFERENCES [dbo].[Prato] ([pratoID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PratoPedido] CHECK CONSTRAINT [FK_PratoPedido_Prato]
GO
ALTER TABLE [dbo].[Empregado]  WITH CHECK ADD  CONSTRAINT [CK_sexo] CHECK  (([sexo]='M' OR [sexo]='F'))
GO
ALTER TABLE [dbo].[Empregado] CHECK CONSTRAINT [CK_sexo]
GO
ALTER TABLE [dbo].[Fatura]  WITH CHECK ADD  CONSTRAINT [CK_NIF] CHECK  (([nifCliente]>(99999999) AND [nifCLiente]<(1000000000)))
GO
ALTER TABLE [dbo].[Fatura] CHECK CONSTRAINT [CK_NIF]
GO
ALTER TABLE [dbo].[Mesa]  WITH CHECK ADD  CONSTRAINT [CK_mesaID] CHECK  (([mesaID]<(21)))
GO
ALTER TABLE [dbo].[Mesa] CHECK CONSTRAINT [CK_mesaID]
GO
ALTER TABLE [dbo].[ModoPagamento]  WITH CHECK ADD  CONSTRAINT [CK_tiposPagamento] CHECK  (([designacaoPagamento]='D' OR [designacaoPagamento]='M' OR [designacaoPagamento]='W'))
GO
ALTER TABLE [dbo].[ModoPagamento] CHECK CONSTRAINT [CK_tiposPagamento]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [CK_mesa] CHECK  (([mesaID]<(21)))
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [CK_mesa]
GO
ALTER TABLE [dbo].[Prato]  WITH CHECK ADD  CONSTRAINT [CK_precoPositivo] CHECK  (([preco]>(0)))
GO
ALTER TABLE [dbo].[Prato] CHECK CONSTRAINT [CK_precoPositivo]
GO
ALTER TABLE [dbo].[Prato]  WITH CHECK ADD  CONSTRAINT [CK_tipoPrato] CHECK  (([tipoPrato]='E' OR [tipoPrato]='B' OR [tipoPrato]='P' OR [tipoPrato]='C' OR [tipoPrato]='S' OR [tipoPrato]='D'))
GO
ALTER TABLE [dbo].[Prato] CHECK CONSTRAINT [CK_tipoPrato]
GO
ALTER TABLE [dbo].[PratoPedido]  WITH CHECK ADD  CONSTRAINT [CK_quantidadePratoPedido] CHECK  (([quantidadePratoPedido]>(0) AND [quantidadePratoPedido]<(100)))
GO
ALTER TABLE [dbo].[PratoPedido] CHECK CONSTRAINT [CK_quantidadePratoPedido]
GO
/****** Object:  StoredProcedure [dbo].[DescricaoPedidoDeCliente]    Script Date: 14/06/2022 12:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DescricaoPedidoDeCliente] @pedidoID numeric(9,0)
AS
BEGIN
	
	SET NOCOUNT ON;

    Select ped.pedidoID, ped.mesaID as Mesa, emp.primeiroNome as "Nome do Empregado", prt.nomePrato, prd.quantidadePratoPedido as Doses, ped.obs
	From Pedido ped, PratoPedido prd, Prato prt, Empregado emp
	Where ped.pedidoID = @pedidoID and (ped.pedidoID = prd.pedidoID and prd.pratoID = prt.pratoID) and ped.empregadoID = emp.empregadoID
END
GO
/****** Object:  StoredProcedure [dbo].[PedidoDeClienteComPreco]    Script Date: 14/06/2022 12:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PedidoDeClienteComPreco] @pedidoID numeric(9,0)
AS
BEGIN
	
	SET NOCOUNT ON;

    Select ped.pedidoID, ped.mesaID as Mesa, emp.primeiroNome as "Nome do Empregado", prt.nomePrato, prd.quantidadePratoPedido as Doses, prt.preco, fat.valorTotal as "Total pedido completo a Pagar" 
	From Pedido ped, PratoPedido prd, Prato prt, Empregado emp, Fatura fat
	Where ped.pedidoID = @pedidoID and (ped.pedidoID = fat.pedidoID and ped.pedidoID = prd.pedidoID and prd.pratoID = prt.pratoID) and ped.empregadoID = emp.empregadoID
END
GO
/****** Object:  StoredProcedure [dbo].[PratosCarneEntreDatas]    Script Date: 14/06/2022 12:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PratosCarneEntreDatas] @date1 date, @date2 date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT e.dataEmenta, p.nomePrato, p.tipoPrato 
	From Ementa e, PratoEmenta pe, Prato p
	Where (e.ementaID = pe.ementaID and pe.pratoID = p.pratoID) and (e.dataEmenta between @date1 and @date2) and p.tipoPrato = 'C'

END
GO
/****** Object:  StoredProcedure [dbo].[TotalFaturadoEntreDatas]    Script Date: 14/06/2022 12:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TotalFaturadoEntreDatas] @date1 date, @date2 date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT SUM(valorTotal) AS 'Total faturado entre datas'
	From Fatura
	Where dataEmissao between @date1 and @date2

END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sexo assume M = male ou F = female' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Empregado', @level2type=N'CONSTRAINT',@level2name=N'CK_sexo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valores validos de NIF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fatura', @level2type=N'CONSTRAINT',@level2name=N'CK_NIF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'mesa ID = nr mesa menor que 21 (mesas do restaurante)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mesa', @level2type=N'CONSTRAINT',@level2name=N'CK_mesaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valores validos = D ou M ou W' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModoPagamento', @level2type=N'CONSTRAINT',@level2name=N'CK_tiposPagamento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Só temos 20 mesas no restaurante' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pedido', @level2type=N'CONSTRAINT',@level2name=N'CK_mesa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Preço maior que zero' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Prato', @level2type=N'CONSTRAINT',@level2name=N'CK_precoPositivo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Verifica se o tipo de prato é o correto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Prato', @level2type=N'CONSTRAINT',@level2name=N'CK_tipoPrato'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'quantidade a pedir maior que 0 e menor 100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PratoPedido', @level2type=N'CONSTRAINT',@level2name=N'CK_quantidadePratoPedido'
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
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DiasCorrenteMesCarneEPeixe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DiasCorrenteMesCarneEPeixe'
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
         Begin Table = "e"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 217
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "f"
            Begin Extent = 
               Top = 6
               Left = 255
               Bottom = 102
               Right = 425
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 463
               Bottom = 136
               Right = 633
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Ementadehoje '
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Ementadehoje '
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
         Begin Table = "ped"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "prd"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 460
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 498
               Bottom = 136
               Right = 668
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PedidosComDescritivoEPreco'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PedidosComDescritivoEPreco'
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
         Begin Table = "ped"
            Begin Extent = 
               Top = 5
               Left = 272
               Bottom = 135
               Right = 442
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 1
               Left = 17
               Bottom = 131
               Right = 187
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "prd"
            Begin Extent = 
               Top = 6
               Left = 484
               Bottom = 119
               Right = 698
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 5
               Left = 772
               Bottom = 135
               Right = 942
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PedidosDosClientes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PedidosDosClientes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[21] 3) )"
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
         Begin Table = "ped"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "prd"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 119
               Right = 492
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 530
               Bottom = 136
               Right = 716
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PedidosTotalAPagar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PedidosTotalAPagar'
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
         Begin Table = "e"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 217
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pe"
            Begin Extent = 
               Top = 6
               Left = 255
               Bottom = 102
               Right = 425
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 463
               Bottom = 136
               Right = 633
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ip"
            Begin Extent = 
               Top = 6
               Left = 671
               Bottom = 119
               Right = 908
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "i"
            Begin Extent = 
               Top = 150
               Left = 456
               Bottom = 246
               Right = 636
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProdutosEmentaAmanha'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 720
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProdutosEmentaAmanha'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProdutosEmentaAmanha'
GO
USE [master]
GO
ALTER DATABASE [michelinStar] SET  READ_WRITE 
GO
