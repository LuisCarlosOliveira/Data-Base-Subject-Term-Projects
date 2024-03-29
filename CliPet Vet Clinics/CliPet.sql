USE [master]
GO
/****** Object:  Database [clipet]    Script Date: 14/06/2022 12:25:13 ******/
CREATE DATABASE [clipet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cliPet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\clipet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'cliPet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\clipet_0.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [clipet] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [clipet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [clipet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [clipet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [clipet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [clipet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [clipet] SET ARITHABORT OFF 
GO
ALTER DATABASE [clipet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [clipet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [clipet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [clipet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [clipet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [clipet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [clipet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [clipet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [clipet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [clipet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [clipet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [clipet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [clipet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [clipet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [clipet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [clipet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [clipet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [clipet] SET RECOVERY FULL 
GO
ALTER DATABASE [clipet] SET  MULTI_USER 
GO
ALTER DATABASE [clipet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [clipet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [clipet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [clipet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [clipet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [clipet] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'clipet', N'ON'
GO
ALTER DATABASE [clipet] SET QUERY_STORE = OFF
GO
USE [clipet]
GO
/****** Object:  UserDefinedDataType [dbo].[animalIDType]    Script Date: 14/06/2022 12:25:13 ******/
CREATE TYPE [dbo].[animalIDType] FROM [numeric](6, 0) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[ccType]    Script Date: 14/06/2022 12:25:13 ******/
CREATE TYPE [dbo].[ccType] FROM [numeric](8, 0) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[clienteIDType]    Script Date: 14/06/2022 12:25:13 ******/
CREATE TYPE [dbo].[clienteIDType] FROM [numeric](6, 0) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[clinicaIDType]    Script Date: 14/06/2022 12:25:13 ******/
CREATE TYPE [dbo].[clinicaIDType] FROM [numeric](4, 0) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[detalhesIDType]    Script Date: 14/06/2022 12:25:13 ******/
CREATE TYPE [dbo].[detalhesIDType] FROM [numeric](3, 0) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[especieID]    Script Date: 14/06/2022 12:25:13 ******/
CREATE TYPE [dbo].[especieID] FROM [numeric](2, 0) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[faturaIDType]    Script Date: 14/06/2022 12:25:13 ******/
CREATE TYPE [dbo].[faturaIDType] FROM [numeric](9, 0) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[funcionarioIDType]    Script Date: 14/06/2022 12:25:13 ******/
CREATE TYPE [dbo].[funcionarioIDType] FROM [numeric](3, 0) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[marcacaoID]    Script Date: 14/06/2022 12:25:13 ******/
CREATE TYPE [dbo].[marcacaoID] FROM [numeric](9, 0) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[measurementType]    Script Date: 14/06/2022 12:25:13 ******/
CREATE TYPE [dbo].[measurementType] FROM [decimal](5, 2) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[microchipType]    Script Date: 14/06/2022 12:25:13 ******/
CREATE TYPE [dbo].[microchipType] FROM [numeric](15, 0) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[modoPagamentoIDType]    Script Date: 14/06/2022 12:25:13 ******/
CREATE TYPE [dbo].[modoPagamentoIDType] FROM [numeric](1, 0) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[racaID]    Script Date: 14/06/2022 12:25:13 ******/
CREATE TYPE [dbo].[racaID] FROM [numeric](4, 0) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[servicoIDType]    Script Date: 14/06/2022 12:25:13 ******/
CREATE TYPE [dbo].[servicoIDType] FROM [numeric](3, 0) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[teIIDType]    Script Date: 14/06/2022 12:25:13 ******/
CREATE TYPE [dbo].[teIIDType] FROM [numeric](3, 0) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[telNifType]    Script Date: 14/06/2022 12:25:13 ******/
CREATE TYPE [dbo].[telNifType] FROM [numeric](9, 0) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[tipoFuncionarioIDType]    Script Date: 14/06/2022 12:25:13 ******/
CREATE TYPE [dbo].[tipoFuncionarioIDType] FROM [numeric](1, 0) NOT NULL
GO
/****** Object:  Table [dbo].[Marcacao]    Script Date: 14/06/2022 12:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marcacao](
	[marcacaoID] [dbo].[marcacaoID] IDENTITY(1,1) NOT NULL,
	[dataMarcacao] [date] NOT NULL,
	[horaInicio] [time](7) NOT NULL,
	[horaFim] [time](7) NULL,
	[estado] [varchar](15) NOT NULL,
	[descricao] [varchar](100) NOT NULL,
	[marcacaoRef] [dbo].[marcacaoID] NULL,
	[urgencia] [bit] NOT NULL,
	[clinicaID] [dbo].[clinicaIDType] NOT NULL,
	[animalID] [dbo].[animalIDType] NOT NULL,
	[servicoID] [dbo].[servicoIDType] NOT NULL,
	[funcionarioID] [dbo].[funcionarioIDType] NOT NULL,
 CONSTRAINT [PK_Marcacao] PRIMARY KEY CLUSTERED 
(
	[marcacaoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 14/06/2022 12:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[clienteID] [dbo].[clienteIDType] IDENTITY(1,1) NOT NULL,
	[primeiroNome] [varchar](15) NOT NULL,
	[ultimoNome] [varchar](15) NOT NULL,
	[cc] [dbo].[ccType] NOT NULL,
	[nif] [dbo].[telNifType] NOT NULL,
	[email] [varchar](256) NOT NULL,
	[rua] [varchar](50) NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[codPostal] [varchar](8) NOT NULL,
	[pais] [varchar](2) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[clienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnimalCliente]    Script Date: 14/06/2022 12:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimalCliente](
	[animalID] [dbo].[animalIDType] NOT NULL,
	[clienteID] [dbo].[clienteIDType] NOT NULL,
	[dataDeAdocao] [date] NOT NULL,
	[estadoDono] [varchar](10) NOT NULL,
 CONSTRAINT [PK_AnimalCliente] PRIMARY KEY CLUSTERED 
(
	[animalID] ASC,
	[clienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Animal]    Script Date: 14/06/2022 12:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal](
	[animalID] [dbo].[animalIDType] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](15) NOT NULL,
	[dataDeNascimento] [date] NOT NULL,
	[comportamento] [varchar](15) NOT NULL,
	[microchip] [dbo].[microchipType] NULL,
	[peso] [dbo].[measurementType] NOT NULL,
	[altura] [dbo].[measurementType] NOT NULL,
	[sexo] [varchar](1) NOT NULL,
	[estado] [bit] NOT NULL,
	[racaID] [dbo].[racaID] NOT NULL,
 CONSTRAINT [PK_Animal] PRIMARY KEY CLUSTERED 
(
	[animalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PercentagemConsultas]    Script Date: 14/06/2022 12:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PercentagemConsultas]
AS SELECT c.clienteID, c.primeiroNome, c.ultimoNome, m.marcacaoID, m.estado
FROM Cliente c, Marcacao m, AnimalCliente ac, Animal a
WHERE c.clienteID = ac.clienteID AND 
	a.animalID = ac.animalID AND
	m.animalID = a.animalID AND 
	ac.estadoDono = 'Ativo'
GO
/****** Object:  View [dbo].[Percentagem_20]    Script Date: 14/06/2022 12:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Percentagem_20]
AS SELECT tb1.clienteID, tb1.primeiroNome, tb1.ultimoNome, tb1.nCanceladas, tb2.NMarcacoes
FROM (SELECT clienteID, primeiroNome, ultimoNome,CAST(COUNT(clienteID)AS decimal) AS nCanceladas
		FROM PercentagemConsultas
		WHERE estado = 'Cancelada' OR estado = 'Remarcada'
		GROUP BY clienteID, primeiroNome, ultimoNome) as tb1,
		(SELECT clienteID, COUNT(clienteID) AS NMarcacoes
		FROM PercentagemConsultas
		GROUP BY clienteID) as tb2
WHERE tb1.clienteID = tb2.clienteID AND ((nCanceladas / NMarcacoes)*100) > 20
GO
/****** Object:  Table [dbo].[Clinica]    Script Date: 14/06/2022 12:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clinica](
	[clinicaID] [dbo].[clinicaIDType] IDENTITY(1,1) NOT NULL,
	[telID] [dbo].[teIIDType] NOT NULL,
	[email] [varchar](256) NOT NULL,
	[rua] [varchar](50) NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[codPostal] [varchar](8) NOT NULL,
	[pais] [varchar](2) NOT NULL,
	[realizaExame] [bit] NOT NULL,
 CONSTRAINT [PK_Clinica] PRIMARY KEY CLUSTERED 
(
	[clinicaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalhesMarcacao]    Script Date: 14/06/2022 12:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalhesMarcacao](
	[detalhesID] [dbo].[detalhesIDType] IDENTITY(1,1) NOT NULL,
	[motivo] [varchar](50) NOT NULL,
	[tratamento] [varchar](100) NOT NULL,
	[obs] [varchar](100) NULL,
	[peso] [dbo].[measurementType] NULL,
	[temperatura] [decimal](3, 1) NULL,
	[freqCardiaca] [numeric](3, 0) NULL,
	[marcacaoID] [dbo].[marcacaoID] NOT NULL,
 CONSTRAINT [PK_DetalhesMarcacao] PRIMARY KEY CLUSTERED 
(
	[detalhesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especie]    Script Date: 14/06/2022 12:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especie](
	[especieID] [dbo].[especieID] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Especie] PRIMARY KEY CLUSTERED 
(
	[especieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fatura]    Script Date: 14/06/2022 12:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fatura](
	[faturaID] [dbo].[faturaIDType] IDENTITY(1,1) NOT NULL,
	[modoPagamentoID] [dbo].[modoPagamentoIDType] NOT NULL,
	[dataEmissao] [date] NOT NULL,
	[horaEmissao] [time](7) NOT NULL,
	[valor] [smallmoney] NOT NULL,
	[marcacaoID] [dbo].[marcacaoID] NOT NULL,
 CONSTRAINT [PK_Fatura] PRIMARY KEY CLUSTERED 
(
	[faturaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funcionario]    Script Date: 14/06/2022 12:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funcionario](
	[funcionarioID] [dbo].[funcionarioIDType] IDENTITY(1,1) NOT NULL,
	[primeiroNome] [varchar](15) NOT NULL,
	[ultimoNome] [varchar](15) NOT NULL,
	[sexo] [varchar](1) NOT NULL,
	[dataDeNascimento] [date] NOT NULL,
	[dataDeModificacao] [datetime] NOT NULL,
	[tipoID] [dbo].[tipoFuncionarioIDType] NOT NULL,
	[clinicaID] [dbo].[clinicaIDType] NOT NULL,
 CONSTRAINT [PK_Funcionario] PRIMARY KEY CLUSTERED 
(
	[funcionarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModoPagamento]    Script Date: 14/06/2022 12:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModoPagamento](
	[modoPagamentoID] [dbo].[modoPagamentoIDType] IDENTITY(1,1) NOT NULL,
	[designacao] [varchar](25) NOT NULL,
 CONSTRAINT [PK_ModoPagamento] PRIMARY KEY CLUSTERED 
(
	[modoPagamentoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Raca]    Script Date: 14/06/2022 12:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Raca](
	[racaID] [dbo].[racaID] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](50) NOT NULL,
	[especieID] [dbo].[especieID] NOT NULL,
 CONSTRAINT [PK_Raca] PRIMARY KEY CLUSTERED 
(
	[racaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servico]    Script Date: 14/06/2022 12:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servico](
	[servicoID] [dbo].[servicoIDType] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](100) NOT NULL,
	[precoBase] [smallmoney] NOT NULL,
	[tipoServico] [varchar](50) NOT NULL,
	[duracao] [numeric](3, 0) NOT NULL,
 CONSTRAINT [PK_Servico] PRIMARY KEY CLUSTERED 
(
	[servicoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telefone]    Script Date: 14/06/2022 12:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefone](
	[telID] [dbo].[teIIDType] IDENTITY(1,1) NOT NULL,
	[telNo] [dbo].[telNifType] NOT NULL,
 CONSTRAINT [PK_Telefone] PRIMARY KEY CLUSTERED 
(
	[telID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoFuncionario]    Script Date: 14/06/2022 12:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoFuncionario](
	[tipoID] [dbo].[tipoFuncionarioIDType] IDENTITY(1,1) NOT NULL,
	[tipoFuncionario] [varchar](25) NOT NULL,
 CONSTRAINT [PK_TipoFuncionario] PRIMARY KEY CLUSTERED 
(
	[tipoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_DetalhesMarcacao]    Script Date: 14/06/2022 12:25:13 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_DetalhesMarcacao] ON [dbo].[DetalhesMarcacao]
(
	[marcacaoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Animal] ADD  CONSTRAINT [DF_Animal_sexo]  DEFAULT (N'M') FOR [sexo]
GO
ALTER TABLE [dbo].[Cliente] ADD  CONSTRAINT [DF_Cliente_pais]  DEFAULT (N'PT') FOR [pais]
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [FK_Animal_Raca] FOREIGN KEY([racaID])
REFERENCES [dbo].[Raca] ([racaID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [FK_Animal_Raca]
GO
ALTER TABLE [dbo].[AnimalCliente]  WITH CHECK ADD  CONSTRAINT [FK_AnimalCliente_Animal] FOREIGN KEY([animalID])
REFERENCES [dbo].[Animal] ([animalID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[AnimalCliente] CHECK CONSTRAINT [FK_AnimalCliente_Animal]
GO
ALTER TABLE [dbo].[AnimalCliente]  WITH CHECK ADD  CONSTRAINT [FK_AnimalCliente_Cliente] FOREIGN KEY([clienteID])
REFERENCES [dbo].[Cliente] ([clienteID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[AnimalCliente] CHECK CONSTRAINT [FK_AnimalCliente_Cliente]
GO
ALTER TABLE [dbo].[Clinica]  WITH CHECK ADD  CONSTRAINT [FK_Clinica_Telefone] FOREIGN KEY([telID])
REFERENCES [dbo].[Telefone] ([telID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Clinica] CHECK CONSTRAINT [FK_Clinica_Telefone]
GO
ALTER TABLE [dbo].[DetalhesMarcacao]  WITH CHECK ADD  CONSTRAINT [FK_DetalhesMarcacao_Marcacao] FOREIGN KEY([marcacaoID])
REFERENCES [dbo].[Marcacao] ([marcacaoID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DetalhesMarcacao] CHECK CONSTRAINT [FK_DetalhesMarcacao_Marcacao]
GO
ALTER TABLE [dbo].[Fatura]  WITH CHECK ADD  CONSTRAINT [FK_Fatura_Marcacao] FOREIGN KEY([marcacaoID])
REFERENCES [dbo].[Marcacao] ([marcacaoID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Fatura] CHECK CONSTRAINT [FK_Fatura_Marcacao]
GO
ALTER TABLE [dbo].[Fatura]  WITH CHECK ADD  CONSTRAINT [FK_Fatura_ModoPagamento] FOREIGN KEY([modoPagamentoID])
REFERENCES [dbo].[ModoPagamento] ([modoPagamentoID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Fatura] CHECK CONSTRAINT [FK_Fatura_ModoPagamento]
GO
ALTER TABLE [dbo].[Funcionario]  WITH CHECK ADD  CONSTRAINT [FK_Funcionario_Clinica] FOREIGN KEY([clinicaID])
REFERENCES [dbo].[Clinica] ([clinicaID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Funcionario] CHECK CONSTRAINT [FK_Funcionario_Clinica]
GO
ALTER TABLE [dbo].[Funcionario]  WITH CHECK ADD  CONSTRAINT [FK_Funcionario_TipoFuncionario] FOREIGN KEY([tipoID])
REFERENCES [dbo].[TipoFuncionario] ([tipoID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Funcionario] CHECK CONSTRAINT [FK_Funcionario_TipoFuncionario]
GO
ALTER TABLE [dbo].[Marcacao]  WITH CHECK ADD  CONSTRAINT [FK_Marcacao_Animal] FOREIGN KEY([animalID])
REFERENCES [dbo].[Animal] ([animalID])
GO
ALTER TABLE [dbo].[Marcacao] CHECK CONSTRAINT [FK_Marcacao_Animal]
GO
ALTER TABLE [dbo].[Marcacao]  WITH CHECK ADD  CONSTRAINT [FK_Marcacao_Clinica] FOREIGN KEY([clinicaID])
REFERENCES [dbo].[Clinica] ([clinicaID])
GO
ALTER TABLE [dbo].[Marcacao] CHECK CONSTRAINT [FK_Marcacao_Clinica]
GO
ALTER TABLE [dbo].[Marcacao]  WITH CHECK ADD  CONSTRAINT [FK_Marcacao_Funcionario] FOREIGN KEY([funcionarioID])
REFERENCES [dbo].[Funcionario] ([funcionarioID])
GO
ALTER TABLE [dbo].[Marcacao] CHECK CONSTRAINT [FK_Marcacao_Funcionario]
GO
ALTER TABLE [dbo].[Marcacao]  WITH CHECK ADD  CONSTRAINT [FK_Marcacao_Marcacao] FOREIGN KEY([marcacaoRef])
REFERENCES [dbo].[Marcacao] ([marcacaoID])
GO
ALTER TABLE [dbo].[Marcacao] CHECK CONSTRAINT [FK_Marcacao_Marcacao]
GO
ALTER TABLE [dbo].[Marcacao]  WITH CHECK ADD  CONSTRAINT [FK_Marcacao_Servico] FOREIGN KEY([servicoID])
REFERENCES [dbo].[Servico] ([servicoID])
GO
ALTER TABLE [dbo].[Marcacao] CHECK CONSTRAINT [FK_Marcacao_Servico]
GO
ALTER TABLE [dbo].[Raca]  WITH CHECK ADD  CONSTRAINT [FK_Raca_Especie] FOREIGN KEY([especieID])
REFERENCES [dbo].[Especie] ([especieID])
GO
ALTER TABLE [dbo].[Raca] CHECK CONSTRAINT [FK_Raca_Especie]
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [CK_comportamento] CHECK  (([comportamento]='Normal' OR [comportamento]='Calmo' OR [comportamento]='Agressivo'))
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [CK_comportamento]
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [CK_sexo] CHECK  (([sexo]='F' OR [sexo]='M'))
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [CK_sexo]
GO
ALTER TABLE [dbo].[AnimalCliente]  WITH CHECK ADD  CONSTRAINT [CK_AnimalCliente] CHECK  (([estadoDono]='NaoAtivo' OR [estadoDono]='Ativo'))
GO
ALTER TABLE [dbo].[AnimalCliente] CHECK CONSTRAINT [CK_AnimalCliente]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [CK_CC] CHECK  ((len([cc])=(8)))
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [CK_CC]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [CK_CodPostal] CHECK  (([codPostal] like '[1-9][0-9][0-9][0-9][-][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [CK_CodPostal]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [CK_Email] CHECK  (([email] like '%[A-Z0-9][@][A-Z0-9]%[.][A-Z0-9]%'))
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [CK_Email]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [CK_NIF] CHECK  ((len([nif])=(9)))
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [CK_NIF]
GO
ALTER TABLE [dbo].[Clinica]  WITH CHECK ADD  CONSTRAINT [CK_ClinicaEmail] CHECK  (([email] like '%[A-Z0-9][@][A-Z0-9]%[.][A-Z0-9]%'))
GO
ALTER TABLE [dbo].[Clinica] CHECK CONSTRAINT [CK_ClinicaEmail]
GO
ALTER TABLE [dbo].[Clinica]  WITH CHECK ADD  CONSTRAINT [CK_ClinicaPostal] CHECK  (([codPostal] like '[1-9][0-9][0-9][0-9][-][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Clinica] CHECK CONSTRAINT [CK_ClinicaPostal]
GO
ALTER TABLE [dbo].[Funcionario]  WITH CHECK ADD  CONSTRAINT [CK_Funcionario] CHECK  (((datepart(year,getdate())-datepart(year,[dataDeNascimento]))>=(18)))
GO
ALTER TABLE [dbo].[Funcionario] CHECK CONSTRAINT [CK_Funcionario]
GO
ALTER TABLE [dbo].[Funcionario]  WITH CHECK ADD  CONSTRAINT [CK_FuncionarioSexo] CHECK  (([sexo]='O' OR [sexo]='F' OR [sexo]='M'))
GO
ALTER TABLE [dbo].[Funcionario] CHECK CONSTRAINT [CK_FuncionarioSexo]
GO
ALTER TABLE [dbo].[Marcacao]  WITH CHECK ADD  CONSTRAINT [CK_Hora] CHECK  (([horaFim]>[horaInicio]))
GO
ALTER TABLE [dbo].[Marcacao] CHECK CONSTRAINT [CK_Hora]
GO
ALTER TABLE [dbo].[Marcacao]  WITH CHECK ADD  CONSTRAINT [CK_MarcacaoEstado] CHECK  (([estado]='Terminada' OR [estado]='Remarcada' OR [estado]='Cancelada' OR [estado]='Confirmada'))
GO
ALTER TABLE [dbo].[Marcacao] CHECK CONSTRAINT [CK_MarcacaoEstado]
GO
ALTER TABLE [dbo].[Servico]  WITH CHECK ADD  CONSTRAINT [CK_Servico] CHECK  (([tipoServico]='Consulta' OR [tipoServico]='Exame'))
GO
ALTER TABLE [dbo].[Servico] CHECK CONSTRAINT [CK_Servico]
GO
/****** Object:  StoredProcedure [dbo].[CalcHoraFimSP]    Script Date: 14/06/2022 12:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CalcHoraFimSP]
	-- Add the parameters for the stored procedure here
	@horaInicio TIME,
	@servicoID NUMERIC,
	@marcacaoID NUMERIC
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @duracao NUMERIC, @horaFim TIME

	SELECT @duracao = duracao
	FROM Servico
	WHERE servicoID = @servicoID

	SET  @horaFim = DATEADD(MINUTE, @duracao, @horaInicio)

	UPDATE Marcacao
	SET marcacao.horaFim = @horaFim
	WHERE Marcacao.marcacaoID = @marcacaoID
END
GO
USE [master]
GO
ALTER DATABASE [clipet] SET  READ_WRITE 
GO
