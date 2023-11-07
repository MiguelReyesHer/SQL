/* Equipo de G�mez Huerta Rafael Uriel
Reyes Hern�ndez Miguel �ngel - 421063125*/

CREATE DATABASE Practica4
USE Practica4

CREATE TABLE DEPT(
DEPTONO int primary key not null,
DNAME varchar(15),
LOC varchar(20),
)

CREATE TABLE EMP(
EMPNO int primary key not null,
ENAME varchar(20),
JOB varchar(20),
MGR int,
HIREDATE date,
SAL int not null,
COMM int,
DEPTONO int foreign key references DEPT(DEPTONO),
)

Insert into DEPT
Values (10,'Accounting','New York')
Insert into DEPT
Values (20,'Research','Dallas')
Insert into DEPT
Values (30,'Sales','Chicago')
Insert into DEPT
Values (40,'Operations','Boston')

Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTONO)
Values (7369,'Smith','Clerk',7902,'1980/12/17',800,20)
Insert into EMP 
Values (7499,'Allen','Salesman',7698,'1981/02/20',1600,300,30)
Insert into EMP 
Values (7521,'Ward','Salesman',7698,'1981/02/22',1250,500,30)
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTONO)
Values (7566,'Jones','Manager',7839,'1981/04/02',2975,20)
Insert into EMP 
Values (7654,'Martin','Salesman',7698,'1981/09/28',1250,1400,30)
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTONO)
Values (7698,'Blake','Manager',7839,'1981/05/01',2850,30)
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTONO)
Values (7782,'Clark','Manager',7839,'1981/06/09',2450,10)
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTONO)
Values (7788,'Scott','Analyst',7566,'1982/12/09',3000,20)
Insert into EMP (EMPNO,ENAME,JOB,HIREDATE,SAL,DEPTONO)
Values (7839,'King','President','1981/11/17',5000,10)
Insert into EMP 
Values (7844,'Turner','Salesman',7698,'1981/09/08',1500,0,30)
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTONO)
Values (7876,'Adams','Clerk',7788,'1983/01/12',1100,20)
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTONO)
Values (7900,'James','Clerk',7698,'1981/12/03',950,30)
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTONO)
Values (7902,'Ford','Analyst',7566,'1981/12/03',3000,20)
Insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTONO)
Values (7934,'Miller','Clerk',7782,'1982/01/23',1300,10)

--Ejercicios del equipo de AHUMADA SIERRA SANTIAGO
--Joins
--1.Join donde junte los datos del Nombre del empleado y la localizaci�n del Departamento.
Select E.ENAME, D.LOC
From Emp E
Join Dept D
On E.DEPTONO=D.DEPTONO
--2.Join donde muestre todos los Departamentos y nombre de empleados coincidentes.
Select E.ENAME, D.DNAME
From Emp E
Right Join Dept D
ON E.DEPTONO=D.DEPTONO
--3.Join donde muestre solo el Nombre del Trabajo y localizaci�n.
Select E.JOB, D.LOC
From Emp E
Left Join Dept D
ON E.DEPTONO=D.DEPTONO
--4.Join que muestre Numero de Empleado con el nombre del Departamento.
Select E.EMPNO, D.DNAME
From Emp E
Full join Dept D
On E.DEPTONO=D.DEPTONO
--5.Join que muestre todos los datos de Empleado con Departamento.
Select * From Emp E 
Join Dept D 
On E.DEPTONO=D.DEPTONO
--Procedimientos Almacenados
--1.Hacer un Procedimiento Almacenado que muestre el numero total de empleados en cada departamento.
create procedure CantidadEmp
as
begin
select d.dname, count(e.empno) as CantidadEmpleado
from emp e
right join dept d on e.deptono=d.deptono
group by d.dname
end
--2.Realize un procedimiento almacenado que busque un empleado por su inicial.
create procedure BusquedaEmpleadoXInicial
@inicial char
as
begin 
select * from emp where ename like @inicial + '%'
end
--3.Realiza un un procedimiento almacenado donde se actualice el salario de un empleado busc�ndolo por su n�mero de empleado.
create procedure ActualizarSal
@empno int,
@salnuev int
as
begin 
update emp set sal=@salnuev where empno=@empno
end
--4.Crea un procedimiento almacenado en el que se busque los datos de los empleados por nombre de departamento.
create procedure BusquedaEmpleadoXDept
@deptname varchar(50)
as
begin
select e.* from emp e join dept d on e.deptono=d.deptono where d.dname=@deptname
end
--5.Elimine los empleados y el Departamento seg�n el n�mero de departamento.
create procedure BorrarEmpYDepto
@deptno int
as
begin
begin transaction;
delete from emp where deptono=@deptno;
delete from dept where deptono=@deptno;
commit;
end;
--Transacciones
--1.Realice una transacci�n que aumente el salario del departamento 30 y los empleados 1.05 veces.
begin transaction
	update emp
    set sal = sal * 1.05
    where deptono = 30
