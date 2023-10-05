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
SELECT * FROM EMP WHERE JOB = 'Clerk'
--Obtener todos los datos de los administrativos ordenados por nombre
SELECT * FROM EMP WHERE JOB = 'Clerk' ORDER BY ENAME
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
SELECT DNAME,LOC FROM DEPT WHERE DNAME NOT IN ('Sales','Research') ORDER BY LOC
/*Deseamos conocer el nombre de los empleados y el codigo del departamento de los administrativos(CLERK) que no trabajan en el departamento 10, 
y cuyo salario es superior a 800, ordenado por fecha de contratacion*/
SELECT ENAME,DEPTONO FROM EMP WHERE JOB='Clerk' AND DEPTONO != 10 AND SAL>800 ORDER BY HIREDATE
--Para los empleados que tengan comision, obten sus nombres y el cociente entre su salario y su comision (excepto cuando la comision sea cero), ordenando el resultado por nombre
SELECT ENAME,SAL/COMM AS "Cociente Salario/Comisión" FROM EMP WHERE COMM IS NOT NULL AND COMM !=0 ORDER BY ENAME
--Lista toda la informacion sobre los empleados cuyo nombre completo tenga exactamente 5 caracteres
SELECT * FROM EMP WHERE LEN(ENAME)=5
--Lo mismo, pero para los empleados cuyo nombre tenga al menos cinco letras
SELECT * FROM EMP WHERE LEN(ENAME)>=5
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
--Obten el nombre, salario y la comision de los empleados que perciben un salario que esta entre la mitad de la comision y la propia comision
SELECT ENAME,SAL,COMM FROM EMP WHERE SAL BETWEEN COMM/2 AND COMM
--Obten el complementario del anterior
SELECT ENAME,SAL,COMM FROM EMP WHERE SAL NOT BETWEEN COMM / 2 AND COMM
--Lista los nombres y empleos de aquellos empleados cuyo empleo acaba en MAN y cuyo nombre empieza por A
SELECT ENAME,JOB FROM EMP WHERE ENAME LIKE 'A%' AND JOB LIKE '%man'
/*Intenta resolver la pregunta anterior con un predicado simple, es decir, de forma que en la clausula WHERE no haya conectores 
logicos como AND, OR, etc. Si ayuda a resolver la pregunta, se puede suponer que el nombre del empleado tiene al menos cinco letras*/
SELECT ENAME, JOB FROM EMP WHERE SUBSTRING(ENAME, 1, 1) = 'A' AND RIGHT(JOB, 3) = 'man'
--Halla los nombres de los empleados cuyo nombre tiene como maximo cinco caracteres
SELECT ENAME FROM EMP WHERE LEN(ENAME) <= 5
/*Suponiendo que el a ̃no proximo la subida del sueldo total de cada empleado sera del 6 %, y el siguiente del 7 %, halla los nombres y el salario total actual,
del año proximo y del siguiente, de cada empleado. Indique ademas con SI o NO, si el empleado tiene comision, si no tiene comision, el total se considera igual 
al salario. Se supone que no existen comisiones negativas. */
SELECT ENAME, SAL AS "Salario Actual",
       CASE
           WHEN COMM IS NOT NULL THEN 'SI'
           ELSE 'NO'
       END AS "Tiene Comisión",
       ROUND(SAL * 1.06, 2) AS "Salario del Año Próximo",
       ROUND(SAL * 1.06 * 1.07, 2) AS "Salario del Siguiente Año"
FROM EMP
--Lista los nombres y fecha de contratacion de aquellos empleados que no son vendedores (SALESMAN)
SELECT ENAME,HIREDATE FROM EMP WHERE JOB!='Salesman'
/*Obten la informacion disponible de los empleados cuyo numero es uno de los siguientes: 7844, 7900, 7521, 7521, 7782, 7934, 7678 y 7369, 
pero que no sea uno de los siguientes: 7902, 7839, 7499 ni 7878. La sentencia no debe complicarse innecesariamente, y debe dar el resultado correcto
independientemente de lo empleados almacenados en la base de datos*/
SELECT * FROM EMP WHERE EMPNO IN (7844, 7900, 7521, 7521, 7782, 7934, 7678, 7369) AND EMPNO NOT IN (7902, 7839, 7499, 7878)
--Ordena los empleados por su codigo de departamento, y luego de manera descendente por su numero de empleado
SELECT * FROM EMP ORDER BY DEPTONO ASC, EMPNO DESC;
/*Para los empleados que tengan como jefe a un empleado con codigo mayor que el suyo, obten
los que reciben de salario mas de 1000 y menos de 2000, o que estan en el departamento 30*/
SELECT * FROM EMP WHERE (EMPNO<MGR AND SAL BETWEEN 1000 AND 2000) OR DEPTONO=30
--Obten el salario m ́as alto de la empresa, el total destinado a comisiones y el numero de empleados
SELECT MAX(SAL) AS "Salario Máximo",
       SUM(ISNULL(COMM,0)) AS "Total Comisiones",
       COUNT(*) AS "Número de Empleados"
