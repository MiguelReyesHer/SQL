create database Examen_1511
use Examen_1511

-- Reyes Hernández Miguel Ángel / 421063125

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

select * from Departamento

--Muestre el promedio salario de cada departamento
select avg(salario) as 'Promedio Salario' from Empleado,Departamento where Empleado.depto_no=Departamento.depto_no group by Empleado.depto_no

--Muestre la dirección del empleado con el menor salario en el departamento de ventas
select dir from Empleado,Departamento where Empleado.depto_no=Departamento.depto_no and Departamento.nombre_depto='Ventas' and salario=(select min(salario) from Empleado)

--Muestre los empleados que tengan 34 años y trabajen en el Coyolar
select nombre from Empleado,Departamento where Empleado.depto_no=Departamento.depto_no and edad=34 and localizacion='El coloyar'
-- No muestra nada porque no hay empleados de 34 años que vivan en esa dirección, unicamente hay de 32 años

--Mostrar el nombre de los empleados de los cuales la suma de sus salario y comisión sea mayor a 1500
select nombre from Empleado where (salario+comision)>15000 

--Mostar la edad más baja junto con el nombre del empleado de la base de datos
select  nombre,edad from Empleado where edad=(select min(edad) from Empleado)

--Muestre los empleados que tengan un salario menor a 15000
select nombre from Empleado where salario<15000
