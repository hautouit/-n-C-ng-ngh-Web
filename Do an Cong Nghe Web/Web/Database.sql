USE [master]
GO
/****** Object:  Database [QUANLYBANDIENTHOAI]    Script Date: 12/23/2018 4:34:34 PM ******/
CREATE DATABASE [QUANLYBANDIENTHOAI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QUANLYBANDIENTHOAI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\QUANLYBANDIENTHOAI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QUANLYBANDIENTHOAI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\QUANLYBANDIENTHOAI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QUANLYBANDIENTHOAI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET ARITHABORT OFF 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET RECOVERY FULL 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET  MULTI_USER 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QUANLYBANDIENTHOAI', N'ON'
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET QUERY_STORE = OFF
GO
USE [QUANLYBANDIENTHOAI]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 12/23/2018 4:34:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [varchar](12) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[ModifedBy] [nvarchar](50) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 12/23/2018 4:34:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaDH] [int] NOT NULL,
	[MaDT] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC,
	[MaDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DienThoai]    Script Date: 12/23/2018 4:34:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DienThoai](
	[MaDT] [int] IDENTITY(1,1) NOT NULL,
	[TenDT] [nvarchar](50) NULL,
	[GiaBan] [decimal](18, 0) NULL,
	[GioiThieu] [nvarchar](max) NULL,
	[MoTaChiTiet] [nvarchar](max) NULL,
	[AnhBia] [nvarchar](max) NULL,
	[NgayCapNhat] [datetime] NULL,
	[SoLuongTon] [int] NULL,
	[MaHSX] [int] NULL,
	[Moi] [bit] NULL,
 CONSTRAINT [PK_DienThoai] PRIMARY KEY CLUSTERED 
(
	[MaDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 12/23/2018 4:34:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDH] [int] IDENTITY(1,1) NOT NULL,
	[DaThanhToan] [nvarchar](50) NULL,
	[TinhTrangGH] [int] NULL,
	[NgayDat] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[MaKH] [int] NULL,
	[NguoiNhan] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[SoDT] [varchar](12) NULL,
	[DiaChi] [nvarchar](100) NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangSanXuat]    Script Date: 12/23/2018 4:34:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangSanXuat](
	[MaHSX] [int] IDENTITY(1,1) NOT NULL,
	[TenHSX] [nvarchar](50) NULL,
	[LienHe] [nvarchar](200) NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_HangSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaHSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/23/2018 4:34:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[TaiKhoan] [varchar](50) NULL,
	[MatKhau] [varchar](50) NULL,
	[XacNhanMK] [varchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[DienThoai] [varchar](15) NULL,
	[GioiTinh] [nvarchar](3) NULL,
	[NgaySinh] [datetime] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifedBy], [Status]) VALUES (1010, N'admin', N'202cb962ac59075b964b07152d234b70', N'to cong hau', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Admin] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifedBy], [Status]) VALUES (1011, N'admin12', N'e10adc3949ba59abbe56e057f20f883e', N'hau to', N'69/12T Duong 120, Phuong Tan Phu, Quan 9', N'toconghauh@gmail.com', N'01697596861', NULL, NULL, N'tô công hậu', 1)