FROM EMP
--Halla los datos de los empleados cuyo salario es mayor que el del empleado de codigo 7934, ordenando por el salario
SELECT * FROM EMP WHERE SAL>(SELECT SAL FROM EMP WHERE EMPNO=7934) ORDER BY SAL
--Obten informacion en la que se reflejen los nombres, empleos y salarios tanto de los empleados que superan en salario a Allen como del propio Allen.
SELECT E.ENAME,E.JOB,E.SAL FROM EMP E
JOIN (
    SELECT SAL
    FROM EMP
    WHERE ENAME = 'Allen'
) ALLEN_SALARY
ON E.SAL >= ALLEN_SALARY.SAL;
--Halla el nombre el ultimo empleado por orden alfabetico
SELECT ENAME FROM EMP WHERE ENAME=(SELECT MAX(ENAME) FROM EMP)
--Halla el salario mas alto, el mas bajo, y la diferencia entre ellos
SELECT MAX(SAL) AS "Salario Más Alto", MIN(SAL) AS "Salario Más Bajo", MAX(SAL)-MIN(SAL) AS "Diferencia" FROM EMP
--Sin conocer los resultados del ejercicio anterior, ¿quienes reciben el salario mas alto y el mas bajo, y a cuanto ascienden estos salarios?
SELECT ENAME,SAL FROM EMP WHERE SAL=(SELECT MAX(SAL) FROM EMP) UNION ALL
SELECT ENAME,SAL FROM EMP WHERE SAL=(SELECT MIN(SAL) FROM EMP)
/*Considerando empleados con salario menor de 5000, halla la media de los salarios de los departamentos cuyo salario mınimo supera a 900. 
Muestra tambien el codigo y el nombre de los departamentos*/
SELECT D.DEPTONO, D.DNAME, AVG(E.SAL) AS "Media de Salarios" FROM DEPT D
JOIN EMP E ON D.DEPTONO=E.DEPTONO
WHERE E.SAL < 5000
GROUP BY D.DEPTONO, D.DNAME
HAVING MIN(E.SAL)>900
--¿Que empleados trabajan en ciudades de mas de cinco letras? Ordena el resultado inversamente por ciudades y normalmente por los nombres de los empleados
SELECT E.ENAME, D.LOC FROM EMP E
JOIN DEPT D ON E.DEPTONO = D.DEPTONO
WHERE LEN(D.LOC)>5
ORDER BY D.LOC DESC, E.ENAME
--Halla los empleados cuyo salario supera o coincide con la media del salario de la empresa
SELECT * FROM EMP WHERE SAL>=(SELECT AVG(SAL) FROM EMP)
--Obten los empleados cuyo salario supera al de sus compañeros de departamento
SELECT E1.* FROM EMP E1
JOIN (
    SELECT DEPTONO, MAX(SAL) AS "Salario Máximo"
    FROM EMP
    GROUP BY DEPTONO
) E2 ON E1.DEPTONO = E2.DEPTONO AND E1.SAL>E2."Salario Máximo"
/*¿Cuantos empleos diferentes, cuantos empleados, y cuantos salarios diferentes encontramos en
el departamento 30, y a cuanto asciende la suma de salarios de dicho departamento?*/
SELECT COUNT(DISTINCT JOB) AS "Empleos Diferentes",
       COUNT(*) AS "Número de Empleados",
       COUNT(DISTINCT SAL) AS "Salarios Diferentes",
       SUM(SAL) AS "Suma de Salarios"
