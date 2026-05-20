USE biblioteca;

CREATE VIEW vista_libros_x_categoria AS
SELECT c.nombre AS categoria, COUNT(l.id_libro) AS total_libros
FROM categorias c LEFT JOIN libros l ON c.id_categoria = l.id_categoria
GROUP BY c.id_categoria;

CREATE VIEW vista_prestamos_x_usuario AS
SELECT u.nombre, COUNT(p.id_prestamo) AS total_prestamos
FROM usuarios u LEFT JOIN prestamos p ON u.id_usuario = p.id_usuario
GROUP BY u.id_usuario;

CREATE VIEW vista_top_libros AS
SELECT l.titulo, COUNT(p.id_prestamo) AS veces_prestado
FROM libros l JOIN prestamos p ON l.id_libro = p.id_libro
GROUP BY l.id_libro ORDER BY veces_prestado DESC LIMIT 3;

CREATE VIEW vista_usuarios_activos AS
SELECT u.nombre, COUNT(p.id_prestamo) AS total
FROM usuarios u JOIN prestamos p ON u.id_usuario = p.id_usuario
GROUP BY u.id_usuario HAVING total > 1;
