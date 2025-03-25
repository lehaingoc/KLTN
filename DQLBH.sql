CREATE DATABASE QL_BAN_HANG;
USE QL_BAN_HANG;

-- Bảng Khách hàng
CREATE TABLE KhachHang (
    KhachHangID INT PRIMARY KEY AUTO_INCREMENT,
    Ten VARCHAR(100) NOT NULL,
    DiaChi VARCHAR(255),
    SoDienThoai VARCHAR(15),
    Email VARCHAR(100) UNIQUE
);

INSERT INTO KhachHang (Ten, DiaChi, SoDienThoai, Email) VALUES 
('Nguyen Van A', 'Ha Noi', '0123456789', 'a@gmail.com'),
('Tran Thi B', 'TP HCM', '0987654321', 'b@gmail.com');

-- Bảng Nhân viên
CREATE TABLE NhanVien (
    NhanVienID INT PRIMARY KEY AUTO_INCREMENT,
    Ten VARCHAR(100) NOT NULL,
    ChucVu VARCHAR(50),
    Luong DECIMAL(10,2)
);

INSERT INTO NhanVien (Ten, ChucVu, Luong) VALUES 
('Le Van C', 'Nhan Vien Ban Hang', 7000000),
('Pham Van D', 'Quan Ly', 12000000);

-- Bảng Sản phẩm
CREATE TABLE SanPham (
    SanPhamID INT PRIMARY KEY AUTO_INCREMENT,
    Ten VARCHAR(100) NOT NULL,
    Gia DECIMAL(10,2) NOT NULL,
    MoTa TEXT,
    SoLuongTonKho INT DEFAULT 0
);

INSERT INTO SanPham (Ten, Gia, MoTa, SoLuongTonKho) VALUES 
('Laptop Dell', 15000000, 'Laptop văn phòng', 10),
('Chuột Logitech', 500000, 'Chuột không dây', 50);

-- Bảng Nhà cung cấp
CREATE TABLE NhaCungCap (
    NhaCungCapID INT PRIMARY KEY AUTO_INCREMENT,
    Ten VARCHAR(100) NOT NULL,
    DiaChi VARCHAR(255),
    SoDienThoai VARCHAR(15)
);

INSERT INTO NhaCungCap (Ten, DiaChi, SoDienThoai) VALUES 
('Cong Ty ABC', 'Da Nang', '0234567890');

-- Bảng Kho hàng
CREATE TABLE KhoHang (
    KhoHangID INT PRIMARY KEY AUTO_INCREMENT,
    Ten VARCHAR(100) NOT NULL,
    DiaChi VARCHAR(255)
);

INSERT INTO KhoHang (Ten, DiaChi) VALUES 
('Kho Ho Chi Minh', 'Ho Chi Minh');

-- Bảng Đơn đặt hàng
CREATE TABLE DonDatHang (
    DonDatHangID INT PRIMARY KEY AUTO_INCREMENT,
    KhachHangID INT,
    NhanVienID INT,
    NgayDat DATE NOT NULL,
    TrangThai VARCHAR(50),
    TongGiaTri DECIMAL(10,2),
    FOREIGN KEY (KhachHangID) REFERENCES KhachHang(KhachHangID),
    FOREIGN KEY (NhanVienID) REFERENCES NhanVien(NhanVienID)
);

INSERT INTO DonDatHang (KhachHangID, NhanVienID, NgayDat, TrangThai, TongGiaTri) VALUES 
(1, 1, '2025-03-25', 'Hoan Thanh', 15500000);

-- Bảng Chi tiết đơn hàng
CREATE TABLE ChiTietDonHang (
    DonDatHangID INT,
    SanPhamID INT,
    SoLuong INT NOT NULL,
    DonGia DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (DonDatHangID, SanPhamID),
    FOREIGN KEY (DonDatHangID) REFERENCES DonDatHang(DonDatHangID),
    FOREIGN KEY (SanPhamID) REFERENCES SanPham(SanPhamID)
);

INSERT INTO ChiTietDonHang (DonDatHangID, SanPhamID, SoLuong, DonGia) VALUES 
(1, 1, 1, 15000000),
(1, 2, 1, 500000);

-- Bảng Hóa đơn
CREATE TABLE HoaDon (
    HoaDonID INT PRIMARY KEY AUTO_INCREMENT,
    KhachHangID INT,
    NgayLap DATE NOT NULL,
    TongTien DECIMAL(10,2),
    FOREIGN KEY (KhachHangID) REFERENCES KhachHang(KhachHangID)
);

INSERT INTO HoaDon (KhachHangID, NgayLap, TongTien) VALUES 
(1, '2025-03-25', 15500000);

-- Quan hệ Kho hàng - Sản phẩm
CREATE TABLE Kho_SanPham (
    KhoHangID INT,
    SanPhamID INT,
    SoLuong INT DEFAULT 0,
    PRIMARY KEY (KhoHangID, SanPhamID),
    FOREIGN KEY (KhoHangID) REFERENCES KhoHang(KhoHangID),
    FOREIGN KEY (SanPhamID) REFERENCES SanPham(SanPhamID)
);

INSERT INTO Kho_SanPham (KhoHangID, SanPhamID, SoLuong) VALUES 
(1, 1, 10),
(1, 2, 50);

-- Quan hệ Nhà cung cấp - Sản phẩm
CREATE TABLE NhaCungCap_SanPham (
    NhaCungCapID INT,
    SanPhamID INT,
    PRIMARY KEY (NhaCungCapID, SanPhamID),
    FOREIGN KEY (NhaCungCapID) REFERENCES NhaCungCap(NhaCungCapID),
    FOREIGN KEY (SanPhamID) REFERENCES SanPham(SanPhamID)
);

INSERT INTO NhaCungCap_SanPham (NhaCungCapID, SanPhamID) VALUES 
(1, 1);