SET IDENTITY_INSERT [dbo].[Admin] OFF
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (1, 16, 3, CAST(360000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (5, 1, 2, CAST(43990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (5, 6, 1, CAST(15990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (6, 6, 1, CAST(15990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (7, 2, 2, CAST(27990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (8, 17, 1, CAST(1250000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (9, 17, 3, CAST(1250000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (10, 7, 1, CAST(3490000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (11, 6, 1, CAST(15990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (12, 7, 1, CAST(3490000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (13, 2, 1, CAST(27990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (14, 2, 1, CAST(27990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (14, 17, 1, CAST(1250000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (15, 3, 1, CAST(18990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (16, 3, 1, CAST(18990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (16, 16, 2, CAST(360000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (17, 7, 1, CAST(3490000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (18, 1, 1, CAST(43990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (18, 7, 1, CAST(3490000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (18, 16, 1, CAST(360000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (19, 1, 1, CAST(43990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (19, 7, 1, CAST(3490000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (19, 16, 1, CAST(360000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (20, 1, 1, CAST(43990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (21, 1, 1, CAST(43990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (21, 6, 1, CAST(15990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (22, 16, 2, CAST(360000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (23, 16, 2, CAST(360000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (23, 17, 1, CAST(1250000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (24, 6, 1, CAST(15990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (25, 1, 1, CAST(43990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (26, 1, 2, CAST(43990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (27, 1, 2, CAST(43990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (29, 7, 1, CAST(3490000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (29, 17, 1, CAST(1250000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (30, 6, 1, CAST(15990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (31, 1, 1, CAST(43990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (31, 4, 2, CAST(6990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDH], [MaDT], [SoLuong], [DonGia]) VALUES (43, 5, 1, CAST(28490000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[DienThoai] ON 

INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (1, N'iPhone Xs Max 512GB', CAST(43990000 AS Decimal(18, 0)), N'Là chiếc smartphone cao cấp nhất của Apple với mức giá khủng chưa từng có, bộ nhớ trong lên tới 512GB, iPhone XS Max 512GB - sở hữu cái tên khác biệt so với các thế hệ trước, trang bị tới 6.5 inch đầu tiên của hãng cùng các thiết kế cao cấp hiện đại từ chip A12 cho tới camera AI', N'Màn hình
Công nghệ màn hình	OLED
Độ phân giải	1242 x 2688 Pixels
Màn hình rộng	6.5"
Mặt kính cảm ứng	Kính oleophobic (ion cường lực)
Camera sau
Độ phân giải	2 camera 12 MP
Quay phim	Quay phim FullHD 1080p@30fps, Quay phim FullHD 1080p@60fps, Quay phim FullHD 1080p@120fps, Quay phim FullHD 1080p@240fps, Quay phim 4K 2160p@24fps, Quay phim 4K 2160p@30fps, Quay phim 4K 2160p@60fps
Đèn Flash	4 đèn LED (2 tông màu)
Chụp ảnh nâng cao	Zoom quang học (Camera kép), Chụp ảnh xóa phông, Chế độ Slow Motion, Chế độ chụp ban đêm (ánh sáng yếu), A.I Camera, Điều chỉnh khẩu độ, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS)
Camera trước
Độ phân giải	7 MP
Videocall	Có
Thông tin khác	Selfie ngược sáng HDR, Camera góc rộng, Nhận diện khuôn mặt, Quay video Full HD
Hệ điều hành - CPU
Hệ điều hành	iOS 12
Chipset (hãng SX CPU)	Apple A12 Bionic 6 nhân
Tốc độ CPU	Đang cập nhật
Chip đồ họa (GPU)	Apple GPU 4 nhân
Bộ nhớ & Lưu trữ
RAM	4 GB
Bộ nhớ trong	512 GB
Bộ nhớ còn lại (khả dụng)	Đang cập nhật
Thẻ nhớ ngoài	Không
Kết nối
Mạng di động	Hỗ trợ 4G
SIM	Nano SIM & eSIM
Wifi	Wi-Fi 802.11 a/b/g/n/ac, Dual-band, Wi-Fi hotspot
GPS	A-GPS, GLONASS
Bluetooth	LE, A2DP, v5.0
Cổng kết nối/sạc	Lightning
Jack tai nghe	Không
Kết nối khác	NFC, OTG
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối
Chất liệu	Khung thép không gỉ + mặt kính cường lực
Kích thước	Dài 157.5 mm - Ngang 77.4 mm - Dày 7.7 mm
Trọng lượng	208 g
Thông tin pin & Sạc
Dung lượng pin	3174 mAh
Loại pin	Pin chuẩn Li-Ion
Công nghệ pin	Tiết kiệm pin, Sạc pin nhanh, Sạc pin không dây
Tiện ích
Bảo mật nâng cao	Nhận diện khuôn mặt Face ID
Tính năng đặc biệt	Chuẩn Kháng nước, Chuẩn kháng bụi
Sạc pin nhanh
Apple Pay
3D Touch
Ghi âm	Có, microphone chuyên dụng chống ồn
Radio	Không
Xem phim	H.265, 3GP, MP4, AVI, WMV, H.263, H.264(MPEG4-AVC)
Nghe nhạc	Lossless, Midi, MP3, WAV, WMA9, WMA, AAC, AAC+, AAC++, eAAC+
Thông tin khác
Thời điểm ra mắt	11/2018', N'1.png', CAST(N'2018-02-02T00:00:00.000' AS DateTime), 100, 1, 1)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (2, N'iPhone X 256GB Silver', CAST(27990000 AS Decimal(18, 0)), N'Là phiên bản kỉ niệm của Apple nhân dịp 10 năm ra đời iPhone đầu tiên, iPhone X đã chính thức ra mắt vào ngày 12/9 với nhiều tính năng đột phá như màn hình tai thỏ Super Retina cực mỏng, nhận diện khuôn mặt Face ID, sạc pin nhanh hay sạc không dây cao cấp.', N'Màn hình
Công nghệ màn hình	OLED
Độ phân giải	1125 x 2436 Pixels
Màn hình rộng	5.8"
Mặt kính cảm ứng	Kính oleophobic (ion cường lực)
Camera sau
Độ phân giải	2 camera 12 MP
Quay phim	Quay phim 4K 2160p@60fps
Đèn Flash	4 đèn LED (2 tông màu)
Chụp ảnh nâng cao	Lấy nét dự đoán, Chụp ảnh xóa phông, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS)
Camera trước
Độ phân giải	7 MP
Videocall	Có
Thông tin khác	Selfie ngược sáng HDR, Camera góc rộng, Quay video Full HD, Nhận diện khuôn mặt
Hệ điều hành - CPU
Hệ điều hành	iOS 11
Chipset (hãng SX CPU)	Apple A11 Bionic 6 nhân
Tốc độ CPU	2.39 GHz
Chip đồ họa (GPU)	Apple GPU 3 nhân
Bộ nhớ & Lưu trữ
RAM	3 GB
Bộ nhớ trong	256 GB
Bộ nhớ còn lại (khả dụng)	Khoảng 249 GB
Thẻ nhớ ngoài	Không
Kết nối
Mạng di động	3G, 4G LTE Cat 16
SIM	1 Nano SIM
Wifi	Wi-Fi 802.11 a/b/g/n/ac, Dual-band, Wi-Fi hotspot
GPS	A-GPS, GLONASS
Bluetooth	EDR, LE, A2DP, v5.0
Cổng kết nối/sạc	Lightning
Jack tai nghe	Không
Kết nối khác	NFC, OTG
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối
Chất liệu	Khung kim loại + mặt kính cường lực
Kích thước	Dài 143.6 mm - Ngang 70.9 mm - Dày 7.7 mm
Trọng lượng	174 g
Thông tin pin & Sạc
Dung lượng pin	2716 mAh
Loại pin	Pin chuẩn Li-Ion
Công nghệ pin	Tiết kiệm pin, Sạc pin nhanh, Sạc pin không dây
Tiện ích
Bảo mật nâng cao	Nhận diện khuôn mặt Face ID
Tính năng đặc biệt	3D Touch
Ghi âm	Có, microphone chuyên dụng chống ồn
Radio	Không
Xem phim	H.265, 3GP, MP4, AVI, WMV, H.263, H.264(MPEG4-AVC)
Nghe nhạc	Midi, Lossless, MP3, WAV, WMA, WMA9, AAC, AAC+, AAC++, eAAC+
Thông tin khác
Thời điểm ra mắt	09/2017', N'2.png', CAST(N'2018-03-03T00:00:00.000' AS DateTime), 100, 1, 0)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (3, N'iPhone 8 256GB', CAST(18990000 AS Decimal(18, 0)), N'Theo truyền thống, tiếp sau chiếc iPhone 7 thì Apple sẽ cho ra mắt chiếc iPhone 7s nhưng năm nay "táo khuyết" đã tạo ra ngoại lệ khi giới thiệu đến người dùng chiếc iPhone 8 không có nhiều thay đổi về ngoại hình nhưng có sự cải tiến về hiệu năng.', N'Màn hình
Công nghệ màn hình	LED-backlit IPS LCD
Độ phân giải	HD (750 x 1334 Pixels)
Màn hình rộng	4.7"
Mặt kính cảm ứng	Kính oleophobic (ion cường lực)
Camera sau
Độ phân giải	12 MP
Quay phim	Quay phim 4K 2160p@60fps
Đèn Flash	4 đèn LED (2 tông màu)
Chụp ảnh nâng cao	Lấy nét dự đoán, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS)
Camera trước
Độ phân giải	7 MP
Videocall	Có
Thông tin khác	Selfie ngược sáng HDR, Camera góc rộng, Quay video Full HD, Nhận diện khuôn mặt
Hệ điều hành - CPU
Hệ điều hành	iOS 11
Chipset (hãng SX CPU)	Apple A11 Bionic 6 nhân
Tốc độ CPU	2 nhân 2.1 GHz Monsoon và 4 nhân 2.1 GHz Mistral
Chip đồ họa (GPU)	Apple GPU 3 nhân
Bộ nhớ & Lưu trữ
RAM	2 GB
Bộ nhớ trong	256 GB
Bộ nhớ còn lại (khả dụng)	Khoảng 249 GB
Thẻ nhớ ngoài	Không
Kết nối
Mạng di động	3G, 4G LTE Cat 16
SIM	1 Nano SIM
Wifi	Wi-Fi 802.11 a/b/g/n/ac, Dual-band, Wi-Fi hotspot
GPS	A-GPS, GLONASS
Bluetooth	EDR, A2DP, LE, v5.0
Cổng kết nối/sạc	Lightning
Jack tai nghe	Không
Kết nối khác	NFC, OTG
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối
Chất liệu	Khung kim loại + mặt kính cường lực
Kích thước	Dài 138.4 mm - Ngang 67.3 mm - Dày 7.3 mm
Trọng lượng	148 g
Thông tin pin & Sạc
Dung lượng pin	1821 mAh
Loại pin	Pin chuẩn Li-Ion
Công nghệ pin	Tiết kiệm pin, Sạc pin nhanh, Sạc pin không dây
Tiện ích
Bảo mật nâng cao	Mở khóa bằng vân tay
Tính năng đặc biệt	3D Touch
Ghi âm	Có, microphone chuyên dụng chống ồn
Radio	Không
Xem phim	H.265, 3GP, MP4, AVI, WMV, H.263, H.264(MPEG4-AVC)
Nghe nhạc	Lossless, Midi, MP3, WAV, WMA, WMA9, AAC, AAC+, AAC++, eAAC+
Thông tin khác
Thời điểm ra mắt	09/2017', N'3.png', CAST(N'2018-03-05T00:00:00.000' AS DateTime), 50, 1, 0)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (4, N'iPhone 6 32GB', CAST(6990000 AS Decimal(18, 0)), N'iPhone 6 là một trong những smartphone được yêu thích nhất của Apple. Lắng nghe nhu cầu về thiết kế, khả năng lưu trữ và giá cả, iPhone 6 32GB được chính thức phân phối chính hãng tại Việt Nam hứa hẹn sẽ là một sản phẩm rất "Hot".', N'Màn hình
Công nghệ màn hình	LED-backlit IPS LCD
Độ phân giải	HD (750 x 1334 Pixels)
Màn hình rộng	4.7"
Mặt kính cảm ứng	Kính oleophobic (ion cường lực)
Camera sau
Độ phân giải	8 MP
Quay phim	Quay phim FullHD 1080p@60fps
Đèn Flash	Có
Chụp ảnh nâng cao	Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama
Camera trước
Độ phân giải	1.2 MP
Videocall	Có
Thông tin khác	Tự động lấy nét
Hệ điều hành - CPU
Hệ điều hành	iOS 11
Chipset (hãng SX CPU)	Apple A8 2 nhân 64-bit
Tốc độ CPU	1.4 GHz
Chip đồ họa (GPU)	PowerVR GX6450
Bộ nhớ & Lưu trữ
RAM	1 GB
Bộ nhớ trong	32 GB
Bộ nhớ còn lại (khả dụng)	Khoảng 26 GB
Thẻ nhớ ngoài	Không
Kết nối
Mạng di động	3G, 4G LTE Cat 4
SIM	1 Nano SIM
Wifi	Wi-Fi 802.11 a/b/g/n/ac, Dual-band, Wi-Fi Direct, Wi-Fi hotspot
GPS	Có, A-GPS
Bluetooth	A2DP, V4.0
Cổng kết nối/sạc	Lightning
Jack tai nghe	3.5 mm
Kết nối khác	Air Play, OTG, HDMI
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối
Chất liệu	Hợp kim nhôm
Kích thước	Dài 138.1 mm - Ngang 67 mm - Dày 6.9 mm
Trọng lượng	124 g
Thông tin pin & Sạc
Dung lượng pin	1810 mAh
Loại pin	Pin chuẩn Li-Po
Công nghệ pin	Tiết kiệm pin
Tiện ích
Bảo mật nâng cao	Mở khóa bằng vân tay
Tính năng đặc biệt	Mặt kính 2.5D
Ghi âm	Có
Radio	Không
Xem phim	3GP, MP4, AVI, WMV
Nghe nhạc	Lossless, MP3, WAV, WMA
Thông tin khác
Thời điểm ra mắt	3/2017', N'4.png', CAST(N'2018-03-06T00:00:00.000' AS DateTime), 20, 1, 0)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (5, N'Samsung Galaxy Note 9 512GB', CAST(28490000 AS Decimal(18, 0)), N'Sau thành công vang dội của Galaxy Note 8 thì Samsung chính thức giới thiệu phiên bản tiếp theo tới người dùng cái tên Samsung Galaxy Note 9 mang trong mình hàng hoạt các thay đổi đột phá với điểm nhấn đặc biệt đến từ chiếc bút S-Pen thần thánh cùng một viên pin dung lượng khổng lồ tới 4.000 mAh.', N'Màn hình
Công nghệ màn hình	Super AMOLED
Độ phân giải	2K+ (1440 x 2960 Pixels)
Màn hình rộng	6.4"
Mặt kính cảm ứng	Corning Gorilla Glass 5
Camera sau
Độ phân giải	2 camera 12 MP
Quay phim	Quay phim siêu chậm 960 fps, Quay phim FullHD 1080p@240fps, Quay phim 4K 2160p@60fps
Đèn Flash	Có
Chụp ảnh nâng cao	Zoom quang học (Camera kép), Chụp ảnh xóa phông, Chế độ Slow Motion, A.I Camera, Điều chỉnh khẩu độ, Super Slow motion (quay siêu chậm), Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS), Beautify, Chế độ chụp chuyên nghiệp
Camera trước
Độ phân giải	8 MP
Videocall	Hỗ trợ VideoCall thông qua ứng dụng
Thông tin khác	Camera góc rộng, Tự động lấy nét, Quay video Full HD, Nhận diện khuôn mặt, Chế độ làm đẹp
Hệ điều hành - CPU
Hệ điều hành	Android 8.1 (Oreo)
Chipset (hãng SX CPU)	Exynos 9810 8 nhân 64 bit
Tốc độ CPU	4 nhân 2.7 GHz Mongoose M3 & 4 nhân 1.8 GHz Cortex-A55
Chip đồ họa (GPU)	Mali-G72 MP18
Bộ nhớ & Lưu trữ
RAM	8 GB
Bộ nhớ trong	512 GB
Bộ nhớ còn lại (khả dụng)	Đang cập nhật
Thẻ nhớ ngoài	MicroSD, hỗ trợ tối đa 512 GB
Kết nối
Mạng di động	Hỗ trợ 4G
SIM	2 SIM Nano (SIM 2 chung khe thẻ nhớ)
Wifi	Wi-Fi 802.11 a/b/g/n/ac, Dual-band, Wi-Fi Direct, Wi-Fi hotspot
GPS	BDS, A-GPS, GLONASS
Bluetooth	apt-X, LE, A2DP, v5.0
Cổng kết nối/sạc	USB Type-C
Jack tai nghe	3.5 mm
Kết nối khác	NFC, OTG, Miracast
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối
Chất liệu	Khung kim loại + mặt kính cường lực
Kích thước	Dài 161.9 mm - Ngang 76.4 mm - Dày 8.8 mm
Trọng lượng	201 g
Thông tin pin & Sạc
Dung lượng pin	4000 mAh
Loại pin	Pin chuẩn Li-Ion
Công nghệ pin	Tiết kiệm pin, Siêu tiết kiệm pin, Sạc pin nhanh
Tiện ích
Bảo mật nâng cao	Mở khóa bằng vân tay, Mở khóa bằng khuôn mặt, Quét mống mắt
Tính năng đặc biệt	Chuẩn Kháng nước, Chuẩn kháng bụi
Chặn cuộc gọi
Chặn tin nhắn
Mặt kính 2.5D
Màn hình luôn hiển thị AOD
Sạc pin nhanh
Đèn pin
Tản nhiệt nước carbon
Samsung Pay
Trợ lý ảo Samsung Bixby
Ghi âm	Có, microphone chuyên dụng chống ồn
Radio	Không
Xem phim	H.265, 3GP, MP4, AVI, H.263, H.264(MPEG4-AVC), DivX, Xvid
Nghe nhạc	AMR, Midi, MP3, WAV, AAC++, eAAC+, FLAC
Thông tin khác
Thời điểm ra mắt	08/2018', N'5.png', CAST(N'2018-03-07T00:00:00.000' AS DateTime), 100, 2, 0)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (6, N'Samsung Galaxy Note 8', CAST(15990000 AS Decimal(18, 0)), N'Galaxy Note 8 là niềm hy vọng vực lại dòng Note danh tiếng của điện thoại Samsung với diện mạo nam tính, sang trọng. Máy trang bị camera kép xóa phông thời thượng, màn hình vô cực như trên S8 Plus, bút S Pen cùng nhiều tính năng mới và nhiều công nghệ được ưu ái.', N'Màn hình
Công nghệ màn hình	Super AMOLED
Độ phân giải	2K+ (1440 x 2960 Pixels)
Màn hình rộng	6.3"
Mặt kính cảm ứng	Corning Gorilla Glass 5
Camera sau
Độ phân giải	2 camera 12 MP
Quay phim	Quay phim 4K 2160p@30fps
Đèn Flash	Có
Chụp ảnh nâng cao	Zoom quang học (Camera kép), Chụp ảnh xóa phông, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS), Chế độ chụp chuyên nghiệp
Camera trước
Độ phân giải	8 MP
Videocall	Có
Thông tin khác	Selfie ngược sáng HDR, Camera góc rộng, Chế độ làm đẹp, Nhận diện khuôn mặt, Selfie bằng cử chỉ, Chụp bằng giọng nói
Hệ điều hành - CPU
Hệ điều hành	Android 7.1 (Nougat)
Chipset (hãng SX CPU)	Exynos 8895 8 nhân 64-bit
Tốc độ CPU	4 nhân 2.3 GHz và 4 nhân 1.7 GHz
Chip đồ họa (GPU)	Mali-G71 MP20
Bộ nhớ & Lưu trữ
RAM	6 GB
Bộ nhớ trong	64 GB
Bộ nhớ còn lại (khả dụng)	Khoảng 50 GB
Thẻ nhớ ngoài	MicroSD, hỗ trợ tối đa 256 GB
Kết nối
Mạng di động	3G, 4G LTE Cat 16
SIM	2 Nano SIM
Wifi	Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot
GPS	A-GPS, GLONASS
Bluetooth	apt-X, A2DP, LE, EDR, v5.0
Cổng kết nối/sạc	USB Type-C
Jack tai nghe	3.5 mm
Kết nối khác	NFC, Kết nối nhanh™, OTG, Miracast
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối
Chất liệu	Khung kim loại + mặt kính cường lực
Kích thước	Dài 162,5 mm - Ngang 74,8 mm - Dày 8,6 mm
Trọng lượng	195 g
Thông tin pin & Sạc
Dung lượng pin	3300 mAh
Loại pin	Pin chuẩn Li-Ion
Công nghệ pin	Siêu tiết kiệm pin, Sạc pin nhanh, Sạc pin không dây
Tiện ích
Bảo mật nâng cao	Mở khóa bằng vân tay, Mở khóa bằng khuôn mặt, Quét mống mắt
Tính năng đặc biệt	Chuẩn Kháng nước, Chuẩn kháng bụi
Ghi âm	Có, microphone chuyên dụng chống ồn
Radio	Không
Xem phim	H.265, 3GP, MP4, AVI, WMV, H.264(MPEG4-AVC), DivX, WMV9, Xvid
Nghe nhạc	Lossless, Midi, MP3, WAV, WMA, AAC++, eAAC+, OGG, AC3, FLAC
Thông tin khác
Thời điểm ra mắt	08/2017', N'6.png', CAST(N'2018-03-08T00:00:00.000' AS DateTime), 50, 2, 1)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (7, N'Samsung Galaxy J4', CAST(3490000 AS Decimal(18, 0)), N'Đặc điểm nổi bật của Samsung Galaxy J4

Tìm hiểu thêm
Bộ sản phẩm chuẩn: Hộp, Pin, Sạc, Tai nghe, Sách hướng dẫn

Samsung Galaxy J4 là cái tên tiếp theo thuộc dòng J mà Samsung mới ra mắt với một số tính năng nổi bật nhằm cạnh tranh với các đối thủ trong phân khúc smartphone giá rẻ.', N'Màn hình
Công nghệ màn hình	Super AMOLED
Độ phân giải	HD (720 x 1280 Pixels)
Màn hình rộng	5.5"
Mặt kính cảm ứng	Mặt kính cong 2.5D
Camera sau
Độ phân giải	13 MP
Quay phim	Quay phim FullHD 1080p@30fps
Đèn Flash	Có
Chụp ảnh nâng cao	Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama
Camera trước
Độ phân giải	5 MP
Videocall	Hỗ trợ VideoCall thông qua ứng dụng
Thông tin khác	Chế độ làm đẹp, Đèn Flash trợ sáng, Tự động lấy nét
Hệ điều hành - CPU
Hệ điều hành	Android 8.0 (Oreo)
Chipset (hãng SX CPU)	Exynos 7570 4 nhân 64-bit
Tốc độ CPU	Quad-core 1.4 GHz
Chip đồ họa (GPU)	Mali-T720
Bộ nhớ & Lưu trữ
RAM	2 GB
Bộ nhớ trong	16 GB
Bộ nhớ còn lại (khả dụng)	Khoảng 9 GB
Thẻ nhớ ngoài	MicroSD, hỗ trợ tối đa 256 GB
Kết nối
Mạng di động	Hỗ trợ 4G
SIM	2 Micro SIM
Wifi	Wi-Fi 802.11 b/g/n, Wi-Fi Direct, Wi-Fi hotspot
GPS	A-GPS, GLONASS
Bluetooth	LE, A2DP, v4.2
Cổng kết nối/sạc	Micro USB
Jack tai nghe	3.5 mm
Kết nối khác	USB 2.0
Thiết kế & Trọng lượng
Thiết kế	Pin rời
Chất liệu	Nhựa
Kích thước	Dài 151.7 mm - Ngang 77.2 mm - Dày 8.1 mm
Trọng lượng	175 g
Thông tin pin & Sạc
Dung lượng pin	3000 mAh
Loại pin	Pin chuẩn Li-Ion
Công nghệ pin	Tiết kiệm pin
Tiện ích
Bảo mật nâng cao	Không
Tính năng đặc biệt	Chặn tin nhắn
Chặn cuộc gọi
Đèn pin
Ghi âm	Có
Radio	Có
Xem phim	3GP, MP4, AVI, WMV
Nghe nhạc	Midi, AMR, MP3, WAV, WMA, AAC, OGG, FLAC
Thông tin khác
Thời điểm ra mắt	05/2018', N'7.png', CAST(N'2018-03-09T00:00:00.000' AS DateTime), 30, 2, 1)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (8, N'Samsung Galaxy A6', CAST(5490000 AS Decimal(18, 0)), N'Đặc điểm nổi bật của Samsung Galaxy A6 (2018)

Tìm hiểu thêm
Bộ sản phẩm chuẩn: Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cây lấy sim

Samsung Galaxy A6 (2018) là chiếc smartphone tầm trung vừa được ra mắt của Samsung bên cạnh chiếc Samsung Galaxy A6+ (2018).', N'Màn hình
Công nghệ màn hình	Super AMOLED
Độ phân giải	HD+ (720 × 1480 Pixels)
Màn hình rộng	5.6"
Mặt kính cảm ứng	Mặt kính cong 2.5D
Camera sau
Độ phân giải	16 MP
Quay phim	Quay phim FullHD 1080p@30fps
Đèn Flash	Có
Chụp ảnh nâng cao	Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Beautify
Camera trước
Độ phân giải	16 MP
Videocall	Có
Thông tin khác	Nhận diện khuôn mặt, Chế độ làm đẹp, Quay video Full HD, Đèn Flash trợ sáng, Camera góc rộng, Sticker AR (biểu tượng thực tế ảo), Tự động lấy nét
Hệ điều hành - CPU
Hệ điều hành	Android 8.0 (Oreo)
Chipset (hãng SX CPU)	Exynos 7870 8 nhân 64-bit
Tốc độ CPU	1.6 GHz
Chip đồ họa (GPU)	Mali-T830
Bộ nhớ & Lưu trữ
RAM	3 GB
Bộ nhớ trong	32 GB
Bộ nhớ còn lại (khả dụng)	Khoảng 21 GB
Thẻ nhớ ngoài	MicroSD, hỗ trợ tối đa 256 GB
Kết nối
Mạng di động	3G, 4G LTE Cat 6
SIM	2 Nano SIM
Wifi	Wi-Fi 802.11 b/g/n, Wi-Fi Direct, Wi-Fi hotspot
GPS	A-GPS, GLONASS
Bluetooth	A2DP, LE, EDR, v4.2
Cổng kết nối/sạc	Micro USB
Jack tai nghe	3.5 mm
Kết nối khác	OTG
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối
Chất liệu	Kim loại
Kích thước	Dài 149.9 mm - Ngang 70.8 mm - Dày 7.7 mm
Trọng lượng	162 g
Thông tin pin & Sạc
Dung lượng pin	3000 mAh
Loại pin	Pin chuẩn Li-Ion
Công nghệ pin	Tiết kiệm pin
Tiện ích
Bảo mật nâng cao	Mở khóa bằng vân tay, Mở khóa bằng khuôn mặt
Tính năng đặc biệt	Mặt kính 2.5D
Chặn tin nhắn
Chặn cuộc gọi
Đèn pin
Ghi âm	Có
Radio	Có
Xem phim	3GP, MP4, AVI, WMV
Nghe nhạc	Midi, AMR, MP3, WAV, WMA, AAC, OGG, FLAC
Thông tin khác
Thời điểm ra mắt	05/2018', N'8.png', CAST(N'2018-12-18T00:00:00.000' AS DateTime), 42, 2, 1)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (9, N'Samsung Galaxy A7 (2018) 128GB', CAST(8990000 AS Decimal(18, 0)), N'Được nâng cấp cả RAM và bộ nhớ trong, Samsung Galaxy A7 (2018) 128GB đem lại khả năng đa nhiệm, lưu trữ tốt hơn. Đồng thời đây cũng là chiếc smartphone đầu tiên của Samsung được trang bị tới 3 camera ở mặt sau và cảm biến vân tay cạnh bên.', N'Màn hình
Công nghệ màn hình	Super AMOLED
Độ phân giải	Full HD+ (1080 x 2220 Pixels)
Màn hình rộng	6.0"
Mặt kính cảm ứng	Kính cường lực Gorilla Glass 3
Camera sau
Độ phân giải	24 MP, 8 MP và 5 MP (3 camera)
Quay phim	Quay phim FullHD 1080p@30fps
Đèn Flash	Có
Chụp ảnh nâng cao	Chụp ảnh xóa phông, Chế độ Slow Motion, A.I Camera, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Beautify, Chế độ chụp chuyên nghiệp
Camera trước
Độ phân giải	24 MP
Videocall	Hỗ trợ VideoCall thông qua ứng dụng
Thông tin khác	Nhận diện khuôn mặt, Chế độ làm đẹp, Quay video Full HD, Tự động lấy nét, Đèn Flash trợ sáng, Camera góc rộng, Selfie ngược sáng HDR, Sticker AR (biểu tượng thực tế ảo), Quay video HD
Hệ điều hành - CPU
Hệ điều hành	Android 8.0 (Oreo)
Chipset (hãng SX CPU)	Exynos 7885 8 nhân 64-bit
Tốc độ CPU	2 nhân 2.2 GHz Cortex-A73 & 6 nhân 1.6 GHz Cortex-A53
Chip đồ họa (GPU)	Mali™ G71
Bộ nhớ & Lưu trữ
RAM	6 GB
Bộ nhớ trong	128 GB
Bộ nhớ còn lại (khả dụng)	Đang cập nhật
Thẻ nhớ ngoài	MicroSD, hỗ trợ tối đa 512 GB
Kết nối
Mạng di động	3G, 4G LTE Cat 6
SIM	2 Nano SIM
Wifi	Wi-Fi 802.11 a/b/g/n/ac, Wi-Fi Direct, Wi-Fi hotspot
GPS	A-GPS, GLONASS
Bluetooth	LE, A2DP, v5.0
Cổng kết nối/sạc	Micro USB
Jack tai nghe	3.5 mm
Kết nối khác	NFC
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối
Chất liệu	Khung kim loại + mặt lưng nhựa giả kính
Kích thước	Dài 159.8 mm - Ngang 76.8 mm - Dày 7.5 mm
Trọng lượng	168 g
Thông tin pin & Sạc
Dung lượng pin	3300 mAh
Loại pin	Pin chuẩn Li-Ion
Công nghệ pin	Tiết kiệm pin
Tiện ích
Bảo mật nâng cao	Mở khóa bằng vân tay, Mở khóa bằng khuôn mặt
Tính năng đặc biệt	Nhân bản ứng dụng
Trợ lý ảo Samsung Bixby
Màn hình luôn hiển thị AOD
Mặt kính 2.5D
Chặn tin nhắn
Chặn cuộc gọi
Đèn pin
Dolby Audio™
Ghi âm cuộc gọi
Ghi âm	Có, microphone chuyên dụng chống ồn
Radio	Có
Xem phim	3GP, MP4, AVI, WMV
Nghe nhạc	AMR, Midi, MP3, WAV, WMA, AAC, OGG, FLAC
Thông tin khác
Thời điểm ra mắt	10/2018', N'9.png', CAST(N'2018-03-04T00:00:00.000' AS DateTime), 24, 2, 1)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (10, N'Samsung Galaxy A8 Star', CAST(12590000 AS Decimal(18, 0)), N'Samsung Galaxy A8 Star là một biến thể mới của dòng A trong gia đình Samsung với sự nâng cấp vượt trội về camera cũng như thay đổi trong thiết kế.', N'Màn hình
Công nghệ màn hình	Super AMOLED
Độ phân giải	Full HD+ (1080 x 2220 Pixels)
Màn hình rộng	6.3"
Mặt kính cảm ứng	Kính cường lực Gorilla Glass
Camera sau
Độ phân giải	24 MP và 16 MP (2 camera)
Quay phim	Quay phim FullHD 1080p@30fps, Quay phim 4K 2160p@30fps
Đèn Flash	Có
Chụp ảnh nâng cao	Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Beautify
Camera trước
Độ phân giải	24 MP
Videocall	Hỗ trợ VideoCall thông qua ứng dụng
Thông tin khác	Nhận diện khuôn mặt, Chế độ làm đẹp, Quay video Full HD, Selfie ngược sáng HDR
Hệ điều hành - CPU
Hệ điều hành	Android 8.0 (Oreo)
Chipset (hãng SX CPU)	Qualcomm Snapdragon 660 8 nhân
Tốc độ CPU	4 nhân 2.2 GHz & 4 nhân 1.8 GHz
Chip đồ họa (GPU)	Adreno 512
Bộ nhớ & Lưu trữ
RAM	4 GB
Bộ nhớ trong	64 GB
Bộ nhớ còn lại (khả dụng)	Khoảng 48 GB
Thẻ nhớ ngoài	MicroSD, hỗ trợ tối đa 400 GB
Kết nối
Mạng di động	3G, 4G LTE Cat 6
SIM	2 Nano SIM
Wifi	Wi-Fi 802.11 a/b/g/n/ac, Dual-band, Wi-Fi Direct, Wi-Fi hotspot
GPS	BDS, A-GPS, GLONASS
Bluetooth	LE, A2DP, v5.0
Cổng kết nối/sạc	USB Type-C
Jack tai nghe	3.5 mm
Kết nối khác	NFC
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối
Chất liệu	Kim loại
Kích thước	Dài 162.4 mm - Ngang 77 mm - Dày 7.6 mm
Trọng lượng	191 g
Thông tin pin & Sạc
Dung lượng pin	3700 mAh
Loại pin	Pin chuẩn Li-Ion
Công nghệ pin	Tiết kiệm pin, Siêu tiết kiệm pin, Sạc pin nhanh
Tiện ích
Bảo mật nâng cao	Mở khóa bằng vân tay, Mở khóa bằng khuôn mặt
Tính năng đặc biệt	Đèn pin
Chặn cuộc gọi
Chặn tin nhắn
Mặt kính 2.5D
Ghi âm	Có, microphone chuyên dụng chống ồn
Radio	Có
Xem phim	H.265, 3GP, MP4, AVI, H.263, H.264(MPEG4-AVC)
Nghe nhạc	Lossless, Midi, MP3, WAV, WMA
Thông tin khác
Thời điểm ra mắt	06/2018', N'10.png', CAST(N'2018-03-04T00:00:00.000' AS DateTime), 15, 2, 1)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (11, N'OPPO F9 6GB', CAST(8490000 AS Decimal(18, 0)), N'Là chiếc điện thoại OPPO được nâng cấp cấu hình, cụ thể là RAM lên tới 6 GB, OPPO F9 6GB còn trang bị nhiều tính năng đột phá như sở hữu công nghệ sạc VOOC mới nhất, mặt lưng chuyển màu độc đáo, màn hình tràn viền giọt nước và camera chụp chân dung tích hợp trí tuệ nhân tạo A.I hoàn hảo.', N'Màn hình
Công nghệ màn hình	LTPS LCD
Độ phân giải	Full HD+ (1080 x 2340 Pixels)
Màn hình rộng	6.3"
Mặt kính cảm ứng	Kính cường lực
Camera sau
Độ phân giải	16 MP và 2 MP (2 camera)
Quay phim	Quay phim HD 720p@24fps, Quay phim FullHD 1080p@30fps
Đèn Flash	Có
Chụp ảnh nâng cao	Chụp ảnh xóa phông, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Beautify
Camera trước
Độ phân giải	25 MP
Videocall	Hỗ trợ VideoCall thông qua ứng dụng
Thông tin khác	Sticker AR (biểu tượng thực tế ảo), Nhận diện khuôn mặt, Quay video Full HD, Công nghệ Selfie A.I Beauty
Hệ điều hành - CPU
Hệ điều hành	ColorOS 5.2 (Android 8.1)
Chipset (hãng SX CPU)	MediaTek Helio P60 8 nhân 64-bit
Tốc độ CPU	2.0 GHz
Chip đồ họa (GPU)	Mali-G72 MP3
Bộ nhớ & Lưu trữ
RAM	6 GB
Bộ nhớ trong	64 GB
Bộ nhớ còn lại (khả dụng)	Khoảng 50 GB
Thẻ nhớ ngoài	MicroSD, hỗ trợ tối đa 256 GB
Kết nối
Mạng di động	Hỗ trợ 4G
SIM	2 Nano SIM
Wifi	Wi-Fi 802.11 a/b/g/n/ac, DLNA, Wi-Fi Direct, Wi-Fi hotspot
GPS	A-GPS, GLONASS
Bluetooth	A2DP, LE, v4.2
Cổng kết nối/sạc	Micro USB
Jack tai nghe	3.5 mm
Kết nối khác	OTG
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối
Chất liệu	Nhựa
Kích thước	Dài 156 mm - Ngang 75.3 mm - Dày 7.8 mm
Trọng lượng	158 g
Thông tin pin & Sạc
Dung lượng pin	3500 mAh
Loại pin	Pin chuẩn Li-Po
Công nghệ pin	Tiết kiệm pin, Sạc nhanh VOOC
Tiện ích
Bảo mật nâng cao	Mở khóa bằng vân tay, Mở khóa bằng khuôn mặt
Tính năng đặc biệt	Chặn tin nhắn
Ghi âm cuộc gọi
Chặn cuộc gọi
Mặt kính 2.5D
Ghi âm	Có, microphone chuyên dụng chống ồn
Radio	Có
Xem phim	MP4, H.263, H.264(MPEG4-AVC)
Nghe nhạc	MP3, WAV, eAAC+, FLAC
Thông tin khác
Thời điểm ra mắt	08/2018', N'11.png', CAST(N'2018-12-19T00:00:00.000' AS DateTime), 23, 3, 1)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (12, N'OPPO A71k', CAST(2690000 AS Decimal(18, 0)), N'Phiên bản OPPO A71k (2018) ra mắt với vi xử lý Snapdragon 450 mạnh mẽ hơn, chụp ảnh selfie làm đẹp bằng AI thông minh và giá rẻ hơn, đổi lại bộ nhớ RAM giảm xuống còn 2 GB.', N'Màn hình
Công nghệ màn hình	IPS TFT
Độ phân giải	HD (720 x 1280 Pixels)
Màn hình rộng	5.2"
Mặt kính cảm ứng	Mặt kính cong 2.5D
Camera sau
Độ phân giải	13 MP
Quay phim	Quay phim FullHD 1080p@30fps
Đèn Flash	Có
Chụp ảnh nâng cao	Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama
Camera trước
Độ phân giải	5 MP
Videocall	Hỗ trợ VideoCall thông qua ứng dụng
Thông tin khác	Chế độ làm đẹp, Nhận diện khuôn mặt, Công nghệ Selfie A.I Beauty
Hệ điều hành - CPU
Hệ điều hành	ColorOS 3.2 (Android 7.1)
Chipset (hãng SX CPU)	Qualcomm Snapdragon 450 8 nhân 64-bit
Tốc độ CPU	1.8 GHz
Chip đồ họa (GPU)	Adreno 506
Bộ nhớ & Lưu trữ
RAM	2 GB
Bộ nhớ trong	16 GB
Bộ nhớ còn lại (khả dụng)	Khoảng 8 GB
Thẻ nhớ ngoài	MicroSD, hỗ trợ tối đa 256 GB
Kết nối
Mạng di động	Hỗ trợ 4G
SIM	2 Nano SIM
Wifi	Wi-Fi 802.11 b/g/n, Wi-Fi Direct, Wi-Fi hotspot
GPS	A-GPS, GLONASS
Bluetooth	LE, EDR, v4.2
Cổng kết nối/sạc	Micro USB
Jack tai nghe	3.5 mm
Kết nối khác	OTG
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối
Chất liệu	Nhựa
Kích thước	Dài 148.1 mm - Ngang 73.8 mm - Dày 7.6 mm
Trọng lượng	137 g
Thông tin pin & Sạc
Dung lượng pin	3000 mAh
Loại pin	Pin chuẩn Li-Ion
Công nghệ pin	Tiết kiệm pin
Tiện ích
Bảo mật nâng cao	Không
Tính năng đặc biệt	Mặt kính 2.5D
Ghi âm	Có
Radio	Không
Xem phim	H.265, 3GP, MP4, AVI, WMV, H.263
Nghe nhạc	Midi, MP3, WAV, WMA, AAC, eAAC+, FLAC
Thông tin khác
Thời điểm ra mắt	04/2018', N'12.png', CAST(N'2018-03-04T00:00:00.000' AS DateTime), 34, 3, 1)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (13, N'OPPO F7 128GB', CAST(6990000 AS Decimal(18, 0)), N'Tiếp nối sự thành công của OPPO F5 thì OPPO tiếp tục giới thiệu OPPO F7 128GB với mức giá tương đương nhưng mang trong mình thiết kế hoàn toàn mới cũng nhiều cải tiến đáng giá.', N'Màn hình
Công nghệ màn hình	LTPS LCD
Độ phân giải	Full HD+ (1080 x 2280 Pixels)
Màn hình rộng	6.23"
Mặt kính cảm ứng	Corning Gorilla Glass 5
Camera sau
Độ phân giải	16 MP
Quay phim	Quay phim HD 720p@24fps, Quay phim FullHD 1080p@30fps
Đèn Flash	Có
Chụp ảnh nâng cao	Chế độ Time-Lapse, Chụp ảnh xóa phông, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Beautify, Chế độ chụp chuyên nghiệp
Camera trước
Độ phân giải	25 MP
Videocall	Hỗ trợ VideoCall thông qua ứng dụng
Thông tin khác	Chế độ làm đẹp, Quay video Full HD, Selfie ngược sáng HDR, Công nghệ Selfie A.I Beauty, Sticker AR (biểu tượng thực tế ảo), Flash màn hình, Panorama, Quay video HD, Nhận diện khuôn mặt
Hệ điều hành - CPU
Hệ điều hành	ColorOS 5.0 (Android 8.1)
Chipset (hãng SX CPU)	MediaTek Helio P60 8 nhân 64-bit
Tốc độ CPU	2.0 GHz
Chip đồ họa (GPU)	Mali-G72 MP3
Bộ nhớ & Lưu trữ
RAM	6 GB
Bộ nhớ trong	128 GB
Bộ nhớ còn lại (khả dụng)	Khoảng 110 GB
Thẻ nhớ ngoài	MicroSD, hỗ trợ tối đa 256 GB
Kết nối
Mạng di động	Hỗ trợ 4G
SIM	2 Nano SIM
Wifi	Wi-Fi 802.11 b/g/n, DLNA, Wi-Fi Direct, Wi-Fi hotspot
GPS	A-GPS, GLONASS
Bluetooth	A2DP, LE, v4.2
Cổng kết nối/sạc	Micro USB
Jack tai nghe	3.5 mm
Kết nối khác	OTG
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối
Chất liệu	Nhựa
Kích thước	Dài 156 mm - Ngang 75.3 mm - Dày 7.8 mm
Trọng lượng	158 g
Thông tin pin & Sạc
Dung lượng pin	3400 mAh
Loại pin	Pin chuẩn Li-Ion
Công nghệ pin	Tiết kiệm pin
Tiện ích
Bảo mật nâng cao	Mở khóa bằng vân tay, Mở khóa bằng khuôn mặt
Tính năng đặc biệt	Mặt kính 2.5D
Chặn cuộc gọi
Ghi âm cuộc gọi
Chặn tin nhắn
Ghi âm	Có, microphone chuyên dụng chống ồn
Radio	Có
Xem phim	MP4, H.263, H.264(MPEG4-AVC)
Nghe nhạc	MP3, WAV, eAAC+, FLAC
Thông tin khác
Thời điểm ra mắt	04/2018', N'13.png', CAST(N'2018-03-04T00:00:00.000' AS DateTime), 12, 3, 0)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (14, N'OPPO Find X', CAST(20990000 AS Decimal(18, 0)), N'OPPO Find X tạo nên một cú hích lớn trong làng smartphone hiện nay khi mang trong mình nhiều tính năng đột phá mà nổi bật nhất đến từ thiết kế sáng tạo và một hiệu năng đỉnh cao.', N'Màn hình
Công nghệ màn hình	AMOLED
Độ phân giải	Full HD+ (1080 x 2340 Pixels)
Màn hình rộng	6.42"
Mặt kính cảm ứng	Corning Gorilla Glass 5
Camera sau
Độ phân giải	20 MP và 16 MP (2 camera)
Quay phim	Quay phim 4K 2160p@30fps
Đèn Flash	Đèn LED 2 tông màu
Chụp ảnh nâng cao	Chụp ảnh xóa phông, A.I Camera, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS), Beautify, Chế độ chụp chuyên nghiệp
Camera trước
Độ phân giải	25 MP
Videocall	Hỗ trợ VideoCall thông qua ứng dụng
Thông tin khác	Nhận diện khuôn mặt, Chế độ làm đẹp, Tự động lấy nét, Công nghệ Selfie A.I Beauty, Sticker AR (biểu tượng thực tế ảo)
Hệ điều hành - CPU
Hệ điều hành	Android 8.1 (Oreo)
Chipset (hãng SX CPU)	Snapdragon 845 8 nhân
Tốc độ CPU	4 nhân 2.8 GHz & 4 nhân 1.7 GHz
Chip đồ họa (GPU)	Adreno 630
Bộ nhớ & Lưu trữ
RAM	8 GB
Bộ nhớ trong	256 GB
Bộ nhớ còn lại (khả dụng)	Đang cập nhật
Thẻ nhớ ngoài	Không
Kết nối
Mạng di động	Hỗ trợ 4G
SIM	2 Nano SIM
Wifi	Wi-Fi 802.11 a/b/g/n/ac, Dual-band, Wi-Fi Direct, Wi-Fi hotspot
GPS	BDS, A-GPS, GLONASS
Bluetooth	A2DP, LE, v5.0
Cổng kết nối/sạc	USB Type-C
Jack tai nghe	Không
Kết nối khác	NFC
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối
Chất liệu	Khung kim loại + mặt kính cường lực
Kích thước	Dài 156.7 mm - Ngang 74.2 mm - Dày 9.6 mm
Trọng lượng	186 g
Thông tin pin & Sạc
Dung lượng pin	3730 mAh
Loại pin	Pin chuẩn Li-Ion
Công nghệ pin	Tiết kiệm pin, Sạc nhanh VOOC
Tiện ích
Bảo mật nâng cao	Bảo mật khuôn mặt 3D
Tính năng đặc biệt	Chặn tin nhắn
Chặn cuộc gọi
Sạc pin nhanh
Đèn pin
Mặt kính 2.5D
Ghi âm	Có, microphone chuyên dụng chống ồn
Radio	Không
Xem phim	3GP, MP4, AVI, H.264(MPEG4-AVC)
Nghe nhạc	MP3, WAV, WMA
Thông tin khác
Thời điểm ra mắt	07/2018', N'15.png', CAST(N'2018-11-12T00:00:00.000' AS DateTime), 45, 3, 1)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (15, N'Nokia 7 plus', CAST(8290000 AS Decimal(18, 0)), N'Nokia 7 Plus là chiếc smartphone đầu tiên đánh dấu bước đi đầu tiên của Nokia vào thế giới màn hình tỉ lệ 18:9.
', N'Màn hình
Công nghệ màn hình	IPS LCD
Độ phân giải	Full HD+ (1080 x 2160 Pixels)
Màn hình rộng	6"
Mặt kính cảm ứng	Kính cường lực Gorilla Glass 3
Camera sau
Độ phân giải	12 MP và 13 MP (2 camera)
Quay phim	Quay phim 4K 2160p@30fps
Đèn Flash	Đèn LED kép
Chụp ảnh nâng cao	Zoom quang học (Camera kép), Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chế độ chụp chuyên nghiệp
Camera trước
Độ phân giải	16 MP
Videocall	Hỗ trợ VideoCall thông qua ứng dụng
Thông tin khác	Tự động lấy nét, Nhận diện khuôn mặt, Quay video Full HD, Chế độ làm đẹp
Hệ điều hành - CPU
Hệ điều hành	Android 8.0 (Oreo)
Chipset (hãng SX CPU)	Qualcomm Snapdragon 660 8 nhân
Tốc độ CPU	4 nhân 2.2 GHz Kryo 260 & 4 nhân 1.8 GHz Kryo 260
Chip đồ họa (GPU)	Adreno 512
Bộ nhớ & Lưu trữ
RAM	4 GB
Bộ nhớ trong	64 GB
Bộ nhớ còn lại (khả dụng)	Khoảng 47 GB
Thẻ nhớ ngoài	MicroSD, hỗ trợ tối đa 256 GB
Kết nối
Mạng di động	3G, 4G LTE Cat 6
SIM	2 SIM Nano (SIM 2 chung khe thẻ nhớ)
Wifi	Wi-Fi 802.11 b/g/n, Wi-Fi Direct, Wi-Fi hotspot
GPS	BDS, A-GPS, GLONASS
Bluetooth	LE, A2DP, v5.0
Cổng kết nối/sạc	USB Type-C
Jack tai nghe	3.5 mm
Kết nối khác	NFC
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối
Chất liệu	Kim loại
Kích thước	Dài 158.4 mm - Ngang 75.6 mm - Dày 8 mm
Trọng lượng	183 g
Thông tin pin & Sạc
Dung lượng pin	3800 mAh
Loại pin	Lithium - Ion
Công nghệ pin	Tiết kiệm pin, Sạc pin nhanh
Tiện ích
Bảo mật nâng cao	Mở khóa bằng vân tay
Tính năng đặc biệt	Sạc pin nhanh
Đèn pin
Chặn tin nhắn
Chặn cuộc gọi
Mặt kính 2.5D
Ghi âm	Có, microphone chuyên dụng chống ồn
Radio	Có
Xem phim	3GP, MP4, AVI, WMV, H.263, H.264(MPEG4-AVC)
Nghe nhạc	MP3, WAV, WMA
Thông tin khác
Thời điểm ra mắt	04/2018', N'14.png', CAST(N'2018-03-04T00:00:00.000' AS DateTime), 23, 4, 1)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (16, N'Nokia 105 Dual Sim', CAST(360000 AS Decimal(18, 0)), N'Kế thừa thành công từ Nokia 105 2014 ở phân khúc điện thoại phổ thông giá rẻ, Nokia 105 2017 với thiết kế hoàn toàn mới hứa hẹn sẽ đem đến cho người dùng một thiết bị giá tốt, bền, đẹp và pin trâu.', N'Màn hình
Công nghệ màn hình	TFT
Độ phân giải	QQVGA (120 x 160 pixels)
Màn hình rộng	1.8"
Mặt kính cảm ứng	Không có cảm ứng
Camera sau
Độ phân giải	Không có
Quay phim	Không
Đèn Flash	Không
Chụp ảnh nâng cao	Không
Camera trước
Độ phân giải	Không
Videocall	Không
Thông tin khác	Không
Hệ điều hành - CPU
Hệ điều hành	Không
Chipset (hãng SX CPU)	Không
Tốc độ CPU	Không
Chip đồ họa (GPU)	Không
Bộ nhớ & Lưu trữ
RAM	Không
Bộ nhớ trong	Không
Bộ nhớ còn lại (khả dụng)	Không
Thẻ nhớ ngoài	Không
Kết nối
Mạng di động	2G, Không kết nối internet
SIM	2 SIM thường
Wifi	Không
GPS	Không
Bluetooth	Không
Cổng kết nối/sạc	Micro USB
Jack tai nghe	3.5 mm
Kết nối khác	Không
Thiết kế & Trọng lượng
Thiết kế	Pin rời
Chất liệu	Nhựa
Kích thước	Dài 112 mm - Ngang 49.5 mm - Dày 14.4 mm
Trọng lượng	73 g
Thông tin pin & Sạc
Dung lượng pin	800 mAh
Loại pin	Pin chuẩn Li-Ion
Công nghệ pin	Không
Tiện ích
Bảo mật nâng cao	Không
Tính năng đặc biệt	Không
Ghi âm	Không
Radio	Có
Xem phim	Không
Nghe nhạc	Không
Thông tin khác
Thời điểm ra mắt	8/2017', N'16.png', CAST(N'2018-03-04T00:00:00.000' AS DateTime), 10, 4, 0)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (17, N'Nokia 230', CAST(1250000 AS Decimal(18, 0)), N'Nokia 230 được trang bị khá nhiều tính năng hay ho, thiết kế đẹp cho người dùng yêu thích một chiếc điện thoại đẹp - đơn giản - tốt.', N'Màn hình
Công nghệ màn hình	TFT
Độ phân giải	QVGA (240 x 320 Pixels)
Màn hình rộng	2.8"
Mặt kính cảm ứng	Không có cảm ứng
Camera sau
Độ phân giải	2 MP
Quay phim	Quay phim QVGA@15fps
Đèn Flash	Có
Chụp ảnh nâng cao	Không
Camera trước
Độ phân giải	2 MP
Videocall	Không
Thông tin khác	Đèn Flash trợ sáng
Hệ điều hành - CPU
Hệ điều hành	Không
Chipset (hãng SX CPU)	Không
Tốc độ CPU	Không
Chip đồ họa (GPU)	Không
Bộ nhớ & Lưu trữ
RAM	Không
Bộ nhớ trong	Không
Bộ nhớ còn lại (khả dụng)	Không
Thẻ nhớ ngoài	MicroSD, hỗ trợ tối đa 32 GB
Kết nối
Mạng di động	2G
SIM	2 SIM thường
Wifi	Không
GPS	Không
Bluetooth	V3.0
Cổng kết nối/sạc	Micro USB
Jack tai nghe	3.5 mm
Kết nối khác	Không
Thiết kế & Trọng lượng
Thiết kế	Pin rời
Chất liệu	Nhựa, nhôm
Kích thước	Dài 124.6 mm - Ngang 53.4 mm - Dày 10.9 mm
Trọng lượng	91.8 g
Thông tin pin & Sạc
Dung lượng pin	1200 mAh
Loại pin	Pin Nokia BL-4UL
Công nghệ pin	Không
Tiện ích
Bảo mật nâng cao	Không
Tính năng đặc biệt	Truy cập Facebook, Messenger
Giới hạn thời lượng cuộc gọi
Ghi âm cuộc gọi
Ghi âm	Có
Radio	Có
Xem phim	3GP, MP4
Nghe nhạc	MP3, WAV
Thông tin khác
Thời điểm ra mắt	5/2017', N'17.png', CAST(N'2018-03-04T00:00:00.000' AS DateTime), 5, 4, 1)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (18, N'Nokia 6', CAST(3590000 AS Decimal(18, 0)), N'Nokia đã cho ra mắt chính thức Nokia 6 với cấu hình tốt trong mức giá tầm trung, thiết kế đẹp cùng bộ đôi camera chất lượng.', N'Màn hình
Công nghệ màn hình	IPS LCD
Độ phân giải	Full HD (1080 x 1920 Pixels)
Màn hình rộng	5.5"
Mặt kính cảm ứng	Kính cường lực Gorilla Glass 3
Camera sau
Độ phân giải	16 MP
Quay phim	Quay phim FullHD 1080p@30fps
Đèn Flash	Có
Chụp ảnh nâng cao	Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama
Camera trước
Độ phân giải	8 MP
Videocall	Có
Thông tin khác	Chế độ làm đẹp, Camera góc rộng, Nhận diện khuôn mặt
Hệ điều hành - CPU
Hệ điều hành	Android 7.0 (Nougat)
Chipset (hãng SX CPU)	Qualcomm Snapdragon 430 8 nhân 64 bit
Tốc độ CPU	1.4 GHz
Chip đồ họa (GPU)	Adreno 505
Bộ nhớ & Lưu trữ
RAM	3 GB
Bộ nhớ trong	32 GB
Bộ nhớ còn lại (khả dụng)	Khoảng 22 GB
Thẻ nhớ ngoài	MicroSD, hỗ trợ tối đa 128 GB
Kết nối
Mạng di động	3G, 4G LTE Cat 4
SIM	2 SIM Nano (SIM 2 chung khe thẻ nhớ)
Wifi	Wi-Fi 802.11 a/b/g/n/ac, Wi-Fi Direct, Wi-Fi hotspot
GPS	A-GPS, GLONASS
Bluetooth	A2DP, v4.2
Cổng kết nối/sạc	Micro USB
Jack tai nghe	3.5 mm
Kết nối khác	OTG
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối
Chất liệu	Kim loại
Kích thước	Dài 154 mm - Ngang 75.8 mm - Dày 8.4 mm
Trọng lượng	169 g
Thông tin pin & Sạc
Dung lượng pin	3000 mAh
Loại pin	Pin chuẩn Li-Ion
Công nghệ pin	Tiết kiệm pin
Tiện ích
Bảo mật nâng cao	Mở khóa bằng vân tay
Tính năng đặc biệt	Mặt kính 2.5D
Ghi âm	Không
Radio	Có
Xem phim	H.265, 3GP, MP4, AVI, WMV, H.263
Nghe nhạc	Midi, Lossless, MP3, WAV, WMA
Thông tin khác
Thời điểm ra mắt	6/2017', N'18.png', CAST(N'2018-03-04T00:00:00.000' AS DateTime), 15, 4, 0)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (19, N'Nokia 5.1 Plus', CAST(4790000 AS Decimal(18, 0)), N'Sau Nokia 6.1 Plus thì Nokia tiếp tục tung ra thị trường chiếc smartphone thứ 2 của mình sở hữu màn hình "tai thỏ" với tên gọi Nokia 5.1 Plus (Nokia X5) với mức giá dễ chịu và hấp dẫn.', N'Màn hình
Công nghệ màn hình	IPS LCD
Độ phân giải	HD+ (720 x 1520 Pixels)
Màn hình rộng	5.8"
Mặt kính cảm ứng	Mặt kính cong 2.5D
Camera sau
Độ phân giải	13 MP và 5 MP (2 camera)
Quay phim	Quay phim FullHD 1080p@30fps
Đèn Flash	Có
Chụp ảnh nâng cao	Chế độ Slow Motion, Chế độ Time-Lapse, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Beautify
Camera trước
Độ phân giải	8 MP
Videocall	Hỗ trợ VideoCall thông qua ứng dụng
Thông tin khác	Quay video HD, Chế độ làm đẹp, Tự động lấy nét, Sticker AR (biểu tượng thực tế ảo)
Hệ điều hành - CPU
Hệ điều hành	Android One
Chipset (hãng SX CPU)	MediaTek Helio P60 8 nhân 64-bit
Tốc độ CPU	2.0 GHz
Chip đồ họa (GPU)	Mali-G72 MP3
Bộ nhớ & Lưu trữ
RAM	3 GB
Bộ nhớ trong	32 GB
Bộ nhớ còn lại (khả dụng)	Khoảng 21 GB
Thẻ nhớ ngoài	MicroSD, hỗ trợ tối đa 256 GB
Kết nối
Mạng di động	Hỗ trợ 4G
SIM	2 SIM Nano (SIM 2 chung khe thẻ nhớ)
Wifi	Wi-Fi 802.11 a/b/g/n/ac, Dual-band, Wi-Fi Direct, Wi-Fi hotspot
GPS	BDS, A-GPS, GLONASS
Bluetooth	LE, A2DP, v4.2
Cổng kết nối/sạc	USB Type-C
Jack tai nghe	3.5 mm
Kết nối khác	Không
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối
Chất liệu	Khung kim loại + mặt lưng nhựa giả kính
Kích thước	Dài 149.51 mm - Ngang 71.98 mm - Dày 8.01 mm
Trọng lượng	160 g
Thông tin pin & Sạc
Dung lượng pin	3060 mAh
Loại pin	Pin chuẩn Li-Ion
Công nghệ pin	Tiết kiệm pin, Sạc pin nhanh
Tiện ích
Bảo mật nâng cao	Mở khóa bằng vân tay
Tính năng đặc biệt	Chặn tin nhắn
Chặn cuộc gọi
Đèn pin
Sạc pin nhanh
Ghi âm	Không
Radio	Có
Xem phim	MP4, H.263, H.264(MPEG4-AVC)
Nghe nhạc	MP3, WAV, AAC, AAC+, eAAC+
Thông tin khác
Thời điểm ra mắt	10/2018', N'19.png', CAST(N'2018-03-04T00:00:00.000' AS DateTime), 45, 4, 1)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (20, N'Huawei Mate 20 Pro', CAST(21990000 AS Decimal(18, 0)), N'Thế hệ siêu phẩm mới của Huawei chính thức lộ diện với cái tên Huawei Mate 20 Pro, chiếc điện thoại thu hút trong thiết kế, mạnh mẽ trong hiệu năng cùng một hệ thống camera ấn tượng.', N'Màn hình
Công nghệ màn hình	OLED
Độ phân giải	2K+ (1440 x 3120 Pixels)
Màn hình rộng	6.39"
Mặt kính cảm ứng	Mặt kính cong 3D
Camera sau
Độ phân giải	40 MP, 20 MP và 8 MP (3 camera)
Quay phim	Quay phim FullHD 1080p@30fps, Quay phim FullHD 1080p@60fps, Quay phim 4K 2160p@30fps
Đèn Flash	Đèn LED 2 tông màu
Chụp ảnh nâng cao	Lấy nét bằng laser, Chụp ảnh xóa phông, Chế độ Slow Motion, Chế độ Time-Lapse, Chế độ Light Painting, Chế độ chụp ban đêm (ánh sáng yếu), A.I Camera, Lấy nét theo pha, Điều chỉnh khẩu độ, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS), Beautify, Chế độ chụp chuyên nghiệp
Camera trước
Độ phân giải	24 MP
Videocall	Hỗ trợ VideoCall thông qua ứng dụng
Thông tin khác	Quay video HD, Selfie bằng cử chỉ, Nhận diện khuôn mặt, Chế độ làm đẹp, Quay video Full HD, Tự động lấy nét, Selfie ngược sáng HDR, Sticker AR (biểu tượng thực tế ảo), Flash màn hình
Hệ điều hành - CPU
Hệ điều hành	Android 9.0 (Pie)
Chipset (hãng SX CPU)	Hisilicon Kirin 980 8 nhân 64-bit
Tốc độ CPU	2 nhân 2.6 GHz Cortex A76 & 2 nhân 1.92 GHz Cortex A76 & 4 nhân 1.8 GHz Cortex A55
Chip đồ họa (GPU)	Mali-G76 MP10
Bộ nhớ & Lưu trữ
RAM	6 GB
Bộ nhớ trong	128 GB
Bộ nhớ còn lại (khả dụng)	Khoảng 112 GB
Thẻ nhớ ngoài	NM card, hỗ trợ tối đa 512 GB
Kết nối
Mạng di động	Hỗ trợ 4G
SIM	2 SIM Nano (SIM 2 chung khe thẻ nhớ)
Wifi	Wi-Fi 802.11 a/b/g/n/ac, Wi-Fi Direct, Wi-Fi hotspot
GPS	A-GPS, GLONASS
Bluetooth	LE, A2DP, v5.0
Cổng kết nối/sạc	USB Type-C
Jack tai nghe	Không
Kết nối khác	NFC
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối
Chất liệu	Khung kim loại + mặt lưng kính
Kích thước	Dài 157.8 mm - Ngang 72.3 mm - Dày 8.6 mm
Trọng lượng	189 g
Thông tin pin & Sạc
Dung lượng pin	4200 mAh
Loại pin	Pin chuẩn Li-Po
Công nghệ pin	Tiết kiệm pin, Siêu tiết kiệm pin, Sạc pin nhanh, Sạc pin không dây
Tiện ích
Bảo mật nâng cao	Mở khóa bằng khuôn mặt, Mở khoá vân tay dưới màn hình
Tính năng đặc biệt	Chặn tin nhắn
Nhân bản ứng dụng
Thu nhỏ màn hình sử dụng một tay
Chặn cuộc gọi
Sạc pin nhanh
Đèn pin
Sạc pin cho thiết bị khác
Chuẩn Kháng nước, Chuẩn kháng bụi
Dolby Audio™
Vẽ lên màn hình để mở nhanh ứng dụng
Máy ảnh kép, ống kính Leica
Ghi âm	Có, microphone chuyên dụng chống ồn
Radio	Không
Xem phim	3GP, MP4
Nghe nhạc	Midi, AMR, MP3, WAV, AAC, OGG, FLAC
Thông tin khác
Thời điểm ra mắt	10/2018', N'20.png', CAST(N'2018-03-04T00:00:00.000' AS DateTime), 24, 5, 0)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (21, N'Huawei Y6 Prime', CAST(2990000 AS Decimal(18, 0)), N'Huawei Y6 Prime là chiếc smartphone giá rẻ với màn hình tràn viền kích thước lớn.', N'Màn hình
Công nghệ màn hình	IPS LCD
Độ phân giải	HD+ (720 x 1440 Pixels)
Màn hình rộng	5.7"
Mặt kính cảm ứng	Mặt kính cong 2.5D
Camera sau
Độ phân giải	13 MP
Quay phim	Quay phim FullHD 1080p@30fps
Đèn Flash	Có
Chụp ảnh nâng cao	Chế độ Time-Lapse, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama
Camera trước
Độ phân giải	8 MP
Videocall	Hỗ trợ VideoCall thông qua ứng dụng
Thông tin khác	Đèn Flash trợ sáng, Tự động lấy nét, Nhận diện khuôn mặt, Chế độ làm đẹp
Hệ điều hành - CPU
Hệ điều hành	Android 8.0 (Oreo)
Chipset (hãng SX CPU)	Qualcomm Snapdragon 425 4 nhân 64-bit
Tốc độ CPU	1.4 GHz
Chip đồ họa (GPU)	Adreno 308
Bộ nhớ & Lưu trữ
RAM	2 GB
Bộ nhớ trong	16 GB
Bộ nhớ còn lại (khả dụng)	Khoảng 9 GB
Thẻ nhớ ngoài	MicroSD, hỗ trợ tối đa 256 GB
Kết nối
Mạng di động	Hỗ trợ 4G
SIM	2 Nano SIM
Wifi	Wi-Fi 802.11 b/g/n, Wi-Fi Direct
GPS	A-GPS, GLONASS
Bluetooth	LE, A2DP, v4.2
Cổng kết nối/sạc	Micro USB
Jack tai nghe	3.5 mm
Kết nối khác	OTG
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối
Chất liệu	Nhựa
Kích thước	Dài 152.4 mm - Ngang 73 mm - Dày 7.8 mm
Trọng lượng	150 g
Thông tin pin & Sạc
Dung lượng pin	3000 mAh
Loại pin	Pin chuẩn Li-Ion
Công nghệ pin	Tiết kiệm pin
Tiện ích
Bảo mật nâng cao	Mở khóa bằng vân tay, Mở khóa bằng khuôn mặt
Tính năng đặc biệt	Mặt kính 2.5D
Ghi âm	Có, microphone chuyên dụng chống ồn
Radio	Không
Xem phim	3GP, MP4, WMV
Nghe nhạc	AMR, Midi, MP3, WAV, AAC, OGG, FLAC
Thông tin khác
Thời điểm ra mắt	05/2018', N'21.png', CAST(N'2018-03-04T00:00:00.000' AS DateTime), 14, 5, 0)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (22, N'Huawei Nova 3e', CAST(5990000 AS Decimal(18, 0)), N'Huawei Nova 3e là phiên bản kế nhiệm hoàn hảo của chiếc Nova 2i vốn đã đạt được nhiều thành công tại thị trường Việt Nam với màn hình tràn viền "tai thỏ" mới và nhiều tính năng cao cấp.', N'Màn hình
Công nghệ màn hình	IPS LCD
Độ phân giải	Full HD+ (1080 x 2280 Pixels)
Màn hình rộng	5.84"
Mặt kính cảm ứng	Mặt kính cong 2.5D
Camera sau
Độ phân giải	16 MP và 2 MP (2 camera)
Quay phim	Quay phim FullHD 1080p@30fps
Đèn Flash	Có
Chụp ảnh nâng cao	Chụp ảnh xóa phông, A.I Camera, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama
Camera trước
Độ phân giải	16 MP
Videocall	Hỗ trợ VideoCall thông qua ứng dụng
Thông tin khác	Chế độ làm đẹp, Quay video Full HD, Sticker AR (biểu tượng thực tế ảo), Nhận diện khuôn mặt
Hệ điều hành - CPU
Hệ điều hành	Android 8.0 (Oreo)
Chipset (hãng SX CPU)	HiSilicon Kirin 659 8 nhân
Tốc độ CPU	4 nhân 2.36GHz + 4 nhân 1.7GHz
Chip đồ họa (GPU)	Mali-T830
Bộ nhớ & Lưu trữ
RAM	4 GB
Bộ nhớ trong	64 GB
Bộ nhớ còn lại (khả dụng)	Khoảng 50 GB
Thẻ nhớ ngoài	MicroSD, hỗ trợ tối đa 256 GB
Kết nối
Mạng di động	Hỗ trợ 4G
SIM	2 Nano SIM
Wifi	Wi-Fi 802.11 b/g/n, DLNA, Wi-Fi Direct, Wi-Fi hotspot
GPS	A-GPS, GLONASS, S-GPS
Bluetooth	LE, apt-X, v4.2
Cổng kết nối/sạc	USB Type-C
Jack tai nghe	3.5 mm
Kết nối khác	OTG
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối
Chất liệu	Khung kim loại + mặt kính cường lực
Kích thước	Dài 148.6 mm - Ngang 71.2 mm - Dày 7.4 mm
Trọng lượng	145 g
Thông tin pin & Sạc
Dung lượng pin	3000 mAh
Loại pin	Pin chuẩn Li-Ion
Công nghệ pin	Tiết kiệm pin, Sạc pin nhanh
Tiện ích
Bảo mật nâng cao	Mở khóa bằng vân tay, Mở khóa bằng khuôn mặt
Tính năng đặc biệt	Mặt kính 2.5D
Ghi âm	Có, microphone chuyên dụng chống ồn
Radio	Không
Xem phim	H.265, 3GP, MP4, H.263, H.264(MPEG4-AVC)
Nghe nhạc	Lossless, MP3, WAV, AAC, eAAC+, FLAC
Thông tin khác
Thời điểm ra mắt	03/2018', N'22.png', CAST(N'2018-03-04T00:00:00.000' AS DateTime), 15, 5, 1)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (23, N'Huawei Nova 2i', CAST(3990000 AS Decimal(18, 0)), N'Huawei Nova 2i là chiếc smartphone phổ thông có thiết kế màn hình tràn cạnh đẹp mắt, 4 camera (2 camera kép) và hiệu năng khá tốt, đây là sự lựa chọn tuyệt vời trong tầm giá.', N'Màn hình
Công nghệ màn hình	IPS LCD
Độ phân giải	Full HD+ (1080 x 2160 Pixels)
Màn hình rộng	5.9"
Mặt kính cảm ứng	Mặt kính cong 2.5D
Camera sau
Độ phân giải	16 MP và 2 MP (2 camera)
Quay phim	Quay phim FullHD 1080p@30fps
Đèn Flash	Có
Chụp ảnh nâng cao	Chụp ảnh xóa phông, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama
Camera trước
Độ phân giải	13 MP và 2 MP (2 camera)
Videocall	Có
Thông tin khác	Chế độ làm đẹp, Quay video Full HD, Camera góc rộng, Camera kép, Nhận diện khuôn mặt
Hệ điều hành - CPU
Hệ điều hành	Android 7.0 (Nougat)
Chipset (hãng SX CPU)	HiSilicon Kirin 659 8 nhân
Tốc độ CPU	4 nhân 2.36GHz + 4 nhân 1.7GHz
Chip đồ họa (GPU)	Mali-T830
Bộ nhớ & Lưu trữ
RAM	4 GB
Bộ nhớ trong	64 GB
Bộ nhớ còn lại (khả dụng)	Khoảng 48 GB
Thẻ nhớ ngoài	MicroSD, hỗ trợ tối đa 128 GB
Kết nối
Mạng di động	Hỗ trợ 4G
SIM	2 Nano SIM
Wifi	Wi-Fi 802.11 b/g/n, DLNA, Wi-Fi Direct, Wi-Fi hotspot
GPS	A-GPS, GLONASS
Bluetooth	A2DP, LE, v4.2
Cổng kết nối/sạc	Micro USB
Jack tai nghe	3.5 mm
Kết nối khác	OTG
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối
Chất liệu	Kim loại
Kích thước	Dài 156.2 mm - Ngang 75.2 mm - Dày 7.5 mm
Trọng lượng	164 g
Thông tin pin & Sạc
Dung lượng pin	3340 mAh
Loại pin	Pin chuẩn Li-Po
Công nghệ pin	Tiết kiệm pin
Tiện ích
Bảo mật nâng cao	Mở khóa bằng vân tay
Tính năng đặc biệt	Mặt kính 2.5D
Ghi âm	Có
Radio	Có
Xem phim	H.265, 3GP, MP4, AVI, WMV, H.263
Nghe nhạc	Midi, Lossless, MP3, WAV, WMA9, WMA, AAC, AAC+, AAC++, eAAC+
Thông tin khác
Thời điểm ra mắt	2017', N'23.png', CAST(N'2018-03-04T00:00:00.000' AS DateTime), 22, 5, 0)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (24, N'Xiaomi Mi 8', CAST(12990000 AS Decimal(18, 0)), N'Xiaomi Mi 8 sẽ là cái tên được nhắc đến nhiều trong gia đình Xiaomi khi mang trong mình đầy đủ những gì gọi là cao cấp đến từ vẻ đẹp bên ngoài cũng như phần cứng mạnh mẽ bên trong.', N'Màn hình
Công nghệ màn hình	Super AMOLED
Độ phân giải	Full HD+ (1080 x 2248 Pixels)
Màn hình rộng	6.21"
Mặt kính cảm ứng	Corning Gorilla Glass 5
Camera sau
Độ phân giải	2 camera 12 MP
Quay phim	Quay phim FullHD 1080p@30fps, Quay phim FullHD 1080p@240fps, Quay phim 4K 2160p@30fps
Đèn Flash	Đèn LED kép
Chụp ảnh nâng cao	Chụp ảnh xóa phông, Chế độ Slow Motion, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS), Beautify
Camera trước
Độ phân giải	20 MP
Videocall	Hỗ trợ VideoCall thông qua ứng dụng
Thông tin khác	Chế độ làm đẹp, Nhận diện khuôn mặt, Tự động lấy nét, Quay video Full HD
Hệ điều hành - CPU
Hệ điều hành	Android 8.1 (Oreo)
Chipset (hãng SX CPU)	Snapdragon 845 8 nhân
Tốc độ CPU	4 nhân 2.8 GHz Kryo & 4 nhân 1.8 GHz Kryo
Chip đồ họa (GPU)	Adreno 630
Bộ nhớ & Lưu trữ
RAM	6 GB
Bộ nhớ trong	64 GB
Bộ nhớ còn lại (khả dụng)	Đang cập nhật
Thẻ nhớ ngoài	Không
Kết nối
Mạng di động	Hỗ trợ 4G
SIM	2 Nano SIM
Wifi	Wi-Fi 802.11 a/b/g/n/ac, Wi-Fi Direct, Wi-Fi hotspot
GPS	A-GPS, GLONASS
Bluetooth	A2DP, LE, v5.0
Cổng kết nối/sạc	USB Type-C
Jack tai nghe	Không
Kết nối khác	NFC
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối
Chất liệu	Khung kim loại + mặt kính cường lực
Kích thước	Dài 154.9 mm - Ngang 74.8 mm - Dày 7.6 mm
Trọng lượng	175 g
Thông tin pin & Sạc
Dung lượng pin	3400 mAh
Loại pin	Pin chuẩn Li-Ion
Công nghệ pin	Tiết kiệm pin, Siêu tiết kiệm pin, Sạc nhanh Quick Charge 3.0
Tiện ích
Bảo mật nâng cao	Mở khóa bằng vân tay, Mở khóa bằng khuôn mặt
Tính năng đặc biệt	Đèn pin
Mặt kính 2.5D
Ghi âm	Có, microphone chuyên dụng chống ồn
Radio	Không
Xem phim	3GP, MP4, AVI, WMV, DivX, Xvid
Nghe nhạc	Midi, MP3, WAV, WMA, AAC, OGG, FLAC
Thông tin khác
Thời điểm ra mắt	08/2018', N'24.png', CAST(N'2018-03-04T00:00:00.000' AS DateTime), 100, 6, 0)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (25, N'Xiaomi Redmi Note 6 Pro 64GB
', CAST(4990000 AS Decimal(18, 0)), N'Xiaomi Redmi Note 6 Pro, một thành viên mới của nhà Xiaomi vừa được ra mắt với một chút thay đổi nhẹ trong thiết kế cũng như hiệu năng. Đặc biệt hơn, chiếc điện thoại này được trang bị đến 4 camera, điều mà nhiều đối thủ của nó không có được.', N'Màn hình
Công nghệ màn hình	IPS LCD
Độ phân giải	Full HD+ (1080 x 2160 Pixels)
Màn hình rộng	6.26"
Mặt kính cảm ứng	Mặt kính cong 2.5D
Camera sau
Độ phân giải	12 MP và 5 MP (2 camera)
Quay phim	Quay phim FullHD 1080p@30fps
Đèn Flash	Có
Chụp ảnh nâng cao	Chụp ảnh xóa phông, A.I Camera, Tự động lấy nét, Chạm lấy nét, HDR, Panorama, Chống rung quang học (OIS)
Camera trước
Độ phân giải	20 MP và 2 MP (2 camera)
Videocall	Hỗ trợ VideoCall thông qua ứng dụng
Thông tin khác	Công nghệ Selfie A.I Beauty, Camera kép, Nhận diện khuôn mặt, Chế độ làm đẹp
Hệ điều hành - CPU
Hệ điều hành	Android 8.1 (Oreo)
Chipset (hãng SX CPU)	Qualcomm Snapdragon 636 8 nhân
Tốc độ CPU	1.8 GHz
Chip đồ họa (GPU)	Adreno 509
Bộ nhớ & Lưu trữ
RAM	3 GB
Bộ nhớ trong	32 GB
Bộ nhớ còn lại (khả dụng)	Khoảng 19 GB
Thẻ nhớ ngoài	MicroSD, hỗ trợ tối đa 256 GB
Kết nối
Mạng di động	Hỗ trợ 4G
SIM	2 SIM Nano (SIM 2 chung khe thẻ nhớ)
Wifi	Wi-Fi 802.11 a/b/g/n/ac, Wi-Fi Direct, Wi-Fi hotspot
GPS	A-GPS, GLONASS
Bluetooth	A2DP, LE, v4.2
Cổng kết nối/sạc	Micro USB
Jack tai nghe	3.5 mm
Kết nối khác	Đang cập nhật
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối
Chất liệu	Khung nhựa + vỏ kim loại
Kích thước	Dài 157.9 mm - Ngang 76.38 mm - Dày 8.2 mm
Trọng lượng	Đang cập nhật
Thông tin pin & Sạc
Dung lượng pin	4000 mAh
Loại pin	Pin chuẩn Li-Po
Công nghệ pin	Tiết kiệm pin
Tiện ích
Bảo mật nâng cao	Mở khóa bằng vân tay, Mở khóa bằng khuôn mặt
Tính năng đặc biệt	Đèn pin
Chặn tin nhắn
Chặn cuộc gọi
Ghi âm	Có
Radio	Đang cập nhật
Xem phim	MP4, AVI, H.263, H.264(MPEG4-AVC)
Nghe nhạc	MP3, WAV
Thông tin khác
Thời điểm ra mắt	09/2018', N'25.png', CAST(N'2018-03-04T00:00:00.000' AS DateTime), 43, 6, 1)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (26, N'Xiaomi Redmi 6', CAST(2990000 AS Decimal(18, 0)), N'Đặc điểm nổi bật của Xiaomi Redmi 6

Tìm hiểu thêm
Tìm hiểu thêm
Tìm hiểu thêm
Tìm hiểu thêm
Bộ sản phẩm chuẩn: Hộp, Sạc, Sách hướng dẫn, Cáp, Cây lấy sim

Xiaomi Redmi 6 là chiến binh mới nhất của Xiaomi gia nhập phân khúc giá rẻ với nhiều trang bị đáng giá mà khó có đối thủ nào trong phân khúc sở hữu.', N'Màn hình
Công nghệ màn hình	IPS LCD
Độ phân giải	HD+ (720 x 1440 Pixels)
Màn hình rộng	5.45"
Mặt kính cảm ứng	Kính thường
Camera sau
Độ phân giải	12 MP và 5 MP (2 camera)
Quay phim	Quay phim FullHD 1080p@30fps
Đèn Flash	Có
Chụp ảnh nâng cao	Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama
Camera trước
Độ phân giải	5 MP
Videocall	Hỗ trợ VideoCall thông qua ứng dụng
Thông tin khác	Chế độ làm đẹp
Hệ điều hành - CPU
Hệ điều hành	Android 8.1 (Oreo)
Chipset (hãng SX CPU)	MediaTek MT6762 8 nhân 64-bit (Helio P22)
Tốc độ CPU	2.0 GHz
Chip đồ họa (GPU)	PowerVR GE8320
Bộ nhớ & Lưu trữ
RAM	3 GB
Bộ nhớ trong	32 GB
Bộ nhớ còn lại (khả dụng)	Khoảng 22 GB
Thẻ nhớ ngoài	MicroSD, hỗ trợ tối đa 256 GB
Kết nối
Mạng di động	Hỗ trợ 4G
SIM	2 Nano SIM
Wifi	Wi-Fi 802.11 b/g/n, Wi-Fi Direct, Wi-Fi hotspot
GPS	BDS, A-GPS, GLONASS
Bluetooth	LE, A2DP, v4.2
Cổng kết nối/sạc	Micro USB
Jack tai nghe	3.5 mm
Kết nối khác	Không
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối
Chất liệu	Nhựa
Kích thước	Dài 147.46 m - Ngang 71.49 mm - Dày 8.3 mm
Trọng lượng	146 g
Thông tin pin & Sạc
Dung lượng pin	3000 mAh
Loại pin	Pin chuẩn Li-Po
Công nghệ pin	Tiết kiệm pin
Tiện ích
Bảo mật nâng cao	Mở khóa bằng vân tay
Tính năng đặc biệt	Đèn pin
Ghi âm	Có, microphone chuyên dụng chống ồn
Radio	Có
Xem phim	H.265, MP4, H.264(MPEG4-AVC)
Nghe nhạc	MP3, WAV, AAC, FLAC
Thông tin khác
Thời điểm ra mắt	07/2018', N'26.png', CAST(N'2018-03-04T00:00:00.000' AS DateTime), 4, 6, 0)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (27, N'Xiaomi Mi A1 64GB', CAST(4390000 AS Decimal(18, 0)), N'Mi A1 được Xiaomi chính thức ra mắt tại Ấn Độ với vai trò là một dự án hợp tác Android One của Google. Hãy cùng mình trên tay nhanh chiếc máy chạy Android thuần cùng camera xóa phông ảo diệu mà giá chỉ hơn 5 triệu này nhé.', N'Màn hình
Công nghệ màn hình	LTPS LCD
Độ phân giải	Full HD (1080 x 1920 Pixels)
Màn hình rộng	5.5"
Mặt kính cảm ứng	Kính cường lực Gorilla Glass
Camera sau
Độ phân giải	2 camera 12 MP
Quay phim	Quay phim 4K 2160p@30fps
Đèn Flash	Có
Chụp ảnh nâng cao	Chụp ảnh xóa phông, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama
Camera trước
Độ phân giải	5 MP
Videocall	Có
Thông tin khác	Quay video Full HD, Chế độ làm đẹp, Nhận diện khuôn mặt
Hệ điều hành - CPU
Hệ điều hành	Android 7.1 (Nougat)
Chipset (hãng SX CPU)	Snapdragon 625 8 nhân 64-bit
Tốc độ CPU	2.0 GHz
Chip đồ họa (GPU)	Adreno 506
Bộ nhớ & Lưu trữ
RAM	4 GB
Bộ nhớ trong	64 GB
Bộ nhớ còn lại (khả dụng)	Khoảng 50 GB
Thẻ nhớ ngoài	MicroSD, hỗ trợ tối đa 128 GB
Kết nối
Mạng di động	3G, 4G LTE Cat 6
SIM	2 SIM Nano (SIM 2 chung khe thẻ nhớ)
Wifi	Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot
GPS	A-GPS, GLONASS
Bluetooth	LE, A2DP, v4.2
Cổng kết nối/sạc	USB Type-C
Jack tai nghe	3.5 mm
Kết nối khác	OTG, Hồng Ngoại
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối, mặt kính cong 2.5D
Chất liệu	Kim loại
Kích thước	Dài 155.4 mm - Ngang 75.8 mm - Dày 7.3 mm
Trọng lượng	165 g
Thông tin pin & Sạc
Dung lượng pin	3080 mAh
Loại pin	Pin chuẩn Li-Ion
Công nghệ pin	Tiết kiệm pin
Tiện ích
Bảo mật nâng cao	Mở khóa bằng vân tay
Tính năng đặc biệt	Chặn cuộc gọi
Chặn tin nhắn
Mặt kính 2.5D
Ghi âm	Có, microphone chuyên dụng chống ồn
Radio	Không
Xem phim	H.265, 3GP, MP4, AVI, WMV, H.263
Nghe nhạc	Midi, Lossless, MP3, WAV, WMA, WMA9, AAC, AAC+, AAC++
Thông tin khác
Thời điểm ra mắt	9/2017', N'27.png', CAST(N'2018-03-04T00:00:00.000' AS DateTime), 6, 6, 0)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (28, N'Realme 2 Pro 6GB/64GB', CAST(6290000 AS Decimal(18, 0)), N'Xuất hiện tại Việt Nam với 3 phiên bản khác nhau, Realme 2 Pro bản RAM 6 GB và bộ nhớ trong 64 GB có mức giá hợp lý nhưng vẫn được trang bị cấu hình mạnh mẽ và các tính năng vượt trội khác.', N'Màn hình
Công nghệ màn hình	IPS LCD
Độ phân giải	Full HD+ (1080 x 2340 Pixels)
Màn hình rộng	6.3"
Mặt kính cảm ứng	Kính cường lực Gorilla Glass 3
Camera sau
Độ phân giải	16 MP và 2 MP (2 camera)
Quay phim	Quay phim FullHD 1080p@30fps, Quay phim 4K 2160p@30fps
Đèn Flash	Có
Chụp ảnh nâng cao	Chụp ảnh xóa phông, Tự động lấy nét, Chạm lấy nét, HDR, Panorama, Beautify
Camera trước
Độ phân giải	16 MP
Videocall	Hỗ trợ VideoCall thông qua ứng dụng
Thông tin khác	Chế độ làm đẹp, Tự động lấy nét, Selfie ngược sáng HDR
Hệ điều hành - CPU
Hệ điều hành	ColorOS 5.2 (Android 8.1)
Chipset (hãng SX CPU)	Qualcomm Snapdragon 660 8 nhân
Tốc độ CPU	1.95 GHz
Chip đồ họa (GPU)	Adreno 512
Bộ nhớ & Lưu trữ
RAM	6 GB
Bộ nhớ trong	64 GB
Bộ nhớ còn lại (khả dụng)	Đang cập nhật
Thẻ nhớ ngoài	MicroSD, hỗ trợ tối đa 256 GB
Kết nối
Mạng di động	Hỗ trợ 4G
SIM	2 Nano SIM
Wifi	Wi-Fi 802.11 a/b/g/n/ac, Wi-Fi Direct, Wi-Fi hotspot
GPS	A-GPS, GLONASS
Bluetooth	A2DP, LE, v5.0
Cổng kết nối/sạc	Micro USB
Jack tai nghe	3.5 mm
Kết nối khác	OTG
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối
Chất liệu	Nhựa
Kích thước	Dài 156.7 mm - Ngang 74 mm - Dày 8.5mm
Trọng lượng	174 g
Thông tin pin & Sạc
Dung lượng pin	3500 mAh
Loại pin	Pin chuẩn Li-Ion
Công nghệ pin	Tiết kiệm pin
Tiện ích
Bảo mật nâng cao	Mở khóa bằng vân tay, Mở khóa bằng khuôn mặt
Tính năng đặc biệt	Đèn pin
Chặn cuộc gọi
Chặn tin nhắn
Mặt kính 2.5D
Ghi âm	Có
Radio	Không
Xem phim	3GP, MP4, AVI, WMV
Nghe nhạc	AMR, MP3, WAV, WMA, AAC, OGG, FLAC
Thông tin khác
Thời điểm ra mắt	10/2018', N'28.png', CAST(N'2018-03-04T00:00:00.000' AS DateTime), 10, 7, 1)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (29, N'Realme 2 4GB/64GB', CAST(4490000 AS Decimal(18, 0)), N'Smartphone Realme 2 đã chính thức ra mắt sau phiên bản Realme 1. Chiếc điện thoại Realme này sở hữu phiên bản RAM 4 GB, bộ nhớ trong 64 GB và tích hợp cả hai loại bảo mật vân tay cùng mở khoá khuôn mặt hiện đại.', N'Màn hình
Công nghệ màn hình	IPS LCD
Độ phân giải	HD+ (720 x 1520 Pixels)
Màn hình rộng	6.2"
Mặt kính cảm ứng	Kính cường lực Gorilla Glass 3
Camera sau
Độ phân giải	13 MP và 2 MP (2 camera)
Quay phim	Quay phim FullHD 1080p@30fps
Đèn Flash	Có
Chụp ảnh nâng cao	Chụp ảnh xóa phông, Tự động lấy nét, HDR, Beautify
Camera trước
Độ phân giải	8 MP
Videocall	Hỗ trợ VideoCall thông qua ứng dụng
Thông tin khác	Selfie ngược sáng HDR, Chế độ làm đẹp, Tự động lấy nét
Hệ điều hành - CPU
Hệ điều hành	Android 8.1 (Oreo)
Chipset (hãng SX CPU)	Qualcomm Snapdragon 450 8 nhân 64-bit
Tốc độ CPU	1.8 GHz
Chip đồ họa (GPU)	Adreno 506
Bộ nhớ & Lưu trữ
RAM	4 GB
Bộ nhớ trong	64 GB
Bộ nhớ còn lại (khả dụng)	Đang cập nhật
Thẻ nhớ ngoài	MicroSD, hỗ trợ tối đa 256 GB
Kết nối
Mạng di động	Hỗ trợ 4G
SIM	2 Nano SIM
Wifi	Wi-Fi 802.11 b/g/n, Wi-Fi Direct, Wi-Fi hotspot
GPS	A-GPS, GLONASS
Bluetooth	A2DP, LE, v4.2
Cổng kết nối/sạc	Micro USB
Jack tai nghe	3.5 mm
Kết nối khác	OTG
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối
Chất liệu	Nhựa
Kích thước	Dài 156.2 mm - Ngang 75.6 mm - Dày 8.2 mm
Trọng lượng	168 g
Thông tin pin & Sạc
Dung lượng pin	4230 mAh
Loại pin	Pin chuẩn Li-Ion
Công nghệ pin	Tiết kiệm pin
Tiện ích
Bảo mật nâng cao	Mở khóa bằng vân tay, Mở khóa bằng khuôn mặt
Tính năng đặc biệt	Mặt kính 2.5D
Chặn tin nhắn
Chặn cuộc gọi
Đèn pin
Ghi âm	Có
Radio	Đang cập nhật
Xem phim	3GP, MP4, AVI, WMV
Nghe nhạc	AMR, MP3, WAV, WMA, AAC, OGG, FLAC
Thông tin khác
Thời điểm ra mắt	10/2018', N'29.png', CAST(N'2018-03-04T00:00:00.000' AS DateTime), 20, 7, 0)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (30, N'Itel P32', CAST(1890000 AS Decimal(18, 0)), N'Itel P32 mang trong mình thiết kế trẻ trung, sở hữu nhiều màu sắc bắt mắt và đặc biệt là mức giá rất phải chăng hứa hẹn sẽ được rất nhiều các bạn học sinh sinh viên đón nhận.', N'Màn hình
Công nghệ màn hình	IPS LCD
Độ phân giải	WVGA (480 x 960 Pixels)
Màn hình rộng	5.45"
Mặt kính cảm ứng	Kính thường
Camera sau
Độ phân giải	5 MP và 0.3 MP (2 camera)
Quay phim	Có quay phim
Đèn Flash	Có
Chụp ảnh nâng cao	Tự động lấy nét, Chạm lấy nét, HDR, Beautify, Chế độ chụp chuyên nghiệp
Camera trước
Độ phân giải	5 MP
Videocall	Hỗ trợ VideoCall thông qua ứng dụng
Thông tin khác	Chế độ làm đẹp
Hệ điều hành - CPU
Hệ điều hành	Android 8.1 (Oreo)
Chipset (hãng SX CPU)	MT6580 4 nhân 32-bit
Tốc độ CPU	1.3 GHz
Chip đồ họa (GPU)	Mali-400
Bộ nhớ & Lưu trữ
RAM	1 GB
Bộ nhớ trong	8 GB
Bộ nhớ còn lại (khả dụng)	Khoảng 4.85 GB
Thẻ nhớ ngoài	MicroSD, hỗ trợ tối đa 32 GB
Kết nối
Mạng di động	3G
SIM	2 Micro SIM
Wifi	Wi-Fi 802.11 b/g/n, Wi-Fi hotspot
GPS	A-GPS
Bluetooth	Có
Cổng kết nối/sạc	Micro USB
Jack tai nghe	3.5 mm
Kết nối khác	Đang cập nhật
Thiết kế & Trọng lượng
Thiết kế	Nguyên khối
Chất liệu	Nhựa
Kích thước	Dài 148 mm - Ngang 71 mm - Dày 8.9 mm
Trọng lượng	140 g
Thông tin pin & Sạc
Dung lượng pin	4000 mAh
Loại pin	Lithium - Ion
Công nghệ pin	Tiết kiệm pin
Tiện ích
Bảo mật nâng cao	Mở khóa bằng vân tay
Tính năng đặc biệt	Không
Ghi âm	Có
Radio	Có
Xem phim	3GP, MP4
Nghe nhạc	MP3, WAV
Thông tin khác
Thời điểm ra mắt	8/2018', N'30.png', CAST(N'2018-03-04T00:00:00.000' AS DateTime), 15, 12, 1)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (39, N'Sam sungM12', CAST(2560000 AS Decimal(18, 0)), N'<p>yftdytfu</p>
', N'<p>tuytfuytu</p>
', NULL, CAST(N'2018-02-04T00:00:00.000' AS DateTime), 2, 1, 1)
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [GiaBan], [GioiThieu], [MoTaChiTiet], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaHSX], [Moi]) VALUES (40, N'trt', CAST(2560000 AS Decimal(18, 0)), N'<p>ytfhurtyuh</p>
', N'<p>uyu6tyu</p>
', NULL, CAST(N'2018-02-04T00:00:00.000' AS DateTime), 2, 10, 1)
SET IDENTITY_INSERT [dbo].[DienThoai] OFF
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (1, NULL, NULL, CAST(N'2018-12-21T23:51:19.487' AS DateTime), NULL, NULL, N'hau to', N'toconghauh04@yahoo.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (5, NULL, NULL, CAST(N'2018-12-22T00:08:31.100' AS DateTime), NULL, NULL, N'', N'', N'', N'')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (6, NULL, NULL, CAST(N'2018-12-22T00:14:30.193' AS DateTime), NULL, NULL, N'', N'', N'', N'')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (7, NULL, NULL, CAST(N'2018-12-22T00:41:22.643' AS DateTime), NULL, NULL, N'hau to', N'toconghauh@gmail.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (8, NULL, NULL, CAST(N'2018-12-22T00:42:59.563' AS DateTime), NULL, NULL, N'hau to', N'16520359@gm.uit.edu.vn', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (9, NULL, NULL, CAST(N'2018-12-22T00:46:35.440' AS DateTime), NULL, NULL, N'hau to', N'toconghauh@gmail.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (10, NULL, NULL, CAST(N'2018-12-22T00:50:25.270' AS DateTime), NULL, NULL, N'hau to', N'16520359@gm.uit.edu.vn', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (11, NULL, NULL, CAST(N'2018-12-22T00:59:14.563' AS DateTime), NULL, NULL, N'hau to', N'huytodp@gmail.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (12, NULL, NULL, CAST(N'2018-12-22T01:02:20.093' AS DateTime), NULL, NULL, N'hau to', N'huytodp@gmail.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (13, NULL, NULL, CAST(N'2018-12-22T01:14:02.293' AS DateTime), NULL, NULL, N'hau to', N'huytodp@gmail.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (14, NULL, NULL, CAST(N'2018-12-22T01:16:28.933' AS DateTime), NULL, NULL, N'tuiyiuy', N'huytodp@gmail.com', N'16975968y61', N'19')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (15, NULL, NULL, CAST(N'2018-12-22T01:22:40.797' AS DateTime), NULL, NULL, N'hau to', N'huytodp@gmail.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (16, NULL, NULL, CAST(N'2018-12-22T01:23:56.150' AS DateTime), NULL, NULL, N'hau to', N'huytodp@gmail.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (17, NULL, NULL, CAST(N'2018-12-22T01:28:06.667' AS DateTime), NULL, NULL, N'hau to', N'huytodp@gmail.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (18, NULL, NULL, CAST(N'2018-12-22T01:28:33.660' AS DateTime), NULL, NULL, N'hau to', N'16520359@gm.uit.edu.vn', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (19, NULL, NULL, CAST(N'2018-12-22T01:28:49.407' AS DateTime), NULL, NULL, N'hau to', N'toconghauh@yahoo.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (20, NULL, NULL, CAST(N'2018-12-22T01:34:33.830' AS DateTime), NULL, NULL, N'hau to', N'toconghauh@gmail.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (21, NULL, NULL, CAST(N'2018-12-22T01:35:48.083' AS DateTime), NULL, NULL, N'hau to', N'toconghauh@gmail.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (22, NULL, NULL, CAST(N'2018-12-22T01:38:35.383' AS DateTime), NULL, NULL, N'hau to', N'toconghauh@gmail.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (23, NULL, NULL, CAST(N'2018-12-22T01:40:10.800' AS DateTime), NULL, NULL, N'hau to', N'toconghauh04@yahoo.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (24, NULL, NULL, CAST(N'2018-12-22T01:42:43.423' AS DateTime), NULL, NULL, N'hau to', N'toconghauh@gmail.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (25, NULL, NULL, CAST(N'2018-12-22T01:50:49.740' AS DateTime), NULL, NULL, N'hau to', N'toconghauh@gmail.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (26, NULL, NULL, CAST(N'2018-12-22T02:00:35.003' AS DateTime), NULL, NULL, N'hau to', N'toconghauh@gmail.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (27, NULL, NULL, CAST(N'2018-12-22T02:01:59.307' AS DateTime), NULL, NULL, N'hau to', N'toconghauh@gmail.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (28, NULL, NULL, CAST(N'2018-12-22T02:03:59.743' AS DateTime), NULL, NULL, N'hau to', N'toconghauh@gmail.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (29, NULL, NULL, CAST(N'2018-12-22T02:04:47.753' AS DateTime), NULL, NULL, N'hau to', N'toconghauh@yahoo.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (30, NULL, NULL, CAST(N'2018-12-22T02:08:15.247' AS DateTime), NULL, NULL, N'hau to', N'toconghauh@gmail.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (31, NULL, NULL, CAST(N'2018-12-22T08:59:13.260' AS DateTime), NULL, NULL, N'hau to', N'toconghauh@gmail.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (32, NULL, NULL, CAST(N'2018-12-22T10:19:42.633' AS DateTime), NULL, NULL, N'hau to', N'toconghauh@gmail.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (33, NULL, NULL, CAST(N'2018-12-22T10:20:34.677' AS DateTime), NULL, NULL, N'hau to', N'toconghauh@gmail.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (34, NULL, NULL, CAST(N'2018-12-22T10:37:38.873' AS DateTime), NULL, NULL, N'hau to', N'toconghauh@gmail.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (35, NULL, NULL, CAST(N'2018-12-22T10:53:04.217' AS DateTime), NULL, NULL, N'hau to', N'toconghauh@gmail.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (42, NULL, NULL, CAST(N'2018-12-23T13:07:34.487' AS DateTime), NULL, NULL, N'hau to', N'toconghauh@gmail.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
INSERT [dbo].[DonHang] ([MaDH], [DaThanhToan], [TinhTrangGH], [NgayDat], [NgayGiao], [MaKH], [NguoiNhan], [Email], [SoDT], [DiaChi]) VALUES (43, NULL, NULL, CAST(N'2018-12-23T16:33:29.290' AS DateTime), NULL, NULL, N'hau to', N'toconghauh@gmail.com', N'1697596861', N'69/12T Duong 120, Phuong Tan Phu, Quan 9')
SET IDENTITY_INSERT [dbo].[DonHang] OFF
SET IDENTITY_INSERT [dbo].[HangSanXuat] ON 

INSERT [dbo].[HangSanXuat] ([MaHSX], [TenHSX], [LienHe], [TrangThai]) VALUES (1, N'iPhone', NULL, 1)
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenHSX], [LienHe], [TrangThai]) VALUES (2, N'SamSung', NULL, 1)
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenHSX], [LienHe], [TrangThai]) VALUES (3, N'Oppo', NULL, 1)
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenHSX], [LienHe], [TrangThai]) VALUES (4, N'Nokia', NULL, 1)
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenHSX], [LienHe], [TrangThai]) VALUES (5, N'Huawei', NULL, 1)
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenHSX], [LienHe], [TrangThai]) VALUES (6, N'Xiaomi', NULL, 1)
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenHSX], [LienHe], [TrangThai]) VALUES (7, N'Realme', NULL, 1)
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenHSX], [LienHe], [TrangThai]) VALUES (8, N'Vivo', NULL, 1)
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenHSX], [LienHe], [TrangThai]) VALUES (9, N'Philips', NULL, 1)
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenHSX], [LienHe], [TrangThai]) VALUES (10, N'Mobell', NULL, 1)
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenHSX], [LienHe], [TrangThai]) VALUES (11, N'Mobistar', NULL, 1)
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenHSX], [LienHe], [TrangThai]) VALUES (12, N'Itel moibel', NULL, 1)
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenHSX], [LienHe], [TrangThai]) VALUES (13, N'Coolpad', NULL, 1)
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenHSX], [LienHe], [TrangThai]) VALUES (14, N'HTC', NULL, 1)
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenHSX], [LienHe], [TrangThai]) VALUES (15, N'Motorola', NULL, 1)
INSERT [dbo].[HangSanXuat] ([MaHSX], [TenHSX], [LienHe], [TrangThai]) VALUES (19, N'Inovo', N'01697596861', 1)
SET IDENTITY_INSERT [dbo].[HangSanXuat] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [XacNhanMK], [Email], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (4, N'hau to', N'tohau', N'e10adc3949ba59abbe56e057f20f883e', N'e10adc3949ba59abbe56e057f20f883e', N'toconghauh121@gmail.com', N'69/12T Duong 120, Phuong Tan Phu, Quan 9', N'01697596861', N'Nam', CAST(N'1998-04-04T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DienThoai] FOREIGN KEY([MaDT])
REFERENCES [dbo].[DienThoai] ([MaDT])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DienThoai]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonHang] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([MaDH])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonHang]
GO
ALTER TABLE [dbo].[DienThoai]  WITH CHECK ADD  CONSTRAINT [FK_DienThoai_HangSanXuat] FOREIGN KEY([MaHSX])
REFERENCES [dbo].[HangSanXuat] ([MaHSX])
GO
ALTER TABLE [dbo].[DienThoai] CHECK CONSTRAINT [FK_DienThoai_HangSanXuat]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_KhachHang]
GO
USE [master]
GO
ALTER DATABASE [QUANLYBANDIENTHOAI] SET  READ_WRITE 
GO
