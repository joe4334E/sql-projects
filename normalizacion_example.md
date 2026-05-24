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
RAYUELA,JULIO CORTAZAR,ficcion,Carlos Ruiz,2024-02-01
Rayuela,Julio Cortázar,Ficción,Sofía Méndez,2024-02-05
La ciudad y los perros,Mario Vargas Llosa,Ficción,Pedro Díaz,2024-02-10
LA CIUDAD Y LOS PERROS,MARIO VARGAS,FICCION,Carlos Ruiz,2024-02-15
Como agua para chocolate,Laura Esquivel,Romance,Ana Pérez,2024-02-20
COMO AGUA PARA CHOCOLATE,LAURA ESQUIVEL,ROMANCE,María López,2024-02-25
Cien años de soledad,Gabriel Garcia Marquez,Ficción,Pedro Díaz,2024-03-01
1984,George Orwell,Ciencia Ficción,Luis García,2024-03-05
1984,GEORGE ORWELL,CIENCIA FICCION,Sofía Méndez,2024-03-10
Harry Potter,JK Rowling,FANTASIA,Pedro Díaz,2024-03-15
El nombre de la rosa,Umberto Eco,Ficción,Ana Pérez,2024-03-20
EL NOMBRE DE LA ROSA,UMBERTO ECO,FICCION,Carlos Ruiz,2024-03-25
Crónica de una muerte anunciada,Gabriel García Márquez,Ficción,María López,2024-04-01
CRONICA DE UNA MUERTE ANUNCIADA,GABRIEL GARCIA,FICCION,Luis García,2024-04-05
Harry Potter and the Philosopher's Stone,J.K. Rowling,Fantasía,Sofía Méndez,2024-04-10
Rayuela,Julio Cortazar,ficcion,Ana Pérez,2024-04-15
Cien años de soledad,Gabriel García Márquez,Ficción,,2024-04-20
La casa de los espíritus,Isabel Allende,Ficción,Carlos Ruiz,15/04/2024
Como agua para chocolate,Laura Esquivel,Romance,Pedro Díaz,2024/05/01
El nombre de la rosa,Umberto Eco,Historia,María López,05-05-2024
La ciudad y los perros,Vargas Llosa,Ficción,Ana Pérez,2024.05.10
1984,George Orwell,SciFi,Luis García,2024-05-15
Rayuela,Julio Cortázar,Novela,Sofía Méndez,2024-05-20
Harry Potter,J.K. Rowling,Fantasía,Carlos Ruiz,2024-06-01
```

**28 registros, 5 columnas, muchísimos problemas.**

---

## Análisis de problemas en el CSV

| Tipo de problema | Ejemplos |
|----------------|----------|
| **Mayúsculas inconsistentes** | `Cien años de soledad` vs `CIEN AÑOS DE SOLEDAD` |
| **Nombres incompletos** | `Gabriel García Márquez` vs `GABRIEL GARCIA` vs `Gabriel Garcia Marquez` |
| **Títulos duplicados** | `Harry Potter` aparece 3 veces, `Rayuela` 4 veces |
| **Categorías distintas para el mismo libro** | `El nombre de la rosa` como `Ficción` e `Historia` |
| **Fechas en 4 formatos distintos** | `2024-01-10`, `15/04/2024`, `2024/05/01`, `05-05-2024`, `2024.05.10` |
| **Valores vacíos** | Fila 21 sin usuario |
| **Sin acentos** | `Julio Cortazar` vs `Julio Cortázar`, `Gabriel Garcia Marquez` |
| **Categorías inventadas** | `SciFi`, `Novela`, `ficcion` (minúscula) |

---

## Paso 1 — Primera Forma Normal (1FN)

**Regla:** cada celda atómica, sin grupos repetitivos, con PK.

El CSV ya es atómico. El trabajo aquí es **limpiar y detectar duplicados**.

### 1a. Estandarizar datos

Se normalizan mayúsculas/minúsculas, acentos y formatos:

```csv
id,titulo,autor,categoria,usuario,fecha
1,Cien años de soledad,Gabriel García Márquez,Ficción,Ana Pérez,2024-01-10
2,Cien años de soledad,Gabriel García Márquez,Ficción,Luis García,2024-01-15        ← duplicado del 1
3,Harry Potter,J.K. Rowling,Fantasía,Ana Pérez,2024-01-20
4,La casa de los espíritus,Isabel Allende,Ficción,María López,2024-01-25
5,Rayuela,Julio Cortázar,Ficción,Carlos Ruiz,2024-02-01
6,Rayuela,Julio Cortázar,Ficción,Sofía Méndez,2024-02-05                           ← mismo libro, distinto usuario
7,La ciudad y los perros,Mario Vargas Llosa,Ficción,Pedro Díaz,2024-02-10
8,La ciudad y los perros,Mario Vargas Llosa,Ficción,Carlos Ruiz,2024-02-15           ← mismo libro, distinto usuario
9,Como agua para chocolate,Laura Esquivel,Romance,Ana Pérez,2024-02-20
10,Como agua para chocolate,Laura Esquivel,Romance,María López,2024-02-25            ← mismo libro, distinto usuario
11,Cien años de soledad,Gabriel García Márquez,Ficción,Pedro Díaz,2024-03-01         ← mismo libro que 1 y 2
12,1984,George Orwell,Ciencia Ficción,Luis García,2024-03-05
13,1984,George Orwell,Ciencia Ficción,Sofía Méndez,2024-03-10
14,Harry Potter,J.K. Rowling,Fantasía,Pedro Díaz,2024-03-15
15,El nombre de la rosa,Umberto Eco,Ficción,Ana Pérez,2024-03-20
16,El nombre de la rosa,Umberto Eco,Ficción,Carlos Ruiz,2024-03-25
17,Crónica de una muerte anunciada,Gabriel García Márquez,Ficción,María López,2024-04-01
18,Crónica de una muerte anunciada,Gabriel García Márquez,Ficción,Luis García,2024-04-05
19,Harry Potter,J.K. Rowling,Fantasía,Sofía Méndez,2024-04-10
20,Rayuela,Julio Cortázar,Ficción,Ana Pérez,2024-04-15
21,Cien años de soledad,Gabriel García Márquez,Ficción,,2024-04-20                  ← sin usuario
22,La casa de los espíritus,Isabel Allende,Ficción,Carlos Ruiz,2024-04-15
23,Como agua para chocolate,Laura Esquivel,Romance,Pedro Díaz,2024-05-01
24,El nombre de la rosa,Umberto Eco,Historia,María López,2024-05-05                 ← categoría distinta a fila 15-16
25,La ciudad y los perros,Mario Vargas Llosa,Ficción,Ana Pérez,2024-05-10
26,1984,George Orwell,Ciencia Ficción,Luis García,2024-05-15
27,Rayuela,Julio Cortázar,Ficción,Sofía Méndez,2024-05-20
28,Harry Potter,J.K. Rowling,Fantasía,Carlos Ruiz,2024-06-01
```

Marcas en esta tabla estandarizada:
- **Rojas (duplicados de libro + usuario):** filas 2, 11 → mismo libro y usuario que fila 1
- **Naranja (sin usuario):** fila 21
- **Verde (mismo libro, distinto usuario):** pares como 3-14-19-28, 5-6-20-27, etc.

### 1b. Eliminar duplicados exactos (mismo libro + mismo usuario + misma fecha)

| Descartado | Razón |
|------------|-------|
| Fila 2 | Mismo libro que 1, préstamo de Luis García (válido como préstamo distinto, distinta fecha) |

En realidad, revisando: fila 1 es Ana Pérez, fila 2 es Luis García. Son préstamos distintos del mismo libro. **No se descartan**. Solo si el libro + usuario + fecha son idénticos se descartan.

El único problema real de 1FN es que no hay PK. Agregamos `id` a cada fila.

### 1c. Normalizar fechas a ISO (YYYY-MM-DD)

| Fecha original | Formato | Convertida |
|---------------|---------|------------|
| `2024-01-10` | ISO | `2024-01-10` ✅ |
| `15/04/2024` | DD/MM/YYYY | `2024-04-15` |
| `2024/05/01` | YYYY/MM/DD | `2024-05-01` |
| `05-05-2024` | DD-MM-YYYY | `2024-05-05` |
| `2024.05.10` | YYYY.MM.DD | `2024-05-10` |

### 1e. Limpiar categorías

| Original | Normalizada |
|----------|------------|
| `ficcion`, `FICCION`, `Ficción` | `Ficción` |
| `FANTASIA`, `fantasía` | `Fantasía` |
| `CIENCIA FICCION`, `SciFi` | `Ciencia Ficción` |
| `Novela` | ¿Es categoría? Se unifica como `Ficción` (es lo más cercano) |

---

## Paso 2 — Segunda Forma Normal (2FN)

**Regla:** 1FN + ningún atributo no clave depende de **parte** de la clave.

¿Qué depende de qué?

| Dependencia | ¿Correcta? |
|------------|-----------|
| `id → titulo, autor, categoria, usuario, fecha` | ✅ clave completa |
| `titulo → autor` | ❌ el autor solo depende del libro |
| `titulo → categoria` | ❌ la categoría solo depende del libro |

`autor` y `categoria` se repiten cada vez que el mismo libro es prestado. **Deben separarse.**

### Separación: libros vs préstamos

Extraemos los libros únicos (después de unificar duplicados por título normalizado):

```csv
# libros.csv
id,titulo,autor,categoria
1,Cien años de soledad,Gabriel García Márquez,Ficción
2,Harry Potter,J.K. Rowling,Fantasía
3,La casa de los espíritus,Isabel Allende,Ficción
4,Rayuela,Julio Cortázar,Ficción
5,La ciudad y los perros,Mario Vargas Llosa,Ficción
6,Como agua para chocolate,Laura Esquivel,Romance
7,1984,George Orwell,Ciencia Ficción
8,El nombre de la rosa,Umberto Eco,Ficción
9,Crónica de una muerte anunciada,Gabriel García Márquez,Ficción
```

Cada libro aparece **una sola vez**. Los datos del libro no se repiten por cada préstamo.

Ahora los préstamos referencian al libro por `id_libro`:

```csv
# prestamos.csv
id,id_libro,usuario,fecha
1,1,Ana Pérez,2024-01-10
2,1,Luis García,2024-01-15
3,2,Ana Pérez,2024-01-20
4,3,María López,2024-01-25
5,4,Carlos Ruiz,2024-02-01
6,4,Sofía Méndez,2024-02-05
7,5,Pedro Díaz,2024-02-10
8,5,Carlos Ruiz,2024-02-15
9,6,Ana Pérez,2024-02-20
10,6,María López,2024-02-25
11,1,Pedro Díaz,2024-03-01
12,7,Luis García,2024-03-05
13,7,Sofía Méndez,2024-03-10
14,2,Pedro Díaz,2024-03-15
15,8,Ana Pérez,2024-03-20
16,8,Carlos Ruiz,2024-03-25
17,9,María López,2024-04-01
18,9,Luis García,2024-04-05
19,2,Sofía Méndez,2024-04-10
20,4,Ana Pérez,2024-04-15
21,3,Carlos Ruiz,2024-04-15
22,6,Pedro Díaz,2024-05-01
23,8,María López,2024-05-05
24,5,Ana Pérez,2024-05-10
25,7,Luis García,2024-05-15
26,4,Sofía Méndez,2024-05-20
27,2,Carlos Ruiz,2024-06-01
```

Fila 21 del original (Cien años sin usuario) se descarta porque no se puede hacer un préstamo sin usuario.

Observa cómo ahora `id_libro = 1` (Cien años de soledad) aparece **3 veces** en préstamos sin repetir el autor ni la categoría.

---

## Paso 3 — Tercera Forma Normal (3FN)

**Regla:** 2FN + ningún atributo no clave depende de otro atributo no clave.

En `libros.csv` todavía hay dependencias transitivas:

```
titulo → autor → (nombre del autor es un dato de la entidad autor)
titulo → categoria → (nombre de la categoría es un dato de la entidad categoría)
```

Si Gabriel García Márquez escribe 5 libros, su nombre se repite 5 veces en `libros.csv`. Si se cambia el nombre, hay que cambiarlo en 5 filas.

### Separación final: 5 archivos CSV

Extraemos **autores** como entidad independiente:

```csv
# autores.csv
id_autor,nombre
1,Gabriel García Márquez
2,J.K. Rowling
3,Isabel Allende
4,Julio Cortázar
5,Mario Vargas Llosa
6,Laura Esquivel
7,George Orwell
8,Umberto Eco
```

Extraemos **categorías** como entidad independiente:

```csv
# categorias.csv
id_categoria,nombre
1,Ficción
2,Fantasía
3,Romance
4,Ciencia Ficción
```

**Libros** ahora solo guarda referencias (IDs) a autor y categoría:

```csv
# libros.csv
id_libro,titulo,id_autor,id_categoria
1,Cien años de soledad,1,1
2,Harry Potter,2,2
3,La casa de los espíritus,3,1
4,Rayuela,4,1
5,La ciudad y los perros,5,1
6,Como agua para chocolate,6,3
7,1984,7,4
8,El nombre de la rosa,8,1
9,Crónica de una muerte anunciada,1,1
```

Observa: Gabriel García Márquez es `id_autor = 1` y aparece en los libros 1 y 9 sin repetir su nombre.

Extraemos **usuarios** como entidad independiente:

```csv
# usuarios.csv
id_usuario,nombre
1,Ana Pérez
2,Luis García
3,María López
4,Carlos Ruiz
5,Sofía Méndez
6,Pedro Díaz
```

**Préstamos** ahora referencian libro y usuario por ID:

```csv
# prestamos.csv
id_prestamo,id_libro,id_usuario,fecha
1,1,1,2024-01-10
2,1,2,2024-01-15
3,2,1,2024-01-20
4,3,3,2024-01-25
5,4,4,2024-02-01
6,4,5,2024-02-05
7,5,6,2024-02-10
8,5,4,2024-02-15
9,6,1,2024-02-20
10,6,3,2024-02-25
11,1,6,2024-03-01
12,7,2,2024-03-05
13,7,5,2024-03-10
14,2,6,2024-03-15
15,8,1,2024-03-20
16,8,4,2024-03-25
17,9,3,2024-04-01
18,9,2,2024-04-05
19,2,5,2024-04-10
20,4,1,2024-04-15
21,3,4,2024-04-15
22,6,6,2024-05-01
23,8,3,2024-05-05
24,5,1,2024-05-10
25,7,2,2024-05-15
26,4,5,2024-05-20
27,2,4,2024-06-01
```

---

## Resumen visual del proceso

```
                         biblioteca_dirty_data.csv
                         28 filas, 5 columnas
                               │
                    ┌──────────┴──────────┐
                    │       1FN           │
                    │  • Normalizar        │
                    │    mayúsculas        │
                    │  • Unificar nombres  │
                    │  • Convertir fechas  │
                    │  • Estandarizar      │
                    │    categorías        │
                    │  • Descartar filas   │
                    │    sin usuario       │
                    └──────────┬──────────┘
                               │
                    ┌──────────┴──────────┐
                    │       2FN           │
                    │  Separar lo que     │
                    │  depende del libro  │
                    │  de lo que depende  │
                    │  del préstamo       │
                    │                     │
                    │  ┌──────────────┐   │
                    │  │  libros.csv  │   │  ← 9 libros (sin repetir)
                    │  │  3 columnas  │   │
                    │  └──────────────┘   │
                    │  ┌────────────────┐ │
                    │  │ prestamos.csv  │ │  ← 27 préstamos
                    │  │ 3 columnas     │ │
                    │  └────────────────┘ │
                    └──────────┬──────────┘
                               │
                    ┌──────────┴──────────┐
                    │       3FN           │
                    │  Separar entidades  │
                    │  propias:           │
                    │  • autores          │
                    │  • categorías       │
                    │  • usuarios         │
                    │                     │
                    │  ┌──────────────┐   │
                    │  │ autores.csv  │   │  ← 8 autores
                    │  ├──────────────┤   │
                    │  │ categorias   │   │  ← 4 categorías
                    │  │     .csv     │   │
                    │  ├──────────────┤   │
                    │  │  libros.csv  │   │  ← 9 libros (con FK)
                    │  ├──────────────┤   │
                    │  │ usuarios.csv │   │  ← 6 usuarios
                    │  ├──────────────┤   │
                    │  │ prestamos.csv│   │  ← 27 préstamos (con FK)
                    │  └──────────────┘   │
                    └─────────────────────┘
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
('Gabriel García Márquez'),
('J.K. Rowling'),
('Isabel Allende'),
('Julio Cortázar'),
('Mario Vargas Llosa'),
('Laura Esquivel'),
('George Orwell'),
('Umberto Eco');

