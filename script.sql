USE [VacationDB]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 10/8/2020 4:57:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](225) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vacation]    Script Date: 10/8/2020 4:57:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vacation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Submission_Date] [datetime] NOT NULL,
	[Employee_Name] [nvarchar](max) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Department_id] [int] NOT NULL,
	[Date_From] [datetime] NOT NULL,
	[Date_To] [datetime] NOT NULL,
	[Returning] [datetime] NOT NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_Vacation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([ID], [Name]) VALUES (1, N'IT')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (2, N'HR')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (3, N'Production')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (4, N'Marketing ')
INSERT [dbo].[Department] ([ID], [Name]) VALUES (5, N'Accounting ')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
ALTER TABLE [dbo].[Vacation]  WITH CHECK ADD  CONSTRAINT [FK_Vacation_Department] FOREIGN KEY([Department_id])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[Vacation] CHECK CONSTRAINT [FK_Vacation_Department]
GO
/****** Object:  StoredProcedure [dbo].[spGrdManager]    Script Date: 10/8/2020 4:57:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[spGrdManager]
AS

SELECT v.[ID]
      ,v.[Submission_Date]
      ,v.[Employee_Name]
      ,v.[Date_From]
      ,v.[Date_To]
	  ,D.[Name]As DepartmentofName
  FROM [dbo].[Vacation] As V
  INNER JOIN [dbo].[Department] As D
  on v.Department_id=d.ID
GO
