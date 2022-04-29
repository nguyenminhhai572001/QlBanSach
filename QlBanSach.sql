create database QLBanSach;
use QLBanSach;
create table Khachhang(
	maKH nvarchar(50),
    ho_ten nvarchar(255),
    tai_khoan nvarchar(100),
    mat_khau nvarchar(100),
    email nvarchar(100),
    dia_chi nvarchar(150),
    sdt nvarchar(20),
    gioi_tinh nvarchar(5),
    ngay_sinh datetime,
    primary key(maKH)
);

create table DonHang(
	maDH nvarchar(50),
    ngay_giao datetime,
    ngay_dat datetime,
    tinh_trang_giao_hang nvarchar(100),
    da_thanh_toan boolean,
    ma_khach_hang nvarchar(50),
    primary key(maDH)
);
alter table DonHang add constraint hai foreign key ( ma_khach_hang ) references Khachhang(maKH);

create table NhaXuatBan(
	maNXB nvarchar(100),
    ten_NXB nvarchar(100),
    dia_chi nvarchar(100),
    SDT nvarchar(20),
    primary key(maNXB)
);

create table ChuDe(
	maCD nvarchar(100),
    ten_chu_de nvarchar(100),
    primary key(maCD)
);

create table Sach(
	maSach nvarchar(100),
    ten_sach nvarchar(100),
    gia_ban nvarchar(100),
    mo_ta nvarchar(255),
    anh_bia nvarchar(100),
    ngay_cap_nhap datetime,
    so_luong_ton integer,
    ma_NXB nvarchar(100),
    ma_chu_de nvarchar(100),
    primary key(maSach)
);
alter table Sach add constraint ma_NXB foreign key (ma_NXB) references NhaXuatBan(maNXB);
alter table Sach add constraint ma_chu_de foreign key (ma_chu_de) references ChuDe(maCD);

create table TacGia(
	maTG nvarchar(100),
    ten_tac_gia nvarchar(100),
    tieu_su nvarchar(255),
    dia_chi nvarchar(100),
    sdt nvarchar(20),
    primary key(maTG)
);

create table ChiTietDonHang(
	ma_sach nvarchar(100),
    ma_don_hang nvarchar(100),
    so_luong integer,
    don_gia integer,
    primary key(ma_sach, ma_don_hang)
);

alter table ChiTietDonHang add constraint ma_sach foreign key (ma_sach) references Sach(maSach);
alter table ChiTietDonHang add constraint ma_don_hang foreign key (ma_don_hang) references DonHang(maDH);

create table ThamGiaSanXuat(
	ma_tac_gia nvarchar(100),
    ma_sach nvarchar(100),
    vai_tro nvarchar(255),
    vi_tri nvarchar(255),
    primary key(ma_tac_gia, ma_sach)
);
alter table ThamGiaSanXuat add constraint ma_tac_gia foreign key (ma_tac_gia) references TacGia(maTG);
alter table ThamGiaSanXuat add constraint ma_Sach1 foreign key (ma_sach) references Sach(maSach);


