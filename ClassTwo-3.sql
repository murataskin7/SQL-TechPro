-- check yaısı- girilen değerde bazı karakterleri izin dışı yapmak için

create table sehirler
(
	alan_kodu int primary key,
	isim varchar(28) not null,
	nufus int check(nufus>0)
);

--nufus değişkeni -500 olduğu için kabul etmedi
insert into sehirler values(123,'izmir',-500)

-- 500 olarak değiştirince kabul etti
insert into sehirler values(123,'izmir',500)

select * from sehirler


-- where ile mantık operatörleri

--calisanlar tablosu üstünde çalışalım
select * from calisanlar
-- tablodan sadece maası 5000 den büyük olanların ismini çağıralım
select isim from calisanlar where maas>5000 

-- maaşı 5000 den büyük olanların tüm bilgileri
select * from calisanlar where maas > 5000


-- delete komutu
-- delete from tablo_name;  tablonun tüm içeriğini siler
-- delete from table_name where field_name = veri; tablodan seçilen veriyi siler

select * from calisanlar-- bu tablo üstünde çalışalım

delete from calisanlar where maas < 5000-- maaşı 5000 den az olanları sil

delete from calisanlar where isim = null
