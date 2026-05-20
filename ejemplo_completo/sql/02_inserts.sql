USE biblioteca;

INSERT INTO autores VALUES (1, 'Gabriel García Márquez'), (2, 'Isabel Allende'), (3, 'J.K. Rowling');
INSERT INTO categorias VALUES (1, 'Ficción'), (2, 'Fantasía'), (3, 'Romance');
INSERT INTO libros VALUES (1, 'Cien años de soledad', 1, 1), (2, 'Harry Potter', 3, 2), (3, 'La casa de los espíritus', 2, 1);
INSERT INTO usuarios VALUES (1, 'Ana Pérez', 'ana@mail.com'), (2, 'Luis García', 'luis@mail.com'), (3, 'María López', 'maria@mail.com');
INSERT INTO prestamos VALUES (1, '2024-01-10', 1, 1), (2, '2024-01-15', 2, 2), (3, '2024-01-20', 1, 2), (4, '2024-01-25', 3, 1);
