Create Database Ejemplo_T
use Ejemplo_T

Create table producto(
id_cod int identity primary key,
cod_prod varchar (4) not null,
nombre varchar (50) not null,
existencia int not null,
)

create table historial(
fecha date,
cod_prod varchar(4),
descripcion varchar (60),
usuario varchar (20),
)

create table ventas (
cod_prod varchar (4),
precio money,
cantidad int,
)

insert into producto values('A001', 'MEMORIA USB 3208',175)
insert into producto values('A002', 'DISCO DURO 278',15);
insert into producto values ('A003', 'AIRE COMPRIMIDO', 250); 
insert into producto values('A004', 'ESPUMA LIMPIADORA', 300);
insert into producto values('A005', 'FUNDA MONITOR', 500);
insert into producto values('A006', 'FUNDA TECLADO',700);
insert into producto values ('A007','SILLA ERGONOMICA', 11); 
insert into producto values('A008', 'ALFOMBRILLA PARA SILLA',25);
insert into producto values('A009', 'LAMPARA ESCRITORIO',7);
insert into producto values('A010', 'MONITOR LED 15 PULGADAS',45);
insert into producto values('A011', 'LIBRERO', 20);


select*from historial
select*from producto
truncate table producto
truncate table historial
truncate table ventas

--primer trigger insert: se disparar cuando insertemos registros en productos, guardando la accion en historial
create trigger tr_productoinsertado
on producto for insert-- se dispara cuando se ejecte un insert en producto
AS
--set nocount on --sirve para evitar que se vea el trigger a la hora de ejecutarse
declare @cod_prod varchar (4) --sirve para insertar el valor del codigo del producto en la tabla historial a la hora de disparar el trigger
select @cod_prod = cod_prod from inserted -- inserted es la tabla temporal proveniente de donde se jalara el valor de cod_prod
insert into historial values (getdate(),@cod_prod, 'registro insertado', system_user) 

--segundo trigger delete: se disparar cuando eliminemos registros en productos, guardando la accion en historial
create trigger tr_productoeliminado
on producto for delete --se disparar cuando se ejecute un delete en producto
AS
--set nocount on --sirve para evitar que se vea el trigger a la hora de ejecutarse
declare @cod_prod varchar (4) --sirve para insertar el valor del codigo del producto en la tabla historial a la hora de disparar el trigger
select @cod_prod = cod_prod from deleted -- deleted es la tabla temporal proveniente de donde se jalara el valor de cod_prod
insert into historial values (getdate(),@cod_prod, 'registro eliminado', system_user) 

delete from producto where cod_prod='A001'


--tercer trigger update: se disparar cuando actulicemos registros en productos, guardando la accion en historial
create trigger tr_productoactualizado
on producto for update --se disparar cuando se ejecute un delete en producto
AS
--set nocount on --sirve para evitar que se vea el trigger a la hora de ejecutarse
declare @cod_prod varchar (4) --sirve para insertar el valor del codigo del producto en la tabla historial a la hora de disparar el trigger
select @cod_prod = cod_prod from inserted -- inserted es la tabla temporal proveniente de donde se jalara el valor de cod_prod
insert into historial values (getdate(),@cod_prod, 'registro actualizado', system_user) 

update producto set existencia=180 where cod_prod='A001'

select*from ventas
select*from producto

create trigger tr_Ventas
on ventas for insert
AS
update producto set producto.existencia = producto.existencia-inserted.cantidad from inserted
inner join producto on producto.cod_prod=inserted.cod_prod

insert into ventas values ('A001',300, 3)


/* ejemplo 2 de triggers:

create database triggers_ej2
use triggers_ej2

create table tienda1
(n_envio int,
cod_prod varchar(4),
nombre varchar(100),
Cantidad int)


create table tienda2
(n_envio int,
cod_prod varchar(4),
nombre varchar(100),
Cantidad int)


create table tienda3
(n_envio int,
cod_prod varchar(4),
nombre varchar(100),
Cantidad int)


select * from tienda1 
select * from tienda2 
select * from tienda3 



create view tiendas
as
select n_envio, cod_prod, nombre, cantidad, 'tienda1' as destino from tienda1  
union all --sirve para unir las tres tablas, es importante el all ya que permite enviar varios productos por numero de envio
select n_envio, cod_prod, nombre, cantidad, 'tienda2' as destino from tienda2  
union all
select n_envio, cod_prod, nombre, cantidad, 'tienda3' as destino from tienda3 

--destino siirve para estableces cada una de las tiendas para que el trigger pueda identificar cada destino y asi
--insertar los destinos donde corresponda
 select * from tiendas 
 

create trigger TR_Destin
on tiendas instead of insert --instead of insert es el tipo con el cual se dispara el trigger sobre la vista tiendas
as
set nocount on
insert into tienda1 
select n_envio, cod_prod, nombre, cantidad from inserted where destino='tienda1'
insert into tienda2 
select n_envio, cod_prod, nombre, cantidad from inserted where destino='tienda2'
insert into tienda3 
select n_envio, cod_prod, nombre, cantidad from inserted where destino='tienda3' 
--en cada linea se define que se tome de la tabla inserted los registtos para ser enviados a su tablas correspondientes
--si es que cumple el criterio en el insert

--cuando toma los valores de la tabla inserted lo primero que hace es verificar el destino de la tienda
--y cancela las otras acciones que no cumplan el criterio

insert into tiendas values(1, '1001', 'MOUSE OPTICO', 500, 'tienda1')



select * from tienda1
select * from tienda2
select * from tienda3 


insert into tiendas values(2, '1002', 'Monitor LED 17 pulgaas', 35, 'tienda3')
insert into tiendas values(2, '1003', 'CABLE HDMI', 50, 'tienda3')
insert into tiendas values(2, '1004', 'AIRE COMPRIMIDO', 45, 'tienda3')
insert into tiendas values(2, '1005', 'PASTA TERMICA', 23, 'tienda3')


insert into tiendas values(3, '1006', 'TECLADO P/TABLET', 100, 'tienda1')
insert into tiendas values(4, '1007', 'FUNDA TECLADO', 230, 'tienda2')
insert into tiendas values(5, '1008', 'MEMORIA MICRO SD 16GB', 700, 'tienda3')


select * from tiendas 

/*
