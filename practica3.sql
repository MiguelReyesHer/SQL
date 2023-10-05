CREATE DATABASE Practica3
USE Practica3

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

--Obtener todos los datos de todos los empleados
SELECT * FROM EMP
--Obtener todos los datos de todos los departamentos
SELECT * FROM DEPT
--Obtener todos los datos de los administrativos
SELECT * FROM EMP WHERE JOB = 'CLERK'
--Obtener todos los datos de los administrativos ordenados por nombre
SELECT * FROM EMP WHERE JOB = 'CLERK' ORDER BY ENAME
--Obten el numero, nombre y salario de los empleados
SELECT EMPNO, ENAME, SAL FROM EMP
--Lista los nombres de todos los departamentos
SELECT DNAME FROM DEPT
--Lista los nombres de todos los departamentos por nombre
SELECT DNAME FROM DEPT ORDER BY DNAME
--Lista los nombres de todos los departamentos por ciudad
SELECT DISTINCT LOC FROM DEPT ORDER BY LOC
--Lista los nombres de todos los departamentos por ciudad en orden inverso
SELECT DISTINCT LOC FROM DEPT ORDER BY LOC DESC
--Obten el nombre y empleo de todos los empleados, ordenado por salario
SELECT ENAME,JOB FROM EMP ORDER BY SAL
--Obtener el nombre y empleo de todos los empleados, ordenado primero por su trabajo y luego por su salario
SELECT ENAME,JOB FROM EMP ORDER BY JOB,SAL
--Obtener el nombre y empleo de todos los empleados, ordenando inversamente por empleo y normalmente por salario
SELECT ENAME,JOB FROM EMP ORDER BY JOB DESC, SAL
--Obten los salarios y las comisiones de los empleados del departamento 30
SELECT SAL,COMM FROM EMP WHERE DEPTONO=30
--Obten los salarios y las comisiones de los empleados del departamento 30 ordenado por comision
SELECT SAL,COMM FROM EMP WHERE DEPTONO=30 ORDER BY COMM
--Obten las comisiones de todos los empleados
SELECT COMM FROM EMP
--Obten las comisiones de los empleados de forma que no se repitan
SELECT DISTINCT COMM FROM EMP
--Obten el nombre de empleado y su comision SIN FILAS repetidas
SELECT DISTINCT ENAME,COMM FROM EMP
--Obten el nombre de empleado y su salario SIN FILAS repetidas
SELECT DISTINCT ENAME,SAL FROM EMP
--Obten las comisiones de los empleados y sus numeros de departamento, de forma que no se repitan filas
SELECT DISTINCT COMM,DEPTONO FROM EMP
--Obten los nuevos salarios de los empleados del departamento 30, que resultaran de sumar a su salario +1000, y muestra los nombres de los empleados
SELECT ENAME,SAL + 1000 FROM EMP WHERE DEPTONO = 30
--Lo mismo que la anterior, pero mostrando su salario original, y haz que la columna que almacena el nuevo salario se denomine NUEVO SALARIO
SELECT ENAME,SAL AS "SALARIO ORIGINAL",SAL+1000 AS "NUEVO SALARIO" FROM EMP WHERE DEPTONO = 30
--Halla los empleados que tienen una comision superior a la mitad de su salario
SELECT * FROM EMP WHERE COMM > SAL/2
--Halla los empleados que no tienen comision, o que la tengan menor o igual que el 25 % de su salario
SELECT * FROM EMP WHERE COMM IS NULL OR COMM <= SAL*0.25
/*Obten una lista de nombres de empleados y sus salarios, de forma que en la salida aparezca en todas las filas “Nombre:” y “Salario:” 
antes del respectivo campo. Hazlo de forma que selecciones exactamente tres expresiones.*/
SELECT CONCAT('Nombre: ',ENAME), CONCAT('Salario: ',CAST(SAL AS varchar(10))) FROM EMP
--Hallar el codigo, salario y comision de los empleados cuyo codigo sea mayor que 7500           
SELECT EMPNO,SAL,COMM FROM EMP WHERE EMPNO > 7500
--Obten todos los datos de los empleados que esten a partir de la J
SELECT * FROM EMP WHERE ENAME >= 'J'
--Obten el salario, comision y salario total (salario+comision) de los empleados con comision, ordenando el resultado por numero de empleado
SELECT SAL,COMM,SAL+COMM AS "SALARIO TOTAL" FROM EMP WHERE COMM IS NOT NULL ORDER BY EMPNO
--Lista la misma informacion pero para los empleados que no tienen comision
SELECT SAL,COMM,SAL+COMM AS "SALARIO TOTAL" FROM EMP WHERE COMM IS NULL ORDER BY EMPNO
--Muestra el nombre de los empleados que, teniendo un salario superior a 1000, tengan como jefe al empleado cuyo codigo es 7698     
SELECT ENAME FROM EMP WHERE SAL>1000 AND MGR=7698
--Halla el conjunto complementario del resultado del ejercicio anterior
SELECT ENAME FROM EMP WHERE SAL<=1000 OR MGR != 7698
--Indica para cada empleado el porcentaje que supone su comision sobre su salario, ordenando el resultado por el nombre del mismo.
SELECT ENAME,(COMM/SAL)*100 AS "Porcentaje de Comisión" FROM EMP ORDER BY ENAME
--Hallar los empleados del departamento 10 cuyo nombre no contiene la cadena LA
SELECT * FROM EMP WHERE DEPTONO = 10 AND ENAME NOT LIKE '%LA%'
--Obten los empleados que no son supervisados por ningun otro
SELECT * FROM EMP WHERE MGR IS NULL
--Obten los nombres de los departamentos que no sean Ventas (SALES) ni investigacion (RESEARCH) Ordena el resultado por la localidad del departamento
SELECT DNAME,LOC FROM DEPT WHERE DNAME NOT IN ('SALES','RESEARCH') ORDER BY LOC
/*Deseamos conocer el nombre de los empleados y el codigo del departamento de los administrativos(CLERK) que no trabajan en el departamento 10, 
y cuyo salario es superior a 800, ordenado por fecha de contratacion*/
SELECT ENAME,DEPTONO FROM EMP WHERE JOB='CLERK' AND DEPTONO != 10 AND SAL>800 ORDER BY HIREDATE
--Para los empleados que tengan comision, obten sus nombres y el cociente entre su salario y su comision (excepto cuando la comision sea cero), ordenando el resultado por nombre
SELECT ENAME,SAL/COMM AS "Cociente Salario/Comisión" FROM EMP WHERE COMM IS NOT NULL AND COMM !=0 ORDER BY ENAME
--Lista toda la informacion sobre los empleados cuyo nombre completo tenga exactamente 5 caracteres
SELECT * FROM EMP WHERE LEN(ENAME)=5
--Lo mismo, pero para los empleados cuyo nombre tenga al menos cinco letras
SELECT * FROM  EMP WHERE LEN(ENAME)>=5
--Halla los datos de los empleados que, o bien su nombre empieza por A y su salario es superior a 1000, o bien reciben comision y trabajan en el departamento 30
SELECT * FROM EMP WHERE (ENAME LIKE 'A%' AND SAL>1000) OR (COMM IS NOT NULL AND DEPTONO = 30)
/*Halla el nombre, el salario y el sueldo total de todos los empleados, ordenando el resultado primero por salario y luego por el sueldo total. 
En el caso de que no tenga comision, el sueldo total debe reflejar solo el salario*/
SELECT ENAME,SAL, 
       CASE 
           WHEN COMM = 0 OR COMM IS NULL THEN SAL 
           ELSE SAL + COMM 
       END AS "Sueldo Total"
FROM EMP
ORDER BY SAL
