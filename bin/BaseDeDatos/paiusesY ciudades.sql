use eventosya;

CREATE TABLE paises (
  id INT PRIMARY KEY,
  nombre VARCHAR(50)
);

CREATE TABLE ciudades (
  id INT PRIMARY KEY,
  nombre VARCHAR(50),
  pais_id INT,
  FOREIGN KEY (pais_id) REFERENCES paises(id)
);

-- Insertar datos en la tabla "paises"
INSERT INTO paises (id, nombre) VALUES
  (1, 'Canadá'),
  (2, 'Estados Unidos'),
  (3, 'México'),
  (4, 'Argentina'),
  (5, 'Brasil'),
  (6, 'Colombia'),
  (7, 'Perú'),
  (8, 'Chile'),
  (9, 'Ecuador'),
  (10, 'Venezuela');

-- Insertar datos en la tabla "ciudades"
INSERT INTO ciudades (id, nombre, pais_id) VALUES
  -- Canadá
  (1, 'Toronto', 1),
  (2, 'Montreal', 1),
  (3, 'Vancouver', 1),
  (4, 'Calgary', 1),
  (5, 'Edmonton', 1),
  (6, 'Ottawa', 1),
  (7, 'Winnipeg', 1),
  (8, 'Quebec', 1),
  (9, 'Hamilton', 1),
  (10, 'Halifax', 1),
  -- Estados Unidos
  (11, 'Nueva York', 2),
  (12, 'Los Ángeles', 2),
  (13, 'Chicago', 2),
  (14, 'Houston', 2),
  (15, 'Phoenix', 2),
  (16, 'San Antonio', 2),
  (17, 'San Diego', 2),
  (18, 'Dallas', 2),
  (19, 'San Francisco', 2),
  (20, 'Miami', 2),
  -- México
  (21, 'Ciudad de México', 3),
  (22, 'Guadalajara', 3),
  (23, 'Monterrey', 3),
  (24, 'Puebla', 3),
  (25, 'Tijuana', 3),
  (26, 'León', 3),
  (27, 'Juárez', 3),
  (28, 'Zapopan', 3),
  (29, 'Mérida', 3),
  (30, 'Querétaro', 3),
  -- Argentina
  (31, 'Buenos Aires', 4),
  (32, 'Córdoba', 4),
  (33, 'Rosario', 4),
  (34, 'Mendoza', 4),
  (35, 'San Miguel de Tucumán', 4),
  (36, 'La Plata', 4),
  (37, 'Mar del Plata', 4),
  (38, 'Salta', 4),
  (39, 'Santa Fe', 4),
  (40, 'Corrientes', 4),
  -- Brasil
  (41, 'São Paulo', 5),
  (42,  'Rio de Janeiro', 5),
  (43, 'Brasilia', 5),
  (44, 'Salvador', 5),
  (45, 'Fortaleza', 5),
  (46, 'Belo Horizonte', 5),
  (47, 'Manaus', 5),
  (48, 'Curitiba', 5),
  (49, 'Recife', 5),
  (50, 'Porto Alegre', 5),
  -- Colombia
  (51, 'Bogotá', 6),
  (52, 'Medellín', 6),
  (53, 'Cali', 6),
  (54, 'Barranquilla', 6),
  (55, 'Cartagena', 6),
  (56, 'Cúcuta', 6),
  (57, 'Bucaramanga', 6),
  (58, 'Pereira', 6),
  (59, 'Santa Marta', 6),
  (60, 'Manizales', 6),
  -- Perú
  (61, 'Lima', 7),
  (62, 'Arequipa', 7),
  (63, 'Trujillo', 7),
  (64, 'Chiclayo', 7),
  (65, 'Piura', 7),
  (66, 'Cusco', 7),
  (67, 'Iquitos', 7),
  (68, 'Huancayo', 7),
  (69, 'Tacna', 7),
  (70, 'Chimbote', 7),
  -- Chile
  (71, 'Santiago', 8),
  (72, 'Valparaíso', 8),
  (73, 'Concepción', 8),
  (74, 'La Serena', 8),
  (75, 'Antofagasta', 8),
  (76, 'Temuco', 8),
  (77, 'Rancagua', 8),
  (78, 'Arica', 8),
  (79, 'Talca', 8),
  (80, 'Viña del Mar', 8),
  -- Ecuador
  (81, 'Guayaquil', 9),
  (82, 'Quito', 9),
  (83, 'Cuenca', 9),
  (84, 'Santo Domingo', 9),
  (85, 'Machala', 9),
  (86, 'Durán', 9),
  (87, 'Manta', 9),
  (88, 'Portoviejo', 9),
  (89, 'Ambato', 9),
  (90, 'Loja', 9),
  -- Venezuela
  (91, 'Caracas', 10),
  (92, 'Maracaibo', 10),
  (93, 'Valencia', 10),
  (94, 'Barquisimeto', 10),
  (95, 'Maracay', 10),
  (96, 'Ciudad Guayana', 10),
  (97, 'Barcelona', 10),
  (98, 'Maturín', 10),
  (99, 'San Cristóbal', 10),
  (100, 'Cumana', 10);