commit transaction
--2.Realice una transacci�n que aumente la comisi�n de todos los empleados 2.00 veces.
begin transaction
    insert into dept (deptono, dname, loc)
    values (50, 'Marketing', 'Los Angeles')
commit transaction
--3.Realice una transacci�n que aumente la comisi�n de los empleados del departamento 20 2.00 veces
begin transaction
	update emp
	set COMM = COMM * 2.00
	where deptono = 20
commit transaction
--4.Realiza una transacci�n que actualice la ubicaci�n de un de departamento.
begin transaction
    update dept
    set loc = 'San Francisco'
    where deptono = 20
commit transaction
--5.Realiza una transacci�n que elimine un departamento y todos sus empleados
begin transaction
    delete from emp
    where deptono = 50;
    delete from dept
    where deptono = 50;
commit transaction

--Ejercicios del equipo de Maria Fernanda Sandoval Romero
--Transacciones
/*1.Realice dos transacciones en donde para la primera transacci�n agregue un nuevo empleado con los siguientes datos:
Nombre: MARIO, Oficio: MANAGER, No. de empleado: 9465 ,MGR: 8465, Fecha de contrataci�n: 31/10/87, Salario: 1300
Comisi�n: 1200 ,Departamento: 10*/
/*2.Para la segunda transacci�n se a�adir� otro nuevo empleado con la siguiente informaci�n:
Nombre: EDGAR, Oficio: SALES, No. de empleado: 6153, MGR: 9462, Fecha de contrataci�n: 10/01/89, Salario: 1300
Comisi�n: 100, Departamento: 30
NOTA: La transacci�n del inciso 3 no se ejecutar� con �xito, la transacci�n del inciso 4 y 5 ser�n ejecutadas exitosamente.*/
begin transaction 
	insert into EMP(empno,ename,job,mgr,hiredate,sal,comm,deptono)
	values (9465, 'MARIO', 'MANAGER', 8465, '31/10/87', 1300, 1200, 10)
	save transaction Savepoint1
	insert into EMP(empno,ename,job,mgr,hiredate,sal,comm,deptono)
	values (6153, 'EDGAR', 'SALES', 9462, '10/01/89', 1300, 1000, 30)
commit transaction
/*3.Debido a los cambios mencionados previamente, se requiere saber el n�mero de transacciones abiertas antes de ser ejecutadas.
NOTA 1: �nicamente la primera transacci�n ser� efectuada mientras que la segunda transacci�n no se realizar� con �xito. Ambas transacciones deben
realizarse a la par, NO una por separado.*/
select @@TRANCOUNT as TransaccionesAbiertas
--4.Se pensar� hacer un recorte de personal dentro de la empresa, realice una transacci�n en donde elimine los datos del empleado llamado Smith.
begin transaction
	delete EMP where ename='SMITH'
commit transaction
/*5.King ha desempe�ado un buen trabajo para la empresa y por ello, recibir� un aumento en su salario ascendiendo ahora a 8000. 
Inicie una transacci�n en que se actualicen dichos datos.*/
begin transaction
	update EMP set sal=8000 where ename='KING'
commit transaction
/*6.Gracias a la antig�edad y compromiso del trabajador con n�mero de empleado: 7902, se le ascender� al puesto de Vicepresidente, su salario
ser� de 5000 y se le transferir� al departamento 10. Inicie una transacci�n en que se actualicen dichos datos mencionados.*/
begin transaction
	update EMP set job='VICEPRESIDENT', sal=5000, deptono=10 where empno=7902
