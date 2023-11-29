/*	Proyecto base de datos: Pokédex
	Reyes Hernández Miguel Ángel
	Gómez Huerta Rafael Uriel
	San Pedro Rivera Roberto Yael
	Mendoza Rivera Noé
	Sánchez Rojas Yael*/

CREATE DATABASE Pokedex
USE Pokedex

CREATE TABLE Tipo (
    IDTipo INT PRIMARY KEY NOT NULL,
    NombreTipo CHAR(20) 
)
CREATE TABLE Debilidad (
    IDDebilidad INT PRIMARY KEY NOT NULL,
    IDTipoOrigen INT FOREIGN KEY (IDTipoOrigen) REFERENCES Tipo(IDTipo),
    IDTipoDebilidad INT FOREIGN KEY (IDTipoDebilidad) REFERENCES Tipo(IDTipo)
)
CREATE TABLE Region (
    IDRegion INT PRIMARY KEY NOT NULL,
    NombreRegion CHAR(20)
)
CREATE TABLE MetodoEvolucion (
    IDMetodoEvolucion INT PRIMARY KEY NOT NULL,
    MetodoEvolucion CHAR(50) --Ayuda a buscar pokémon que puedan evolucionar con lo que ya tiene el usuario en su inventario
)
CREATE TABLE Evolucion (
    IDEvolucion INT PRIMARY KEY NOT NULL,
    PokemonOrigen CHAR(20),
    PokemonEvolucion CHAR(20),
    IDMetodoEvolucion INT FOREIGN KEY REFERENCES MetodoEvolucion(IDMetodoEvolucion)
)
CREATE TABLE Caracteristicas (
    IDCaracteristicas INT PRIMARY KEY NOT NULL,--Uno o más pokémon pueden tener características similares
    Tamaño INT, --No posee un rango de valores específico (Unidades: m)
    Peso INT, --No posee un rango de valores específico (Unidades: Kg)
    Genero CHAR(10) --('Macho', 'Hembra') Sirve para buscar evoluciones diferentes por género
)
CREATE TABLE Estadisticas (
    IDEstadisticas INT PRIMARY KEY NOT NULL,--Uno o más pokémon pueden tener estadísticas similares
    Ataque INT, --Valores con un rango de 5-190
    Defensa INT, --Valores de un rango de 5-230
    PuntosDeSalud INT, --Valores con un rango de 20-255
    Velocidad INT --Valores con un rango de 5-160 
	--Los valores son múltilplos de 5
--Estas estidísticas sirven para que un usuario le otorge un rol imaginario a cada pokemon en su equipo; como si uno fuera ofensivo ó defensivo)
)
CREATE TABLE SetMovimientos(
    IDSetMovimientos INT PRIMARY KEY NOT NULL, --Varios pokémon pueden compartir un set de movimiento con ayuda de MT's
    NombresMovimientos CHAR(40) --Todo pokemon tiene mínimo 2 movimientos y máximo 4
)
CREATE TABLE Pokemon (
    IDPokemon INT PRIMARY KEY NOT NULL,
    NombrePokemon CHAR(15) NOT NULL,
    IDRegion INT FOREIGN KEY REFERENCES Region(IDRegion),
    IDTipo INT FOREIGN KEY REFERENCES Tipo(IDTipo),
    IDDebilidad INT FOREIGN KEY REFERENCES Debilidad(IDDebilidad),
    IDEvolucion INT FOREIGN KEY REFERENCES Evolucion(IDEvolucion),
    IDEstadisticas INT FOREIGN KEY REFERENCES Estadisticas(IDEstadisticas),
    IDCaracteristicas INT FOREIGN KEY REFERENCES Caracteristicas(IDCaracteristicas),
    IDSetMovimientos INT FOREIGN KEY REFERENCES SetMovimientos(IDSetMovimientos)
)

