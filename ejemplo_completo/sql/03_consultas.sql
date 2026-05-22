USE biblioteca;

-- 1. Clientes con sus préstamos
SELECT u.nombre, l.titulo, p.fecha FROM prestamos p JOIN usuarios u ON p.id_usuario = u.id_usuario JOIN libros l ON p.id_libro = l.id_libro;

-- 2. Usuarios con más de 1 préstamo
SELECT u.nombre, COUNT(p.id_prestamo) AS total FROM usuarios u JOIN prestamos p ON u.id_usuario = p.id_usuario GROUP BY u.id_usuario HAVING total > 1;

-- 3. Libros con su autor
SELECT l.titulo, a.nombre AS autor FROM libros l LEFT JOIN autores a ON l.id_autor = a.id_autor;

-- 4. Libros sin préstamos
SELECT l.titulo FROM libros l LEFT JOIN prestamos p ON l.id_libro = p.id_libro WHERE p.id_prestamo IS NULL;

-- 5. Usuarios sin préstamos
SELECT u.nombre FROM usuarios u LEFT JOIN prestamos p ON u.id_usuario = p.id_usuario WHERE p.id_prestamo IS NULL;

-- 6. Libro más prestado
SELECT l.titulo, COUNT(p.id_prestamo) AS veces FROM libros l JOIN prestamos p ON l.id_libro = p.id_libro GROUP BY l.id_libro ORDER BY veces DESC LIMIT 1;

-- 7. Usuario con más préstamos
SELECT u.nombre, COUNT(p.id_prestamo) AS total FROM usuarios u JOIN prestamos p ON u.id_usuario = p.id_usuario GROUP BY u.id_usuario ORDER BY total DESC LIMIT 1;

-- 8. Préstamos por categoría
SELECT c.nombre, COUNT(p.id_prestamo) AS total FROM prestamos p JOIN libros l ON p.id_libro = l.id_libro JOIN categorias c ON l.id_categoria = c.id_categoria GROUP BY c.id_categoria;

-- 9. Autores con más préstamos
SELECT a.nombre, COUNT(p.id_prestamo) AS total FROM prestamos p JOIN libros l ON p.id_libro = l.id_libro JOIN autores a ON l.id_autor = a.id_autor GROUP BY a.id_autor ORDER BY total DESC;

-- 10. Préstamos por mes
SELECT DATE_FORMAT(p.fecha, '%Y-%m') AS mes, COUNT(*) AS total FROM prestamos p GROUP BY mes;

-- 11. Libros prestados a un usuario específico (id=1)
SELECT l.titulo, p.fecha FROM prestamos p JOIN libros l ON p.id_libro = l.id_libro WHERE p.id_usuario = 1;

-- 12. Usuarios que han prestado un libro específico (id=1)
SELECT u.nombre, p.fecha FROM prestamos p JOIN usuarios u ON p.id_usuario = u.id_usuario WHERE p.id_libro = 1;

-- 13. Promedio de préstamos por usuario
SELECT AVG(total) FROM (SELECT COUNT(*) AS total FROM prestamos GROUP BY id_usuario) AS sub;

-- 14. Categorías sin libros
SELECT c.nombre FROM categorias c LEFT JOIN libros l ON c.id_categoria = l.id_categoria WHERE l.id_libro IS NULL;

-- 15. Autores sin libros
SELECT a.nombre FROM autores a LEFT JOIN libros l ON a.id_autor = l.id_autor WHERE l.id_libro IS NULL;

-- 16. Libros y cuántos préstamos tienen
SELECT l.titulo, COUNT(p.id_prestamo) AS total FROM libros l LEFT JOIN prestamos p ON l.id_libro = p.id_libro GROUP BY l.id_libro;

-- 17. Usuarios y cuántos préstamos tienen
SELECT u.nombre, COUNT(p.id_prestamo) AS total FROM usuarios u LEFT JOIN prestamos p ON u.id_usuario = p.id_usuario GROUP BY u.id_usuario;

-- 18. Top 3 libros más prestados
SELECT l.titulo, COUNT(p.id_prestamo) AS veces FROM libros l JOIN prestamos p ON l.id_libro = p.id_libro GROUP BY l.id_libro ORDER BY veces DESC LIMIT 3;

-- 19. Usuarios con préstamos en enero 2024
SELECT DISTINCT u.nombre FROM prestamos p JOIN usuarios u ON p.id_usuario = u.id_usuario WHERE p.fecha BETWEEN '2024-01-01' AND '2024-01-31';

-- 20. Todos los préstamos con nombre de usuario y libro
SELECT u.nombre AS usuario, l.titulo AS libro, p.fecha FROM prestamos p JOIN usuarios u ON p.id_usuario = u.id_usuario JOIN libros l ON p.id_libro = l.id_libro ORDER BY p.fecha DESC;
