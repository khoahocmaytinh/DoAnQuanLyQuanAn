Create database QuanLyQuanAn
Go
Use QuanLyQuanAn
Go

-- Bất kì (có thể là kỳ, k nhớ rõ lắm) table nèo cũng có trường ID, và đây sẽ là khóa chính
-- Lợi ích: sau này truy vấn sẽ rất dễ dàng, việc thêm xóa sửa cũng rất tiện lợi
Create table BAN_AN
(
	ID int identity primary key, -- tăng tự động ID
	TenBan nvarchar(50) not null,
	TinhTrang nvarchar(30) not null default N'Trống' -- Có Người || Còn Trống..., mặt định là trống
	
)
Go
Create table TAI_KHOAN
(
	UserName nvarchar(100) primary key,
	PassWord nvarchar(100) not null,
	TenHienThi nvarchar(100) not null,
	LoaiTaiKhoan int not null /*loại tài khoãn.  1: admin hệ thống quản lý
								2: admin hệ thống tổng đài
								3: nhân viên bán hàng tại chi nhánh */
						
)
Go
Create table LOAI_MONAN
(
	ID int identity primary key,
	TenLoai nvarchar(100) not null
)
Go
Create table MONAN
(
	ID int identity primary key,
	TenMonAn nvarchar(100) not null,
	IDLoaiMonAn int not null,
	DonGia decimal not null,
	SoLuongTrongKho int not null
	
	foreign key (IDLoaiMonAn) references dbo.LOAI_MONAN(ID)
)
Go
Create table HOADON
(
	ID int identity primary key,
	NgayLap date not null,
	IDBanAn int not null,
	TinhTrang nvarchar(30) not null -- Được tính tiền hay chưa
	foreign key (IDBanAn) references dbo.BAN_AN(ID)
)
Go
Create table info_HOADON 
(
	ID int identity primary key,
	IDHoaDon int not null,
	IDMonAn int not null,
	TenMonAn nvarchar(100) not null,
	DonGia varchar(20) not null,--Lý do: 2 dữ liệu này sẽ nhận từ bên form
	SoLuong varchar(10) not null
	foreign key (IDHoaDon) references dbo.HOADON(ID),
	foreign key (IDMonAn) references dbo.MONAN(ID)
)
Go
Create table CHI_NHANH
(
	ID int identity primary key,
	TenCN nvarchar(100) not null,
	DiaChi nvarchar(100) not null,
	LienHe varchar(20) not null,
	SoLuongBan int not null
)
Go
Create table MENU_CN
(
	ID int identity primary key,
	IDChiNhanh int not null,
	IDLoaiMonAn int not null,
	IDMonAn int not null,
	DonGia decimal not null
	foreign key (IDChiNhanh) references dbo.CHI_NHANH(ID),
	foreign key (IDLoaiMonAn) references dbo.LOAI_MONAN(ID),
	foreign key (IDMonAn) references dbo.MONAN(ID)
)
Go
Create table DONHANG_TONGDAI
(
	ID int identity primary key,
	IDChiNhanh int not null,
	TenMonAn nvarchar(100) not null,
	SoLuong int not null,
	DiaChi nvarchar(100) not null
	foreign key (IDChiNhanh) references dbo.CHI_NHANH(ID)
)
Go

insert into TAI_KHOAN(UserName,PassWord,TenHienThi,LoaiTaiKhoan)
values (N'Admin', N'admin', N'Ferocious',1)
insert into TAI_KHOAN(UserName,PassWord,TenHienThi,LoaiTaiKhoan)
values (N'Admin2', N'admin2', N'Ferocious2',2)
insert into TAI_KHOAN(UserName,PassWord,TenHienThi,LoaiTaiKhoan)
values (N'Admin3', N'admin3', N'Ferocious3',3)
Go

insert into LOAI_MONAN(TenLoai)
values (N'Tôm')
insert into LOAI_MONAN(TenLoai)
values (N'Cua')
insert into LOAI_MONAN(TenLoai)
values (N'Cá')
insert into LOAI_MONAN(TenLoai)
values (N'Nai')
insert into LOAI_MONAN(TenLoai)
values (N'Bầu')
insert into LOAI_MONAN(TenLoai)
values (N'Gà')
Go

insert into BAN_AN(TenBan,TinhTrang)
values (N'Bàn 1',N'Trống')
insert into BAN_AN(TenBan,TinhTrang)
values (N'Bàn 2',N'Trống')
insert into BAN_AN(TenBan,TinhTrang)
values (N'Bàn 3',N'Trống')
insert into BAN_AN(TenBan,TinhTrang)
values (N'Bàn 4',N'Có Người')
insert into BAN_AN(TenBan,TinhTrang)
values (N'Bàn 5',N'Trống')
insert into BAN_AN(TenBan,TinhTrang)
values (N'Bàn 6',N'Trống')
insert into BAN_AN(TenBan,TinhTrang)
values (N'Bàn 7',N'Trống')
insert into BAN_AN(TenBan,TinhTrang)
values (N'Bàn 8',N'Trống')
insert into BAN_AN(TenBan,TinhTrang)
values (N'Bàn 9',N'Trống')
insert into BAN_AN(TenBan,TinhTrang)
values (N'Bàn 10',N'Trống')
insert into BAN_AN(TenBan,TinhTrang)
values (N'Bàn 11',N'Có Người')
insert into BAN_AN(TenBan,TinhTrang)
values (N'Bàn 12',N'Trống')
insert into BAN_AN(TenBan,TinhTrang)
values (N'Bàn 13',N'Trống')
insert into BAN_AN(TenBan,TinhTrang)
values (N'Bàn 14',N'Trống')
insert into BAN_AN(TenBan,TinhTrang)
values (N'Bàn 15',N'Trống')
Go

insert into MONAN(TenMonAn,IDLoaiMonAn,DonGia,SoLuongTrongKho)
values (N'Tôm Hùm Xào Rau Muống',1,1000000,20)
insert into MONAN(TenMonAn,IDLoaiMonAn,DonGia,SoLuongTrongKho)
values (N'Cua Đá Hầm Xương',2,3000000,65)
insert into MONAN(TenMonAn,IDLoaiMonAn,DonGia,SoLuongTrongKho)
values (N'Cá Lòng Tong Chiên Giòn',3,200000,12)
insert into MONAN(TenMonAn,IDLoaiMonAn,DonGia,SoLuongTrongKho)
values (N'Nai Bắc Mĩ',4,5000000,10)
insert into MONAN(TenMonAn,IDLoaiMonAn,DonGia,SoLuongTrongKho)
values (N'Bầu Xào Bí',5,100000,68)
insert into MONAN(TenMonAn,IDLoaiMonAn,DonGia,SoLuongTrongKho)
values (N'Gà Hầm 32 Tiếng',1,1200000,101)
Go

insert into HOADON(NgayLap,IDBanAn,TinhTrang)
values (GETDATE(),1,'Chưa Tính Tiền')
insert into HOADON(NgayLap,IDBanAn,TinhTrang)
values (GETDATE(),2,'Chưa Tính Tiền')
insert into HOADON(NgayLap,IDBanAn,TinhTrang)
values (GETDATE(),3,'Chưa Tính Tiền')
insert into HOADON(NgayLap,IDBanAn,TinhTrang)
values (GETDATE(),4,'Đã Tính Tiền')
insert into HOADON(NgayLap,IDBanAn,TinhTrang)
values (GETDATE(),5,'Chưa Tính Tiền')
insert into HOADON(NgayLap,IDBanAn,TinhTrang)
values (GETDATE(),6,'Chưa Tính Tiền')
GO
SELECT * FROM info_HOADON