commit transaction
--Procedimientos Almacenados
--1.Crea un procedimiento almacenado que seleccione todos los empleados de un departamento 10
create procedure empleadosdeptdiez
as
begin
select * from EMP where DEPTONO=10;
end
--2.Crea un procedimiento almacenado que seleccionar� el nombre del empleado y calcular� el "Porcentaje Comisi�n" para cada empleado
create procedure ComXEmp
as
begin
select ENAME, (COMM/SAL)*100 as "Porcentaje Comisi�n" from EMP order by ENAME
end
--3.Crea un procedimiento almacenado que selecciona los salarios (SAL) y las comisiones (COMM) de los empleados del departamento 30 en la tabla
create procedure  SalDeptoTreinta
as
begin
select SAL, COMM from EMP where DEPTONO=30
end
--4.Crear un procedimiento almacenado para Obtener los nombres de los empleados y los nombres de sus respectivos departamentos:
create procedure  NomEmpYDept
as
begin
select E.ENAME, D.DNAME from EMP as E
JOIN DEPT as D on E.DEPTONO = D.DEPTONO
end
--5.Crear un procedimiento almacenado para obtener el salario promedio del departamento 20.
create procedure PromedioDeptoVeinte
as
begin
select avg(SAL) as "Salario Promedio" from EMP where DEPTONO=20
end
--Joins
--1.Obt�n de las dos tablas todas las filas de las columnas que coinciden en ambas.
select EMP.*, DEPT.*
from EMP
inner join DEPT on EMP.DEPTONO = DEPT.DEPTONO
--2.Obt�n todas las filas de la tabla 1, de modo que si existe coincidencia en la tabla 2 con alguna columna se muestren esas filas tambi�n.
select EMP.*, DEPT.*
from EMP
left join DEPT on EMP.DEPTONO = DEPT.DEPTONO
--3.Obt�n todas las filas de la tabla 2, de modo que si existe coincidencia en la tabla 1 con alguna columna se muestren esas filas tambi�n.
select EMP.*, DEPT.*
from EMP
right join DEPT on EMP.DEPTONO = DEPT.DEPTONO
--4.Obt�n todas las filas de ambas tablas sin importar si existen o no coincidencias.
select EMP.*, DEPT.*
from EMP
full outer join DEPT on EMP.DEPTONO = DEPT.DEPTONO
/*5. Obt�n todas las filas de ambas tablas de modo que devuelvas cada fila en una tabla con cada fila en otra tabla y realizar 
el producto cartesiano entre las dos tablas.*/
select EMP.*, DEPT.*
from EMP
cross join DEPT

--Ejercicios del equipo de Ramirez Rodriguez Aldo
--JOINS
--1.Muestra el nombre del empleado, su departamento y la localizaci�n
select E.ename, D.dname, D.loc from Emp E
inner join Dept D on E.deptono=D.deptono
--2.Muestra el nombre del empleado, su c�digo y el c�digo de departamento, solo si es �Clerk�
select E.ename, E.empno, D.dname fROM Emp E
inner join Dept D on E.deptono=D.deptono
where E.job='Clerk'
--3.Muestra el nombre del empleado, su salario y el nombre del departamento solo si su departamento est� en Chicago o Dallas
select E.ename, E.sal, D.dname from Emp E
inner join Dept D on E.deptono=D.deptono
where D.loc='Chicago' or D.loc='Dallas'
--4.Muestra el nombre del empleado, el nombre de su jefe y su fecha de contrataci�n
select E.ename as 'Empleado', M.ename as 'Jefe' from Emp E
left join Emp M on E.mgr=M.empno
--5.Muestra el nombre del departamento, localizaci�n y el salario promedio, agrupado por localizaci�n.
select D.loc, D.dname, AVG(E.sal) as 'Sal. Promedio' from Dept D
left join Emp E on D.deptono=E.deptono
group by D.dname, D.loc
--Procedimientos almacenados
--1.Obtener el nombre de un empleado por su n�mero de empleado
CREATE PROCEDURE ObtenerNomEmp
@NumEmp INT
AS
BEGIN
SELECT ename
FROM Emp
WHERE empno=@NumEmp
END
--2.Obtener el salario y comisi�n por numero de empleado
CREATE PROCEDURE ObtenerSalXNumEmp
@NumEmp INT
AS
BEGIN
SELECT sal as 'Salario', comm as 'Comisi�n'
FROM Emp
WHERE empno=@NumEmp
END
--3.Obt�n el salario con el departamento con salario promedio m�s bajo
CREATE PROCEDURE ObtenerDeptSalConPromMasBajo
AS
BEGIN
SELECT TOP 1 D.dname AS 'Nom_Dept',
	AVG(E.sal) AS 'Sal_Promedio'
