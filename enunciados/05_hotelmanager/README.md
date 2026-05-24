# Caso 5 – HotelManager (Sistema de Gestión Hotelera)

## Descripción del problema

HotelManager administra su información en Excel. El área de recepción registra **huéspedes** (nombre, apellido, teléfono, correo). El área de habitaciones gestiona **habitaciones** (número, tipo, precio por noche). El área de reservas controla **reservas** (check-in, check-out, huésped, habitación). El área de consumo registra **consumos del hotel** (descripción, monto, reserva asociada) y **servicios extra** (nombre, reserva). El área de caja lleva **pagos del hotel** (monto, fecha, reserva).

Problemas: huéspedes duplicados, fechas de check-in/out inconsistentes, consumos sin reserva asociada, pagos sin reserva vinculada.

## Tablas requeridas

| Tabla | Propósito |
|-------|-----------|
| huespedes | Datos personales de huéspedes |
| habitaciones | Registro de habitaciones |
| tipos_habitacion | Tipos y capacidades |
| reservas | Vincula huésped con habitación |
| consumos_hotel | Gastos en restaurante/bar |
| servicios_extra | Servicios adicionales |
| pagos_hotel | Pagos por reserva |

## Consultas (20)

1. Listar todos los huéspedes
2. Mostrar reservas por tipo de habitación
3. Mostrar pagos ordenados por fecha
4. Buscar huésped por correo
5. Mostrar tipos de habitación únicos
6. Mostrar últimas reservas
7. Mostrar huéspedes y consumos
8. Mostrar habitación por reserva
9. Cantidad de reservas por habitación
10. Ingresos totales del hotel
11. Promedio de pago por reserva
12. Habitación más cara por noche
13. Habitación más barata
14. Huéspedes con más reservas
15. Tipo de habitación más solicitado
16. Reservas sin consumos
17. Habitación con más reservas
18. Mes con mayores ingresos
19. Huéspedes VIP (gasto > promedio*2)
20. Pagos superiores al promedio

## Vistas (4)

- `vista_reservas_por_tipo`
- `vista_ingresos_mensuales_hotel`
- `vista_habitaciones_top`
- `vista_consumos_por_huesped`

## Dataset

`/data/hotel_dirty_data.csv` (~300 registros sucios)
