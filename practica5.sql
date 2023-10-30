create database PracticaTransacciones
use PracticaTransacciones

create table Departamento( 
depto_no int primary key not null,
nombre_depto varchar(30) not null,
localizacion varchar(50)
)

create table Empleado(
codigo_c varchar(30) primary key  not null,
nombre varchar (70) not null,
edad int,
oficio varchar(40),
dir varchar(70),
fecha_alt date,
salario float,
comision float,
depto_no int foreign key references Departamento (depto_no)
)

insert into Departamento
values (10,'Desarrollo Software','El coyolar')
insert into Departamento
values(20,'Analisis Sistema','Guadalupe')
insert into Departamento
values (30,'Contabilidad','Subtiava')
insert into Departamento
values(40,'Ventas','San Felipe')

insert into Empleado
values ('281-160483-0005F','Rocha vargas Hector',27,'Vendedor','Leon','1983/05/12',12000,0,40)
insert into Empleado
values ('281-040483-0056P','Lopez Hernandez Julio',27,'Analista','Chinandenga','1982/07/14',13000,1500,20)
insert into Empleado
values ('081-130678-0004S','Esquivel Jose',31,'Director','Juigalpa','1981/06/05',16700,1200,30)
insert into Empleado
values ('281-160473-0009Q','Delgado Carmen',37,'Vendedor','Leon','1983/03/02',13400,0,40)
insert into Empleado
values ('281-160493-0005F','Castillo Montes Luis',17,'Vendedor','Masaya','1982/08/12',16309,1000,40)
insert into Empleado
values ('281-240784-0004Y','Esquivel Leonel Alfonso',26,'Presidente','Nagarote','1981/09/12',15000,0,30)
insert into Empleado
values ('281-161277-0008R','Perez Luis',32,'Empleado','Managua','1980/03/02',16890,0,10)

--Inicio de la transacción
begin transaction
--Insertamos un nuevo empleado llamado Montes Fahrid
insert into Empleado 
values ('281-164328-0006H','Montes Fahrid',31,'Vendedor','Nagarote','1981/09/11',15000,0,40) 
--Actualización de salario y comsión a Lopez Hernandez Julio
update Empleado set salario=13578, comision=0 where nombre='Lopez Hernandez Julio' 
--Punto de guardado de la transacción
save tran Savepoint1
--Actualización del oficio y salario a Perez Luis
update Empleado set oficio = 'Vendedor', salario=12000 where nombre = 'Perez Luis' 

--Deshace TODO lo que alberga la transacción
rollback transaction 
--Deshace la transacción hasta el punto del savepoint1 (Todo lo que no esté antes del savepoint será deshecho)
rollback transaction Savepoint1 

--Confirmación FINAL de la transacción (Una vez confirmada la transacción ya no es posible ejecutar el ROLLBACK)
commit transaction 

select * from Empleado 

--Comando que permite la visualización de cuantas transacciones están abiertas
select @@TRANCOUNT as TransaccionesAbiertas  