INSERT INTO categorias (nombre) VALUES
('Ficción'),
('Fantasía'),
('Romance'),
('Ciencia Ficción');

INSERT INTO libros (titulo, id_autor, id_categoria) VALUES
('Cien años de soledad', 1, 1),
('Harry Potter', 2, 2),
('La casa de los espíritus', 3, 1),
('Rayuela', 4, 1),
('La ciudad y los perros', 5, 1),
('Como agua para chocolate', 6, 3),
('1984', 7, 4),
('El nombre de la rosa', 8, 1),
('Crónica de una muerte anunciada', 1, 1);

INSERT INTO usuarios (nombre) VALUES
('Ana Pérez'),
('Luis García'),
('María López'),
('Carlos Ruiz'),
('Sofía Méndez'),
('Pedro Díaz');

INSERT INTO prestamos (id_libro, id_usuario, fecha) VALUES
(1, 1, '2024-01-10'), (1, 2, '2024-01-15'), (2, 1, '2024-01-20'),
(3, 3, '2024-01-25'), (4, 4, '2024-02-01'), (4, 5, '2024-02-05'),
(5, 6, '2024-02-10'), (5, 4, '2024-02-15'), (6, 1, '2024-02-20'),
(6, 3, '2024-02-25'), (1, 6, '2024-03-01'), (7, 2, '2024-03-05'),
(7, 5, '2024-03-10'), (2, 6, '2024-03-15'), (8, 1, '2024-03-20'),
(8, 4, '2024-03-25'), (9, 3, '2024-04-01'), (9, 2, '2024-04-05'),
(2, 5, '2024-04-10'), (4, 1, '2024-04-15'), (3, 4, '2024-04-15'),
(6, 6, '2024-05-01'), (8, 3, '2024-05-05'), (5, 1, '2024-05-10'),
(7, 2, '2024-05-15'), (4, 5, '2024-05-20'), (2, 4, '2024-06-01');
```
