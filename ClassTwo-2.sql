create table tedarikciler
(
	tedarikci_id int unique,
	tedarikci_name varchar(15) not null,
	tedarikci_address char(50) not null, 
	ulasim_tarihi date
)

create table tedarikci_ziyaret
as
select tedarikci_name, ulasim_tarihi from tedarikciler

select * from tedarikciler


-- rimery key oluşturma birinci yol

create table students2
(
	id int primary key,
	name varchar(20) not null,
	avr_grade real,
	address varchar(100),
	record_date date
)

--primary key oluşturma ikinci yol

create table students3
(
	id char(4),
	name varchar(20) not null,
	avr_grade real,
	address varchar,
	record_date date,
	constraint stu_pri_key primary key(id)
)



create table tedarikciler3
(
	tedarikci_id char(10),
	tedarikci_adı varchar(50),
	iletisim varchar(50),
	constraint tedarikci_pk primary key(tedarikci_id)
)

create table urunler
(
	tedarikci_id char(10),
	product_id char(10),
	constraint urunler_fk foreign key(tedarikci_id) references tedarikciler3(tedarikci_id)
)


CREATE TABLE calisanlar
(
id char(9) Primary Key,
isim varchar(30) Unique,
maas int not null,
ise_baslama date
)
CREATE TABLE adresler
(
adres_id char(10),
sokak varchar(10),
cadde varchar(10),
sehir varchar(10),
CONSTRAINT adrsfk FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
)

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');

-- isim varchar ı unique olduğu için kabul etmedi
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14');

INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');

-- maas int değişkeni not null olduğu için hata verdi
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');

INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');

--isim varchar değişkeni unique olduğu için kabul etmedi
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');

--maas int değişkeni not null 
INSERT INTO calisanlar VALUES('10009', 'cem', null, '2018-04-14');


INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');

-- id primary key için null kabul etti ancak bir önceki veride olduğu için kabul etmedi yani unique
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');

-- isim unique olduğu için kabul etmedi
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');

-- id primary key olduğu için null olabilemez
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');


select * from calisanlar


--IN CONDITION
CREATE TABLE musteriler  (
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (20, 'John', 'Apple');
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

-- tablodan urun ismi orange, aple, apricot olan dataları getir
select * from musteriler where urun_isim = 'Orange' or urun_isim = 'Apple' or urun_isim = 'Apricot'
select * from musteriler where urun_isim in ('Orange','Apple','Apricot')

-- belirtilenlerin dışındakileri getir dersek
select * from musteriler where urun_isim not in ('Orange','Apple','Apricot')


CREATE TABLE calisanlar2 
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);
CREATE TABLE markalar
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);

INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko')
