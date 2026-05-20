
# Caso 3 – SchoolManager (Sistema de Gestión Escolar)

## Descripción del problema

SchoolManager administra alumnos, profesores, cursos, matrículas, calificaciones, asistencias y pagos en Excel. Problemas: alumnos duplicados, notas inconsistentes ("6.5", "siete", "7,0"), fechas de pago mal formateadas, asistencias incompletas.

## Tablas requeridas

| Tabla | Propósito |
|-------|-----------|
| alumnos | Datos de estudiantes |
| profesores | Información de docentes |
| cursos | Asignaturas y horas semanales |
| matriculas | Vincula alumnos con cursos |
| calificaciones | Registro de notas |
| asistencias | Presencia diaria |
| pagos_colegiatura | Registro de pagos |

## Consultas (20)

1. Listar todos los alumnos
2. Mostrar alumnos por curso
3. Mostrar pagos ordenados por fecha
4. Buscar alumno por apoderado
5. Mostrar cursos únicos
6. Mostrar últimas matrículas
7. Mostrar alumnos y cursos inscritos
8. Mostrar profesor responsable por curso
9. Cantidad de alumnos por curso
10. Ingresos totales por colegiatura
11. Promedio de pagos mensuales
12. Curso con más horas semanales
13. Curso con menos horas
14. Alumnos con más asistencias
15. Curso más solicitado
16. Alumnos sin pagos
17. Profesor con más cursos
18. Mes con mayores ingresos
19. Alumnos becados (pago < promedio)
20. Pagos superiores al promedio

## Vistas (4)

- `vista_alumnos_por_curso`
- `vista_ingresos_mensuales_colegio`
- `vista_cursos_populares`
- `vista_pagos_por_alumno`

## Dataset

`/data/school_dirty_data.csv` (~300 registros sucios)