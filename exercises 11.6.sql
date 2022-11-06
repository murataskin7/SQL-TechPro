create table musteriler
(
	urun_id int,
	musteri_isim varchar(50),
	urun_isim varchar(50)
); -- musteriler adında bir tablo oluşturuldu

insert into musteriler values(10, 'Mark', 'Orange');
insert into musteriler values(10, 'Mark', 'Orange');
insert into musteriler values(20, 'John', 'Apple');
insert into musteriler values(30, 'Amy', 'Palm');
insert into musteriler values(20, 'Mark', 'Apple');
insert into musteriler values(10, 'Adem', 'Orange');
insert into musteriler values(40, 'John', 'Apricot');
insert into musteriler values(20, 'Eddie', 'Apple');
-- musteriler tablosuna veriler eklendi

-- sorgu: urun_isim Orange veya Apple veya Apricot olanları getir
select * from musteriler where urun_isim = 'Orange' or urun_isim = 'Apple' or urun_isim = 'Apricot'
-- Aynı soruguyu farklı bir metod ile getirelim
select * from musteriler where urun_isim in ('Orange', 'Apple', 'Apricot')

-- between condition sorgulama // arlık sorgulama- belirtilen sınırlar aralık koşuluna dahildir
select * from musteriler where urun_id <= 40 and urun_id >= 20;
select * from musteriler where urun_id between 30 and 40;
select * from musteriler where urun_id not between 30 and 40;

-- Practice 6
/*
Oluşturulacak tablo
CREATE table personel
(
id char(4),
isim varchar(50),
maas int
);

Tablo verileri

insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000)

Sorgular:
- id'si 1003 ile 1005 arasında olan personel bilgilerini listeleyiniz
- D ile Y arasındaki personel bilgilerini listeleyiniz
- D ile Y arasında olmayan personel bilgilerini listeleyiniz
- Maaşı 70000 ve ismi Sena olan personeli listeleyiniz
*/

create table personel
(
	id char(4),
	name varchar(50),
	salary int
);

insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);

-- Oluşan tabloyu görelim
select * from personel;

select * from personel where id between '1003' and '1005' -- birinci sorgu
select * from personel where name between 'D' and 'Y' -- ikinci sorgu
select * from personel where name not between 'D' and 'Y' -- üçüncü sorgu
select * from personel where name = 'Sena Beyaz' and salary = 70000 -- dördüncü sorgu, boş küme
-- Hocaya Sorular---
/*
1-birinci sorguda sorgu sınırlarının herikisini dahil ederken ikinci ve üçüncü sorguda sağ sınırı
dahil etmedi. Neden?
2- Dördüncü sorguda personelin soyadını bilmiyorsam, yani sadece adı ile sorgu yapmak istersem nasıl
yapacağım?
*/

-- subqueries--
-- başka bir sorgunun içinde çalışan sorgudur. sorgu içinde sorgu
create table calisanlar
(
	id int,
	name varchar(50),
	city varchar(20),
	salary int,
	company varchar(50)
);

INSERT INTO calisanlar VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

create table markalar
(
	marka_id int,
	marka_name varchar(20),
	count_staff int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve bu markada calisanlarin isimlerini ve 
-- maaşlarini listeleyin
select name,salary,company from calisanlar where company in (select marka_name from markalar where count_staff > 1500)
-- marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz
select name,salary,city,company from calisanlar where company in(select marka_name from markalar where marka_id > 101);
-- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz
select marka_id,marka_name,count_staff from markalar where marka_name in (select company from calisanlar where city = 'Ankara')

-- Aggregate methot--
select max(salary) from calisanlar -- calisanlar tablosundaki en büyük salary i verir
select name,salary,company from calisanlar where salary = (select max(salary) from calisanlar)-- alternatif sorgu
select sum(salary) from calisanlar -- calisanlar tablosunda toplam salary
select count(name) from calisanlar--  calsanlar tablosunda name sayısı
select avg(salary) from calisanlar -- calisanlar tablosunda salary ortalaması
select round(avg(salary),4) from calisanlar -- avg(salary) nin ondalık basamak sayısıyla verir-yuvarlar
select min(salary) from calisanlar -- calisanlar tablosundaki minimum salary i verir
select name, company from calisanlar where salary = (select min(salary) from calisanlar)-- ustteki sorguya alternatif
--********* onemli sorgu*******--------
-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
select marka_id, marka_name, (select count(city) from calisanlar where marka_name = company) as count_city from markalar

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
select marka_name, count_staff, (select sum(salary) from calisanlar where marka_name = company) as sum_salary from markalar
-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz
select marka_name, count_staff, (select max(salary) from calisanlar where marka_name = company) as max_salary, (select min(salary) from calisanlar where marka_name = company) as min_salary from markalar