--Por defecto la Pokédex ya posee algunos atributos; incluso si el usuario no ha hecho ninguna inserción, como los métodos de evolución, algunos set de movimientos, tipos, debilidad, regiones
INSERT INTO Tipo (IDTipo, NombreTipo) VALUES
(1, 'Planta'),
(2, 'Fuego'),
(3, 'Agua'),
(4, 'Eléctrico'),
(5, 'Hielo'),
(6, 'Lucha'),
(7, 'Psíquico'),
(8, 'Tierra'),
(9, 'Veneno'),
(10, 'Volador'),
(11, 'Normal'),
(12, 'Fantasma'),
(13, 'Hada'),
(14, 'Acero');
INSERT INTO Debilidad (IDDebilidad, IDTipoOrigen, IDTipoDebilidad) VALUES
(1, 1, 2), --Planta es débil contra Fuego
(2, 2, 3), --Fuego es débil contra Agua
(3, 3, 4), --Agua es débil contra Eléctrico
(4, 4, 8), --Eléctrico es débil contra Tierra
(5, 5, 2), --Hielo es débil contra Fuego
(6, 6, 7), --Lucha es débil contra Psíquico
(7, 7, 12), --Psíquico es débil contra Fantasma
(8, 8, 3), --Tierra es débil contra Agua
(9, 9, 8), --Veneno es débil contra Tierra
(10, 10, 4), --Volador es débil conttra Eléctrico
(11, 11, 6), --Normal es débil contra  Lucha
(12, 12, 12), --Fantasma es débil contra Fantasma
(13, 13, 14), --Hada es débil contra el Acero
(14, 14, 2); --Acero es débil contra Fuego
INSERT INTO Region (IDRegion, NombreRegion) VALUES
(1, 'Kanto'),
(2, 'Johto'),
(3, 'Hoenn'),
(4, 'Sinnoh');
INSERT INTO MetodoEvolucion (IDMetodoEvolucion, MetodoEvolucion) VALUES
(1, 'Piedra Evolutiva Trueno'),
(2, 'Piedra Evolutiva Agua'),
(3, 'Intercambio'),
(4, 'Felicidad'),
(5, 'Subir de Nivel'),
(6, 'Subir de Nivel con Objeto Especial'),
(7, 'Piedra Evolutiva Día');


