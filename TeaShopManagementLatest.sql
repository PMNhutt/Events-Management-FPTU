USE [master]
GO
/****** Object:  Database [FPTEventManagement]    Script Date: 11/26/2021 12:18:15 PM ******/
CREATE DATABASE [FPTEventManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FPTEventManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FPTEventManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FPTEventManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FPTEventManagement_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FPTEventManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FPTEventManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FPTEventManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FPTEventManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FPTEventManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FPTEventManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FPTEventManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [FPTEventManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FPTEventManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FPTEventManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FPTEventManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FPTEventManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FPTEventManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FPTEventManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FPTEventManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FPTEventManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FPTEventManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FPTEventManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FPTEventManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FPTEventManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FPTEventManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FPTEventManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FPTEventManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FPTEventManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FPTEventManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [FPTEventManagement] SET  MULTI_USER 
GO
ALTER DATABASE [FPTEventManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FPTEventManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FPTEventManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FPTEventManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FPTEventManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FPTEventManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FPTEventManagement', N'ON'
GO
ALTER DATABASE [FPTEventManagement] SET QUERY_STORE = OFF
GO
USE [FPTEventManagement]
GO
/****** Object:  Table [dbo].[tblComments]    Script Date: 11/26/2021 12:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblComments](
	[commentId] [int] IDENTITY(0,1) NOT NULL,
	[userId] [nvarchar](50) NOT NULL,
	[postId] [varchar](10) NULL,
	[eventId] [int] NULL,
	[commentDatetime] [datetime] NOT NULL,
	[content] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[commentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEvents]    Script Date: 11/26/2021 12:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEvents](
	[eventId] [int] IDENTITY(0,1) NOT NULL,
	[userId] [nvarchar](50) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[locationId] [int] NOT NULL,
	[createDatetime] [datetime] NOT NULL,
	[startDate] [date] NOT NULL,
	[startSlot] [nvarchar](1) NOT NULL,
	[endSlot] [nvarchar](1) NOT NULL,
	[statusId] [nvarchar](5) NULL,
 CONSTRAINT [PK__tblEvent__2DC7BD098D178981] PRIMARY KEY CLUSTERED 
(
	[eventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFollowedEvent]    Script Date: 11/26/2021 12:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFollowedEvent](
	[userId] [nvarchar](50) NOT NULL,
	[eventId] [int] NOT NULL,
	[follow] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[eventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLocations]    Script Date: 11/26/2021 12:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLocations](
	[locationId] [int] IDENTITY(0,1) NOT NULL,
	[seat] [int] NOT NULL,
	[locationName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[locationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblParticipants]    Script Date: 11/26/2021 12:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblParticipants](
	[eventId] [int] NOT NULL,
	[userId] [nvarchar](50) NOT NULL,
	[joinStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[eventId] ASC,
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPosts]    Script Date: 11/26/2021 12:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPosts](
	[ID] [int] IDENTITY(0,1) NOT NULL,
	[postId]  AS ('P'+right(CONVERT([varchar](9),[ID]),(9))) PERSISTED NOT NULL,
	[userId] [nvarchar](50) NULL,
	[title] [nvarchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[video] [nvarchar](max) NULL,
	[createDate] [datetime] NOT NULL,
	[statusId] [nvarchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[postId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 11/26/2021 12:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleId] [nvarchar](5) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSlots]    Script Date: 11/26/2021 12:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSlots](
	[slotId] [nvarchar](1) NOT NULL,
	[startTime] [time](7) NOT NULL,
	[endTime] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[slotId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatusEvent]    Script Date: 11/26/2021 12:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatusEvent](
	[statusId] [nvarchar](5) NOT NULL,
	[statusName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[statusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatusPost]    Script Date: 11/26/2021 12:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatusPost](
	[statusId] [nvarchar](5) NOT NULL,
	[statusName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[statusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatusUser]    Script Date: 11/26/2021 12:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatusUser](
	[statusId] [nvarchar](5) NOT NULL,
	[statusName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[statusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 11/26/2021 12:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userId] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[statusId] [nvarchar](5) NULL,
	[roleId] [nvarchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblEvents] ON 

INSERT [dbo].[tblEvents] ([eventId], [userId], [title], [description], [locationId], [createDatetime], [startDate], [startSlot], [endSlot], [statusId]) VALUES (42, N'110615623873739905848', N'Career Talk: Cơ hội thực tập tại FPT Software dành cho sinh viên ĐH FPT', N'<p><img class="aligncenter wp-image-41406 " style="box-sizing: border-box; border: 0px; vertical-align: middle; height: auto; max-width: 100%; clear: both; display: block; margin-left: auto; margin-right: auto;" src="https://daihoc.fpt.edu.vn/media/2021/08/220983180_4165780560175425_2356631793386617119_n-910x535.png" sizes="(max-width: 700px) 100vw, 700px" srcset="https://daihoc.fpt.edu.vn/media/2021/08/220983180_4165780560175425_2356631793386617119_n-910x535.png 910w, https://daihoc.fpt.edu.vn/media/2021/08/220983180_4165780560175425_2356631793386617119_n-553x325.png 553w, https://daihoc.fpt.edu.vn/media/2021/08/220983180_4165780560175425_2356631793386617119_n-768x451.png 768w, https://daihoc.fpt.edu.vn/media/2021/08/220983180_4165780560175425_2356631793386617119_n-275x160.png 275w, https://daihoc.fpt.edu.vn/media/2021/08/220983180_4165780560175425_2356631793386617119_n.png 1004w" alt="" width="700" height="411" loading="lazy" /></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">Với sự xuất hiện của c&aacute;c kh&aacute;ch mời &ndash; những người đang trực tiếp l&agrave;m việc tại F-Soft sẽ mang đến cho bạn một c&aacute;i nh&igrave;n ch&acirc;n thực nhất về văn h&oacute;a, kỹ năng l&agrave;m việc, những yếu tố cần thiết khi thực tập tại F-Soft<br style="box-sizing: border-box;" />Ms Hồng Li&ecirc;n: Quản l&yacute; chương tr&igrave;nh thực tập &ndash; FPT Software<br style="box-sizing: border-box;" />Mr Minh Chuy&ecirc;n: Chuy&ecirc;n vi&ecirc;n chương tr&igrave;nh thực tập &ndash; FPT Software</p>
<p>&nbsp;</p>', 2, CAST(N'2021-11-22T00:00:00.000' AS DateTime), CAST(N'2021-11-27' AS Date), N'1', N'3', N'P')
INSERT [dbo].[tblEvents] ([eventId], [userId], [title], [description], [locationId], [createDatetime], [startDate], [startSlot], [endSlot], [statusId]) VALUES (43, N'110615623873739905848', N'Talkshow: Bí quyết giải toả căng thẳng giữa đại dịch Covid-19', N'<p>Sự thay đổi lớn nhất ảnh hưởng đến gen Z bao gồm việc mất đi khả năng thiết lập c&aacute;c mối quan hệ bạn b&egrave;, gia đ&igrave;nh v&agrave; x&atilde; hội, &aacute;p lực từ việc học, kh&ocirc;ng được đến trường v&agrave; tham gia v&agrave;o c&aacute;c hoạt động sở th&iacute;ch hằng ng&agrave;y. Đắm ch&igrave;m trong stress thật sự ảnh hưởng rất ti&ecirc;u cực đến sức khỏe t&acirc;m tr&iacute; v&agrave; ảnh hưởng từ n&oacute; mỗi ng&agrave;y đều lớn dần. Ch&iacute;nh v&igrave; thế, để chọn ra cho bản th&acirc;n m&igrave;nh những giải ph&aacute;p đ&uacute;ng đắn, t&igrave;m lại điểm c&acirc;n bằng v&igrave; một t&acirc;m tr&iacute; khỏe mạnh giữa đại dịch l&agrave; rất cần thiết.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;"><img class="aligncenter wp-image-41397 " style="box-sizing: border-box; border: 0px; vertical-align: middle; height: auto; max-width: 100%; clear: both; display: block; margin-left: auto; margin-right: auto;" src="https://daihoc.fpt.edu.vn/media/2021/08/219198130_3976129245843371_6938264863992336337_n-910x1138.jpeg" sizes="(max-width: 700px) 100vw, 700px" srcset="https://daihoc.fpt.edu.vn/media/2021/08/219198130_3976129245843371_6938264863992336337_n-910x1138.jpeg 910w, https://daihoc.fpt.edu.vn/media/2021/08/219198130_3976129245843371_6938264863992336337_n-260x325.jpeg 260w, https://daihoc.fpt.edu.vn/media/2021/08/219198130_3976129245843371_6938264863992336337_n-768x960.jpeg 768w, https://daihoc.fpt.edu.vn/media/2021/08/219198130_3976129245843371_6938264863992336337_n.jpeg 1200w" alt="" width="700" height="875" loading="lazy" /><br style="box-sizing: border-box;" />Lần n&agrave;y, Trường Đại học FPT TPHCM xin h&acirc;n hạnh ch&agrave;o đ&oacute;n hai vị kh&aacute;ch mời đến với một talkshow mang t&ecirc;n: &ldquo;COVID STRESS: L&Agrave;M G&Igrave; B&Acirc;Y GIỜ?&rdquo;</p>
<p>&nbsp;</p>', 0, CAST(N'2021-11-22T00:00:00.000' AS DateTime), CAST(N'2021-11-27' AS Date), N'4', N'5', N'P')
INSERT [dbo].[tblEvents] ([eventId], [userId], [title], [description], [locationId], [createDatetime], [startDate], [startSlot], [endSlot], [statusId]) VALUES (44, N'110615623873739905848', N'Chính thức khởi động cuộc thi The Speech Contest Online F-talks', N'<p>F-Talk &ndash; Ideas worth spreading l&agrave; cuộc thi n&oacute;i tiếng Anh d&agrave;nh ri&ecirc;ng cho sinh vi&ecirc;n Đại học FPT HCM với tổng gi&aacute; trị giải thưởng l&ecirc;n đến hơn 4 triệu đồng. Đ&acirc;y l&agrave; s&acirc;n chơi bổ &iacute;ch, tạo cơ hội cho c&aacute;c bạn sinh vi&ecirc;n trau dồi kiến thức ng&ocirc;n từ, đồng thời cũng thể hiện những g&oacute;c nh&igrave;n đa chiều về chủ đề ban tổ chức đưa ra.</p>
<div class="kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q" style="box-sizing: border-box; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">
<div dir="auto" style="box-sizing: border-box;"><img class="aligncenter wp-image-41393 " style="box-sizing: border-box; border: 0px; vertical-align: middle; height: auto; max-width: 100%; clear: both; display: block; margin-left: auto; margin-right: auto;" src="https://daihoc.fpt.edu.vn/media/2021/08/224149054_4177572188996262_4722233163054989543_n-910x1137.jpeg" sizes="(max-width: 700px) 100vw, 700px" srcset="https://daihoc.fpt.edu.vn/media/2021/08/224149054_4177572188996262_4722233163054989543_n-910x1137.jpeg 910w, https://daihoc.fpt.edu.vn/media/2021/08/224149054_4177572188996262_4722233163054989543_n-260x325.jpeg 260w, https://daihoc.fpt.edu.vn/media/2021/08/224149054_4177572188996262_4722233163054989543_n-768x960.jpeg 768w, https://daihoc.fpt.edu.vn/media/2021/08/224149054_4177572188996262_4722233163054989543_n.jpeg 1639w" alt="" width="700" height="875" loading="lazy" /></div>
</div>
<div class="o9v6fnle cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q" style="box-sizing: border-box; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">
<div dir="auto" style="box-sizing: border-box;">&nbsp;</div>
<div dir="auto" style="box-sizing: border-box;"><span style="box-sizing: border-box; font-weight: bold;">Đối tượng dự thi:</span></div>
<div dir="auto" style="box-sizing: border-box;">D&agrave;nh ri&ecirc;ng cho sinh vi&ecirc;n Đại học FPT HCM</div>
</div>
<p>&nbsp;</p>', 0, CAST(N'2021-11-22T00:00:00.000' AS DateTime), CAST(N'2021-11-27' AS Date), N'4', N'5', N'P')
INSERT [dbo].[tblEvents] ([eventId], [userId], [title], [description], [locationId], [createDatetime], [startDate], [startSlot], [endSlot], [statusId]) VALUES (45, N'110615623873739905848', N'Talkshow: Khởi nghiệp cùng Alumni ĐH FPT', N'<p>Cơ hội n&agrave;o để khởi nghiệp m&ugrave;a dịch.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">Talkshow &ldquo;KHỞI NGHIỆP C&Ugrave;NG ALUMNI FPT&rdquo; c&oacute; sự tham gia của kh&aacute;ch mời đặc biệt: Anh B&ugrave;i Ngọc Viễn, cựu sinh vi&ecirc;n Đại học FPT kho&aacute; 4. Anh l&agrave; Director of Engineering tại Quantalytix (Mỹ), Co-founder &amp; CEO tại Innochee JSC v&agrave; từng Full-stack web developer tại ASTO System.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;"><img class="aligncenter wp-image-41056 size-full" style="box-sizing: border-box; border: 0px; vertical-align: middle; height: auto; max-width: 100%; clear: both; display: block; margin-left: auto; margin-right: auto;" src="https://daihoc.fpt.edu.vn/media/2021/07/217394128_3944747685648194_4983168552260266336_n.jpeg" alt="" width="768" height="960" loading="lazy" /></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">C&oacute;c quận Nine kh&ocirc;ng muốn bỏ lỡ cơ hội c&oacute; 1-0-2 n&agrave;y, th&igrave; h&atilde;y nhanh nhanh &ldquo;đặt lịch hẹn&rdquo; tham gia chương tr&igrave;nh ngay nh&eacute;!</p>
<p>&nbsp;</p>', 0, CAST(N'2021-11-22T00:00:00.000' AS DateTime), CAST(N'2021-11-27' AS Date), N'5', N'6', N'P')
INSERT [dbo].[tblEvents] ([eventId], [userId], [title], [description], [locationId], [createDatetime], [startDate], [startSlot], [endSlot], [statusId]) VALUES (46, N'110615623873739905848', N'Khởi động cuộc thi tranh biện tiếng Anh online FPTU Debate Tournament 2021', N'<p>FPTU Debate Tournament (FDT) l&agrave; cuộc thi tranh biện tiếng Anh online d&agrave;nh ri&ecirc;ng cho sinh vi&ecirc;n Đại học FPT TP.HCM với tổng giải thưởng l&ecirc;n đến 14.000.000 VNĐ. Đ&acirc;y l&agrave; s&acirc;n chơi cho c&aacute;c bạn sinh vi&ecirc;n c&oacute; cơ hội tranh biện, thể hiện những g&oacute;c nh&igrave;n đa chiều về c&aacute;c chủ đề n&oacute;ng hổi trong đời sống.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;"><img class="aligncenter wp-image-40313 " style="box-sizing: border-box; border: 0px; vertical-align: middle; height: auto; max-width: 100%; clear: both; display: block; margin-left: auto; margin-right: auto;" src="https://daihoc.fpt.edu.vn/media/2021/06/197082920_3827887670667530_3328912736035988685_n-910x1138.jpeg" sizes="(max-width: 700px) 100vw, 700px" srcset="https://daihoc.fpt.edu.vn/media/2021/06/197082920_3827887670667530_3328912736035988685_n-910x1138.jpeg 910w, https://daihoc.fpt.edu.vn/media/2021/06/197082920_3827887670667530_3328912736035988685_n-260x325.jpeg 260w, https://daihoc.fpt.edu.vn/media/2021/06/197082920_3827887670667530_3328912736035988685_n-768x960.jpeg 768w, https://daihoc.fpt.edu.vn/media/2021/06/197082920_3827887670667530_3328912736035988685_n.jpeg 1200w" alt="" width="700" height="875" loading="lazy" /></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;"><span style="box-sizing: border-box; font-weight: bold;">Đối tượng dự thi:</span><br style="box-sizing: border-box;" />D&agrave;nh ri&ecirc;ng cho sinh vi&ecirc;n ĐH FPT TP.HCM.</p>
<p>"&gt;</p>', 0, CAST(N'2021-11-22T00:00:00.000' AS DateTime), CAST(N'2021-11-29' AS Date), N'1', N'2', N'P')
INSERT [dbo].[tblEvents] ([eventId], [userId], [title], [description], [locationId], [createDatetime], [startDate], [startSlot], [endSlot], [statusId]) VALUES (47, N'110615623873739905848', N'Cuộc thi sáng tạo Logo, rinh giải thưởng lớn dành cho sinh viên ĐH FPT', N'<p><span style="box-sizing: border-box; font-weight: bold;"><em style="box-sizing: border-box;">Cuộc thi s&aacute;ng tạo logo kỷ niệm 15 năm th&agrave;nh lập ĐH FPT với t&ecirc;n gọi &ldquo;Logo hay, 10 triệu về tay&rdquo; đ&atilde; ch&iacute;nh thức khởi động với tổng giải thưởng l&ecirc;n tới 10 triệu đồng. Đặc biệt, đ&acirc;y l&agrave; lần đầu ti&ecirc;n cuộc thi được tổ chức với quy m&ocirc; to&agrave;n Tổ chức Gi&aacute;o dục FPT.</em></span></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;"><img src="https://daihoc.fpt.edu.vn/media/2021/06/Anh-2-Bai-1-thiet-ke-logo-15-nam-FPTU-v1.1-910x910.png" width="517" height="517" /></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">&ldquo;Logo hay, 10 triệu về tay&rdquo; l&agrave; cuộc thi s&aacute;ng tạo logo nằm trong chuỗi sự kiện kỷ niệm 15 năm th&agrave;nh lập Trường Đại học FPT. Đ&acirc;y l&agrave; s&acirc;n chơi kết nối c&aacute;c đối tượng l&agrave; học sinh, sinh vi&ecirc;n đ&atilde; v&agrave; đang theo học tại c&aacute;c hệ đ&agrave;o tạo thuộc Tổ chức Gi&aacute;o dục FPT tr&ecirc;n to&agrave;n quốc. B&ecirc;n cạnh c&aacute;c hạng mục giải thưởng lớn với tổng gi&aacute; trị l&ecirc;n tới 10,000,000 VNĐ, cuộc thi cũng l&agrave; cơ hội để mỗi th&iacute; sinh ph&aacute;t huy khả năng s&aacute;ng tạo trong lĩnh vực thiết kế, tinh thần &ldquo;l&agrave;m kh&aacute;c để l&agrave;m tốt&rdquo; tạo ra những biểu trưng độc đ&aacute;o v&agrave; c&oacute; t&iacute;nh ứng dụng cao.</p>
<p>"&gt;</p>', 0, CAST(N'2021-11-22T00:00:00.000' AS DateTime), CAST(N'2021-11-30' AS Date), N'1', N'6', N'P')
INSERT [dbo].[tblEvents] ([eventId], [userId], [title], [description], [locationId], [createDatetime], [startDate], [startSlot], [endSlot], [statusId]) VALUES (48, N'110615623873739905848', N'Cuộc thi ảnh “Cô Vy xưa – Cô Vy nay” đình đám Ao làng đã khởi động', N'<p>&ldquo;C&ocirc; Vy xưa &ndash; C&ocirc; Vy nay&rdquo;<span style="box-sizing: border-box; font-weight: bold;">&nbsp;l&agrave; cuộc thi ảnh do b&aacute;o C&oacute;c Đọc v&agrave; Những người bạn tổ chức d&agrave;nh cho HSSV, CBGV to&agrave;n FPT Edu. Th&ocirc;ng qua việc khuyến kh&iacute;ch người dự thi</span>&nbsp;<span style="box-sizing: border-box; font-weight: bold;">chụp những bức ảnh thể hiện thay đổi t&iacute;ch cực của bản th&acirc;n sau 2 m&ugrave;a &ldquo;C&ocirc; Vy&rdquo;, cuộc thi muốn cổ vũ mọi người chủ động, t&iacute;ch cực chống dịch. &ldquo;C&ocirc; Vy xưa &ndash; C&ocirc; Vy nay&rdquo; ch&iacute;nh thức mở cổng đăng k&yacute; từ ng&agrave;y 3/6 đến hết 6/7.</span></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: justify;">Lấy cảm hứng từ challenge &ldquo;How much do you change?&rdquo; nổi tiếng tr&ecirc;n mạng x&atilde; hội Facebook thời gian qua, C&oacute;c Đọc v&agrave; Những người bạn đ&atilde; quyết định tổ chức cuộc thi ảnh &ldquo;C&ocirc; Vy xưa &ndash; C&ocirc; Vy nay&rdquo; để c&ugrave;ng độc giả nh&igrave;n lại gần 2 năm qua, ch&uacute;ng ta đ&atilde; c&oacute; những thay đổi t&iacute;ch cực như thế n&agrave;o để c&ugrave;ng nhau đo&agrave;n kết trong cuộc chiến chống đại dịch Covid &ndash; 19.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: justify;">&ldquo;C&ocirc; Vy xưa &ndash; C&ocirc; Vy nay&rdquo; hứa hẹn sẽ l&agrave; một cuộc thi mang đến nhiều &yacute; nghĩa v&agrave; th&uacute; vị d&agrave;nh cho HSSV, CBGV FPT Edu.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;"><img class="aligncenter wp-image-40223 " style="box-sizing: border-box; border: 0px; vertical-align: middle; height: auto; max-width: 100%; clear: both; display: block; margin-left: auto; margin-right: auto;" src="https://daihoc.fpt.edu.vn/media/2021/06/Poster_Covy-xua-nay-v1-910x1155.jpg" sizes="(max-width: 700px) 100vw, 700px" srcset="https://daihoc.fpt.edu.vn/media/2021/06/Poster_Covy-xua-nay-v1-910x1155.jpg 910w, https://daihoc.fpt.edu.vn/media/2021/06/Poster_Covy-xua-nay-v1-256x325.jpg 256w, https://daihoc.fpt.edu.vn/media/2021/06/Poster_Covy-xua-nay-v1-768x975.jpg 768w, https://daihoc.fpt.edu.vn/media/2021/06/Poster_Covy-xua-nay-v1.jpg 1201w" alt="" width="700" height="888" loading="lazy" /></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: justify;"><span style="box-sizing: border-box; font-weight: bold;">&ndash; Đối tượng tham gia:</span></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: justify;">Tất cả HSSV, CBGV đang học tập v&agrave; l&agrave;m việc tại c&aacute;c trường thuộc FPT Edu tr&ecirc;n to&agrave;n quốc.</p>
<p>&nbsp;</p>', 0, CAST(N'2021-11-22T00:00:00.000' AS DateTime), CAST(N'2021-12-01' AS Date), N'1', N'3', N'P')
INSERT [dbo].[tblEvents] ([eventId], [userId], [title], [description], [locationId], [createDatetime], [startDate], [startSlot], [endSlot], [statusId]) VALUES (49, N'110615623873739905848', N'Giao lưu và học hỏi kinh nghiệm làm phim cùng đoàn làm phim KIỀU', N'<p><span style="box-sizing: border-box; font-weight: bold;"><em style="box-sizing: border-box;">B&ecirc;n cạnh những chia sẻ của đo&agrave;n l&agrave;m phim KIỀU về qu&aacute; tr&igrave;nh sản xuất, c&aacute;c kỹ thuật l&agrave;m phim ti&ecirc;n tiến nhất hiện nay, c&aacute;c C&oacute;c cũng sẽ được học hỏi th&ecirc;m kinh nghiệm quảng b&aacute; bộ phim đến từ c&aacute;c nh&agrave; b&aacute;o, chuy&ecirc;n vi&ecirc;n truyền th&ocirc;ng c&oacute; tay nghề l&acirc;u năm.</em></span></p>
<div dir="auto" style="box-sizing: border-box;">&nbsp;</div>
<div dir="auto" style="box-sizing: border-box;"><img src="https://daihoc.fpt.edu.vn/media/2021/04/166357747_223935906194676_4325291535993486490_n.jpeg" width="500" height="667" /></div>
<div dir="auto" style="box-sizing: border-box;">Chương tr&igrave;nh d&agrave;nh cho c&aacute;c bạn y&ecirc;u th&iacute;ch với lĩnh vực truyền th&ocirc;ng, điện ảnh c&oacute; lồng gh&eacute;p những gi&aacute; trị văn học trong l&agrave;m phim hiện đại. Th&ocirc;ng qua chương tr&igrave;nh giao lưu với đo&agrave;n l&agrave;m phim Kiều sẽ gi&uacute;p cho c&aacute;c SV FPT hiểu r&otilde; hơn về quy tr&igrave;nh sản xuất phim, c&aacute;c kỹ thuật l&agrave;m phim ti&ecirc;n tiến nhất cũng như về kỷ niệm, kh&oacute; khăn trong suốt qu&aacute; tr&igrave;nh l&agrave;m phim.</div>
<p>&nbsp;</p>', 0, CAST(N'2021-11-22T00:00:00.000' AS DateTime), CAST(N'2021-12-01' AS Date), N'1', N'4', N'P')
INSERT [dbo].[tblEvents] ([eventId], [userId], [title], [description], [locationId], [createDatetime], [startDate], [startSlot], [endSlot], [statusId]) VALUES (50, N'110615623873739905848', N'Talkshow: Bí quyết làm MV từ con số 0', N'<p>Có những khó khăn gì đang chờ đợi, những bộ phận nào trong ekip của một MV.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">Truyền thông MV như thế nào cho hiệu quả</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">Chỉ là một sinh viên với đam mê và không có nhiều kinh phí trong tay có thể sản xuất được một MV không?</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">Cùng lắng nghe chia sẻ những bí quyết để cho ra đời những sản phẩm âm nhạc từ con số 0 cùng ekip sản xuất MV &ldquo;Sau 30 &ndash; A.C Xuân Tài x Mina Phan x Duy Andy&rdquo; &ndash; sản phẩm được quay tại ĐH FPT, giao lưu cùng các nghệ sĩ khách mời và nhận những phần quà may mắn từ Talk Show &ldquo;Bí Quyết Làm MV Từ Con Số 0&rdquo; nhé!</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: center;"><img class="alignnone size-full wp-image-38818" style="box-sizing: border-box; border: 0px; vertical-align: middle; height: auto; max-width: 100%;" src="https://daihoc.fpt.edu.vn/media/2021/03/162485394_3607454256044207_3221978153451020515_n.jpeg" sizes="(max-width: 768px) 100vw, 768px" srcset="https://daihoc.fpt.edu.vn/media/2021/03/162485394_3607454256044207_3221978153451020515_n.jpeg 768w, https://daihoc.fpt.edu.vn/media/2021/03/162485394_3607454256044207_3221978153451020515_n-260x325.jpeg 260w" alt="" width="768" height="960" loading="lazy" /></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">Địa điểm: Ph&ograve;ng Seminar, Trường ĐH FPT TP.HCM</p>
<p>&nbsp;</p>', 0, CAST(N'2021-11-22T00:00:00.000' AS DateTime), CAST(N'2021-12-02' AS Date), N'1', N'2', N'P')
INSERT [dbo].[tblEvents] ([eventId], [userId], [title], [description], [locationId], [createDatetime], [startDate], [startSlot], [endSlot], [statusId]) VALUES (51, N'110615623873739905848', N'Hội thảo “Clean Code”', N'<div dir="auto" style="box-sizing: border-box;">Bạn đ&atilde; bao giờ tưởng tượng một c&ocirc;ng ty c&ocirc;ng nghệ sẽ vận h&agrave;nh như thế n&agrave;o? Bạn thắc mắc một sinh vi&ecirc;n ng&agrave;nh C&ocirc;ng nghệ th&ocirc;ng tin n&oacute;i chung v&agrave; Kỹ thuật phần mềm n&oacute;i ri&ecirc;ng sẽ l&agrave;m những c&ocirc;ng việc g&igrave; tại một c&ocirc;ng ty c&ocirc;ng nghệ quốc tế?</div>
<div class="o9v6fnle cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q" style="box-sizing: border-box; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">
<div dir="auto" style="box-sizing: border-box;">Để t&igrave;m ra c&acirc;u trả lời, h&atilde;y c&ugrave;ng tham gia ngay hội thảo &ldquo;CLEAN CODE&rdquo; nh&eacute;! Đặc biệt, c&aacute;c FPTer c&ograve;n được giao lưu với chuy&ecirc;n gia trong lĩnh vực l&agrave; anh L&ecirc; Quốc Huy v&agrave; Lưu Ho&agrave;ng Long (Cựu sinh vi&ecirc;n K4 &ndash; Đại học FPT), cả hai đều đang l&agrave;m việc c&ocirc;ng ty Netcompany.</div>
<div dir="auto" style="box-sizing: border-box; text-align: center;"><img class="alignnone size-large wp-image-38841" style="box-sizing: border-box; border: 0px; vertical-align: middle; height: auto; max-width: 100%;" src="https://daihoc.fpt.edu.vn/media/2021/03/164406225_3616398908483075_6477537758606211879_o-910x413.png" sizes="(max-width: 910px) 100vw, 910px" srcset="https://daihoc.fpt.edu.vn/media/2021/03/164406225_3616398908483075_6477537758606211879_o-910x413.png 910w, https://daihoc.fpt.edu.vn/media/2021/03/164406225_3616398908483075_6477537758606211879_o-588x267.png 588w, https://daihoc.fpt.edu.vn/media/2021/03/164406225_3616398908483075_6477537758606211879_o-768x349.png 768w, https://daihoc.fpt.edu.vn/media/2021/03/164406225_3616398908483075_6477537758606211879_o.png 1280w" alt="" width="910" height="413" loading="lazy" /></div>
</div>
<p>&nbsp;</p>', 2, CAST(N'2021-11-22T00:00:00.000' AS DateTime), CAST(N'2021-12-02' AS Date), N'1', N'2', N'P')
INSERT [dbo].[tblEvents] ([eventId], [userId], [title], [description], [locationId], [createDatetime], [startDate], [startSlot], [endSlot], [statusId]) VALUES (52, N'110615623873739905848', N'Talkshow “Linh hồn truyện tranh” cùng họa sĩ Phan Vũ Linh', N'<p><em style="box-sizing: border-box;">Kh&ocirc;ng chỉ xuất hiện với vai tr&ograve; l&agrave; gi&aacute;m khảo kh&aacute;ch mời của cuộc thi F-Comic Universe 2021, họa sĩ Phan Vũ Linh sẽ c&ograve;n l&agrave; diễn giả của &ldquo;Linh hồn truyện tranh&rdquo; &ndash; một talkshow đầy gi&aacute; trị tại ĐH FPT TP.HCM, đem đến cho to&agrave;n thể sinh vi&ecirc;n cơ hội tiếp nhận kiến thức, kỹ năng hữu &iacute;ch về thiết kế, s&aacute;ng tạo nh&acirc;n vật v&agrave; vẽ truyện tranh.</em></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;"><img class="aligncenter wp-image-38490 " style="box-sizing: border-box; border: 0px; vertical-align: middle; height: auto; max-width: 100%; clear: both; display: block; margin-left: auto; margin-right: auto;" src="https://daihoc.fpt.edu.vn/media/2021/03/156317863_1825259060963859_1922004533222039087_o-910x1138.jpg" sizes="(max-width: 700px) 100vw, 700px" srcset="https://daihoc.fpt.edu.vn/media/2021/03/156317863_1825259060963859_1922004533222039087_o-910x1138.jpg 910w, https://daihoc.fpt.edu.vn/media/2021/03/156317863_1825259060963859_1922004533222039087_o-260x325.jpg 260w, https://daihoc.fpt.edu.vn/media/2021/03/156317863_1825259060963859_1922004533222039087_o-768x960.jpg 768w, https://daihoc.fpt.edu.vn/media/2021/03/156317863_1825259060963859_1922004533222039087_o.jpg 1200w" alt="" width="700" height="875" loading="lazy" /></p>
<p>&nbsp;</p>', 0, CAST(N'2021-11-23T00:00:00.000' AS DateTime), CAST(N'2021-12-14' AS Date), N'1', N'3', N'P')
INSERT [dbo].[tblEvents] ([eventId], [userId], [title], [description], [locationId], [createDatetime], [startDate], [startSlot], [endSlot], [statusId]) VALUES (53, N'110615623873739905848', N'Lễ tôn vinh FPTU Student Award 2020 mang concept mới', N'<p><span style="box-sizing: border-box; font-weight: bold;"><em style="box-sizing: border-box;">Kết th&uacute;c 2 k&igrave; cuối c&ugrave;ng của năm 2020, ch&uacute;ng ta giờ đ&acirc;y lại c&oacute; cơ hội được gặp nhau tại sự kiện m&agrave; tất cả c&aacute;c C&oacute;c FPTU đều mong chờ &ndash; Lễ T&ocirc;n Vinh Học kỳ Summer v&agrave; Học kỳ Fall 2020 diễn ra ng&agrave;y 27.1.2021 tại trường Đại học FPT H&agrave; Nội.</em></span></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;"><img class="aligncenter wp-image-37984 " style="box-sizing: border-box; border: 0px; vertical-align: middle; height: auto; max-width: 100%; clear: both; display: block; margin-left: auto; margin-right: auto;" src="https://daihoc.fpt.edu.vn/media/2021/01/139982313_3641091035977716_145035835591651789_o-910x1333.jpg" sizes="(max-width: 700px) 100vw, 700px" srcset="https://daihoc.fpt.edu.vn/media/2021/01/139982313_3641091035977716_145035835591651789_o-910x1333.jpg 910w, https://daihoc.fpt.edu.vn/media/2021/01/139982313_3641091035977716_145035835591651789_o-222x325.jpg 222w, https://daihoc.fpt.edu.vn/media/2021/01/139982313_3641091035977716_145035835591651789_o-768x1125.jpg 768w, https://daihoc.fpt.edu.vn/media/2021/01/139982313_3641091035977716_145035835591651789_o.jpg 1398w" alt="" width="700" height="1025" loading="lazy" /><br style="box-sizing: border-box;" />Lần n&agrave;y, Lễ T&ocirc;n Vinh 2020 sẽ l&agrave; một kh&ocirc;ng kh&iacute; ho&agrave;n to&agrave;n mới mẻ, mang một concept đầy sang trọng v&agrave; thanh lịch, c&aacute;c bạn sinh vi&ecirc;n kh&ocirc;ng n&ecirc;n bỏ lỡ trải nghiệm c&oacute; một kh&ocirc;ng hai n&agrave;y.</p>
<p>&nbsp;</p>', 3, CAST(N'2021-11-23T00:00:00.000' AS DateTime), CAST(N'2021-12-08' AS Date), N'1', N'6', N'P')
INSERT [dbo].[tblEvents] ([eventId], [userId], [title], [description], [locationId], [createDatetime], [startDate], [startSlot], [endSlot], [statusId]) VALUES (78, N'110615623873739905848', N'Đêm nhạc Fantasia, sưởi ấm mùa đông', N'<p>Sau một thời gian vắng b&oacute;ng, đ&ecirc;m nhạc mang t&ecirc;n FANTASIA đ&aacute;nh dấu sự trở lại của CLB &Acirc;m nhạc Đại học FPT sắp được tổ chức hứa hẹn mang đến nhiều cung bậc cảm x&uacute;c cho người nghe, sưởi ấm tối H&agrave; Nội m&ugrave;a đ&ocirc;ng lạnh gi&oacute;.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">Cuộc đời của mỗi con người ch&uacute;ng ta như l&agrave; một kh&uacute;c nhạc vậy. Trong đ&oacute; sẽ c&oacute; những giai điệu, &acirc;m hưởng v&agrave; cung bậc cao thấp mang những quy luật kh&aacute;c nhau. Với tuổi trẻ, kh&uacute;c nhạc đ&oacute; lại kh&ocirc;ng c&oacute; một quy luật n&agrave;o hết. Như một kh&uacute;c nhạc ph&oacute;ng t&uacute;ng &ndash; ch&uacute;ng ta tự m&igrave;nh viết n&ecirc;n những giai điệu thật ri&ecirc;ng chứa đầy m&agrave;u sắc.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;"><img class="aligncenter wp-image-37355 " style="box-sizing: border-box; border: 0px; vertical-align: middle; height: auto; max-width: 100%; clear: both; display: block; margin-left: auto; margin-right: auto;" src="https://daihoc.fpt.edu.vn/media/2020/12/130258801_3893506974014207_8164874139453159196_o-910x910.jpg" sizes="(max-width: 701px) 100vw, 701px" srcset="https://daihoc.fpt.edu.vn/media/2020/12/130258801_3893506974014207_8164874139453159196_o-910x910.jpg 910w, https://daihoc.fpt.edu.vn/media/2020/12/130258801_3893506974014207_8164874139453159196_o-325x325.jpg 325w, https://daihoc.fpt.edu.vn/media/2020/12/130258801_3893506974014207_8164874139453159196_o-768x768.jpg 768w, https://daihoc.fpt.edu.vn/media/2020/12/130258801_3893506974014207_8164874139453159196_o-60x60.jpg 60w, https://daihoc.fpt.edu.vn/media/2020/12/130258801_3893506974014207_8164874139453159196_o.jpg 1920w" alt="" width="701" height="701" loading="lazy" /></p>
<p>&nbsp;</p>
<p>"&gt;</p>
<p>"&gt;</p>
<p>"&gt;</p>', 2, CAST(N'2021-11-24T00:00:00.000' AS DateTime), CAST(N'2021-12-15' AS Date), N'1', N'3', N'P')
SET IDENTITY_INSERT [dbo].[tblEvents] OFF
GO
INSERT [dbo].[tblFollowedEvent] ([userId], [eventId], [follow]) VALUES (N'102972386328363391378', 42, 0)
INSERT [dbo].[tblFollowedEvent] ([userId], [eventId], [follow]) VALUES (N'102972386328363391378', 44, 0)
INSERT [dbo].[tblFollowedEvent] ([userId], [eventId], [follow]) VALUES (N'102972386328363391378', 46, 0)
INSERT [dbo].[tblFollowedEvent] ([userId], [eventId], [follow]) VALUES (N'102972386328363391378', 47, 0)
INSERT [dbo].[tblFollowedEvent] ([userId], [eventId], [follow]) VALUES (N'110615623873739905848', 45, 0)
GO
SET IDENTITY_INSERT [dbo].[tblLocations] ON 

INSERT [dbo].[tblLocations] ([locationId], [seat], [locationName]) VALUES (0, 50, N'Thư viện tầng 1')
INSERT [dbo].[tblLocations] ([locationId], [seat], [locationName]) VALUES (1, 50, N'Thư viện tầng 2')
INSERT [dbo].[tblLocations] ([locationId], [seat], [locationName]) VALUES (2, 50, N'Thư viện tầng 3')
INSERT [dbo].[tblLocations] ([locationId], [seat], [locationName]) VALUES (3, 50, N'Thư viện tầng 4')
SET IDENTITY_INSERT [dbo].[tblLocations] OFF
GO
INSERT [dbo].[tblParticipants] ([eventId], [userId], [joinStatus]) VALUES (42, N'102972386328363391378', 1)
INSERT [dbo].[tblParticipants] ([eventId], [userId], [joinStatus]) VALUES (43, N'110615623873739905848', 1)
INSERT [dbo].[tblParticipants] ([eventId], [userId], [joinStatus]) VALUES (44, N'102972386328363391378', 1)
INSERT [dbo].[tblParticipants] ([eventId], [userId], [joinStatus]) VALUES (45, N'110615623873739905848', 0)
GO
SET IDENTITY_INSERT [dbo].[tblPosts] ON 

INSERT [dbo].[tblPosts] ([ID], [userId], [title], [content], [video], [createDate], [statusId]) VALUES (0, N'102340646113497938153', N'PT IS delivers Vietnam Electricity solutions', N'<p dir="ltr" style="margin: 10px 0px; padding: 0px; outline: 0px; box-sizing: border-box; font-family: Arial, ''Helvetica Neue'', Helvetica, sans-serif; line-height: 26px; color: #636363; font-size: 14px; background-color: #ffffff;"><span style="margin: 0px; padding: 0px; outline: 0px; box-sizing: border-box; font-size: 12px;"><span style="margin: 0px; padding: 0px; outline: 0px; box-sizing: border-box; font-family: arial, helvetica, sans-serif;"><span style="margin: 0px; padding: 0px; outline: 0px; box-sizing: border-box; background-color: transparent; color: #000000;">The Electricity and Information Technology Company of Vietnam National Electricity Group (EVN) and FPT IS ERP have just signed the agreement "Provide solutions to build application platform architecture for software development."&nbsp;</span></span></span></p>
<p dir="ltr" style="margin: 10px 0px; padding: 0px; outline: 0px; box-sizing: border-box; font-family: Arial, ''Helvetica Neue'', Helvetica, sans-serif; line-height: 26px; color: #636363; font-size: 14px; background-color: #ffffff;"><span style="margin: 0px; padding: 0px; outline: 0px; box-sizing: border-box; font-size: 12px;"><span style="margin: 0px; padding: 0px; outline: 0px; box-sizing: border-box; font-family: arial, helvetica, sans-serif;"><span style="margin: 0px; padding: 0px; outline: 0px; box-sizing: border-box; background-color: transparent; color: #000000;">Accordingly, FPT IS ERP will provide EVN ICT with synchronous services, including architecture foundations, technology for production, deployment, and operational software for the move towards the cloud platform, software development, and organizational model.&nbsp;</span></span></span></p>
<p dir="ltr" style="margin: 10px 0px; padding: 0px; outline: 0px; box-sizing: border-box; font-family: Arial, ''Helvetica Neue'', Helvetica, sans-serif; line-height: 26px; color: #636363; font-size: 14px; background-color: #ffffff;"><span style="margin: 0px; padding: 0px; outline: 0px; box-sizing: border-box; font-size: 12px;"><span style="margin: 0px; padding: 0px; outline: 0px; box-sizing: border-box; font-family: arial, helvetica, sans-serif;"><span style="margin: 0px; padding: 0px; outline: 0px; box-sizing: border-box; background-color: transparent; color: #000000;">Furthermore, the system also offers the customer simultaneous training and technology transfer - from managers, architects of the solution, business analysts, technical team leaders, programmers, etc.&nbsp;</span></span></span></p>
<p dir="ltr" style="margin: 10px 0px; padding: 0px; outline: 0px; box-sizing: border-box; font-family: Arial, ''Helvetica Neue'', Helvetica, sans-serif; line-height: 26px; color: #636363; font-size: 14px; background-color: #ffffff;"><span style="margin: 0px; padding: 0px; outline: 0px; box-sizing: border-box; font-size: 12px;"><span style="margin: 0px; padding: 0px; outline: 0px; box-sizing: border-box; font-family: arial, helvetica, sans-serif;"><span style="margin: 0px; padding: 0px; outline: 0px; box-sizing: border-box; background-color: transparent; color: #000000;">During the deployment, FPT IS ERP will develop and test a software module with EVN ICT in conjunction with its installation process to support the operation flow. The total execution of the project will be within four months. The system is scheduled to work in January 2022.&nbsp;</span></span></span></p>', N'', CAST(N'2021-10-08T00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[tblPosts] ([ID], [userId], [title], [content], [video], [createDate], [statusId]) VALUES (1, N'102340646113497938153', N'FPT Edu NihongoEng 2021', N'<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: justify;"><span style="box-sizing: border-box; font-weight: bold;"><em style="box-sizing: border-box;">FPT Edu NihongoEng 2021 ch&iacute;nh thức được khởi động với chủ đề &ldquo;Responsibility &ndash; Tr&aacute;ch nhiệm&rdquo;. Cuộc thi l&agrave; s&acirc;n chơi uy t&iacute;n để học sinh, sinh vi&ecirc;n FPT Edu thể hiện khả năng sử dụng tiếng Anh, tiếng Nhật v&agrave; lan tỏa niềm y&ecirc;u th&iacute;ch với ngoại ngữ.&nbsp;</em></span></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: justify;">Trải qua 2 m&ugrave;a giải, cuộc thi NihongoEng đ&atilde; ghi dấu ấn với nhiều học sinh, sinh vi&ecirc;n trong Tổ chức Gi&aacute;o dục FPT, đặc biệt l&agrave; c&aacute;c bạn y&ecirc;u th&iacute;ch v&agrave; theo học hai m&ocirc;n ng&ocirc;n ngữ Tiếng Anh v&agrave; Tiếng Nhật. Năm nay, NihongoEng tiếp tục trở lại m&ugrave;a thứ 3 với chủ đề &ldquo;Responsibility&rdquo;, c&ugrave;ng mong muốn tạo cơ hội để c&aacute;c bạn thể hiện quan điểm về hai từ &ldquo;tr&aacute;ch nhiệm&rdquo; &ndash; một c&acirc;u chuyện được nhắc đến nhiều trong thời gian gần đ&acirc;y, khi dịch bệnh k&eacute;o theo những biến động trong đời sống kinh tế &ndash; x&atilde; hội.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: justify;">Đ&acirc;y l&agrave; một chủ đề th&uacute; vị nhưng cũng đầy th&aacute;ch thức với những người trẻ, khi qu&atilde;ng thời gian vừa qua đ&atilde; cho c&aacute;c bạn những trải nghiệm c&oacute; lẽ l&agrave; lần đầu trong đời đồng thời cũng tạo cơ hội để c&aacute;c bạn nhận thức r&otilde; r&agrave;ng v&agrave; s&acirc;u sắc hơn về tr&aacute;ch nhiệm.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;"><img class="aligncenter wp-image-42809 " style="box-sizing: border-box; border: 0px; vertical-align: middle; height: auto; max-width: 100%; clear: both; display: block; margin-left: auto; margin-right: auto;" src="https://daihoc.fpt.edu.vn/media/2021/10/244699853_4395658063854339_2887747305743911164_n-910x1232.jpeg" sizes="(max-width: 700px) 100vw, 700px" srcset="https://daihoc.fpt.edu.vn/media/2021/10/244699853_4395658063854339_2887747305743911164_n-910x1232.jpeg 910w, https://daihoc.fpt.edu.vn/media/2021/10/244699853_4395658063854339_2887747305743911164_n-240x325.jpeg 240w, https://daihoc.fpt.edu.vn/media/2021/10/244699853_4395658063854339_2887747305743911164_n-768x1039.jpeg 768w, https://daihoc.fpt.edu.vn/media/2021/10/244699853_4395658063854339_2887747305743911164_n.jpeg 1135w" alt="" width="700" height="948" loading="lazy" /></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: justify;">Cuộc thi FPT Edu NihongoEng 2021 được chia l&agrave;m 2 bảng thi độc lập v&agrave; c&oacute; cơ cấu giải thưởng ri&ecirc;ng: Bảng thi tiếng Anh v&agrave; Bảng thi tiếng Nhật. Cuộc thi nhận đăng k&yacute; tham dự theo đội, mỗi đội gồm 2-3 th&agrave;nh vi&ecirc;n l&agrave; học sinh, sinh vi&ecirc;n đang theo học tại c&aacute;c đơn vị thuộc FPT Edu. C&aacute;c đội sẽ trải qua 3 v&ograve;ng thi để chạm tay đến danh hiệu cao nhất.</p>', N'', CAST(N'2021-10-08T00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[tblPosts] ([ID], [userId], [title], [content], [video], [createDate], [statusId]) VALUES (10, N'102340646113497938153', N'Cơ hội trải nghiệm văn hoá xứ sở Chùa Vàng ngay trong tháng 9 với Sawasdee Thailand', N'<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;"><em style="box-sizing: border-box;"><span style="box-sizing: border-box; font-weight: bold;">SAWASDEE THAILAND sẽ l&agrave; một hoạt động được hứa hẹn v&ocirc; c&ugrave;ng hấp dẫn m&agrave; sinh vi&ecirc;n Đại học FPT kh&ocirc;ng n&ecirc;n bỏ lỡ v&agrave;o th&aacute;ng 9 n&agrave;y.</span></em></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">SAWASDEE THAILAND l&agrave; chuỗi workshop được tổ chức với sự phối hợp giữa Trường Đại học FPT v&agrave; Đại sứ qu&aacute;n Th&aacute;i Lan. Sự kiện nhằm tạo cơ hội cho c&aacute;c sinh vi&ecirc;n tr&ecirc;n to&agrave;n quốc được trải nghiệm văn h&oacute;a, n&acirc;ng cao hiểu biết về đất nước v&agrave; con người Th&aacute;i Lan, từ đ&oacute; c&oacute; th&ecirc;m kiến thức, tăng cường sự hiểu biết giữa 2 đất nước.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;"><img class="aligncenter wp-image-42211 " style="box-sizing: border-box; border: 0px; vertical-align: middle; height: auto; max-width: 100%; clear: both; display: block; margin-left: auto; margin-right: auto;" src="https://daihoc.fpt.edu.vn/media/2021/09/240117575_4997378403625054_6950243536174652298_n-910x1286.jpeg" sizes="(max-width: 800px) 100vw, 800px" srcset="https://daihoc.fpt.edu.vn/media/2021/09/240117575_4997378403625054_6950243536174652298_n-910x1286.jpeg 910w, https://daihoc.fpt.edu.vn/media/2021/09/240117575_4997378403625054_6950243536174652298_n-230x325.jpeg 230w, https://daihoc.fpt.edu.vn/media/2021/09/240117575_4997378403625054_6950243536174652298_n-768x1085.jpeg 768w, https://daihoc.fpt.edu.vn/media/2021/09/240117575_4997378403625054_6950243536174652298_n.jpeg 1087w" alt="" width="800" height="1131" loading="lazy" /></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">Đến với chuỗi workshop, c&aacute;c bạn sinh vi&ecirc;n sẽ c&oacute; cơ hội được trải nghiệm nhiều điều đặc biệt như</p>', N'', CAST(N'2021-11-24T00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[tblPosts] ([ID], [userId], [title], [content], [video], [createDate], [statusId]) VALUES (11, N'102340646113497938153', N'Tống Lê Hương Giang và chuyện ở trường học trải nghiệm', N'<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;"><span style="box-sizing: border-box; font-weight: bold;">C&ugrave;ng gặp gỡ c&ocirc; bạn t&agrave;i năng Tống L&ecirc; Hương Giang &ndash; sinh vi&ecirc;n K15 ng&agrave;nh Digital Marketing &ndash; Đại học FPT TP.HCM với những c&acirc;u chuyện th&uacute; vị tr&ecirc;n con đường học tập v&agrave; hoạt động ngoại kh&oacute;a của bản th&acirc;n.</span></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">Ngay khi c&ograve;n đang rục rịch chuẩn bị để bước v&agrave;o m&ocirc;i trường đại học, Giang đ&atilde; bị ấn tượng bởi chiến dịch truyền th&ocirc;ng đặc biệt của FPTU. C&ocirc; n&agrave;ng ngay lập tức cảm thấy được sự năng động ở nơi đ&acirc;y sẽ ph&ugrave; hợp với t&iacute;nh c&aacute;ch m&igrave;nh. Đ&oacute; l&agrave; l&yacute; do để Giang đặt trọn niềm tin cho con đường bước tới tương lai nghề nghiệp.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;"><img src="https://daihoc.fpt.edu.vn/media/2021/11/hcm-1-910x1138.jpg" width="406" height="508" /></p>', N'', CAST(N'2021-11-24T00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[tblPosts] ([ID], [userId], [title], [content], [video], [createDate], [statusId]) VALUES (17, N'102340646113497938153', N'Cựu sinh viên ĐH FPT được ba “ông lớn” Google, Facebook và Adobe mời làm việc', N'<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: justify;"><span style="box-sizing: border-box; font-weight: bold;"><em style="box-sizing: border-box;">Trước khi trở th&agrave;nh nữ kĩ sư phần mềm l&agrave;m việc tại Google Mỹ, Th&aacute;i Ngọc Diễm Phương, cựu sinh vi&ecirc;n ĐH FPT TP. HCM chuy&ecirc;n ng&agrave;nh kỹ thuật phần mềm đ&atilde; nhận được lời mời từ hai &ldquo;&ocirc;ng lớn&rdquo; kh&aacute;c l&agrave; Facebook v&agrave; Adobe.</em></span></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: justify;">Với xuất ph&aacute;t điểm b&igrave;nh thường, Th&aacute;i Ngọc Diễm Phương đ&atilde; từng bước đi đến th&agrave;nh c&ocirc;ng ấn tượng.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: justify;"><em style="box-sizing: border-box;"><span style="box-sizing: border-box; font-weight: bold;">Sinh vi&ecirc;n năm nhất l&agrave;m b&agrave;i tập lớp 6</span></em></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: justify;"><img class="aligncenter wp-image-42640 size-full" style="box-sizing: border-box; border: 0px; vertical-align: middle; height: auto; max-width: 100%; clear: both; display: block; margin-left: auto; margin-right: auto;" src="https://daihoc.fpt.edu.vn/media/2021/09/nu-ki-su-phan-mem-nguoi-viet-nam-nhan-duoc-ba-loi-moi-lam-viec-tu-google-facebook-va-adobethanh-cong-la-co-the-tu-dung-tren-doi-chan-cua-minhdocx-1632579586095.jpeg" sizes="(max-width: 660px) 100vw, 660px" srcset="https://daihoc.fpt.edu.vn/media/2021/09/nu-ki-su-phan-mem-nguoi-viet-nam-nhan-duoc-ba-loi-moi-lam-viec-tu-google-facebook-va-adobethanh-cong-la-co-the-tu-dung-tren-doi-chan-cua-minhdocx-1632579586095.jpeg 660w, https://daihoc.fpt.edu.vn/media/2021/09/nu-ki-su-phan-mem-nguoi-viet-nam-nhan-duoc-ba-loi-moi-lam-viec-tu-google-facebook-va-adobethanh-cong-la-co-the-tu-dung-tren-doi-chan-cua-minhdocx-1632579586095-453x325.jpeg 453w" alt="" width="660" height="474" loading="lazy" /></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: center;"><em style="box-sizing: border-box;">Diễm Phương đ&atilde; bắt đầu học C&ocirc;ng nghệ th&ocirc;ng tin từ con số 0.</em></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: justify;">Th&aacute;i Ngọc Diễm Phương l&agrave; cựu sinh vi&ecirc;n chuy&ecirc;n ng&agrave;nh Kĩ thuật phần mềm, ĐH FPT. Những năm đầu đại học, Phương được xếp v&agrave;o một lớp c&oacute; những sinh vi&ecirc;n giỏi, hầu như c&aacute;c bạn học đều l&agrave; học chuy&ecirc;n To&aacute;n, Tin.</p>', N'', CAST(N'2021-11-24T00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[tblPosts] ([ID], [userId], [title], [content], [video], [createDate], [statusId]) VALUES (18, N'102340646113497938153', N'Thầy cô giáo hạnh phúc sẽ thay đổi thế giới', N'<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">Webinar với sự g&oacute;p mặt của PGS.TS. Chu Cẩm Thơ &ndash; Trưởng Ban nghi&ecirc;n cứu đ&aacute;nh gi&aacute; gi&aacute;o dục, Viện Khoa học Gi&aacute;o dục Việt Nam; thầy Vũ Hồng Qu&acirc;n &ndash; Gi&aacute;m đốc điều h&agrave;nh THPT FPT Quy Nhơn; ThS. Phan Bảo Ch&acirc;u &ndash; Chủ nhiệm bộ m&ocirc;n Hoạt h&igrave;nh Kỹ thuật số (Đại học FPT TP.HCM); c&ugrave;ng với sự dẫn dắt của chị Phạm Tuyết Hạnh H&agrave; &ndash; Trưởng ban C&ocirc;ng t&aacute;c học đường Tổ chức gi&aacute;o dục FPT.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: center;"><img class="alignnone size-large wp-image-43037" style="box-sizing: border-box; border: 0px; vertical-align: middle; height: auto; max-width: 100%;" src="https://daihoc.fpt.edu.vn/media/2021/11/H1-1-910x512.png" sizes="(max-width: 910px) 100vw, 910px" srcset="https://daihoc.fpt.edu.vn/media/2021/11/H1-1-910x512.png 910w, https://daihoc.fpt.edu.vn/media/2021/11/H1-1-577x325.png 577w, https://daihoc.fpt.edu.vn/media/2021/11/H1-1-768x432.png 768w, https://daihoc.fpt.edu.vn/media/2021/11/H1-1.png 977w" alt="" width="910" height="512" loading="lazy" /></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: center;"><em style="box-sizing: border-box;">Sự g&oacute;p mặt của những vị kh&aacute;ch mời l&agrave;m cho kh&ocirc;ng kh&iacute; buổi chia sẻ trở n&ecirc;n gần gũi v&agrave; th&acirc;n thương</em></p>', N'', CAST(N'2021-11-24T00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[tblPosts] ([ID], [userId], [title], [content], [video], [createDate], [statusId]) VALUES (2, N'102340646113497938153', N'Tìm hiểu về Sketchnote', N'<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: justify;">Hiểu 1 c&aacute;ch đơn giản, Sketchnote l&agrave; những ghi ch&uacute; bằng h&igrave;nh ảnh được vẽ ngay tại thời điểm sự việc diễn ra. Phương ph&aacute;p n&agrave;y tận dụng triệt để tu duy h&igrave;nh v&agrave; gi&uacute;p bạn h&igrave;nh dung mọi th&ocirc;ng tin m&agrave; bạn tiếp nhận một c&aacute;ch dễ d&agrave;ng v&agrave; ghi nhớ l&acirc;u hơn.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: justify;">C&aacute;c h&igrave;nh cơ bản như đường thẳng, h&igrave;nh tr&ograve;n, h&igrave;nh vu&ocirc;ng, h&igrave;nh tam gi&aacute;c, h&igrave;nh s&oacute;ng v&agrave; h&igrave;nh chấm, đều l&agrave; những h&igrave;nh rất đơn giản nhưng lại c&oacute; khả năng diễn tả mọi sự vật. Hay những biểu tượng cảm x&uacute;c vui, buồn, ngạc nhi&ecirc;n, những kiểu chữ c&aacute;ch điệu&hellip; cũng sẽ khiến b&agrave;i ghi ch&eacute;p của bạn trở n&ecirc;n đẹp v&agrave; s&aacute;ng tạo hơn. Ch&iacute;nh v&igrave; cấu tạo đơn giản như vậy n&ecirc;n bạn kh&ocirc;ng cần phải l&agrave; một họa sĩ hay c&oacute; năng khiếu vẽ để sử dụng phương ph&aacute;p n&agrave;y, nhờ tư duy s&aacute;ng tạo của bạn mới l&agrave; yếu tố tạo n&ecirc;n sự kh&aacute;c biệt đ&oacute;.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;"><img class="aligncenter wp-image-42724 " style="box-sizing: border-box; border: 0px; vertical-align: middle; height: auto; max-width: 100%; clear: both; display: block; margin-left: auto; margin-right: auto;" src="https://daihoc.fpt.edu.vn/media/2021/10/243014050_3028170450785775_4263770832571540411_n-910x1250.jpeg" sizes="(max-width: 701px) 100vw, 701px" srcset="https://daihoc.fpt.edu.vn/media/2021/10/243014050_3028170450785775_4263770832571540411_n-910x1250.jpeg 910w, https://daihoc.fpt.edu.vn/media/2021/10/243014050_3028170450785775_4263770832571540411_n-237x325.jpeg 237w, https://daihoc.fpt.edu.vn/media/2021/10/243014050_3028170450785775_4263770832571540411_n-768x1055.jpeg 768w, https://daihoc.fpt.edu.vn/media/2021/10/243014050_3028170450785775_4263770832571540411_n.jpeg 1491w" alt="" width="701" height="963" loading="lazy" /></p>', N'', CAST(N'2021-10-08T00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[tblPosts] ([ID], [userId], [title], [content], [video], [createDate], [statusId]) VALUES (3, N'102340646113497938153', N'Những gương mặt quyền lực đầu tiên tại vòng loại FPTU Debate Tournament Season 2', N'<div dir="auto" style="box-sizing: border-box; text-align: justify;"><span style="box-sizing: border-box; font-weight: bold;"><em style="box-sizing: border-box;">Để đưa ra những lựa chọn ch&iacute;nh x&aacute;c nhất cho c&aacute;c đội thi t&agrave;i năng trong V&ograve;ng loại cuộc thi FPTU Debate Tournament Season 2, ch&uacute;ng ta kh&ocirc;ng thể kh&ocirc;ng kể đến sự hiện diện của những vị gi&aacute;m khảo đầy kinh nghiệm v&agrave; c&ocirc;ng t&acirc;m. C&ugrave;ng xem họ l&agrave; ai v&agrave; sẽ đưa ra những quyết định như thế n&agrave;o tại V&ograve;ng loại n&agrave;y nh&eacute;!</em></span></div>
<div dir="auto" style="box-sizing: border-box; text-align: justify;">&nbsp;</div>
<div class="o9v6fnle cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q" style="box-sizing: border-box; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: justify;">
<div dir="auto" style="box-sizing: border-box;">Nhưng chưa hết đ&acirc;u, những gương mặt quyền lực tiếp theo của V&ograve;ng loại FDT Season 2 sẽ tiếp tục được bật m&iacute; trong thời gian sắp tới, đừng bỏ lỡ nh&eacute;!</div>
</div>', N'', CAST(N'2021-11-24T00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[tblPosts] ([ID], [userId], [title], [content], [video], [createDate], [statusId]) VALUES (4, N'102340646113497938153', N'Orientation Week', N'<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;"><em style="box-sizing: border-box;">Tiếp nối những buổi học bổ &iacute;ch trong tuần lễ định hướng, s&aacute;ng ng&agrave;y 28/09, c&aacute;c K17 đ&atilde; tham gia buổi học &ldquo;Lộ tr&igrave;nh học tập, c&aacute;c m&ocirc;n học đặc biệt tại ĐH FPT&rdquo; v&agrave; được chia sẻ về lộ tr&igrave;nh học tập, c&aacute;c th&ocirc;ng tin về tổ chức đ&agrave;o tạo của trường, từ đ&oacute; gi&uacute;p c&aacute;c bạn x&acirc;y dựng kế hoạch học tập hiệu quả cho bản th&acirc;n trong 4 năm tới.</em></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">Đồng h&agrave;nh c&ugrave;ng c&aacute;c K17 trong ng&agrave;y thứ 2 của tuần lễ định hướng l&agrave; MC Ngọc Thịnh v&agrave; c&aacute;c vị kh&aacute;ch mời đặc biệt: Thầy Phan Trường L&acirc;m &ndash; Trưởng ban Đ&agrave;o tạo Trường Đại học FPT H&agrave; Nội; Thầy Bạch Ngọc Chiến &ndash; Chủ tịch Li&ecirc;n đo&agrave;n Vovinam Th&agrave;nh phố H&agrave; Nội; C&ocirc; Nguyễn Th&ugrave;y Chi, c&ocirc; Nguyễn Thu Thủy, c&ocirc; Phạm Thị Lan &ndash; Giảng vi&ecirc;n bộ m&ocirc;n Nhạc cụ d&acirc;n tộc tại Trường ĐH FPT H&agrave; Nội.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;"><img class="aligncenter wp-image-42691 size-large" style="box-sizing: border-box; border: 0px; vertical-align: middle; height: auto; max-width: 100%; clear: both; display: block; margin-left: auto; margin-right: auto;" src="https://daihoc.fpt.edu.vn/media/2021/10/40ad19da508a99d4c09b-scaled-910x569.jpeg" sizes="(max-width: 910px) 100vw, 910px" srcset="https://daihoc.fpt.edu.vn/media/2021/10/40ad19da508a99d4c09b-scaled-910x569.jpeg 910w, https://daihoc.fpt.edu.vn/media/2021/10/40ad19da508a99d4c09b-scaled-520x325.jpeg 520w, https://daihoc.fpt.edu.vn/media/2021/10/40ad19da508a99d4c09b-scaled-768x480.jpeg 768w, https://daihoc.fpt.edu.vn/media/2021/10/40ad19da508a99d4c09b-scaled.jpeg 1024w" alt="" width="910" height="569" loading="lazy" /></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">&ldquo;Lộ tr&igrave;nh học tập tại Đại Học FPT&rdquo; đang l&agrave; chủ đề được rất nhiều t&acirc;n sinh vi&ecirc;n quan t&acirc;m. C&oacute; rất nhiều c&aacute;c c&acirc;u hỏi được đặt ra như: Quy chế đ&agrave;o tạo ra sao? Khung chương tr&igrave;nh v&agrave; th&ocirc;ng tin học phần như thế n&agrave;o? C&oacute; những điều kiện ti&ecirc;n quyết g&igrave; để ho&agrave;n th&agrave;nh c&aacute;c m&ocirc;n học tại trường? Tất cả đ&atilde; được Thầy Phan Trường L&acirc;m &ndash; Trưởng ban Đ&agrave;o tạo Trường Đại học FPT H&agrave; Nội giải đ&aacute;p chi tiết trong buổi học định hướng n&agrave;y.</p>', N'', CAST(N'2021-10-08T00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[tblPosts] ([ID], [userId], [title], [content], [video], [createDate], [statusId]) VALUES (5, N'102340646113497938153', N'FPTU Debate Tournament Season 2', N'<div class="kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q" style="box-sizing: border-box; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">
<div dir="auto" style="box-sizing: border-box; text-align: justify;"><span style="box-sizing: border-box; font-weight: bold;"><em style="box-sizing: border-box;">Để đưa ra những lựa chọn ch&iacute;nh x&aacute;c nhất cho c&aacute;c đội thi t&agrave;i năng trong V&ograve;ng loại cuộc thi FPTU Debate Tournament Season 2, ch&uacute;ng ta kh&ocirc;ng thể kh&ocirc;ng kể đến sự hiện diện của những vị gi&aacute;m khảo đầy kinh nghiệm v&agrave; c&ocirc;ng t&acirc;m. C&ugrave;ng xem họ l&agrave; ai v&agrave; sẽ đưa ra những quyết định như thế n&agrave;o tại V&ograve;ng loại n&agrave;y nh&eacute;!</em></span></div>
<div dir="auto" style="box-sizing: border-box; text-align: justify;">&nbsp;</div>
</div>
<div class="o9v6fnle cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q" style="box-sizing: border-box; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: justify;">
<div dir="auto" style="box-sizing: border-box;">Nhưng chưa hết đ&acirc;u, những gương mặt quyền lực tiếp theo của V&ograve;ng loại FDT Season 2 sẽ tiếp tục được bật m&iacute; trong thời gian sắp tới, đừng bỏ lỡ nh&eacute;!</div>
<div dir="auto" style="box-sizing: border-box;"><img class="aligncenter wp-image-42673 " style="box-sizing: border-box; border: 0px; vertical-align: middle; height: auto; max-width: 100%; clear: both; display: block; margin-left: auto; margin-right: auto;" src="https://daihoc.fpt.edu.vn/media/2021/09/243258541_4155331241256503_8308181699923452277_n-910x910.jpeg" sizes="(max-width: 700px) 100vw, 700px" srcset="https://daihoc.fpt.edu.vn/media/2021/09/243258541_4155331241256503_8308181699923452277_n-910x910.jpeg 910w, https://daihoc.fpt.edu.vn/media/2021/09/243258541_4155331241256503_8308181699923452277_n-325x325.jpeg 325w, https://daihoc.fpt.edu.vn/media/2021/09/243258541_4155331241256503_8308181699923452277_n-768x768.jpeg 768w, https://daihoc.fpt.edu.vn/media/2021/09/243258541_4155331241256503_8308181699923452277_n-60x60.jpeg 60w, https://daihoc.fpt.edu.vn/media/2021/09/243258541_4155331241256503_8308181699923452277_n.jpeg 1500w" alt="" width="700" height="700" loading="lazy" /></div>
</div>
<div dir="auto" style="box-sizing: border-box; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: justify;">C&ocirc; Thanh Tuyền hiện đang l&agrave; giảng vi&ecirc;n Truyền th&ocirc;ng tại Đại học FPT v&agrave; từng tốt nghiệp thạc sĩ tại Trường Rey Juan Carlos, T&acirc;y Ban Nha. C&ocirc; l&agrave; một giảng vi&ecirc;n t&agrave;i năng v&agrave; kinh nghiệm đa dạng với ch&acirc;m ng&ocirc;n sống: &ldquo;If you desperately want something, the universe will conspire in helping you achieve it&rdquo; &ndash; The Alchemist.<br style="box-sizing: border-box;" />C&ocirc; Trương Thanh Tuyền sẽ l&agrave; một trong những vị gi&aacute;m khảo quan trọng, đưa ra những lời nhận x&eacute;t x&aacute;c đ&aacute;ng, th&uacute;c đẩy tinh thần gi&uacute;p c&aacute;c th&iacute; sinh nỗ lực hơn nữa.</div>
<div dir="auto" style="box-sizing: border-box; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: justify;">&nbsp;</div>
<div dir="auto" style="box-sizing: border-box; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: justify;"><img class="aligncenter wp-image-42674 " style="box-sizing: border-box; border: 0px; vertical-align: middle; height: auto; max-width: 100%; clear: both; display: block; margin-left: auto; margin-right: auto;" src="https://daihoc.fpt.edu.vn/media/2021/09/243461563_4155331277923166_8806673837328679846_n-910x910.jpeg" sizes="(max-width: 700px) 100vw, 700px" srcset="https://daihoc.fpt.edu.vn/media/2021/09/243461563_4155331277923166_8806673837328679846_n-910x910.jpeg 910w, https://daihoc.fpt.edu.vn/media/2021/09/243461563_4155331277923166_8806673837328679846_n-325x325.jpeg 325w, https://daihoc.fpt.edu.vn/media/2021/09/243461563_4155331277923166_8806673837328679846_n-768x768.jpeg 768w, https://daihoc.fpt.edu.vn/media/2021/09/243461563_4155331277923166_8806673837328679846_n-60x60.jpeg 60w, https://daihoc.fpt.edu.vn/media/2021/09/243461563_4155331277923166_8806673837328679846_n.jpeg 1500w" alt="" width="700" height="700" loading="lazy" /></div>', N'', CAST(N'2021-10-08T00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[tblPosts] ([ID], [userId], [title], [content], [video], [createDate], [statusId]) VALUES (6, N'102340646113497938153', N'Tân SV K17 được “mách nước”', N'<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: justify;"><em style="box-sizing: border-box;"><span style="box-sizing: border-box; font-weight: bold;">Khởi động cho tuần lễ định hướng, sau phần giới thiệu về FPT để c&aacute;c t&acirc;n sinh vi&ecirc;n hiểu r&otilde; hơn về ng&ocirc;i trường nơi m&igrave;nh sẽ gắn b&oacute; 4 năm thanh xu&acirc;n, c&aacute;c t&acirc;n binh nh&agrave; F đ&atilde; được anh Nguyễn Ch&iacute; Hiếu &ndash; CEO Tổ chức Gi&aacute;o dục IEG chia sẻ những kinh nghiệm hữu &iacute;ch về &ldquo;Chiến lược học tập v&agrave; Tư duy ph&acirc;n t&iacute;ch, đổi mới&rdquo;</span></em></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: justify;">Anh Nguyễn Ch&iacute; Hiếu hiện l&agrave; CEO Tổ chức Gi&aacute;o dục IEG v&agrave; cũng được biết đến l&agrave; chuy&ecirc;n gia trong lĩnh vực gi&aacute;o dục, cố vấn cao cấp cho nhiều hệ thống trường phổ th&ocirc;ng, cao đẳng, đại học v&agrave; c&aacute;c tổ chức gi&aacute;o dục tại Việt Nam.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: justify;"><img class="aligncenter wp-image-42631 " style="box-sizing: border-box; border: 0px; vertical-align: middle; height: auto; max-width: 100%; clear: both; display: block; margin-left: auto; margin-right: auto;" src="https://daihoc.fpt.edu.vn/media/2021/09/IMG_6045-910x512.png" sizes="(max-width: 700px) 100vw, 700px" srcset="https://daihoc.fpt.edu.vn/media/2021/09/IMG_6045-910x512.png 910w, https://daihoc.fpt.edu.vn/media/2021/09/IMG_6045-578x325.png 578w, https://daihoc.fpt.edu.vn/media/2021/09/IMG_6045-768x432.png 768w" alt="" width="700" height="394" loading="lazy" /></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: justify;">L&agrave;m sao để quản l&yacute; thời gian thật hiệu quả trong m&ocirc;i trường học tập ho&agrave;n to&agrave;n mới? T&acirc;n sinh vi&ecirc;n cần trang bị tư duy ph&acirc;n t&iacute;ch như thế n&agrave;o để th&iacute;ch ứng kịp thời với m&ocirc;i trường học tập đầy t&iacute;nh thực h&agrave;nh? V&agrave; những lời khuy&ecirc;n n&agrave;o về phương ph&aacute;p học tập hiệu quả d&agrave;nh cho c&aacute;c C&oacute;c? Tất cả đều được giải đ&aacute;p tại talkshow với những chia sẻ th&uacute; vị của người anh c&oacute; bề d&agrave;y kinh nghiệm đ&aacute;ng nể.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: justify;">Xuy&ecirc;n suốt buổi tr&ograve; chuyện, Anh Ch&iacute; Hiếu d&atilde; chia sẻ rất nhiều điều th&uacute; vị về c&aacute;c dạng sinh vi&ecirc;n, nhưng điều sinh vi&ecirc;n cần thực hiện trong 4 năm đại học cũng như những phương ph&aacute;p học tập v&agrave; trải nghiệm hiệu quả vừa gi&uacute;p c&acirc;n bằng việc học vừa c&oacute; thời gian tham gia hoạt động ngoại kho&aacute; v&agrave; giải tr&iacute;. Cuối chương tr&igrave;nh l&agrave; những phần hỏi đ&aacute;p v&agrave; giao lưu th&uacute; vị c&ugrave;ng sinh vi&ecirc;n.</p>', N'', CAST(N'2021-10-08T00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[tblPosts] ([ID], [userId], [title], [content], [video], [createDate], [statusId]) VALUES (7, N'102340646113497938153', N'Đánh thức năng lực tranh biện cùng ‌Á‌ ‌quân‌', N'<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;"><em style="box-sizing: border-box;"><span style="box-sizing: border-box; font-weight: bold;">Với mong muốn mang đến cho c&aacute;c bạn sinh vi&ecirc;n những kiến thức đa chiều, kỹ năng về bộ m&ocirc;n tranh biện cũng như c&oacute; thể vượt qua nỗi sợ ng&ocirc;n từ v&agrave; đ&aacute;m đ&ocirc;ng, BTC FPTU Debate Tournament Season 2 đ&atilde; mang đến chương tr&igrave;nh Webinar: Đ&aacute;nh Thức Năng Lực Tranh Biện.</span></em></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;"><img class="aligncenter wp-image-42619 " style="box-sizing: border-box; border: 0px; vertical-align: middle; height: auto; max-width: 100%; clear: both; display: block; margin-left: auto; margin-right: auto;" src="https://daihoc.fpt.edu.vn/media/2021/09/Screen-Shot-2021-09-27-at-11.02.38-AM-910x518.png" sizes="(max-width: 701px) 100vw, 701px" srcset="https://daihoc.fpt.edu.vn/media/2021/09/Screen-Shot-2021-09-27-at-11.02.38-AM-910x518.png 910w, https://daihoc.fpt.edu.vn/media/2021/09/Screen-Shot-2021-09-27-at-11.02.38-AM-571x325.png 571w, https://daihoc.fpt.edu.vn/media/2021/09/Screen-Shot-2021-09-27-at-11.02.38-AM-768x437.png 768w, https://daihoc.fpt.edu.vn/media/2021/09/Screen-Shot-2021-09-27-at-11.02.38-AM.png 961w" alt="" width="701" height="399" loading="lazy" /></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">Xuất hiện tại webinar lần n&agrave;y đ&oacute; l&agrave; diễn giả kh&aacute;ch mời L&ecirc; Minh T&uacute; -&zwnj; Chủ&zwnj; &zwnj;nhiệm&zwnj; &zwnj;Fulbright&zwnj; &zwnj;Debate&zwnj; &zwnj;Club,&zwnj; &zwnj;&Aacute;&zwnj; &zwnj;qu&acirc;n&zwnj; &zwnj;Cuộc&zwnj; &zwnj;thi&zwnj; &zwnj;Tranh&zwnj; &zwnj;biện&zwnj; &zwnj;ASEAN&zwnj; &zwnj;2016&zwnj;. Với bề d&agrave;y kinh nghiệm c&ugrave;ng những th&agrave;nh t&iacute;ch cực khủng về bộ m&ocirc;n tranh biện, kh&aacute;ch mời Minh T&uacute; đ&atilde; đem đến cho sinh vi&ecirc;n trường F v&agrave; những người tham dự nhiều kiến thức thật hữu &iacute;ch về bộ m&ocirc;n tr&iacute; tuệ n&agrave;y ,bao gồm:- Giới thiệu về tranh biện (&Yacute; nghĩa v&agrave; những lợi &iacute;ch khi tham gia tranh biện).</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">&ndash; Tổng quan về thi đấu tranh biện, giới thiệu luật AP (Asian Parliamentary) v&agrave; vai tr&ograve; của c&aacute;c lượt n&oacute;i.<br style="box-sizing: border-box;" />&ndash; C&aacute;ch tiếp cận kiến nghị trong tranh biện.<br style="box-sizing: border-box;" />&ndash; Ph&acirc;n t&iacute;ch vấn đề kiến nghị v&agrave; triển khai luận điểm.<br style="box-sizing: border-box;" />&ndash; Nhiệm vụ chứng minh v&agrave; phản biện khi trong trận đấu.<br style="box-sizing: border-box;" />&ndash; Những lỗi cần tr&aacute;nh v&agrave; b&iacute; quyết luyện tập tranh biện.</p>', N'', CAST(N'2021-10-08T00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[tblPosts] ([ID], [userId], [title], [content], [video], [createDate], [statusId]) VALUES (8, N'102340646113497938153', N'AI trong xây dựng thuật toán cân chỉnh Robot', N'<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;"><em style="box-sizing: border-box;"><span style="box-sizing: border-box; font-weight: bold;">Tất cả những thắc mắc về Tr&iacute; tuệ nh&acirc;n tạo v&agrave; c&ocirc;ng nghệ Robot sẽ được giải đ&aacute;p tại workshop với chủ đề: Ứng dụng AI trong x&acirc;y dựng thuật to&aacute;n c&acirc;n chỉnh Robot d&agrave;nh cho sinh vi&ecirc;n ĐH FPT</span></em></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;"><img class="aligncenter wp-image-42583 size-large" style="box-sizing: border-box; border: 0px; vertical-align: middle; height: auto; max-width: 100%; clear: both; display: block; margin-left: auto; margin-right: auto;" src="https://daihoc.fpt.edu.vn/media/2021/09/242069882_4124830370973257_6877454470395678716_n-910x1138.jpeg" sizes="(max-width: 910px) 100vw, 910px" srcset="https://daihoc.fpt.edu.vn/media/2021/09/242069882_4124830370973257_6877454470395678716_n-910x1138.jpeg 910w, https://daihoc.fpt.edu.vn/media/2021/09/242069882_4124830370973257_6877454470395678716_n-260x325.jpeg 260w, https://daihoc.fpt.edu.vn/media/2021/09/242069882_4124830370973257_6877454470395678716_n-768x960.jpeg 768w, https://daihoc.fpt.edu.vn/media/2021/09/242069882_4124830370973257_6877454470395678716_n.jpeg 1638w" alt="" width="910" height="1138" loading="lazy" /></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">Đối tượng tham gia: Tất cả sinh vi&ecirc;n ĐH FPT TP. HCM</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">Diễn giả: TS. L&ecirc; Ph&uacute; Nguy&ecirc;n &ndash; Hiện đang l&agrave; giảng vi&ecirc;n bộ m&ocirc;n ITS tại ĐH FPT TP. HCM.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">Tại buổi workshop, người tham gia được t&igrave;m hiểu th&ocirc;ng tin về:</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">&ndash; Ứng dụng AI trong lĩnh vực Robotic.</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">&ndash; Ứng dụng Neural Network cho c&aacute;c b&agrave;i to&aacute;n về xử l&yacute; c&aacute;nh tay robot</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">&ndash; C&aacute;c thuật to&aacute;n Evolution trong việc x&acirc;y dựng c&acirc;n chỉnh cho tay m&aacute;y c&ocirc;ng nghiệp</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">&ndash; Giới thiệu một số hướng nghi&ecirc;n cứu trong lĩnh vực Robotic.</p>', N'', CAST(N'2021-10-08T00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[tblPosts] ([ID], [userId], [title], [content], [video], [createDate], [statusId]) VALUES (9, N'102340646113497938153', N'Bí kíp “chinh phục” tiếng Anh tại LUK', N'<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;"><span style="box-sizing: border-box; font-weight: bold;"><em style="box-sizing: border-box;">Nước Anh thu nhỏ &ldquo;Little UK&rdquo; &ndash; nơi t&ocirc;i luyện tr&igrave;nh độ tiếng Anh cho c&aacute;c bạn t&acirc;n sinh vi&ecirc;n suốt năm đầu ti&ecirc;n tại trường F. Chỉ cần nắm trong tay những tuyệt chi&ecirc;u n&agrave;y, việc học tiếng Anh đối với c&aacute;c C&oacute;c tại trường F chỉ l&agrave; &ldquo;chuyện nhỏ&rdquo;.</em></span></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;"><img class="aligncenter wp-image-42555 size-large" style="box-sizing: border-box; border: 0px; vertical-align: middle; height: auto; max-width: 100%; clear: both; display: block; margin-left: auto; margin-right: auto;" src="https://daihoc.fpt.edu.vn/media/2021/09/242060375_255727006448083_3893763192526215967_n-910x910.jpeg" sizes="(max-width: 910px) 100vw, 910px" srcset="https://daihoc.fpt.edu.vn/media/2021/09/242060375_255727006448083_3893763192526215967_n-910x910.jpeg 910w, https://daihoc.fpt.edu.vn/media/2021/09/242060375_255727006448083_3893763192526215967_n-325x325.jpeg 325w, https://daihoc.fpt.edu.vn/media/2021/09/242060375_255727006448083_3893763192526215967_n-768x768.jpeg 768w, https://daihoc.fpt.edu.vn/media/2021/09/242060375_255727006448083_3893763192526215967_n-60x60.jpeg 60w, https://daihoc.fpt.edu.vn/media/2021/09/242060375_255727006448083_3893763192526215967_n.jpeg 1080w" alt="" width="910" height="910" loading="lazy" /></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;"><span style="box-sizing: border-box; font-weight: bold;">Đọc trước gi&aacute;o tr&igrave;nh m&ocirc;n học trước khi tới lớp</span></p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">Nếu như c&aacute;c sinh vi&ecirc;n cảm thấy việc nghe hiểu b&agrave;i giảng ngay tr&ecirc;n lớp học l&agrave; một việc c&oacute; một ch&uacute;t kh&oacute; khăn th&igrave; h&atilde;y thử đọc hiểu sơ qua về b&agrave;i học trước khi tới lớp. Việc n&agrave;y sẽ gi&uacute;p c&aacute;c bạn c&oacute; th&ecirc;m thời gian để tra từ, hiểu một c&aacute;ch kh&aacute;i qu&aacute;t về nội dung b&agrave;i học hoặc &iacute;t nhất l&agrave; giảm khả năng &ldquo;vịt nghe sấm&rdquo; khi nghe thầy c&ocirc; giảng b&agrave;i bằng Tiếng Anh.</p>', N'', CAST(N'2021-10-08T00:00:00.000' AS DateTime), N'A')
SET IDENTITY_INSERT [dbo].[tblPosts] OFF
GO
INSERT [dbo].[tblRoles] ([roleId], [roleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRoles] ([roleId], [roleName]) VALUES (N'EM', N'Event Manager')
INSERT [dbo].[tblRoles] ([roleId], [roleName]) VALUES (N'MT', N'Mentor/Lecturer')
INSERT [dbo].[tblRoles] ([roleId], [roleName]) VALUES (N'US', N'Basic User')
GO
INSERT [dbo].[tblSlots] ([slotId], [startTime], [endTime]) VALUES (N'1', CAST(N'07:00:00' AS Time), CAST(N'08:30:00' AS Time))
INSERT [dbo].[tblSlots] ([slotId], [startTime], [endTime]) VALUES (N'2', CAST(N'08:45:00' AS Time), CAST(N'10:15:00' AS Time))
INSERT [dbo].[tblSlots] ([slotId], [startTime], [endTime]) VALUES (N'3', CAST(N'10:30:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[tblSlots] ([slotId], [startTime], [endTime]) VALUES (N'4', CAST(N'12:30:00' AS Time), CAST(N'14:00:00' AS Time))
INSERT [dbo].[tblSlots] ([slotId], [startTime], [endTime]) VALUES (N'5', CAST(N'14:15:00' AS Time), CAST(N'15:45:00' AS Time))
INSERT [dbo].[tblSlots] ([slotId], [startTime], [endTime]) VALUES (N'6', CAST(N'16:00:00' AS Time), CAST(N'05:30:00' AS Time))
GO
INSERT [dbo].[tblStatusEvent] ([statusId], [statusName]) VALUES (N'AP', N'Approve')
INSERT [dbo].[tblStatusEvent] ([statusId], [statusName]) VALUES (N'E', N'Expire')
INSERT [dbo].[tblStatusEvent] ([statusId], [statusName]) VALUES (N'OG', N'On-going')
INSERT [dbo].[tblStatusEvent] ([statusId], [statusName]) VALUES (N'P', N'Pending')
GO
INSERT [dbo].[tblStatusPost] ([statusId], [statusName]) VALUES (N'A', N'Active')
INSERT [dbo].[tblStatusPost] ([statusId], [statusName]) VALUES (N'D', N'Deactive')
GO
INSERT [dbo].[tblStatusUser] ([statusId], [statusName]) VALUES (N'A', N'Active')
INSERT [dbo].[tblStatusUser] ([statusId], [statusName]) VALUES (N'D', N'Deactive')
GO
INSERT [dbo].[tblUsers] ([userId], [email], [username], [statusId], [roleId]) VALUES (N'100244481500661777938', N'trungntse151134@fpt.edu.vn', N'Thanh Trung', N'A', N'AD')
INSERT [dbo].[tblUsers] ([userId], [email], [username], [statusId], [roleId]) VALUES (N'102340646113497938153', N'anhtnse151264@fpt.edu.vn', N'Nam Anh', N'A', N'MT')
INSERT [dbo].[tblUsers] ([userId], [email], [username], [statusId], [roleId]) VALUES (N'102972386328363391378', N'tunglxse151266@fpt.edu.vn', N'Xuan Tung', N'A', N'US')
INSERT [dbo].[tblUsers] ([userId], [email], [username], [statusId], [roleId]) VALUES (N'110615623873739905848', N'nhutpmse151273@fpt.edu.vn', N'Minh Nhut', N'A', N'EM')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblUsers__AB6E61643F5F74E4]    Script Date: 11/26/2021 12:18:15 PM ******/
ALTER TABLE [dbo].[tblUsers] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblComments]  WITH CHECK ADD FOREIGN KEY([eventId])
REFERENCES [dbo].[tblEvents] ([eventId])
GO
ALTER TABLE [dbo].[tblComments]  WITH CHECK ADD FOREIGN KEY([postId])
REFERENCES [dbo].[tblPosts] ([postId])
GO
ALTER TABLE [dbo].[tblComments]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[tblUsers] ([userId])
GO
ALTER TABLE [dbo].[tblEvents]  WITH CHECK ADD  CONSTRAINT [FK__tblEvents__endSl__5AEE82B9] FOREIGN KEY([endSlot])
REFERENCES [dbo].[tblSlots] ([slotId])
GO
ALTER TABLE [dbo].[tblEvents] CHECK CONSTRAINT [FK__tblEvents__endSl__5AEE82B9]
GO
ALTER TABLE [dbo].[tblEvents]  WITH CHECK ADD  CONSTRAINT [FK__tblEvents__locat__59063A47] FOREIGN KEY([locationId])
REFERENCES [dbo].[tblLocations] ([locationId])
GO
ALTER TABLE [dbo].[tblEvents] CHECK CONSTRAINT [FK__tblEvents__locat__59063A47]
GO
ALTER TABLE [dbo].[tblEvents]  WITH CHECK ADD  CONSTRAINT [FK__tblEvents__start__59FA5E80] FOREIGN KEY([startSlot])
REFERENCES [dbo].[tblSlots] ([slotId])
GO
ALTER TABLE [dbo].[tblEvents] CHECK CONSTRAINT [FK__tblEvents__start__59FA5E80]
GO
ALTER TABLE [dbo].[tblEvents]  WITH CHECK ADD  CONSTRAINT [FK__tblEvents__statu__5BE2A6F2] FOREIGN KEY([statusId])
REFERENCES [dbo].[tblStatusEvent] ([statusId])
GO
ALTER TABLE [dbo].[tblEvents] CHECK CONSTRAINT [FK__tblEvents__statu__5BE2A6F2]
GO
ALTER TABLE [dbo].[tblEvents]  WITH CHECK ADD  CONSTRAINT [FK__tblEvents__userI__5812160E] FOREIGN KEY([userId])
REFERENCES [dbo].[tblUsers] ([userId])
GO
ALTER TABLE [dbo].[tblEvents] CHECK CONSTRAINT [FK__tblEvents__userI__5812160E]
GO
ALTER TABLE [dbo].[tblFollowedEvent]  WITH CHECK ADD  CONSTRAINT [FK__tblFollow__event__76969D2E] FOREIGN KEY([eventId])
REFERENCES [dbo].[tblEvents] ([eventId])
GO
ALTER TABLE [dbo].[tblFollowedEvent] CHECK CONSTRAINT [FK__tblFollow__event__76969D2E]
GO
ALTER TABLE [dbo].[tblFollowedEvent]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[tblUsers] ([userId])
GO
ALTER TABLE [dbo].[tblParticipants]  WITH CHECK ADD  CONSTRAINT [FK__tblPartic__event__29221CFB] FOREIGN KEY([eventId])
REFERENCES [dbo].[tblEvents] ([eventId])
GO
ALTER TABLE [dbo].[tblParticipants] CHECK CONSTRAINT [FK__tblPartic__event__29221CFB]
GO
ALTER TABLE [dbo].[tblParticipants]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[tblUsers] ([userId])
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[tblRoles] ([roleId])
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD FOREIGN KEY([statusId])
REFERENCES [dbo].[tblStatusUser] ([statusId])
GO
USE [master]
GO
ALTER DATABASE [FPTEventManagement] SET  READ_WRITE 
GO
