CREATE DATABASE Practica3_1
USE Practica3_1

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

--Joins:
-- Muestra el nombre del empleado y su departamento
SELECT E.ENAME, D.DNAME FROM EMP E
INNER JOIN DEPT D ON E.DEPTONO=D.DEPTONO
-- Muestra el nombre del empleado y su departamento, incluso si el departamento no tiene empleados
SELECT E.ENAME, D.DNAME FROM EMP E
RIGHT JOIN DEPT D ON E.DEPTONO=D.DEPTONO
-- Muestra el nombre del departamento y los empleados que pertenecen a él, incluso si algunos empleados no tienen departamento asignado
SELECT D.DNAME, E.ENAME FROM DEPT D
LEFT JOIN EMP E ON D.DEPTONO=E.DEPTONO
-- Muestra el nombre del empleado y su departamento, excluyendo a los empleados que no tienen departamento asignado
SELECT E.ENAME, D.DNAME FROM EMP E
INNER JOIN DEPT D ON E.DEPTONO=D.DEPTONO
WHERE E.DEPTONO IS NOT NULL
-- Muestra el nombre del empleado y el nombre de su jefe
SELECT E.ENAME AS "Empleado", M.ENAME AS "Jefe" FROM EMP E
LEFT JOIN EMP M ON E.MGR=M.EMPNO
-- Muestra el nombre del departamento y el salario promedio de sus empleados
SELECT D.DNAME, AVG(E.SAL) AS "Salario Promedio" FROM DEPT D
LEFT JOIN EMP E ON D.DEPTONO=E.DEPTONO
GROUP BY D.DNAME
-- Muestra el nombre del empleado, su departamento y el salario promedio del departamento, solo si el salario promedio es mayor a 2000
SELECT E.ENAME, D.DNAME, AVG(E.SAL) AS "Salario Promedio" FROM EMP E
INNER JOIN DEPT D ON E.DEPTONO=D.DEPTONO
GROUP BY E.ENAME, D.DNAME
HAVING AVG(E.SAL)>2000
-- Muestra el nombre del departamento y el total de comisiones pagadas por los empleados del departamento
SELECT D.DNAME, SUM(E.COMM) AS "Total de Comisiones" FROM DEPT D
LEFT JOIN EMP E ON D.DEPTONO=E.DEPTONO
GROUP BY D.DNAME
-- Muestra el nombre del empleado y su departamento, solo si el empleado tiene un trabajo de "Manager"
SELECT E.ENAME, D.DNAME FROM EMP E
INNER JOIN DEPT D ON E.DEPTONO=D.DEPTONO
WHERE E.JOB='Manager'
-- Muestra el nombre del empleado, su salario y el nombre del departamento, solo si el salario es superior a 2500
SELECT E.ENAME, E.SAL, D.DNAME FROM EMP E
INNER JOIN DEPT D ON E.DEPTONO=D.DEPTONO
WHERE E.SAL>2500


--Procedimientos almacenados:
--Obtiene el nombre de un empleado por su número de empleado
CREATE PROCEDURE ObtenerNombreEmpleado
    @NumeroEmpleado INT
AS
BEGIN
    SELECT ENAME
    FROM EMP
    WHERE EMPNO=@NumeroEmpleado;
END
--Obtiene todos los empleados de un departamento por su número de departamento
CREATE PROCEDURE ObtenerEmpleadosEnDepartamento
    @NumeroDepartamento INT
AS
BEGIN
    SELECT ENAME
    FROM EMP
    WHERE DEPTONO=@NumeroDepartamento;
END
--Calcula el salario promedio en un departamento por su número de departamento
CREATE PROCEDURE CalcularSalarioPromedioEnDepartamento
    @NumeroDepartamento INT
AS
BEGIN
    SELECT AVG(SAL) AS "Salario Promedio"
    FROM EMP
    WHERE DEPTONO=@NumeroDepartamento;
END
--Inserta un nuevo empleado en la tabla EMP
CREATE PROCEDURE InsertarEmpleado
    @NumeroEmpleado INT,
    @NombreEmpleado VARCHAR(20),
    @Trabajo VARCHAR(20),
    @Gerente INT,
    @FechaContratacion DATE,
    @Salario INT,
    @Comision INT,
    @NumeroDepartamento INT
AS
BEGIN
    INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTONO)
    VALUES (@NumeroEmpleado, @NombreEmpleado, @Trabajo, @Gerente, @FechaContratacion, @Salario, @Comision, @NumeroDepartamento);
END
--Actualiza el salario de un empleado por su número de empleado
CREATE PROCEDURE ActualizarSalarioEmpleado
    @NumeroEmpleado INT,
    @NuevoSalario INT
AS
BEGIN
    UPDATE EMP
    SET SAL=@NuevoSalario
    WHERE EMPNO=@NumeroEmpleado;
END
--Elimina un empleado por su número de empleado
CREATE PROCEDURE EliminarEmpleado
    @NumeroEmpleado INT
AS
BEGIN
    DELETE FROM EMP
    WHERE EMPNO=@NumeroEmpleado;
END
--Obtiene el total de comisiones pagadas en un departamento por su número de departamento
CREATE PROCEDURE ObtenerTotalComisionesEnDepartamento
    @NumeroDepartamento INT
AS
BEGIN
    SELECT SUM(COMM) AS "Total de Comisiones"
    FROM EMP
    WHERE DEPTONO=@NumeroDepartamento;
END
--Obtiene la fecha de contratación de un empleado por su número de empleado
CREATE PROCEDURE ObtenerFechaContratacion
    @NumeroEmpleado INT
AS
BEGIN
    SELECT HIREDATE
    FROM EMP
    WHERE EMPNO=@NumeroEmpleado;
END
-- Obtiene el nombre del jefe de un empleado por su número de empleado
CREATE PROCEDURE ObtenerJefeEmpleado
    @NumeroEmpleado INT
AS
BEGIN
    SELECT E.ENAME AS "Empleado", M.ENAME AS "Jefe"
    FROM EMP E
    LEFT JOIN EMP M ON E.MGR = M.EMPNO
    WHERE E.EMPNO=@NumeroEmpleado;
END
--Obtiene el departamento con el salario promedio más alto
CREATE PROCEDURE ObtenerDepartamentoConSalarioPromedioMasAlto
AS
BEGIN
    SELECT TOP 1 D.DNAME AS "Nombre del Departamento",
                AVG(E.SAL) AS "Salario Promedio"
    FROM DEPT D
    INNER JOIN EMP E ON D.DEPTONO=E.DEPTONO
    GROUP BY D.DNAME
    ORDER BY AVG(E.SAL) DESC;
END
