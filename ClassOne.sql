-- create -- tablo oluşturma
create table students
(
	id char(4),
	name_surname varchar(30),
	grade_ort real,
	recorder_date date
);

-- varolan br tablodan yeni bir tablo oluşturma
create table students_average
as
select name_surname,grade_ort
from students;

--select--DQL
select * from students; -- * tablodaki tüm verileri çağırır

select * from students_average;

select name_surname from students; -- bir ve ya birden fazla field i çağırmak için
select name_surname, grade_ort from students;