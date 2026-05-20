# Caso 1 – GymFit (Sistema de Gestión de Gimnasio)

## Descripción del problema

GymFit es un gimnasio privado que administra su información en Excel. El área de recepción maneja clientes (nombre, apellido, correo, teléfono). El área de entrenadores tiene instructores y especialidades. El área de ventas gestiona planes de membresía (nombre, precio, duración). El área de actividades controla clases grupales (nombre, horario, entrenador). El área de caja registra pagos (monto, fecha, cliente). El área de inscripciones anota qué cliente se inscribe en qué clase y con qué plan.

**Problemas:** clientes duplicados ("Juan Perez" vs "JUAN PEREZ"), planes inconsistentes ("Premium" vs "premium"), fechas incorrectas, teléfonos vacíos, pagos mal formateados ("Bs 200" vs "200 Bs").

## Tablas requeridas

| Tabla | Propósito |
|-------|-----------|
| clientes | Datos personales de los miembros |
| entrenadores | Información de instructores |
| planes | Membresías disponibles |
| clases | Actividades grupales y horarios |
| inscripciones | Vincula clientes con clases y planes |
| pagos | Registro de transacciones económicas |

## Consultas (20)

1. Listar todos los clientes
2. Mostrar clientes por plan
3. Mostrar pagos ordenados por fecha
4. Buscar clientes por nombre
5. Mostrar planes únicos
6. Mostrar últimas inscripciones
7. Mostrar clientes y clases inscritas
8. Mostrar entrenador responsable por clase
9. Cantidad de clientes por clase
10. Ingresos totales
11. Promedio de pagos
12. Plan más caro
13. Plan más barato
14. Clientes frecuentes (>2 inscripciones)
15. Clase más solicitada
16. Clientes sin pagos
17. Entrenador con más clases
18. Mes con mayores ingresos
19. Clientes premium (plan > promedio)
20. Pagos superiores al promedio

## Vistas (4)

- `vista_clientes_por_plan`
- `vista_ingresos_mensuales`
- `vista_clases_frecuentes`
- `vista_pagos_clientes`

## Dataset

`/data/gymfit_dirty_data.csv` (~300 registros sucios)

## Entregables

- `01_create_tables.sql`
- `02_inserts.sql`
- `03_consultas.sql`
- `04_views.sql`
- `README.md` con capturas
- 
