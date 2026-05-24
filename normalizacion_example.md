# Guía de Normalización de Datos (CSV → 3FN)

Basado en: `ejemplo_completo/data/biblioteca_dirty_data.csv`

---

## El CSV original (1 archivo, todo mezclado)

```csv
titulo,autor,categoria,usuario,fecha
Cien años de soledad,Gabriel García Márquez,Ficción,Ana Pérez,2024-01-10
CIEN AÑOS DE SOLEDAD,GABRIEL GARCIA,Ficción,Luis García,2024-01-15
Harry Potter,J.K. Rowling,Fantasía,Ana Pérez,2024-01-20
La casa de los espíritus,Isabel Allende,Ficción,María López,2024-01-25
```

**Problemas:**
- Todo en una sola tabla (libros + autores + categorías + usuarios + préstamos mezclados)
- Duplicados: "Cien años de soledad" aparece 2 veces con escritura distinta
- Nombres inconsistentes: "Gabriel García Márquez" vs "GABRIEL GARCIA"
- Información repetida como texto plano: "Ana Pérez" se repite sin usar IDs

---

## Paso 1 — Primera Forma Normal (1FN)

Reglas: celdas atómicas, sin grupos repetitivos, PK definida.

El CSV ya cumple 1FN (todo es atómico). Solo limpiamos duplicados y agregamos `id`:

```csv
id,titulo,autor,categoria,usuario,fecha
1,Cien años de soledad,Gabriel García Márquez,Ficción,Ana Pérez,2024-01-10
2,Harry Potter,J.K. Rowling,Fantasía,Ana Pérez,2024-01-20
3,La casa de los espíritus,Isabel Allende,Ficción,María López,2024-01-25
```

Fila 2 original descartada por duplicado.

---

## Paso 2 — Segunda Forma Normal (2FN)

Regla: 1FN + ningún atributo depende de **parte** de la clave.

`autor` y `categoria` dependen solo del **libro**, no del préstamo. Se separa en 2 archivos:

```csv
# libros.csv
id,titulo,autor,categoria
1,Cien años de soledad,Gabriel García Márquez,Ficción
2,Harry Potter,J.K. Rowling,Fantasía
3,La casa de los espíritus,Isabel Allende,Ficción
```

```csv
# prestamos.csv
id,id_libro,usuario,fecha
1,1,Ana Pérez,2024-01-10
2,2,Ana Pérez,2024-01-20
3,3,María López,2024-01-25
```

---

## Paso 3 — Tercera Forma Normal (3FN)

Regla: 2FN + ningún atributo no clave depende de otro atributo no clave.

`autor` y `categoria` son entidades propias. Se separan en 5 archivos:

```csv
# autores.csv
id_autor,nombre
1,Gabriel García Márquez
2,J.K. Rowling
3,Isabel Allende
```

```csv
# categorias.csv
id_categoria,nombre
1,Ficción
2,Fantasía
```

```csv
# libros.csv
id_libro,titulo,id_autor,id_categoria
1,Cien años de soledad,1,1
2,Harry Potter,2,2
3,La casa de los espíritus,3,1
```

```csv
# usuarios.csv
id_usuario,nombre
1,Ana Pérez
2,Luis García
3,María López
```

```csv
# prestamos.csv
id_prestamo,id_libro,id_usuario,fecha
1,1,1,2024-01-10
2,2,1,2024-01-20
3,3,3,2024-01-25
```

---

## Resumen visual

```
        1 archivo original (todo junto)
                │
          ┌─────┴─────┐
          │    1FN    │
          └─────┬─────┘
                │
          ┌─────┴─────┐
          │    2FN    │  → 2 archivos: libros.csv + prestamos.csv
          └─────┬─────┘
                │
          ┌─────┴─────┐
          │    3FN    │  → 5 archivos: autores.csv + categorias.csv
          └─────┬─────┘    + libros.csv + usuarios.csv + prestamos.csv
                ▼
        5 archivos CSV normalizados
```

## SQL final

```sql
CREATE TABLE autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL UNIQUE,
    id_autor INT NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE prestamos (
    id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
    id_libro INT NOT NULL,
    id_usuario INT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_libro) REFERENCES libros(id_libro),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

INSERT INTO autores (nombre) VALUES
('Gabriel García Márquez'), ('J.K. Rowling'), ('Isabel Allende');

INSERT INTO categorias (nombre) VALUES ('Ficción'), ('Fantasía');

INSERT INTO libros (titulo, id_autor, id_categoria) VALUES
('Cien años de soledad', 1, 1),
('Harry Potter', 2, 2),
('La casa de los espíritus', 3, 1);

INSERT INTO usuarios (nombre) VALUES
('Ana Pérez'), ('Luis García'), ('María López');

INSERT INTO prestamos (id_libro, id_usuario, fecha) VALUES
(1, 1, '2024-01-10'),
(2, 1, '2024-01-20'),
(3, 3, '2024-01-25');
```
