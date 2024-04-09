-- cau 2:
select distinct ma_dat_phong, ma_dv, so_luong
from chi_tiet_sdung_dv
where 3 < so_luong and so_luong > 10;

-- cau 3:
UPDATE phong
SET GiaPhong = GiaPhong + 10000
WHERE SoKhachToiDa > 10;

-- cau 4:
delete from dat_phong where TrangThaiDat = 'Da huy';

-- cau 5:
SELECT TenKH FROM khach_hang
where TenKH like 'N%' OR 'H%' OR 'M%' and length(TenKH) <=20;

-- cau 6:
SELECT DISTINCT TenKH FROM khach_hang;

-- cau 7:
SELECT * FROM dich_vu_di_kem
WHERE (DonViTinh = 'lon' AND DonGia > 10000) OR (DonViTinh = 'cai' AND DonGia < 5000);

-- cau 8:
SELECT 
	dat_phong.MaDatPhong, 
    dat_phong.MaPhong, LoaiPhong, 
    SoKhachToiDa, GiaPhong, 
    dat_phong.MaKH, 
    TenKH, SoDT, NgayDat, GioBatDau, GioKetThuc, 
    chi_tiet_su_dung_dich_vu.MaDV, 
    SoLuong, DonGia
FROM dat_phong 
JOIN phong ON dat_phong.MaPhong = phong.MaPhong
JOIN khach_hang ON khach_hang.MaKH = dat_phong.MaKH
JOIN chi_tiet_su_dung_dich_vu ON chi_tiet_su_dung_dich_vu.MaDatPhong = dat_phong.MaDatPhong
JOIN dich_vu_di_kem ON dich_vu_di_kem.MaDV = chi_tiet_su_dung_dich_vu.MaDV
WHERE YEAR(NGAYDAT) IN (2016, 2017) AND GIAPHONG > 50;

-- cau 9:
SELECT 
	dat_phong.MaDatPhong, 
    phong.MaPhong, 
    phong.LoaiPhong, 
    phong.GiaPhong, 
    khach_hang.TenKH, 
    dat_phong.NgayDat, 
    phong.GiaPhong * (GioKetThuc - GioBatDau)  AS TongTienHat, 
    SUM(chi_tiet_su_dung_dich_vu.SoLuong * dich_vu_di_kem.DonGia) AS TongTienSuDungDichVu, 
    ( phong.GiaPhong * (GioKetThuc - GioBatDau) + SUM(chi_tiet_su_dung_dich_vu.SoLuong * dich_vu_di_kem.DonGia )) AS TongTienThanhToan
FROM dat_phong  
JOIN khach_hang ON dat_phong.MaKH = khach_hang.MaKH 
JOIN phong ON dat_phong.MaPhong = phong.MaPhong
JOIN chi_tiet_su_dung_dich_vu ON dat_phong.MaDatPhong = chi_tiet_su_dung_dich_vu.MaDatPhong
JOIN dich_vu_di_kem ON chi_tiet_su_dung_dich_vu.MaDV = dich_vu_di_kem.MaDV
GROUP BY dat_phong.MaDatPhong;

-- cau 10: 
SELECT * FROM khach_hang
WHERE DiaChi = 'Hoa xuan';

-- cau 11:
SELECT phong.MaPhong, LoaiPhong, SoKhachToiDa, GiaPhong, SUM(dat_phong.MaPhong) AS SoLanDat 
FROM dat_phong
RIGHT JOIN phong ON phong.MaPhong = dat_phong.MaPhong
GROUP BY phong.MaPhong, LoaiPhong, SoKhachToiDa, GiaPhong
HAVING SUM(dat_phong.MaPhong) > 2;


