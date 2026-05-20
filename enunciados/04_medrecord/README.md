# Caso 4 – MedRecord (Sistema de Gestión Hospitalaria)

## Descripción del problema

MedRecord administra pacientes, médicos, especialidades, citas, diagnósticos, recetas y pagos en Excel. Problemas: pacientes duplicados, fechas de cita inconsistentes, diagnósticos sin cita asociada, recetas incompletas.

## Tablas requeridas

| Tabla | Propósito |
|-------|-----------|
| pacientes | Datos personales y de seguro |
| medicos | Información de médicos |
| especialidades | Especialidades médicas |
| citas | Programación de consultas |
| diagnosticos | Registro de diagnósticos |
| recetas | Prescripciones médicas |
| pagos_consultas | Pagos por consulta |

## Consultas (20)

1. Listar todos los pacientes
2. Mostrar citas por médico
3. Mostrar pagos ordenados por fecha
4. Buscar paciente por seguro
5. Mostrar especialidades únicas
6. Mostrar últimas citas
7. Mostrar pacientes y diagnósticos
8. Mostrar médico responsable por cita
9. Cantidad de citas por médico
10. Ingresos totales por consultas
11. Promedio de pago por consulta
12. Especialidad más cara (promedio)
13. Especialidad más barata
14. Pacientes con más citas
15. Especialidad más solicitada
16. Pacientes sin citas
17. Médico con más citas
18. Mes con mayores ingresos
19. Pacientes con seguro premium
20. Pagos superiores al promedio

## Vistas (4)

- `vista_citas_por_especialidad`
- `vista_ingresos_mensuales_hospital`
- `vista_medicos_top`
- `vista_pagos_por_paciente`

## Dataset

`/data/hospital_dirty_data.csv` (~300 registros sucios)
