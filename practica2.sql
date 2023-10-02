create database Practica2_RHMA
use Practica2_RHMA

create table Departamento (
depto_no int primary key not null,
nombre_depto varchar(30) not null,
localizacion varchar (50))

create table Empleado ( 
codigo_c varchar(30) primary key not null,
nombre varchar (70) not null,
edad int,
oficio varchar(40),
dir varchar(70),
fecha_alt date,
salario float,
comision float,
depto_no int foreign key references Departamento (depto_no))

insert into Departamento
values (10,'Departamento Software','El coyolar')
insert into Departamento
values (20,'Analisis Sistema','Guadalupe')
insert into Departamento
values (30,'Contabilidad','Subtiava')
insert into Departamento
values (40,'Ventas','San Felipe')

insert into Empleado
values ('281-160483-0005F', 'Rocha vargas Hector', 27, 'Vendedor', 'Leon', '1983/05/12',12000,0,40)
insert into Empleado
values ('281-040483-0056P', 'Lopez Hernandez Julio', 27, 'Analista', 'Chinandega', '1982/07/14', 13000,1500,20)
insert into Empleado
values ('081-130678-00045', 'Esquivel Jose', 31, 'Director', 'Juigalpa', '1981/06/05', 16700,1200,30)
insert into Empleado
values ('281-160473-0009Q', 'Delgado Carmen', 37, 'Vendedor', 'Lean', '1983/03/02', 13400,0,40)
insert into Empleado
values ('281-160493-0005F', 'Castillo Montes Luis',17, 'Vendedor', 'Masaya', '1982/08/12', 16309,1000,40)
insert into Empleado
values ('281-240784-0004Y', 'Esquivel Leonel Alfonso', 26, 'Presidente', 'Nagarote', '1981/09/12',15000,0,30)
insert into Empleado
values ('281-161277-0008R', 'Perez Luis', 32, 'Empleado', 'Managua', '1980/03/02' ,16890,0,10)

SELECT Nombre From Empleado ORDER BY nombre DESC
SELECT Nombre, oficio, localizacion From Empleado, Departamento Where oficio = 'Vendedor' and Empleado.depto_no=Departamento.depto_no

DELETE FROM Empleado WHERE nombre= 'Rocha vargas Hector' 
SELECT* from Empleado
SELECT* from Departamento
SELECT* from Empleado order by nombre desc 
SELECT Nombre From Empleado ORDER BY nombre DESC
SELECT Nombre, oficio, localizacion From Empleado, Departamento Where oficio = 'Vendedor' and Empleado.depto_no=Departamento.depto_no
SELECT Nombre from Empleado WHERE nombre like '%o' /*mostramos nombres que terminen con o*/
SELECT Nombre, oficio, salario from Empleado WHERE dir='Leon'

SELECT Nombre, oficio, salario from Empleado, Departamento WHERE Empleado.depto_no=Departamento.depto_no and localizacion='El Coyolar' /*lo mismode arriba pero por localización se hace una relación para tomar datos de ambas tablas*/
SELECT Nombre, salario, localizacion from Empleado, Departamento WHERE Empleado.depto_no=Departamento.depto_no and salario between 10000 and 13000

/*SELECT Empleado.depto_no,count(*) from Empleado, Departamento WHERE Empleado.depto_no=Departamento.depto_no group by Empleado.depto_no having count(*)>5*/

SELECT Nombre, salario, nombre_depto from Empleado, Departamento WHERE Empleado.depto_no=Departamento.depto_no and oficio=(SELECT oficio from Empleado WHERE nombre = 'Leonel Alfonso Esquivel') /*Mostrar el nombre salario y nombre del departamento de los empleados que tengan el mismo oficio que Leonel Alfonso EEsquivel*/
SELECT Nombre, salario, nombre_depto from Empleado, Departamento WHERE Empleado.depto_no=Departamento.depto_no and oficio=(SELECT oficio from Empleado WHERE nombre ='Castillo Montes Luis') and comision = 0 /*Mostrar el nombre salario y nombre del departamento de los empleados que tengan el mismo oficio que Castillo Montes Luis y que no tengan comision*/
SELECT * from Empleado, Departamento WHERE Empleado.depto_no=Departamento.depto_no and nombre_depto = 'Contabilidad' order by nombre /* Mostrar los datos de los empleados que trabajan en el departamento de contabilidad ordenados por nombre*/
SELECT Nombre from Empleado, Departamento WHERE Empleado.depto_no=Departamento.depto_no and localizacion='Leon' and oficio in ('Analista','Empleado') /*Nombre de los empleados que trabajan en Leon y cuyo oficio sea analista o empleado*/