FROM Dept D
INNER JOIN Emp E ON D.deptono=E.deptono
GROUP BY D.dname
ORDER BY AVG(E.sal) ASC
END
--4.Actualiza el salario y comisi�n de empleado por su nombre
CREATE PROCEDURE ActualizarSalYCom
@NuevoSal float,
@NuevoComm float,
@NomEmp varchar(10)
AS
BEGIN
UPDATE Emp
SET sal=@NuevoSal, comm=@NuevoComm
WHERE ename=@NomEmp;
END
--5.Elimina un empleado por su n�mero de empleado y su nombre
CREATE PROCEDURE EliminarEmp
@NumEmpleado int
AS
BEGIN
DELETE FROM Emp
WHERE empno=@NumEmpleado
END
--TRANSACCIONES
--1.Insertar nuevo empleado
begin transaction
insert into Emp 
values (8888,'Ramirez', 'Analyst', 7902, '1984/07/02', 1200, null, 40) 
commit transaction
--2.Modificar salario y comisi�n por n�mero de empleado
begin transaction
update Emp set sal=6700, comm=500 where empno=8888
commit transaction
--3.Modificar localizaci�n por n�mero de departamento
begin transaction
update Dept set loc='Mexico' where deptono=40
commit transaction
--4.Deshacer transacci�n
begin transaction
update Dept set loc='Mexico' where deptono=40
commit transaction
--5.Comando que permite la visualizaci�n de cuantas transacciones est�n abiertas
select @@TRANCOUNT as TransaccionesAbiertas

