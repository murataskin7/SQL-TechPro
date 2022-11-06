-- tabloya ver ekleyelim DML Data manipulatin lang

select * from students-- tabloyu çağırır

--bir tabloda tüm field lara veri ekleme
insert into students values ('1234','murat askin', 84.5, '2020-05-02');

-- Tabloda istediğimiz field a veri eklemek için
insert into students(id, name_surname) values ('2345', 'Yusuf Un')