SELECT avg(salario) from Empleado /*Promedio de salario de la tabla empleado*/
SELECT max(salario) from Empleado WHERE depto_no = 10 /*Maximo salario de los empleados del departamento 10*/
SELECT min(salario) from Empleado, Departamento WHERE nombre_depto='Ventas' and Empleado.depto_no=Departamento.depto_no
SELECT avg(salario) from Empleado, Departamento WHERE Empleado.depto_no=Departamento.depto_no and nombre_depto = 'Contabilidad'

SELECT min(salario) from Empleado, Departamento where nombre_depto='Ventas' and Empleado.depto_no=Departamento.depto_no
SELECT avg(salario) from Empleado, Departamento where Empleado.depto_no=Departamento.depto_no and nombre_depto='Contabilidad'

SELECT count (*) from Empleado where depto_no=10
SELECT count (*) from Empleado, Departamento where nombre_depto='Ventas'
SELECT count (*) from Empleado where comision=0
SELECT count (*) from Empleado where nombre like 'B%'
SELECT Empleado.depto_no,  count (*) from Empleado, Departamento where Empleado.depto_no=Departamento.depto_no group by Empleado.depto_no

SELECT oficio, sum(salario) from Empleado group by oficio
/* Hacer alias*/ SELECT oficio, sum(salario) as total from Empleado group by oficio

SELECT * from Empleado where salario>(SELECT avg(salario) from Empleado) /*salario mayor al promedio*/
SELECT nombre from Empleado where salario=(SELECT max(salario) from Empleado) /*salario máximo*/
SELECT nombre from Empleado where salario=(SELECT min(salario) from Empleado) /*0salario mínimo*/
SELECT nombre from Empleado,Departamento where Empleado.depto_no=Departamento.depto_no and nombre_depto='Ventas' and salario=(SELECT max(salario) from Empleado,Departamento where Empleado.depto_no=Departamento.depto_no and nombre_depto='Ventas') /*Empleado con mayor salario del depto ventas*/

SELECT depto_no, count(*) from Empleado group by depto_no,oficio /*no depto con más empleados cuyo oficio sea 'empleado'*/
SELECT depto_no, COUNT(*) FROM Empleado group by depto_no, oficio having COUNT(*)>2 /*Mostrar los departamentos que tengan mas de dos personas trabajando en la misma profesion*/

INSERT INTO Empleado(codigo_c,nombre,edad,oficio,dir,fecha_alt,salario,comision,depto_no) 
VALUES('220678-0008U', 'Perez Luis Carlos',32,'Analista','Matagalpa','2001/06/22',15600,null,20)
INSERT INTO Departamento
Values(50,'General','Laborio')
INSERT INTO Departamento(depto_no,nombre_depto)
Values(60,'Prueba')

UPDATE Empleado set salario=salario*2 WHERE depto_no=30 /*Duplicar el salario a todos los empleados del depto 30*/
UPDATE Empleado set depto_no=20 WHERE depto_no = 30 /*Cambiar todos los empleados del departamento numero 30 al deparamento numero 20*/
UPDATE Empleado set salario=salario*1.1 WHERE depto_no=10 /*Incrementar en un 10% el sueldo de los empledos del depto 10*/
UPDATE Departamento set localizacion='Zaragoza' WHERE depto_no=10
UPDATE Empleado set salario=(SELECT salario from Empleado Where nombre = 'Esquivel Leonel Alfonso') WHERE nombre= 'Esquivel Jose'/*Igualar el salario de Esquiver Jose al salario de Esquivel Leonel Alfonso de la tabla prueba*/

/*DELETE FROM Departamento WHERE depto_no = 40*/
DELETE FROM Empleado WHERE depto_no = 20 and oficio  = 'Analista' 
DELETE FROM Empleado WHERE comision is null