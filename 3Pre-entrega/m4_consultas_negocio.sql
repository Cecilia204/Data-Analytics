SELECT 
    MONTH(fecha_venta) AS mes,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_facturado,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;
SELECT TOP 5
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_generado
FROM ventas
GROUP BY id_producto
ORDER BY total_generado DESC;
SELECT 
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY total_gastado DESC;
WITH totales_mensuales AS (
    SELECT 
        MONTH(fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY MONTH(fecha_venta)
)
SELECT 
    mes,
    total_facturado,
    CASE 
        WHEN total_facturado > (SELECT AVG(total_facturado) FROM totales_mensuales) THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_promedio
FROM totales_mensuales 
ORDER BY mes;

-- Hallazgos:
-- El producto 1 generó el mayor total con solo 3 unidades vendidas, mientras que el producto 2 vendió 13 unidades pero generó bastante menos.
-- El cliente 1 es el más valioso, con 4 pedidos y $3244 gastados.
-- Todos los datos caen en un único mes (marzo 2024), así que la comparación "por encima/por debajo del promedio" no es representativa todavía.
