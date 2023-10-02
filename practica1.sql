create database Practica1_RHMA
use Practica1_RHMA

create table Personas(
ID int primary key not null,
Nombre char(20),
Apellidos char(30),
Direccion char(40),
Ciudad char(15)
)

 insert into Personas (ID,Nombre,Apellidos,Direccion,Ciudad)
 values (1,'Marco Antonio','Trejo Lemus','Calle E 822','Tampico')
 insert into Personas
 values (2,'Martha Beatriz','Trejo Lemus','Calle E 822','Tampico')
 insert into Personas
 values (3,'Juana Elvira','Trejo Lemus','Calle E 822','Tampico')
 insert into Personas
 values (4,'Nora Zulma','Trejo Lemus','Calle E 822','Tampico')
 insert into Personas 
 values (5,'Laura Lucero','Sobrevilla Trejo','Calle E 822','Tampico')
 insert into Personas
 values (6,'María de la Luz','Trejo Campos','Calle E 822','Tampico')
 insert into Personas
 values (7,'Trinidad','Trejo Bautista','Calle E 822','Tampico')
 insert into Personas
 values (8,'Marcel Abisag','Sobrevilla Trejo','Calle E 822','Tampico')
 insert into Personas
 values (9,'José Abraham','Sobrevilla Trejo','Calle E 822','Tampico')
 insert into Personas
 values (10,'Samuel Salomon','Olmeda Trejo','Calle E 822','Tampico')

  select * from	Personas
  select Apellidos FROM Personas
  SELECT DISTINCT Apellidos FROM Personas
  SELECT * FROM Personas WHERE Ciudad = 'Tampico'
  SELECT * FROM Personas WHERE Nombre='Marcel Abisag' AND Apellidos='Sobrevilla Trejo'
  SELECT * FROM Personas WHERE Nombre='Martha Beatriz' OR Nombre='Juana Elvira'
  SELECT * FROM Personas WHERE Apellidos='Sobrevilla Trejo' AND (Nombre='Marcel Abisag' OR Nombre='José Abraham') 
  SELECT * FROM Personas ORDER BY Nombre DESC
 select * from Personas order by Nombre
 /* Si no se agrega ASC o DESC, en automático se ordena en ascendente*/
SELECT Nombre,Ciudad,Direccion FROM Personas ORDER BY Nombre DESC
SELECT Nombre,Ciudad From Personas where Apellidos= 'Trejo Bautista' ORDER BY Nombre DESC
SELECT Nombre,Ciudad From Personas where Apellidos= 'Trejo Bautista' ORDER BY Ciudad DESC

INSERT INTO Personas 
Values (11,'Martha','Lemus Hurtado','Canoga Park','LA')
/*Así se agregarán los valores de acuerdo al orden que tenga la tabla*/
INSERT INTO Personas (ID,Nombre,Apellidos)
VALUEs(12,'Antonio','Trejo Campos')
/*Se agregarán los valores de acuerdo a las columnas que estén en los paréntesis*/

Select *FROM PERSONAS WHERE Ciudad is NULL Order BY Nombre
Update Personas SET Direccion='Canoga Park', Ciudad='LA' where Nombre='Antonio' AND Apellidos='Trejo Campos'
Select Direccion From Personas where Nombre='Antonio' AND Apellidos='Trejo Campos'

Delete from Personas WHERE Nombre='Marco Antonio' AND Apellidos ='Trejo Lemus'
SELECT TOP 2 * FROM Personas
Select top 5 Nombre,Ciudad From Personas
Select TOP 30 PERCENT * FROM Personas

SELECT * FROM Personas WHERE Ciudad LIKE 'Ta%'
SELECT * FROM Personas WHERE Ciudad NOT LIKE '%pico'
