SELECT
    v.fecha_venta,
    c.nombre         AS nombre_cliente,
    c.segmento,
    t.region,
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    v.cantidad,
    p.precio          AS precio_unitario,
    v.total_venta,
    v.canal
FROM ventas v
INNER JOIN clientes   c   ON v.id_cliente = c.id_cliente
INNER JOIN productos  p   ON v.id_producto = p.id_producto
INNER JOIN categorias cat ON p.id_categoria = cat.id_categoria
INNER JOIN territorio t   ON v.id_territorio = t.id_territorio
ORDER BY v.fecha_venta;

SELECT
    c.nombre,
    c.email,
    c.fecha_registro
FROM clientes c
LEFT JOIN ventas v ON c.id_cliente = v.id_cliente
WHERE v.id_cliente IS NULL;

SELECT
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    p.precio
FROM productos p
INNER JOIN categorias cat ON p.id_categoria = cat.id_categoria
LEFT JOIN ventas v ON p.id_producto = v.id_producto
WHERE v.id_producto IS NULL;

SELECT canal, id_venta, total_venta
FROM ventas
WHERE canal = 'Online'
UNION ALL
SELECT canal, id_venta, total_venta
FROM ventas
WHERE canal = 'Tienda';

SELECT
    canal,
    SUM(total_venta) AS total_por_canal
FROM (
    SELECT canal, total_venta FROM ventas WHERE canal = 'Online'
    UNION ALL
    SELECT canal, total_venta FROM ventas WHERE canal = 'Tienda'
) AS consolidado
GROUP BY canal;

-- Hallazgos:
-- No hay clientes registrados sin compras - > los 3 clientes de la base tienen al menos una venta asociada.
-- No hay productos del catálogo sin movimiento - > los 5 productos registran ventas en el período analizado.
-- El canal Online factura más que el canal Tienda ($3479 vs $2860), a pesar de tener la misma cantidad de operaciones (5 y 5), lo que sugiere un ticket promedio más alto en Online.