--Ejercicios del equipo de Zamora Ramirez Ivan
--Procedimientos almacenados
--1.Utiliza los procedimientos almacenados para consultar informaci�n de un departamento
CREATE PROCEDURE ObtenerInfoDepto
@DeptNo INT
AS
BEGIN
SELECT * FROM DEPT WHERE DEPTONO=@DeptNo
END
--2.Utilizando Procedimiento almacenado realiza una lista de empleados de un departamento
CREATE PROCEDURE ListarEmpXDepto
@DeptNo INT
AS
BEGIN
SELECT * FROM EMP WHERE DEPTONO=@DeptNo
END
--3. Calcular el salario promedio de un departamento con ayuda de PA
CREATE PROCEDURE CalcularSalProm
@DeptNo INT
AS
BEGIN
SELECT AVG (SAL) AS SalarioPromedio FROM EMP WHERE DEPTONO=@DeptNo
END
--4.Inserta un nuevo empleado con PA
CREATE PROCEDURE InsertarNewEmp
@EmpNo INT, 
@Ename VARCHAR (14), 
@Job VARCHAR(13), 
@Mgr INT, 
@HireDate DATE, 
@Sal INT, 
@Comm INT, 
@DeptNo INT
AS
BEGIN
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTONO)
VALUES (@EmpNo, @Ename, @Job, @Mgr, @HireDate, @Sal, @Comm, @DeptNo)
END
--5.Actualiza la informaci�n de un empleado utilizando PA
CREATE PROCEDURE ActualizarSalEmp
@EmpNo INT, 
@NuevoSalario INT
AS
BEGIN
UPDATE EMP SET SAL = @NuevoSalario WHERE EMPNO = @EmpNo
END
--Transacciones
--1.Regresa a 0 las comisiones de todos los empleados
BEGIN TRANSACTION
UPDATE EMP 
SET COMM = 0 
WHERE COMM IS NOT NULL
ROLLBACK TRANSACTION
--2.Emule la situaci�n en donde tenga que cambiar de departamento al empleado  (ALLEN) al departamento (CLERK) y se cancele el cambio, utilizando savepoints
BEGIN TRANSACTION
UPDATE EMP SET DEPTONO=20 WHERE ENAME='ALLEN'
ROLLBACK TRANSACTION
--3.Elimina el departamento OPERATIONS y todos sus empleados y recup�ralos
BEGIN TRANSACTION 
DELETE FROM EMP WHERE DEPTONO = 40
DELETE FROM DEPT WHERE DEPTONO = 40
ROLLBACK TRANSACTION
--4.Utilizando transacciones sube el salario a los empleados del departamento 30 un 10%  y el departamento 20 un 5%
BEGIN TRANSACTION
UPDATE EMP SET SAL = SAL * 1.1 WHERE DEPTONO = 30
UPDATE EMP SET SAL = SAL * 1.05 WHERE DEPTONO = 20
ROLLBACK TRANSACTION
--5. El jefe est� planeando aumentar el sueldo del departamento ACCOUNTING, aumenta el sueldo en 10%
BEGIN TRANSACTION
UPDATE EMP SET SAL=SAL+SAL*0.1 WHERE ENAME='TURNER'
ROLLBACK TRANSACTION
--Joins
--1.Muestra la lista de empleados con informaci�n del departamento 
SELECT EMP.*, DEPT.DNAME, DEPT.LOC FROM EMP 
INNER JOIN DEPT ON EMP.DEPTONO = DEPT.DEPTONO
--2.Muestra los empleados que su salario sea mayor a 2500
SELECT EMP.ENAME, EMP.SAL, DEPT.DNAME FROM EMP 
INNER JOIN DEPT ON EMP.DEPTONO=DEPT.DEPTONO WHERE EMP.SAL>2500
--3.Haz una tabla de los empleados que tienen supervisor 
SELECT E1.ENAME AS Empleado, E2.ENAME AS Supervisor FROM EMP E1 
LEFT JOIN EMP E2 ON E1.MGR = E2.EMPNO
--4.Muestra los nombres y la localizaci�n de los empleados donde la comisi�n no sea NULL
SELECT ENAME, LOC FROM DEPT A 
INNER JOIN EMP B ON A.DEPTONO=B.DEPTONO
--5. Muestra los empleados que tengan el menor salario de su departamento, mostrando el nombre del empleado, su salario, el nombre del departamento y el trabajo que realiza
WITH EmpleadosMenorSalario AS (
 SELECT E.ENAME, E.SAL, D.DNAME, E.JOB, RANK () OVER (PARTITION BY E.DEPTONO ORDER BY E.SAL) AS ranking_salario
 FROM EMP E 
 INNER JOIN DEPT D ON E.DEPTONO=D.DEPTONO)
SELECT ENAME, SAL, DNAME, JOB
FROM EmpleadosMenorSalario
WHERE ranking_salario = 1