--Valores insertados por un usuario "x"
INSERT INTO Evolucion (IDEvolucion, PokemonOrigen, PokemonEvolucion, IDMetodoEvolucion) VALUES
(1, 'Pikachu', 'Raichu', 1),  -- Pikachu evoluciona a Raichu con Piedra Evolutiva Trueno
(2, 'Pikachu', 'Raichu', 5), -- Pikachu evoluciona a Raichu al subir de nivel 
--Un Pokémon puede evolucionar a un mismo pokemon por diferentes métodos
(3, 'Eevee', 'Vaporeon', 2), --Eevee evoluciona a Vaporeon con piedra Evolutiva Agua
--Un pokémon puede tener distintas evoluciones dependiendo de su método de evolución, como el caso de eeeve
(4, 'Machoke', 'Machamp', 3),  -- Machoke evoluciona a Machamp por Intercambio
(5, 'Kadabra', 'Alakazam', 3), --Kadabra evoluciona a Alakazam por Intercambio
(6, 'Haunter', 'Gengar', 3), --Haunter evoluciona a Gengar por intercambio
(7, 'Eevee', 'Espeon', 4), -- Eevee evoluciona a Espeon por Felicidad
(8, 'Togepi','Togetic', 4), --Togepi evoluciona a togetic por felicidad
(9, 'Togetic', 'Togekiss', 7), --Togetic evoluciona a togekiss con piedra evolutiva día
--Como se ve en el caso anterior, un pokemon puede tener una evolución intermedia y una final
(10, 'Charmander', 'Carmeleon', 5), --Charmander evoluciona a charmaleon por subir de nivel
(11, 'Charmeleon', 'Charizard', 5), --Charmeleon evoluciona a Charizard por subir de nivel
(12, 'Onix', 'Steelex', 7); --Onix evoluciona a steelex por objeto especial
INSERT INTO Caracteristicas (IDCaracteristicas, Tamaño, Peso, Genero) VALUES
(1, 1, 20, 'Macho'),
(2, 0.5, 34, 'Hembra'),
(3, 3, 50, 'Macho'),
(4, 0.7, 10, 'Hembra'),
(5, 0.1, 25, 'Macho'),
(6, 0.8, NULL, NULL),
(7, 1, 12, NULL),
(8, 0.2, 33, 'Macho'),
(9, NULL, NULL, 'Hembra'),
(10, NULL, NULL, 'Macho');
INSERT INTO Estadisticas (IDEstadisticas, Ataque, Defensa, PuntosDeSalud, Velocidad) VALUES
(1, 150, 150, 50, 140), --Estadísticas de un pokemon ofensivo
(2, 5, 215, 250, 80),  --Estadísticas de un pokemon defensivo
(3, 150, NULL, 230, 150), 
(4, 140, NULL, NULL, 140),
(5, 105, NULL, NULL, NULL),
(6, 90, 80, 70, 60),
(7, 20, 200, 190, 60),
(8, 30, 205, 165, NULL),
(9, 120, 75, 160, 140), --Estadísticas de un pokemon equilibrado
(10, 175, 55, 225, 135);
INSERT INTO SetMovimientos (IDSetMovimientos, NombresMovimientos) VALUES
(1, 'Placaje, Arañazo'),
(2, 'Ascuas, Gruñido, Lanzallamas'),
(3, 'Burbuja, Pistola Agua'),
(4, 'Rayo, Trueno, Atactrueno'),
(5, 'Arañazo, Malicioso, Placaje, Derribo'),
(6, 'Ataque Rápido, Desenrollar'),
(7, 'Vuelo, Ala de Acero, Ataque Aéreo'),
(8, 'Gruñido, Colmillo Rayo, Cabezazo Zen'),
(9, 'Terremoto, Excavar, Triturar'),
(10, 'Rayo Carga, Ventisca, Onda Certera');
INSERT INTO Pokemon (IDPokemon,NombrePokemon,IDRegion,IDTipo,IDDebilidad,IDEvolucion,IDEstadisticas,IDCaracteristicas,IDSetMovimientos) VALUES
(0001,'Pikachu',1,4,4,2,9,NULL,9),
(0002,'Raichu',1,4,4,2,9,NULL,4),
(0003,'Eevee',1,11,11,3,1,5,1),
(0004,'Eevee',1,11,11,7,3,1,1),
(0005,'Vaporeon',1,3,3,3,1,3,3),
(0006,'Machoke',1,6,6,4,7,6,NULL),
(0007,'Machamp',1,6,6,4,7,7,NULL),
(0008,'Kadabra',1,7,7,5,7,6,10),
(0009,'Alakazam',1,7,7,5,7,7,10),--Diferentes pokemon pueden compartir características y estadísticas 
(0010,'Haunter',1,12,12,6,2,7,NULL),
(0011,'Gengar',1,12,12,6,2,3,5),
(0012,'Espeon',2,7,7,7,3,1,5),
(0013,'Togepi',2,10,10,NULL,4,2,6),
(0014,'Togetic',2,10,10,9,4,4,7),
(0015,'Togekiss',4,10,10,9,4,9, NULL),--Las evoluciones generalmente comparten estadísticas
(0016,'Charmander',1,2,2,10,10,NULL,NULL),
(0017,'Charmeleon',1,2,2,NULL,10,NULL,NULL),
(0018,'Charizard',1,2,2,11,10,NULL,NULL),
(0019,'Onix',1,8,NULL,12,9,NULL,NULL),
(0020,'Steelex',2,NULL,14,NULL,9, NULL,8);--Se pueden agregar datos útiles sólo para combates

-- Procedimientos almacenados:
-- Insertar un nuevo Pokémon
CREATE PROCEDURE InsertarNuevoPokemon(
    @IDPokemon INT,
    @NombrePokemon CHAR(15),
    @IDRegion INT,
    @IDTipo INT,
    @IDDebilidad INT,
    @IDEvolucion INT,
    @IDEstadisticas INT,
    @IDCaracteristicas INT,
    @IDSetMovimientos INT
)
AS
BEGIN
    INSERT INTO Pokemon (IDPokemon, NombrePokemon, IDRegion, IDTipo, IDDebilidad, IDEvolucion, IDEstadisticas, IDCaracteristicas, IDSetMovimientos)
    VALUES (@IDPokemon, @NombrePokemon, @IDRegion, @IDTipo, @IDDebilidad, @IDEvolucion, @IDEstadisticas, @IDCaracteristicas, @IDSetMovimientos);
