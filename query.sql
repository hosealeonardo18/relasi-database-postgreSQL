CREATE DATABASE gudang;
\l;
\c gudang;

CREATE TABLE admin_gudang(
    id_admin int PRIMARY KEY,
    nama varchar(255),
    umur int,
    alamat text
);

CREATE TABLE tugas(
    id_tugas int PRIMARY KEY,
    id_admin int,
    tugas varchar(255),
    tanggal date,

    CONSTRAINT fk_admin_gudang
    FOREIGN KEY (id_admin) 
    REFERENCES admin_gudang(id_admin)
);

CREATE TABLE category_barang(
    id_category varchar(10) PRIMARY KEY,
    nama_category varchar(255)
);

CREATE TABLE barang(
    id_barang int PRIMARY KEY,
    id_category varchar(10),
    nama_barang varchar(255),
    qty_barang int,
    tanggal_masuk date,

    CONSTRAINT fk_category_barang
    FOREIGN KEY (id_category) 
    REFERENCES category_barang(id_category)
);

CREATE TABLE invoice(
    id_invoice varchar(10) PRIMARY KEY,
    id_admin int,
    id_barang int,
    nama_barang varchar(255),
    qty_barang int,
    tanggal_invoce date,

    CONSTRAINT fk_admin_gudang
    FOREIGN KEY (id_admin) 
    REFERENCES admin_gudang(id_admin),

    CONSTRAINT fk_barang
    FOREIGN KEY (id_barang) 
    REFERENCES admin_gudang(id_admin)
);

------------------------------------------------------------------------------------


--insert data admin_gudang
INSERT INTO admin_gudang(id_admin, nama, umur, alamat)
VALUES ('1', 'Hosea Leonardo', '24', 'Jakarta Timur'),
        ( '2', 'Martha', '26', 'Jakarta Timur'),
        ( '3', 'ilham', '19', 'Jakarta selatan')
;

-- insert data tugas
INSERT INTO tugas(id_tugas, id_admin, tugas, tanggal)
VALUES ('1', '1', 'invoice', '2023-01-07'),
        ('2', '2', 'tax', '2023-01-07'),
        ('3', '3', 'invoice', '2023-01-08')
 
;

--insert data category_barang
INSERT INTO category_barang(id_category, nama_category)
VALUES ('1BE001', 'Barang Elektronik'),
     ('1BB001', 'Barang Bangunan'),
     ('1KK001', 'ATK')
;

--insert data barang
INSERT INTO barang(id_barang, id_category, nama_barang, qty_barang, tanggal_masuk)
VALUES ('001', '1BE001', 'Komputer', '10', '2023-01-06'),
        ('002', '1BE001', 'HT', '20', '2023-01-06'),
        ('003', '1KK001', 'Kertas HVS', '15', '2023-01-08')
;

--insert data invoice
INSERT INTO invoice(id_invoice, id_admin, id_barang,  nama_barang, qty_barang, tanggal_invoce)
VALUES ('inv001', '1', '001', 'Komputer', '2', '2023-01-08'),
('inv002', '2', '002', 'HT', '10', '2023-01-09'),
('inv003', '3', '003', 'Kertas HVS', '5', '2023-01-09')
     
;


------------------------------------------------------------------------------------
-- read data invoice
SELECT * FROM invoice;

-- read data barang
SELECT * FROM barang;

-- read data admin_gudang
SELECT * FROM admin_gudang;



------------------------------------------------------------------------------------

-- update data category_barang
UPDATE category_barang SET nama_category = 'Alat Tulis Kantor' WHERE id_category = '1KK001';

UPDATE category_barang SET nama_category = 'Komputer / Laptop' WHERE id_category = '1BE001';




------------------------------------------------------------------------------------

-- delete data admin_gudang 
DELETE FROM tugas WHERE id_admin='3';
DELETE FROM invoice WHERE id_invoice='inv002';