FROM EMP WHERE DEPTONO=30
--¿Cuantos empleados tienen comision?
SELECT COUNT(*) AS "Número de Empleados con Comisión" FROM EMP WHERE COMM IS NOT NULL
--¿Cuantos empleados tiene el departamento 20?
SELECT COUNT(*) AS "Número de Empleados en el Departamento 20" FROM EMP WHERE DEPTONO=20
--Halla los departamentos que tienen mas de tres empleados, y el numero de empleados de lo mismos
SELECT D.DEPTONO, D.DNAME, COUNT(E.EMPNO) AS "Número de Empleados" FROM DEPT D
JOIN EMP E ON D.DEPTONO = E.DEPTONO
GROUP BY D.DEPTONO, D.DNAME
HAVING COUNT(E.EMPNO) > 3
--Halla los empleados que tienen por lo menos un empleado a su mando, ordenados inversamente por nombre
SELECT E1.* FROM EMP E1
WHERE E1.EMPNO IN (SELECT DISTINCT MGR FROM EMP WHERE MGR IS NOT NULL)
ORDER BY E1.ENAME DESC
--Obten informacion sobre los empleados que tienen el mismo trabajo que que algun empleado que trabaje en Chicago
SELECT E1.* FROM EMP E1
WHERE E1.JOB IN (SELECT DISTINCT JOB FROM DEPT WHERE LOC='Chicago')
--¿Que empleos distintos encontramos en la empresa, y cuantos empleados desempeñan cada uno de ellos?
SELECT JOB, COUNT(*) AS "Número de Empleados" FROM EMP GROUP BY JOB
--Halla la suma de salarios de cada departamento
SELECT DEPTONO, SUM(SAL) AS "Suma de Salarios" FROM EMP GROUP BY DEPTONO
--Obten todos los departamentos sin empleados
SELECT D.DEPTONO, D.DNAME FROM DEPT D
LEFT JOIN EMP E ON D.DEPTONO=E.DEPTONO
WHERE E.EMPNO IS NULL
--Halla los empleados que no tienen a otro empleado a sus ́ordenes
SELECT E1.* FROM EMP E1
LEFT JOIN EMP E2 ON E1.EMPNO = E2.MGR
WHERE E2.MGR IS NULL
/*¿Cuantos empleados hay en cada departamento, y cual es la media anual del salario de cada uno (el salario almacenado es mensual)? 
Indique el nombre del departamento para clarificar el resultado*/
SELECT D.DNAME AS "Nombre del Departamento",
       COUNT(E.EMPNO) AS "Número de Empleados",
       AVG(E.SAL * 12) AS "Salario Promedio Anual"
FROM DEPT D
LEFT JOIN EMP E ON D.DEPTONO = E.DEPTONO
GROUP BY D.DNAME
--Halla los empleados del departamento 30, por orden descendente de comision
SELECT ENAME,JOB,COMM FROM EMP WHERE DEPTONO=30 ORDER BY COMM DESC
--Obten los empleados que trabajan en Dallas o New York
SELECT ENAME,JOB,LOC FROM EMP E
INNER JOIN DEPT D ON E.DEPTONO = D.DEPTONO
WHERE LOC IN ('Dallas', 'New York');
/*Obtén un listado en el que se reflejen los empleados y los nombres de sus jefes. En el listado deben aparecer todos los empleados, 
aunque no tengan jefe, poniendo un nulo el nombre de éste*/
SELECT E.ENAME AS "Nombre del Empleado", E.JOB AS "Trabajo",
       CASE
           WHEN E.MGR IS NULL THEN NULL
           ELSE (SELECT ENAME FROM EMP WHERE EMPNO = E.MGR)
       END AS "Nombre del Jefe"
FROM EMP E
/*Deseamos saber cuántos empleados supervisa cada jefe. Para ello, obtén un listado en el que se reflejen el código y el nombre de cada jefe, 
junto al número de empleados que supervisa directamente. Como puede haber empleados sin jefe, para estos se indicará solo el número de ellos, 
y los valores restantes (código y nombre del jefe) se dejarán como nulos*/
SELECT E.MGR AS "Código del Jefe",
       (SELECT ENAME FROM EMP WHERE EMPNO = E.MGR) AS "Nombre del Jefe",
       COUNT(*) AS "Número de Empleados Supervisados"
FROM EMP E
GROUP BY E.MGR
--Hallar el departamento cuya suma de salarios sea la más alta, mostrando esta suma de salarios y el nombre del departamento
SELECT TOP 1 D.DNAME AS "Nombre del Departamento",
            SUM(E.SAL) AS "Suma de Salarios"
FROM DEPT D
INNER JOIN EMP E ON D.DEPTONO = E.DEPTONO
GROUP BY D.DNAME
ORDER BY SUM(E.SAL) DESC;
--Obtén los datos de los empleados que cobren los dos mayores salarios de la empresa.
SELECT ENAME, JOB, SAL
FROM (
    SELECT ENAME, JOB, SAL, RANK() OVER (ORDER BY SAL DESC) AS SalarioRank
    FROM EMP
) RankedSalaries
WHERE SalarioRank <= 2;
/*Obtén las localidades que no tienen departamentos sin empleados y en las que trabajen al menos cuatro empleados. Indica también el número de 
empleados que trabajan en esas localidades*/
SELECT D.LOC AS "Localidad",
       COUNT(E.EMPNO) AS "Número de Empleados"
FROM DEPT D
LEFT JOIN EMP E ON D.DEPTONO = E.DEPTONO
GROUP BY D.LOC
HAVING COUNT(E.EMPNO) >= 4
AND COUNT(E.EMPNO) > SUM(CASE WHEN E.EMPNO IS NULL THEN 1 ELSE 0 END)

       
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