EN
-- Insertar un nuevo tipo y debilidad
CREATE PROCEDURE InsertarNuevoTipoYDebilidad(
    @IDTipo INT,
    @NombreTipo CHAR(20),
    @IDDebilidad INT,
    @IDTipoOrigen INT,
    @IDTipoDebilidad INT
)
AS
BEGIN
    INSERT INTO Tipo (IDTipo, NombreTipo) VALUES (@IDTipo, @NombreTipo);
    INSERT INTO Debilidad (IDDebilidad, IDTipoOrigen, IDTipoDebilidad) VALUES (@IDDebilidad, @IDTipoOrigen, @IDTipoDebilidad);
END
-- Eliminar un Pokémon por su nombre
CREATE PROCEDURE EliminarPokemonPorNombre(
    @NombrePokemon CHAR(15)
)
AS
BEGIN
    DELETE FROM Pokemon WHERE NombrePokemon = @NombrePokemon;
END
-- Editar un set de movimientos
CREATE PROCEDURE EditarSetMovimientos(
    @IDSetMovimientos INT,
    @NuevosMovimientos CHAR(40)
)
AS
BEGIN
    UPDATE SetMovimientos SET NombresMovimientos=@NuevosMovimientos WHERE IDSetMovimientos = @IDSetMovimientos;
END
-- Insertar nuevas estadísticas
CREATE PROCEDURE InsertarNuevasEstadisticas(
    @IDEstadisticas INT,
    @Ataque INT,
    @Defensa INT,
    @PuntosDeSalud INT,
    @Velocidad INT
)
AS
BEGIN
    INSERT INTO Estadisticas (IDEstadisticas, Ataque, Defensa, PuntosDeSalud, Velocidad)
    VALUES (@IDEstadisticas, @Ataque, @Defensa, @PuntosDeSalud, @Velocidad);
END
	
-- Transacciones:
-- Insertar más datos a la tabla Caracteristicas
begin transaction
INSERT INTO Caracteristicas (IDCaracteristicas, Tamaño, Peso, Genero)
VALUES
(11, 0.6, 18, 'Hembra'),
(12, 1.2, 75, 'Macho');
commit transaction
-- Cuenta a los pokemon con el mismo nombre registrados en el sistema
begin transaction
SELECT NombrePokemon, COUNT(*) AS Cantidad FROM Pokemon GROUP BY NombrePokemon
commit transaction
-- Elimina al Pokemon Onix con reversibilidad
begin transaction 
delete Pokemon where NombrePokemon = 'Onix'
rollback transaction 

-- Joins:
-- Muestra a los Pokémon de un tipo
SELECT Pokemon.NombrePokemon, Tipo.NombreTipo FROM Pokemon
JOIN Tipo ON Pokemon.IDTipo = Tipo.IDTipo
WHERE Tipo.NombreTipo = 'Fuego'; --Se puede cambiar el tipo
--Muestra los Pokémon de una región
SELECT Pokemon.NombrePokemon, Region.NombreRegion FROM Pokemon
JOIN Region ON Pokemon.IDRegion = Region.IDRegion
WHERE Region.NombreRegion = 'Kanto'; -- La region se puede modificar
-- Muestra los Pokémon que puedan evolucionar por un método de evolución
SELECT Pokemon.NombrePokemon, Evolucion.PokemonEvolucion, MetodoEvolucion.MetodoEvolucion FROM Pokemon
JOIN Evolucion ON Pokemon.IDEvolucion = Evolucion.IDEvolucion
JOIN MetodoEvolucion ON Evolucion.IDMetodoEvolucion = MetodoEvolucion.IDMetodoEvolucion
WHERE MetodoEvolucion.MetodoEvolucion = 'Subir de Nivel'; --Se puede cambiar el metodo de evolucion
-- Muestra los Pokémon que son débiles a un tipo
SELECT Pokemon.NombrePokemon, Debilidad.IDTipoDebilidad, Tipo.NombreTipo AS TipoDebilidad FROM Pokemon
JOIN Debilidad ON Pokemon.IDDebilidad = Debilidad.IDDebilidad
JOIN Tipo ON Debilidad.IDTipoDebilidad = Tipo.IDTipo
WHERE Tipo.NombreTipo = 'Agua'; --Se puede cambiar el tipo
