USE [CAKESHOP]
GO
/****** Object:  Table [dbo].[ChiTietHD]    Script Date: 7/9/2024 4:05:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHD](
	[MaCT] [int] IDENTITY(1,1) NOT NULL,
	[MaHD] [int] NOT NULL,
	[MaHH] [int] NOT NULL,
	[DonGia] [float] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiamGia] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[MaCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangHoa]    Script Date: 7/9/2024 4:05:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangHoa](
	[MaHH] [int] IDENTITY(1,1) NOT NULL,
	[TenHH] [nvarchar](50) NOT NULL,
	[TenAlias] [nvarchar](50) NULL,
	[MaLoai] [int] NOT NULL,
	[MoTaDonVi] [nvarchar](50) NULL,
	[DonGia] [float] NOT NULL,
	[Hinh] [nvarchar](50) NOT NULL,
	[NgaySX] [datetime] NOT NULL,
	[GiamGia] [float] NOT NULL,
	[SoLanXem] [int] NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[MaNCC] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[MaHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vChiTietHoaDon]    Script Date: 7/9/2024 4:05:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vChiTietHoaDon]
AS 
	SELECT cthd.*, TenHH
	FROM ChiTietHD cthd JOIN HangHoa hh 
		ON hh.MaHH = cthd.MaHH


GO
/****** Object:  Table [dbo].[BanBe]    Script Date: 7/9/2024 4:05:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BanBe](
	[MaBB] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [nvarchar](20) NULL,
	[MaHH] [int] NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[NgayGui] [datetime] NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_Promotions] PRIMARY KEY CLUSTERED 
(
	[MaBB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuDe]    Script Date: 7/9/2024 4:05:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuDe](
	[MaCD] [int] IDENTITY(1,1) NOT NULL,
	[TenCD] [nvarchar](50) NULL,
	[MaNV] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChuDe] PRIMARY KEY CLUSTERED 
(
	[MaCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GopY]    Script Date: 7/9/2024 4:05:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GopY](
	[MaGY] [nvarchar](50) NOT NULL,
	[MaCD] [int] NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[NgayGY] [date] NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](50) NULL,
	[CanTraLoi] [bit] NOT NULL,
	[TraLoi] [nvarchar](50) NULL,
	[NgayTL] [date] NULL,
 CONSTRAINT [PK_GopY] PRIMARY KEY CLUSTERED 
(
	[MaGY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HinhanhSP]    Script Date: 7/9/2024 4:05:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HinhanhSP](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaHH] [int] NULL,
	[HinhAnhPhu] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 7/9/2024 4:05:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [nvarchar](20) NOT NULL,
	[NgayDat] [datetime] NOT NULL,
	[NgayCan] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](60) NOT NULL,
	[DienThoai] [nvarchar](24) NOT NULL,
	[CachThanhToan] [nvarchar](50) NOT NULL,
	[CachVanChuyen] [nvarchar](50) NOT NULL,
	[PhiVanChuyen] [float] NOT NULL,
	[MaTrangThai] [int] NOT NULL,
	[MaNV] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoiDap]    Script Date: 7/9/2024 4:05:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoiDap](
	[MaHD] [int] NOT NULL,
	[CauHoi] [nvarchar](50) NOT NULL,
	[TraLoi] [nvarchar](50) NOT NULL,
	[NgayDua] [date] NOT NULL,
	[MaNV] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_HoiDap] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 7/9/2024 4:05:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nvarchar](20) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[NgaySinh] [datetime] NOT NULL,
	[DiaChi] [nvarchar](60) NULL,
	[DienThoai] [nvarchar](24) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Hinh] [nvarchar](50) NULL,
	[HieuLuc] [bit] NOT NULL,
	[VaiTro] [int] NOT NULL,
	[RandomKey] [varchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 7/9/2024 4:05:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
	[TenLoaiAlias] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
	[Hinh] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 7/9/2024 4:05:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [nvarchar](50) NOT NULL,
	[TenCongTy] [nvarchar](50) NOT NULL,
	[Logo] [nvarchar](50) NOT NULL,
	[NguoiLienLac] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[DienThoai] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 7/9/2024 4:05:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanCong]    Script Date: 7/9/2024 4:05:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanCong](
	[MaPC] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [nvarchar](50) NOT NULL,
	[MaPB] [varchar](7) NOT NULL,
	[NgayPC] [datetime] NULL,
	[HieuLuc] [bit] NULL,
 CONSTRAINT [PK_PhanCong] PRIMARY KEY CLUSTERED 
(
	[MaPC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 7/9/2024 4:05:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[MaPQ] [int] IDENTITY(1,1) NOT NULL,
	[MaPB] [varchar](7) NULL,
	[MaTrang] [int] NULL,
	[Them] [bit] NOT NULL,
	[Sua] [bit] NOT NULL,
	[Xoa] [bit] NOT NULL,
	[Xem] [bit] NOT NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[MaPQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongBan]    Script Date: 7/9/2024 4:05:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan](
	[MaPB] [varchar](7) NOT NULL,
	[TenPB] [nvarchar](50) NOT NULL,
	[ThongTin] [nvarchar](max) NULL,
 CONSTRAINT [PK_PhongBan] PRIMARY KEY CLUSTERED 
(
	[MaPB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangThai]    Script Date: 7/9/2024 4:05:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThai](
	[MaTrangThai] [int] NOT NULL,
	[TenTrangThai] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](500) NULL,
 CONSTRAINT [PK_TrangThai] PRIMARY KEY CLUSTERED 
(
	[MaTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangWeb]    Script Date: 7/9/2024 4:05:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangWeb](
	[MaTrang] [int] IDENTITY(1,1) NOT NULL,
	[TenTrang] [nvarchar](50) NOT NULL,
	[URL] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_TrangWeb] PRIMARY KEY CLUSTERED 
(
	[MaTrang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YeuThich]    Script Date: 7/9/2024 4:05:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YeuThich](
	[MaYT] [int] IDENTITY(1,1) NOT NULL,
	[MaHH] [int] NULL,
	[MaKH] [nvarchar](20) NULL,
	[NgayChon] [datetime] NULL,
	[MoTa] [nvarchar](255) NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[MaYT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietHD] ON 

INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (2, 4, 10011, 485000, 3, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (3, 4, 10033, 1500000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (4, 5, 10037, 48000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (5, 7, 10031, 4100000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (6, 7, 10014, 650000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (7, 7, 10026, 46000, 2, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (8, 8, 10026, 46000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (9, 8, 10014, 650000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (10, 9, 10029, 370000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (11, 9, 10024, 35000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (12, 10, 10012, 595000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (13, 11, 10013, 595000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (17, 14, 10011, 485000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (18, 15, 1009, 416000, 3, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (21, 18, 1002, 735000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (22, 18, 10033, 1500000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (23, 21, 10012, 595000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (24, 22, 10011, 485000, 1, 0)
SET IDENTITY_INSERT [dbo].[ChiTietHD] OFF
GO
SET IDENTITY_INSERT [dbo].[HangHoa] ON 

INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1002, N'Flan Gato Strawberry – Flan Gato Dâu', N'banh-kem-dau.png', 1000, N'Cái', 735000, N'banh-kem-dau.png', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Hương thơm và mùi vị: Ngọt dịu – Béo nhẹ – Thơm – Đắng nhẹ. Cấu trúc bánh:Phần thân bánh gồm các lớp chính:+ Bánh flan vị truyền thống+ Bông lan sô-cô-la. Phần trang trí: jelly caramel, dâu tươi, kem tươi', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1009, N'Flan Gato Berry Mix', N' flan-gato-berry-mix', 1000, N'Cái', 415000, N'khong-logo-2x3_5.png', CAST(N'2023-07-30T07:00:00.000' AS DateTime), 0, 1, N'Phần thân bánh gồm các lớp chính: + Bánh flan vị truyền thống+ Bông lan sô-cô-laPhần trang trí: jelly caramel, dâu tươi, việt quất.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10010, N'Flan Gato Fruit & Pins – Flan Gato Trái Cây', N'flan-gato-fruit-pins', 1000, N'Cái', 515000, N'Flan-ghim-800x1132.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Ngọt dịu – Béo nhẹ – Đắng nhẹ. Cấu trúc bánh: Phần thân bánh gồm các lớp chính:+ Bánh flan vị truyền thống+ Bông lan sô-cô-laPhần trang trí: jelly caramel, vụn bánh gato, dâu tươi, đào, việt quất, kem tươi. Phân loại: Bánh Flan Gato', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10011, N'Tropical Vibes Mousse – Mousse Ổi hồng & Chanh dây', N'mousse-oi-hong-chanh-day', 1001, N'Cái', 485000, N'TAI5791-800x1200.png', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Chua thanh – Ngọt tự nhiên – Thơm nhẹ. Cấu trúc bánh: Phần thân bánh gồm các lớp chính:+ Mousse ổi xá lị, phúc bồn tử, sô-cô-la+ Nhân ổi xá lị+ Bông lan vị vani+ Nhân chanh dâyPhần trang trí: Dâu tươi, jelly, búp kem, sô-cô-la. Phân loại: Bánh mousse', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10012, N'Chéri Lady – Entremet Cherry', N'cheri-lady-entremet-cherry', 1000, N'Cái', 595000, N'Cherry-1-800x1201.png', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 50, N'Ngọt dịu – Chua thanh – Thơm tự nhiên – Béo nhẹ. Cấu trúc bánh:Phần thân bánh gồm các lớp chính:+ Mousse cherry+ Nhân cherry và rượu cherry+ Nhân sô-cô-la tươi vị matcha+ Bông lan vị vaniPhần trang trí: Quả mâm xôi, jelly, sô-cô-la trắng phun xù, tráng gương', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10013, N'Happy Sunrise – Entremet Thanh Trà', N'happy-sunrise-entremet-thanh-tra', 1000, N'Cái', 595000, N'ThanhTra-2-800x1200.png', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 100000, 50, N'Chua ngọt dịu nhẹ – Hương thơm đặc trưng – Thanh mát. Cấu trúc bánh:Phần thân bánh gồm các lớp chính:+ Mousse thanh trà tươi+ Nhân xoài Hoà Lộc, cam Bergamot, vani+ Nhân hạt điều, chà là, dừa sấy+ Bông lan vị matchaPhần trang trí: sô-cô-la trắng tạo hình, tráng gương bóng, hoa cúc tươi.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10014, N'My Muse – Entremet Ôlong Vải Hoa Hồng', N'my-muse-entremet-olong-vai-hoa-hong', 1000, N'Cái', 650000, N'MY-MUSE-1-1.png', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 50, N'Chua ngọt nhẹ –  hương thơm tự nhiênCấu trúc bánh:Phần thân bánh gồm các lớp chính:+ Mousse trà ôlong+ Nhân vải hoa hồng+ Bông lan vị trà ôlongPhần trang trí: Lớp tráng gương bóng bảy, tạo hình hoa trà, vòng tròn sô-cô-la bao quanh.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10015, N'Vani kem tươi socola', N'vani-kem-tuoi-socola', 1000, N'Cái', 270000, N'vani-kemtuoi-socola.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 50, N'Hương vị: Cốt mứt mâm xôi, bông lan truyền thống và kem tươi vani.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10016, N'Bánh Kem Dâu và Vani', N'fresh-strawberry-vanilla-charlotte', 1000, N'Cái', 595000, N'CHARLOTTEBD_01.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 1080, N'Mousse dâu, kem bavaroise vani, mứt dâu, bánh lady fingers, các loại dâu tươi.Cấu trúc bánh:Có chứa Gluten, sữa, trứng, gelatin.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10017, N'Classic Tiramisu Coffee Bean', N'classic-tiramisu-coffee-bean', 1000, N'Cái', 495000, N'CLASSICTIRA01.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 900, N'Bánh lady fingers thấm espresso & rượu rum, kem tiramisu cùng lớp vỏ sô cô la.Cấu trúc bánh:Có chứa Gluten, sữa, trứng, gelatin.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10018, N'Classic Tiramisu Trà Xanh ', N'classic-matcha-tiramisu', 1000, N'Cái', 510000, N'MATCHATIRA01.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 900, N'Bánh quy mềm ngâm mâm xôi & hương thảo, kem tiramisu mềm, phủ kem phô mai matcha.Cấu trúc bánh:Có chứa Gluten, sữa, trứng, gelatin.Hoa ăn được hữu cơ từ Đà Lạt.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10019, N'Su Kem Hạt Phỉ', N'hazelnut-chou', 1001, N'Cái', 105000, N'HAZELNUTCHOCOCHOU_01.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 300, N'Croissant Pháp, praline Hạt Phỉ, kem hạt phỉ, và kem tươi. Cấu trúc bánh:Có chứa Gluten, sữa, trứng, gelatin.Hoa ăn được hữu cơ từ Đà Lạt.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10020, N'Bánh Kem Dâu và Vani', N'fresh-strawberry-vanilla-charlotte', 1001, N'Cái', 101000, N'CHARLOTTEPG_01.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 240, N'Mousse dâu, kem bavaroise vani, mứt dâu, bánh lady finger, dâu tươi từ Đà Lạt và hạt vani', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10021, N'Bánh Ốp La Cheesecake', N'fresh-cake-op-la', 1001, N'Cái', 85000, N'OPLA1.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 10, N'Bánh cheesecake không nướng với kem phô mai & đậu nành, sốt trứng muối, sốt chanh, bánh mirliton không gluten. Được yêu thích tại Bakes!Ít đườngKhông hương liệu nhân tạoKhông chứa gluten', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10022, N'Bánh Kem Chuối và Dừa', N'banana-coconut-mousse', 1001, N'Cái', 95000, N'BANANACOCOMOUSSEPG_01.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 10, N'Mứt chuối, mousse dừa, praliné hạt điều, bánh génoise, kem tươi chuối.Không chứa gluten', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10023, N'Bánh Tiramisu Lava', N'tiramisu-lava', 1001, N'Cái', 110000, N'TIRAMISU1.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 10, N'Bánh lady fingers thấm espresso & rượu rum, kem tiramisu cùng lớp kem phô mai Baileys chảy. Không màu thực phẩmKhông hương liệu nhân tạo. Ít đường', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10024, N'Bánh sừng bò truyền thống (Croissant plain)', N'banh-croissant', 1002, N'Cái', 35000, N'banh-sung-bo-1.png', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 10, N'Bột mì, bơ và các nguyên liệu chất lượng cao khiến chiếc bánh có kết cấu xốp, giòn và rất thơm mùi bơ.Bánh sừng bò là một nét đặc trưng của văn hóa ẩm thực Pháp và rất phổ biến trên toàn châu Âu. Bánh thường được dùng để ăn sáng kèm bơ, mứt cùng trà hoặc café.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10025, N'Bánh sừng bò hạnh nhân (Croissant amandes)', N'banh-sung-bo-hanh-nhan', 1002, N'Cái', 68000, N'banh-sung-bo-hanh-nhan-1.png', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 10, N'Bột mì, bơ, hạnh nhân thái lát và các nguyên liệu chất lượng cao. Chiếc bánh có kết cấu xốp, giòn, rất thơm mùi bơ, hòa quyện cùng vị thơm bùi và giòn tan của hạnh nhân mang đến cảm giác thích thú. Bánh thường được dùng để ăn sáng kèm bơ, mứt cùng trà hoặc café.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10026, N'Bánh sừng bò sô cô la (Croissant au)', N'banh-sung-bo-so-co-la', 1002, N'Cái', 46000, N'croissant-chocolate_2.png', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 11, N'Bột mì, bơ và các nguyên liệu chất lượng cao, đặc biệt là  Sô cô la Pháp thượng hạng. Chiếc bánh có kết cấu xốp, giòn và rất thơm mùi bơ, hòa quyện cùng vị ngọt đắng đầy quyến rũ của sô cô la Pháp. Bánh thường được dùng để ăn sáng kèm bơ, mứt cùng trà hoặc café.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10027, N'Ban Mai', N'bo-hoa-1', 1003, N'Bó', 610000, N'ban-mai-1.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 200, N'Tình yêu luôn là một tình cảm đầy diệu kì mà tinh khiết. Chỉ cần tình yêu, thế giới xung quanh bạn có thể trở thành một màu hồng đầy tươi sáng. 
Bó hoa được lấy cảm hứng từ vẻ đẹp của tình yêu đó, được tạo nên từ những cánh hồng với tông màu pastel cùng cát tường trắng và các loại hoa tươi nhất.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10028, N'Nụ Hoa Hé Mở (Mẫu Đơn)', N'bo-hoa-2', 1003, N'Bó', 2990000, N'mau-don-1.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 200, N'Những bông mẫu đơn hồng tượng trưng cho tình yêu dịu dàng, lãng mạn. Bó hoa cúc mẫu đơn nụ cười dịu dàng sẽ là lựa chọn hoàn hỏa để gửi đến một nửa của bạn trong dịp sinh nhật hay bất cứ ngày đặc biệt nào.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10029, N'Little Tana', N'little-tana', 1003, N'Bó', 370000, N'bo-hoa-cuc-tana-little-tana.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 250, N'Bó hoa Little Tana nhỏ xinh được thiết kế từ hoa cúc tana theo phong cách đơn giản, mộc mạc phù hợp để làm hoa tặng tốt nghiệp hay hoa sinh nhật người thân, bạn bè.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10030, N'Angel Babya', N'Bo-hoa-Angel-Baby', 1003, N'Bó', 1130000, N'Angel_Baby.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 300, N'Bó hoa Little Tana nhỏ xinh được thiết kế từ hoa cúc tana theo phong cách đơn giản, mộc mạc phù hợp để làm hoa tặng tốt nghiệp hay hoa sinh nhật người thân, bạn bè.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10031, N'Kệ Hoa Chúc Mừng - 01', N'hoa-chuc-mung-01', 1003, N'Bó', 4100000, N'hoa-chuc-mung-1.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 123, N'Sản phẩm bao gồm:
+ Hồng Ecuador Free Spirit: 25 Cành
+ Hoa Hồng Tỉ Muội cam: 3 Bó
+ Baby: 1 Bó
+ Lá bạc: 2 Bó
+ Hoa Green Wicky: 2 Bó
+ Chuỗi Ngọc xanh: 1 Bó
+ Lá: 2 Bó
+ Kệ: 1 Cái', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10032, N'Bánh sừng bò trứng muối', N'banh-sung-bo-trung-muoi', 1002, N'Cái', 50000, N'banh-sung-bo-trung-muoi-1.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 300, N'Sự kết hợp hoàn hảo giữa bánh croissant và sốt trứng muối.
Để tăng độ hấp dẫn cho món ăn, BBang đã thêm một loại sốt chấm mới cho bánh croissant. Đó chính là bánh croissant chấm sốt trứng muối. Một chiếc bánh croissant tưởng chừng đơn giản nhưng khi chấm sốt trứng muối lại hòa hợp vô cùng.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10033, N'Kệ Hoa Chúc Mừng - 02', N'ke-hoa-chuc-mung-02', 1003, N'Bó', 1500000, N'ke-hoa-chuc-mung2-1.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 300, N'Sản phẩm bao gồm:
+ Rose Red Naomi PRE: 3 Bó
+ Cây Sen Đá: 5 cây (hình dáng ngẫu nhiên)
+ Hoa Cúc Santini/ Calimero/ Rossi: 3 Bó
+ Lá: 3 Bó
+ Lá Bạc: 1 Bó
+ Kệ Sắt + Giấy/Nơ/Ribbon: 1 Cái', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10037, N'Bánh Mì Hoa Cúc', N'banh-mi-hoa-cuc', 1002, N'Cái', 48000, N'banhmihoacuc.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 250, N'Bánh croissant (hay còn được gọi là bánh sừng bò) - Một loại bánh yêu thích của bao tín đồ “hảo ngọt”. Không chỉ ghi điểm ở phần bánh ngàn lớp thơm mềm mịn, giòn tan, lôi cuốn mà còn bởi sốt chấm đặc biệt.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10053, N'Bánh Tiramisu Xoài và Chanh Dây', N'mango-passionfruit-tiramisu', 1000, N'Cái', 475000, N'MANGOPASSIONFRUITTIRA_01.jpg', CAST(N'2024-06-10T21:36:00.000' AS DateTime), 0, 48, N'Kem tiramisu, mứt xoài và chanh dây, bánh lady fingers thấm xoài và chanh dây, thạch xoài và chanh dây, kem tươi.  🥜 Có Gluten, sữa, trứng, gelatin.  📏 15cm', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10054, N'Bánh Kem Trà Xanh Dâu Latte', N'strawberry-matcha-latte-mousse', 1000, N'Cái', 585000, N'STRAWBERRYMATCHALATTEBD_01.jpg', CAST(N'2024-05-18T21:45:00.000' AS DateTime), 49999, 37, N'Kem matcha, ganache matcha, kem ganache matcha, mousse dâu, bánh lady fingers thấm latte Trà Xanh.  🥜 Có chứa Gluten, sữa, trứng, gelatin 📏 18cm', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10055, N'Bánh Trá Xanh Dâu Latte Croissant', N'strawberry-matcha-latte-croissant', 1002, N'Cái', 64000, N'STRAWBERRYMATCHALATTE_01.jpg', CAST(N'2024-01-09T22:05:00.000' AS DateTime), 0, 12, N'Bánh croissant Sazanka matcha, mứt dâu, kem sữa matcha, ganache matcha', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10056, N'Bánh mì xúc xích', N'banh-mi-xuc', 1002, N'Cái', 35000, N'banh-mi-xuc-xich.jpg', CAST(N'2024-06-13T19:09:00.000' AS DateTime), 0, 3, N'Bánh mặn vui miệng mỗi ngày', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10057, N'Bánh Macaron Trứng Muối Truffle', N'truffle-salted-duck-egg-macaron', 1001, N'Cái', 34000, N'TRUFFLESALTEDDUCKEGG_01.jpg', CAST(N'2024-06-20T19:11:00.000' AS DateTime), 0, 4, N'Bánh macaron kiểu Pháp nhân trứng vịt muối nấm truffle.  Không chứa gluten  Chứa các loại hạt', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10058, N'Bánh Macaron Phô Mai', N'cheese-tart-macaron', 1001, N'Cái', 34000, N'CHEESETART_01.jpg', CAST(N'2024-06-25T19:23:00.000' AS DateTime), 0, 11, N'Bánh macaron kiểu Pháp nhân phô mai', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10059, N'Bánh Macaron Đậu Trắng & Vani', N'whilebean-vani-macaron', 1001, N'Cái', 34000, N'TONKA_VANILLA_01.jpg', CAST(N'2024-06-28T19:31:00.000' AS DateTime), 0, 31, N'Bánh macaron kiểu Pháp nhân phô mai', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10060, N'Berry Cream Cheese Bun', N'berry-cream-cheese-bun', 1001, N'Cái', 62000, N'BERRYCHEESEBUN_01.jpg', CAST(N'2024-06-28T19:31:00.000' AS DateTime), 0, 122, N'Brioche bun, cream cheese filling, fresh berries, berry jam.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10061, N'Bánh mì sữa kiểu Pháp', N'french-milk-bun', 1002, N'Cái', 90000, N'FRENCHMILKBUN_02.jpg', CAST(N'2024-06-22T20:10:00.000' AS DateTime), 30000, 55, N'Một chiếc bánh mì sữa mềm kiểu Pháp hoàn hảo cho bữa sáng với mứt, bơ và một tách cà phê.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10062, N'Bánh Tart Trứng', N'egg-tart', 1002, N'Cái', 69000, N'EGGTART_01.jpg', CAST(N'2024-06-05T20:12:00.000' AS DateTime), 24000, 113, N'Bánh ngọt nhân sữa trứng ngọt nhẹ.   Ít đường  Không màu thực phẩm  Không có thành phần nhân tạo', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10063, N'Green Bliss – Mousse Bơ', N'green-bliss-mousse-bo', 1000, N'Cái', 750000, N'1.jpg', CAST(N'2024-06-21T20:38:00.000' AS DateTime), 150000, 33, N'Ngọt bùi tự nhiên – Hương bơ tươi – Béo nhẹ. Phần thân bánh gồm các lớp chính:  + Mousse bơ tươi  + Bông lan vị vani  Phần trang trí: Bơ, dâu tươi, búp sữa chua', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10064, N'Beloved Summer – Bánh Cuộn Trái Cây Nhiệt Đới', N'beloved-summer-banh-cuon-trai-cay-nhiet-doi', 1000, N'Cái', 415000, N'Beloved-Summer-1.png', CAST(N'2024-06-21T20:41:00.000' AS DateTime), 0, 89, N'Ngọt nhẹ – Béo nhẹ – Thơm tự nhiên Cấu trúc bánh: Phần thân bánh được tạo nên từ cốt bánh Red Velvet cuộn cùng kem phô mai và phủ một lớp sô-cô-la ganache. Bánh được trang trí bởi một lớp kem truyền thống và trái cây tươi nhiệt đới.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10065, N'Bó Hoa Dịu Ngọt Yêu Thương 1', N'bo-hoa-diu-ngot-yeu-thuong-1', 1003, N'Bó', 1050000, N'1712713360_6615ee90b4da8_11zon.jpg', CAST(N'2024-04-08T20:45:00.000' AS DateTime), 200000, 67, N'Mỗi ngày đều là một ngày đặc biệt để bạn thể hiện sự quan tâm, chăm sóc đến những người bạn yêu thương không chỉ bằng những lời chúc ấm áp mà còn bằng những đóa hoa khoe sắc rạng ngời. Hãy để những bông hoa rực rỡ nhất của Dalat Hasfarm được đồng hành cùng bạn trong từng khoảnh khắc đặc biệt, thú vị và đáng quý. Từng loại hoa mang những ý nghĩa đặc biệt', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10069, N'Bó Hoa Giọt Nắng Tinh Khôi', N'bo-hoa-giot-nang-tinh-khoi-1', 1003, N'Bó', 995000, N'giothoatinhkhoi2.jpg', CAST(N'2024-01-30T20:52:00.000' AS DateTime), 100000, 533, N'Bó Hoa Giọt Nắng Tinh Khôi được kết hợp từ hoa Baby và hoa Cúc Tana được trồng, lựa chọn với cẩn thận từ Dalat Hasfarm với chất lượng tươi mới, sạch, an toàn. Hoa Baby và Tana không chỉ xinh xắn mà còn mang trong đó thông điệp về sự trong sáng, trong trẻo và chân thành của tình yêu thương. Việc kết hợp hai loại hoa xinh xắn, ý nghĩa này cùng với lớp giấy gói tinh tế, thắt nơ tỉ mỉ làm tăng thêm vẻ đẹp sang trọng và hoàn hảo cho món quà này. Với Bó Hoa Giọt Nắng Tinh Khôi 056, bạn có thể trao gửi những tình cảm đẹp nhất đến người thân yêu của mình, như một lời chúc tốt đẹp và sự quan tâm chân thành từ trái tim của bạn.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10070, N'Bó Hoa Niềm Vui Rạng Rỡ', N'bo-hoa-niem-vui-rang-ro', 1003, N'Bó', 490000, N'bohoaniemvui5.jpg', CAST(N'2024-06-26T20:55:00.000' AS DateTime), 0, 123, N'Mỗi ngày đều là dịp để chúng ta thể hiện sự quan tâm, chăm sóc và tình yêu thương đến một nửa thế giới không chỉ bằng những lời chúc, quà tặng mà còn bằng những đóa hoa khoe sắc rạng ngời. Những bông hoa tươi thắm từ lâu đã được xem là một vị “sứ giả tinh thần” giúp gửi trao những cảm xúc yêu thương. Những cánh hoa rạng rỡ tươi xinh và ẩn chứa nhiều ý nghĩa sẽ là lựa chọn hoàn hảo nhất để gửi trao những thông điệp hạnh phúc.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10071, N'Hoa Lavender', N'lavender-ngot-ngao', 1003, N'Bó', 300000, N'hoaoaihuong.png', CAST(N'2024-06-04T20:58:00.000' AS DateTime), 0, 44, N'Hoa Oải Hương (Lavender - Lavandula) có nguồn gốc từ khu vực Địa Trung Hải bao gồm miền Nam châu Âu, châu Á và Đông Bắc Phi. Oải Hương (Lavender) nổi tiếng với hương thơm dịu dàng trong hình dáng những bông hoa tím biếc mọc thành chùm trên những nhánh cây mảnh mai, tạo nên vẻ đẹp xinh xắn mộc mạc có phần hoang dại. Provence - Pháp là vùng đất nổi tiếng khắp thế giới với những cánh đồng Hoa Oải Hương rộng lớn và đẹp như tranh vẽ, khiến Hoa Oải Hương trở thành một trong những biểu tượng tiêu biểu nhất của vùng này.  Hoa Oải Hương (Lavender) thường gắn liền với sự tinh khiết, tĩnh lặng, tận tụy, thận trọng, thanh thản, duyên dáng và bình tĩnh. Hoa Oải Hương (Lavender) là loài hoa mang bản chất yên bình, nhẹ nhàng cả về màu sắc từ tím hồng, tím, xanh tím và hương thơm tự nhiên tinh tế. Từ xưa, Hoa Oải Hương (Lavender) đã nổi tiếng nhờ những lợi ích khi không chỉ là biểu tượng tinh tế trong trang trí không gian sống mà còn mang lại nhiều lợi ích sức khỏe bất ngờ. Với hương thơm nhẹ nhàng, thư giãn Lavender có tác dụng giảm căng thẳng, lo âu, giúp thư giãn tinh thần đồng thời có thể giúp cải thiện chất lượng giấc ngủ. ', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10072, N'Bó Cúc Mẫu Đơn ', N'bo-cuc-mau-don', 1003, N'Bó', 430000, N'hoatranquy.jpg', CAST(N'2024-05-02T21:08:00.000' AS DateTime), 0, 111, N'Bó Hoa Trân Quý với 3 cành Cúc Mẫu Đơn tượng trưng cho hạnh phúc, vui vẻ, sắc đẹp thật sự là món quà ý nghĩa và tinh tế để bạn gửi đến người thương. Sự kết hợp hài hòa giữa Cúc Mẫu Đơn và các loại hoa, lá phụ trong bó hoa không chỉ tăng thêm sự đa dạng mà còn mang đến một thông điệp sâu sắc về hạnh phúc và trọn vẹn. Ngoài ra vì đến từ họ nhà Cúc nên Cúc Mẫu đơn cũng mang trên mình ý nghĩa và đặc điểm của hoa Cúc như độ bền cao, mùi hương thoang thoảng dễ chịu và đại diện cho những lời chúc tốt đẹp về sức khỏe, thịnh vượng.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10073, N'Bó Hoa Hồng', N'bo-hoa-hong', 1003, N'Bó', 330000, N'hoahonggai.jpg', CAST(N'2024-01-30T21:14:00.000' AS DateTime), 0, 321, N'Bó Hoa Hồng đong đầy với 3 cành Hoa Hồng mang ý nghĩa của lời tỏ tình chân thành "I love you" thật sự là món quà ý nghĩa và tinh tế để bạn gửi đến người thương. Hoa Hồng không chỉ là biểu tượng của tình yêu mà còn là sự tươi mới và sự đam mê mãnh liệt. Sự kết hợp hài hòa giữa Hoa Hồng và các loại hoa, lá phụ trong bó hoa không chỉ tăng thêm sự đa dạng mà còn mang đến một thông điệp sâu sắc về hạnh phúc và trọn vẹn. Tặng Bó Hoa Yêu Thương Đong Đầy 276 đến người thương chính là gửi trao một cảm giác ấm áp và biết đến được tình cảm sâu sắc mà bạn muốn gửi gắm.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10074, N'Bó Hoa Tinh Khôi', N'bo-hoa-tinh-khoi-2', 1003, N'Bó', 250000, N'cuchoa.jpg', CAST(N'2024-03-06T21:22:00.000' AS DateTime), 0, 42, N'Vì sao nên tặng hoa tươi Dalat Hasfarm để trao gửi yêu thương? Một nghiên cứu của trường đại học Rutgers đã chỉ ra rằng những người nhận được món quà là hoa tươi sẽ có cảm xúc tích cực và vui vẻ trong nhiều ngày liền (Haviland-Jones, 2005). Điều đó đã chứng minh rằng hoa tươi là một trong những món quà tuyệt vời nhất để tạo dấu ấn và mang lại những giây phút hạnh phúc cho một ngày đặc biệt', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10078, N'Hoa Baby nhập khẩu', N'hoa-baby-nhap-khau', 1003, N'Bó', 100000, N'hoabi1.jpg', CAST(N'2004-06-05T00:00:00.000' AS DateTime), 0, 56, N'Hoa Baby (Gypsophila) có nguồn gốc Địa Trung Hải và Đông Âu, tên gọi Baby xuất phát từ tên “Baby’s breath” nghĩa là hơi thở trẻ thơ vì vẻ đẹp thuần khiết và mong manh. Hoa Baby thường được chọn cho bó hoa cưới và các loại hoa truyền thống khác, chẳng hạn như hoa cài áo, hoa cài áo và trang trí đám cưới. Hoa Baby phù hợp để chúc mừng những dịp đặc biệt như chào đón em bé mới chào đời, sinh nhật, các dịp kỷ niệm và ngày lễ tình nhân. Với hình dáng tinh tế, nhẹ nhàng tượng trưng cho sự chân thành, thuần khiết, tình yêu thương, ngây thơ... hoa Baby trở thành một lựa chọn hoàn hảo cho nhiều dịp khác nhau. Baby Flowers by Thanh Thao', N'PT')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10081, N'Beginning of love', N'hoa-bat-dau-tinh-yeu', 1003, N'Bó', 562004, N'Hinh-anh-hoa-baby.jpeg', CAST(N'2004-06-05T00:00:00.000' AS DateTime), 0, 56, N'Hoa bi trắng (hay hoa baby, baby''s breath) tượng trưng cho tình yêu tinh khiết và ngây thơ, trong trắng bởi vẻ đẹp mỏng manh, thanh tao do chính những bông hoa nhỏ xinh mang lại. Loại: Baby Flowers by Thanh Thao', N'PT')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10083, N'Strangely peaceful', N'hoa-baby-xanh', 1003, N'Bó', 562004, N'Bo-hoa-baby-xanh-hoa-bi-xanh.jpg', CAST(N'2004-06-05T00:00:00.000' AS DateTime), 0, 562004, N'Hoa baby màu xanh bình yên và nhớ lại những kỉ niệm xưa, bao nhiêu kí ức tràn về. Ngày ấy nhờ bó hoa baby mà chúng ta gặp nhau ngay giữa cánh đồng baby bất tận. Nhìn hoa baby và nghĩ đến anh, lòng bình yên sau bao nhiêu sóng gió đã trải qua. Bỗng nhiên, bao nhiêu kí ức tràn về. Ngày ấy, nhờ hoa cúc baby mà chúng ta gặp nhau, ngay giữa cánh đồng baby bất tận ở Đà Lạt. Loại: Baby Flowers by Thanh Thao', N'PT')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10090, N'Pháo sáng', N'phao-sang', 1008, N'Gói', 17000, N'phaobongnho.jpg', CAST(N'2021-08-01T15:10:40.857' AS DateTime), 0, 10000, NULL, N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10091, N'Pháo hoa đăng', N'phao-hoa-dang', 1008, N'Gói', 40000, N'phaohoadang.jpg', CAST(N'2014-08-01T15:10:40.857' AS DateTime), 0, 12001, NULL, N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10093, N'Bình xịt tuyết', N'xit-tuyet', 1008, N'Chai', 23000, N'binhxittuyet.jpg', CAST(N'2009-08-01T15:10:40.857' AS DateTime), 0, 1559, NULL, N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10095, N'Nón 12 con giáp', N'non-sinh-nhat-con-giap', 1008, N'Cái', 20000, N'nonhinhthu.jpg', CAST(N'2009-08-01T15:10:40.857' AS DateTime), 0, 1234, NULL, N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10096, N'Nón sinh nhật lớn', N'non-sinh-nhat-lon', 1008, N'Cái', 20000, N'nonsinhnhatlon.jpg', CAST(N'2009-08-01T15:10:40.857' AS DateTime), 0, 4321, NULL, N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10097, N'Nến vỉ nhỏ', N'nen-vi-nho', 1008, N'Hộp', 12000, N'nen-sinh-sinh-nhat.jpg', CAST(N'2009-08-01T15:10:40.857' AS DateTime), 0, 1234, NULL, N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10098, N'Bộ muỗng đĩa bạc', N'bo-muong-dia', 1008, N'Bộ', 15000, N'bomuong9.jpg', CAST(N'2009-08-01T15:10:40.857' AS DateTime), 0, 4321, NULL, N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10100, N'Nến số', N'nen-so', 1008, N'Bộ', 20000, N'nenso.jpg', CAST(N'2024-06-29T10:31:06.500' AS DateTime), 0, 111111, NULL, N'NL')
SET IDENTITY_INSERT [dbo].[HangHoa] OFF
GO
SET IDENTITY_INSERT [dbo].[HinhanhSP] ON 

INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (1, 1002, N'banh-kem-dau1.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (2, 1002, N'banh-kem-dau2.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (3, 1009, N'khong-logo-2x3_2.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (4, 1009, N'khong-logo-2x3_5.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (5, 10010, N'Flan-ghim-800x1132.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (6, 10010, N'khong-logo-2x3_8.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (7, 10010, N'khong-logo-2x3_1.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (8, 10011, N'TAI5791-800x1200.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (9, 10011, N'TAI5954-800x1200.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (10, 10011, N'TAI5896-800x1200.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (11, 10011, N'TAI5909-800x1200.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (12, 10012, N'Cherry-focus-1-800x1200.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (13, 10012, N'Cherry-Slice-1-800x1200.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (14, 10012, N'Cherry-Slice-800x1198.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (15, 10013, N'ThanhTra-2-800x1200.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (16, 10013, N'ThanhTra-topdown-800x1200.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (17, 10013, N'ThanhTra-slice-1-800x1196.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (18, 10014, N'MY-MUSE-1-1.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (19, 10014, N'MY-MUSE-4.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (20, 10014, N'1x1-MY-MUSE-4-800x800.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (21, 10015, N'vani-kemtuoi-socola.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (22, 10016, N'CHARLOTTEBD_01.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (23, 10016, N'CHARLOTTEBD_03_1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (24, 10016, N'CHARLOTTEBD_04_4.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (25, 10017, N'CLASSICTIRA01.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (26, 10017, N'CLASSICTIRA05.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (27, 10017, N'CLASSICTIRA02_1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (28, 10018, N'MATCHATIRA01.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (29, 10018, N'MATCHATIRA05.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (30, 10018, N'MATCHATIRA02.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (31, 10019, N'HAZELNUTCHOCOCHOU_01.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (32, 10019, N'HAZELNUTCHOCOCHOU_05.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (33, 10019, N'HAZELNUTCHOCOCHOU_02.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (34, 10020, N'CHARLOTTEPG_02.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (35, 10020, N'CHARLOTTEPG_03.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (36, 10020, N'CHARLOTTEPG_01.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (37, 10021, N'OPLA1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (38, 10021, N'OPLA3.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (39, 10021, N'OPLA2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (40, 10022, N'BANANACOCOMOUSSEPG_01.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (41, 10022, N'BANANACOCOMOUSSEPG_02.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (43, 10022, N'BANANACOCOMOUSSEPG_03.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (44, 10023, N'TIRAMISU1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (45, 10023, N'TIRAMISU2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (46, 10024, N'banh-sung-bo-2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (47, 10024, N'banh-sung-bo-2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (48, 10025, N'banh-sung-bo-hanh-nhan-2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (49, 10025, N'banh-sung-bo-hanh-nhan-1.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (50, 10026, N'croissant-chocolate_1.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (51, 10026, N'croissant-chocolate_2.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (52, 10027, N'ban-mai-1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (53, 10027, N'ban-mai-2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (54, 10028, N'mau-don-1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (55, 10028, N'mau-don-2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (56, 10029, N'bo-hoa-cuc-tana-little-tana.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (57, 10029, N'bo-hoa-cuc-tana-little-tana2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (58, 10030, N'Angel_Baby.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (59, 10030, N'Angel_Baby1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (60, 10031, N'hoa-chuc-mung-2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (61, 10031, N'hoa-chuc-mung-1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (62, 10032, N'banh-sung-bo-trung-muoi-1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (63, 10032, N'banh-sung-bo-trung-muoi-2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (64, 10031, N'hoa-chuc-mung-3.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (65, 10032, N'banh-sung-bo-trung-muoi-3.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (66, 10033, N'ke-hoa-chuc-mung2-1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (67, 10033, N'ke-hoa-chuc-mung2-2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (68, 10033, N'ke-hoa-chuc-mung2-3.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (69, 10037, N'banhmihoacuc.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (70, 10037, N'banhmihoacuc1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (71, 10037, N'banhmihoacuc2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (72, 10028, N'mau-don-3.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (74, 10015, N'vani-kemtuoi-socola2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (78, 1002, N'banh-kem-dau.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (79, 10053, N'MANGOPASSIONFRUITTIRA_01.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (80, 10053, N'MANGOPASSIONFRUITTIRA_03.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (81, 10053, N'MANGOPASSIONFRUITTIRA_05.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (82, 10054, N'STRAWBERRYMATCHALATTEBD_04.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (83, 10054, N'STRAWBERRYMATCHALATTEBD_03.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (84, 10054, N'STRAWBERRYMATCHALATTEBD_01.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (85, 10055, N'STRAWBERRYMATCHALATTE_02.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (86, 10055, N'STRAWBERRYMATCHALATTE_03.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (88, 10056, N'banh-mi-xuc-xich1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (89, 10057, N'TRUFFLESALTEDDUCKEGG_01.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (90, 10057, N'TRUFFLESALTEDDUCKEGG_02.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (91, 10058, N'CHEESETART_01.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (92, 10058, N'CHEESETART_02.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (93, 10060, N'BERRYCHEESEBUN_01.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (94, 10060, N'BERRYCHEESEBUN_02.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (95, 10060, N'BERRYCHEESEBUN_03.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (96, 10061, N'FRENCHMILKBUN_01.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (97, 10061, N'FRENCHMILKBUN_03.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (98, 10061, N'FRENCHMILKBUN_02.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (99, 10062, N'EGGTART_01.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (100, 10062, N'EGG_TART_3.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (101, 10062, N'EGGTART_02.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (102, 10063, N'1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (103, 10063, N'2-1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (104, 10063, N'3.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (105, 10064, N'Beloved-Summer-1.png')
GO
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (107, 10064, N'Beloved-Summer-3.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (108, 10064, N'Beloved-Summer-4.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (109, 10065, N'1712713360_6615ee90b4da8_11zon.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (110, 10065, N'1712713362_6615ee921c925_11zon.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (111, 10065, N'1712713366_6615ee96614ad_11zon.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (112, 10069, N'giothoatinhkhoi.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (113, 10069, N'giothoatinhkhoi2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (114, 10069, N'giothoatinhkhoi3.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (115, 10070, N'bohoaniemvui.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (116, 10070, N'bohoaniemvui2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (117, 10070, N'bohoaniemvui3.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (118, 10070, N'bohoaniemvui3.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (119, 10070, N'bohoaniemvui4.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (120, 10071, N'hoaoaihuong.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (121, 10071, N'hoaoaihuong2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (122, 10071, N'hoaoaihuong3.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (123, 10072, N'hoatranquy.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (124, 10072, N'hoatranquy2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (125, 10072, N'hoatranquy3.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (126, 10073, N'hoahonggai.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (127, 10073, N'hoahonggai1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (128, 10073, N'hoahonggai2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (129, 10074, N'cuchoa.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (130, 10074, N'cuchoa2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (131, 10074, N'cuchoa3.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (132, 10059, N'TONKA_VANILLA_01.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (133, 10059, N'CARAMEL_SAPODILLA_02.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (134, 10059, N'TONKA_VANILLA_03.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (135, 10056, N'banh-mi-xuc-xich.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (136, 10056, N'banh-mi-xuc-xich2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (137, 10078, N'hoabi.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (138, 10078, N'hoabi2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (139, 10078, N'hoabi1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (140, 10081, N'Hinh-anh-hoa-baby1.jpeg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (141, 10081, N'Hinh-anh-hoa-baby2.jpeg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (142, 10081, N'Hinh-anh-hoa-baby.jpeg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (143, 10083, N'Bo-hoa-baby-xanh-hoa-bi-xanh.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (144, 10083, N'Bo-hoa-baby-xanh-hoa-bi-xanh1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (145, 10083, N'Bo-hoa-baby-xanh-hoa-bi-xanh3.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (146, 10090, N'phaobongnho.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (147, 10091, N'phaohoadang.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (148, 10093, N'binhxittuyet.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (149, 10095, N'nonhinhthu.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (150, 10096, N'nonsinhnhatlon.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (151, 10097, N'nen-sinh-sinh-nhat.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (152, 10098, N'bomuong9.jpg')
SET IDENTITY_INSERT [dbo].[HinhanhSP] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (4, N'phamtuyen121314', CAST(N'2024-06-21T09:52:39.770' AS DateTime), CAST(N'2024-06-21T09:52:39.873' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Nguyễn Phạm Tuyên', N'Xã Bông Trang', N'0943948068', N'COD', N'Viettel Post', 0, 0, NULL, N'1')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (5, N'phamtuyen121314', CAST(N'2024-06-21T09:56:05.917' AS DateTime), CAST(N'2024-06-21T09:56:06.020' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Nguyễn Phạm Tuyên', N'Xã Bông Trang', N'0943948068', N'COD', N'Viettel Post', 0, 0, NULL, N'Giao liền cho anh')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (6, N'phamtuyen121314', CAST(N'2024-06-29T10:30:21.303' AS DateTime), CAST(N'2024-06-29T10:30:21.507' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Nguyễn Phạm Tuyên', N'Quận 4', N'0901002220', N'COD', N'Viettel Post', 0, 0, NULL, N'Giao trong ngày nhé')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (7, N'phamtuyen121314', CAST(N'2024-06-29T10:31:06.487' AS DateTime), CAST(N'2024-06-29T10:31:06.500' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Nguyễn Phạm Tuyên', N'Xã Bông Trang', N'0943948068', N'COD', N'Viettel Post', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (8, N'phamtuyen121314', CAST(N'2024-06-29T10:31:23.897' AS DateTime), CAST(N'2024-06-29T10:31:23.907' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Nguyễn Phạm Tuyên', N'Xã Bông Trang', N'0943948068', N'COD', N'Viettel Post', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (9, N'phamtuyen121314', CAST(N'2024-06-29T10:32:05.657' AS DateTime), CAST(N'2024-06-29T10:32:05.657' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Nguyễn Phạm Tuyên', N'Xã Bông Trang', N'0943948068', N'COD', N'Viettel Post', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10, N'vubeo', CAST(N'2024-07-01T13:56:12.347' AS DateTime), CAST(N'2024-07-02T13:56:12.347' AS DateTime), CAST(N'2024-07-06T13:56:12.350' AS DateTime), N'TRần Nhật Vũ', N'Quận 2, Thảo Điền', N'0988000111', N'COD', N'Viettel Post', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11, N'phamtuyen121314', CAST(N'2024-07-01T14:02:45.813' AS DateTime), CAST(N'2024-07-02T14:02:45.813' AS DateTime), CAST(N'2024-07-06T14:02:45.813' AS DateTime), N'Nguyễn Phạm Tuyên', N'Xã Bông Trang', N'0943948068', N'COD', N'Viettel Post', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (14, N'vubeo', CAST(N'2024-07-01T17:59:04.153' AS DateTime), CAST(N'2024-07-02T17:59:04.153' AS DateTime), CAST(N'2024-07-06T17:59:04.153' AS DateTime), N'TRần Nhật Vũ', N'Quận 2, Thảo Điền', N'0988000111', N'COD', N'Viettel Post', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (15, N'vubeo', CAST(N'2024-07-01T17:59:37.470' AS DateTime), CAST(N'2024-07-02T17:59:37.470' AS DateTime), CAST(N'2024-07-06T17:59:37.470' AS DateTime), N'TRần Nhật Vũ', N'Quận 2, Thảo Điền', N'0988000111', N'COD', N'Viettel Post', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (16, N'vubeo', CAST(N'2024-07-01T18:00:15.287' AS DateTime), CAST(N'2024-07-02T18:00:15.287' AS DateTime), CAST(N'2024-07-06T18:00:15.287' AS DateTime), N'Trần Văn Dẹp', N'Quận Cam', N'0380011101', N'COD', N'Viettel Post', 0, 0, NULL, N'Giao cho anh')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (17, N'vubeo', CAST(N'2024-07-01T18:00:36.887' AS DateTime), CAST(N'2024-07-02T18:00:36.887' AS DateTime), CAST(N'2024-07-06T18:00:36.887' AS DateTime), N'TRần Nhật Vũ', N'Quận 2, Thảo Điền', N'0988000111', N'COD', N'Viettel Post', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (18, N'phamtuyen121314', CAST(N'2024-07-01T18:24:22.060' AS DateTime), CAST(N'2024-07-02T18:24:22.060' AS DateTime), CAST(N'2024-07-06T18:24:22.060' AS DateTime), N'Nguyễn Phạm Tuyên', N'Xã Bông Trang', N'0943948068', N'Thanh toán trực tuyến VNPay', N'Viettel Post', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (19, N'phamtuyen121314', CAST(N'2024-07-01T18:46:50.177' AS DateTime), CAST(N'2024-07-02T18:46:50.177' AS DateTime), CAST(N'2024-07-06T18:46:50.177' AS DateTime), N'Trần Văn Tàu', N'Quận Cam', N'0380011101', N'Thanh toán trực tuyến VNPay', N'Viettel Post', 0, 0, NULL, N'Giao đúng hẹn')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (21, N'phamtuyen121314', CAST(N'2024-07-01T18:50:56.973' AS DateTime), CAST(N'2024-07-02T18:50:56.973' AS DateTime), CAST(N'2024-07-06T18:50:56.973' AS DateTime), N'Nguyễn Phạm Tuyên', N'Xã Bông Trang', N'0943948068', N'Thanh toán trực tuyến VNPay', N'J&T Express', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (22, N'phamtuyen121314', CAST(N'2024-07-03T15:22:16.167' AS DateTime), CAST(N'2024-07-04T15:22:16.167' AS DateTime), CAST(N'2024-07-08T15:22:16.167' AS DateTime), N'Nguyễn Phạm Tuyên', N'Xã Bông Trang', N'0943948068', N'Thanh toán tiền mặt COD', N'J&T Express', 0, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'phamtuyen121314', N'3614234beb3ca1e92045b18e8d21e5e0', N'Nguyễn Phạm Tuyên', 1, CAST(N'2003-10-22T00:00:00.000' AS DateTime), N'Xã Bông Trang', N'0943948068', N'phamtuyen121314@gmail.com', N'c88bc794-32ed-48d5-bac9-4a1627f0992a.jpg', 1, 0, N'pDwmhq')
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'PICCO', N'iloveyou', N'Georg Pipps', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Geislweg 14', N'6562-9722', N'picco@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'PRINI', N'49997d62a0f376f1220695f55cfc3054', N'Isabel de Castro', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Estrada da saúde n. 58', N'(1) 356-5634', N'prini@abc.com', N'User.jpg', 0, 0, N'hiFIzx')
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'QUEEN', N'iloveyou', N'Lúcia Carvalho', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Alameda dos Canàrios, 891', N'(11) 555-1189', N'queen@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'QUICK', N'iloveyou', N'Horst Kloss', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Taucherstraße 10', N'0372-035188', N'quick@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'RANCH', N'iloveyou', N'Sergio Gutiérrez', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Av. del Libertador 900', N'(1) 123-5555', N'ranch@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'RATTC', N'iloveyou', N'Paula Wilson', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'2817 Milton Dr.', N'(505) 555-5939', N'rattc@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'REGGC', N'iloveyou', N'Maurizio Moroni', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Strada Provinciale 124', N'0522-556721', N'reggc@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'RICAR', N'iloveyou', N'Janete Limeira', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Av. Copacabana, 267', N'(21) 555-3412', N'ricar@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'RICSU', N'iloveyou', N'Michael Holz', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Grenzacherweg 237', N'0897-034214', N'ricsu@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'ROMEY', N'iloveyou', N'Alejandra Camino', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Gran Vía, 1', N'(91) 745 6200', N'romey@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'SANTG', N'iloveyou', N'Jonas Bergulfsen', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Erling Skakkes gate 78', N'07-98 92 35', N'santg@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'SAVEA', N'iloveyou', N'Jose Pavarotti', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'187 Suffolk Ln.', N'(208) 555-8097', N'savea@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'SEVES', N'iloveyou', N'Hari Kumar', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'90 Wadhurst Rd.', N'(171) 555-1717', N'seves@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'SIMOB', N'iloveyou', N'Jytte Petersen', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Vinbæltet 34', N'31 12 34 56', N'simob@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'SPECD', N'iloveyou', N'Dominique Perrier', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'25, rue Lauriston', N'(1) 47.55.60.10', N'specd@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'SPLIR', N'iloveyou', N'Art Braunschweiger', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'P.O. Box 555', N'(307) 555-4680', N'splir@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'SUPRD', N'iloveyou', N'Pascale Cartrain', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Boulevard Tirou, 255', N'(071) 23 67 22 20', N'suprd@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'THEBI', N'iloveyou', N'Liz Nixon', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'89 Jefferson Way Suite 2', N'(503) 555-3612', N'thebi@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'THECR', N'iloveyou', N'Liu Wong', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'55 Grizzly Peak Rd.', N'(406) 555-5834', N'thecr@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'TOMSP', N'iloveyou', N'Karin Josephs', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Luisenstr. 48', N'0251-031259', N'tomsp@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'TORTU', N'iloveyou', N'Miguel Angel Paolino', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Avda. Azteca 123', N'(5) 555-2933', N'tortu@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'TRADH', N'iloveyou', N'Anabela Domingues', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Av. Inês de Castro, 414', N'(11) 555-2167', N'tradh@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'TRAIH', N'iloveyou', N'Helvetius Nagy', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'722 DaVinci Blvd.', N'(206) 555-8257', N'traih@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'VAFFE', N'iloveyou', N'Palle Ibsen', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Smagsloget 45', N'86 21 32 43', N'vaffe@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'VICTE', N'iloveyou', N'Mary Saveley', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'2, rue du Commerce', N'78.32.54.86', N'victe@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'VINET', N'iloveyou', N'Paul Henriot', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'59 rue de l''Abbaye', N'26.47.15.10', N'vinet@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'vubeo', N'192e10984ea77b138bb380fa0cf56273', N'TRần Nhật Vũ', 1, CAST(N'2003-01-07T00:00:00.000' AS DateTime), N'Quận 2, Thảo Điền', N'0988000111', N'vubeo@gmail.com', N'5b36b1de-1ec5-4f2f-8b15-a99cc264d802.jpg', 1, 0, N'982021')
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'WARTH', N'iloveyou', N'Pirkko Koskitalo', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Torikatu 38', N'981-443655', N'warth@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'WELLI', N'iloveyou', N'Paula Parente', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Rua do Mercado, 12', N'(14) 555-8122', N'welli@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'WHITC', N'iloveyou', N'Karl Jablonski', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'305 - 14th Ave. S. Suite 3B', N'(206) 555-4112', N'whitc@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'WILMK', N'iloveyou', N'Matti Karttunen', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Keskuskatu 45', N'90-224 8858', N'wilmk@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'WOLZA', N'iloveyou', N'Zbyszek Piestrzeniewicz', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'ul. Filtrowa 68', N'(26) 642-7012', N'wolza@abc.com', N'User.jpg', 0, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Loai] ON 

INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1000, N'Bánh kem', N'banh-kem', N'Bánh kem ngon và đa dạng', N'MY-MUSE-1-1.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1001, N'Bánh ngọt', N'banh-ngot', N'Bánh ngọt phong phú và hấp dẫn', N'Certificate.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1002, N'Bánh mặn', N'banh-man', N'Bánh mặn thơm ngon và đa dạng', N'banh-sung-bo-hanh-nhan-1.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1003, N'Hoa tươi', N'hoa-tuoi', N'Các loại hoa tươi đẹp và tươi mới', N'Bell.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1008, N'Sản phẩm khác', N'san-pham-khac', N'Các dụng cụ trang chí, đồ vật hỗ trợ cho buổi tiệc', N'phaobongnho.jpg')
SET IDENTITY_INSERT [dbo].[Loai] OFF
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'HH', N'Hoai Hieu Bakery', N'hieukhung.bakery.jpg', N'Nguyễn Thị Hoài Hiếu', N'hieukhungroi@gmail.com', N'0901002220', N'Binh Chanh', N'Công ty chuyên bánh bao, bánh răng')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'NL', N'NhaLam', N'apple.gif', N'Pham Tuyen', N'pike@yahoo.com', N'0987345876', N'765 Hello, Califonia, United States', N'Cake Shop')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'PT', N'Phuong Thanh Bakery', N'phuongthanh.meomeo.bakery', N'Phan Thị Phương Thanh', N'thanhchodien@gmail.com', N'0730889210', N'Vincom ThuDuc', N'Công ty đồ ăn vặt bên trong bệnh viện trung ương 3')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'PTu', N'Phạm Tuyên R&B', N'famtwen22.png', N'Nguyễn Phạm Tuyên', N'nptuyen121314@gmail.com', N'0380011101', N'Tăng Nhơn Phú', N'Công ty chuyên môi giới đồ ăn, sản phẩm chất lượng thấp VN')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'VB', N'Vu Beo Bakery', N'vubeo.bakery.webp', N'Trần Nhật Vũ', N'trannhatvu@gmail.com', N'087355122', N'Thao Dien', N'Công ty chuyên bánh ngọt, bánh xe')
GO
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau]) VALUES (N'lvc', N'Lê Văn C', N'lvc@gmail.com', N'8fb31c8536177f3c388cf45a650de3f6')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau]) VALUES (N'nva', N'Trần Văn A', N'tva@gmail.com', N'8fb31c8536177f3c388cf45a650de3f6')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau]) VALUES (N'nvb', N'Nguyễn Văn B', N'nvb@gmail.com', N'8fb31c8536177f3c388cf45a650de3f6')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau]) VALUES (N'phamtuyenad', N'Nguyễn Phạm Tuyên', N'phamtuyen121314@gmail.com', N'672da35ad5b262e2e69afb6fd68ce8cb')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau]) VALUES (N'tranvanq', N'Trần Thị A', N'wiener@tikitaka.net', N'8fb31c8536177f3c388cf45a650de3f6')
GO
SET IDENTITY_INSERT [dbo].[PhanCong] ON 

INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (2, N'nva', N'BGD', CAST(N'2017-11-11T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (3, N'lvc', N'BGD', CAST(N'2017-12-17T10:15:51.303' AS DateTime), 1)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (7, N'nvb', N'PKT', CAST(N'2017-12-17T10:16:39.180' AS DateTime), 0)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (12, N'phamtuyenad', N'BGD', CAST(N'2024-05-17T10:16:39.180' AS DateTime), 0)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (20, N'tranvanq', N'PKTo', CAST(N'2024-06-11T06:05:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[PhanCong] OFF
GO
SET IDENTITY_INSERT [dbo].[PhanQuyen] ON 

INSERT [dbo].[PhanQuyen] ([MaPQ], [MaPB], [MaTrang], [Them], [Sua], [Xoa], [Xem]) VALUES (16, N'BGD', 1, 0, 0, 0, 0)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaPB], [MaTrang], [Them], [Sua], [Xoa], [Xem]) VALUES (17, N'BGD', 2, 0, 0, 0, 0)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaPB], [MaTrang], [Them], [Sua], [Xoa], [Xem]) VALUES (18, N'BGD', 3, 0, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[PhanQuyen] OFF
GO
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'BGD', N'Ban Giám Đốc', N'Chỉ thị mọi nhiệm vụ công tác phải làm. Đề xuất các mục tiêu dự kiến trong quý.')
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'DVL', N'Develoment', N'Phụ trách việc chỉnh sửa website của Công Ty')
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'PKD', N'Phòng kinh doanh', N'Phân tích các sản phẩm bán được. Dự kiến nguồn Sale và đề xuất tăng trưởng số xuất bán của các mặt hàng.')
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'PKT', N'Phòng Kỹ thuật', N'Nhận thông tin điều chỉnh và phát triển các kỹ thuật tại doanh nghiệp, đảm nhận nhiệm vụ hỗ trợ mở rộng các doanh nghiệp mới.')
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'PKTo', N'Phòng Kế toán', N'Thu thập dữ liệu và đưa ra sơ đồ tổng thể từng hạng mục cho phòng ban Kinh Doanh.')
GO
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (-1, N'Khách hàng hủy đơn hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (0, N'Mới đặt hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (1, N'Đã thanh toán', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (2, N'Chờ giao hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (3, N'Đã giao hàng', NULL)
GO
SET IDENTITY_INSERT [dbo].[TrangWeb] ON 

INSERT [dbo].[TrangWeb] ([MaTrang], [TenTrang], [URL]) VALUES (1, N'Trang chủ Admin', N'Default.aspx')
INSERT [dbo].[TrangWeb] ([MaTrang], [TenTrang], [URL]) VALUES (2, N'Quản lý Đơn hàng', N'QLDonHang.aspx')
INSERT [dbo].[TrangWeb] ([MaTrang], [TenTrang], [URL]) VALUES (3, N'Quản lý Hàng hóa', N'QLHangHoa.aspx')
SET IDENTITY_INSERT [dbo].[TrangWeb] OFF
GO
ALTER TABLE [dbo].[BanBe] ADD  CONSTRAINT [DF_Promotions_Sent]  DEFAULT (getdate()) FOR [NgayGui]
GO
ALTER TABLE [dbo].[ChiTietHD] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [DonGia]
GO
ALTER TABLE [dbo].[ChiTietHD] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[ChiTietHD] ADD  CONSTRAINT [DF_Order_Details_Discount]  DEFAULT ((0)) FOR [GiamGia]
GO
ALTER TABLE [dbo].[GopY] ADD  CONSTRAINT [DF_GopY_NgayGY]  DEFAULT (getdate()) FOR [NgayGY]
GO
ALTER TABLE [dbo].[GopY] ADD  CONSTRAINT [DF_GopY_CanTraLoi]  DEFAULT ((0)) FOR [CanTraLoi]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [DonGia]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_ProductDate]  DEFAULT (getdate()) FOR [NgaySX]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_Discount]  DEFAULT ((0)) FOR [GiamGia]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_Votes]  DEFAULT ((0)) FOR [SoLanXem]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [NgayDat]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_RequireDate]  DEFAULT (getdate()) FOR [NgayCan]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_ShippedDate]  DEFAULT (((1)/(1))/(1900)) FOR [NgayGiao]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_PaymentMethod]  DEFAULT (N'Cash') FOR [CachThanhToan]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_ShippingMethod]  DEFAULT (N'Airline') FOR [CachVanChuyen]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_Freight]  DEFAULT ((0)) FOR [PhiVanChuyen]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_Status]  DEFAULT ((0)) FOR [MaTrangThai]
GO
ALTER TABLE [dbo].[HoiDap] ADD  CONSTRAINT [DF_HoiDap_NgayDua]  DEFAULT (getdate()) FOR [NgayDua]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Gender]  DEFAULT ((0)) FOR [GioiTinh]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Birthday]  DEFAULT (getdate()) FOR [NgaySinh]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Photo]  DEFAULT (N'Photo.gif') FOR [Hinh]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Active]  DEFAULT ((0)) FOR [HieuLuc]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_UserLevel]  DEFAULT ((0)) FOR [VaiTro]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Them]  DEFAULT ((0)) FOR [Them]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Sua]  DEFAULT ((0)) FOR [Sua]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Xoa]  DEFAULT ((0)) FOR [Xoa]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Xem]  DEFAULT ((0)) FOR [Xem]
GO
ALTER TABLE [dbo].[BanBe]  WITH CHECK ADD  CONSTRAINT [FK_BanBe_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[BanBe] CHECK CONSTRAINT [FK_BanBe_KhachHang]
GO
ALTER TABLE [dbo].[BanBe]  WITH CHECK ADD  CONSTRAINT [FK_QuangBa_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BanBe] CHECK CONSTRAINT [FK_QuangBa_HangHoa]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[ChuDe]  WITH CHECK ADD  CONSTRAINT [FK_ChuDe_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChuDe] CHECK CONSTRAINT [FK_ChuDe_NhanVien]
GO
ALTER TABLE [dbo].[GopY]  WITH CHECK ADD  CONSTRAINT [FK_GopY_ChuDe] FOREIGN KEY([MaCD])
REFERENCES [dbo].[ChuDe] ([MaCD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GopY] CHECK CONSTRAINT [FK_GopY_ChuDe]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[HinhanhSP]  WITH CHECK ADD  CONSTRAINT [FK__HinhanhSP__MaHH__18EBB532] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
GO
ALTER TABLE [dbo].[HinhanhSP] CHECK CONSTRAINT [FK__HinhanhSP__MaHH__18EBB532]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_TrangThai] FOREIGN KEY([MaTrangThai])
REFERENCES [dbo].[TrangThai] ([MaTrangThai])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_TrangThai]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[HoiDap]  WITH CHECK ADD  CONSTRAINT [FK_HoiDap_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoiDap] CHECK CONSTRAINT [FK_HoiDap_NhanVien]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_NhanVien]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_PhongBan] FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_PhongBan]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_PhongBan] FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_PhongBan]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_TrangWeb] FOREIGN KEY([MaTrang])
REFERENCES [dbo].[TrangWeb] ([MaTrang])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_TrangWeb]
GO
ALTER TABLE [dbo].[YeuThich]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Customers] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[YeuThich] CHECK CONSTRAINT [FK_Favorites_Customers]
GO
ALTER TABLE [dbo].[YeuThich]  WITH CHECK ADD  CONSTRAINT [FK_YeuThich_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[YeuThich] CHECK CONSTRAINT [FK_YeuThich_HangHoa]
GO
