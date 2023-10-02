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
SELECT * FROM  WHERE LEN(ENAME)>=5
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




SELECT ENAME, SAL, COMM
FROM EMP
WHERE SAL BETWEEN COMM / 2 AND COMM;
SELECT ENAME, SAL, COMM
FROM EMP
WHERE SAL NOT BETWEEN COMM / 2 AND COMM;
SELECT ENAME, JOB
FROM EMP
WHERE ENAME LIKE 'A%' AND JOB LIKE '%MAN';
SELECT ENAME, JOB
FROM EMP
WHERE SUBSTR(ENAME, 1, 1) = 'A' AND SUBSTR(JOB, -3) = 'MAN';
SELECT ENAME
FROM EMP
WHERE LENGTH(ENAME) <= 5;
SELECT ENAME,
       SAL AS "Salario Actual",
       CASE
           WHEN COMM IS NOT NULL THEN 'SI'
           ELSE 'NO'
       END AS "Tiene Comisión",
       ROUND(SAL * 1.06, 2) AS "Salario del Año Próximo",
       ROUND(SAL * 1.06 * 1.07, 2) AS "Salario del Siguiente Año"
FROM EMP;
SELECT ENAME, HIREDATE
FROM EMP
WHERE JOB != 'SALESMAN';
SELECT *
FROM EMP
WHERE EMPNO IN (7844, 7900, 7521, 7521, 7782, 7934, 7678, 7369)
AND EMPNO NOT IN (7902, 7839, 7499, 7878);
SELECT *
FROM EMP
ORDER BY DEPTNO ASC, EMPNO DESC;
SELECT *
FROM EMP
WHERE (EMPNO < MGR AND SAL BETWEEN 1000 AND 2000) OR DEPTNO = 30;
SELECT MAX(SAL) AS "Salario Máximo",
       SUM(NVL(COMM, 0)) AS "Total Comisiones",
       COUNT(*) AS "Número de Empleados"
FROM EMP;
SELECT *
FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE EMPNO = 7934)
ORDER BY SAL;
SELECT ENAME, JOB, SAL
FROM EMP
WHERE SAL >= (SELECT SAL FROM EMP WHERE ENAME = 'ALLEN' AND ROWNUM = 1)
ORDER BY SAL;
SELECT ENAME
FROM EMP
WHERE ROWNUM = 1
ORDER BY ENAME DESC;
SELECT MAX(SAL) AS "Salario Más Alto",
       MIN(SAL) AS "Salario Más Bajo",
       MAX(SAL) - MIN(SAL) AS "Diferencia"
FROM EMP;
SELECT ENAME, SAL
FROM EMP
WHERE SAL = (SELECT MAX(SAL) FROM EMP)
UNION ALL
SELECT ENAME, SAL
FROM EMP
WHERE SAL = (SELECT MIN(SAL) FROM EMP);
SELECT D.DEPTNO, D.DNAME, AVG(E.SAL) AS "Media de Salarios"
FROM DEPT D
JOIN EMP E ON D.DEPTNO = E.DEPTNO
WHERE E.SAL < 5000
GROUP BY D.DEPTNO, D.DNAME
HAVING MIN(E.SAL) > 900;
SELECT E.ENAME, D.LOC
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE LENGTH(D.LOC) > 5
ORDER BY D.LOC DESC, E.ENAME;
SELECT *
FROM EMP
WHERE SAL >= (SELECT AVG(SAL) FROM EMP);
SELECT E1.*
FROM EMP E1
JOIN (
    SELECT DEPTNO, MAX(SAL) AS "Salario Máximo"
    FROM EMP
    GROUP BY DEPTNO
) E2 ON E1.DEPTNO = E2.DEPTNO AND E1.SAL > E2."Salario Máximo";
SELECT COUNT(DISTINCT JOB) AS "Empleos Diferentes",
       COUNT(*) AS "Número de Empleados",
       COUNT(DISTINCT SAL) AS "Salarios Diferentes",
       SUM(SAL) AS "Suma de Salarios"
FROM EMP
WHERE DEPTNO = 30;
SELECT COUNT(*) AS "Número de Empleados con Comisión"
FROM EMP
WHERE COMM IS NOT NULL;
SELECT COUNT(*) AS "Número de Empleados en el Departamento 20"
FROM EMP
WHERE DEPTNO = 20;
SELECT D.DEPTNO, D.DNAME, COUNT(E.EMPNO) AS "Número de Empleados"
FROM DEPT D
JOIN EMP E ON D.DEPTNO = E.DEPTNO
GROUP BY D.DEPTNO, D.DNAME
HAVING COUNT(E.EMPNO) > 3;
SELECT E1.*
FROM EMP E1
JOIN (
    SELECT DISTINCT JOB
    FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE JOB = 'SALESMAN' AND ROWNUM = 1)
) E2 ON E1.JOB = E2.JOB
WHERE E1.DEPTNO = 10;
SELECT E1.*
FROM EMP E1
WHERE E1.EMPNO IN (SELECT DISTINCT MGR FROM EMP WHERE MGR IS NOT NULL)
ORDER BY E1.ENAME DESC;
SELECT E1.*
FROM EMP E1
WHERE E1.JOB IN (SELECT DISTINCT JOB FROM EMP WHERE LOC = 'CHICAGO');
SELECT JOB, COUNT(*) AS "Número de Empleados"
FROM EMP
GROUP BY JOB;
SELECT DEPTNO, SUM(SAL) AS "Suma de Salarios"
FROM EMP
GROUP BY DEPTNO;
SELECT D.DEPTNO, D.DNAME
FROM DEPT D
LEFT JOIN EMP E ON D.DEPTNO = E.DEPTNO
WHERE E.EMPNO IS NULL;
SELECT E1.*
FROM EMP E1
LEFT JOIN EMP E2 ON E1.EMPNO = E2.MGR
WHERE E2.MGR IS NULL;