# Caso 2 – NightClub (Sistema de Gestión de Discoteca)

## Descripción del problema

NightClub administra clientes, reservas de mesas, consumos, eventos, DJs e ingresos de barra en Excel. Problemas: reservas duplicadas, horarios inconsistentes ("11pm" vs "23:00"), consumos sin reserva asociada, DJs repetidos con nombres diferentes.

## Tablas requeridas

| Tabla | Propósito |
|-------|-----------|
| clientes | Datos de clientes habituales |
| reservas | Registro de reservas de mesas |
| consumos | Productos consumidos por reserva |
| eventos | Eventos especiales con DJs |
| djs | Información de DJs |
| ingresos_barra | Ingresos diarios de barra |

## Consultas (20)

1. Listar todos los clientes
2. Mostrar reservas por evento
3. Mostrar consumos ordenados por monto
4. Buscar cliente por teléfono
5. Mostrar eventos únicos
6. Mostrar últimas reservas
7. Mostrar clientes y sus consumos
8. Mostrar DJ responsable por evento
9. Cantidad de reservas por evento
10. Ingresos totales por barra
11. Promedio de consumo por reserva
12. Evento más caro (costo DJ)
13. Evento más barato
14. Clientes frecuentes (>3 reservas)
15. Mesa más solicitada
16. Reservas sin consumos
17. DJ con más eventos
18. Mes con mayores ingresos totales
19. Clientes VIP (anticipo > promedio)
20. Consumos superiores al promedio

## Vistas (4)

- `vista_reservas_por_evento`
- `vista_ingresos_mensuales_barra`
- `vista_djs_frecuentes`
- `vista_consumos_por_cliente`

## Dataset

`/data/nightclub_dirty_data.csv` (~300 registros sucios)
