/*	Proyecto base de datos: Pokédex
	Reyes Hernández Miguel Ángel
	Gómez Huerta Rafael Uriel
	San Pedro Rivera Roberto Yael
	Mendoza Rivera Noé
	Sánchez Rojas Yael*/

CREATE DATABASE Pokedex
USE Pokedex

CREATE TABLE Tipo (
    IDTipo INT PRIMARY KEY,
    NombreTipo CHAR(20) NOT NULL
)
CREATE TABLE Debilidad (
    IDDebilidad INT PRIMARY KEY,
    IDTipoOrigen INT NOT NULL FOREIGN KEY (IDTipoOrigen) REFERENCES Tipo(IDTipo),
    IDTipoDebilidad INT NOT NULL FOREIGN KEY (IDTipoDebilidad) REFERENCES Tipo(IDTipo)
)
CREATE TABLE Region (
    IDRegion INT PRIMARY KEY,
    NombreRegion CHAR(20) NOT NULL
)
CREATE TABLE MetodoEvolucion (
    IDMetodoEvolucion INT PRIMARY KEY,
    MetodoEvolucion CHAR(20) NOT NULL  --Ayuda a buscar pokémon que puedan evolucionar con lo que ya tiene el usuario en su inventario
)
CREATE TABLE Evolucion (
    IDEvolucion INT PRIMARY KEY,
    PokemonOrigen CHAR(20) NOT NULL,
    PokemonEvolucion CHAR(20) NOT NULL, 
    IDMetodoEvolucion INT FOREIGN KEY REFERENCES MetodoEvolucion(IDMetodoEvolucion)
)
CREATE TABLE Caracteristicas (
    IDCaracteristicas INT PRIMARY KEY,--Uno o más pokémon pueden tener características similares
    Tamaño INT,
    Peso INT,
    Genero CHAR(10) --('Macho', 'Hembra') Sirve para buscar evoluciones diferentes por género
)
CREATE TABLE Estadisticas (
    IDEstadisticas INT PRIMARY KEY,--Uno o más pokémon pueden tener estadísticas similares
    Ataque INT,
    Defensa INT,
    PuntosDeSalud INT,
    PuntosDeCombate INT,
)
CREATE TABLE SetMovimientos(
    IDSetMovimientos INT PRIMARY KEY, --Varios pokémon pueden compartir un set de movimiento con ayuda de MT's
    NombresMovimientos CHAR(40) NOT NULL --Todo pokemon tiene mínimo 2 movimientos y máximo 4
)
CREATE TABLE Pokemon (
    IDPokemon INT PRIMARY KEY,
    NombrePokemon CHAR(15) NOT NULL,
    IDRegion INT FOREIGN KEY REFERENCES Region(IDRegion),
    IDTipo INT NOT NULL FOREIGN KEY REFERENCES Tipo(IDTipo),
    IDDebilidad INT NOT NULL FOREIGN KEY REFERENCES Debilidad(IDDebilidad),
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
(10, 'Volador');
INSERT INTO Debilidad (IDDebilidad, IDTipoOrigen, IDTipoDebilidad) VALUES
(1, 2, 1),  -- Fuego es débil contra Agua
(2, 3, 2),  -- Agua es débil contra Planta
(3, 1, 3),  -- Planta es débil contra Fuego
(4, 5, 4),  -- Hielo es débil contra Eléctrico
(5, 6, 7),  -- Lucha es débil contra Psíquico
(6, 8, 5),  -- Tierra es débil contra Hielo
(7, 9, 10), -- Veneno es débil contra Volador
(8, 10, 6), -- Volador es débil contra Lucha
(9, 7, 9),  -- Psíquico es débil contra Veneno
(10, 4, 8); -- Eléctrico es débil contra Tierra
INSERT INTO Region (IDRegion, NombreRegion) VALUES
(1, 'Kanto'),
(2, 'Johto'),
(3, 'Hoenn'),
(4, 'Sinnoh'),
(5, 'Unova'),
(6, 'Kalos'),
(7, 'Alola'),
(8, 'Galar'),
(9, 'Teselia'),
(10, 'Isla Naranja');
INSERT INTO MetodoEvolucion (IDMetodoEvolucion, MetodoEvolucion) VALUES
(1, 'Piedra Evolutiva'),
(2, 'Intercambio'),
(3, 'Felicidad'),
(4, 'Subir de Nivel en la Noche'),
(5, 'Subir de Nivel con Objeto Especial');


--Valores insertados por un usuario "x"
INSERT INTO Evolucion (IDEvolucion, PokemonOrigen, PokemonEvolucion, IDMetodoEvolucion) VALUES
(1, 4, 5, 1),  -- Pikachu evoluciona a Raichu con Piedra Evolutiva
(2, 7, 8, 2),  -- Machoke evoluciona a Machamp por Intercambio
(3, 13, 16, 3), -- Eevee evoluciona a Espeon por Felicidad
(4, 25, 40, 4), -- Pikachu evoluciona a Raichu al subir de nivel en la noche
(5, 35, 36, 5); -- Clefairy evoluciona a Clefable al subir de nivel con Objeto Especial
INSERT INTO Caracteristicas (IDCaracteristicas, Tamaño, Peso, Genero) VALUES
(1, 10, 5, 'Macho'),
(2, 8, 7, 'Hembra'),
(3, 15, 12, 'Macho'),
(4, 9, 6, 'Hembra'),
(5, 12, 10, 'Macho');
INSERT INTO Estadisticas (IDEstadisticas, Ataque, Defensa, PuntosDeSalud, PuntosDeCombate) VALUES
(1, 50, 40, 80, 60),
(2, 65, 35, 75, 55),
(3, 55, 45, 70, 50),
(4, 70, 30, 85, 65),
(5, 60, 50, 75, 60);
INSERT INTO SetMovimientos (IDSetMovimientos, NombresMovimientos) VALUES
(1, 'Placaje, Arañazo'),
(2, 'Ascuas, Gruñido, Lanzallamas'),
(3, 'Burbuja, Pistola Agua'),
(4, 'Rayo, Trueno, Atactrueno'),
(5, 'Arañazo, Malicioso, Placaje, Derribo');
-- Insertar valores en la tabla Pokemon
INSERT INTO Pokemon VALUES
(1, 'Banette', 1, 8, 9, NULL, 1, 1, 1), 
(2, 'Torchic', 3, 2, 1, 3, 2, 2, 2),
(3, 'Squirtle', 1, 3, 8, 4, 3, 3, 3),
(4, 'Pikachu', 1, 4, 10, NULL, 4, 4, 4),
(5, 'Bulbasaur', 1, 1, 9, 5, 5, 5, 5),
(6, 'Charmander', 1, 2, 3, 6, 6, 6, 6),
(7, 'Machop', 2, 6, 7, 7, 7, 7, 7),
(8, 'Machoke', 2, 6, 7, 8, 8, 8, 8),
(9, 'Eevee', 1, 7, 9, 9, 9, 9, 9),
(10, 'Clefairy', 1, 1, 10, 10, 10, 10, 10),
(11, 'Vulpix', 1, 2, 3, 11, 11, 11, 11),
(12, 'Gastly', 1, 8, 9, 12, 12, 12, 12),
(13, 'Dratini', 2, 10, 2, 13, 13, 13, 13),
(14, 'Totodile', 3, 3, 8, 14, 14, 14, 14),
(15, 'Chikorita', 3, 1, 5, 15, 15, 15, 15);
