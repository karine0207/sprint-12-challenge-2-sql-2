CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    edad INT
);

INSERT INTO usuarios (nombre, apellido, email, edad) VALUES
('Juan', 'Gomez', 'juan.gomez@example.com', 28),
('Maria', 'Lopez', 'maria.lopez@example.com', 32),
('Carlos', 'Rodriguez', 'carlos.rodriguez@example.com', 25),
('Laura', 'Fernandez', 'laura.fernandez@example.com', 30),
('Pedro', 'Martinez', 'pedro.martinez@example.com', 22),
('Ana', 'Hernandez', 'ana.hernandez@example.com', 35),
('Miguel', 'Perez', 'miguel.perez@example.com', 28),
('Sofia', 'Garcia', 'sofia.garcia@example.com', 26),
('Javier', 'Diaz', 'javier.diaz@example.com', 31),
('Luis', 'Sanchez', 'luis.sanchez@example.com', 27),
('Elena', 'Moreno', 'elena.moreno@example.com', 29),
('Daniel', 'Romero', 'daniel.romero@example.com', 33),
('Paula', 'Torres', 'paula.torres@example.com', 24),
('Alejandro', 'Ruiz', 'alejandro.ruiz@example.com', 28),
('Carmen', 'Vega', 'carmen.vega@example.com', 29),
('Adrian', 'Molina', 'adrian.molina@example.com', 34),
('Isabel', 'Gutierrez', 'isabel.gutierrez@example.com', 26),
('Hector', 'Ortega', 'hector.ortega@example.com', 30),
('Raquel', 'Serrano', 'raquel.serrano@example.com', 32),
('Alberto', 'Reyes', 'alberto.reyes@example.com', 28) ;

CREATE TABLE roles (
    id_rol INT PRIMARY KEY AUTO_INCREMENT,
    nombre_rol VARCHAR(50) NOT NULL
);

INSERT INTO roles (nombre_rol) VALUES
('Bronce'),
('Plata'),
('Oro'),
('Platino');

ALTER TABLE usuarios ADD id_rol INT;
UPDATE usuarios SET id_rol = 1 WHERE id_usuario <= 5; 
ALTER TABLE usuarios ADD FOREIGN KEY (id_rol) REFERENCES roles(id_rol);

SELECT u.id_usuario, u.nombre, u.apellido, u.email, u.edad, r.nombre_rol FROM usuarios u JOIN roles r ON u.id_rol = r.id_rol;

select * from usuarios;

CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(100) NOT NULL
);

INSERT INTO categorias (nombre_categoria) VALUES
('Electrónicos'),
('Ropa y Accesorios'),
('Libros'),
('Hogar y Cocina'),
('Deportes y aire libre'),
('Salud y cuidado personal'),
('Herramientas y mejoras para el hogar'),
('Juguetes y juegos'),
('Automotriz'),
('Música y Películas');

ALTER TABLE usuarios ADD id_categoria INT;

UPDATE usuarios SET id_categoria = 1 WHERE id_usuario IN (1, 5, 9, 7, 13);
UPDATE usuarios SET id_categoria = 2 WHERE id_usuario IN (2, 6, 10, 17, 1);

SELECT u.id_usuario, u.nombre, u.apellido, u.email, u.edad, r.nombre_rol, c.nombre_categoria
FROM usuarios u
JOIN roles r ON u.id_rol = r.id_rol
JOIN categorias c ON u.id_categoria = c.id_categoria;

CREATE TABLE usuarios_categorias (
    id_usuario_categoria INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_categoria INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

INSERT INTO usuarios_categorias (id_usuario, id_categoria) VALUES
(1, 1), (1, 2), (1, 3), 
(2, 4), (2, 5),         
(3, 6), (3, 7);          

SELECT u.id_usuario, u.nombre, u.apellido, u.email, u.edad, r.nombre_rol, c.nombre_categoria
FROM usuarios u
JOIN roles r ON u.id_rol = r.id_rol
JOIN usuarios_categorias uc ON u.id_usuario = uc.id_usuario
JOIN categorias c ON uc.id_categoria = c.id_categoria;



SELECT 
  usuarios.id_usuario,
  usuarios.nombre,
  usuarios.apellido,
  usuarios.email,
  usuarios.edad,
  roles.nombre_rol
FROM usuarios
JOIN roles ON usuarios.id_rol = roles.id_rol;

SELECT 
  usuarios.id_usuario,
  usuarios.nombre,
  usuarios.apellido,
  usuarios.email,
  usuarios.edad,
  roles.nombre_rol,
  categorias.nombre_categoria
FROM usuarios
JOIN roles ON usuarios.id_rol = roles.id_rol
JOIN categorias ON usuarios.id_categoria = categorias.id_categoria;



SELECT id_usuario, nombre, id_rol, id_categoria FROM usuarios;

UPDATE usuarios SET id_rol = 1 WHERE id_usuario IN (1, 2, 3, 4, 5);
UPDATE usuarios SET id_rol = 2 WHERE id_usuario IN (6, 7, 8, 9, 10);
UPDATE usuarios SET id_rol = 3 WHERE id_usuario IN (11, 12, 13, 14, 15);
UPDATE usuarios SET id_rol = 4 WHERE id_usuario IN (16, 17, 18, 19, 20);

UPDATE usuarios SET id_categoria = 1 WHERE id_usuario IN (1, 5, 9, 13, 17);
UPDATE usuarios SET id_categoria = 2 WHERE id_usuario IN (2, 6, 10);
UPDATE usuarios SET id_categoria = 3 WHERE id_usuario IN (3, 7, 11);



SELECT 
  usuarios.id_usuario,
  usuarios.nombre,
  usuarios.apellido,
  usuarios.email,
  usuarios.edad,
  roles.nombre_rol,
  categorias.nombre_categoria
FROM usuarios
JOIN roles ON usuarios.id_rol = roles.id_rol
JOIN categorias ON usuarios.id_categoria = categorias.id_categoria;

  







