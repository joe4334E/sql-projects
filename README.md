
# 🗄️ SQL Projects - Casos de Estudio

Bienvenido. Aquí tienes 5 casos de estudio para practicar diseño de bases de datos relacionales, limpieza de datos, consultas SQL y vistas.

Cada caso simula un negocio real que usa Excel de forma desordenada y necesita migrar a SQL.

---

## 📚 Cómo usar

1. Ve a la carpeta `/enunciados/` y elige un caso
2. Lee el README del caso para entender el problema
3. Descarga el CSV sucio desde `/data/`
4. Realiza las normalizaciones dentro de tu data desde el ordenamiento a 1FN hasta 3FN
5. Diseña tu BD: tablas, PK, FK, restricciones
6. Escribe los scripts SQL
7. Prueba tus consultas
8. Sube tu solución a GitHub con capturas

---

## 📂 Casos disponibles

| # | Caso | Dominio | CSV |
|---|------|---------|-----|
| 1 | GymFit | Gimnasio | `gymfit_dirty_data.csv` |
| 2 | NightClub | Discoteca | `nightclub_dirty_data.csv` |
| 3 | SchoolManager | Colegio | `school_dirty_data.csv` |
| 4 | MedRecord | Hospital | `hospital_dirty_data.csv` |
| 5 | HotelManager | Hotel | `hotel_dirty_data.csv` |

Cada CSV tiene ~200 registros con errores: duplicados, fechas mal escritas, mayúsculas mezcladas, campos vacíos.

---

## ✅ Ejemplo resuelto

Revisa `/ejemplo_completo/` para ver un caso de Biblioteca ya resuelto con:

- 5 tablas
- 20 consultas
- 4 vistas

Úsalo como guía.

---

## 📤 Estructura de tu solución

```bash
tu-repositorio/
├── README.md
├── data/
│   └── (tu CSV)
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_inserts.sql
│   ├── 03_consultas.sql
│   └── 04_views.sql
└── docs/capturas/
    └── (imágenes de resultados)
```

---

## ⚠️ Restricciones

| ❌ No | ✅ Sí |
|-------|------|
| Una sola tabla | Tablas relacionadas |
| Omitir FOREIGN KEY | Definir PK y FK |
| Solo SELECT * | Columnas específicas |
| Consultas incompletas | 20 consultas + 4 vistas |

---

## 🧠 Qué vas a practicar

- Diseño relacional
- Limpieza de datos
- JOIN, GROUP BY, subconsultas
- Vistas
- Documentación en GitHub

---

## 📌 Notas

- Usa MySQL
- Las capturas deben mostrar resultados claros
- No hay única solución correcta, pero sí requisitos mínimos

---

¡Éxito! 🚀

