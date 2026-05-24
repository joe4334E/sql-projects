# Ejemplo Completo — Biblioteca

Sistema de gestión de préstamos de una biblioteca. Ejemplo didáctico de normalización de datos desde un CSV sucio hasta un esquema 3FN.

## Dataset original

`data/biblioteca_dirty_data.csv` — archivo plano con datos mezclados e inconsistentes:

```csv
titulo,autor,categoria,usuario,fecha
Cien años de soledad,Gabriel García Márquez,Ficción,Ana Pérez,2024-01-10
CIEN AÑOS DE SOLEDAD,GABRIEL GARCIA,Ficción,Luis García,2024-01-15
Harry Potter,J.K. Rowling,Fantasía,Ana Pérez,2024-01-20
La casa de los espíritus,Isabel Allende,Ficción,María López,2024-01-25
```

**Problemas:** duplicados, nombres inconsistentes, todo en una sola tabla.

## Solución — 5 tablas normalizadas (3FN)

```
autores (id_autor, nombre)
categorias (id_categoria, nombre)
libros (id_libro, titulo, id_autor, id_categoria)
usuarios (id_usuario, nombre, correo)
prestamos (id_prestamo, fecha, id_usuario, id_libro)
```

El proceso completo de normalización se explica en `../normalizacion_example.md`.

## Archivos SQL

| Archivo | Contenido |
|---------|-----------|
| `sql/01_create_tables.sql` | Creación de BD y tablas con FK |
| `sql/02_inserts.sql` | Inserción de datos limpios |
| `sql/03_consultas.sql` | 20 consultas (JOINs, COUNT, subconsultas, etc.) |
| `sql/04_views.sql` | 4 vistas (libros por categoría, préstamos por usuario, top libros, usuarios activos) |

## Cómo ejecutar

```bash
mysql -u root -p < sql/01_create_tables.sql
mysql -u root -p < sql/02_inserts.sql
mysql -u root -p < sql/03_consultas.sql
mysql -u root -p < sql/04_views.sql
```
