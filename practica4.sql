create database testjoins
use testjoins

create table Departamentos(
    DepartamentoId int,
    NombreDepartamento varchar(30)
)

create table Empleados(
    EmpleadoId int,
    NombreEmpleado varchar(30),
    DepartamentoId int
)

Insert into Departamentos 
Values (31,'sales')
Insert into Departamentos 
Values (33,'engineering')
Insert into Departamentos 
Values (34,'clerical')
Insert into Departamentos 
Values (35,'marketing')

Insert into Empleados 
Values (1,'Raffery', 31)
Insert into Empleados 
Values (2,'Jones', 33)
Insert into Empleados 
Values (3,'Heisenberg', 33)
Insert into Empleados 
Values (4,'Robinson', 34)
Insert into Empleados 
Values (5,'Smith', 34)
Insert into Empleados 
Values (6,'Williams', 36)

--inner join
select * 
from Empleados E 
JOIN Departamentos D 
on E.DepartamentoId=D.DepartamentoId

--Right Join 
Select 
    E.NombreEmpleado as 'Empleado',
    D.NombreDepartamento as 'Departamento' 
from Empleados E
Right Join Departamentos D
on E.DepartamentoId = D.DepartamentoId

--Full Join
Select
    E.NombreEmpleado as 'Empleado',
    D.NombreDepartamento as 'Departamento'
From Empleados E
Full join Departamentos D
on E.DepartamentoId=D.DepartamentoId

--Left Join
Select
    E.NombreEmpleado as 'Empleado',
    D.NombreDepartamento as 'Departamento'
From Departamentos D
Left Join Empleados E
on D.DepartamentoId = E.DepartamentoId