--Ejercicios del equipo de Luis Alfonso Gonz�lez Morales
--Procedimientos almacenados
--1.Recupera todos los empleados de un departamento espec�fico
CREATE PROCEDURE ObtenerEmpXDepto
@DepartmentoID INT
AS
BEGIN
SELECT * FROM EMP WHERE DEPTONO = @DepartmentoID
END
--2.Calcula la media salarial de un departamento espec�fico
CREATE PROCEDURE CalculaMediaSalXDepto
@DepartmentoID INT
AS
BEGIN
SELECT AVG(SAL) AS MediaSalarial FROM EMP WHERE DEPTONO=@DepartmentoID
END
--3.Actualiza el salario de un empleado seg�n su identificaci�n de empleado
CREATE PROCEDURE ActualizarSalEmpleado
@EmpleadoID INT,
@NuevoSalario INT
AS
BEGIN
UPDATE EMP SET SAL=@NuevoSalario WHERE EMPNO=@EmpleadoID
END
--4.Elimina un empleado de la tabla de empleados seg�n su identificaci�n de empleado
CREATE PROCEDURE BorrarEmp
@EmpleadoID INT
AS
BEGIN
DELETE FROM EMP WHERE EMPNO=@EmpleadoID
END
--5.Recupera todos los empleados de un departamento y trabajo espec�ficos
CREATE PROCEDURE ObtenerEmpXTrabajoYDepto
@Trabajo VARCHAR(255),
@DepartamentoID INT
AS
BEGIN
SELECT * FROM EMP WHERE JOB=@Trabajo AND DEPTONO=@DepartamentoID
END
--Transacciones
--1.Realiza una transacci�n en donde se actualice el salario de todos los empleados del departamento 20 a 1800
BEGIN TRANSACTION
UPDATE EMP SET SAL=1800 WHERE DEPTONO=20
ROLLBACK TRANSACTION
--2.Realiza una transaccion en donde elimines al empleado numero 7499 
BEGIN TRANSACTION
DELETE FROM EMP WHERE EMPNO=7499
ROLLBACK TRANSACTION
--3.Realiza una transaccion en donde actualices la ubicacion del departameno 10 a 'Los Angeles'
BEGIN TRANSACTION
UPDATE DEPT SET LOC='Los Angeles' WHERE DEPTONO=10
ROLLBACK TRANSACTION
--4.Realiza una transaccion en donde promuevas al empleado Turner de vendedor a gerente
BEGIN TRANSACTION
UPDATE EMP SET JOB='Manager' WHERE ENAME='Turner'
ROLLBACK TRANSACTION
--5.Realiza una transaccion en donde se elimine todo el departamento de investigacion
BEGIN TRANSACTION
DELETE FROM DEPT WHERE DEPTONO=20
ROLLBACK TRANSACTION
--JOINS
--1.Haz una comparaci�n entre tablas y muestra solo los empleados del departamento 30
SELECT DEPT.DNAME, EMP.ENAME FROM DEPT 
INNER JOIN EMP ON DEPT.DEPTONO=EMP.DEPTONO WHERE DEPT.DEPTONO=30
--2.Haciendo uso de un JOIN muestra los empleados con su respectivo gerente
SELECT DEPT.DNAME, EMP.ENAME FROM DEPT 
RIGHT JOIN EMP ON DEPT.DEPTONO=EMP.DEPTONO
--3.Realiza un JOIN para encontrar solo los empleados del departamento de investigacion
SELECT DEPT.DNAME, EMP.ENAME FROM DEPT 
INNER JOIN EMP ON DEPT.DEPTONO = EMP.DEPTONO WHERE DEPT.DNAME�=�'Research'
--4.Une todas las filas de las tablas EMP y DEPT, devolviendo todos los empleados y sus respectivos departamentos, incluso si no tienen un departamento asignado.
SELECT E.EMPNO, E.ENAME, E.JOB, D.DNAME FROM EMP E
FULL OUTER JOIN DEPT D ON E.DEPTONO=D.DEPTONO
--5.Une la tabla EMP consigo misma para obtener empleados y sus subordinados correspondientes (si tienen).
SELECT E.ENAME AS Jefe, S.ENAME AS Subordinado FROM EMP E
INNER JOIN EMP S ON E.EMPNO = S.MGR

