-- 1. DROP TABLES 
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS territorio;
DROP TABLE IF EXISTS clientes;

-- 2. CREATE TABLES 

CREATE TABLE categorias (
    id_categoria     INT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL,
    descripcion      VARCHAR(200)
);

CREATE TABLE territorio (
    id_territorio INT PRIMARY KEY,
    region        VARCHAR(50),
    pais          VARCHAR(50) NOT NULL,
    zona          VARCHAR(50)
);

CREATE TABLE clientes (
    id_cliente     INT PRIMARY KEY,
    nombre         VARCHAR(100) NOT NULL,
    email          VARCHAR(100) UNIQUE,
    ciudad         VARCHAR(50),
    segmento       VARCHAR(50),
    fecha_registro DATE NOT NULL
);

CREATE TABLE productos (
    id_producto     INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    id_categoria    INT NOT NULL,
    subcategoria    VARCHAR(50),
    precio          DECIMAL(10,2) NOT NULL CHECK (precio > 0),
    costo           DECIMAL(10,2) CHECK (costo > 0),
    CONSTRAINT fk_producto_categoria FOREIGN KEY (id_categoria)
        REFERENCES categorias(id_categoria)
);

CREATE TABLE ventas (
    id_venta      INT PRIMARY KEY,
    fecha_venta   DATE NOT NULL,
    id_cliente    INT NOT NULL,
    id_producto   INT NOT NULL,
    id_territorio INT NOT NULL,
    cantidad      INT NOT NULL CHECK (cantidad > 0),
    total_venta   DECIMAL(10,2) NOT NULL CHECK (total_venta > 0),
    canal         VARCHAR(30),
    CONSTRAINT fk_venta_cliente FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),
    CONSTRAINT fk_venta_producto FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto),
    CONSTRAINT fk_venta_territorio FOREIGN KEY (id_territorio)
        REFERENCES territorio(id_territorio)
);

-- Categorías (3)
INSERT INTO categorias VALUES (1, 'Computación', 'Laptops, PCs y monitores');
INSERT INTO categorias VALUES (2, 'Accesorios', 'Periféricos y complementos');
INSERT INTO categorias VALUES (3, 'Audio', 'Auriculares y parlantes');

-- Territorio (3)
INSERT INTO territorio VALUES (1, 'AMBA', 'Argentina', 'Este');
INSERT INTO territorio VALUES (2, 'Centro', 'Argentina', 'Centro');
INSERT INTO territorio VALUES (3, 'Cuyo', 'Argentina', 'Oeste');

-- Clientes (3)
INSERT INTO clientes VALUES (1, 'María López', 'maria@mail.com', 'Buenos Aires', 'Retail', '2024-01-05');
INSERT INTO clientes VALUES (2, 'Carlos Ruiz', 'carlos@mail.com', 'Córdoba', 'Corporativo', '2024-01-10');
INSERT INTO clientes VALUES (3, 'Ana Gómez', 'ana@mail.com', 'Mendoza', 'Retail', '2024-02-01');

-- Productos (5)
INSERT INTO productos VALUES (1, 'Laptop Pro 15', 1, 'Notebooks', 1200.00, 900.00);
INSERT INTO productos VALUES (2, 'Mouse Inalámbrico', 2, 'Periféricos', 28.00, 15.00);
INSERT INTO productos VALUES (3, 'Monitor 4K 27"', 1, 'Monitores', 450.00, 320.00);
INSERT INTO productos VALUES (4, 'Auriculares BT Pro', 3, 'Auriculares', 120.00, 70.00);
INSERT INTO productos VALUES (5, 'Teclado Mecánico', 2, 'Periféricos', 95.00, 55.00);

-- Ventas (10)
INSERT INTO ventas VALUES (1,  '2024-03-05', 1, 1, 1, 2, 2400.00, 'Online');
INSERT INTO ventas VALUES (2,  '2024-03-06', 2, 2, 2, 5,  140.00, 'Tienda');
INSERT INTO ventas VALUES (3,  '2024-03-07', 3, 3, 3, 1,  450.00, 'Online');
INSERT INTO ventas VALUES (4,  '2024-03-08', 1, 4, 1, 2,  240.00, 'Tienda');
INSERT INTO ventas VALUES (5,  '2024-03-10', 2, 5, 2, 3,  285.00, 'Online');
INSERT INTO ventas VALUES (6,  '2024-03-11', 3, 1, 3, 1, 1200.00, 'Tienda');
INSERT INTO ventas VALUES (7,  '2024-03-12', 1, 2, 1, 8,  224.00, 'Online');
INSERT INTO ventas VALUES (8,  '2024-03-13', 2, 3, 2, 2,  900.00, 'Tienda');
INSERT INTO ventas VALUES (9,  '2024-03-14', 3, 4, 3, 1,  120.00, 'Online');
INSERT INTO ventas VALUES (10, '2024-03-15', 1, 5, 1, 4,  380.00, 'Tienda');

-- 4. VALIDACIÓN
 SELECT * FROM categorias;
 SELECT * FROM territorio;
 SELECT * FROM clientes;
 SELECT * FROM productos;
 SELECT * FROM ventas;