--Ejercicios del equipo de Diego Hernandez Gomez
--Procedimientos Almacenados
--1.Crea un procedimiento almacenado llamado "GetAvgDeptSalary" que tome un par�metro "DeptNo" y devuelva el salario promedio de los empleados en ese departamento.
CREATE PROCEDURE GetAvgDeptSalary 
@DeptNo INT
AS BEGIN
SELECT AVG(SAL) AS "Salario Promedio" FROM EMP
WHERE DEPTONO=@DeptNo
END
--2.Crea un procedimiento almacenado llamado "InsertEmployee" que tome varios par�metros (EmpNo, Ename, Job, Mgr, HireDate, Sal, Comm, DeptNo) y los utilice para insertar un nuevo empleado en la tabla EMP.
CREATE PROCEDURE InsertEmployee 
@EmpNo INT,
@Ename NVARCHAR(50), 
@Job NVARCHAR(50),
@Mgr INT, 
@HireDate DATE, 
@Sal INT, 
@Comm INT, 
@DeptNo INT
AS 
BEGIN
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTONO)
VALUES (@EmpNo, @Ename, @Job, @Mgr, @HireDate, @Sal, @Comm, @DeptNo)
END
--3.Crea un procedimiento almacenado llamado "UpdateEmployeeSalary" que tome dos par�metros (EmpNo y NewSalary) y actualice el salario de un empleado en la tabla EMP.
CREATE PROCEDURE UpdateEmployeeSalary 
@EmpNo INT,
@NewSalary INT 
AS
BEGIN UPDATE EMP
SET SAL=@NewSalary WHERE EMPNO=@EmpNo
END
--4.Crea un procedimiento almacenado llamado "DeleteEmployee" que tome un par�metro (EmpNo) y elimine un empleado de la tabla EMP.
CREATE PROCEDURE DeleteEmployee 
@EmpNo INT
AS 
BEGIN
DELETE FROM EMP WHERE EMPNO=@EmpNo
END
--5.Crea un procedimiento almacenado llamado "GetEmployeesByDept" que tome un par�metro (DeptNo) y devuelva todos los empleados en ese departamento.
CREATE PROCEDURE GetEmployeesByDept 
@DeptNo INT
AS 
BEGIN
SELECT * FROM EMP
WHERE DEPTONO=@DeptNo
END
--Transacciones
--1.Inicia una transacci�n que actualice los salarios de los empleados en el departamento 30 y las comisiones de los empleados en el departamento 20. Confirma la transacci�n si todas las operaciones se realizan con �xito, o realiza un rollback en caso de error.
BEGIN TRANSACTION;
UPDATE EMP SET SAL=SAL*1.1 WHERE DEPTONO=30
UPDATE EMP SET COMM=COMM*1.1 WHERE DEPTONO=20
ROLLBACK TRANSACTION
--2.Inicia una transacci�n que inserte un nuevo departamento en la tabla DEPT y luego inserte empleados en ese nuevo departamento en la tabla EMP. Confirma la transacci�n si todas las operaciones se realizan con �xito, o realiza un rollback en caso de error.
BEGIN TRANSACTION
INSERT INTO DEPT (DEPTNO, DNAME, LOC) 
VALUES (50, 'HR', 'LOS ANGELES');
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTONO)
VALUES (8001, 'Alice', 'MANAGER', NULL, '2023-01-15', 6000, 50), (8002, 'Bob', 'ANALYST', 8001, '2023-01-20', 5000, 50)
ROLLBACK TRANSACTION
--3.Inicia una transacci�n que elimine todos los empleados de un departamento espec�fico en la tabla EMP y luego elimine el departamento en la tabla DEPT. 
BEGIN TRANSACTION;
DELETE FROM EMP WHERE DEPTONO=40
DELETE FROM DEPT WHERE DEPTONO=40
ROLLBACK TRANSACTION
--4.Inicia una transacci�n que actualice los salarios de los empleados en el departamento 10 y actualice el trabajo de los empleados en el departamento 20. 
BEGIN TRANSACTION
UPDATE EMP SET SAL=SAL*1.15 WHERE DEPTONO=10
UPDATE EMP SET JOB ='Manager' WHERE DEPTONO=20
ROLLBACK TRANSACTION
--5.Inicia una transacci�n que inserte un nuevo empleado en la tabla EMP y luego actualice su salario. 
BEGIN TRANSACTION
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTONO)
VALUES (1005, 'Miguel A', 'Clerk', 7902, '2023-11-06', 1000, 10)
UPDATE EMP SET SAL=SAL*1.15 WHERE EMPNO=1005
ROLLBACK TRANSACTION
--Joins
--1.Realiza un join entre las tablas EMP y DEPT para obtener el nombre de los empleados y el nombre de sus respectivos departamentos.
SELECT E.ENAME, D.DNAME FROM EMP E
INNER JOIN DEPT D ON E.DEPTONO = D.DEPTONO
--2.Realiza un join entre la tabla EMP y s� misma para obtener el nombre de los empleados y el nombre de sus jefes, mostrando "NULO" si un empleado no tiene jefe.
SELECT E.ENAME AS "Empleado", M.ENAME AS "Jefe" FROM EMP E
LEFT JOIN EMP M ON E.MGR = M.EMPNO
--3.Realiza un join entre las tablas EMP y DEPT para obtener el nombre de los empleados, el nombre de sus departamentos y las ubicaciones de esos departamentos.
SELECT E.ENAME, D.DNAME, D.LOC FROM EMP E
INNER JOIN DEPT D ON E.DEPTONO=D.DEPTONO
--4.Realiza una consulta que utilice un join para obtener el nombre de los empleados cuyos salarios se encuentran en un rango espec�fico.
SELECT E.ENAME, E.SAL FROM EMP E WHERE E.SAL BETWEEN 2000 AND 3000
--5.Realiza una consulta que utilice un join para obtener el nombre de los empleados que tienen comisiones.
SELECT E.ENAME, E.COMM FROM EMP E WHERE E.COMM IS NOT NULL